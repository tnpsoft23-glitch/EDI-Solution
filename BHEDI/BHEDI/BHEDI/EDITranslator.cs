using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Xml;
using System.Collections;


namespace BHEDI
{
    /// <summary>
    /// EDI Translator class
    /// </summary>
    public class EDITranslator
    {

        /// <summary>
        /// XML tag names
        /// </summary>
        private readonly string OUTBOUND_TAG = "ASN";
        private readonly string OUTBOUND_HEADER_TAG = "TransactionSet";
        private readonly string OUTBOUND_TRANSATION_KEY_TAG = "ShipmentCode";
        private readonly string OUTBOUND_TRANSATION_ID_TAG = "TransactionSetCode";
        private readonly string OUTBOUND_SENDER_ID_TAG = "Sender_ID";
        private readonly string OUTBOUND_SENDER_QUAL_TAG = "Sender_ID_Qualifier";
        private readonly string OUTBOUND_RECEIVER_ID_TAG = "Receiver_ID";
        private readonly string OUTBOUND_RECEIVER_QUAL_TAG = "Receiver_ID_Qualifier";
        private readonly string OUTBOUND_APPSENDER_ID_TAG = "Application_Sender_ID";
        private readonly string OUTBOUND_APPRECEIVER_ID_TAG = "Application_Receiver_ID";
        private readonly string EDI_STANDARD_VERSION = "004010";
        private readonly char EDI_STANDARD_SUBELEMENT_SEP = '*';
        private readonly char EDI_STANDARD_ELEMENT_SEP = '~';
        private readonly int MAX_CONTROL_NUM = 999999999;
        private readonly char DEFAULT_CHAR = 'K';
        private readonly string OUTBOUND_HEADER_TAG_DAIDO = "Header";
        private readonly string OUTBOUND_OUTBOUND_TAG_DAIDO = "Map_OutboundID";
        private readonly string OUTBOUND_TRANSATION_KEY_TAG_DAIDO = "Shipment_IDNumber";
        //private readonly string EDI_FACT_UNA = "UNA:+.? ";
        
        /// SFTP connection trading partner - do not use Sender ID and Receive ID
        private readonly string PIERBURG = "PIERBURG";
        private readonly string PIERBURG_SENDER_ID = "PIERBURG";
        private readonly string PIERBURG_RECEIVER_ID = "079714529";

        private readonly int MAX_TRANSMISSION_NUM = 99999; // 5/14/2019 Phuong addded for VDA 
        private readonly int VDA_SEGMENT_LENGTH = 127; // 5/14/2019 Phuong addded for VDA 

        /// <summary>
        /// 997 generate set
        /// </summary>
        public struct T997Set
        {
            public EDIHeader header;
            public string strCheckStatus;
            public int intTradingNo;
            public int intTSetNo;
            public int intGenerateType;
            public int intErrorCode;
        }
        
        /// <summary>
        /// Find segment data
        /// </summary>
        /// <param name="segmentName"></param>
        /// <param name="EDIData"></param>
        /// <returns></returns>
        private string findSegmentData(string segmentName, string[] EDIData)
        {
            string segment = "";
            foreach (string st in EDIData)
            {
                segment = getSegmentName(st);
                if (segment.Equals(segmentName))
                    return st;
            }
            return "";
        }

        /// <summary>
        /// Get segment name
        /// </summary>
        /// <param name="strEDI"></param>
        /// <returns></returns>
        private string getSegmentName(string strEDI)
        {
            char ch = getSubElementSeparateCharater(strEDI);
            string[] segment = strEDI.Split(ch);
            return segment[0];
        }

        /// <summary>
        /// Get ASCII control character from string
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        private char getASCIIControlCharater(string str)
        {
            char[] chrs = str.ToCharArray();
            foreach (char ch in chrs)
            {
                if (char.IsControl(ch))
                    return ch;
            }

            return DEFAULT_CHAR;
        }

        /// <summary>
        /// Get EDI sub element separate character
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        private char getSubElementSeparateCharater(string str)
        {
            char[] chrs = str.ToCharArray();
            foreach (char ch in chrs)
            {
                if (!char.IsLetterOrDigit(ch))
                    return ch;
            }

            return DEFAULT_CHAR;
        }
        /// <summary>
        /// get element separate character for EDIFACT
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        private char getElementSeparateCharacterEDIFACT(string str)
        {
            for (int i = 0; i < str.Length; i++)
            {
                if (i + 2 < str.Length)
                {
                    if (str[i].Equals('U') && str[i+1].Equals('N') && str[i+2].Equals('H'))
                        return str[i - 1];
                }
            }
            return '\'';
        }
        /// <summary>
        /// Get EDI Version
        /// </summary>
        /// <param name="edm"></param>
        /// <param name="str"></param>
        /// <returns></returns>
        private int getEDIVersion(BHEDI_EDM edm, string str)
        {
            var data = edm.tblEDIVersions.Where(s => s.Version == str).FirstOrDefault<tblEDIVersion>();
            if (data != null)
                return data.EDIVersionNo;
            return 1;
        }

        /// <summary>
        /// Get EDI Version Name
        /// </summary>
        /// <param name="edm"></param>
        /// <param name="str"></param>
        /// <returns></returns>
        private string getEDIVersionName(BHEDI_EDM edm, int no)
        {
            var data = edm.tblEDIVersions.Where(s => s.EDIVersionNo == no).FirstOrDefault<tblEDIVersion>();
            if (data != null)
                return data.Version;
            return EDI_STANDARD_VERSION;
        }

        /// <summary>
        /// Get char separate
        /// </summary>
        /// <param name="edm"></param>
        /// <param name="str"></param>
        /// <returns></returns>
        private int getCharSeparate(BHEDI_EDM edm, char chr)
        {
            int intCode = (int)chr;
            var data = edm.tblSegmentTerminators.Where(s => s.TerminatorCode == intCode).FirstOrDefault<tblSegmentTerminator>();
            if (data != null)
                return data.SegmentTerminatorNo;
            return 1;
        }

        /// <summary>
        /// Get segment terminator code
        /// </summary>
        /// <param name="edm"></param>
        /// <param name="str"></param>
        /// <returns></returns>
        private int getSegmentTerminator(BHEDI_EDM edm, int no)
        {
            var data = edm.tblSegmentTerminators.Where(s => s.SegmentTerminatorNo == no).FirstOrDefault<tblSegmentTerminator>();
            if (data != null)
                return data.TerminatorCode;
            return 1;
        }


        /// <summary>
        /// Get segment terminator code name
        /// </summary>
        /// <param name="edm"></param>
        /// <param name="str"></param>
        /// <returns></returns>
        private string getSegmentTerminatorName(BHEDI_EDM edm, int no)
        {
            var data = edm.tblSegmentTerminators.Where(s => s.SegmentTerminatorNo == no).FirstOrDefault<tblSegmentTerminator>();
            if (data != null)
                return data.Terminator;
            return "";
        }

        /// <summary>
        /// Get Operator
        /// </summary>
        /// <param name="edm"></param>
        /// <param name="str"></param>
        /// <returns></returns>
        private string getOperator(BHEDI_EDM edm, int opNo)
        {
            var data = edm.tblOperators.Where(s => s.OperatorNo == opNo).FirstOrDefault<tblOperator>();
            if (data != null)
                return data.OperatorCode;
            return "";
        }

        /// <summary>
        /// Get EDI segment no
        /// </summary>
        /// <param name="edm"></param>
        /// <param name="str"></param>
        /// <returns></returns>
        private int getSegmentNo(BHEDI_EDM edm, string str)
        {
            var data = edm.tblEDISegments.Where(s => s.SegmentCode == str).FirstOrDefault<tblEDISegment>();
            if (data != null)
                return data.SegmentNo;
            return 1;
        }
        /// <summary>
        /// Get EDI segment code
        /// </summary>
        /// <param name="edm"></param>
        /// <param name="str"></param>
        /// <returns></returns>
        private string getSegmentCode(BHEDI_EDM edm, int intNo)
        {
            var data = edm.tblEDISegments.Where(s => s.SegmentNo == intNo).FirstOrDefault<tblEDISegment>();
            if (data != null)
                return data.SegmentCode;
            return "";
        }

        /// <summary>
        /// Get TSet No
        /// </summary>
        /// <param name="edm"></param>
        /// <param name="strTset"></param>
        /// <returns></returns>
        public int getTSetNo(BHEDI_EDM edm,string strTset,bool blnOut = false)
        {
            var tset = edm.tblEDITransactionSets.Where(s => s.TransactionSetID == strTset && s.InOut == blnOut).FirstOrDefault<tblEDITransactionSet>();
            if (tset != null)
                return  tset.TransactionSetNo;
            return 1;
        }

        /// <summary>
        /// Get trading partner table
        /// </summary>
        /// <param name="edm"></param>
        /// <param name="header"></param>
        /// <returns></returns>
        public tblTradingPartner getTradingByEDIHeader(BHEDI_EDM edm, EDIHeader header)
        {
            string strSenderID = header.getSenderID();
            string strSenderQual = header.getSenderQual();
            string strReceiverID = header.getReceiverID();
            string strReceiverQual = header.getRereiverQual();
            string strAppSenderID = header.getAppSenderID();
            string strAppReceiverID = header.getAppReceiverID();



            var trading = edm.tblTradingPartners.Where(s => s.InterchangeSenderID == strSenderID
                                                          && s.InterchangeSenderIDQual == strSenderQual
                                                          && s.InterchangeReceiverID == strReceiverID
                                                          && s.InterchangeReceiverIDQual == strReceiverQual
                                                          && s.ApplicationReceiverCode == strAppReceiverID
                                                          && s.ApplicationSenderCode == strAppSenderID).FirstOrDefault<tblTradingPartner>();

            return trading;
        }

        /// <summary>
        /// Get trading partner table
        /// </summary>
        /// <param name="edm"></param>
        /// <param name="header"></param>
        /// <returns></returns>
        private tblTradingPartner getTradingByXMLHeader(BHEDI_EDM edm, XMLHeader header)
        {
            string strSenderID = header.getSenderID();
            string strSenderQual = header.getSenderQual();
            string strReceiverID = header.getReceiverID();
            string strReceiverQual = header.getRereiverQual();
            string strAppSenderID = header.getAppSenderID();
            string strAppReceiverID = header.getAppReceiverID();

            // 12/16/2020 Phuong changed Firt to Last for 1 trading partner that has different EDI version
            // ASN for first trading partner
            // Invoice for last trading partner
            if (header.getTSet().Equals("810") || header.getTSet().Equals("INVOIC"))
                return edm.tblTradingPartners.Where(s => s.InterchangeSenderID == strSenderID
                                                          && s.InterchangeSenderIDQual == strSenderQual
                                                          && s.InterchangeReceiverID == strReceiverID
                                                          && s.InterchangeReceiverIDQual == strReceiverQual
                                                          && s.ApplicationReceiverCode == strAppReceiverID
                                                          && s.ApplicationSenderCode == strAppSenderID).OrderByDescending(s=>s.TradingPartnerNo).FirstOrDefault();

            var trading = edm.tblTradingPartners.Where(s => s.InterchangeSenderID == strSenderID
                                                          && s.InterchangeSenderIDQual == strSenderQual
                                                          && s.InterchangeReceiverID == strReceiverID
                                                          && s.InterchangeReceiverIDQual == strReceiverQual
                                                          && s.ApplicationReceiverCode == strAppReceiverID
                                                          && s.ApplicationSenderCode == strAppSenderID).OrderBy(s => s.TradingPartnerNo).FirstOrDefault();
            
            return trading;
        }

 
        /// <summary>
        /// get EDI header data
        /// </summary>
        /// <param name="filename"></param>
        /// <returns></returns>
        public EDIHeader getEDIHeaderData(string filename)
        {
            
            EDIHeader header = new EDIHeader();

            try
            {

                header.setFileName(filename);

                /// read all line
                string lines = System.IO.File.ReadAllText(filename, Encoding.ASCII);
                lines = removeUNASegment(lines);

                header.setRawData(lines);

                bool isX12Format = true;
                if (!lines.Trim().Substring(0, 3).Equals("ISA")) // check X12 or Edifact
                    isX12Format = false;
                header.setIsX12Format(isX12Format);


                // 5/9/2019 Phuong added VDA format
                bool isVDAFormat = false;
                if (!isX12Format)
                {
                    if (!lines.Trim().Substring(0, 3).Equals("UNB")) // check VDA or Edifact
                        isVDAFormat = true;
                }
                header.setIsVDAFormat(isVDAFormat);


                char chrElementSeparate = getASCIIControlCharater(lines);

                // get sub element separate char
                char chrSubElementSeparate = getSubElementSeparateCharater(lines);

                if (isX12Format) // X12 format
                {

                    // read ISA segment
                    string[] strISA = lines.Split(chrSubElementSeparate);

                    if (strISA.Length > 16)
                    {
                        header.setAuthorQual(strISA[1].Trim());
                        header.setAuthor(strISA[2].Trim());
                        header.setSecurityQual(strISA[3].Trim());
                        header.setSecurity(strISA[4].Trim());
                        header.setSenderQual(strISA[5].Trim());
                        header.setSenderID(strISA[6].Trim());

                        // check if Daido version 
                        //if (Common.IS_FOR_DAIDO && !Common.DAIDO_PARTNER_LIST.Contains(strISA[6].Trim()))
                        //    return null;

                        header.setRereiverQual(strISA[7].Trim());
                        header.setReceiverID(strISA[8].Trim());
                        if (!Common.isNullEmptyNothing(strISA[11].Trim()))
                            header.setRepetionSeparator(strISA[11].Trim().Substring(0, 1));
                        else
                            header.setRepetionSeparator(" ");
                        header.setVersion(strISA[12].Trim());
                        if (chrElementSeparate == DEFAULT_CHAR)
                        {
                            chrElementSeparate = strISA[16].Trim()[1];
                        }
                        header.setElementSeparator(chrElementSeparate.ToString());

                        header.setDataElementSeparator(chrSubElementSeparate.ToString());
                        if (!Common.isNullEmptyNothing(strISA[16].Trim()))
                            header.setSubElementSeparator(strISA[16].Trim().Substring(0, 1));
                        else
                            header.setSubElementSeparator(" ");
                        header.setInterchangeNum(strISA[13].Trim());
                    }

                    //// read GS segment
                    string strSegment = "";
                    string[] strEDI = lines.Split(chrElementSeparate);
                    // remove special charater
                    for (int i = 1; i < strEDI.Length; i++)
                    {
                        strEDI[i] = Common.removeSpecialCharater(strEDI[i]);
                    }

                    strSegment = findSegmentData("GS", strEDI);

                    string[] strGS = strSegment.Split(chrSubElementSeparate);

                    if (strGS.Length > 8)
                    {
                        header.setAppSenderID(strGS[2].Trim());
                        header.setAppReceiverID(strGS[3].Trim());
                        header.setControlVersion(strGS[8].Trim());
                        header.setAgencyCode(strGS[7].Trim());
                        header.setGroupControlNum(strGS[6].Trim());
                    }

                    strSegment = findSegmentData("ST", strEDI);

                    string[] strST = strSegment.Split(chrSubElementSeparate);
                    if (strST.Length > 2)
                    {
                        header.setTSet(strST[1].Trim());
                        header.setTSetControlNum(strST[2].Trim());
                    }
                }
                else if (isVDAFormat) { // 5/9/2019 Phuong added VDA
                    
                    // check transaction set by segment data
                    if (lines.Trim().Substring(0, 3).Equals("511")) // 511 - 4095
                    {
                        header.setTSet("4095");
                        header.setVersion(lines.Trim().Substring(3, 2)); // version
                        header.setSenderID(lines.Trim().Substring(5, 9).Trim());
                        header.setAppSenderID(lines.Trim().Substring(5, 9).Trim());

                        header.setSenderQual(" ");
                        header.setReceiverID(lines.Trim().Substring(14, 9).Trim());
                        header.setAppReceiverID(lines.Trim().Substring(14, 9).Trim());

                        header.setRereiverQual(" ");

                        header.setInterchangeNum(lines.Trim().Substring(23, 5).Trim());
                        header.setTSetControlNum(lines.Trim().Substring(28, 5).Trim());
                        header.setElementSeparator(chrElementSeparate.ToString());
                        header.setDataElementSeparator(chrElementSeparate.ToString());
                        header.setSubElementSeparator(chrElementSeparate.ToString());
                        header.setRepetionSeparator(chrElementSeparate.ToString());
                        
                    }
                }
                else // edi fact format
                {

                    string[] strUNB = lines.Split(chrSubElementSeparate);
                    if (strUNB.Length > 5)
                    {
                        if (chrElementSeparate == DEFAULT_CHAR)
                        {
                            chrElementSeparate = getElementSeparateCharacterEDIFACT(lines);
                        }
                        header.setElementSeparator(chrElementSeparate.ToString());
                        header.setDataElementSeparator(chrSubElementSeparate.ToString());
                        header.setSubElementSeparator(getSubElementSeparateCharater(strUNB[1]).ToString());
                        header.setRepetionSeparator(getSubElementSeparateCharater(strUNB[1]).ToString());

                        header.setVersion(strUNB[1].Trim());

                        string[] strTmp = strUNB[2].Split(header.getSubElementSeparator()[0]);
                        header.setSenderID(strTmp[0].Trim());

                        // check if Daido version
                        // 6/17/2021 Phuong changed DO NOT LIMIT TRADING PARTNER 
                        //if (Common.IS_FOR_DAIDO && !Common.DAIDO_PARTNER_LIST.Contains(strTmp[0].Trim()))
                        //    return null;

                        header.setAppSenderID(strTmp[0].Trim());
                        if (strTmp.Length > 1)
                            header.setSenderQual(strTmp[1].Trim());
                        else
                            header.setSenderQual(" ");

                        strTmp = strUNB[3].Split(header.getSubElementSeparator()[0]);
                        header.setReceiverID(strTmp[0].Trim());
                        header.setAppReceiverID(strTmp[0].Trim());
                        if (strTmp.Length > 1)
                            header.setRereiverQual(strTmp[1].Trim());
                        else
                            header.setRereiverQual(" ");
                        header.setGroupControlNum(strUNB[5].Trim().Split(chrElementSeparate)[0]);
                    }

                    string[] strEDI = lines.Split(chrElementSeparate);
                    // remove special charater
                    for (int i = 1; i < strEDI.Length; i++)
                    {
                        strEDI[i] = Common.removeSpecialCharater(strEDI[i]);
                    }
                    string strSegment = findSegmentData("UNH", strEDI);
                    string[] strUNH = strSegment.Split(chrSubElementSeparate);
                    if (strUNH.Length > 2)
                    {
                        header.setInterchangeNum(strUNH[1].Trim());
                        header.setTSetControlNum(strUNH[1].Trim());
                        string[] strV = strUNH[2].Split(header.getSubElementSeparator()[0]);
                        header.setTSet(strV[0].Trim());
                        if (strV.Length > 3)
                        {
                            header.setControlVersion(strV[1].Trim() + strV[2].Trim());
                        }
                        if (strV.Length >= 4)
                        {
                            header.setAgencyCode(strV[3].Trim());
                        }
                    }

                    // 9/19/2018 Phuong change with SFTP connection trading sometime they do not use sender id
                    if (String.IsNullOrEmpty(header.getSenderID()))
                    {
                        for (int i = 1; i < strEDI.Length; i++)
                        {
                            if (strEDI[i].ToUpper().Contains(PIERBURG))
                            {
                                header.setSenderID(PIERBURG_SENDER_ID);
                                header.setAppSenderID(PIERBURG_SENDER_ID);
                                header.setReceiverID(PIERBURG_RECEIVER_ID);
                                header.setAppReceiverID(PIERBURG_RECEIVER_ID);
                                break;
                            }
                        }
                    }

                }

                if (String.IsNullOrEmpty(header.getSenderID()))
                    return null;
                
                return header;
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// Import EDI inbound data
        /// </summary>
        /// <param name="header"></param>
        /// <param name="isDelete"></param>
        /// <param name="isArchive"></param>
        /// <param name="isCreate"></param>
        public void importEDIInboundData(EDIHeader header, bool isDelete = true, bool isArchive = true, bool isCreate = true)
        {

            using (var edm = new BHEDI_EDM())
            {

                // check trading partner already set-up yet
                int tradingNo = -1;

                var trading = getTradingByEDIHeader(edm, header);

                if (trading == null)
                {
                    // create new trading partner data                
                    tblTradingPartner newTrading = new tblTradingPartner();
                    newTrading.TradingPartnerName = header.getSenderID();
                    newTrading.ApplicationReceiverCode = header.getAppReceiverID();
                    newTrading.ApplicationSenderCode = header.getAppSenderID();
                    newTrading.AuthorizationInfo = header.getAuthor();
                    newTrading.AuthorizationQual = header.getAuthorQual();
                    newTrading.InterchangeReceiverID = header.getReceiverID();
                    newTrading.InterchangeReceiverIDQual = header.getRereiverQual();
                    newTrading.InterchangeSenderID = header.getSenderID();
                    newTrading.InterchangeSenderIDQual = header.getSenderQual();
                    newTrading.SecurityInfo = header.getSecurity();
                    newTrading.SecurityQual = header.getSecurityQual();
                    newTrading.InterchangeVersion = header.getVersion();
                    newTrading.StandardVersion = getEDIVersion(edm, header.getControlVersion());
                    newTrading.SubElementSep = getCharSeparate(edm, header.getSubElementSeparator()[0]);
                    newTrading.DataElementDelimiter = getCharSeparate(edm, header.getDataElementSeparator()[0]);
                    newTrading.SegmentTerminator = getCharSeparate(edm, header.getElementSeparator()[0]);
                    newTrading.ResponsibleAgencyCode = header.getAgencyCode();
                    newTrading.RepetitionSep = getCharSeparate(edm, header.getRepetionSeparator()[0]);
                    newTrading.FunctionalAcknowledgement = 0;
                    edm.AddTotblTradingPartners(newTrading);
                    edm.SaveChanges();
                    tradingNo = newTrading.TradingPartnerNo;

                    // 6/17/2021 Phuong added send email notification when add a new trading partner
                    if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                    {
                        string strErrMsg = "<p>New Trading Partner EDI ID : " + newTrading.TradingPartnerName + "<p>Qualifier ID : " + newTrading.InterchangeSenderIDQual
                            + "<p>Receiver ID: " + newTrading.InterchangeReceiverID + "<p>Receiver Qualifier ID: " + newTrading.InterchangeReceiverIDQual
                            + "<p>Data: " + header.getTSet();
                        Common.sendEmail(strErrMsg, Common.EMAIL);
                    }

                }

                else
                    tradingNo = trading.TradingPartnerNo;

                // get Transaction Set
                int tsetNo = -1;
                string strTset = header.getTSet();
                tsetNo = getTSetNo(edm, strTset,false);

                // create new raw data
                tblEDITrasactionRawData newData = new tblEDITrasactionRawData();
                DateTime dtTran = DateTime.Now;
                newData.TransactionDate = dtTran;
                header.setTransactionDateTime(dtTran);
                newData.TradingPartnerNo_FK = tradingNo;
                newData.TransactionKey = Common.removeSpecialCharater(header.getTSetControlNum());
                newData.InterchangeControlNum = Common.removeSpecialCharater(header.getInterchangeNum());
                newData.GroupControlNum = Common.removeSpecialCharater(header.getGroupControlNum());
                newData.TransactionSetNo_FK = tsetNo;
                newData.RawData = header.getRawData();
                newData.XMLData = "";
                newData.InOut = false;
                edm.AddTotblEDITrasactionRawDatas(newData);
                edm.SaveChanges();

                header.setRawDataNo(newData.TransactionRawDataNo);

                // log
                Common.writeLog(tradingNo, tsetNo, String.Format("Imported {0}", header.getFileName()), (int)Common.LOG_TYPE.JOB, dtTran, newData.TransactionRawDataNo);

                int intDataNo = newData.TransactionRawDataNo;

                // create map data 
                if (isCreate)
                {
                    var inMap = edm.tblInboundMappings.Where(s => s.TradingPartnerNo_FK == tradingNo && s.TransactionSetNo_FK == tsetNo).ToList<tblInboundMapping>();

                    // if there is not map, create new map data
                    if (inMap == null || inMap.Count == 0)
                    {

                        tblInboundMapping newMap = new tblInboundMapping();
                        newMap.TransactionSetNo_FK = tsetNo;
                        newMap.TradingPartnerNo_FK = tradingNo;
                        newMap.TransactionRawDataNo_FK = intDataNo;
                        if (header.checkIsX12Format())
                            newMap.SegmentNo_FK = getSegmentNo(edm, "ISA");
                        if (header.checkIsVDAFormat()) // 5/9/2019 Phuong added VDA
                        {
                            if (strTset.Equals("4095"))
                                newMap.SegmentNo_FK = getSegmentNo(edm, "511");
                        }
                        else
                            newMap.SegmentNo_FK = getSegmentNo(edm, "UNB");

                        newMap.Postion = 1;
                        newMap.CommitDBAfterRead = false;
                        edm.AddTotblInboundMappings(newMap);
                        edm.SaveChanges();

                    }
                    else // update map reference to new raw data
                    {
                        foreach (tblInboundMapping map in inMap)
                        {
                            map.TransactionRawDataNo_FK = newData.TransactionRawDataNo;
                        }
                        edm.SaveChanges();
                    }
                }

                // delete and archive file
                if (isArchive)
                {
                    Common.archiveFile(header.getFileName());

                }

                if (isDelete)
                {
                    File.Delete(header.getFileName());
                }


            }

        }

        /// <summary>
        /// get XML header data
        /// </summary>
        /// <param name="filename"></param>
        /// <returns></returns>
        public XMLHeader getXMLHeaderData(string filename)
        {
            XMLHeader header = new XMLHeader();

            try
            {

                header.setFileName(filename);
                string strXML = System.IO.File.ReadAllText(filename, Encoding.ASCII);
                strXML = strXML.Replace("><", String.Format(">{0}<", Environment.NewLine)); // make XML data is easy view
                header.setRawData(strXML);
                XmlDocument doc = new XmlDocument();
                doc.Load(filename);

                if (!Common.IS_FOR_DAIDO) // Bi=Mode version
                {

                    XmlNodeList xnList = doc.SelectNodes(String.Format("/{0}/{1}", OUTBOUND_TAG, OUTBOUND_HEADER_TAG));
                    foreach (XmlNode xn in xnList)
                    {
                        header.setTSetControlNum(Common.myCStr(xn[OUTBOUND_TRANSATION_KEY_TAG].InnerText));
                        header.setTSet(Common.myCStr(xn[OUTBOUND_TRANSATION_ID_TAG].InnerText));
                        header.setSenderID(Common.myCStr(xn[OUTBOUND_SENDER_ID_TAG].InnerText));
                        header.setSenderQual(Common.myCStr(xn[OUTBOUND_SENDER_QUAL_TAG].InnerText));
                        header.setReceiverID(Common.myCStr(xn[OUTBOUND_RECEIVER_ID_TAG].InnerText));
                        header.setRereiverQual(Common.myCStr(xn[OUTBOUND_RECEIVER_QUAL_TAG].InnerText));
                        header.setAppSenderID(Common.myCStr(xn[OUTBOUND_APPSENDER_ID_TAG].InnerText));
                        header.setAppReceiverID(Common.myCStr(xn[OUTBOUND_APPRECEIVER_ID_TAG].InnerText));

                    }
                }
                else // Daido Version
                {
                    XmlNodeList xnList = doc.SelectNodes(String.Format("/{0}/{1}", OUTBOUND_TAG, OUTBOUND_HEADER_TAG_DAIDO));
                    string strOutboundID = "";
                    // 4/5/2018 Phuong added for Daido Version - Toyota 810
                    // 6/15/2023 Phuong added for Daido version - Cummins INVOIC
                    string strTransetID = "";

                    foreach (XmlNode xn in xnList)
                    {
                        strOutboundID = Common.myCStr(xn[OUTBOUND_OUTBOUND_TAG_DAIDO].InnerText);

                        if (xn[OUTBOUND_TRANSATION_ID_TAG] != null)
                            strTransetID = Common.myCStr(xn[OUTBOUND_TRANSATION_ID_TAG].InnerText);
                        
                        header.setTSetControlNum(Common.myCStr(xn[OUTBOUND_TRANSATION_KEY_TAG_DAIDO].InnerText));
                        //if (Common.DAIDO_EDI_FACT_LIST.Contains(strOutboundID))
                        //    //header.setTSet("DESADV");
                        //    header.setTSet(strTransetID.Equals("") ? "DESADV" : strTransetID);
                        //else
                        //    header.setTSet(strTransetID.Equals("") ? "856": strTransetID);
                    }

                    // get trading partner by Outbound ID
                    using (var edm = new BHEDI_EDM())
                    {
                        var trading = edm.tblTradingPartners.Where(s => s.OutBoundID == strOutboundID).FirstOrDefault<tblTradingPartner>();
                        if (trading != null)
                        {
                            header.setSenderID(trading.InterchangeSenderID);
                            header.setSenderQual(trading.InterchangeSenderIDQual);
                            header.setReceiverID(trading.InterchangeReceiverID);
                            header.setRereiverQual(trading.InterchangeReceiverIDQual);
                            header.setAppSenderID(trading.ApplicationSenderCode);
                            header.setAppReceiverID(trading.ApplicationReceiverCode);
                            // 8/10/2023 Phuong change set EDIFACT or X12 by Interchange Version and Agency Code
                            string strInterChangeVersion = trading.InterchangeVersion;
                            if (strInterChangeVersion.Contains("UN"))
                                 header.setTSet(strTransetID.Equals("") ? "DESADV" : strTransetID);
                            else
                                header.setTSet(strTransetID.Equals("") ? "856": strTransetID);

                        }
                    }
                    }
                }
                catch 
                {
                    return null;
                }
            return header;
        }

        /// <summary>
        /// Import XML outbound data
        /// </summary>
        /// <param name="header"></param>
        /// <param name="isDelete"></param>
        /// <param name="isArchive"></param>
        public void importXMLOutboundData(XMLHeader header, bool isDelete = true, bool isArchive = true, bool isCreate = true)
        {
            using (var edm = new BHEDI_EDM())
            {
                // check trading partner already set-up yet
                int tradingNo = -1;

                var trading = getTradingByXMLHeader(edm, header);

                if (trading == null)
                {
                    // create new trading partner data                
                    tblTradingPartner newTrading = new tblTradingPartner();
                    newTrading.TradingPartnerName = header.getSenderID();
                    newTrading.ApplicationReceiverCode = header.getAppReceiverID();
                    newTrading.ApplicationSenderCode = header.getAppSenderID();
                    newTrading.InterchangeReceiverID = header.getReceiverID();
                    newTrading.InterchangeReceiverIDQual = header.getRereiverQual();
                    newTrading.InterchangeSenderID = header.getSenderID();
                    newTrading.InterchangeSenderIDQual = header.getSenderQual();
                    newTrading.StandardVersion = getEDIVersion(edm, EDI_STANDARD_VERSION);
                    newTrading.InterchangeVersion = EDI_STANDARD_VERSION;
                    newTrading.SubElementSep = getCharSeparate(edm, EDI_STANDARD_SUBELEMENT_SEP);
                    newTrading.DataElementDelimiter = getCharSeparate(edm, EDI_STANDARD_SUBELEMENT_SEP);
                    newTrading.SegmentTerminator = getCharSeparate(edm, EDI_STANDARD_ELEMENT_SEP);
                    newTrading.FunctionalAcknowledgement = 0;
                    edm.AddTotblTradingPartners(newTrading);
                    edm.SaveChanges();
                    tradingNo = newTrading.TradingPartnerNo;

                    // 6/17/2021 Phuong added send email notification when add a new trading partner
                    if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                    {
                        string strErrMsg = "<p>New Trading Partner EDI ID : " + newTrading.TradingPartnerName + "<p>Qualifier ID : " + newTrading.InterchangeSenderIDQual
                            + "<p>Receiver ID: " + newTrading.InterchangeReceiverID + "<p>Receiver Qualifier ID: " + newTrading.InterchangeReceiverIDQual
                            + "<p>Data: " + header.getTSet();
                        Common.sendEmail(strErrMsg, Common.EMAIL);
                    }

                }

                else
                    tradingNo = trading.TradingPartnerNo;

                // get Transaction Set
                int tsetNo = -1;
                string strTset = header.getTSet();
                tsetNo = getTSetNo(edm, strTset,true);

                // create new raw data
                tblEDITrasactionRawData newData = new tblEDITrasactionRawData();
                DateTime dtTran = DateTime.Now;
                newData.TransactionDate = dtTran;
                header.setTransactionDateTime(dtTran);
               
                newData.TradingPartnerNo_FK = tradingNo;
                newData.TransactionKey = header.getTSetControlNum();
                newData.TransactionSetNo_FK = tsetNo;
                newData.XMLData = header.getRawData();
                newData.RawData = "";
                newData.InOut = true;
                newData.TransactionKey = Common.DEFAULT_TRANSACTION_ID;
                edm.AddTotblEDITrasactionRawDatas(newData);
                edm.SaveChanges();

                header.setRawDataNo(newData.TransactionRawDataNo);

                // log
                Common.writeLog(tradingNo, tsetNo, String.Format("Imported {0}", header.getFileName()), (int)Common.LOG_TYPE.JOB, dtTran, newData.TransactionRawDataNo);

                int intDataNo = newData.TransactionRawDataNo;

                // create map data 
                if (isCreate)
                {
                    var outMap = edm.tblOutboundMappings.Where(s => s.TradingPartnerNo_FK == tradingNo && s.TransactionSetNo_FK == tsetNo).ToList<tblOutboundMapping>();

                    // if there is not map, create new map data
                    if (outMap == null || outMap.Count == 0)
                    {

                        tblOutboundMapping newMap = new tblOutboundMapping();
                        newMap.TransactionSetNo_FK = tsetNo;
                        newMap.TradingPartnerNo_FK = tradingNo;
                        newMap.TransactionRawDataNo_FK = intDataNo;
                        newMap.SegmentNo_FK = getSegmentNo(edm, "BSN");
                        newMap.Postion = 1;
                        newMap.SegmentNumber = 1;
                        edm.AddTotblOutboundMappings(newMap);
                        edm.SaveChanges();

                    }
                    else // update map reference to new raw data
                    {
                        foreach (tblOutboundMapping map in outMap)
                        {
                            map.TransactionRawDataNo_FK = newData.TransactionRawDataNo;
                        }
                        edm.SaveChanges();
                    }
                }

                // delete and archive file
                if (isArchive)
                {
                    Common.archiveFile(header.getFileName());

                }

                if (isDelete)
                {
                    File.Delete(header.getFileName());
                }
            }
        }

        /// <summary>
        /// Map EDI data to application data
        /// </summary>
        /// <param name="header"></param>
        public void mapEDIDataToApplicationData(EDIHeader header)
        {
            // get trading partner infor
            using (var edm = new BHEDI_EDM())
            {

                var trading = getTradingByEDIHeader(edm, header);

                if (trading == null)
                {
                    Common.writeLog(-1, -1, String.Format("Sender ID: {0} and Receiver ID: {1} have not set-up yet", header.getSenderID(), header.getReceiverID()), (int)Common.LOG_TYPE.SYSTEM_ERROR);
                    return;
                }

                int tradingNo = trading.TradingPartnerNo;
                // 11/03/2017 Phuong changed: Get segment separate character from EDI . Not from trading partner setting
                int segmentSep = getSegmentTerminator(edm, trading.SegmentTerminator);
                int subsegmentSep = getSegmentTerminator(edm, trading.DataElementDelimiter);

                if (!Common.isNullEmptyNothing(header.getElementSeparator()))
                    segmentSep = (int)header.getElementSeparator()[0];
                if (!Common.isNullEmptyNothing(header.getDataElementSeparator()))
                    subsegmentSep = (int)header.getDataElementSeparator()[0];

                int tsetNo = -1;
                string strTset = header.getTSet();
                tsetNo = getTSetNo(edm, strTset,false);

                // get mapping info
                var inMap = edm.tblInboundMappings.Where(s => s.TradingPartnerNo_FK == tradingNo && s.TransactionSetNo_FK == tsetNo).ToList<tblInboundMapping>();

                // if there is not map, error
                if (inMap == null || inMap.Count == 0)
                {
                    Common.writeLog(tradingNo, tsetNo, String.Format("Inbound mapping has not set-up yet"), (int)Common.LOG_TYPE.EDI_ERROR,DateTime.Now,header.getRawDataNo());
                    return;
                }

                // log
                Common.writeLog(tradingNo, tsetNo, "Starting mapping EDI data", (int)Common.LOG_TYPE.JOB, DateTime.Now, header.getRawDataNo());

                List<InboundMapping> lstInboundMap = new List<InboundMapping>();
                foreach (var row in inMap)
                {
                    InboundMapping objMap = new InboundMapping();
                    int intMapNo = row.InboundMappingNo;
                    objMap.CommitDB = row.CommitDBAfterRead;
                    objMap.FieldName = row.FieldName;
                    objMap.InsertDB = Common.myCBool(row.IsInsert);
                    // get operator infor
                    var opt = edm.tblOperatorInboundMappings.Where(s => s.InboundMappingNo_FK == intMapNo).ToList<tblOperatorInboundMapping>();
                    if (opt != null && opt.Count > 0)
                    {
                        List<MappingOperator> lstMapOp = new List<MappingOperator>();
                        foreach (var line in opt)
                        {
                            MappingOperator objMapIn = new MappingOperator();
                            objMapIn.OperatorParameter = line.OperatorParameter;
                            objMapIn.OperatorName = getOperator(edm, line.OperatorNo_FK);
                            lstMapOp.Add(objMapIn);
                        }
                        objMap.Operator = lstMapOp;
                    }
                    objMap.Postion = row.Postion;
                    objMap.SegmentName = getSegmentCode(edm, Common.myCInt(row.SegmentNo_FK));
                    objMap.TableName = row.TableName;
                    // 5/10/2019 Phuong addd VDA format
                    objMap.Note = row.Note;

                    lstInboundMap.Add(objMap);
                }

                // EDI raw data
                string[] arrAllSegment = header.getRawData().Split((char)segmentSep);

                // remove control character
                for (int i = 1; i < arrAllSegment.Length; i++ )
                {
                    arrAllSegment[i] = Common.removeSpecialCharater(arrAllSegment[i]);
                }


                // generate INSERT SQL
                ArrayList arrSQL = generateSQL(arrAllSegment, (char)subsegmentSep, lstInboundMap,edm);

                if (arrSQL.Count == 0)
                {
                    Common.writeLog(tradingNo, tsetNo, String.Format("Inbound mapping has not set-up correctly yet"), (int)Common.LOG_TYPE.EDI_ERROR, DateTime.Now, header.getRawDataNo());
                    return;
                }

                    edm.Connection.Open();
                    var transaction = edm.Connection.BeginTransaction();
                    // 11/5/2020 Phuong added set command time out    
                    edm.CommandTimeout = 0;    

                    try
                    {

                        // run INSERT SQL
                        foreach (string str in arrSQL)
                        {
                            edm.ExecuteStoreCommand(str);
                        }

                        transaction.Commit();
                        edm.Connection.Close();

                        Common.writeLog(tradingNo, tsetNo, "Mapping EDI data is completed", (int)Common.LOG_TYPE.JOB, DateTime.Now, header.getRawDataNo());

                        // 10/23/2020 Phuong added for ERP SCP
                        if (trading.blnUseSCP)
                        {
                            ERP_SCP scp = new ERP_SCP();
                            if (header.getTSet().Equals("830") || header.getTSet().Equals("DELFOR"))
                                scp.export830(header.getRawDataNo(), edm);
                            
                            if (header.getTSet().Equals("850"))
                                scp.export850(header.getRawDataNo(), edm);

                            if (header.getTSet().Equals("860"))
                                scp.export860(header.getRawDataNo(), edm);

                            if (header.getTSet().Equals("824"))
                                scp.export824(header.getRawDataNo(), edm,"","","","","");

                            if (header.getTSet().Equals("997"))
                                scp.export997(header.getRawDataNo(), edm);

                            if (header.getTSet().Equals("856"))
                                scp.export856(header.getRawDataNo(), edm);

                            if (header.getTSet().Equals("820"))
                                scp.export820(header.getRawDataNo(), edm);

                            if (header.getTSet().Equals("861"))
                                scp.export861(header.getRawDataNo(), edm);

                            if (header.getTSet().Equals("862") || header.getTSet().Equals("DELJIT"))
                                scp.export862(header.getRawDataNo(), edm);

                            if (header.getTSet().Equals("864"))
                                scp.export864(header.getRawDataNo(), edm);

                        }

                    }
                    catch (Exception ex)
                    {
                        // close connection
                        transaction.Rollback();

                        if (edm.Connection.State == System.Data.ConnectionState.Open)
                            edm.Connection.Close();

                        Common.writeLog(tradingNo, tsetNo, ex.Message, (int)Common.LOG_TYPE.JOB, DateTime.Now, header.getRawDataNo());
                        // 10/23/2020 Phuong added send error for SQL error
                        if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                        {
                            string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + "<p>Data: " + header.getTSet() 
                                + "<p>File: " + header.getFileName() + "<p>Error: " + ex.Message;
                            Common.sendEmail(strErrMsg, Common.EMAIL);
                        }

                    }
            }
        }

        /// <summary>
        /// Review SQL INSERT query for inbound mapping design
        /// </summary>
        /// <param name="TradingNo"></param>
        /// <param name="TSetNo"></param>
        /// <param name="RawDataNo"></param>
        /// <returns></returns>
        public ArrayList reviewSQLStatement(int tradingNo, int tsetNo, int RawDataNo)
        {
            ArrayList arrSQL = new ArrayList();

            using (var edm = new BHEDI_EDM())
            {

                var trading = edm.tblTradingPartners.Where(s => s.TradingPartnerNo == tradingNo).FirstOrDefault<tblTradingPartner>();

                if (trading == null)
                {
                    return arrSQL;
                }

                int segmentSep = getSegmentTerminator(edm, trading.SegmentTerminator);
                int subsegmentSep = getSegmentTerminator(edm, trading.DataElementDelimiter);

                string strTset = "";
                var tset = edm.tblEDITransactionSets.Where(s => s.TransactionSetNo == tsetNo).FirstOrDefault<tblEDITransactionSet>();
                if (tset != null)
                    strTset = tset.TransactionSetID;

                // get mapping info
                var inMap = edm.tblInboundMappings.Where(s => s.TradingPartnerNo_FK == tradingNo && s.TransactionSetNo_FK == tsetNo).ToList<tblInboundMapping>();

                // if there is not map, error
                if (inMap == null || inMap.Count == 0)
                {
                    return arrSQL;
                }


                List<InboundMapping> lstInboundMap = new List<InboundMapping>();
                foreach (var row in inMap)
                {
                    InboundMapping objMap = new InboundMapping();
                    int intMapNo = row.InboundMappingNo;
                    objMap.CommitDB = row.CommitDBAfterRead;
                    objMap.FieldName = row.FieldName;
                    objMap.InsertDB = Common.myCBool(row.IsInsert);
                    // get operator infor
                    var opt = edm.tblOperatorInboundMappings.Where(s => s.InboundMappingNo_FK == intMapNo).ToList<tblOperatorInboundMapping>();
                    if (opt != null && opt.Count > 0)
                    {
                        List<MappingOperator> lstMapOp = new List<MappingOperator>();
                        foreach (var line in opt)
                        {
                            MappingOperator objMapIn = new MappingOperator();
                            objMapIn.OperatorParameter = line.OperatorParameter;
                            objMapIn.OperatorName = getOperator(edm, line.OperatorNo_FK);
                            lstMapOp.Add(objMapIn);
                        }
                        objMap.Operator = lstMapOp;
                    }
                    objMap.Postion = row.Postion;
                    objMap.SegmentName = getSegmentCode(edm, Common.myCInt(row.SegmentNo_FK));
                    objMap.TableName = row.TableName;
                    
                    // 5/10/2019 Phuong addd VDA format
                    objMap.Note = row.Note;

                    lstInboundMap.Add(objMap);
                }

                // EDI raw data
                var rawData = edm.tblEDITrasactionRawDatas.Where(my => my.TransactionRawDataNo == RawDataNo).FirstOrDefault<tblEDITrasactionRawData>();
                if (rawData == null)
                    return arrSQL;
                string[] arrAllSegment = rawData.RawData.Split((char)segmentSep);
                
                // remove control character
                for (int i = 1; i < arrAllSegment.Length; i++)
                {
                    arrAllSegment[i] = Common.removeSpecialCharater(arrAllSegment[i]);
                }


                // generate INSERT SQL
                arrSQL = generateSQL(arrAllSegment, (char)subsegmentSep, lstInboundMap, edm);

            }

            return arrSQL;
        }

        /// <summary>
        /// Generate SQL INSERT statement for EDI IN data
        /// </summary>
        /// <param name="strEDIData"></param>
        /// <param name="elementSeprate"></param>
        /// <param name="inMap"></param>
        /// <returns></returns>
        public ArrayList generateSQL(string[] strEDIData, char elementSeprate, List<InboundMapping> inMap,BHEDI_EDM edm)
        {
            ArrayList arrSQL = new ArrayList();
            string strSQL = "";
            string strTableName = "";
            ArrayList arrField = new ArrayList();
            string strValue = "";
            ArrayList arrValue = new ArrayList();

            List<MappingVariable> lstVar = new List<MappingVariable>();

            // read EDI data line by line
            foreach (string line in strEDIData)
            {
                // read each element on each segment
                string[] strSegment = line.Split(elementSeprate);

                // 5/9/2019 Phuong changed for VDA
                if (strSegment.Length > 1) // X12 and EDIFACT
                {
                    for (int i = 1; i < strSegment.Length; i++)
                    {
                        InboundMapping map = getMappingInfor(strSegment[0], i, inMap);
                        if (map != null)
                        {
                            strValue = strSegment[i];

                            // table
                            if (!Common.isNullEmptyNothing(map.TableName))
                            {
                                strTableName = map.TableName;

                            }

                            // process operator
                            strValue = performOperator(strValue, map.Operator, lstVar, map.InsertDB);

                            // field 
                            if (!Common.isNullEmptyNothing(map.FieldName))
                            {
                                arrField.Add(map.FieldName);
                                arrValue.Add(strValue);
                            }

                            // process commit db
                            if (map.CommitDB)
                            {

                                if (!checkAnotherCommitPosition(strSegment, inMap, i, map)) // check if have duplicate commit db
                                {

                                    // create table key
                                    createTableKey(strTableName, inMap, lstVar, arrField, arrValue, map.InsertDB);
                                    // create Insert SQL 
                                    strSQL = createInsertSQL(strTableName, arrField, arrValue, edm, map.InsertDB);
                                    arrSQL.Add(strSQL);

                                    // clean temp variables
                                    arrField.Clear();
                                    arrValue.Clear();
                                    strTableName = "";
                                }

                            }
                        }
                    }
                }
                else // VDA format 5/13/2019 Phuong added
                {
                    string strSegmentVDA = strSegment[0];
                    // reset even not complete yet because each segment in each table
                    arrField.Clear();
                    arrValue.Clear();
                    strTableName = "";

                    for (int i = 3; i < strSegmentVDA.Length; i++)
                    {
                        InboundMapping map = getMappingInfor(strSegmentVDA.Substring(0,3), i, inMap);
                        if (map != null)
                        {
                            // using note for lenth of data
                            int intFieldLen = Common.myCInt(map.Note);
                            if (intFieldLen > 0)
                            {
                                if (i + intFieldLen < strSegmentVDA.Length)
                                    strValue = strSegmentVDA.Substring(i, intFieldLen);
                                else
                                {
                                    strValue = strSegmentVDA.Substring(i,strSegmentVDA.Length - i);
                                }

                                // table
                                if (!Common.isNullEmptyNothing(map.TableName))
                                {
                                    strTableName = map.TableName;

                                }

                                // process operator
                                strValue = performOperator(strValue, map.Operator, lstVar, map.InsertDB);

                                // field 
                                if (!Common.isNullEmptyNothing(map.FieldName))
                                {
                                    arrField.Add(map.FieldName);
                                    arrValue.Add(strValue);
                                }

                                // process commit db
                                if (map.CommitDB)
                                {
                                    // VDA do not check another position suit
                                    //if (!checkAnotherCommitPosition(strSegment, inMap, i, map)) // check if have duplicate commit db
                                    //{

                                        // create table key
                                        createTableKey(strTableName, inMap, lstVar, arrField, arrValue, map.InsertDB);
                                        // create Insert SQL 
                                        strSQL = createInsertSQL(strTableName, arrField, arrValue, edm, map.InsertDB);
                                        arrSQL.Add(strSQL);

                                        // clean temp variables
                                        arrField.Clear();
                                        arrValue.Clear();
                                        strTableName = "";
                                    //}

                                }

                            }
                        }
                    }
                    
                }
            }

            return arrSQL;
        }

        /// <summary>
        /// Map XML data to EDI data
        /// </summary>
        /// <param name="header"></param>
        public void mapXMLDataToEDIData(XMLHeader header)
        {
            // get trading partner infor
            using (var edm = new BHEDI_EDM())
            {

                var trading = getTradingByXMLHeader(edm, header);

                if (trading == null)
                {
                    Common.writeLog(-1, -1, String.Format("Sender ID: {0} and Receiver ID: {1} have not set-up yet", header.getSenderID(), header.getReceiverID()), (int)Common.LOG_TYPE.SYSTEM_ERROR);
                    return;
                }

                int tradingNo = trading.TradingPartnerNo;
                int segmentSep = getSegmentTerminator(edm, trading.SegmentTerminator);
                int subsegmentSep = getSegmentTerminator(edm, trading.DataElementDelimiter);
                

                int tsetNo = -1;
                string strTset = header.getTSet();

                if (strTset.Equals("997") || strTset.Equals("CONTRL")) // resend 997
                {
                    resend997(header, edm);
                    return;
                }

                tsetNo = getTSetNo(edm, strTset,true);

                // get mapping info
                var OutMap = edm.tblOutboundMappings.Where(s => s.TradingPartnerNo_FK == tradingNo && s.TransactionSetNo_FK == tsetNo).ToList<tblOutboundMapping>();

                // if there is not map, error
                if (OutMap == null || OutMap.Count == 0)
                {
                    Common.writeLog(tradingNo, tsetNo, String.Format("Outbound mapping has not set-up yet"), (int)Common.LOG_TYPE.EDI_ERROR, DateTime.Now, header.getRawDataNo());
                    return;
                }

                // log
                Common.writeLog(tradingNo, tsetNo, "Starting mapping XML data", (int)Common.LOG_TYPE.JOB, DateTime.Now, header.getRawDataNo());

                List<OutboundMapping> lstOutboundMap = new List<OutboundMapping>();
                
                ArrayList lstXMLField = new ArrayList();
                string strOutputFile = "";

                foreach (var row in OutMap)
                {
                    OutboundMapping objMap = new OutboundMapping();
                    int intMapNo = row.OutboundMappingNo;
                    objMap.OutPutFile = row.OutputEDIFilePath;
                    if (!Common.isNullEmptyNothing(row.OutputEDIFilePath))
                        strOutputFile = row.OutputEDIFilePath;

                    // get operator infor
                    var opt = edm.tblOperatorOutboundMappings.Where(s => s.OutboundMappingNo_FK == intMapNo).ToList<tblOperatorOutboundMapping>();
                    if (opt != null && opt.Count > 0)
                    {
                        List<MappingOperator> lstMapOp = new List<MappingOperator>();
                        foreach (var line in opt)
                        {
                            MappingOperator objMapIn = new MappingOperator();
                            objMapIn.OperatorParameter = line.OperatorParameter;
                            objMapIn.OperatorName = getOperator(edm, line.OperatorNo_FK);
                            lstMapOp.Add(objMapIn);
                        }
                        objMap.Operator = lstMapOp;
                    }
                    objMap.Postion = row.Postion;
                    objMap.Value = row.Value;
                    objMap.SegmentName = getSegmentCode(edm, Common.myCInt(row.SegmentNo_FK));
                    objMap.XMLPath = row.XMLPathField;
                    objMap.OutboundMappingNo = row.OutboundMappingNo;
                    objMap.SegmentNumber = row.SegmentNumber;
                    objMap.Note = row.Note; // 5/14/2019 Phuong addded for VDA
                    lstXMLField.Add(row.XMLPathField);
                    lstOutboundMap.Add(objMap);
                }

                // get interchange control num
                int intControlNum = getInterchangeControlNum(edm,false);
                string strEDIData = "";
                int intNumSeg = 0;

                if (strTset.Equals("856") || strTset.Equals("810") || strTset.Equals("850") || strTset.Equals("855")) // X12 856
                {
                    // header data
                    strEDIData = createISAGSSTSegment(edm, trading, strTset, (char)subsegmentSep, (char)segmentSep, intControlNum);
                    // body data
                    strEDIData += createEDISegment(header.getRawData(), (char)subsegmentSep, (char)segmentSep, lstOutboundMap, edm, lstXMLField);
                    string[] arrSeg = strEDIData.Split((char)segmentSep);
                    intNumSeg = arrSeg.Length - 2;
                    // footer data
                    strEDIData += createSEGEIEASegment((char)subsegmentSep, (char)segmentSep, intControlNum, intNumSeg);
                }

                else if (strTset.Equals("DESADV") || strTset.Equals("INVOIC")) // EDI FACT DESADV
                {
                    strEDIData = createUNBUNHSegment(edm, trading, strTset, (char)subsegmentSep, (char)segmentSep, intControlNum);
                    // body data
                    strEDIData += createEDISegment(header.getRawData(), (char)subsegmentSep, (char)segmentSep, lstOutboundMap, edm, lstXMLField);
                    string[] arrSeg = strEDIData.Split((char)segmentSep);
                    intNumSeg = arrSeg.Length - 1;
                    // footer data
                    strEDIData += createUNTUNZSegment((char)subsegmentSep, (char)segmentSep, intControlNum, intNumSeg);
                }

                else if (strTset.Equals("4913")) // VDA 5/14/2019 Phuong addded
                {
                    // header data
                    int intTransMissionNum = getTransmissionControlNum(edm, false);
                    strEDIData = create711Segment(edm, trading, (char)segmentSep, intTransMissionNum);
                    // body data
                    strEDIData += createVDAEDISegment(header.getRawData(), (char)segmentSep, lstOutboundMap, edm, lstXMLField);
                    // footer
                    strEDIData += create719Segment(strEDIData, (char)segmentSep);
                  
                }

                try
                {
                    // Output data
                    File.WriteAllText(Common.makeUniqueFileName(strOutputFile), strEDIData);
                    updateGroupNumber(edm, header.getRawDataNo(), intControlNum.ToString(), intControlNum.ToString());
                    updateEDIRawData(edm, header.getRawDataNo(), strEDIData);
                    Common.writeLog(tradingNo, tsetNo, String.Format("Created file: {0}", strOutputFile), (int)Common.LOG_TYPE.JOB, DateTime.Now, header.getRawDataNo());
                    Common.writeLog(tradingNo, tsetNo, "Mapping XML data is completed", (int)Common.LOG_TYPE.JOB, DateTime.Now, header.getRawDataNo());
                }
                catch (Exception ex)
                {
 
                    Common.writeLog(tradingNo, tsetNo, ex.Message, (int)Common.LOG_TYPE.JOB);
                }

            }
        }

        /// <summary>
        /// Review EDI data for outbound map design
        /// </summary>
        /// <param name="header"></param>
        public ArrayList reviewEDIData(int tradingNo, int tsetNo, int RawDataNo)
        {
            ArrayList arrEDIData = new ArrayList();

           
            // get trading partner infor
            using (var edm = new BHEDI_EDM())
            {

                var trading = edm.tblTradingPartners.Where(s => s.TradingPartnerNo == tradingNo).FirstOrDefault<tblTradingPartner>();

                if (trading == null)
                {
                    return arrEDIData;
                }

                int segmentSep = getSegmentTerminator(edm, trading.SegmentTerminator);
                int subsegmentSep = getSegmentTerminator(edm, trading.DataElementDelimiter);


                string strTset = "";
                var tset = edm.tblEDITransactionSets.Where(s => s.TransactionSetNo == tsetNo).FirstOrDefault<tblEDITransactionSet>();
                if (tset != null)
                    strTset = tset.TransactionSetID;

                // get mapping info
                var OutMap = edm.tblOutboundMappings.Where(s => s.TradingPartnerNo_FK == tradingNo && s.TransactionSetNo_FK == tsetNo).ToList<tblOutboundMapping>();

                // if there is not map, error
                if (OutMap == null || OutMap.Count == 0)
                {
                    return arrEDIData;
                }

                List<OutboundMapping> lstOutboundMap = new List<OutboundMapping>();

                ArrayList lstXMLField = new ArrayList();
                string strOutputFile = "";

                foreach (var row in OutMap)
                {
                    OutboundMapping objMap = new OutboundMapping();
                    int intMapNo = row.OutboundMappingNo;
                    objMap.OutPutFile = row.OutputEDIFilePath;
                    if (!Common.isNullEmptyNothing(row.OutputEDIFilePath))
                        strOutputFile = row.OutputEDIFilePath;

                    // get operator infor
                    var opt = edm.tblOperatorOutboundMappings.Where(s => s.OutboundMappingNo_FK == intMapNo).ToList<tblOperatorOutboundMapping>();
                    if (opt != null && opt.Count > 0)
                    {
                        List<MappingOperator> lstMapOp = new List<MappingOperator>();
                        foreach (var line in opt)
                        {
                            MappingOperator objMapIn = new MappingOperator();
                            objMapIn.OperatorParameter = line.OperatorParameter;
                            objMapIn.OperatorName = getOperator(edm, line.OperatorNo_FK);
                            lstMapOp.Add(objMapIn);
                        }
                        objMap.Operator = lstMapOp;
                    }
                    objMap.Postion = row.Postion;
                    objMap.Value = row.Value;
                    objMap.SegmentName = getSegmentCode(edm, Common.myCInt(row.SegmentNo_FK));
                    objMap.XMLPath = row.XMLPathField;
                    objMap.OutboundMappingNo = row.OutboundMappingNo;
                    objMap.SegmentNumber = row.SegmentNumber;
                    objMap.Note = row.Note; // 5/14/2019 Phuong addded for VDA
                    lstXMLField.Add(row.XMLPathField);
                    lstOutboundMap.Add(objMap);
                }

                var rawData = edm.tblEDITrasactionRawDatas.Where(my => my.TransactionRawDataNo == RawDataNo).FirstOrDefault<tblEDITrasactionRawData>();
                if (rawData == null)
                    return arrEDIData;


                // get interchange control num
                int intControlNum = getInterchangeControlNum(edm,true);

                if (strTset.Equals("856") || strTset.Equals("810") || strTset.Equals("850") || strTset.Equals("855")) // X12 856
                {

                    // header data
                    string strEDIData = createISAGSSTSegment(edm, trading, strTset, (char)subsegmentSep, (char)segmentSep, intControlNum);
                    // body data
                    strEDIData += createEDISegment(rawData.XMLData, (char)subsegmentSep, (char)segmentSep, lstOutboundMap, edm, lstXMLField);
                    string[] arrSeg = strEDIData.Split((char)segmentSep);
                    int intNumSeg = arrSeg.Length - 2;
                    // footer data
                    strEDIData += createSEGEIEASegment((char)subsegmentSep, (char)segmentSep, intControlNum, intNumSeg);
                    arrEDIData.AddRange(strEDIData.Split((char)segmentSep));

                }

                else if (strTset.Equals("DESADV") || strTset.Equals("INVOIC")) // EDI FACT DESADV
                {
                    // header data
                    string strEDIData = createUNBUNHSegment(edm, trading, strTset, (char)subsegmentSep, (char)segmentSep, intControlNum);
                    // body data
                    strEDIData += createEDISegment(rawData.XMLData, (char)subsegmentSep, (char)segmentSep, lstOutboundMap, edm, lstXMLField);
                    string[] arrSeg = strEDIData.Split((char)segmentSep);
                    int intNumSeg = arrSeg.Length - 1;
                    // footer data
                    strEDIData += createUNTUNZSegment((char)subsegmentSep, (char)segmentSep, intControlNum, intNumSeg);
                    arrEDIData.AddRange(strEDIData.Split((char)segmentSep));
               
                }

                else if (strTset.Equals("4913")) // EDI VDA 5/14/2019 Phuong addded
                {
                    // header data
                    int intTransMissionNum = getTransmissionControlNum(edm, true);
                    string strEDIData = create711Segment(edm, trading, (char)segmentSep, intTransMissionNum);
                    // body data
                    strEDIData += createVDAEDISegment(rawData.XMLData,  (char)segmentSep, lstOutboundMap, edm, lstXMLField);
                    strEDIData += create719Segment(strEDIData, (char)segmentSep);

                    arrEDIData.AddRange(strEDIData.Split((char)segmentSep));

                }

            }

            return arrEDIData;
        }

        /// <summary>
        /// Get segment setting 
        /// </summary>
        /// <param name="segment"></param>
        /// <param name="postion"></param>
        /// <param name="inMap"></param>
        /// <returns></returns>
        private InboundMapping getMappingInfor(string segment, int postion, List<InboundMapping> inMap)
        {
            foreach (InboundMapping map in inMap)
            {
                if (map.SegmentName.Equals(segment) && map.Postion == postion)
                    return map;
            }

            return null;
        }

        /// <summary>
        /// Perform operator
        /// </summary>
        /// <param name="strValue"></param>
        /// <param name="lstOpt"></param>
        /// <returns></returns>
        private string performOperator(string strValue, List<MappingOperator> lstOpt, List<MappingVariable> lstVar,bool IsInsert)
        {
            if (lstOpt == null)
                return strValue;
            
            foreach (MappingOperator row in lstOpt)
            {
                if (row.OperatorName.Equals(Common.OPT_ADD_BY))
                    strValue = Common.addBy(strValue, row.OperatorParameter);
                else if (row.OperatorName.Equals(Common.OPT_ADD_BYV))
                    strValue = Common.addByVariable(strValue, row.OperatorParameter);
                else if (row.OperatorName.Equals(Common.OPT_ADDT_LEFT))
                    strValue = Common.addTextOnLeft(strValue, row.OperatorParameter);
                else if (row.OperatorName.Equals(Common.OPT_ADDT_RIGHT))
                    strValue = Common.addTextOnRight(strValue, row.OperatorParameter);
                else if (row.OperatorName.Equals(Common.OPT_ADDV_LEFT))
                {
                    MappingVariable objVar = getMappingVariable(lstVar, row.OperatorParameter);
                    if (objVar != null)
                        strValue = Common.addTextOnLeft(strValue, objVar.VariableValue);
                }
                else if (row.OperatorName.Equals(Common.OPT_ADDV_RIGHT))
                {
                    MappingVariable objVar = getMappingVariable(lstVar, row.OperatorParameter);
                    if (objVar != null)
                        strValue = Common.addTextOnRight(strValue, objVar.VariableValue);
                }
                else if (row.OperatorName.Equals(Common.OPT_BLANK))
                    strValue = "";
                else if (row.OperatorName.Equals(Common.OPT_CONV_D1))
                    strValue = Common.convertDate1(strValue);
                else if (row.OperatorName.Equals(Common.OPT_CONV_D2))
                    strValue = Common.convertDate2(strValue);
                else if (row.OperatorName.Equals(Common.OPT_CONV_D3))
                    strValue = Common.convertDate3(strValue);
                else if (row.OperatorName.Equals(Common.OPT_CONV_D4))
                    strValue = Common.convertDate4(strValue);
                else if (row.OperatorName.Equals(Common.OPT_CONV_D5))
                    strValue = Common.convertDate4(strValue);
                else if (row.OperatorName.Equals(Common.OPT_CONV_D6))
                    strValue = Common.convertDate5(strValue);
                else if (row.OperatorName.Equals(Common.OPT_CONV_D7))
                    strValue = Common.convertDate6(strValue);
                else if (row.OperatorName.Equals(Common.OPT_CONV_D8))
                    strValue = Common.convertDate7(strValue);
                else if (row.OperatorName.Equals(Common.OPT_CONV_D9))
                    strValue = Common.convertDate8(strValue);
                else if (row.OperatorName.Equals(Common.OPT_CONV_D10))
                    strValue = Common.convertDate9(strValue);
                else if (row.OperatorName.Equals(Common.OPT_CONV_D11))
                    strValue = Common.convertDate10(strValue);
                else if (row.OperatorName.Equals(Common.OPT_CONV_D12))
                    strValue = Common.convertDate11(strValue);
                else if (row.OperatorName.Equals(Common.OPT_CONV_D13))
                    strValue = Common.convertDate12(strValue);
                else if (row.OperatorName.Equals(Common.OPT_CONV_D14))
                    strValue = Common.convertDate13(strValue);
                else if (row.OperatorName.Equals(Common.OPT_CONV_D15))
                    strValue = Common.convertDate14(strValue);
                else if (row.OperatorName.Equals(Common.OPT_CONV_D16))
                    strValue = Common.convertDate16(strValue);
                else if (row.OperatorName.Equals(Common.OPT_CREATE_KEY))
                {
                    if (IsInsert)
                        strValue = Guid.NewGuid().ToString();

                }
                else if (row.OperatorName.Equals(Common.OPT_DIV_BY))
                    strValue = Common.divBy(strValue, row.OperatorParameter);
                else if (row.OperatorName.Equals(Common.OPT_DIV_BYV))
                    strValue = Common.divByVariable(strValue, row.OperatorParameter);

                else if (row.OperatorName.Equals(Common.OPT_DONOT1))
                {
                    if (strValue.Equals(""))
                        strValue = "";
                }
                else if (row.OperatorName.Equals(Common.OPT_DONOT2))
                {
                    if (strValue.Equals("0"))
                        strValue = "";
                }
                else if (row.OperatorName.Equals(Common.OPT_LOWERCASE))
                    strValue = strValue.ToLower();
                else if (row.OperatorName.Equals(Common.OPT_MUL_BY))
                    strValue = Common.mulBy(strValue, row.OperatorParameter);
                else if (row.OperatorName.Equals(Common.OPT_MUL_BYV))
                    strValue = Common.mulByVariable(strValue, row.OperatorParameter);

                else if (row.OperatorName.Equals(Common.OPT_PAY_LEFT))
                    strValue = Common.padleftBy(strValue, row.OperatorParameter);
                else if (row.OperatorName.Equals(Common.OPT_PAY_RIGHT))
                    strValue = Common.padRightBy(strValue, row.OperatorParameter);
                else if (row.OperatorName.Equals(Common.OPT_REP_BY))
                    strValue = Common.replaceBy(strValue, row.OperatorParameter);
                else if (row.OperatorName.Equals(Common.OPT_STORE))
                {
                    if (!Common.isNullEmptyNothing(row.OperatorParameter))
                    {
                        MappingVariable objVar = getMappingVariable(lstVar, row.OperatorParameter);
                        if (objVar == null)
                        {

                            objVar = new MappingVariable();
                            objVar.VariableName = row.OperatorParameter;
                            objVar.VariableValue = strValue;
                            lstVar.Add(objVar);
                        }
                        else
                            objVar.VariableValue = strValue;
                    }

                }
                else if (row.OperatorName.Equals(Common.OPT_SUB_BY))
                    strValue = Common.subBy(strValue, row.OperatorParameter);
                else if (row.OperatorName.Equals(Common.OPT_SUB_BYV))
                    strValue = Common.subByVariable(strValue, row.OperatorParameter);

                else if (row.OperatorName.Equals(Common.OPT_SUBST))
                    strValue = Common.substringBy(strValue, row.OperatorParameter);
                else if (row.OperatorName.Equals(Common.OPT_TRIM))
                    strValue = strValue.Trim();
                else if (row.OperatorName.Equals(Common.OPT_UPCASE))
                    strValue = strValue.ToUpper();
                else if (row.OperatorName.Equals(Common.OPT_GETD))
                    strValue = Common.getDate(strValue);
                else if (row.OperatorName.Equals(Common.OPT_GETT))
                    strValue = Common.getTime(strValue);

                else if (row.OperatorName.Equals(Common.OPT_GETDNOW))
                    strValue = Common.getDateNow();
                else if (row.OperatorName.Equals(Common.OPT_GETTNOW))
                    strValue = Common.getTimeNow();
                else if (row.OperatorName.Equals(Common.OPT_GETTSNOW))
                    strValue = Common.getTimeSecondNow();
                else if (row.OperatorName.Equals(Common.OPT_SPLIT))
                    strValue = Common.splitstringBy(strValue, row.OperatorParameter);

                else if (row.OperatorName.Equals(Common.OPT_CLEAR_VAR))
                {
                    if (!Common.isNullEmptyNothing(row.OperatorParameter))
                    {
                        MappingVariable objVar = getMappingVariable(lstVar, row.OperatorParameter);
                        if (objVar != null)
                        {
                            objVar.VariableValue = "";
                        }
                    }

                }
                else if (row.OperatorName.Equals(Common.OPT_CONV_DEC))
                    strValue = Common.convertToDecimal(strValue, row.OperatorParameter);

                else if (row.OperatorName.Equals(Common.OPT_GETTIMEZONE))
                {
                    strValue = Common.getTimeZoneCode(row.OperatorParameter);

                }
            }
            return strValue;
        }

        /// <summary>
        /// get variable by name
        /// </summary>
        /// <param name="lstVar"></param>
        /// <param name="varName"></param>
        /// <returns></returns>
        private MappingVariable getMappingVariable(List<MappingVariable> lstVar,string varName)
        {
            foreach (MappingVariable row in lstVar)
            {
                if (row.VariableName.Equals(varName))
                    return row;
            }
            return null;
        }

        /// <summary>
        /// create table key 
        /// </summary>
        /// <param name="tablename"></param>
        /// <param name="inMap"></param>
        /// <param name="lstVar"></param>
        /// <param name="arrField"></param>
        /// <param name="arrValue"></param>
        private void createTableKey(string tablename, List<InboundMapping> inMap, List<MappingVariable> lstVar, ArrayList arrField, ArrayList arrValue, bool isInsert)
        {
            string strValue = "";
            foreach (InboundMapping map in inMap)
            {
                // all setting related to this table that does not has segment name
                if (Common.isNullEmptyNothing(map.TableName))
                    continue;
                if (Common.isNullEmptyNothing(map.SegmentName) && map.TableName.Equals(tablename))
                {
                    strValue = "";
                    strValue = performOperator(strValue, map.Operator, lstVar,isInsert);
                    if (!Common.isNullEmptyNothing(map.FieldName) && !arrField.Contains(map.FieldName))
                    {
                        arrField.Add(map.FieldName);
                        arrValue.Add(strValue);
                    }
                }
            }
        }

        /// <summary>
        /// Create INSERT SQL
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="arrField"></param>
        /// <param name="arrValue"></param>
        /// <param name="isInsert"></param>
        /// <returns></returns>
        private string createInsertSQL(string tableName, ArrayList arrField, ArrayList arrValue,BHEDI_EDM edm,bool IsInsert)
        {
            string strSQL = "";

            if (IsInsert) // make INSERT statement
            {

                strSQL = "INSERT INTO " + tableName + "(";
                // field
                foreach (string str in arrField)
                {
                    strSQL = strSQL + str + ",";
                }
                strSQL = strSQL.Substring(0, strSQL.Length - 1) + ") ";
                strSQL = strSQL + "VALUES(";

                // get all columns and type
                var allCols = from meta in edm.MetadataWorkspace.GetItems(System.Data.Metadata.Edm.DataSpace.CSpace)
                           .Where(m => m.BuiltInTypeKind == System.Data.Metadata.Edm.BuiltInTypeKind.EntityType)
                              from p in (meta as System.Data.Metadata.Edm.EntityType).Properties
                                 .Where(p => p.DeclaringType.Name == tableName)
                              select new
                              {
                                  PropertyName = p.Name,
                                  TypeUsageName = p.TypeUsage.EdmType.Name
                              };

                int i = 0;
                bool isStringOrDateType = false;
                foreach (string str in arrField)
                {
                    // string or datetime add single quote
                    isStringOrDateType = false;

                    foreach (var col in allCols)
                    {
                        if (col.PropertyName.Equals(str))
                        {
                            if (col.TypeUsageName.ToLower().Equals("string") || col.TypeUsageName.ToLower().Equals("datetime") || col.TypeUsageName.ToLower().Equals("date"))
                            {
                                isStringOrDateType = true;
                            }
                            break;
                        }
                    }

                    if (isStringOrDateType)
                        strSQL = strSQL + "'" + arrValue[i] + "'" + ",";
                    else
                        strSQL = strSQL + arrValue[i] + ",";
                    i++;
                }

                strSQL = strSQL.Substring(0, strSQL.Length - 1) + ")";
            }

            else // make UPDATE statement
            {
                strSQL = "UPDATE " + tableName + " SET ";

                // get all columns and type
                var allCols = from meta in edm.MetadataWorkspace.GetItems(System.Data.Metadata.Edm.DataSpace.CSpace)
                           .Where(m => m.BuiltInTypeKind == System.Data.Metadata.Edm.BuiltInTypeKind.EntityType)
                              from p in (meta as System.Data.Metadata.Edm.EntityType).Properties
                                 .Where(p => p.DeclaringType.Name == tableName)
                              select new
                              {
                                  PropertyName = p.Name,
                                  TypeUsageName = p.TypeUsage.EdmType.Name
                              };

                int i = 0;
                bool isStringOrDateType = false;
                foreach (string str in arrField)
                {

                    strSQL = strSQL + str + "=";

                    // string or datetime add single quote
                    isStringOrDateType = false;

                    foreach (var col in allCols)
                    {
                        if (col.PropertyName.Equals(str))
                        {
                            if (col.TypeUsageName.ToLower().Equals("string") || col.TypeUsageName.ToLower().Equals("datetime") || col.TypeUsageName.ToLower().Equals("date"))
                            {
                                isStringOrDateType = true;
                            }
                            break;
                        }
                    }

                    if (isStringOrDateType)
                        strSQL = strSQL + "'" + arrValue[i] + "'" + ",";
                    else
                        strSQL = strSQL + arrValue[i] + ",";
                    i++;
                }

                strSQL = strSQL.Substring(0, strSQL.Length - 1) + " WHERE " + arrField[arrField.Count - 1] + "='" + arrValue[arrValue.Count - 1] + "'";

            }


            return strSQL;
        }

        /// <summary>
        /// Get interchange control number
        /// </summary>
        /// <param name="edm"></param>
        /// <param name="isPadLeft"></param>
        /// <returns></returns>
        private int getInterchangeControlNum(BHEDI_EDM edm, bool isView)
        {
            int intControlNum = 0;
            var interCont = edm.tblInterchangeControlNumbers.FirstOrDefault<tblInterchangeControlNumber>();
            if (interCont == null)
            {
                var newObj = new tblInterchangeControlNumber();
                newObj.InterchangeControlNumber = 1;
                edm.AddTotblInterchangeControlNumbers(newObj);
                edm.SaveChanges();
                intControlNum = 1;
            }
            else
            {
                intControlNum = interCont.InterchangeControlNumber + 1;
                if (intControlNum > MAX_CONTROL_NUM) // reset control num
                    intControlNum = 1;

                if (!isView)
                {
                    interCont.InterchangeControlNumber = intControlNum;
                    edm.SaveChanges();
                }
            }

            return intControlNum;
        }

        /// <summary>
        /// Create ISA, GS and ST segment
        /// </summary>
        /// <param name="trad"></param>
        /// <param name="strTSet"></param>
        /// <returns></returns>
        private string createISAGSSTSegment(BHEDI_EDM edm, tblTradingPartner trad, string strTSet, char chrElement, char chrSegment, int intControlNum)
        {

            bool blnIsGSYear4 = Common.myCBool(trad.blnIsGSYear4);
            if (!blnIsGSYear4)
            {
                if (Common.EDI_GSYEAR4_ID_LIST.Contains(trad.InterchangeSenderID) && Common.EDI_GSYEAR4_TRAN_LIST.Contains(strTSet))
                    blnIsGSYear4 = true;
            }
            // ISA segment
            string strSegment = "ISA";
            strSegment += chrElement + "00" + chrElement + Common.getString("", 10, false, false) + chrElement + "00" + chrElement + Common.getString("", 10, false, false);
            strSegment += chrElement + Common.getString(trad.InterchangeReceiverIDQual, 2, false, false) + chrElement + Common.getString(trad.InterchangeReceiverID, 15, false, false);
            strSegment += chrElement + Common.getString(trad.InterchangeSenderIDQual,2,false,false) + chrElement + Common.getString(trad.InterchangeSenderID, 15, false, false);
            strSegment += chrElement + Common.convertDate5(DateTime.Now.ToShortDateString()) + chrElement + Common.convertDate14(DateTime.Now.ToString("HH:mm"));
            strSegment += chrElement + getSegmentTerminatorName(edm,Common.myCInt(trad.RepetitionSep)) + chrElement + Common.getString(trad.InterchangeVersion, 5, false, false);
            string strControlNum = Common.myCStr(intControlNum);
            if (strControlNum.Length < 9)
                strControlNum = strControlNum.PadLeft(9, '0');
            strSegment += chrElement + strControlNum + chrElement + '0' + chrElement + (trad.TestIndicator ? "T" : "P") + chrElement + getSegmentTerminatorName(edm, Common.myCInt(trad.SubElementSep));

            strSegment += chrSegment;

            // GS segment
            strSegment += "GS" + chrElement + getFunctionGroup(edm,strTSet) + chrElement;

            strSegment += trad.ApplicationReceiverCode + chrElement + trad.ApplicationSenderCode + chrElement + (blnIsGSYear4 ? Common.convertDate4(DateTime.Now.ToShortDateString()) : Common.convertDate5(DateTime.Now.ToShortDateString())) + chrElement + DateTime.Now.ToString("HHmm");
            strSegment += chrElement + intControlNum.ToString() + chrElement + (Common.isNullEmptyNothing(trad.ResponsibleAgencyCode) ? "X" : trad.ResponsibleAgencyCode) + chrElement + getEDIVersionName(edm, trad.StandardVersion);
            strSegment += chrSegment;

            // ST segment
            strSegment += "ST" + chrElement + strTSet + chrElement + strControlNum;//Common.DEFAULT_TRANSACTION_ID
            strSegment += chrSegment;

            return strSegment;
        }

        /// <summary>
        /// Create SE, GE and IEA segment
        /// </summary>
        /// <param name="chrElement"></param>
        /// <param name="chrSegment"></param>
        /// <param name="intControlNum"></param>
        /// <returns></returns>
        private string createSEGEIEASegment(char chrElement, char chrSegment, int intControlNum, int numSeg)
        {
            string strControlNum = Common.myCStr(intControlNum);
            if (strControlNum.Length < 9)
                strControlNum = strControlNum.PadLeft(9, '0');

            // SE segment
            string strSegment = "SE";
            strSegment += chrElement + numSeg.ToString() + chrElement + strControlNum /*Common.DEFAULT_TRANSACTION_ID*/ + chrSegment;
            
            // GE segment
            strSegment += "GE" + chrElement + "1" + chrElement + Common.myCStr(intControlNum) + chrSegment;

            // IEA segment
           
            strSegment += "IEA" + chrElement + "1" + chrElement + strControlNum + chrSegment;
  
         
            return strSegment;
        }

        /// <summary>
        /// Create UNB, UNH
        /// </summary>
        /// <param name="trad"></param>
        /// <param name="strTSet"></param>
        /// <returns></returns>
        private string createUNBUNHSegment(BHEDI_EDM edm, tblTradingPartner trad, string strTSet, char chrElement, char chrSegment, int intControlNum)
        {
            char chrSubElent = (char)getSegmentTerminator(edm, trad.SubElementSep);

            // UNB segment
            string strSegment = "UNB";
            strSegment += chrElement + trad.InterchangeVersion + chrElement + trad.InterchangeReceiverID + (Common.isNullEmptyNothing(trad.InterchangeReceiverIDQual) || trad.InterchangeReceiverIDQual.Equals(" ") ? "" : chrSubElent + trad.InterchangeReceiverIDQual);
            strSegment += chrElement + trad.InterchangeSenderID + (Common.isNullEmptyNothing(trad.InterchangeSenderIDQual) || trad.InterchangeSenderIDQual.Equals(" ") ? "" : chrSubElent + trad.InterchangeSenderIDQual);
            strSegment += chrElement + Common.convertDate5(DateTime.Now.ToShortDateString()) + chrSubElent + Common.convertDate14(DateTime.Now.ToString("HH:mm")) + chrElement + intControlNum.ToString() + chrSegment;
            string strControlNum = Common.myCStr(intControlNum);
            if (strControlNum.Length < 9)
                strControlNum = strControlNum.PadLeft(9, '0');
            // UNH segment
            string strVersion = getEDIVersionName(edm, trad.StandardVersion);
            strSegment += "UNH" + chrElement + strControlNum + chrElement + getFunctionGroup(edm, strTSet) + chrSubElent + strVersion.Substring(0, 1) + chrSubElent + strVersion.Substring(1) + chrSubElent + trad.ResponsibleAgencyCode + chrSegment;

            return strSegment;
        }


        /// <summary>
        /// Create UNT, UNZ segment
        /// </summary>
        /// <param name="chrElement"></param>
        /// <param name="chrSegment"></param>
        /// <param name="intControlNum"></param>
        /// <returns></returns>
        private string createUNTUNZSegment(char chrElement, char chrSegment, int intControlNum, int numSeg)
        {

            // SE segment
            string strControlNum = Common.myCStr(intControlNum);
            if (strControlNum.Length < 9)
                strControlNum = strControlNum.PadLeft(9, '0');
            string strSegment = "UNT";
            strSegment += chrElement + numSeg.ToString() + chrElement + strControlNum + chrSegment;
            strSegment += "UNZ" + chrElement + "1" + chrElement + intControlNum.ToString() + chrSegment;

            return strSegment;
        }

        /// <summary>
        /// Create Outbound EDI Segment
        /// </summary>
        /// <param name="strXMLData"></param>
        /// <param name="chrElement"></param>
        /// <param name="chrSegment"></param>
        /// <param name="outMap"></param>
        /// <param name="edm"></param>
        /// <returns></returns>
        private string createEDISegment(string strXMLData, char chrElement, char chrSegment, List<OutboundMapping> outMap, BHEDI_EDM edm, ArrayList lstXMLField)
        {
            List<MappingVariable> lstVar = new List<MappingVariable>();
            string strSegment = "";
            string strTmpSegment = "";
            // read and create XML data
            List<XMLNode> lstXML = new List<XMLNode>();
            string strLast = "";
            int intPostion = 0;
            string strValue = "";
            bool blnDonotIfBlank = false;
            bool blnIsAdded = false;
            using (XmlReader reader = XmlReader.Create(new StringReader(strXMLData)))
            {
                while (reader.Read())
                {
                    reader.MoveToContent();

                    switch (reader.NodeType)
                    {
                        case XmlNodeType.Element:
                            if (lstXMLField.Contains(reader.Name)) // only get XML field that set-up in outbound
                                strLast = reader.Name;
                            blnIsAdded = false;
                            break;
                        case XmlNodeType.Text:
                            if (!strLast.Equals(""))
                            {
                                XMLNode node = new XMLNode();
                                node.NodeName = strLast;
                                node.NodeValue = reader.Value;
                                lstXML.Add(node);
                                strLast = "";
                                blnIsAdded = true;
                            }
                            break;
                        case XmlNodeType.EndElement: // add element where value is blank. prevent use old value
                            if (!blnIsAdded && !strLast.Equals(""))
                            {
                                XMLNode node = new XMLNode();
                                node.NodeName = strLast;
                                node.NodeValue = "";
                                lstXML.Add(node);
                                strLast = "";
                            }
                            break;
                    }
                }
            }

            // save all XML data. Using when one XML field can map multiple element
            List<XMLNode> lstXMLOrg = lstXML.ToList<XMLNode>();

            // loop on XML data and create EDI data
            while (lstXML.Count > 0)
            {
                XMLNode node = lstXML[0];
                lstXML.Remove(node);

                // get all outbound setting related to XML field
                foreach (OutboundMapping map in outMap)
                {
                    if (Common.isNullEmptyNothing(map.XMLPath))
                        continue;

                    if (map.XMLPath.Equals(node.NodeName))
                    {
                        // segment name
                        strTmpSegment = map.SegmentName;

                        // get all setting relating to this segment                         
                        List<OutboundMapping> currentMap = getCurrentOutboundSetting(outMap, map);

                        // begin map XML data
                        if (currentMap.Count > 0)
                        {
                            // sort by postion
                            currentMap.Sort();
                            intPostion = 1;
                            foreach (OutboundMapping curr in currentMap)
                            {
                                // get value
                                strValue = curr.Value;
                                if (!Common.isNullEmptyNothing(curr.XMLPath))
                                {
                                    // get value from XML
                                    if (node.NodeName.Equals(curr.XMLPath))
                                        strValue = node.NodeValue;
                                    else
                                        strValue = getNodeValue(curr.XMLPath, lstXML);
                                    if (Common.isNullEmptyNothing(strValue)) // one field map to multile segment
                                    {
                                        // check to see how many node
                                        int qr_cnt = Common.myCInt(lstXMLOrg.Count(my => my.NodeName == curr.XMLPath));

                                        if (qr_cnt == 1) // if only one node 
                                        {

                                            // get data from original buffer
                                            var qr = lstXMLOrg.Where(my => my.NodeName == curr.XMLPath).LastOrDefault<XMLNode>(); // change first to last to prevent use old value
                                            if (qr != null)
                                                strValue = qr.NodeValue;
                                        }
                                    }
                                }
                           
                               // perform operator
                                strValue = performOperator(strValue, curr.Operator, lstVar,true);
                                // find do nothing if blank operator
                                blnDonotIfBlank = false;
                                if (curr.Operator != null)
                                {
                                    foreach (MappingOperator op in curr.Operator)
                                    {
                                        if (op.OperatorName.Equals(Common.OPT_DONOT1) || op.OperatorName.Equals(Common.OPT_DONOT2))
                                        {
                                            blnDonotIfBlank = true;
                                            break;
                                        }
                                    }
                                }
                                // create segment
                                // mising element
                                while (intPostion < curr.Postion)
                                {
                                    strTmpSegment += chrElement + "";
                                    
                                    intPostion++;
                                }

                                if (!blnDonotIfBlank || !strValue.Equals(""))
                                    strTmpSegment += chrElement + strValue;
                                intPostion ++;

                            }

                            // 7/18/2022 Phuong added
                            strTmpSegment = removeSegmentSeparateFromRight(strTmpSegment, chrElement);
                            strTmpSegment += chrSegment; // end of segment
                        }

                        // do not generate if there is no data
                        if (!strTmpSegment.Equals(map.SegmentName+chrSegment))
                            strSegment += strTmpSegment;

                        break;
                    }

                   
                }
            }

            return strSegment;
        }

        /// <summary>
        /// Remove segment seperator charater from right
        /// </summary>
        /// <param name="strSegment"></param>
        /// <param name="chrElement"></param>
        /// <returns></returns>
        private string removeSegmentSeparateFromRight(string strSegment, char chrElement)
        {
            string strRet = strSegment;
            try
            {
                int i = strRet.Length-1;
                
                while (strRet[i] == chrElement)
                {
                    strRet = strRet.Remove(i, 1);
                    i = strRet.Length - 1;
                }
           
                
            }
            catch
            {
                return strSegment;
            }
            return strRet;
        }

        /// <summary>
        /// get node value and remove
        /// </summary>
        /// <param name="strName"></param>
        /// <param name="lstXML"></param>
        /// <returns></returns>
        private string getNodeValue(string strName, List<XMLNode> lstXML)
        {
            string strValue = "";
            foreach (XMLNode node in lstXML)
            {
                if (node.NodeName.Equals(strName))
                {
                    strValue = node.NodeValue;
                    lstXML.Remove(node);
                    break;
                }
            }
            return strValue;
        }

        /// <summary>
        /// get outbound setting for currect EDI segment
        /// </summary>
        /// <param name="outMap"></param>
        /// <param name="map"></param>
        /// <returns></returns>
        private List<OutboundMapping> getCurrentOutboundSetting(List<OutboundMapping> outMap, OutboundMapping map)
        {
        //    List<OutboundMapping> curr = new List<OutboundMapping>();

        //    // find position
        //    int intMapNo = map.OutboundMappingNo;
        //    int intPos = outMap.FindIndex(my => my.OutboundMappingNo == intMapNo);

        //    // find back from postion
        //    int intBack = intPos - 1;
        //    while (intBack >= 0)
        //    {
        //        OutboundMapping objBack = outMap[intBack];
        //        if (objBack.SegmentName.Equals(map.SegmentName) && objBack.SegmentNumber == map.SegmentNumber)
        //        {
        //            curr.Add(objBack);
        //        }
        //        else
        //            break; // stop

        //        intBack--;
        //    }

        //    // find forward from postion
        //    int intForward = intPos;
        //    while (intForward < outMap.Count)
        //    {
        //        OutboundMapping objForw = outMap[intForward];
        //        if (objForw.SegmentName.Equals(map.SegmentName) && objForw.SegmentNumber == map.SegmentNumber)
        //        {
        //            curr.Add(objForw);
        //        }
        //        else
        //            break; // stop

        //        intForward ++;

        //    }
        //    return curr;
        //

            return outMap.Where(my => my.SegmentName == map.SegmentName && my.SegmentNumber == map.SegmentNumber).ToList<OutboundMapping>();
        }

        /// <summary>
        /// Get function group
        /// </summary>
        /// <param name="edm"></param>
        /// <param name="strTSet"></param>
        /// <returns></returns>
        private string getFunctionGroup(BHEDI_EDM edm,string strTSet)
        {
            string str = "";
            var qr = edm.tblEDITransactionStructures.Where(my => my.TransactionSetID == strTSet).FirstOrDefault<tblEDITransactionStructure>();
            if (qr != null)
                str = qr.FunctionGroup;
            return str;
        }

        /// <summary>
        /// Create 997 with Ak1 and Ak9 only
        /// </summary>
        /// <param name="header"></param>
        /// <param name="strTrailerTSet"></param>
        /// <param name="strTrailerControlNum"></param>
        /// <param name="AK901"></param>
        /// <param name="numTrans"></param>
        /// <param name="numReceived"></param>
        /// <param name="numAccepted"></param>
        /// <returns></returns>
        public string create997_AK1_AK9(EDIHeader header,string AK901,int numTrans,int numReceived, int numAccepted)
        {
            string strEDIData = "";

            using (var edm = new BHEDI_EDM())
            {
                var trading = getTradingByEDIHeader(edm, header);
                
                if (trading == null)
                {
                    return "";
                }

                int tradingNo = trading.TradingPartnerNo;
                int segmentSep = getSegmentTerminator(edm, trading.SegmentTerminator);
                int subsegmentSep = getSegmentTerminator(edm, trading.DataElementDelimiter);


                int intControlNum = getInterchangeControlNum(edm, false);
                string strInterchangeNum = intControlNum.ToString();
                if (strInterchangeNum.Length < 9)
                    strInterchangeNum = strInterchangeNum.PadLeft(9, '0');

                // update header
                string strCheckGroupControlNum = header.getGroupControlNum();
                string strCheckInterchangeNum = header.getInterchangeNum();

                header.setInterchangeNum(strInterchangeNum);
                header.setGroupControlNum(intControlNum.ToString());

                // header data
                strEDIData = createISAGSSTSegment(edm, trading, "997", (char)subsegmentSep, (char)segmentSep, intControlNum);
                // body data
                strEDIData += "AK1" + (char)subsegmentSep + getFunctionGroup(edm, header.getTSet()) + (char)subsegmentSep + strCheckGroupControlNum + (char)segmentSep;
                strEDIData += "AK9" + (char)subsegmentSep + AK901 + (char)subsegmentSep + numTrans.ToString() + (char)subsegmentSep + numReceived.ToString()
                                              + (char)subsegmentSep + numAccepted.ToString() + (char)segmentSep;                                    
                string[] arrSeg = strEDIData.Split((char)segmentSep);
                int intNumSeg = arrSeg.Length - 2;
                // footer data
                strEDIData += createSEGEIEASegment((char)subsegmentSep, (char)segmentSep, intControlNum, intNumSeg);

            }

            return strEDIData;
        }

        /// <summary>
        /// Create 997 with Ak1 and Ak9 only
        /// </summary>
        /// <param name="header"></param>
        /// <param name="strTrailerTSet"></param>
        /// <param name="strTrailerControlNum"></param>
        /// <param name="AK901"></param>
        /// <param name="numTrans"></param>
        /// <param name="numReceived"></param>
        /// <param name="numAccepted"></param>
        /// <returns></returns>
        public string create997_AK1_AK2_AK5_AK9(EDIHeader header, string AK901, int numTrans, int numReceived, int numAccepted,List<EDITranslator.T997Set> lst997)
        {
            string strEDIData = "";
            string strAK2Ak5Data = "";

            using (var edm = new BHEDI_EDM())
            {
                var trading = getTradingByEDIHeader(edm, header);

                if (trading == null)
                {
                    return "";
                }

                int tradingNo = trading.TradingPartnerNo;
                int segmentSep = getSegmentTerminator(edm, trading.SegmentTerminator);
                int subsegmentSep = getSegmentTerminator(edm, trading.DataElementDelimiter);

                // create AK2-AK5 first because of change interchange number
                foreach (T997Set t997 in lst997)
                {
                    strAK2Ak5Data += "AK2" + (char)subsegmentSep + t997.header.getTSet() + (char)subsegmentSep + t997.header.getInterchangeNum() + (char)segmentSep;
                    strAK2Ak5Data += "AK5" + (char)subsegmentSep + t997.strCheckStatus;
                    if (t997.intErrorCode != 0)
                        strAK2Ak5Data += (char)subsegmentSep + t997.intErrorCode.ToString();
                    strAK2Ak5Data += (char)segmentSep;
                }

                int intControlNum = getInterchangeControlNum(edm, false);
                string strInterchangeNum = intControlNum.ToString();
                if (strInterchangeNum.Length < 9)
                    strInterchangeNum = strInterchangeNum.PadLeft(9, '0');

                // update header
                string strCheckGroupControlNum = header.getGroupControlNum();
                string strCheckInterchangeNum = header.getInterchangeNum();

                header.setInterchangeNum(strInterchangeNum);
                header.setGroupControlNum(intControlNum.ToString());

                // header data
                strEDIData = createISAGSSTSegment(edm, trading, "997", (char)subsegmentSep, (char)segmentSep, intControlNum);
                // body data
                strEDIData += "AK1" + (char)subsegmentSep + getFunctionGroup(edm, header.getTSet()) + (char)subsegmentSep + strCheckGroupControlNum + (char)segmentSep;
                strEDIData += strAK2Ak5Data;
                strEDIData += "AK9" + (char)subsegmentSep + AK901 + (char)subsegmentSep + numTrans.ToString() + (char)subsegmentSep + numReceived.ToString()
                                              + (char)subsegmentSep + numAccepted.ToString() + (char)segmentSep;
                string[] arrSeg = strEDIData.Split((char)segmentSep);
                int intNumSeg = arrSeg.Length - 2;
                // footer data
                strEDIData += createSEGEIEASegment((char)subsegmentSep, (char)segmentSep, intControlNum, intNumSeg);

            }

            return strEDIData;
        }

        /// <summary>
        /// Create CONTROL EDIFACT
        /// </summary>
        /// <param name="header"></param>
        /// <param name="AK901"></param>
        /// <returns></returns>
        public string createCONTROL_general(EDIHeader header, string AK901)
        {
            string strEDIData = "";

            using (var edm = new BHEDI_EDM())
            {
                var trading = getTradingByEDIHeader(edm, header);

                if (trading == null)
                {
                    return "";
                }

                int tradingNo = trading.TradingPartnerNo;
                int segmentSep = getSegmentTerminator(edm, trading.SegmentTerminator);
                int subsegmentSep = getSegmentTerminator(edm, trading.DataElementDelimiter);


                int intControlNum = getInterchangeControlNum(edm, false);
                string strInterchangeNum = intControlNum.ToString();
                if (strInterchangeNum.Length < 9)
                    strInterchangeNum = strInterchangeNum.PadLeft(9, '0');

                // update header
                string strCheckGroupControlNum = header.getGroupControlNum();
                string strCheckInterchangeNum = header.getInterchangeNum();

                header.setInterchangeNum(strInterchangeNum);
                header.setGroupControlNum(intControlNum.ToString());

                // header data
                strEDIData = createUNBUNHSegment(edm, trading, "CONTRL", (char)subsegmentSep, (char)segmentSep, intControlNum);
                
                // body data
                strEDIData += "UCI" + (char)subsegmentSep + strCheckGroupControlNum + (char)subsegmentSep +
                            header.getSenderID() + (Common.isNullEmptyNothing(header.getSenderQual()) || header.getSenderQual().Equals(" ") ? "" : header.getSubElementSeparator() + header.getSenderQual())
                            + (char)subsegmentSep + header.getReceiverID() + (Common.isNullEmptyNothing(header.getRereiverQual()) || header.getRereiverQual().Equals(" ") ? "" : header.getSubElementSeparator() + header.getRereiverQual())
                            + (char)subsegmentSep + AK901
                            + (char)segmentSep;

                string strVersion = header.getControlVersion();

                strEDIData += "UCM" + (char)subsegmentSep + strCheckInterchangeNum + (char)subsegmentSep + header.getTSet() + header.getSubElementSeparator() + strVersion.Substring(0, 1)
                            + header.getSubElementSeparator() + strVersion.Substring(1) + header.getSubElementSeparator() + header.getAgencyCode()
                            + (char)subsegmentSep + AK901
                            + (char)segmentSep;

                string[] arrSeg = strEDIData.Split((char)segmentSep);
                int intNumSeg = arrSeg.Length - 1;
                // footer data
                strEDIData += createUNTUNZSegment((char)subsegmentSep, (char)segmentSep, intControlNum, intNumSeg);

            }

            return strEDIData;
        }

        /// <summary>
        /// General EDI data check
        /// </summary>
        /// <param name="header"></param>
        /// <returns></returns>
        public string generalEDICheck(EDIHeader header)
        {
            EDIError err = new EDIError();

            using (var edm = new BHEDI_EDM())
            {

                var trading = getTradingByEDIHeader(edm, header);

                if (trading == null)
                {
                    return EDIError.AK901_A;
                }

                int tradingNo = trading.TradingPartnerNo;
                // 11/03/2017 Phuong changed: Get segment separate character from EDI . Not from trading partner setting
                char segmentSep = (char)getSegmentTerminator(edm, trading.SegmentTerminator);
                char dataSep = (char)getSegmentTerminator(edm, trading.DataElementDelimiter);
                if (!Common.isNullEmptyNothing(header.getElementSeparator()))
                    segmentSep = header.getElementSeparator()[0];
                if (!Common.isNullEmptyNothing(header.getDataElementSeparator()))
                    dataSep = header.getDataElementSeparator()[0];


                int tsetNo = -1;
                string strTset = header.getTSet();
                tsetNo = getTSetNo(edm, strTset,false);

                // Init EDI structure for checking
                string strVersion = getEDIVersionName(edm,trading.StandardVersion);
                err.getEDISegmentStructure(strVersion, strTset, header.getRawData(), dataSep, segmentSep, tradingNo, tsetNo,header.getRawDataNo(),header.checkIsX12Format(),header.checkIsVDAFormat());

                var qr = (
                          from er in edm.tblTradingPartnerErrorHandings
                          join hd in edm.tblErrorHandles on er.ErrorHandleNo_FK equals hd.ErrorHandleNo
                          where er.TradingPartnerNo_FK == tradingNo && er.TransactionSetNo_FK == tsetNo
                          select new 
                          {
                            ErrorHandleCode = hd.ErrorHandleCode
                          }).FirstOrDefault();

                int intCheckType = (int)Common.ERROR_CHECK_TYPE.CHECK_ALL;

                if (qr != null)
                    intCheckType = qr.ErrorHandleCode;

                if (intCheckType != (int)Common.ERROR_CHECK_TYPE.DO_NOT)
                {
                    if (header.checkIsX12Format()) // X12 format check
                        return err.generalCheck(header.getTransactionDateTime(), intCheckType);
                    else if (header.checkIsVDAFormat()) // Do not check VDA format 
                        return EDIError.AK901_A;
                    else // EDI FACT format check 
                        return err.generalCheck_EDIFACT(header.getTransactionDateTime(), intCheckType);
                }
                    

            }
            return EDIError.AK901_A;
        }

        /// <summary>
        /// update group control number and interchange number
        /// </summary>
        /// <param name="rawNo"></param>
        /// <param name="groupNum"></param>
        /// <param name="interchangeNum"></param>
        private void updateGroupNumber(BHEDI_EDM edm,int rawNo, string groupNum, string interchangeNum)
        {
            var qr = edm.tblEDITrasactionRawDatas.Where(my => my.TransactionRawDataNo == rawNo).FirstOrDefault<tblEDITrasactionRawData>();
            if (qr != null)
            {
                qr.GroupControlNum = groupNum;
                if (interchangeNum.Length < 9)
                    interchangeNum = interchangeNum.PadLeft(9, '0');
                qr.InterchangeControlNum = interchangeNum;
                qr.TransactionKey = interchangeNum;
                edm.SaveChanges();
            }
            
        }

        /// <summary>
        /// Update ASN raw data
        /// </summary>
        /// <param name="rawNo"></param>
        /// <param name="strEDI"></param>
        private void updateEDIRawData(BHEDI_EDM edm, int rawNo, string strEDI)
        {
            var qr = edm.tblEDITrasactionRawDatas.Where(my => my.TransactionRawDataNo == rawNo).FirstOrDefault<tblEDITrasactionRawData>();
            if (qr != null)
            {
                qr.RawData = strEDI;
                edm.SaveChanges();
            }

        }

        /// <summary>
        /// check double commit db after read
        /// </summary>
        /// <param name="strSegment"></param>
        /// <param name="inMap"></param>
        /// <param name="intPos"></param>
        /// <returns></returns>
        private bool checkAnotherCommitPosition(string[] strSegment, List<InboundMapping> inMap, int intPos,InboundMapping currentMap)
        {
            for (int i = intPos + 1; i < strSegment.Length; i++)
            {
                InboundMapping map = getMappingInfor(strSegment[0], i, inMap);
                if (map != null)
                {
                    if (map.CommitDB && map.TableName.Equals(currentMap.TableName))
                        return true;
                }
                
            }
                return false;
        }

        /// <summary>
        /// Resend 997 
        /// </summary>
        /// <param name="header"></param>
        /// <param name="edm"></param>
        private void resend997(XMLHeader header,BHEDI_EDM edm)
        {
            try
            {
                string strPath = "";
                var qr = edm.tblInboundOutboundSettings.Where(my => my.InOut == true && my.SettingName == "997").FirstOrDefault<tblInboundOutboundSetting>();
                if (qr != null)
                    strPath = qr.Path;
                else
                    strPath = Common.VAN_PATH;

                var trading = getTradingByXMLHeader(edm, header);
                if (trading != null)
                {
                    if (!Common.isNullEmptyNothing(trading.Output997FilePath))
                        strPath = trading.Output997FilePath;
                }

                string strFileName = "";
                if (strPath.Substring(strPath.Length - 1).Equals("\\"))
                    strFileName = strPath + header.getAppSenderID() + "_997_" + DateTime.Now.ToString("MMddyyyy_HHmmss.fff") + ".edi";
                else
                    strFileName = strPath + "\\" + header.getAppSenderID() + "_997_" + DateTime.Now.ToString("MMddyyyy_HHmmss.fff") + ".edi";

                int intNo = header.getRawDataNo();
                var qr2 = edm.tblEDITrasactionRawDatas.Where(my => my.TransactionRawDataNo == intNo).FirstOrDefault<tblEDITrasactionRawData>();
                if (qr2 != null)
                    File.WriteAllText(strFileName, qr2.RawData);
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
            }
        }

        /// <summary>
        ///  Remove UNA segment from EDI FACT data
        /// </summary>
        /// <param name="strEDI"></param>
        /// <returns></returns>
        private string removeUNASegment(string strEDI)
        {
            string strRes = strEDI;
            // change DTM+51+19980101 to DTM+51:19980101 to help the mapping task is more easy
            int intPos = strEDI.IndexOf("UNB");
            if (intPos >= 0 && !strEDI.Contains("ST*142*"))
                strRes = strEDI.Substring(intPos);
            // 9/19/2018 Phuong added for PIERBURG EDI send ' [element separate char] and New Line together
            return strRes.Replace("+51+", "+51:").Replace("+52+", "+52:").Replace("'" + System.Environment.NewLine, "'");

        }

        /// <summary>
        /// Put Qty segment before dtm segment such as QTY DTM DTM for EDI Fact
        /// </summary>
        /// <param name="arrAllSegment"></param>
        private void autoSortDTMQTYSegment(string[] arrAllSegment)
        {
            // remove control character
            for (int i = 0; i < arrAllSegment.Length - 3; i++)
            {

                if (arrAllSegment[i].Substring(0, 3).Equals("DTM") && arrAllSegment[i + 1].Substring(0, 3).Equals("DTM") && arrAllSegment[i + 2].Substring(0, 3).Equals("QTY"))
                {
                    // swap data
                    string strTemp = arrAllSegment[i];
                    arrAllSegment[i] = arrAllSegment[i + 2];
                    arrAllSegment[i + 2] = strTemp;
                }

            }
        }

        /// <summary>
        /// Auto Forward EDI data to trading partner
        /// </summary>
        /// <param name="edm"></param>
        /// <param name="header"></param>
        public void autoForwardData(BHEDI_EDM edm,EDIHeader header)
        {
            try
            {
                // get trading information
                var trading = getTradingByEDIHeader(edm, header);
                if (trading == null)
                    return;

                int tradingNo = trading.TradingPartnerNo;
                char segmentSep = (char)getSegmentTerminator(edm, trading.SegmentTerminator);
                char dataSep = (char)getSegmentTerminator(edm, trading.DataElementDelimiter);

                // get transaction info
                int tsetNo = -1;
                string strTset = header.getTSet();
                tsetNo = getTSetNo(edm, strTset,false);
                int copyTradingNo = 0;
                
                // sender id
                bool isX12 = header.checkIsX12Format();

                string strSenderIDQualOrg = trading.InterchangeSenderIDQual + (char)dataSep;
                string strSenderIDOrg = isX12 ?  trading.InterchangeSenderID.PadRight(15, ' ') :  trading.InterchangeSenderID;

                string strSenderIDQual = trading.InterchangeReceiverIDQual + (char)dataSep;
                string strSenderID = isX12 ?  trading.InterchangeReceiverID.PadRight(15, ' ') :  trading.InterchangeReceiverID;

                string strReceiverID = "";
                string strReceiverIDQual = "";
                string strRawData = header.getRawData();

                // output path
                string strPath = "";
                var qr = edm.tblInboundOutboundSettings.Where(my => my.InOut == true && my.SettingName == "997").FirstOrDefault<tblInboundOutboundSetting>();
                if (qr != null)
                    strPath = qr.Path;
                else
                    strPath = Common.VAN_PATH;

                string strFileName = "";

                // get list of auto foraward trading partner
                int indexFile = 0;

                foreach (tblTradingPartnerAutoCopy autoTrading in edm.tblTradingPartnerAutoCopies.Where(r => r.TradingPartnerNo_FK == tradingNo && r.TransactionSetNo_FK == tsetNo).ToList())
                {
                    copyTradingNo = autoTrading.TradingPartnerNo_AutoCopy_FK;

                    var copyTrading = edm.tblTradingPartners.Where(s => s.TradingPartnerNo == copyTradingNo).FirstOrDefault<tblTradingPartner>();
                    
                    // 3/12/2019 Phuong added copy ID from trading partner setting
                    bool blnCopyFromIDFromTrading = Common.myCBool(autoTrading.blnCopyIDFromTradingPartner);

                    if (copyTrading != null)
                    {
                        indexFile++;

                        if (!blnCopyFromIDFromTrading)
                        { // standard EDI mode
                            strReceiverIDQual = copyTrading.InterchangeSenderIDQual + (char)dataSep;
                            strReceiverID = isX12 ?  copyTrading.InterchangeSenderID.PadRight(15, ' ') :  copyTrading.InterchangeSenderID;
                        
                            // create file name
                            if (!Common.isNullEmptyNothing(copyTrading.Output997FilePath))
                                strPath = copyTrading.Output997FilePath;

                            if (strPath.Substring(strPath.Length - 1).Equals("\\"))
                                strFileName = strPath + strSenderID.Trim() + "_" + strTset + "_" + DateTime.Now.ToString("MMddyyyy_HHmmss.fff") + "_" + indexFile + ".edi";
                            else
                                strFileName = strPath + "\\" + strSenderID.Trim() + "_" + strTset + "_" + DateTime.Now.ToString("MMddyyyy_HHmmss.fff") + "_" + indexFile + ".edi";


                            // from raw data, change sender id and receive id at ISA segment data
                            strRawData = header.getRawData();
                            strRawData = strRawData.Replace(strSenderIDQual +  strSenderID,strReceiverIDQual + strReceiverID);
                            strRawData = strRawData.Replace(strSenderIDQualOrg + strSenderIDOrg,strSenderIDQual + strSenderID);

                             // 10/8/2022 Phuong added  Phuong added for EIF the LF separator is changed by VAN
                            if (Common.EDI_ID_NO_LF_SEPARATOR_LIST.Contains(strReceiverID.Trim()))
                            {
                                strRawData = System.Text.RegularExpressions.Regex.Replace(strRawData, @"\r\n?|\n", Common.myCStr(EDI_STANDARD_ELEMENT_SEP));
                               
                            }
                            // output 
                            File.WriteAllText(strFileName, strRawData);

                            Common.writeLog(tradingNo, tsetNo, String.Format("Auto forwared {0} data from {1} to {2} file: {3}", strTset, trading.TradingPartnerName, copyTrading.TradingPartnerName, strFileName), (int)Common.LOG_TYPE.JOB, DateTime.Now, header.getRawDataNo());

                        }
                        // copy from trading partner setting
                        else
                        {
                            // original
                            strSenderIDQualOrg = trading.InterchangeSenderIDQual + (char)dataSep;
                            strSenderIDOrg = isX12 ? trading.InterchangeSenderID.PadRight(15, ' ') : trading.InterchangeSenderID;
                            string strSenderAppIDOrg = trading.ApplicationSenderCode;
                            string strReceiverIDQualOrg = trading.InterchangeReceiverIDQual + (char)dataSep;
                            string strReceiverIDOrg = isX12 ? trading.InterchangeReceiverID.PadRight(15, ' ') : trading.InterchangeReceiverID;
                            string strReceiveAppIDOrg = trading.ApplicationReceiverCode;
                            
                            // copy
                            string strSenderIDQualCopy = copyTrading.InterchangeSenderIDQual + (char)dataSep;
                            string strSenderIDCopy = isX12 ? copyTrading.InterchangeSenderID.PadRight(15, ' ') : copyTrading.InterchangeSenderID;
                            string strSenderAppIDCopy = copyTrading.ApplicationSenderCode;
                            string strReceiverIDQualCopy = copyTrading.InterchangeReceiverIDQual + (char)dataSep;
                            string strReceiverIDCopy = isX12 ? copyTrading.InterchangeReceiverID.PadRight(15, ' ') : copyTrading.InterchangeReceiverID;
                            string strReceiveAppIDCopy = copyTrading.ApplicationReceiverCode;

                            // create file name
                            if (!Common.isNullEmptyNothing(copyTrading.Output997FilePath))
                                strPath = copyTrading.Output997FilePath;

                            if (strPath.Substring(strPath.Length - 1).Equals("\\"))
                                strFileName = strPath + strSenderID.Trim() + "_" + strTset + "_" + DateTime.Now.ToString("MMddyyyy_HHmmss.fff") + "_" + indexFile + ".edi";
                            else
                                strFileName = strPath + "\\" + strSenderID.Trim() + "_" + strTset + "_" + DateTime.Now.ToString("MMddyyyy_HHmmss.fff") + "_" + indexFile + ".edi";

                            // from raw data, change sender id and receive id at ISA segment data
                            strRawData = header.getRawData();
                            strRawData = System.Text.RegularExpressions.Regex.Replace(strRawData, @"\r\n?|\n", Common.myCStr(segmentSep));
                            string[] strRawDataArr = strRawData.Split(segmentSep);
                            strRawDataArr[0] = strRawDataArr[0].Replace(strReceiverIDQualOrg + strReceiverIDOrg, strSenderIDQualCopy + strSenderIDCopy);
                            strRawDataArr[0] = strRawDataArr[0].Replace(strSenderIDQualOrg + strSenderIDOrg, strReceiverIDQualCopy + strReceiverIDCopy);
                            strRawDataArr[1] = strRawDataArr[1].Replace(strReceiveAppIDOrg, strSenderAppIDCopy);
                            strRawDataArr[1] = strRawDataArr[1].Replace(strSenderAppIDOrg, strReceiveAppIDCopy);

                            // output
                            strRawData = "";
                            foreach (string st in strRawDataArr)
                            {
                                if (strRawData.Equals(""))
                                    strRawData += st;
                                else
                                    strRawData += (char)segmentSep + st;
                            }
                            //strRawData = strRawData.Substring(0, strRawData.Length - 1);

                            // 10/8/2022 Phuong added  Phuong added for EIF the LF separator is changed by VAN
                            if (Common.EDI_ID_NO_LF_SEPARATOR_LIST.Contains(strSenderIDCopy.Trim()) || Common.EDI_ID_NO_LF_SEPARATOR_LIST.Contains(strReceiverIDCopy.Trim()))
                            {
                                strRawData = System.Text.RegularExpressions.Regex.Replace(strRawData, @"\r\n?|\n", Common.myCStr(EDI_STANDARD_ELEMENT_SEP));
                            }
                            File.WriteAllText(strFileName, strRawData);

                            Common.writeLog(tradingNo, tsetNo, String.Format("Auto forwared {0} data from {1} to {2} file: {3}", strTset, trading.TradingPartnerName, copyTrading.TradingPartnerName, strFileName), (int)Common.LOG_TYPE.JOB, DateTime.Now, header.getRawDataNo());


                        
                        }
                    }

                }


            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
            }
        }

        /// <summary>
        /// Get transmission control number for VDA
        /// </summary>
        /// <param name="edm"></param>
        /// <param name="isPadLeft"></param>
        /// <returns></returns>
        private int getTransmissionControlNum(BHEDI_EDM edm, bool isView)
        {
            int intControlNum = 0;
            var interCont = edm.tblTransmissionControlNumbers.FirstOrDefault<tblTransmissionControlNumber>();
            if (interCont == null)
            {
                var newObj = new tblTransmissionControlNumber();
                newObj.TransmissionNumber = 1;
                edm.AddTotblTransmissionControlNumbers(newObj);
                edm.SaveChanges();
                intControlNum = 1;
            }
            else
            {
                intControlNum = interCont.TransmissionNumber + 1;
                if (intControlNum > MAX_TRANSMISSION_NUM) // reset control num
                    intControlNum = 1;

                if (!isView)
                {
                    interCont.TransmissionNumber = intControlNum;
                    edm.SaveChanges();
                }
            }

            return intControlNum;
        }

        /// <summary>
        /// Create VDA 711 Sgement
        /// </summary>
        /// <param name="trad"></param>
        /// <param name="strTSet"></param>
        /// <returns></returns>
        private string create711Segment(BHEDI_EDM edm, tblTradingPartner trad, char chrSegment, int intControlNum)
        {

            // ISA segment
            string strSegment = "711";
            // version 03 - sender id - receive id
            strSegment += "03" + Common.getString(trad.InterchangeSenderID, 9, false, false) + Common.getString(trad.InterchangeReceiverID, 9, false, false);


            // transmission old number
            int intOldControlNum = intControlNum - 1;

            string strOldControlNum = Common.myCStr(intOldControlNum);
            if (strOldControlNum.Length < 5)
                strOldControlNum = strOldControlNum.PadLeft(5, '0');
            strSegment += strOldControlNum;

            // transmission new number
            string strControlNum = Common.myCStr(intControlNum);

            if (strControlNum.Length < 5)
                strControlNum = strControlNum.PadLeft(5, '0');
            strSegment += strControlNum;

            // transmission date
            strSegment += DateTime.Now.ToString("yyMMdd");
            // add space to make 128 length
            strSegment = strSegment.PadRight(VDA_SEGMENT_LENGTH, ' ');
            
            strSegment += chrSegment;

            return strSegment;
        }


        /// <summary>
        /// Create Outbound VDA EDI Segment
        /// </summary>
        /// <param name="strXMLData"></param>
        /// <param name="chrElement"></param>
        /// <param name="chrSegment"></param>
        /// <param name="outMap"></param>
        /// <param name="edm"></param>
        /// <returns></returns>
        private string createVDAEDISegment(string strXMLData, char chrSegment, List<OutboundMapping> outMap, BHEDI_EDM edm, ArrayList lstXMLField)
        {
            List<MappingVariable> lstVar = new List<MappingVariable>();
            string strSegment = "";
            string strTmpSegment = "";
            // read and create XML data
            List<XMLNode> lstXML = new List<XMLNode>();
            string strLast = "";
            int intPostion = 0;
            string strValue = "";
            bool blnDonotIfBlank = false;
            bool blnIsAdded = false;
            using (XmlReader reader = XmlReader.Create(new StringReader(strXMLData)))
            {
                while (reader.Read())
                {
                    reader.MoveToContent();

                    switch (reader.NodeType)
                    {
                        case XmlNodeType.Element:
                            if (lstXMLField.Contains(reader.Name)) // only get XML field that set-up in outbound
                                strLast = reader.Name;
                            blnIsAdded = false;
                            break;
                        case XmlNodeType.Text:
                            if (!strLast.Equals(""))
                            {
                                XMLNode node = new XMLNode();
                                node.NodeName = strLast;
                                node.NodeValue = reader.Value;
                                lstXML.Add(node);
                                strLast = "";
                                blnIsAdded = true;
                            }
                            break;
                        case XmlNodeType.EndElement: // add element where value is blank. prevent use old value
                            if (!blnIsAdded && !strLast.Equals(""))
                            {
                                XMLNode node = new XMLNode();
                                node.NodeName = strLast;
                                node.NodeValue = "";
                                lstXML.Add(node);
                                strLast = "";
                            }
                            break;
                    }
                }
            }

            // save all XML data. Using when one XML field can map multiple element
            List<XMLNode> lstXMLOrg = lstXML.ToList<XMLNode>();

            // loop on XML data and create EDI data
            while (lstXML.Count > 0)
            {
                XMLNode node = lstXML[0];
                lstXML.Remove(node);

                // get all outbound setting related to XML field
                foreach (OutboundMapping map in outMap)
                {
                    if (Common.isNullEmptyNothing(map.XMLPath))
                        continue;

                    if (map.XMLPath.Equals(node.NodeName))
                    {
                        // segment name
                        strTmpSegment = map.SegmentName;

                        // get all setting relating to this segment                         
                        List<OutboundMapping> currentMap = getCurrentOutboundSetting(outMap, map);

                        // begin map XML data
                        if (currentMap.Count > 0)
                        {
                            // sort by postion
                            currentMap.Sort();
                            intPostion = 3;
                            foreach (OutboundMapping curr in currentMap)
                            {
                                // get value
                                strValue = curr.Value;
                                if (!Common.isNullEmptyNothing(curr.XMLPath))
                                {
                                    // get value from XML
                                    if (node.NodeName.Equals(curr.XMLPath))
                                        strValue = node.NodeValue;
                                    else
                                        strValue = getNodeValue(curr.XMLPath, lstXML);
                                    if (Common.isNullEmptyNothing(strValue)) // one field map to multile segment
                                    {
                                        // check to see how many node
                                        int qr_cnt = Common.myCInt(lstXMLOrg.Count(my => my.NodeName == curr.XMLPath));

                                        if (qr_cnt == 1) // if only one node 
                                        {

                                            // get data from original buffer
                                            var qr = lstXMLOrg.Where(my => my.NodeName == curr.XMLPath).LastOrDefault<XMLNode>(); // change first to last to prevent use old value
                                            if (qr != null)
                                                strValue = qr.NodeValue;
                                        }
                                    }
                                }

                                // perform operator
                                strValue = performOperator(strValue, curr.Operator, lstVar, true);
                                // find do nothing if blank operator
                                blnDonotIfBlank = false;
                                if (curr.Operator != null)
                                {
                                    foreach (MappingOperator op in curr.Operator)
                                    {
                                        if (op.OperatorName.Equals(Common.OPT_DONOT1) || op.OperatorName.Equals(Common.OPT_DONOT2))
                                        {
                                            blnDonotIfBlank = true;
                                            break;
                                        }
                                    }
                                }
                                // create segment
                                // mising element
                                while (intPostion < curr.Postion)
                                {
                                    strTmpSegment +=  " ";
                                    intPostion++;
                                }

                                if (!blnDonotIfBlank || !strValue.Equals(""))
                                {
                                    int intFieldLen = Common.myCInt(curr.Note);
                                    if (intFieldLen > 0)
                                    {
                                        if (strValue.Length > intFieldLen)
                                            strValue = strValue.Substring(0, intFieldLen);
                                        else
                                            strValue = strValue.PadRight(intFieldLen, ' ');

                                    }
                                    strTmpSegment += strValue;
                                }
                                intPostion = curr.Postion + strValue.Length;

                            }

                            strTmpSegment = strTmpSegment.PadRight(VDA_SEGMENT_LENGTH,' ') +  chrSegment; // end of segment
                        }

                        // do not generate if there is no data
                        if (!strTmpSegment.Equals(map.SegmentName + chrSegment))
                            strSegment += strTmpSegment;

                        break;
                    }


                }
            }

            return strSegment;
        }

        /// <summary>
        /// Create VDA 719 Sgement
        /// </summary>
        /// <param name="strEDIData"></param>
        /// <returns></returns>
        private string create719Segment(string strEDIData, char chrSegment)
        {

            string strSegment = "719";
            // version 02
            strSegment += "02" ;
            // Number of records of type 711
            int intNum = Common.countOccurences("711", strEDIData);
            string strNum = Common.myCStr(intNum);
            if (strNum.Length < 7)
                strNum = strNum.PadLeft(7, '0');
            strSegment += strNum;

            // Number of records of type 712 
            intNum = Common.countOccurences("712", strEDIData);
            strNum = Common.myCStr(intNum);
            if (strNum.Length < 7)
                strNum = strNum.PadLeft(7, '0');
            strSegment += strNum;

            // Number of records of type 713 
            intNum = Common.countOccurences("713", strEDIData);
            strNum = Common.myCStr(intNum);
            if (strNum.Length < 7)
                strNum = strNum.PadLeft(7, '0');
            strSegment += strNum;

            // Number of records of type 714 
            intNum = Common.countOccurences("714", strEDIData);
            strNum = Common.myCStr(intNum);
            if (strNum.Length < 7)
                strNum = strNum.PadLeft(7, '0');
            strSegment += strNum;

            // Number of records of type 715 
            intNum = Common.countOccurences("715", strEDIData);
            strNum = Common.myCStr(intNum);
            if (strNum.Length < 7)
                strNum = strNum.PadLeft(7, '0');
            strSegment += strNum;

            // Number of records of type 716 
            intNum = Common.countOccurences("716", strEDIData);
            strNum = Common.myCStr(intNum);
            if (strNum.Length < 7)
                strNum = strNum.PadLeft(7, '0');
            strSegment += strNum;

            // Number of records of type 718 
            intNum = Common.countOccurences("718", strEDIData);
            strNum = Common.myCStr(intNum);
            if (strNum.Length < 7)
                strNum = strNum.PadLeft(7, '0');
            strSegment += strNum;

            // Number of records of type 719 
            intNum = 1;
            strNum = Common.myCStr(intNum);
            if (strNum.Length < 7)
                strNum = strNum.PadLeft(7, '0');
            strSegment += strNum;

            // Number of records of type 717 
            intNum = Common.countOccurences("717", strEDIData);
            strNum = Common.myCStr(intNum);
            if (strNum.Length < 7)
                strNum = strNum.PadLeft(7, '0');
            strSegment += strNum;


            strSegment = strSegment.PadRight(VDA_SEGMENT_LENGTH, ' ') + chrSegment;

            return strSegment;
        }

    }
}


    
