using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Collections;

namespace BHEDI
{
    /// <summary>
    /// process EDI incomming and outgoing data
    /// </summary>
    public class InOutProcess
    {
        
        /// <summary>
        /// process incomming data
        /// </summary>
        public void processIncommingData()
        {
            // for log
            int tradingNo = -1;
            int tsetNo = -1;
            int rawNo = -1;
            string strCurrentFile = "";

            try
            {
                // get Inbound setting
                ArrayList arrInboundSetting = new ArrayList();
                ArrayList arrHeaderData = new ArrayList();
                ArrayList arrIsDelete = new ArrayList();
                ArrayList arrIsArchive = new ArrayList();
                ArrayList arrIsCreate = new ArrayList();

                // EDITranslator
                EDITranslator edi = new EDITranslator();
                // 997 generate set
                List<EDITranslator.T997Set> lst997 = new List<EDITranslator.T997Set>();
            

                using (var edm = new BHEDI_EDM())
                {

                    // get inbound setting
                    var objTbl = edm.tblInboundOutboundSettings.Where(s => s.InOut == false && !s.SettingName.Equals(Common.CONFIG_DAIDO_PARTNER_LIST)
                        && !s.SettingName.Equals(Common.CONFIG_SIMPLY_CHECKING_ACCOUNT) && !s.SettingName.Equals(Common.CONFIG_SIMPLY_FILE)
                        && !s.SettingName.Equals(Common.CONFIG_SIMPLY_RECEIVABLE_ACCOUNT) && !s.SettingName.Equals(Common.CONFIG_EMAIL) && !s.SettingName.Equals(Common.CONFIG_SEND_SQL_ERROR_EMAIL)
                        && !s.SettingName.Equals(Common.CONFIG_SCP_IN) && !s.SettingName.Equals(Common.CONFIG_SCP_OUT) && !s.SettingName.Equals(Common.CONFIG_SEND_SCP_ERROR_EMAIL)
                        && !s.SettingName.Equals(Common.CONFIG_REQUIRE_ORDER_LEVEL_PARTNER_LIST));
                    foreach (var objRow in objTbl)
                    {
                        arrInboundSetting.Add(objRow);
                    }


                    // get all in comming files
                    if (arrInboundSetting.Count == 0)
                    {
                        if (!Directory.Exists(Common.IN_PATH))
                            Directory.CreateDirectory(Common.IN_PATH);

                        // Transfer one EDI that contain many transaction data to many EDI files that contain one  data only
                        Common.transferOneEDIToManyEDI(Common.IN_PATH);

                        string[] files = Directory.GetFiles(Common.IN_PATH);

                        foreach (string file in files)
                        {
                            EDIHeader header = edi.getEDIHeaderData(file);
                            if (header != null)
                            {
                                arrIsDelete.Add(true);
                                arrIsArchive.Add(true);
                                arrIsCreate.Add(true);
                                arrHeaderData.Add(header);
                            }
                            else if (Common.IS_FOR_DAIDO) // for Daido version process file after 1EDIHQ run, delete and move to new archive folder
                            {
                                // it is not file for process, already processed by 1EDIHQ
                                Common.archiveFile(file);
                                File.Delete(file);
                            }
                        }


                    }

                    else
                    {
                        foreach (tblInboundOutboundSetting row in arrInboundSetting)
                        {

                            if (Directory.Exists(row.Path))
                            {
                                // Transfer one EDI that contain many transaction data to many EDI files that contain one  data only
                                Common.transferOneEDIToManyEDI(row.Path);

                                string[] files = Directory.GetFiles(row.Path);
                                foreach (string file in files)
                                {
                                    EDIHeader header = edi.getEDIHeaderData(file);
                                    if (header != null)
                                    {
                                        arrHeaderData.Add(header);
                                        arrIsDelete.Add(row.IsDelete);
                                        arrIsArchive.Add(row.IsArchive);
                                        arrIsCreate.Add(row.IsCreate);
                                    }
                                    else if (Common.IS_FOR_DAIDO) // for Daido version process file after 1EDIHQ run, delete and move to new archive folder
                                    {
                                        // it is not file for process, already processed by 1EDIHQ
                                        Common.archiveFile(file);
                                        File.Delete(file);
                                    }
                                }
                            }

                        }

                    }

                    // import all file and map data
                    int i = 0;
                    bool isDelete = false;
                    bool isArchive = false;
                    bool isCreate = false;
                    string strCheckStatus = "";

                    foreach (EDIHeader header in arrHeaderData)
                    {

                        // get control flag
                        if (i < arrIsCreate.Count && i < arrIsArchive.Count && i < arrIsDelete.Count)
                        {
                            isDelete = Common.myCBool(arrIsDelete[i]);
                            isArchive = Common.myCBool(arrIsArchive[i]);
                            isCreate = Common.myCBool(arrIsCreate[i]);

                        }
                        else
                        {
                            isDelete = true;
                            isArchive = true;
                            isCreate = true;

                        }

                        strCurrentFile = header.getFileName();

                        // import data
                        edi.importEDIInboundData(header, isDelete, isArchive, isCreate);
                        // check EDI data 
                        strCheckStatus = edi.generalEDICheck(header);
                        
                        // generate 997
                        int intFA = (int)Common.FA_TYPE.DO_NOT;
                       
                        var trading = edi.getTradingByEDIHeader(edm, header);
                        tradingNo = -1;
                        tsetNo = edi.getTSetNo(edm, header.getTSet());
                        rawNo = header.getRawDataNo();

                        if (trading != null)
                        {
                            intFA = Common.myCInt(trading.FunctionalAcknowledgement);
                            tradingNo = trading.TradingPartnerNo;
                        }
                        // if no error, map data to application data
                        if (strCheckStatus.Equals(EDIError.AK901_A) || strCheckStatus.Equals(EDIError.AK901_E) || strCheckStatus.Equals(EDIError.CONTRL_1.ToString())
                            || strCheckStatus.Equals(EDIError.CONTRL_7.ToString()) || strCheckStatus.Equals(EDIError.CONTRL_2.ToString()))
                        {
                            // map data
                            edi.mapEDIDataToApplicationData(header);
                            // Phuong added 9/20/2017 Auto Forward data to trading partner
                            edi.autoForwardData(edm, header);

                            // generate 997 normal
                            if (intFA != (int)Common.FA_TYPE.DO_NOT  && !header.getTSet().Equals("997") && !header.getTSet().Equals("CONTRL"))
                            {
                                EDITranslator.T997Set obj997 = new EDITranslator.T997Set();
                                obj997.header = header;
                                obj997.strCheckStatus = strCheckStatus;
                                obj997.intTradingNo = tradingNo;
                                obj997.intTSetNo = tsetNo;
                                obj997.intGenerateType = intFA;
                                obj997.intErrorCode = 0;
                                lst997.Add(obj997);
                            }
                            

                        }
                        else
                        {
                            
                            // generate 997 error
                            if (intFA != (int)Common.FA_TYPE.DO_NOT && !header.getTSet().Equals("997") && !header.getTSet().Equals("CONTRL"))
                            {
                                EDITranslator.T997Set obj997 = new EDITranslator.T997Set();
                                obj997.header = header;
                                obj997.strCheckStatus = strCheckStatus;
                                obj997.intTradingNo = tradingNo;
                                obj997.intTSetNo = tsetNo;
                                obj997.intGenerateType = intFA;
                                obj997.intErrorCode = EDIError.AK502_506_5;
                                lst997.Add(obj997);
                            }

                        }

                    }

                    // generate 997 & CONTRL
                    generate997CONTROL_general(edm, edi, lst997);

                    // run EDI_SQL_IN.bat to check duplicate EDI data
                    if (Common.IS_FOR_DAIDO)
                        System.Diagnostics.Process.Start(Common.EDI_IN_SQL_DAIDO);
                    else
                        System.Diagnostics.Process.Start(Common.EDI_IN_SQL_BIMODE);

                }
            }
            catch (Exception ex)
            {
                if (tradingNo != -1 && tsetNo != -1 && rawNo != -1)        
                    Common.writeLog(tradingNo, tsetNo, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR, DateTime.Now, rawNo);
                else
                    Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                // 08/07/2017 Phuong added if error delete file
                Common.archiveFile(strCurrentFile);
                File.Delete(strCurrentFile);
            }
        }

        /// <summary>
        /// process incomming data
        /// </summary>
        public void processOutgoingData()
        {
            // for log
            int tradingNo = -1;
            int tsetNo = -1;
            int rawNo = -1;

            try
            {
                
                //11/12/2020 Phuong added for SCP
                ERP_SCP scp = new ERP_SCP();
                scp.import856810();
                

                // get Inbound setting
                ArrayList arrOutboundSetting = new ArrayList();
                ArrayList arrHeaderData = new ArrayList();
                ArrayList arrIsDelete = new ArrayList();
                ArrayList arrIsArchive = new ArrayList();
                ArrayList arrIsCreate = new ArrayList();

                // EDITranslator
                EDITranslator edi = new EDITranslator();

                using (var edm = new BHEDI_EDM())
                {

                    // get Outbound setting
                    var objTbl = edm.tblInboundOutboundSettings.Where(s => s.InOut == true && !s.SettingName.Equals("997") && !s.SettingName.Equals(Common.CONFIG_SCP_OUT));
                    foreach (var objRow in objTbl)
                    {
                        arrOutboundSetting.Add(objRow);
                    }


                    // get all in comming files
                    if (arrOutboundSetting.Count == 0)
                    {
                        if (!Directory.Exists(Common.OUT_PATH))
                            Directory.CreateDirectory(Common.OUT_PATH);

                        // Transfer one XML that contain many shipment data to many XML files that contain one shipment data only
                        Common.transferOneXMLToManyXML(Common.OUT_PATH);

                        string[] files = Directory.GetFiles(Common.OUT_PATH);

                        foreach (string file in files)
                        {
                            XMLHeader header = edi.getXMLHeaderData(file);
                            if (header != null)
                            {
                                arrIsDelete.Add(true);
                                arrIsArchive.Add(true);
                                arrIsCreate.Add(true);
                                arrHeaderData.Add(header);
                            }
                        }


                    }

                    else
                    {
                        foreach (tblInboundOutboundSetting row in arrOutboundSetting)
                        {

                            if (Directory.Exists(row.Path))
                            {

                                // Transfer one XML that contain many shipment data to many XML files that contain one shipment data only
                                Common.transferOneXMLToManyXML(row.Path);

                                string[] files = Directory.GetFiles(row.Path);
                                foreach (string file in files)
                                {
                                    XMLHeader header = edi.getXMLHeaderData(file);
                                    if (header != null)
                                    {
                                        arrHeaderData.Add(header);
                                        arrIsDelete.Add(row.IsDelete);
                                        arrIsArchive.Add(row.IsArchive);
                                        arrIsCreate.Add(row.IsCreate);
                                    }
                                }
                            }

                        }

                    }

                    // import all file and create edi data
                    int i = 0;
                    bool isDelete = false;
                    bool isArchive = false;
                    bool isCreate = false;
                   

                    foreach (XMLHeader header in arrHeaderData)
                    {

                        // get control flag
                        if (i < arrIsCreate.Count && i < arrIsArchive.Count && i < arrIsDelete.Count)
                        {
                            isDelete = Common.myCBool(arrIsDelete[i]);
                            isArchive = Common.myCBool(arrIsArchive[i]);
                            isCreate = Common.myCBool(arrIsCreate[i]);

                        }
                        else
                        {
                            isDelete = true;
                            isArchive = true;
                            isCreate = true;

                        }

                        // import data
                        edi.importXMLOutboundData(header, isDelete, isArchive, isCreate);
                        
                        // output edi 
                        edi.mapXMLDataToEDIData(header);
                        
                    }
                    
                }
            }
            catch (Exception ex)
            {
                if (tradingNo != -1 && tsetNo != -1 && rawNo != -1)
                    Common.writeLog(tradingNo, tsetNo, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR, DateTime.Now, rawNo);
                else
                    Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
            }
        }

        /// <summary>
        /// create 997 generate set
        /// </summary>
        /// <param name="lst997"></param>
        public void generate997CONTROL_general(BHEDI_EDM edm, EDITranslator edi, List<EDITranslator.T997Set> lst997)
        {
            string str997Segment = "";
            string strCheckStatus = "";
            string strFileName = "";
            List<EDITranslator.T997Set> lstTmp = new List<EDITranslator.T997Set>();

            // Out 997 No
            int out997No = -1;
            var qr1 = edm.tblEDITransactionSets.Where(my => my.InOut == true && my.TransactionSetID == "997").FirstOrDefault<tblEDITransactionSet>();
            if (qr1 != null)
                out997No = qr1.TransactionSetNo;

            // Out CONTRL
            int outContrlNo = -1;
            var qr2 = edm.tblEDITransactionSets.Where(my => my.InOut == true && my.TransactionSetID == "CONTRL").FirstOrDefault<tblEDITransactionSet>();
            if (qr2 != null)
                outContrlNo = qr2.TransactionSetNo;

            // get path
            string strPath = "";
            string strPathDefault = "";
            var qr = edm.tblInboundOutboundSettings.Where(my => my.InOut == true && my.SettingName == "997").FirstOrDefault<tblInboundOutboundSetting>();
            if (qr != null)
                strPath = qr.Path;
            else
                strPath = Common.VAN_PATH;
            strPathDefault = strPath;

            // generate by group control
            string strSenderID = "";
            string strReceiverID = "";
            string strGroupNum = "";
            int intReceiveNum = 0;
            int intAcceptNum = 0;

            for (int i = 0; i < lst997.Count; i++)
            {
                if (lst997[i].header.checkIsX12Format()) // X12 format
                {

                    lstTmp.Add(lst997[i]); // using for generate AK2 - AK5

                    intReceiveNum++;

                    // look at next element
                    if (i + 1 < lst997.Count)
                    {
                        strSenderID = lst997[i + 1].header.getSenderID();
                        strReceiverID = lst997[i + 1].header.getReceiverID();
                        strGroupNum = lst997[i + 1].header.getGroupControlNum();

                        if (!strSenderID.Equals(lst997[i].header.getSenderID()) || !strReceiverID.Equals(lst997[i].header.getReceiverID()) || !strGroupNum.Equals(lst997[i].header.getGroupControlNum()))
                        {

                            if (lst997[i].strCheckStatus.Equals(EDIError.AK901_A) || lst997[i].strCheckStatus.Equals(EDIError.AK901_E))
                                intAcceptNum++;

                            if (intAcceptNum == intReceiveNum)
                                strCheckStatus = EDIError.AK901_A;
                            else if (intAcceptNum > 0)
                                strCheckStatus = EDIError.AK901_E;
                            else
                                strCheckStatus = EDIError.AK901_R;

                            // AK1 - AK9 only
                            if (lst997[i].intGenerateType == (int)Common.FA_TYPE.GENERAL)
                                str997Segment = edi.create997_AK1_AK9(lst997[i].header, strCheckStatus, intReceiveNum, intReceiveNum, intAcceptNum);
                            else
                                str997Segment = edi.create997_AK1_AK2_AK5_AK9(lst997[i].header, strCheckStatus, intReceiveNum, intReceiveNum, intAcceptNum, lstTmp);

                            intAcceptNum = 0;
                            intReceiveNum = 0;
                            lstTmp.Clear();
                        }
                        else
                        {
                            str997Segment = "";

                            if (lst997[i].strCheckStatus.Equals(EDIError.AK901_A) || lst997[i].strCheckStatus.Equals(EDIError.AK901_E))
                                intAcceptNum++;
                            
                        }

                    }
                    // last element
                    else
                    {
                        if (lst997[i].strCheckStatus.Equals(EDIError.AK901_A) || lst997[i].strCheckStatus.Equals(EDIError.AK901_E))
                            intAcceptNum++;

                        if (intAcceptNum == intReceiveNum)
                            strCheckStatus = EDIError.AK901_A;
                        else if (intAcceptNum > 0)
                            strCheckStatus = EDIError.AK901_E;
                        else
                            strCheckStatus = EDIError.AK901_R;

                        if (lst997[i].intGenerateType == (int)Common.FA_TYPE.GENERAL)
                            str997Segment = edi.create997_AK1_AK9(lst997[i].header, strCheckStatus, intReceiveNum, intReceiveNum, intAcceptNum);
                        else
                            str997Segment = edi.create997_AK1_AK2_AK5_AK9(lst997[i].header, strCheckStatus, intReceiveNum, intReceiveNum, intAcceptNum, lstTmp);
                        
                        lstTmp.Clear();

                    }

                    // output path to default or specific by Trading partner
                    var trading = edi.getTradingByEDIHeader(edm, lst997[i].header);
                    if (trading != null)
                    {
                        if (!Common.isNullEmptyNothing(trading.Output997FilePath))
                            strPath = trading.Output997FilePath;
                        else
                            strPath = strPathDefault;
                    }
                    else
                        strPath = strPathDefault;
     
                    // out put 
                    if (!str997Segment.Equals(""))
                    {

                        if (strPath.Substring(strPath.Length - 1).Equals("\\"))
                            strFileName = strPath + lst997[i].header.getAppSenderID() + "_997_" + DateTime.Now.ToString("MMddyyyy_HHmmss.fff") + ".edi";
                        else
                            strFileName = strPath + "\\" + lst997[i].header.getAppSenderID() + "_997_" + DateTime.Now.ToString("MMddyyyy_HHmmss.fff") + ".edi";

                        File.WriteAllText(strFileName, str997Segment);
                        Common.writeLog(lst997[i].intTradingNo, lst997[i].intTSetNo, String.Format("Created 997 file: {0}", strFileName), (int)Common.LOG_TYPE.JOB, DateTime.Now, lst997[i].header.getRawDataNo());

                        // create 997 raw data

                        if (out997No != -1)
                        {

                            tblEDITrasactionRawData newData = new tblEDITrasactionRawData();
                            DateTime dtTran = DateTime.Now;
                            newData.TransactionDate = dtTran;
                            newData.TradingPartnerNo_FK = lst997[i].intTradingNo;
                            newData.TransactionKey = Common.DEFAULT_TRANSACTION_ID;
                            newData.InterchangeControlNum = lst997[i].header.getInterchangeNum();
                            newData.GroupControlNum = lst997[i].header.getGroupControlNum();
                            newData.TransactionSetNo_FK = out997No;
                            newData.RawData = str997Segment;
                            newData.XMLData = "";
                            newData.InOut = true;
                            edm.AddTotblEDITrasactionRawDatas(newData);
                            edm.SaveChanges();
                        }

                    }
                }
                else if (!lst997[i].header.checkIsVDAFormat()) // EDIFACT format
                {
                    str997Segment = edi.createCONTROL_general(lst997[i].header, lst997[i].strCheckStatus);
                     if (strPath.Substring(strPath.Length - 1).Equals("\\"))
                            strFileName = strPath + lst997[i].header.getAppSenderID() + "_CONTRL_" + DateTime.Now.ToString("MMddyyyy_HHmmss") + ".edi";
                        else
                            strFileName = strPath + "\\" + lst997[i].header.getAppSenderID() + "_CONTRL_" + DateTime.Now.ToString("MMddyyyy_HHmmss") + ".edi";

                        File.WriteAllText(strFileName, str997Segment);
                        Common.writeLog(lst997[i].intTradingNo, lst997[i].intTSetNo, String.Format("Created CONTRL file: {0}", strFileName), (int)Common.LOG_TYPE.JOB, DateTime.Now, lst997[i].header.getRawDataNo());

                        // create CONTRL raw data
                        if (outContrlNo != -1)
                        {

                            tblEDITrasactionRawData newData = new tblEDITrasactionRawData();
                            DateTime dtTran = DateTime.Now;
                            newData.TransactionDate = dtTran;
                            newData.TradingPartnerNo_FK = lst997[i].intTradingNo;
                            newData.TransactionKey = Common.DEFAULT_TRANSACTION_ID;
                            newData.InterchangeControlNum = lst997[i].header.getInterchangeNum();
                            newData.GroupControlNum = lst997[i].header.getGroupControlNum();
                            newData.TransactionSetNo_FK = outContrlNo;
                            newData.RawData = str997Segment;
                            newData.XMLData = "";
                            newData.InOut = true;
                            edm.AddTotblEDITrasactionRawDatas(newData);
                            edm.SaveChanges();
                        }
                }
            }

        }
    }
}
