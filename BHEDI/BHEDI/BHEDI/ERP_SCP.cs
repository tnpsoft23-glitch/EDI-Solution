using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Collections;


namespace BHEDI
{
    /// <summary>
    /// SCP / SAP ERP System Data Interface
    /// </summary>
    public class ERP_SCP
    {
        /// <summary>
        /// Define SCP In 856 column data index
        /// </summary>
        private readonly int NumberColumns856 = 50;
       
        private readonly int TransactionSetPurposeCode = 0;
        private readonly int ShipmentNumber = 1;
        private readonly int ShipDate = 2;
        private readonly int ShipTime = 3;
        private readonly int EstimateDeliDate = 4;
        private readonly int EstimateDeliTime = 5;
        private readonly int CustomerID = 6;
        private readonly int ShiptoIDQual = 7;
        private readonly int ShiptoID = 8;
        private readonly int BOLNum = 9;
        private readonly int SCACCode = 10;
        private readonly int TransMode = 11;
        private readonly int LocationQual = 12;
        private readonly int LocationID = 13;
        private readonly int EquipCode = 14;
        private readonly int ReferenceNumber = 15;
        private readonly int ProNum = 16;
        private readonly int IdentificationCodePlantQual = 17;
        private readonly int IdentificationCodePlant = 18;
        private readonly int ShipFromIDQual = 19;
        private readonly int ShipFromID = 20;
        private readonly int SupplierIDQual = 21;
        private readonly int SupplierID = 22;
        private readonly int MI_IDQual = 23;
        private readonly int MI_ID = 24;
        private readonly int ShipmentMethodOfPayment = 25;
        private readonly int ItemAssignedID = 26;
        private readonly int CustomerPartID = 27;
        private readonly int DrawingRevision = 28;
        private readonly int VendorPart = 29;
        private readonly int ShippedQty = 30;
        private readonly int MeasurementCode = 31;
        private readonly int ReleaseNumber = 32;
        private readonly int CustomerPO = 33;
        private readonly int OrderNumber = 34;
        private readonly int ShipRequestDate = 35;
        private readonly int TotalContainerQty = 36;
        private readonly int PalletPkgCode = 37;
        private readonly int PalletSerialNum = 38;
        private readonly int PalletWeight = 39;
        private readonly int CompositeUnit = 40;
        private readonly int ContainerPkgCode = 41;
        private readonly int ContainerSerialNum = 42;
        private readonly int LotNum = 43;
        private readonly int ContainerWeight = 44;
        private readonly int ContainerQty = 45;
        private readonly int QtyShipToDate = 46;
        private readonly int LidPackageCode = 47;
        private readonly int PackageCost = 48;
        private readonly int AETCNumber = 49;



        private readonly string NoPalletSerialRequireIDList = "MFJ,OM7,MRI,MRE,OTIGROUPIN05,OTIGROUPGE01,OTIGROUPMX01,OTIGROUPSLP05";
        private readonly string MatinreadIDList = "MFJ,OM7,MRI,MRE";
        private readonly string ChryslerID1 = "04000";
        private readonly string ChryslerID2 = "PSAP";
        private readonly string ChryslerSupplierID1 = "18982A";
        private readonly string ChryslerShipFromID1 = "18982C";

        // Chrysler Container ID
        // Returnable
        private readonly string ChryslerRetPalletID = "CP4845SP";
        private readonly string ChryslerRetLidID = "CP4845VL";
        private readonly string ChryslerRetContID = "CT241509";
        private readonly string ChryslerExpPalletID = "00000EXP";
        private readonly string ChryslerExpLidID = "00000EXP";
        private readonly string ChryslerExpContID = "00000EXP";

        // For 810 Column
        private readonly int NumberColumns810 = 23;
        private readonly int CustomerID810 = 0;
        private readonly int InvoiceNumber810 = 1;
        private readonly int InvoiceDate810 = 2;
        private readonly int InvoiceTime810 = 3;
        private readonly int ShipmentCode810 = 4;
        private readonly int CreateDate810 = 5;
        private readonly int CreateTime810 = 6;
        private readonly int ShipDate810 = 7;
        private readonly int ShipTime810 = 8;
        private readonly int ShiptoIDQual810 = 9;
        private readonly int ShiptoID810 = 10;
        private readonly int SupplierIDQual810 = 11;
        private readonly int SupplierID810 = 12;
        private readonly int CurrencyCode810 = 13;
        private readonly int ItemAssignedID810 = 14;
        private readonly int ItemCodeQualifier810 = 15;
        private readonly int ItemCode810 = 16;
        private readonly int MeasurementCode810 = 17;
        private readonly int QuantityInvoice810 = 18;
        private readonly int UnitPrice810 = 19;
        private readonly int CustomerPO810 = 20;
        private readonly int OrderNumber810 = 21;
        private readonly int PackageCost810 = 22;
        private readonly int ERPSAP = 1; // EKK SAP
        private readonly int ERPUVI = 2; // UVI ERP
        
#region Export Data to SAP 
        /// <summary>
        /// 830 CSV Header Column for EKK SAP
        /// </summary>
        private string str830Header = "ReleaseNumber_H,ReleaseDate,Tr_Set,Ref_Id,Schedule Type_Qual,Plan_date_fr,Plan_date_to,CustomerPO_H,Dtm_Qual,Dtm_Cr_Dt,Dtm_Cr_Tm"
            + ",CustomerName,CustomerID,ShipfrID_H_Qual,ShipfoID_H,ShiptoID_H_Qual,ShiptoID_H,SupplierID_H_Qual,SupplierID_H,SupplierContact,PlantID_H_Qual,PlantID_H,"
            + "Buyer_Name_H,PlIssueID_H_Qual,PlIssueID_H,BilltoID_H_Qual,BilltoID_H,Location_Qual,Location_Id,ReleaseNumber_L,CustomerPartID,CustomerPO_L,PartDescription,"
            + "Eng_change,Vendpart_Id,Contract_Id,HC_Id,MF_Id,RC_Id,LineItem_ID,Base_Unit,Unit_Price,Unit_Price_Code,Price_Id_Code,Price_Code,DK_ref_Num,DP_ref_Num,"
            + "HS_ref_Num,LF_ref_Num,RL_ref_Num,ShiptoID_L_Qual,ShiptoID_L_Qual,Buyer_Name_L,Expeditor_Name_L,CommuEX,CommuFX,CommuTE,SDP,SDP_T_Code,OrderNumber,LastShipmentNum,"
            + "LastShipmentDate,LastShipmentQty,CUMQty,CUMDateStart,CUMDateEnd,ShipRequestDate,OrderQty,OrderType,Forcast_Type_Qual";

        /// <summary>
        /// 830 CSV Header Column for UVI ERP
        /// </summary>
        private string str830Header2 = "Release_Date,Release_Number,Data_Type,Transaction_Purpose_Code,Horizon_Start_Date,Horizon_End_Date,Ship_To_Code,Ship_From_Code,"
            + "Item_ID,PO_Number,Ship_Pattern_Code,Ship_Pattern_Time_Code,Order_Qty,Forecast_Qualifier,Forecast_Timing_Qualifier,Date_Period_Start,Last_Receive_Qty,"
            + "Last_Ship_Date,Last_Shipment_Number,Total_Receive_Qty,Begin_Inventory_Date";

        /// <summary>
        /// Export 830 data to SCP / SAP system
        /// </summary>
        /// <param name="header"></param>
        /// <param name="edm"></param>
        public void export830(int intEDIRawNo,BHEDI_EDM edm)
        {
            try
            {

                if (Common.SCP_OUT.Equals(""))
                    return;

                var tbEDI = edm.tblEDITrasactionRawDatas.Where(s => s.TransactionRawDataNo == intEDIRawNo).FirstOrDefault<tblEDITrasactionRawData>();

                if (tbEDI == null)
                    return;

                int intTradingNo = tbEDI.TradingPartnerNo_FK;
                int intTsetNo = tbEDI.TransactionSetNo_FK;

                var tbTrading = edm.tblTradingPartners.Where(s => s.TradingPartnerNo == intTradingNo).FirstOrDefault<tblTradingPartner>();
                if (tbTrading == null)
                    return;


                string strSenderID = tbTrading.InterchangeSenderID.Replace("-830","");
                string strReceiverID = tbTrading.InterchangeReceiverID.Replace("-830", "");
                string strGSSenderID = tbTrading.ApplicationSenderCode;
                string strGSControlNum = tbEDI.GroupControlNum;
                string strISAControlNum = tbEDI.InterchangeControlNum;
                string strTransSetControlNum = tbEDI.TransactionKey;
                int intERPType = Common.myCInt(tbTrading.ERPNo_FK); // ERP Type 

                string strSAPPath = tbTrading.SCPFolder;
                if (Common.isNullEmptyNothing(strSAPPath))
                    strSAPPath = Common.SCP_OUT;
                else
                    strSAPPath = strSAPPath + "OUT\\";

                var query = from tb in edm.tblEDI_830_HEADER
                            where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                    && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                    && tb.TransSetControlNum == strTransSetControlNum 
                            orderby tb.NO descending 
                            select tb;

                var tb830 = query.FirstOrDefault<tblEDI_830_HEADER>();
                if (tb830 == null)
                {
                    
                    return;
                }
                string HdrKey = tb830.HdrKey;

                ArrayList arrHdrKey = new ArrayList();
                arrHdrKey.Add(HdrKey);

                // get another data from one set 860 that contains multiple transaction
                DateTime dtSubmitDateTime = Common.myCDate(tb830.SubmitDateTime);
                DateTime dtGenerateDateTime = Common.myCDate(tb830.GeneratedDateTime);
                int intNo = tb830.NO;
                var query2 = from tb in edm.tblEDI_830_HEADER
                             where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                     && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                     && tb.TransSetControlNum != strTransSetControlNum && tb.SubmitDateTime == dtSubmitDateTime && tb.GeneratedDateTime == dtGenerateDateTime
                                    
                                    
                             select tb;

                var tbList830 = query2.ToList<tblEDI_830_HEADER>();
                foreach (tblEDI_830_HEADER tb in tbList830)
                {
                    arrHdrKey.Add(tb.HdrKey);
                }

                // loop on list of data
                foreach (string stKey in arrHdrKey)
                {
                    using (var sp = new BHEDI_SPTableAdapters.s_Export_830TableAdapter())
                    {
                        // set command time out
                        sp.SetCommandTimeout(0);
                        BHEDI_SP.s_Export_830DataTable dt = new BHEDI_SP.s_Export_830DataTable();
                        // run store procedure and return data table
                        sp.Fill(dt, stKey);
                        // create csv file
                        string strFileName = strSAPPath + "830_" + DateTime.Now.ToString("MMddyyyy_HHmmssfff") + ".csv";
                        string strData = "";

                        if (intERPType == 2)
                        {

                            File.WriteAllText(strFileName, str830Header2); // UVI ERP
                            foreach (BHEDI_SP.s_Export_830Row dr in dt)
                            {
                                strData += Environment.NewLine + dr.SubmitDateTime.ToString("MM/dd/yyyy HH:mm") + "," + dr.ReleaseNumber + "," + "830" + "," + (dr.TransSetPurpose.Equals("00") ? "Original" : "Replace")
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.ForecastHorizonDateStart) == 0 ? "" : dr.ForecastHorizonDateStart.ToString("MM/dd/yyyy"))
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.ForecastHorizonEndDate) == 0 ? "" : dr.ForecastHorizonEndDate.ToString("MM/dd/yyyy"))
                                    + "," + dr.ST_Code + "," + dr.SF_Code + "," + dr.BuyersPartID + "," + dr.l_PONum + "," + dr.ShipPatternCode + "," + dr.ShipPatternTimeCode
                                    + "," + dr.FstQty + "," + getForecastQualifier(dr.ForecastQualOrg) + "," + getForecastTimmingQualifier(dr.ForecastTimeQual)
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.DatePeriodStart) == 0 ? "" : dr.DatePeriodStart.ToString("MM/dd/yyyy"))
                                    + "," + dr.ShipQty + "," + (DateTime.Compare(Common.MIN_DATE, dr.BegInventoryDate) == 0 ? "" : dr.BegInventoryDate.ToString("MM/dd/yyyy"))
                                    + "," + dr.LastShipNum + "," + +dr.CUMQty
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.EndInventoryDate) == 0 ? "" : dr.EndInventoryDate.ToString("MM/dd/yyyy"));
                            }
                        }
                        else
                        {
                            File.WriteAllText(strFileName, str830Header); // EKK SAP
                            foreach (BHEDI_SP.s_Export_830Row dr in dt)
                            {
                                strData += Environment.NewLine + dr.ReleaseNumber + "," + dr.SubmitDateTime.ToString("MM/dd/yyyy HH:mm") + "," + dr.TransSetPurpose
                                    + "," + dr.ReferenceID + "," + dr.ScheduleTypeQual + "," + (DateTime.Compare(Common.MIN_DATE, dr.ForecastHorizonDateStart) == 0 ? "" : dr.ForecastHorizonDateStart.ToString("MM/dd/yyyy"))
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.ForecastHorizonEndDate) == 0 ? "" : dr.ForecastHorizonEndDate.ToString("MM/dd/yyyy")) + "," + dr.PONum + "," + dr.dtm_Qualifier
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.dtm_dtmDate) == 0 ? "" : dr.dtm_dtmDate.ToString("MM/dd/yyyy")) + "," + (DateTime.Compare(Common.MIN_DATE, dr.dtm_dtmDate) == 0 ? "" : Common.getHourMinFromDateTime(dr.dtm_dtmDate)) + "," + dr.TradingPartnerName + "," + dr.ISASenderID
                                    + "," + dr.SF_CodeQual + "," + dr.SF_Code + "," + dr.ST_CodeQual + "," + dr.ST_Code + "," + dr.SU_CodeQual + "," + dr.SU_Code + "," + dr.SU_ContactName
                                    + "," + dr.SP_CodeQual + "," + dr.SP_Code + "," + dr.SP_ContactName + "," + dr.MI_CodeQual + "," + dr.MI_Code + "," + dr.BT_CodeQual + "," + dr.BT_Code
                                    + "," + dr.LocationQual + "," + dr.LocationCode + "," + dr.d_ReleaseNumber + "," + dr.BuyersPartID + "," + dr.l_PONum + "," + dr.PartDescription
                                    + "," + dr.DCPartLevel + "," + dr.SupplierPartID + "," + dr.l_ContractNumber + "," + dr.CommonityCode + "," + dr.ManuafactureCode + "," + dr.ReturnableContainer
                                    + "," + dr.SubLineAssignID + "," + dr.UOM + "," + dr.UnitPrice + "," + (dr.UnitPrice > 0 ? dr.UnitPriceCode : "") + "," + (dr.UnitPrice > 0 ? dr.PriceCode : "")
                                    + "," + (dr.UnitPrice > 0 ? dr.PriceIDCode : "") + "," + dr.DK_Code + "," + dr.DP_Code + "," + dr.HS_Code + "," + dr.LF_Code + "," + dr.RF_Code
                                    + "," + dr.STL_CodeQual + "," + dr.STL_Code + "," + dr.ContractPerson + "," + dr.ExpeditorName + "," + dr.CommuEX + "," + dr.CommuFX + "," + dr.ContactPhone
                                    + "," + dr.ShipPatternCode + "," + dr.ShipPatternTimeCode + "," + dr.OrderNumber + "," + dr.LastShipNum + ","
                                    + (DateTime.Compare(Common.MIN_DATE, dr.LastShipDate) == 0 ? "" : dr.LastShipDate.ToString("MM/dd/yyyy")) + "," + dr.ShipQty + "," + dr.CUMQty
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.BegInventoryDate) == 0 ? "" : dr.BegInventoryDate.ToString("MM/dd/yyyy")) + "," + (DateTime.Compare(Common.MIN_DATE, dr.EndInventoryDate) == 0 ? "" : dr.EndInventoryDate.ToString("MM/dd/yyyy"))
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.DatePeriodStart) == 0 ? "" : dr.DatePeriodStart.ToString("MM/dd/yyyy")) + "," + dr.FstQty + "," + dr.ForecastQual + "," + dr.ForecastTimeQual;

                            }
                        }

                        File.AppendAllText(strFileName, strData);
                        Common.writeLog(intTradingNo, intTsetNo, "Trading Partner: " + tbTrading.TradingPartnerName + " - Exported : " + strFileName, (int)Common.LOG_TYPE.JOB, DateTime.Now, intEDIRawNo);
                    }
                }
                


            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
            }
        }

        /// <summary>
        /// EDI 850 Header column
        /// </summary>
        private string str850Header = "PONumber,ReleaseNumber,PODate,POTime,ReleaseDate,ReleaseTime,CustomerName,CustomerID,TransSetPurpose,POTypeCode,FreeFormMsg,Currency,"
            + "FOBShpMethod,FOBLocationQual,FOBDescription,ContactFuncCode,ContactName,CommNumQual,CommNum,BillToIDQual,BillToID,ShipToIDQual,ShipToID,ShipFromIDQual,ShipFromID,"
            + "SupplierIDQual,SupplierID,CustomerPartID,PartDescription,EngDrawNum,EngDrawRev,LineID,TotalOrderQty,UnitPrice,UnitBase,DateQual,DateRequest,OrderQty,Message";

        /// <summary>
        ///  Export 850 data to SCP / SAP system
        /// </summary>
        /// <param name="intEDIRawNo"></param>
        /// <param name="edm"></param>
        public void export850(int intEDIRawNo, BHEDI_EDM edm)
        {
            try
            {
                if (Common.SCP_OUT.Equals(""))
                    return;

                var tbEDI = edm.tblEDITrasactionRawDatas.Where(s => s.TransactionRawDataNo == intEDIRawNo).FirstOrDefault<tblEDITrasactionRawData>();

                if (tbEDI == null)
                    return;

                int intTradingNo = tbEDI.TradingPartnerNo_FK;
                int intTsetNo = tbEDI.TransactionSetNo_FK;

                var tbTrading = edm.tblTradingPartners.Where(s => s.TradingPartnerNo == intTradingNo).FirstOrDefault<tblTradingPartner>();
                if (tbTrading == null)
                    return;


                string strSenderID = tbTrading.InterchangeSenderID.Replace("PSAP","04000");
                string strReceiverID = tbTrading.InterchangeReceiverID;
                string strGSSenderID = tbTrading.ApplicationSenderCode;
                string strGSControlNum = tbEDI.GroupControlNum;
                string strISAControlNum = tbEDI.InterchangeControlNum;
                string strTransSetControlNum = tbEDI.TransactionKey;
                int intERPType = Common.myCInt(tbTrading.ERPNo_FK); // ERP Type  1: EKK SAP 2: UVI ERP
                if (intERPType != 1)
                    return;


                string strSAPPath = tbTrading.SCPFolder;
                if (Common.isNullEmptyNothing(strSAPPath))
                    strSAPPath = Common.SCP_OUT;
                else
                    strSAPPath = strSAPPath + "OUT\\";

                var query = from tb in edm.tblEDI_850_HEADER
                            where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                    && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                    && tb.TransSetControlNum == strTransSetControlNum
                            orderby tb.NO descending
                            select tb;

                var tb850 = query.FirstOrDefault<tblEDI_850_HEADER>();
                if (tb850 == null)
                {

                    return;
                }
                string HdrKey = tb850.HdrKey;
                ArrayList arrHdrKey = new ArrayList();
                arrHdrKey.Add(HdrKey);

                // get another data from one set 860 that contains multiple transaction
                DateTime dtSubmitDateTime = Common.myCDate(tb850.SubmitDateTime);
                DateTime dtGenerateDateTime = Common.myCDate(tb850.GeneratedDateTime);
                int intNo = tb850.NO;

                var query2 = from tb in edm.tblEDI_850_HEADER
                             where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                     && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                     && tb.TransSetControlNum != strTransSetControlNum && tb.SubmitDateTime == dtSubmitDateTime && tb.GeneratedDateTime == dtGenerateDateTime
                                     && tb.NO > intNo
                             select tb;

                var tbList860 = query2.ToList<tblEDI_850_HEADER>();
                foreach (tblEDI_850_HEADER tb in tbList860)
                {
                    arrHdrKey.Add(tb.HdrKey);
                }

                foreach (string stKey in arrHdrKey)
                {
                    using (var sp = new BHEDI_SPTableAdapters.s_Export_850TableAdapter())
                    {
                        // set command time out
                        sp.SetCommandTimeout(0);
                        BHEDI_SP.s_Export_850DataTable dt = new BHEDI_SP.s_Export_850DataTable();
                        // run store procedure and return data table
                        sp.Fill(dt, stKey);
                        // create csv file
                        string strFileName = strSAPPath + "850_" + DateTime.Now.ToString("MMddyyyy_HHmmssfff") + ".csv";
                        File.WriteAllText(strFileName, str850Header);
                        string strData = "";
                        foreach (BHEDI_SP.s_Export_850Row dr in dt)
                        {
                            strData += Environment.NewLine + dr.PONum + "," + dr.ReleaseNum + "," + (DateTime.Compare(Common.MIN_DATE, dr.PODate) == 0 ? "" : dr.PODate.ToString("MM/dd/yyyy"))
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.PODate) == 0 ? "" : Common.getHourMinFromDateTime(dr.PODate))
                                + "," + dr.SubmitDateTime.ToString("MM/dd/yyyy") + "," + dr.SubmitDateTime.ToString("HH:mm") + "," + dr.TradingPartnerName + "," + dr.ISASenderID
                                + "," + dr.TransSetPurpose + "," + dr.POTypeCode + "," + dr.Msg + "," + dr.Currency + "," + dr.FOBShpMethod + "," + dr.FOBLocationQual
                                + "," + dr.FOBDescription + "," + dr.ContactCode + "," + dr.ContactName + "," + dr.CommQual + "," + dr.CommNum + "," + dr.BT_CodeQual
                                + "," + dr.BT_Code + "," + dr.ST_CodeQual + "," + dr.ST_Code + "," + dr.SF_CodeQual + "," + dr.SF_Code + "," + dr.SU_CodeQual + "," + dr.SU_Code
                                + "," + dr.BuyersPartID + "," + dr.PartDescription + "," + dr.EngDrawNum + "," + dr.DCPartLevel + "," + dr.POLineNum
                                + "," + dr.QtyOrdered + "," + dr.UnitPrice + "," + dr.UOM + "," + dr.DtmQual + ","
                                + (DateTime.Compare(Common.MIN_DATE, dr.DeliveryReqDate) == 0 ? "" : dr.DeliveryReqDate.ToString("MM/dd/yyyy")) + "," + dr.Qty
                                + "," + dr.EMessage.Replace(",", " ");
                        }
                        File.AppendAllText(strFileName, strData);
                        Common.writeLog(intTradingNo, intTsetNo, "Trading Partner: " + tbTrading.TradingPartnerName + " - Exported : " + strFileName, (int)Common.LOG_TYPE.JOB, DateTime.Now, intEDIRawNo);
                    }
                }

                


            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
            }
        }

        /// <summary>
        /// 860 Column Header
        /// </summary>
        private string str860Header = "PONumber,ReleaseNumber,PODate,POTime,ReleaseDate,ReleaseTime,CustomerName,CustomerID,TransSetPurpose,POTypeCode,FreeFormMsg,Currency,"
            + "ChangeOrderSeq,FOBShpMethod,FOBLocationQual,FOBDescription,ContactFuncCode,ContactName,CommNumQual,CommNum,BillToIDQual,BillToID,ShipToIDQual,ShipToID,"
            + "ShipFromIDQual,ShipFromID,SupplierIDQual,SupplierID,CustomerPartID,PartDescription,EngDrawNum,EngDrawRev,LineID,ChangeResponseTypeCode,TotalOrderQty,"
            + "QuantityLefttoReceive,UnitPrice,UnitBase,DateQual,DateRequest,OrderQty";

        /// <summary>
        ///  Export 860 data to SCP / SAP system
        /// </summary>
        /// <param name="intEDIRawNo"></param>
        /// <param name="edm"></param>
        public void export860(int intEDIRawNo, BHEDI_EDM edm)
        {
            try
            {
                if (Common.SCP_OUT.Equals(""))
                    return;

                var tbEDI = edm.tblEDITrasactionRawDatas.Where(s => s.TransactionRawDataNo == intEDIRawNo).FirstOrDefault<tblEDITrasactionRawData>();

                if (tbEDI == null)
                    return;

                int intTradingNo = tbEDI.TradingPartnerNo_FK;
                int intTsetNo = tbEDI.TransactionSetNo_FK;

                var tbTrading = edm.tblTradingPartners.Where(s => s.TradingPartnerNo == intTradingNo).FirstOrDefault<tblTradingPartner>();
                if (tbTrading == null)
                    return;


                string strSenderID = tbTrading.InterchangeSenderID;
                string strReceiverID = tbTrading.InterchangeReceiverID;
                string strGSSenderID = tbTrading.ApplicationSenderCode;
                string strGSControlNum = tbEDI.GroupControlNum;
                string strISAControlNum = tbEDI.InterchangeControlNum;
                string strTransSetControlNum = tbEDI.TransactionKey;

                int intERPType = Common.myCInt(tbTrading.ERPNo_FK); // ERP Type  1: EKK SAP 2: UVI ERP
                if (intERPType != 1)
                    return;


                string strSAPPath = tbTrading.SCPFolder;
                if (Common.isNullEmptyNothing(strSAPPath))
                    strSAPPath = Common.SCP_OUT;
                else
                    strSAPPath = strSAPPath + "OUT\\";

                var query = from tb in edm.tblEDI_860_HEADER
                            where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                    && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                    && tb.TransSetControlNum == strTransSetControlNum
                            orderby tb.NO descending
                            select tb;

                var tb860 = query.FirstOrDefault<tblEDI_860_HEADER>();
                if (tb860 == null)
                {

                    return;
                }
                string HdrKey = tb860.HdrKey;
                ArrayList arrHdrKey = new ArrayList();
                arrHdrKey.Add(HdrKey);

                // get another data from one set 860 that contains multiple transaction
                DateTime dtSubmitDateTime = Common.myCDate(tb860.SubmitDateTime);
                DateTime dtGenerateDateTime = Common.myCDate(tb860.GeneratedDateTime);
                int intNo = tb860.NO;

                var query2 = from tb in edm.tblEDI_860_HEADER
                        where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                && tb.TransSetControlNum != strTransSetControlNum && tb.SubmitDateTime == dtSubmitDateTime && tb.GeneratedDateTime == dtGenerateDateTime
                                && tb.NO > intNo
                        select tb;

                var tbList860 = query2.ToList<tblEDI_860_HEADER>();
                foreach (tblEDI_860_HEADER tb in tbList860)
                {
                    arrHdrKey.Add(tb.HdrKey);
                }

                // loop on list of data
                foreach (string stKey in arrHdrKey)
                {
                    using (var sp = new BHEDI_SPTableAdapters.s_Export_860TableAdapter())
                    {
                        // set command time out
                        sp.SetCommandTimeout(0);
                        BHEDI_SP.s_Export_860DataTable dt = new BHEDI_SP.s_Export_860DataTable();
                        // run store procedure and return data table
                        sp.Fill(dt, stKey);
                        // create csv file
                        string strFileName = strSAPPath + "860_" + DateTime.Now.ToString("MMddyyyy_HHmmssfff") + ".csv";
                        File.WriteAllText(strFileName, str860Header);
                        string strData = "";
                        foreach (BHEDI_SP.s_Export_860Row dr in dt)
                        {
                            strData += Environment.NewLine + dr.PONum + "," + dr.ReleaseNum + "," + (DateTime.Compare(Common.MIN_DATE, dr.PODate) == 0 ? "" : dr.PODate.ToString("MM/dd/yyyy"))
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.PODate) == 0 ? "" : Common.getHourMinFromDateTime(dr.PODate))
                                + "," + dr.SubmitDateTime.ToString("MM/dd/yyyy") + "," + dr.SubmitDateTime.ToString("HH:mm") + "," + dr.TradingPartnerName + "," + dr.ISASenderID
                                + "," + dr.TransSetPurpose + "," + dr.POTypeCode + "," + dr.Msg + "," + dr.Currency + "," + dr.ChangeOrderSeqNum + "," + dr.FOBShpMethod + "," + dr.FOBLocationQual
                                + "," + dr.FOBDescription + "," + dr.ContactCode + "," + dr.ContactName + "," + dr.CommQual + "," + dr.CommNum + "," + dr.BT_CodeQual
                                + "," + dr.BT_Code + "," + dr.ST_CodeQual + "," + dr.ST_Code + "," + dr.SF_CodeQual + "," + dr.SF_Code + "," + dr.SU_CodeQual + "," + dr.SU_Code
                                + "," + dr.BuyersPartID + "," + dr.PartDescription + "," + dr.EngDrawNum + "," + dr.ProdID2 + "," + dr.POLineNum + "," + dr.LineItemChange
                                + "," + dr.QtyOrdered + "," + dr.QtyLeftToRcv + "," + dr.UnitPrice + "," + dr.UOMCode + "," + dr.DtmQual + ","
                                + (DateTime.Compare(Common.MIN_DATE, dr.DeliveryReqDate) == 0 ? "" : dr.DeliveryReqDate.ToString("MM/dd/yyyy")) + "," + dr.Qty;
                        }
                        File.AppendAllText(strFileName, strData);
                        Common.writeLog(intTradingNo, intTsetNo, "Trading Partner: " + tbTrading.TradingPartnerName + " - Exported : " + strFileName, (int)Common.LOG_TYPE.JOB, DateTime.Now, intEDIRawNo);
                    }
                }

                


            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
            }
        }

        /// <summary>
        /// 997 Header Column
        /// </summary>
        private string str824Header = "SenderID,SenderName,AdviceNumber,ReleaseDate,ReleaseTime,PlantIDQual,PlantID,ShipToIDQual,ShipToID,SupplierIDQual,SupplierID,AckCode,"
            + "ASNNumber,ASNReceiveDate,ASNReceiveTime,ErrorCode,ErrorDescription,ReferenceCode,ReferenceDescription";


        /// <summary>
        ///  Export 824 data to SCP / SAP system
        /// </summary>
        /// <param name="intEDIRawNo"></param>
        /// <param name="edm"></param>
        public void export824(int intEDIRawNo, BHEDI_EDM edm, string SenderID, string GSSenderID, string ReceiverID, string TransSetControlNum, string ISAControlNum)
        {
            try
            {
                if (Common.SCP_OUT.Equals(""))
                    return;

                string strSAPPath = Common.SCP_OUT;
                string strSenderID = "";
                string strReceiverID = "";
                string strGSSenderID = "";
                string strGSControlNum = "";
                string strISAControlNum = "";
                string strTransSetControlNum = "";
                ArrayList arrHdrKey = new ArrayList();

                if (intEDIRawNo > 0)
                {
                    var tbEDI = edm.tblEDITrasactionRawDatas.Where(s => s.TransactionRawDataNo == intEDIRawNo).FirstOrDefault<tblEDITrasactionRawData>();

                    if (tbEDI == null)
                        return;

                    int intTradingNo = tbEDI.TradingPartnerNo_FK;
                    int intTsetNo = tbEDI.TransactionSetNo_FK;

                    var tbTrading = edm.tblTradingPartners.Where(s => s.TradingPartnerNo == intTradingNo).FirstOrDefault<tblTradingPartner>();
                    if (tbTrading == null)
                        return;


                    strSenderID = tbTrading.InterchangeSenderID;
                    strReceiverID = tbTrading.InterchangeReceiverID;
                    strGSSenderID = tbTrading.ApplicationSenderCode;
                    strGSControlNum = tbEDI.GroupControlNum;
                    strISAControlNum = tbEDI.InterchangeControlNum;
                    strTransSetControlNum = tbEDI.TransactionKey;
                    strSAPPath = tbTrading.SCPFolder;

                    int intERPType = Common.myCInt(tbTrading.ERPNo_FK); // ERP Type  1: EKK SAP 2: UVI ERP
                    if (intERPType != 1)
                        return;


                    if (Common.isNullEmptyNothing(strSAPPath))
                        strSAPPath = Common.SCP_OUT;
                    else
                        strSAPPath = strSAPPath + "OUT\\";

                    var query = from tb in edm.tblEDI_824_HEADER
                                where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                        && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                        && tb.TransSetControlNum == strTransSetControlNum
                                orderby tb.NO descending
                                select tb;

                    var tb824 = query.FirstOrDefault<tblEDI_824_HEADER>();
                    if (tb824 == null)
                    {

                        return;
                    }
                    string HdrKey = tb824.HdrKey;

                    arrHdrKey.Add(HdrKey);

                    // get another data from one set 860 that contains multiple transaction
                    DateTime dtSubmitDateTime = Common.myCDate(tb824.SubmitDateTime);
                    DateTime dtGenerateDateTime = Common.myCDate(tb824.GeneratedDateTime);
                    int intNo = tb824.NO;

                    var query2 = from tb in edm.tblEDI_824_HEADER
                                 where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                         && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                         && tb.TransSetControlNum != strTransSetControlNum && tb.SubmitDateTime == dtSubmitDateTime && tb.GeneratedDateTime == dtGenerateDateTime
                                         && tb.NO > intNo
                                 select tb;

                    var tbList824 = query2.ToList<tblEDI_824_HEADER>();
                    foreach (tblEDI_824_HEADER tb in tbList824)
                    {
                        arrHdrKey.Add(tb.HdrKey);
                    }

                }
                else
                {
                    
                    var query3 = from tb in edm.tblEDI_824_HEADER
                                where tb.ISASenderID == SenderID && tb.GSSenderID == GSSenderID && tb.GSReceiverID == ReceiverID
                                        && tb.ISAControlNum == ISAControlNum
                                        && tb.TransSetControlNum == TransSetControlNum
                                orderby tb.NO descending
                                select tb;

                    var tb8242 = query3.FirstOrDefault<tblEDI_824_HEADER>();
                    if (tb8242 == null)
                    {

                        return;
                    }
                    string HdrKey = tb8242.HdrKey;

                    arrHdrKey.Add(HdrKey);
                }
                
 
                // loop on list of data
                foreach (string stKey in arrHdrKey)
                {
                    using (var sp = new BHEDI_SPTableAdapters.s_Export_824TableAdapter())
                    {
                        // set command time out
                        sp.SetCommandTimeout(0);
                        BHEDI_SP.s_Export_824DataTable dt = new BHEDI_SP.s_Export_824DataTable();
                        // run store procedure and return data table
                        sp.Fill(dt, stKey);
                        // create csv file
                        string strFileName = strSAPPath + "824_" + DateTime.Now.ToString("MMddyyyy_HHmmssfff") + ".csv";
                        File.WriteAllText(strFileName, str824Header);
                        string strData = "";
                        foreach (BHEDI_SP.s_Export_824Row dr in dt)
                        {
                            strData += Environment.NewLine + dr.ISASenderID + "," + dr.TradingPartnerName + "," + dr.ApplicationAdviceNum + ","+ (DateTime.Compare(Common.MIN_DATE, dr.SubmitDateTime) == 0 ? "" : dr.SubmitDateTime.ToString("MM/dd/yyyy"))
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.SubmitDateTime) == 0 ? "" : Common.getHourMinFromDateTime(dr.SubmitDateTime))
                                + "," + dr.SP_CodeQual + "," + dr.SP_Code + "," + dr.ST_CodeQual + "," + dr.ST_Code + "," + dr.SU_CodeQual + "," + dr.SU_Code
                                + "," + dr.AppAcknowledgmentCode + "," + dr.OrgDocumentNum + "," + (DateTime.Compare(Common.MIN_DATE, dr.OrgCreateDateTime) == 0 ? "" : dr.OrgCreateDateTime.ToString("MM/dd/yyyy"))
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.OrgCreateDateTime) == 0 ? "" : Common.getHourMinFromDateTime(dr.OrgCreateDateTime))
                                + "," + dr.ApplErrConditionCode + "," + dr.ErrorDescrp + "," + dr.NoteRefCode + "," + dr.Description ;
                        }
                        File.AppendAllText(strFileName, strData);
                        Common.writeLog(-1, -1, "Trading Partner: " + strSenderID + " - Exported : " + strFileName, (int)Common.LOG_TYPE.JOB, DateTime.Now, -1);
                    }
                }




            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
            }
        }

        /// <summary>
        /// 997 Column Header
        /// </summary>
        private string str997Header = "SenderID,SenderName,ReleaseDate,ReleaseTime,TransactionGroupType,GroupControlNumber,GroupAckCode,NumofTransSetsIncluded,NumofReceivedTransSets,NumofAcceptedTransSets,ControlNumber,AckCode";
        /// <summary>
        ///  Export 997 data to SCP / SAP system
        /// </summary>
        /// <param name="intEDIRawNo"></param>
        /// <param name="edm"></param>
        public void export997(int intEDIRawNo, BHEDI_EDM edm)
        {
            try
            {
                if (Common.SCP_OUT.Equals(""))
                    return;

                var tbEDI = edm.tblEDITrasactionRawDatas.Where(s => s.TransactionRawDataNo == intEDIRawNo).FirstOrDefault<tblEDITrasactionRawData>();

                if (tbEDI == null)
                    return;

                int intTradingNo = tbEDI.TradingPartnerNo_FK;
                int intTsetNo = tbEDI.TransactionSetNo_FK;

                var tbTrading = edm.tblTradingPartners.Where(s => s.TradingPartnerNo == intTradingNo).FirstOrDefault<tblTradingPartner>();
                if (tbTrading == null)
                    return;


                string strSenderID = tbTrading.InterchangeSenderID;
                string strReceiverID = tbTrading.InterchangeReceiverID;
                string strGSSenderID = tbTrading.ApplicationSenderCode;
                string strGSControlNum = tbEDI.GroupControlNum;
                string strISAControlNum = tbEDI.InterchangeControlNum;
                string strTransSetControlNum = tbEDI.TransactionKey;

                int intERPType = Common.myCInt(tbTrading.ERPNo_FK); // ERP Type  1: EKK SAP 2: UVI ERP
                if (intERPType != 1)
                    return;

                string strSAPPath = tbTrading.SCPFolder;
                if (Common.isNullEmptyNothing(strSAPPath))
                    strSAPPath = Common.SCP_OUT;
                else
                    strSAPPath = strSAPPath + "OUT\\";

                var query = from tb in edm.tblEDI_997_HEADER
                            where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                    && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                   
                            orderby tb.NO descending
                            select tb;

                var tb997 = query.FirstOrDefault<tblEDI_997_HEADER>();
                if (tb997 == null)
                {

                    return;
                }
                string HdrKey = tb997.HdrKey;
                ArrayList arrHdrKey = new ArrayList();
                arrHdrKey.Add(HdrKey);
                string strTransSetControlNum824 = tb997.TransSetControlNum;

                // get another data from one set 860 that contains multiple transaction
                DateTime dtSubmitDateTime = Common.myCDate(tb997.SubmitDateTime);
                DateTime dtGenerateDateTime = Common.myCDate(tb997.GeneratedDateTime);
                int intNo = tb997.NO;

                var query2 = from tb in edm.tblEDI_997_HEADER
                             where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                     && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                     && tb.SubmitDateTime == dtSubmitDateTime && tb.GeneratedDateTime == dtGenerateDateTime
                                     && tb.NO > intNo
                             select tb;

                var tbList997 = query2.ToList<tblEDI_997_HEADER>();
                foreach (tblEDI_997_HEADER tb in tbList997)
                {
                    arrHdrKey.Add(tb.HdrKey);
                }

                // loop on list of data
                foreach (string stKey in arrHdrKey)
                {
                    using (var sp = new BHEDI_SPTableAdapters.s_Export_997TableAdapter())
                    {
                        // set command time out
                        sp.SetCommandTimeout(0);
                        BHEDI_SP.s_Export_997DataTable dt = new BHEDI_SP.s_Export_997DataTable();
                        // run store procedure and return data table
                        sp.Fill(dt, stKey);
                        // create csv file
                        string strFileName = strSAPPath + "997_" + DateTime.Now.ToString("MMddyyyy_HHmmssfff") + ".csv";
                        File.WriteAllText(strFileName, str997Header);
                        string strData = "";
                        foreach (BHEDI_SP.s_Export_997Row dr in dt)
                        {
                            strData += Environment.NewLine + dr.ISASenderID + "," + dr.TradingPartnerName + "," + (DateTime.Compare(Common.MIN_DATE, dr.SubmitDateTime) == 0 ? "" : dr.SubmitDateTime.ToString("MM/dd/yyyy"))
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.SubmitDateTime) == 0 ? "" : Common.getHourMinFromDateTime(dr.SubmitDateTime))
                                + "," + dr.FunctionalIDCode + "," + dr.GroupControlNum + "," + dr.FunctionalGroupAckCode + "," + dr.NumofTransSetsIncluded + "," + dr.NumofReceivedTransSets + "," + dr.NumofAcceptedTransSets
                                + "," + dr.ASNNum + "," + dr.AckCode ;
                        }
                        File.AppendAllText(strFileName, strData);
                        Common.writeLog(intTradingNo, intTsetNo, "Trading Partner: " + tbTrading.TradingPartnerName + " - Exported : " + strFileName, (int)Common.LOG_TYPE.JOB, DateTime.Now, intEDIRawNo);
                    }
                }

                // For Chrysler sends 997 and 824 in the same file
                if (Common.EDI_ID_997_824.Contains(strSenderID))
                {
                    export824(-1, edm, strSenderID, strGSSenderID, strReceiverID, strTransSetControlNum824, strISAControlNum);
                }




            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
            }
        }

        /// <summary>
        /// 856 EDI Header
        /// </summary>
        private string str856Header = "SenderID,SenderName,CustomerID,CustomerName,ASNNumber,TransactionSetPurposeCode,SendDate,SendTime,CreateDate,CreateTime,ShipDate,"
            + "ShipTime,WeightQual,Weight,WeightUnitQual,SCACCode,EquipCode,ReferenceNumber,BolNumber,PlantIDQual,PlantID,ShipToIDQual,ShipToID,SupplierIDQual,SupplierID,"
            + "ShipQty,PalletPkgCode,PalletSerialNum,CustomerPartID,CustomerPO,ReleaseNumber,LotNum,ContainerPkgCode,ContainerQty,ContainerSerialNum";

        /// <summary>
        ///  Export 856 data to SCP / SAP system
        /// </summary>
        /// <param name="intEDIRawNo"></param>
        /// <param name="edm"></param>
        public void export856(int intEDIRawNo, BHEDI_EDM edm)
        {
            try
            {
                if (Common.SCP_OUT.Equals(""))
                    return;

                var tbEDI = edm.tblEDITrasactionRawDatas.Where(s => s.TransactionRawDataNo == intEDIRawNo).FirstOrDefault<tblEDITrasactionRawData>();

                if (tbEDI == null)
                    return;

                int intTradingNo = tbEDI.TradingPartnerNo_FK;
                int intTsetNo = tbEDI.TransactionSetNo_FK;

                var tbTrading = edm.tblTradingPartners.Where(s => s.TradingPartnerNo == intTradingNo).FirstOrDefault<tblTradingPartner>();
                if (tbTrading == null)
                    return;


                string strSenderID = tbTrading.InterchangeSenderID;
                string strReceiverID = tbTrading.InterchangeReceiverID;
                string strGSSenderID = tbTrading.ApplicationSenderCode;
                string strGSControlNum = tbEDI.GroupControlNum;
                string strISAControlNum = tbEDI.InterchangeControlNum;
                string strTransSetControlNum = tbEDI.TransactionKey;

                int intERPType = Common.myCInt(tbTrading.ERPNo_FK); // ERP Type  1: EKK SAP 2: UVI ERP
                if (intERPType != 1)
                    return;


                string strSAPPath = tbTrading.SCPFolder;
                if (Common.isNullEmptyNothing(strSAPPath))
                    strSAPPath = Common.SCP_OUT;
                else
                    strSAPPath = strSAPPath + "OUT\\";
                var query = from tb in edm.tblEDI_856_HEADER
                            where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                    && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                    && tb.TransSetControlNum == strTransSetControlNum
                            orderby tb.NO descending
                            select tb;

                var tb856 = query.FirstOrDefault<tblEDI_856_HEADER>();
                if (tb856 == null)
                {

                    return;
                }
                string HdrKey = tb856.HdrKey;
                ArrayList arrHdrKey = new ArrayList();
                arrHdrKey.Add(HdrKey);

                // get another data from one set 860 that contains multiple transaction
                DateTime dtSubmitDateTime = Common.myCDate(tb856.SubmitDateTime);
                DateTime dtGenerateDateTime = Common.myCDate(tb856.GeneratedDateTime);
                int intNo = tb856.NO;

                var query2 = from tb in edm.tblEDI_856_HEADER
                             where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                     && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                     && tb.TransSetControlNum != strTransSetControlNum && tb.SubmitDateTime == dtSubmitDateTime && tb.GeneratedDateTime == dtGenerateDateTime
                                     && tb.NO > intNo
                             select tb;

                var tbList856 = query2.ToList<tblEDI_856_HEADER>();
                foreach (tblEDI_856_HEADER tb in tbList856)
                {
                    arrHdrKey.Add(tb.HdrKey);
                }

                // loop on list of data
                foreach (string stKey in arrHdrKey)
                {
                    using (var sp = new BHEDI_SPTableAdapters.s_Export_856TableAdapter())
                    {
                        // set command time out
                        sp.SetCommandTimeout(0);
                        BHEDI_SP.s_Export_856DataTable dt = new BHEDI_SP.s_Export_856DataTable();
                        // run store procedure and return data table
                        sp.Fill(dt, stKey);
                        // create csv file
                        string strFileName = strSAPPath + "856_" + DateTime.Now.ToString("MMddyyyy_HHmmssfff") + ".csv";
                        File.WriteAllText(strFileName, str856Header);
                        string strData = "";
                        foreach (BHEDI_SP.s_Export_856Row dr in dt)
                        {
                            strData += Environment.NewLine + dr.ISASenderID + "," + dr.TradingPartnerName + "," + dr.ISASenderIDCust + "," + dr.TradingPartnerNameCust
                                + "," + dr.ASNNumber + "," + dr.TransSetPurpose
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.SendDate) == 0 ? "" : dr.SendDate.ToString("MM/dd/yyyy"))
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.SendDate) == 0 ? "" : Common.getHourMinFromDateTime(dr.SendDate))
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.SubmitDateTime) == 0 ? "" : dr.SubmitDateTime.ToString("MM/dd/yyyy"))
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.SubmitDateTime) == 0 ? "" : Common.getHourMinFromDateTime(dr.SubmitDateTime))
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.ShipDate) == 0 ? "" : dr.ShipDate.ToString("MM/dd/yyyy"))
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.ShipDate) == 0 ? "" : Common.getHourMinFromDateTime(dr.ShipDate))
                                + "," + dr.WeightQual + "," + dr.Weight + "," + dr.UOM + "," + dr.SCACCode + "," + dr.EquipDescCode
                                + "," + dr.TrailerNo + "," + dr.BOL + "," + dr.PlantIDQual + "," + dr.PlantID + "," + dr.ShipToIDQual
                                + "," + dr.ShipToID + "," + dr.SuplierDQual + "," + dr.SupplierID + "," + dr.ShipQty + "," + dr.PalletPkgCode
                                + "," + dr.PalletSerialNum + "," + dr.CustomerPartID + "," + dr.CustomerPO + "," + dr.ReleaseNumber + "," + dr.LotNum
                                + "," + dr.ContainerPkgCode + "," + dr.ContainerQty + "," + dr.ContainerSerialNum;

                        }
                        File.AppendAllText(strFileName, strData);
                        Common.writeLog(intTradingNo, intTsetNo, "Trading Partner: " + tbTrading.TradingPartnerName + " - Exported : " + strFileName, (int)Common.LOG_TYPE.JOB, DateTime.Now, intEDIRawNo);
                    }
                }




            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
            }
        }

        /// <summary>
        /// 820 
        /// </summary>
        private string str820Header = "ReleaseDate,ReleaseTime,CustomerName,CustomerID,TotalPaymentAmount,TransHandingCode,CreditDebitFlagCode,PaymentMethodCode,"
            + "RemittanceDate,ReferenceNum1,ReferenceNum2,EntityIDCode,Currency,PayeeIDQual,PayeeID,PayerIDQual,PayerID,ContactFuncCode,ContactName,CommNumQual,CommNum,"
            + "RemittanceIDQual,RemittanceID,GrossAmount,DiscountAmount,InvoiceDate,InvoiceLineID,QtyInvoiced,UOM,UnitPrice,UnitPriceCode,BLNumber,PlantID,PKNumber,"
            + "CustomerPartID,PONumber,ItemLineNumber,ShipDate";

        /// <summary>
        /// Export 820 data to SCP
        /// </summary>
        /// <param name="intEDIRawNo"></param>
        /// <param name="edm"></param>
        public void export820(int intEDIRawNo, BHEDI_EDM edm)
        {
            try
            {
                if (Common.SCP_OUT.Equals(""))
                    return;

                var tbEDI = edm.tblEDITrasactionRawDatas.Where(s => s.TransactionRawDataNo == intEDIRawNo).FirstOrDefault<tblEDITrasactionRawData>();

                if (tbEDI == null)
                    return;

                int intTradingNo = tbEDI.TradingPartnerNo_FK;
                int intTsetNo = tbEDI.TransactionSetNo_FK;

                var tbTrading = edm.tblTradingPartners.Where(s => s.TradingPartnerNo == intTradingNo).FirstOrDefault<tblTradingPartner>();
                if (tbTrading == null)
                    return;


                string strSenderID = tbTrading.InterchangeSenderID;
                string strReceiverID = tbTrading.InterchangeReceiverID;
                string strGSSenderID = tbTrading.ApplicationSenderCode;
                string strGSControlNum = tbEDI.GroupControlNum;
                string strISAControlNum = tbEDI.InterchangeControlNum;
                string strTransSetControlNum = tbEDI.TransactionKey;

                int intERPType = Common.myCInt(tbTrading.ERPNo_FK); // ERP Type  1: EKK SAP 2: UVI ERP
                if (intERPType != 1)
                    return;


                string strSAPPath = tbTrading.SCPFolder;
                if (Common.isNullEmptyNothing(strSAPPath))
                    strSAPPath = Common.SCP_OUT;
                else
                    strSAPPath = strSAPPath + "OUT\\";

                var query = from tb in edm.tblEDI_820_HEADER
                            where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                    && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum

                            orderby tb.NO descending
                            select tb;

                var tb820 = query.FirstOrDefault<tblEDI_820_HEADER>();
                if (tb820 == null)
                {

                    return;
                }
                string HdrKey = tb820.HdrKey;
                ArrayList arrHdrKey = new ArrayList();
                arrHdrKey.Add(HdrKey);

                // get another data from one set 820 that contains multiple transaction
                DateTime dtSubmitDateTime = Common.myCDate(tb820.SubmitDateTime);
                DateTime dtGenerateDateTime = Common.myCDate(tb820.GeneratedDateTime);
                int intNo = tb820.NO;

                var query2 = from tb in edm.tblEDI_820_HEADER
                             where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                     && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                     && tb.SubmitDateTime == dtSubmitDateTime && tb.GeneratedDateTime == dtGenerateDateTime
                                     && tb.NO > intNo
                             select tb;

                var tbList820 = query2.ToList<tblEDI_820_HEADER>();
                foreach (tblEDI_820_HEADER tb in tbList820)
                {
                    arrHdrKey.Add(tb.HdrKey);
                }

                // loop on list of data
                foreach (string stKey in arrHdrKey)
                {
                    using (var sp = new BHEDI_SPTableAdapters.s_Export_820TableAdapter())
                    {
                        // set command time out
                        sp.SetCommandTimeout(0);
                        BHEDI_SP.s_Export_820DataTable dt = new BHEDI_SP.s_Export_820DataTable();
                        // run store procedure and return data table
                        sp.Fill(dt, stKey);
                        // create csv file
                        string strFileName = strSAPPath + "820_" + DateTime.Now.ToString("MMddyyyy_HHmmssfff") + ".csv";
                        File.WriteAllText(strFileName, str820Header);
                        string strData = "";
                        foreach (BHEDI_SP.s_Export_820Row dr in dt)
                        {
                            strData += Environment.NewLine + (DateTime.Compare(Common.MIN_DATE, dr.SubmitDateTime) == 0 ? "" : dr.SubmitDateTime.ToString("MM/dd/yyyy"))
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.SubmitDateTime) == 0 ? "" : Common.getHourMinFromDateTime(dr.SubmitDateTime))
                                + "," + dr.TradingPartnerName + "," + dr.ISASenderID + "," + dr.TotalPaymentAmount + "," + dr.TransHandlingCode + "," + dr.CreditDebitFlagCode + "," + dr.PaymentMethodCode
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.RemittanceDate) == 0 ? "" : dr.RemittanceDate.ToString("MM/dd/yyyy"))
                                + "," + dr.TraceRefNum1 + "," + dr.TraceRefNum2 + "," + dr.EntityIDCode + "," + dr.CurrencyCode + "," + dr.SU_CodeQual + "," + dr.SU_Code
                                + "," + dr.ST_CodeQual + "," + dr.ST_Code + "," + dr.ContactCode + "," + dr.ContactName + "," + dr.ContactNum1Qual + "," + dr.ContactNum1
                                + "," + dr.RemittanceIDQual + "," + dr.RemittanceID + "," + dr.GrossAmount + "," + dr.DiscountAmount
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.InvoiceDate) == 0 ? "" : dr.InvoiceDate.ToString("MM/dd/yyyy"))
                                + "," + dr.AssignedID + "," + dr.QtyInvoiced + "," + dr.UOM + "," + dr.UnitPrice + "," + dr.UnitPriceCode 
                                + "," + dr.BOLNumber + "," + dr.PlantNumber + "," + dr.PKNumber + "," + dr.PartNumber + "," + dr.PONumber + "," + dr.ItemLineNumber
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.ShipDate) == 0 ? "" : dr.ShipDate.ToString("MM/dd/yyyy")) ;
                        }
                        File.AppendAllText(strFileName, strData);
                        Common.writeLog(intTradingNo, intTsetNo, "Trading Partner: " + tbTrading.TradingPartnerName + " - Exported : " + strFileName, (int)Common.LOG_TYPE.JOB, DateTime.Now, intEDIRawNo);
                    }
                }




            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
            }
        }

        /// <summary>
        /// 861 Header Column
        /// </summary>
        private string str861Header = "ReceivingAdviceNum,ReleaseDate,ReleaseTime,Tr_Set,ReceivingAdviceType,CustomerName,CustomerID,BLNumber,ShipmentNumber,ShipDate,ReceiveDate"
            + ",ProcessDate,CarrierCodeQual,CarrierCode,EquipCode,EquipNumber,ShipfrID_H_Qual,ShipfoID_H,ShiptoID_H_Qual,ShiptoID_H,SupplierID_H_Qual,SupplierID_H,PlantID_H_Qual,"
            + "PlantID_H,ReceiveQty,ReceiveQtyUOM,ReturnQty,ReturnQtyUOM,QuestionQty,QuestionQtyUOM,CustomerPartID,PKNumber,DockReceiveNum";


        /// <summary>
        /// Export 861 data to SCP
        /// </summary>
        /// <param name="intEDIRawNo"></param>
        /// <param name="edm"></param>
        public void export861(int intEDIRawNo, BHEDI_EDM edm)
        {
            try
            {
                if (Common.SCP_OUT.Equals(""))
                    return;

                var tbEDI = edm.tblEDITrasactionRawDatas.Where(s => s.TransactionRawDataNo == intEDIRawNo).FirstOrDefault<tblEDITrasactionRawData>();

                if (tbEDI == null)
                    return;

                int intTradingNo = tbEDI.TradingPartnerNo_FK;
                int intTsetNo = tbEDI.TransactionSetNo_FK;

                var tbTrading = edm.tblTradingPartners.Where(s => s.TradingPartnerNo == intTradingNo).FirstOrDefault<tblTradingPartner>();
                if (tbTrading == null)
                    return;

                string strSenderID = tbTrading.InterchangeSenderID.Replace("04000-861", "04000");
                string strReceiverID = tbTrading.InterchangeReceiverID.Replace("18982A-861", "18982A");
                string strGSSenderID = tbTrading.ApplicationSenderCode;
                string strGSControlNum = tbEDI.GroupControlNum;
                string strISAControlNum = tbEDI.InterchangeControlNum;
                string strTransSetControlNum = tbEDI.TransactionKey;

                int intERPType = Common.myCInt(tbTrading.ERPNo_FK); // ERP Type  1: EKK SAP 2: UVI ERP
                if (intERPType != 1)
                    return;


                string strSAPPath = tbTrading.SCPFolder;
                if (Common.isNullEmptyNothing(strSAPPath))
                    strSAPPath = Common.SCP_OUT;
                else
                    strSAPPath = strSAPPath + "OUT\\";

                var query = from tb in edm.tblEDI_861_HEADER
                            where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                    && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum

                            orderby tb.NO descending
                            select tb;

                var tb861 = query.FirstOrDefault<tblEDI_861_HEADER>();
                if (tb861 == null)
                {

                    return;
                }
                string HdrKey = tb861.HdrKey;
                ArrayList arrHdrKey = new ArrayList();
                arrHdrKey.Add(HdrKey);

                // get another data from one set 820 that contains multiple transaction
                DateTime dtSubmitDateTime = Common.myCDate(tb861.SubmitDateTime);
                DateTime dtGenerateDateTime = Common.myCDate(tb861.GeneratedDateTime);
                int intNo = tb861.NO;

                var query2 = from tb in edm.tblEDI_861_HEADER
                             where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                     && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                     && tb.SubmitDateTime == dtSubmitDateTime && tb.GeneratedDateTime == dtGenerateDateTime
                                     && tb.NO > intNo
                             select tb;

                var tbList861 = query2.ToList<tblEDI_861_HEADER>();
                foreach (tblEDI_861_HEADER tb in tbList861)
                {
                    arrHdrKey.Add(tb.HdrKey);
                }

                // loop on list of data
                foreach (string stKey in arrHdrKey)
                {
                    using (var sp = new BHEDI_SPTableAdapters.s_Export_861TableAdapter())
                    {
                        // set command time out
                        sp.SetCommandTimeout(0);
                        BHEDI_SP.s_Export_861DataTable dt = new BHEDI_SP.s_Export_861DataTable();
                        // run store procedure and return data table
                        sp.Fill(dt, stKey);
                        // create csv file
                        string strFileName = strSAPPath + "861_" + DateTime.Now.ToString("MMddyyyy_HHmmssfff") + ".csv";
                        File.WriteAllText(strFileName, str861Header);
                        string strData = "";
                        foreach (BHEDI_SP.s_Export_861Row dr in dt)
                        {
                            strData += Environment.NewLine + dr.ReceivingAdviceNum + "," + (DateTime.Compare(Common.MIN_DATE, dr.SubmitDateTime) == 0 ? "" : dr.SubmitDateTime.ToString("MM/dd/yyyy"))
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.SubmitDateTime) == 0 ? "" : Common.getHourMinFromDateTime(dr.SubmitDateTime))
                                + "," + dr.TransSetPurpose + "," + dr.ReceivingAdviceTypeCode
                                + "," + dr.TradingPartnerName + "," + dr.ISASenderID + "," + dr.BOLNumber + "," + dr.PKNumber
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.ShipDate) == 0 ? "" : dr.ShipDate.ToString("MM/dd/yyyy"))
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.ReceiveDate) == 0 ? "" : dr.ReceiveDate.ToString("MM/dd/yyyy"))
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.ProcessDate) == 0 ? "" : dr.ProcessDate.ToString("MM/dd/yyyy"))
                                + "," + dr.CarrierCodeQual + "," + dr.CarrierCode + "," + dr.EquipCode + "," + dr.EquipNumber
                                + "," + dr.SF_CodeQual + "," + dr.SF_Code + "," + dr.ST_CodeQual + "," + dr.ST_Code + "," + dr.SU_CodeQual + "," + dr.SU_Code
                                + "," + dr.MI_CodeQual + "," + dr.MI_Code + "," + dr.RecvdQty + "," + dr.RecvdQtyUOM + "," + dr.ReturnQty + "," + dr.ReturnQtyUOM
                                + "," + dr.QuestionQty + "," + dr.QuestionQtyUOM + "," + dr.BuyersPartID + "," + dr.PKNumberLine + "," + dr.DockReceiveNum;
                             
                        }
                        File.AppendAllText(strFileName, strData);
                        Common.writeLog(intTradingNo, intTsetNo, "Trading Partner: " + tbTrading.TradingPartnerName + " - Exported : " + strFileName, (int)Common.LOG_TYPE.JOB, DateTime.Now, intEDIRawNo);
                    }
                }




            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
            }
        }

        /// <summary>
        /// EDI 862 Header
        /// </summary>
        private string str862Header = "ReleaseNumber,ReleaseDate,ReleaseTime,Tr_Set,Ref_Id,Schedule Type_Qual,Plan_date_fr,Plan_date_to,CustomerPO_H,CustomerName,CustomerID"
            + ",ShipfrID_H_Qual,ShipfoID_H,ShiptoID_H_Qual,ShiptoID_H,SupplierID_H_Qual,SupplierID_H,PlantID_H_Qual,PlantID_H,ReleaseNumber_L,CustomerPartID,CustomerPO_L,"
            + "PartDescription,LineItem_ID,Base_Unit,DK_ref_Num,LF_ref_Num,FinalDeliveryHouse,FinalDeliveryRoute,CarrierName,SealNumber,RouteQual,RouteReference,RouteOrderNumber,"
            + "LocationQual,LocationID,CommuEX,CommuFX,CommuTE,OrderNumber,LastShipmentNum,LastShipmentDate,LastShipmentQty,CUMQty,CUMDateStart,CUMDateEnd,ShipRequestDate,"
            + "OrderQty,OrderType,Forcast_Type_Qual,EstArrivalDate,ServiceStartDate,ServiceEndDate,PickupDate,PlanShipDate";


        /// <summary>
        /// Export 862 data to SCP / SAP system
        /// </summary>
        /// <param name="header"></param>
        /// <param name="edm"></param>
        public void export862(int intEDIRawNo, BHEDI_EDM edm)
        {
            try
            {

                if (Common.SCP_OUT.Equals(""))
                    return;

                var tbEDI = edm.tblEDITrasactionRawDatas.Where(s => s.TransactionRawDataNo == intEDIRawNo).FirstOrDefault<tblEDITrasactionRawData>();

                if (tbEDI == null)
                    return;

                int intTradingNo = tbEDI.TradingPartnerNo_FK;
                int intTsetNo = tbEDI.TransactionSetNo_FK;

                var tbTrading = edm.tblTradingPartners.Where(s => s.TradingPartnerNo == intTradingNo).FirstOrDefault<tblTradingPartner>();
                if (tbTrading == null)
                    return;


                string strSenderID = tbTrading.InterchangeSenderID.Replace("-862","");
                string strReceiverID = tbTrading.InterchangeReceiverID.Replace("-862", "");
                string strGSSenderID = tbTrading.ApplicationSenderCode;
                string strGSControlNum = tbEDI.GroupControlNum;
                string strISAControlNum = tbEDI.InterchangeControlNum;
                string strTransSetControlNum = tbEDI.TransactionKey;
                int intERPType = Common.myCInt(tbTrading.ERPNo_FK); // ERP Type 

                string strSAPPath = tbTrading.SCPFolder;
                if (Common.isNullEmptyNothing(strSAPPath))
                    strSAPPath = Common.SCP_OUT;
                else
                    strSAPPath = strSAPPath + "OUT\\";

                var query = from tb in edm.tblEDI_862_HEADER
                            where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                    && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                    && tb.TransSetControlNum == strTransSetControlNum 
                            orderby tb.NO descending
                            select tb;

                var tb862 = query.FirstOrDefault<tblEDI_862_HEADER>();
                if (tb862 == null)
                {

                    return;
                }
                string HdrKey = tb862.HdrKey;

                ArrayList arrHdrKey = new ArrayList();
                arrHdrKey.Add(HdrKey);

                // get another data from one set 860 that contains multiple transaction
                DateTime dtSubmitDateTime = Common.myCDate(tb862.SubmitDateTime);
                DateTime dtGenerateDateTime = Common.myCDate(tb862.GeneratedDateTime);
                int intNo = tb862.NO;
                var query2 = from tb in edm.tblEDI_862_HEADER
                             where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                     && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                     && tb.TransSetControlNum != strTransSetControlNum && tb.SubmitDateTime == dtSubmitDateTime && tb.GeneratedDateTime == dtGenerateDateTime
                             select tb;

                var tbList862 = query2.ToList<tblEDI_862_HEADER>();
                foreach (tblEDI_862_HEADER tb in tbList862)
                {
                    arrHdrKey.Add(tb.HdrKey);
                }

                // loop on list of data
                foreach (string stKey in arrHdrKey)
                {
                    using (var sp = new BHEDI_SPTableAdapters.s_Export_862TableAdapter())
                    {
                        // set command time out
                        sp.SetCommandTimeout(0);
                        BHEDI_SP.s_Export_862DataTable dt = new BHEDI_SP.s_Export_862DataTable();
                        // run store procedure and return data table
                        sp.Fill(dt, stKey);
                        // create csv file
                        string strFileName = strSAPPath + "862_" + DateTime.Now.ToString("MMddyyyy_HHmmssfff") + ".csv";
                        
                        string strData = "";

                        if (intERPType == 2) // UVI ERP
                        {
                            File.WriteAllText(strFileName, str830Header2);
                            foreach (BHEDI_SP.s_Export_862Row dr in dt)
                            {
                                strData += Environment.NewLine + dr.SubmitDateTime.ToString("MM/dd/yyyy HH:mm") + "," + dr.ReleaseNumber + "," + "862" + "," + (dr.TransSetPurpose.Equals("00") ? "Original" : "Replace")
                               + "," + (DateTime.Compare(Common.MIN_DATE, dr.ForecastHorizonDateStart) == 0 ? "" : dr.ForecastHorizonDateStart.ToString("MM/dd/yyyy"))
                               + "," + (DateTime.Compare(Common.MIN_DATE, dr.ForecastHorizonEndDate) == 0 ? "" : dr.ForecastHorizonEndDate.ToString("MM/dd/yyyy"))
                               + "," + dr.ST_Code + "," + dr.SF_Code + "," + dr.BuyersPartID + "," + dr.l_PONum + "," + "" + "," + ""
                               + "," + dr.TotalDailyQty + "," + getForecastQualifier(dr.ForecastQualOrg) + "," + getForecastTimmingQualifier(dr.ForecastTimeQual)
                               + "," + (DateTime.Compare(Common.MIN_DATE, dr.FST_DeliveryShipmentDate) == 0 ? "" : dr.FST_DeliveryShipmentDate.ToString("MM/dd/yyyy"))
                               + "," + dr.ShipQty + "," + (DateTime.Compare(Common.MIN_DATE, dr.LastShipDate) == 0 ? "" : dr.LastShipDate.ToString("MM/dd/yyyy"))
                               + "," + dr.LastShipNum + "," + +dr.TotalShipQy
                               + "," + (DateTime.Compare(Common.MIN_DATE, dr.CumStartDate) == 0 ? "" : dr.CumStartDate.ToString("MM/dd/yyyy"));
                            }

                        }
                        else
                        {
                            // EKK SAP
                            File.WriteAllText(strFileName, str862Header);
                            foreach (BHEDI_SP.s_Export_862Row dr in dt)
                            {
                                File.WriteAllText(strFileName, str862Header);
                                string[] arrTmp = dr.FinalDelivery.Split('>');
                                string strFinalDeliveryHouse = "";
                                string strFinalDeliveryRoute = "";
                                if (arrTmp.Length >= 2)
                                    strFinalDeliveryHouse = arrTmp[1];
                                if (arrTmp.Length >= 4)
                                    strFinalDeliveryRoute = arrTmp[3];


                                strData += Environment.NewLine + dr.ReleaseNumber
                                    + "," + dr.SubmitDateTime.ToString("MM/dd/yyyy HH:mm")
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.SubmitDateTime) == 0 ? "" : Common.getHourMinFromDateTime(dr.SubmitDateTime))
                                    + "," + dr.TransSetPurpose
                                    + "," + dr.ReferenceID + "," + dr.ScheduleTypeQual + "," + (DateTime.Compare(Common.MIN_DATE, dr.ForecastHorizonDateStart) == 0 ? "" : dr.ForecastHorizonDateStart.ToString("MM/dd/yyyy"))
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.ForecastHorizonEndDate) == 0 ? "" : dr.ForecastHorizonEndDate.ToString("MM/dd/yyyy")) + "," + dr.PONum
                                    + "," + dr.TradingPartnerName + "," + dr.ISASenderID
                                    + "," + dr.SF_CodeQual + "," + dr.SF_Code + "," + dr.ST_CodeQual + "," + dr.ST_Code + "," + dr.SU_CodeQual + "," + dr.SU_Code
                                    + "," + dr.SP_CodeQual + "," + dr.SP_Code + "," + dr.l_ReleaseNumber + "," + dr.BuyersPartID + "," + dr.l_PONum + "," + dr.PartDescription
                                    + "," + dr.AssignedID + "," + dr.UOM + "," + dr.DK_Code + "," + dr.LF_Code + "," + strFinalDeliveryHouse + "," + strFinalDeliveryRoute
                                    + "," + dr.CarrierName + "," + dr.SealNumber + "," + dr.RouteQual + "," + dr.RouteReference + "," + dr.RouteOrderNumber
                                    + "," + dr.LocationQual + "," + dr.LocationID + "," + dr.CommuEX + "," + dr.CommuFX + "," + dr.CommuTE + "," + dr.OrderNumber
                                    + "," + "," + (DateTime.Compare(Common.MIN_DATE, dr.LastShipDate) == 0 ? "" : dr.LastShipDate.ToString("MM/dd/yyyy"))
                                    + "," + dr.ShipQty + "," + dr.CumAthQty + "," + (DateTime.Compare(Common.MIN_DATE, dr.CumStartDate) == 0 ? "" : dr.CumStartDate.ToString("MM/dd/yyyy"))
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.CumEndDate) == 0 ? "" : dr.CumEndDate.ToString("MM/dd/yyyy"))
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.FST_DeliveryShipmentDate) == 0 ? "" : dr.FST_DeliveryShipmentDate.ToString("MM/dd/yyyy"))
                                    + "," + dr.TotalDailyQty + "," + dr.ForecastQual + "," + dr.ForecastTimeQual
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.EstArrivalDate) == 0 ? "" : dr.EstArrivalDate.ToString("MM/dd/yyyy"))
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.ServiceStartDate) == 0 ? "" : dr.ServiceStartDate.ToString("MM/dd/yyyy"))
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.ServiceEndDate) == 0 ? "" : dr.ServiceEndDate.ToString("MM/dd/yyyy"))
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.PickupDate) == 0 ? "" : dr.PickupDate.ToString("MM/dd/yyyy"))
                                    + "," + (DateTime.Compare(Common.MIN_DATE, dr.PlanShipDate) == 0 ? "" : dr.PlanShipDate.ToString("MM/dd/yyyy"));
                            }
                        }

                        File.AppendAllText(strFileName, strData);
                        Common.writeLog(intTradingNo, intTsetNo, "Trading Partner: " + tbTrading.TradingPartnerName + " - Exported : " + strFileName, (int)Common.LOG_TYPE.JOB, DateTime.Now, intEDIRawNo);
                    }
                }



            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
            }
        }

        /// <summary>
        /// EDI 864 Header
        /// </summary>
        private string str864Header = "ReleaseDate,ReleaseTime,Tr_Set,TransDescription,CustomerName,CustomerID,PublishDate,MessageFrom,MessageTo,ReferenceNumber,Message";

        /// <summary>
        /// Export 864 data to SCP
        /// </summary>
        /// <param name="intEDIRawNo"></param>
        /// <param name="edm"></param>
        public void export864(int intEDIRawNo, BHEDI_EDM edm)
        {
            try
            {
                if (Common.SCP_OUT.Equals(""))
                    return;

                var tbEDI = edm.tblEDITrasactionRawDatas.Where(s => s.TransactionRawDataNo == intEDIRawNo).FirstOrDefault<tblEDITrasactionRawData>();

                if (tbEDI == null)
                    return;

                int intTradingNo = tbEDI.TradingPartnerNo_FK;
                int intTsetNo = tbEDI.TransactionSetNo_FK;

                var tbTrading = edm.tblTradingPartners.Where(s => s.TradingPartnerNo == intTradingNo).FirstOrDefault<tblTradingPartner>();
                if (tbTrading == null)
                    return;


                string strSenderID = tbTrading.InterchangeSenderID;
                string strReceiverID = tbTrading.InterchangeReceiverID;
                string strGSSenderID = tbTrading.ApplicationSenderCode;
                string strGSControlNum = tbEDI.GroupControlNum;
                string strISAControlNum = tbEDI.InterchangeControlNum;
                string strTransSetControlNum = tbEDI.TransactionKey;

                int intERPType = Common.myCInt(tbTrading.ERPNo_FK); // ERP Type  1: EKK SAP 2: UVI ERP
                if (intERPType != 1)
                    return;


                string strSAPPath = tbTrading.SCPFolder;
                if (Common.isNullEmptyNothing(strSAPPath))
                    strSAPPath = Common.SCP_OUT;
                else
                    strSAPPath = strSAPPath + "OUT\\";

                var query = from tb in edm.tblEDI_864_HEADER
                            where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                    && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum

                            orderby tb.NO descending
                            select tb;

                var tb864 = query.FirstOrDefault<tblEDI_864_HEADER>();
                if (tb864 == null)
                {

                    return;
                }
                string HdrKey = tb864.HdrKey;
                ArrayList arrHdrKey = new ArrayList();
                arrHdrKey.Add(HdrKey);

                // get another data from one set 820 that contains multiple transaction
                DateTime dtSubmitDateTime = Common.myCDate(tb864.SubmitDateTime);
                DateTime dtGenerateDateTime = Common.myCDate(tb864.GeneratedDateTime);
                int intNo = tb864.NO;

                var query2 = from tb in edm.tblEDI_864_HEADER
                             where tb.ISASenderID == strSenderID && tb.GSSenderID == strGSSenderID && tb.GSReceiverID == strReceiverID
                                     && tb.GSControlNum == strGSControlNum && tb.ISAControlNum == strISAControlNum
                                     && tb.SubmitDateTime == dtSubmitDateTime && tb.GeneratedDateTime == dtGenerateDateTime
                                     && tb.NO > intNo
                             select tb;

                var tbList864 = query2.ToList<tblEDI_864_HEADER>();
                foreach (tblEDI_864_HEADER tb in tbList864)
                {
                    arrHdrKey.Add(tb.HdrKey);
                }

                // loop on list of data
                foreach (string stKey in arrHdrKey)
                {
                    using (var sp = new BHEDI_SPTableAdapters.s_Export_864TableAdapter())
                    {
                        // set command time out
                        sp.SetCommandTimeout(0);
                        BHEDI_SP.s_Export_864DataTable dt = new BHEDI_SP.s_Export_864DataTable();
                        // run store procedure and return data table
                        sp.Fill(dt, stKey);
                        // create csv file
                        string strFileName = strSAPPath + "864_" + DateTime.Now.ToString("MMddyyyy_HHmmssfff") + ".csv";
                        File.WriteAllText(strFileName, str864Header);
                        string strData = "";
                        foreach (BHEDI_SP.s_Export_864Row dr in dt)
                        {
                            strData += Environment.NewLine + (DateTime.Compare(Common.MIN_DATE, dr.SubmitDateTime) == 0 ? "" : dr.SubmitDateTime.ToString("MM/dd/yyyy"))
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.SubmitDateTime) == 0 ? "" : Common.getHourMinFromDateTime(dr.SubmitDateTime))
                                + "," + dr.TransTypeCode + "," + dr.TransDescription
                                + "," + dr.TradingPartnerName + "," + dr.ISASenderID
                                + "," + (DateTime.Compare(Common.MIN_DATE, dr.PublishDate) == 0 ? "" : dr.PublishDate.ToString("MM/dd/yyyy"))
                                + "," + dr.SF_Name + "," + dr.ST_Name + "," + dr.DocumentIDNum + "," + dr.MsgText ;

                        }
                        File.AppendAllText(strFileName, strData);
                        Common.writeLog(intTradingNo, intTsetNo, "Trading Partner: " + tbTrading.TradingPartnerName + " - Exported : " + strFileName, (int)Common.LOG_TYPE.JOB, DateTime.Now, intEDIRawNo);
                    }
                }




            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
            }
        }

#endregion

        #region Import from SAP

        /// <summary>
        /// Import 856, 810 csv from SCP and transgfer to 856 XML format
        /// </summary>
        public void import856810()
        {
            try
            {

                // exit if no SCP function installed
                if (Common.SCP_IN.Equals(""))
                    return;

                if (!Directory.Exists(Common.SCP_IN))
                    return;

                DirectoryInfo di = new DirectoryInfo(Common.SCP_IN);
                string strBackupSCP = di.Parent.FullName;
                strBackupSCP += "\\BACKUP\\";
                 if (!Directory.Exists(strBackupSCP))
                     Directory.CreateDirectory(strBackupSCP);

                // local variable
                string strErrMsg = "";
                bool isError = false;
                string strXMLData = "";
                string strXMLFile = "";
                bool isHeader = false;
                int HierarchicalCode = 1;
                int HierarchicalCodeParent = 1;
                string strNumberOfItem = "";
                string strTotalShipQty = "";
                string strItemID = "";
                string strBackupFile = "";
                string strPalletID = "";
                bool is856 = true;
                string strSenderID = "";
                string strSenderIDQual = "";
                string strReceiveID = "";
                string strReceiveIDQual = "";
                string strAppSenderID = "";
                string strAppReceiveID = "";
                int intTotalQty = 0;
                int intQty = 0;
                decimal decAmount = 0;
                decimal decTotalAmount = 0;
                double dblPrice = 0;
                string POLineNum = "";
                int totalShipQty = 0;
                int totalItem = 0;
                double grossWeight = 0;
                double netWeight = 0;
                int totalPallet = 0;
                int totalNonPallet = 0;
                int totalTote = 0;
                string ItemAssignedID830 = "";
                string RefLotNum = "";
                string RefLotSeq = "";
                string RoutingQual = "";
                string RouteOrder = "";
                string PTransMethod = "";
                string RouteRef = "";
                string PEquipNumber = "";
                string SealNumber = "";
                string PLocationQual = "";
                string PLocationID = "";
                string ItemAssignedID862 = "";
                string FinalDeliveryHouse = "";
                string RefCSCNQual = "";
                string RefCSCN = "";
                string ReturnableContainerQual = "";
                string ReturnableContainer = "";
                string StandardPackQtyIDQual = "";
                string StandardParkQty = "";
                string ProjectNum = "";
                string ReleaseNumber = "";
                string DrawingRevisionQual = "";
                string DrawingRevision = "";
                string GMLocationID = "";
                bool isChrysler = false;
                string strPalletPkgID = "";
                string strLidPkgID = "";
                string strContID = "";
                string strBOLNumber = "";
                string strPackingListNumber = "";
               

                string[] files = Directory.GetFiles(Common.SCP_IN);
                foreach (string file in files) // loop all file on SCP in folder
                {
                    // reset local variable
                    isError = false; // error check 
                    strXMLData = "";  // XML data
                    strXMLFile = ""; // XML file
                    isHeader = false; // generate header
                    HierarchicalCode = 1;
                    HierarchicalCodeParent = 1;
                    strNumberOfItem = "";
                    strTotalShipQty = "";
                    strItemID = "";
                    strPalletID = "";
                    is856 = true;
                    strSenderID = "";
                    strSenderIDQual = "";
                    strReceiveID = "";
                    strReceiveIDQual = "";
                    strAppSenderID = "";
                    strAppReceiveID = "";
                    intTotalQty = 0;
                    intQty = 0;
                    decAmount = 0;
                    decTotalAmount = 0;
                    dblPrice = 0;
                    POLineNum = "";
                    totalShipQty = 0;
                    totalItem = 0;
                    grossWeight = 0;
                    netWeight = 0;
                    totalPallet = 0;
                    totalNonPallet = 0;
                    ItemAssignedID830 = "";
                    RefLotNum = "";
                    RefLotSeq = "";
                    RoutingQual = "";
                    RouteOrder = "";
                    PTransMethod = "";
                    RouteRef = "";
                    PEquipNumber = "";
                    SealNumber = "";
                    PLocationQual = "";
                    PLocationID = "";
                    ItemAssignedID862 = "";
                    FinalDeliveryHouse = "";
                    RefCSCNQual = "";
                    RefCSCN = "";
                    ReturnableContainerQual = "";
                    ReturnableContainer = "";
                    StandardPackQtyIDQual = "";
                    StandardParkQty = "";
                    ProjectNum = "";
                    ReleaseNumber = "";
                    DrawingRevisionQual = "";
                    DrawingRevision = "";
                    GMLocationID = "";
                    isChrysler = false;
                    ArrayList palletSerialNumbers = new ArrayList();
                    strPalletPkgID = "";
                    strLidPkgID = "";
                    strContID = "";
                    strBOLNumber = "";
                    strPackingListNumber = "";

                    string[] lines = System.IO.File.ReadAllLines(file);
                    // check 810 or 856 on header comlumn
                    string[] first = lines[0].Split(',');
                    if (first[0].Equals("CustomerID")) // 810 Invoice
                        is856 = false;

                    
                    for (int i = 1; i < lines.Length; i++) // loop all in lines keep first line for header
                    {
                        if (lines[i].Trim().Equals(""))
                            continue;

                        
                        string[] line = lines[i].Split(',');
                        
                        /////////////// Process for 856 ASN ////////////////
                        if (is856)
                        {
                            // data check
                            // data format
                            if (line.Length < NumberColumns856)
                            {
                                strErrMsg = "Import 856 data : " + file + " Error: Incorrect data format at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;

                            }
                            // Shipment Number
                            if (Common.isNullEmptyNothing(line[ShipmentNumber].Trim()))
                            {
                                strErrMsg = "Import 856 data : " + file + " Error: missing Shipment Number at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // ShipDate
                            if (Common.isNullEmptyNothing(line[ShipDate].Trim()))
                            {
                                strErrMsg = "Import 856 data : " + file + " Error: missing Ship Date at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Ship Time
                            if (Common.isNullEmptyNothing(line[ShipTime].Trim()))
                            {
                                strErrMsg = "Import 856 data : " + file + " Error: missing Ship Time at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }

                            // Estimate Delivery Date
                            if (Common.isNullEmptyNothing(line[EstimateDeliDate].Trim()))
                            {
                                strErrMsg = "Import 856 data : " + file + " Error: missing Estimate Delivery Date at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // 

                            // Estimate Delivery Time
                            if (Common.isNullEmptyNothing(line[EstimateDeliTime].Trim()))
                            {
                                strErrMsg = "Import 856 data : " + file + " Error: missing Estimate Delivery Time at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Customer ID
                            if (Common.isNullEmptyNothing(line[CustomerID].Trim()))
                            {
                                strErrMsg = "Import 856 data : " + file + " Error: missing CustomerID at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            else
                            {
                                // find EDI ID
                                if (!isHeader)
                                {
                                    strSenderID = line[CustomerID].Trim();
                                    // Change to Chrysler ID
                                    if (strSenderID.Contains(ChryslerID1) || strSenderID.Contains(ChryslerID2))
                                    {
                                        strSenderID = ChryslerID1;
                                        isChrysler = true;
                                    }

                                    using (var edm = new BHEDI_EDM())
                                    {
                                        var trading = edm.tblTradingPartners.Where(s => s.InterchangeSenderID == strSenderID).Where(s => s.blnUseSCP == true).FirstOrDefault<tblTradingPartner>();


                                        if (trading == null) // invalid sender id
                                        {
                                            isError = true;
                                        }
                                        else
                                        {
                                            // get EDI ID from BHEDI
                                            strSenderIDQual = trading.InterchangeSenderIDQual;
                                            strReceiveID = trading.InterchangeReceiverID;
                                            strReceiveIDQual = trading.InterchangeReceiverIDQual;
                                            strAppSenderID = trading.ApplicationSenderCode;
                                            strAppReceiveID = trading.ApplicationReceiverCode;
                                        }
                                    }

                                    if (isError) // error when SCP sends incorrect customer sender id
                                    {
                                        strErrMsg = "Import 856 data : " + file + " Error: Invalid Sender ID: " + strSenderID + " at line:" + (i + 1);
                                        Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                        if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                        {
                                            Common.sendEmail(strErrMsg, Common.EMAIL);
                                        }
                                        break;
                                    }

                                }
                            }

                            // Shipto ID
                            if (Common.isNullEmptyNothing(line[ShiptoID].Trim()))
                            {
                                strErrMsg = "Import 856 data : " + file + " Error: missing Shipto ID at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            //Supplier ID
                            if (Common.isNullEmptyNothing(line[SupplierID].Trim()))
                            {
                                strErrMsg = "Import 856 data : " + file + " Error: missing Supplier ID at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Customer Part ID
                            if (Common.isNullEmptyNothing(line[CustomerPartID].Trim()))
                            {
                                strErrMsg = "Import 856 data : " + file + " Error: missing Customer Item ID at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Shipped Qty
                            if (Common.isNullEmptyNothing(line[ShippedQty].Trim()))
                            {
                                strErrMsg = "Import 856 data : " + file + " Error: missing Ship Qty at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Ship Request Date
                            if (Common.isNullEmptyNothing(line[ShipRequestDate].Trim()))
                            {
                                strErrMsg = "Import 856 data : " + file + " Error: missing Ship Request at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }

                            // Total Container Qty
                            if (Common.isNullEmptyNothing(line[TotalContainerQty].Trim()))
                            {
                                strErrMsg = "Import 856 data : " + file + " Error: missing Total Container Qty at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }

                            // Container Serial Num
                            if (Common.isNullEmptyNothing(line[ContainerSerialNum].Trim()))
                            {
                                strErrMsg = "Import 856 data : " + file + " Error: missing Packaging Code at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Container Qty
                            if (Common.isNullEmptyNothing(line[ContainerQty].Trim()))
                            {
                                strErrMsg = "Import 856 data : " + file + " Error: missing Container Qty at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }

                            // Generate XML data
                            if (!isError)
                            {
                                if (isChrysler) // TARE - ITEM - TOTE
                                {
                                    if (!isHeader)
                                    {
                                        // calculate weight
                                        calculateTotalWeightAndShipQty(lines, ref totalShipQty, ref totalItem, ref grossWeight, ref netWeight
                                            , ref totalPallet, ref totalNonPallet, ref palletSerialNumbers,ref totalTote);
                                        isHeader = true;
                                        strXMLData = "<ASN>" + Environment.NewLine;
                                        strXMLData += "<TransactionSet>" + Environment.NewLine;
                                        strXMLData += "<TransactionSetCode>" + (Common.EDI_FACT_LIST.Contains(strSenderID) ? "DESADV" : "856") + "</TransactionSetCode>" + Environment.NewLine;
                                        strXMLData += "<TransactionSetPurposeCode>" + line[TransactionSetPurposeCode].Trim() + "</TransactionSetPurposeCode>" + Environment.NewLine;
                                        strXMLData += "<Sender_ID>" + strSenderID + "</Sender_ID>" + Environment.NewLine;
                                        strXMLData += "<Sender_ID_Qualifier>" + strSenderIDQual + "</Sender_ID_Qualifier>" + Environment.NewLine;
                                        strXMLData += "<Receiver_ID>" + strReceiveID + "</Receiver_ID>" + Environment.NewLine;
                                        strXMLData += "<Receiver_ID_Qualifier>" + strReceiveIDQual + "</Receiver_ID_Qualifier>" + Environment.NewLine;
                                        strXMLData += "<Application_Sender_ID>" + strAppSenderID + "</Application_Sender_ID>" + Environment.NewLine;
                                        strXMLData += "<Application_Receiver_ID>" + strAppReceiveID + "</Application_Receiver_ID>" + Environment.NewLine;
                                        strXMLData += "<ShipmentCode>" + line[ShipmentNumber].Trim() + "</ShipmentCode>" + Environment.NewLine;
                                        strXMLData += "<CreateDate>" + DateTime.Now.ToString("yyyyMMdd") + "</CreateDate>" + Environment.NewLine;
                                        strXMLData += "<CreateTime>" + DateTime.Now.ToString("HHmm") + "</CreateTime>" + Environment.NewLine;
                                        strXMLData += "<ShipDate>" + Common.convertDate4(line[ShipDate].Trim()) + "</ShipDate>" + Environment.NewLine;
                                        //strXMLData += "<ShipTime>" + line[ShipTime].Trim().Replace(":", "") + "</ShipTime>" + Environment.NewLine;
                                        strXMLData += "<ShipTime>" + DateTime.Now.ToString("HHmm") + "</ShipTime>" + Environment.NewLine;
                                        strXMLData += "<ETADate>" + Common.convertDate4(line[EstimateDeliDate].Trim()) + "</ETADate>" + Environment.NewLine;
                                        //strXMLData += "<ETATime>" + line[EstimateDeliTime].Trim().Replace(":", "") + "</ETATime>" + Environment.NewLine;
                                        strXMLData += "<ETATime>" + DateTime.Now.ToString("HHmm") + "</ETATime>" + Environment.NewLine;
                                        strXMLData += "<Shipment>" + Environment.NewLine;
                                        strXMLData += "<HierarchicalCode>1</HierarchicalCode>" + Environment.NewLine;
                                        strXMLData += "<HierarchicalParentCode>-1</HierarchicalParentCode>" + Environment.NewLine;
                                        strXMLData += "<HierarchicalLevelCode>S</HierarchicalLevelCode>" + Environment.NewLine;
                                        strXMLData += "<Measurements>" + Environment.NewLine;
                                        strXMLData += "<PhysicalReferenceCode>" + "PD" + "</PhysicalReferenceCode>" + Environment.NewLine;
                                        strXMLData += "<QualifierCode>" + "G" + "</QualifierCode>" + Environment.NewLine;
                                        strXMLData += "<Value>" + Common.myCInt(grossWeight) + "</Value>" + Environment.NewLine;
                                        strXMLData += "<CompositeUnit>" + (line[CompositeUnit].Trim().Equals("") ? "LB" : line[CompositeUnit].Trim()) + "</CompositeUnit>" + Environment.NewLine;
                                        strXMLData += "</Measurements>" + Environment.NewLine;
                                        strXMLData += "<Measurements>" + Environment.NewLine;
                                        strXMLData += "<PhysicalReferenceCode>" + "PD" + "</PhysicalReferenceCode>" + Environment.NewLine;
                                        strXMLData += "<QualifierCode>" + "N" + "</QualifierCode>" + Environment.NewLine;
                                        strXMLData += "<Value>" + Common.myCInt(netWeight) + "</Value>" + Environment.NewLine;
                                        strXMLData += "<CompositeUnit>" + (line[CompositeUnit].Trim().Equals("") ? "LB" : line[CompositeUnit].Trim()) + "</CompositeUnit>" + Environment.NewLine;
                                        strXMLData += "</Measurements>" + Environment.NewLine;
                                        strXMLData += "<CarrierQuantityAndWeight>" + Environment.NewLine;
                                        strContID = line[ContainerPkgCode].Trim();
                                        strBOLNumber = (line[BOLNum].Trim().Equals("") ? line[ShipmentNumber].Trim() : line[BOLNum].Trim());
                                        strPackingListNumber = line[ShipmentNumber].Trim();
                                        if (isChrysler && totalPallet > 0) // For Chrysler
                                        {
                                            strPalletPkgID = line[PalletPkgCode].Trim();
                                            strLidPkgID = line[LidPackageCode].Trim();
                                            strXMLData += "<PackagingCode>" + "PLT94" + "</PackagingCode>" + Environment.NewLine;
                                            strXMLData += "<LadingQuantity>" + totalPallet + "</LadingQuantity>" + Environment.NewLine;
                                            
                                        }
                                        else
                                        {
                                            strXMLData += "<PackagingCode>" + "CTN25" + "</PackagingCode>" + Environment.NewLine;
                                            strXMLData += "<LadingQuantity>" + Common.myCInt(line[TotalContainerQty]) + "</LadingQuantity>" + Environment.NewLine;

                                        }
                                        strXMLData += "</CarrierQuantityAndWeight>" + Environment.NewLine;
                                        
                                        strXMLData += "<CarrierRoutingSequence>" + Environment.NewLine;
                                        strXMLData += "<RoutingSequenceCode>" + "B" + "</RoutingSequenceCode>" + Environment.NewLine;
                                        strXMLData += "<CodeQualifier>" + "2" + "</CodeQualifier>" + Environment.NewLine;
                                        strXMLData += "<CarrierCode>" + (line[SCACCode].Trim().Equals("") ? "FedEx" : line[SCACCode].Trim()) + "</CarrierCode>" + Environment.NewLine;
                                        if (System.Text.RegularExpressions.Regex.IsMatch(line[LocationID].Trim(), "^[0-9]+$")) // pool id
                                        {
                                            strXMLData += "<PoolPointQual>PP</PoolPointQual>" + Environment.NewLine;
                                            strXMLData += "<PoolPointID>" + line[LocationID].Trim() + "</PoolPointID>" + Environment.NewLine;
                                        }
                                        strXMLData += "<TransportationMethod>" + (line[TransMode].Trim().Equals("") ? "M" : line[TransMode].Trim()) + "</TransportationMethod>" + Environment.NewLine;
                                        strXMLData += "<LocationCodeQualifier>" + line[LocationQual].Trim() + "</LocationCodeQualifier>" + Environment.NewLine;
                                        strXMLData += "<LocationCode>" + line[LocationID].Trim() + "</LocationCode>" + Environment.NewLine;
                                        strXMLData += "</CarrierRoutingSequence>" + Environment.NewLine;
                                        strXMLData += "<CarrierEquipment>" + Environment.NewLine;
                                        strXMLData += "<EquipmentDescriptionCode>" + (line[EquipCode].Trim().Equals("") ? "LT" : line[EquipCode].Trim()) + "</EquipmentDescriptionCode>" + Environment.NewLine;
                                        strXMLData += "<EquipmentNumber>" + (line[ReferenceNumber].Trim().Equals("") ? line[ShipmentNumber].Trim() : line[ReferenceNumber].Trim()) + "</EquipmentNumber>" + Environment.NewLine;
                                        strXMLData += "</CarrierEquipment>" + Environment.NewLine;
                                        strXMLData += "<PackingListNumber>" + line[ShipmentNumber].Trim() + "</PackingListNumber>" + Environment.NewLine;
                                        strXMLData += "<BLNum>" + (line[BOLNum].Trim().Equals("") ? line[ShipmentNumber].Trim() : line[BOLNum].Trim()) + "</BLNum>" + Environment.NewLine;
                                        strXMLData += "<EntityIdentifierCodeSupplier>" + "SU" + "</EntityIdentifierCodeSupplier>" + Environment.NewLine;
                                        strXMLData += "<IdentificationCodeQualifierSupplier>" + line[SupplierIDQual].Trim() + "</IdentificationCodeQualifierSupplier>" + Environment.NewLine;
                                        strXMLData += "<IdentificationSupplier>" + line[SupplierID].Trim() + "</IdentificationSupplier>" + Environment.NewLine;
                                        strXMLData += "<EntityIdentifierCodeShipFrom>" + "SF" + "</EntityIdentifierCodeShipFrom>" + Environment.NewLine;
                                        strXMLData += "<IdentificationCodeQualifierShipFrom>" + line[ShipFromIDQual].Trim() + "</IdentificationCodeQualifierShipFrom>" + Environment.NewLine;
                                        strXMLData += "<IdentificationCodeShipFrom>" + line[ShipFromID].Trim() + "</IdentificationCodeShipFrom>" + Environment.NewLine;
                                        strXMLData += "<EntityIdentifierCodeShipTo>" + "ST" + "</EntityIdentifierCodeShipTo>" + Environment.NewLine;
                                        strXMLData += "<IdentificationCodeQualifierShipTo>" + line[ShiptoIDQual].Trim() + "</IdentificationCodeQualifierShipTo>" + Environment.NewLine;
                                        strXMLData += "<IdentificationCodeShipTo>" + line[ShiptoID].Trim() + "</IdentificationCodeShipTo>" + Environment.NewLine;
                                        strXMLData += "<EntityIdentifierCodePlant>" + "MA" + "</EntityIdentifierCodePlant>" + Environment.NewLine;
                                        strXMLData += "<IdentificationCodeQualifierPlant>" + line[IdentificationCodePlantQual].Trim() + "</IdentificationCodeQualifierPlant>" + Environment.NewLine;
                                        strXMLData += "<IdentificationCodePlant>" + line[IdentificationCodePlant].Trim() + "</IdentificationCodePlant>" + Environment.NewLine;

                                        if (!line[AETCNumber].Trim().Equals(""))
                                        {
                                            strXMLData += "<AETCnumber>" + line[AETCNumber].Trim() + "</AETCnumber>" + Environment.NewLine;
                                        }

                                        // get total
                                        strNumberOfItem = totalItem.ToString();
                                        strTotalShipQty = totalShipQty.ToString();

                                        // Calculate Hierarchical level
                                        
                                        HierarchicalCode++;


                                        //if (isChrysler) // Output all pallet serial number at Tare level
                                        //{
                                        if (palletSerialNumbers.Count > 0)
                                        {

                                            strXMLData += "<TareHierachical>" + HierarchicalCode + "</TareHierachical>" + Environment.NewLine;
                                            strXMLData += "<TareHierarchicalLevelCode>" + "T" + "</TareHierarchicalLevelCode>" + Environment.NewLine;
                                            strXMLData += "<TareParentHierachical>1</TareParentHierachical>" + Environment.NewLine;
                                            strXMLData += "<PalletReference>" + Environment.NewLine;

                                            for (int j = 0; j < palletSerialNumbers.Count; j++)
                                            {
                                                strXMLData += "<SerialNum_Pallet>" + Common.myCStr(palletSerialNumbers[j]) + "</SerialNum_Pallet>" + Environment.NewLine;
                                            }

                                            strXMLData += "<PalletPkgCode>" + (line[PalletPkgCode].Trim().Equals("") ? "PLT90" : line[PalletPkgCode].Trim()) + "</PalletPkgCode>" + Environment.NewLine;
                                            strXMLData += "<PalletID>" + (line[PalletPkgCode].Trim().Equals("") ? "PLT90" : line[PalletPkgCode].Trim()) + "</PalletID>" + Environment.NewLine;
                                            strXMLData += "<NumberTotes>" + Common.myCInt(line[TotalContainerQty].Trim()) + "</NumberTotes>" + Environment.NewLine;
                                            strXMLData += "</PalletReference>" + Environment.NewLine;

                                            HierarchicalCodeParent = HierarchicalCode;
                                            HierarchicalCode++;
                                        }
                                        //}


                                    }
                                    //if (!strPalletID.Equals(line[PalletSerialNum].Trim())) 
                                    //{
                                        
                                    //    // Pallet ID
                                    //    strPalletID = line[PalletSerialNum].Trim();

                                    //    strXMLData += "<TTareHierachical>" + HierarchicalCode + "</TTareHierachical>" + Environment.NewLine;
                                    //    strXMLData += "<TTareHierarchicalLevelCode>" + "T" + "</TTareHierarchicalLevelCode>" + Environment.NewLine;
                                    //    strXMLData += "<TTareParentHierachical>1</TTareParentHierachical>" + Environment.NewLine;
                                    //    strXMLData += "<TPalletReference>" + Environment.NewLine;
                                    //    strXMLData += "<TSerialNum_Pallet>" + strPalletID + "</TSerialNum_Pallet>" + Environment.NewLine;
                                    //    strXMLData += "<TPalletPkgCode>" + (line[PalletPkgCode].Trim().Equals("") ? "PLT90" : line[PalletPkgCode].Trim()) + "</TPalletPkgCode>" + Environment.NewLine;
                                    //    strXMLData += "<TPalletID>" + (line[PalletPkgCode].Trim().Equals("") ? "PLT90" : line[PalletPkgCode].Trim()) + "</TPalletID>" + Environment.NewLine;
                                    //    strXMLData += "<NumberTotes>" + Common.myCInt(line[TotalContainerQty].Trim()) + "</NumberTotes>" + Environment.NewLine;
                                    //    strXMLData += "</TPalletReference>" + Environment.NewLine;
                                    //    HierarchicalCodeParent = HierarchicalCode;
                                    //    HierarchicalCode++;
                                    //}

                                    if (!strItemID.Equals(line[CustomerPartID].Trim())) // Item level
                                    {

                                        strItemID = line[CustomerPartID].Trim();
                                      
                                        strXMLData += "<ItemHierachical>" + HierarchicalCode + "</ItemHierachical>" + Environment.NewLine;
                                        strXMLData += "<ItemHierarchicalLevelCode>" + "O" + "</ItemHierarchicalLevelCode>" + Environment.NewLine;
                                        strXMLData += "<ItemParentHierachical>" + HierarchicalCodeParent + "</ItemParentHierachical>" + Environment.NewLine;
                                        strXMLData += "<ItemIdentification>" + Environment.NewLine;
                                        strXMLData += "<ItemCodeQualifier>" + "BP" + "</ItemCodeQualifier>" + Environment.NewLine;
                                        strXMLData += "<ItemCode>" + strItemID + "</ItemCode>" + Environment.NewLine;
                                        
                                        //if (ChryslerRetContID.Contains(strContID))
                                        //    strXMLData += "<ToteID>" + ChryslerRetContID + "</ToteID>" + Environment.NewLine;
                                        //else if (ChryslerExpContID.Contains(strContID))
                                        //    strXMLData += "<ToteID>" + ChryslerExpContID + "</ToteID>" + Environment.NewLine;
                                        //else
                                        //    strXMLData += "<ToteID>" + strContID + "</ToteID>" + Environment.NewLine;
                                        strXMLData += "<ToteID>" + strContID + "</ToteID>" + Environment.NewLine;

                                        strXMLData += "</ItemIdentification>" + Environment.NewLine;
                                            
                                        strXMLData += "<ItemShipmentDetails>" + Environment.NewLine;
                                        strXMLData += "<ActualNumberofUnitsShipped>" + Common.myCInt(line[ShippedQty].Trim()) + "</ActualNumberofUnitsShipped>" + Environment.NewLine;
                                        strXMLData += "<MeasurementCode>" + line[MeasurementCode].Trim() + "</MeasurementCode>" + Environment.NewLine;
                                        strXMLData += "<QuantityShippedToDate>" + Common.myCInt(line[QtyShipToDate].Trim()) + "</QuantityShippedToDate>" + Environment.NewLine;
                                        strXMLData += "<PurchaseOrderNumber>" + line[CustomerPO].Trim() + "</PurchaseOrderNumber>" + Environment.NewLine;
                                        if (!line[PackageCost].Trim().Equals(""))
                                        {
                                            strXMLData += "<ExpCost>" + line[PackageCost].Trim() + "</ExpCost>" + Environment.NewLine;
                                        }
                                        strXMLData += "<PackingListNumberLine>" + strPackingListNumber + "</PackingListNumberLine>" + Environment.NewLine;
                                        strXMLData += "<BLNumLine>" + strBOLNumber + "</BLNumLine>" + Environment.NewLine;
                                        strXMLData += "</ItemShipmentDetails>" + Environment.NewLine;

                                        strItemID = line[CustomerPartID].Trim();
                                        HierarchicalCode++;
                                    }

                                    strXMLData += "<Carton>" + Environment.NewLine;
                                    strXMLData += "<SerialNumberQualifier>" + "LS" + "</SerialNumberQualifier>" + Environment.NewLine;
                                    strXMLData += "<SerialNumber>" + line[ContainerSerialNum].Trim() + "</SerialNumber>" + Environment.NewLine;
                                    strXMLData += "</Carton>" + Environment.NewLine;
                                    
                                }
                                else // ITEM - TARE - TOTE
                                {
                                    if (!isHeader)
                                    {
                                        // calculate weight
                                        calculateTotalWeightAndShipQty(lines, ref totalShipQty, ref totalItem, ref grossWeight, ref netWeight
                                            , ref totalPallet, ref totalNonPallet, ref palletSerialNumbers, ref totalTote);
                                        // get EDI data baseon Item ID, PO and RAN
                                        using (var sp = new BHEDI_SPTableAdapters.s_ASN_GetEDITableAdapter())
                                        {
                                            sp.SetCommandTimeout(0);
                                            BHEDI_SP.s_ASN_GetEDIDataTable dt = new BHEDI_SP.s_ASN_GetEDIDataTable();
                                            // run store procedure and return data table
                                            sp.Fill(dt, line[CustomerPartID].Trim(), line[CustomerPO].Trim(), line[OrderNumber].Trim());
                                            foreach (BHEDI_SP.s_ASN_GetEDIRow dr in dt)
                                            {
                                                ItemAssignedID830 = dr.ItemAssignedID830;
                                                RefLotNum = dr.RefLotNum;
                                                RefLotSeq = dr.RefLotSeq;
                                                RoutingQual = dr.RoutingQual;
                                                RouteOrder = dr.RouteOrder;
                                                PTransMethod = dr.PTransMethod;
                                                RouteRef = dr.RouteRef;
                                                PEquipNumber = dr.PEquipNumber;
                                                SealNumber = dr.SealNumber;
                                                PLocationQual = dr.PLocationQual;
                                                PLocationID = dr.PLocationID;
                                                ItemAssignedID862 = dr.ItemAssignedID862;
                                                FinalDeliveryHouse = dr.FinalDeliveryHouse;
                                                RefCSCNQual = dr.RefCSCNQual;
                                                RefCSCN = dr.RefCSCN;
                                                ReturnableContainerQual = dr.ReturnableContainerQual;
                                                ReturnableContainer = dr.ReturnableContainer;
                                                StandardPackQtyIDQual = dr.StandardPackQtyIDQual;
                                                StandardParkQty = dr.StandardParkQty;
                                                ProjectNum = dr.ProjectNum;
                                                ReleaseNumber = dr.ReleaseNumber;
                                                DrawingRevisionQual = dr.DrawingRevisionQual;
                                                DrawingRevision = dr.DrawingRevision;
                                                POLineNum = dr.POLineNum;
                                                GMLocationID = dr.LocationID;
                                            }
                                        }

                                        isHeader = true;
                                        strXMLData = "<ASN>" + Environment.NewLine;
                                        strXMLData += "<TransactionSet>" + Environment.NewLine;
                                        strXMLData += "<TransactionSetCode>" + (Common.EDI_FACT_LIST.Contains(strSenderID) ? "DESADV" : "856") + "</TransactionSetCode>" + Environment.NewLine;
                                        strXMLData += "<TransactionSetPurposeCode>" + line[TransactionSetPurposeCode].Trim() + "</TransactionSetPurposeCode>" + Environment.NewLine;
                                        strXMLData += "<Sender_ID>" + strSenderID + "</Sender_ID>" + Environment.NewLine;
                                        strXMLData += "<Sender_ID_Qualifier>" + strSenderIDQual + "</Sender_ID_Qualifier>" + Environment.NewLine;
                                        strXMLData += "<Receiver_ID>" + strReceiveID + "</Receiver_ID>" + Environment.NewLine;
                                        strXMLData += "<Receiver_ID_Qualifier>" + strReceiveIDQual + "</Receiver_ID_Qualifier>" + Environment.NewLine;
                                        strXMLData += "<Application_Sender_ID>" + strAppSenderID + "</Application_Sender_ID>" + Environment.NewLine;
                                        strXMLData += "<Application_Receiver_ID>" + strAppReceiveID + "</Application_Receiver_ID>" + Environment.NewLine;
                                        strXMLData += "<ShipmentCode>" + line[ShipmentNumber].Trim() + "</ShipmentCode>" + Environment.NewLine;
                                        strXMLData += "<CreateDate>" + DateTime.Now.ToString("yyyyMMdd") + "</CreateDate>" + Environment.NewLine;
                                        strXMLData += "<CreateTime>" + DateTime.Now.ToString("HHmm") + "</CreateTime>" + Environment.NewLine;
                                        strXMLData += "<ShipDate>" + Common.convertDate4(line[ShipDate].Trim()) + "</ShipDate>" + Environment.NewLine;
                                        //strXMLData += "<ShipTime>" + line[ShipTime].Trim().Replace(":", "") + "</ShipTime>" + Environment.NewLine;
                                        strXMLData += "<ShipTime>" + DateTime.Now.ToString("HHmm") + "</ShipTime>" + Environment.NewLine;
                                        strXMLData += "<ETADate>" + Common.convertDate4(line[EstimateDeliDate].Trim()) + "</ETADate>" + Environment.NewLine;
                                        //strXMLData += "<ETATime>" + line[EstimateDeliTime].Trim().Replace(":", "") + "</ETATime>" + Environment.NewLine;
                                        strXMLData += "<ETATime>" + DateTime.Now.ToString("HHmm") + "</ETATime>" + Environment.NewLine;
                                        
                                        strXMLData += "<Shipment>" + Environment.NewLine;
                                        strXMLData += "<HierarchicalCode>1</HierarchicalCode>" + Environment.NewLine;
                                        strXMLData += "<HierarchicalParentCode>-1</HierarchicalParentCode>" + Environment.NewLine;
                                        strXMLData += "<HierarchicalLevelCode>S</HierarchicalLevelCode>" + Environment.NewLine;
                                        strXMLData += "<Measurements>" + Environment.NewLine;
                                        strXMLData += "<PhysicalReferenceCode>" + "PD" + "</PhysicalReferenceCode>" + Environment.NewLine;
                                        strXMLData += "<QualifierCode>" + "G" + "</QualifierCode>" + Environment.NewLine;
                                        strXMLData += "<Value>" + Common.myCInt(grossWeight) + "</Value>" + Environment.NewLine;
                                        strXMLData += "<CompositeUnit>" + (line[CompositeUnit].Trim().Equals("") ? "LB" : line[CompositeUnit].Trim()) + "</CompositeUnit>" + Environment.NewLine;
                                        strXMLData += "</Measurements>" + Environment.NewLine;
                                        strXMLData += "<Measurements>" + Environment.NewLine;
                                        strXMLData += "<PhysicalReferenceCode>" + "PD" + "</PhysicalReferenceCode>" + Environment.NewLine;
                                        strXMLData += "<QualifierCode>" + "N" + "</QualifierCode>" + Environment.NewLine;
                                        strXMLData += "<Value>" + Common.myCInt(netWeight) + "</Value>" + Environment.NewLine;
                                        strXMLData += "<CompositeUnit>" + (line[CompositeUnit].Trim().Equals("") ? "LB" : line[CompositeUnit].Trim()) + "</CompositeUnit>" + Environment.NewLine;
                                        strXMLData += "</Measurements>" + Environment.NewLine;
                                        strXMLData += "<CarrierQuantityAndWeight>" + Environment.NewLine;
                                        if (isChrysler && totalPallet > 0) // For Chrysler
                                        {
                                            strPalletPkgID = line[PalletPkgCode].Trim();
                                            strLidPkgID = line[LidPackageCode].Trim();
                                            strContID = line[ContainerPkgCode].Trim();
                                            strXMLData += "<PackagingCode>" + "PLT94" + "</PackagingCode>" + Environment.NewLine;
                                            strXMLData += "<LadingQuantity>" + totalPallet + "</LadingQuantity>" + Environment.NewLine;
                                            strBOLNumber = (line[BOLNum].Trim().Equals("") ? line[ShipmentNumber].Trim() : line[BOLNum].Trim());
                                            strPackingListNumber = line[ShipmentNumber].Trim();
                                        }
                                        else
                                        {
                                            strXMLData += "<PackagingCode>" + (line[PalletPkgCode].Trim().Equals("") ? "PLT90" : line[PalletPkgCode].Trim()) + "</PackagingCode>" + Environment.NewLine;
                                            strXMLData += "<LadingQuantity>" + Common.myCInt(line[TotalContainerQty]) + "</LadingQuantity>" + Environment.NewLine;

                                        }
                                        strXMLData += "</CarrierQuantityAndWeight>" + Environment.NewLine;
                                        strXMLData += "<GMLReference>" + Environment.NewLine;
                                        strXMLData += "<BLReferenceCode>" + (line[BOLNum].Trim().Equals("") ? line[ShipmentNumber].Trim() : line[BOLNum].Trim()) + "</BLReferenceCode>" + Environment.NewLine;
                                        //strXMLData += "<BLReferenceCode>" + (line[AETCNumber].Trim().Equals("") ? "N/A" : line[AETCNumber].Trim()) + "</BLReferenceCode>" + Environment.NewLine;
                                        
                                        strXMLData += "</GMLReference>" + Environment.NewLine;
                                        strXMLData += "<GMName>" + Environment.NewLine;
                                        strXMLData += "<GMPlant>" + (line[MI_ID].Trim().Equals("") ? line[IdentificationCodePlant].Trim() : line[MI_ID].Trim()) + "</GMPlant>" + Environment.NewLine;
                                        strXMLData += "<GMShipFrom>" + line[SupplierID].Trim() + "</GMShipFrom>" + Environment.NewLine;
                                        strXMLData += "<GMSHipTo>" + line[ShiptoID].Trim() + "</GMSHipTo>" + Environment.NewLine;
                                        strXMLData += "</GMName>" + Environment.NewLine;
                                        strXMLData += "<GLLocationReference>" + Environment.NewLine;
                                        strXMLData += "<GMLocation>" + GMLocationID + "</GMLocation>" + Environment.NewLine;
                                        strXMLData += "</GLLocationReference>" + Environment.NewLine;
                                        strXMLData += "<CarrierRoutingSequence>" + Environment.NewLine;
                                        strXMLData += "<RoutingSequenceCode>" + "B" + "</RoutingSequenceCode>" + Environment.NewLine;
                                        strXMLData += "<CodeQualifier>" + "02" + "</CodeQualifier>" + Environment.NewLine;
                                        strXMLData += "<CarrierCode>" + (line[SCACCode].Trim().Equals("") ? "FedEx" : line[SCACCode].Trim()) + "</CarrierCode>" + Environment.NewLine;
                                        strXMLData += "<TransportationMethod>" + (line[TransMode].Trim().Equals("") ? "M" : line[TransMode].Trim()) + "</TransportationMethod>" + Environment.NewLine;
                                        strXMLData += "<LocationCodeQualifier>" + line[LocationQual].Trim() + "</LocationCodeQualifier>" + Environment.NewLine;
                                        strXMLData += "<LocationCode>" + line[LocationID].Trim() + "</LocationCode>" + Environment.NewLine;
                                        strXMLData += "</CarrierRoutingSequence>" + Environment.NewLine;
                                        strXMLData += "<CarrierEquipment>" + Environment.NewLine;
                                        strXMLData += "<EquipmentDescriptionCode>" + (line[EquipCode].Trim().Equals("") ? "LT" : line[EquipCode].Trim()) + "</EquipmentDescriptionCode>" + Environment.NewLine;
                                        strXMLData += "<EquipmentNumber>" + (line[ReferenceNumber].Trim().Equals("") ? line[ShipmentNumber].Trim() : line[ReferenceNumber].Trim()) + "</EquipmentNumber>" + Environment.NewLine;
                                        strXMLData += "</CarrierEquipment>" + Environment.NewLine;
                                        strXMLData += "<PolarisCarrierInfo>" + Environment.NewLine;
                                        strXMLData += "<RoutingQual>" + RoutingQual + "</RoutingQual>" + Environment.NewLine;
                                        strXMLData += "<RouteOrder>" + RouteOrder + "</RouteOrder>" + Environment.NewLine;
                                        strXMLData += "<PTransMethod>" + PTransMethod + "</PTransMethod>" + Environment.NewLine;
                                        strXMLData += "<RouteRef>" + RouteRef + "</RouteRef>" + Environment.NewLine;
                                        strXMLData += "<PEquipNumber>" + PEquipNumber + "</PEquipNumber>" + Environment.NewLine;
                                        strXMLData += "<SealNumber>" + SealNumber + "</SealNumber>" + Environment.NewLine;
                                        strXMLData += "<PLocationQual>" + PLocationQual + "</PLocationQual>" + Environment.NewLine;
                                        strXMLData += "<PLocationID>" + PLocationID + "</PLocationID>" + Environment.NewLine;
                                        strXMLData += "</PolarisCarrierInfo>" + Environment.NewLine;
                                        strXMLData += "<Reference1>" + Environment.NewLine;
                                        strXMLData += "<PKCodeQual>" + "PK" + "</PKCodeQual>" + Environment.NewLine;
                                        strXMLData += "<PackingListNumber>" + line[ShipmentNumber].Trim() + "</PackingListNumber>" + Environment.NewLine;
                                        strXMLData += "<InvoiceNumber>" + line[ShipmentNumber].Trim() + "</InvoiceNumber>" + Environment.NewLine;
                                        strXMLData += "</Reference1>" + Environment.NewLine;
                                        strXMLData += "<Reference>" + Environment.NewLine;
                                        strXMLData += "<ReferenceCodeQualifier>" + "BM" + "</ReferenceCodeQualifier>" + Environment.NewLine;
                                        strXMLData += "<ReferenceCode>" + (line[BOLNum].Trim().Equals("") ? line[ShipmentNumber].Trim() : line[BOLNum].Trim()) + "</ReferenceCode>" + Environment.NewLine;
                                        strXMLData += "</Reference>" + Environment.NewLine;
                                        strXMLData += "<Reference2>" + Environment.NewLine;
                                        strXMLData += "<CNCodeQual>" + "CN" + "</CNCodeQual>" + Environment.NewLine;
                                        strXMLData += "<ProNumber>" + (line[ProNum].Trim().Equals("") ? line[ShipmentNumber].Trim() : line[ProNum].Trim()) + "</ProNumber>" + Environment.NewLine;
                                        strXMLData += "</Reference2>" + Environment.NewLine;
                                        strXMLData += "<Reference3>" + Environment.NewLine;
                                        strXMLData += "<RefCSCNQual>" + RefCSCNQual + "</RefCSCNQual>" + Environment.NewLine;
                                        strXMLData += "<RefCSCN>" + RefCSCN + "</RefCSCN>" + Environment.NewLine;
                                        strXMLData += "</Reference3>" + Environment.NewLine;
                                        strXMLData += "<ETADate2>" + line[EstimateDeliDate].Trim() + "</ETADate2>" + Environment.NewLine;
                                        strXMLData += "<ETATime2>" + line[EstimateDeliTime].Trim() + "</ETATime2>" + Environment.NewLine;
                                        strXMLData += "<NamePlant>" + Environment.NewLine;
                                        strXMLData += "<EntityIdentifierCodePlant>" + "MI" + "</EntityIdentifierCodePlant>" + Environment.NewLine;
                                        strXMLData += "<IdentificationCodeQualifierPlant>" + "92" + "</IdentificationCodeQualifierPlant>" + Environment.NewLine;
                                        strXMLData += "<IdentificationCodePlant>" + line[ShiptoID].Trim() + "</IdentificationCodePlant>" + Environment.NewLine;
                                        strXMLData += "</NamePlant>" + Environment.NewLine;
                                        strXMLData += "<NameFrom>" + Environment.NewLine;
                                        strXMLData += "<EntityIdentifierCodeShipFrom>" + "SF" + "</EntityIdentifierCodeShipFrom>" + Environment.NewLine;
                                        strXMLData += "<IdentificationCodeQualifierShipFrom>" + "92" + "</IdentificationCodeQualifierShipFrom>" + Environment.NewLine;
                                        strXMLData += "<IdentificationCodeShipFrom>" + line[SupplierID].Trim() + "</IdentificationCodeShipFrom>" + Environment.NewLine;
                                        strXMLData += "</NameFrom>" + Environment.NewLine;
                                        strXMLData += "<NameTo>" + Environment.NewLine;
                                        strXMLData += "<EntityIdentifierCodeShipTo>" + "ST" + "</EntityIdentifierCodeShipTo>" + Environment.NewLine;
                                        strXMLData += "<IdentificationCodeQualifierShipTo>" + "92" + "</IdentificationCodeQualifierShipTo>" + Environment.NewLine;
                                        strXMLData += "<IdentificationCodeShipTo>" + line[ShiptoID].Trim() + "</IdentificationCodeShipTo>" + Environment.NewLine;
                                        strXMLData += "</NameTo>" + Environment.NewLine;


                                        if (MatinreadIDList.Contains(line[CustomerID].Trim()))
                                        {
                                            strXMLData += "<Name>" + Environment.NewLine;
                                            strXMLData += "<EntityIdentifierCode>" + "ST" + "</EntityIdentifierCode>" + Environment.NewLine;
                                            strXMLData += "<IdentificationCodeQualifier>" + "92" + "</IdentificationCodeQualifier>" + Environment.NewLine;
                                            strXMLData += "<IdentificationCode>" + line[CustomerID].Trim() + "</IdentificationCode>" + Environment.NewLine;
                                            strXMLData += "<IdentificationCodeQualifier2>" + "1" + "</IdentificationCodeQualifier2>" + Environment.NewLine;
                                            strXMLData += "<IdentificationCode2>" + line[ShiptoID].Trim() + "</IdentificationCode2>" + Environment.NewLine;
                                            strXMLData += "</Name>" + Environment.NewLine;
                                            strXMLData += "<Name>" + Environment.NewLine;
                                            strXMLData += "<EntityIdentifierCode>" + "SF" + "</EntityIdentifierCode>" + Environment.NewLine;
                                            strXMLData += "<IdentificationCodeQualifier>" + "92" + "</IdentificationCodeQualifier>" + Environment.NewLine;
                                            strXMLData += "<IdentificationCode>" + line[SupplierID].Trim() + "</IdentificationCode>" + Environment.NewLine;
                                            strXMLData += "<IdentificationCodeQualifier2>" + "92" + "</IdentificationCodeQualifier2>" + Environment.NewLine;
                                            strXMLData += "<IdentificationCode2>" + line[SupplierID].Trim() + "</IdentificationCode2>" + Environment.NewLine;
                                            strXMLData += "</Name>" + Environment.NewLine;
                                        }
                                        else
                                        {
                                            strXMLData += "<Name>" + Environment.NewLine;
                                            strXMLData += "<EntityIdentifierCode>" + "SU" + "</EntityIdentifierCode>" + Environment.NewLine;
                                            strXMLData += "<IdentificationCodeQualifier>" + "92" + "</IdentificationCodeQualifier>" + Environment.NewLine;
                                            strXMLData += "<IdentificationCode>" + line[SupplierID].Trim() + "</IdentificationCode>" + Environment.NewLine;
                                            strXMLData += "<IdentificationCodeQualifier2>" + "92" + "</IdentificationCodeQualifier2>" + Environment.NewLine;
                                            strXMLData += "<IdentificationCode2>" + line[SupplierID].Trim() + "</IdentificationCode2>" + Environment.NewLine;
                                            strXMLData += "</Name>" + Environment.NewLine;
                                            strXMLData += "<Name>" + Environment.NewLine;
                                            strXMLData += "<EntityIdentifierCode>" + "ST" + "</EntityIdentifierCode>" + Environment.NewLine;
                                            strXMLData += "<IdentificationCodeQualifier>" + "92" + "</IdentificationCodeQualifier>" + Environment.NewLine;
                                            strXMLData += "<IdentificationCode>" + line[ShiptoID].Trim() + "</IdentificationCode>" + Environment.NewLine;
                                            strXMLData += "<IdentificationCodeQualifier2>" + "92" + "</IdentificationCodeQualifier2>" + Environment.NewLine;
                                            strXMLData += "<IdentificationCode2>" + line[ShiptoID].Trim() + "</IdentificationCode2>" + Environment.NewLine;
                                            strXMLData += "</Name>" + Environment.NewLine;

                                        }

                                        strXMLData += "<FOB>" + Environment.NewLine;
                                        strXMLData += "<ShipmentMethodOfPayment>" + line[ShipmentMethodOfPayment].Trim() + "</ShipmentMethodOfPayment>" + Environment.NewLine;
                                        strXMLData += "</FOB>" + Environment.NewLine;
                                        strXMLData += "<MasterPallet>" + Environment.NewLine;
                                        strXMLData += "<NumberMasterPallet>" + totalPallet + "</NumberMasterPallet>" + Environment.NewLine;
                                        strXMLData += "</MasterPallet>" + Environment.NewLine;
                                        strXMLData += "<MixPallet>" + Environment.NewLine;
                                        strXMLData += "<NumberMixPallet>" + totalNonPallet + "</NumberMixPallet>" + Environment.NewLine;
                                        strXMLData += "</MixPallet>" + Environment.NewLine;

                                        // get total
                                        strNumberOfItem = totalItem.ToString();
                                        strTotalShipQty = totalShipQty.ToString();

                                        // Calculate Hierarchical level
                                        HierarchicalCode++;
                                        HierarchicalCodeParent = HierarchicalCode;

                                    }

                                    // detail - item id is a key
                                    if (!strItemID.Equals(line[CustomerPartID].Trim())) // first item
                                    {
                                        
                                        // get EDI data baseon Item ID, PO and RAN
                                        using (var sp = new BHEDI_SPTableAdapters.s_ASN_GetEDITableAdapter())
                                        {
                                            sp.SetCommandTimeout(0);
                                            BHEDI_SP.s_ASN_GetEDIDataTable dt = new BHEDI_SP.s_ASN_GetEDIDataTable();
                                            // run store procedure and return data table
                                            sp.Fill(dt, line[CustomerPartID].Trim(), line[CustomerPO].Trim(), line[OrderNumber].Trim());
                                            foreach (BHEDI_SP.s_ASN_GetEDIRow dr in dt)
                                            {
                                                ItemAssignedID830 = dr.ItemAssignedID830;
                                                RefLotNum = dr.RefLotNum;
                                                RefLotSeq = dr.RefLotSeq;
                                                RoutingQual = dr.RoutingQual;
                                                RouteOrder = dr.RouteOrder;
                                                PTransMethod = dr.PTransMethod;
                                                RouteRef = dr.RouteRef;
                                                PEquipNumber = dr.PEquipNumber;
                                                SealNumber = dr.SealNumber;
                                                PLocationQual = dr.PLocationQual;
                                                PLocationID = dr.PLocationID;
                                                ItemAssignedID862 = dr.ItemAssignedID862;
                                                FinalDeliveryHouse = dr.FinalDeliveryHouse;
                                                RefCSCNQual = dr.RefCSCNQual;
                                                RefCSCN = dr.RefCSCN;
                                                ReturnableContainerQual = dr.ReturnableContainerQual;
                                                ReturnableContainer = dr.ReturnableContainer;
                                                StandardPackQtyIDQual = dr.StandardPackQtyIDQual;
                                                StandardParkQty = dr.StandardParkQty;
                                                ProjectNum = dr.ProjectNum;
                                                ReleaseNumber = dr.ReleaseNumber;
                                                DrawingRevisionQual = dr.DrawingRevisionQual;
                                                DrawingRevision = dr.DrawingRevision;
                                                POLineNum = dr.POLineNum;
                                            }
                                        }

                                        // Item ID
                                        strItemID = line[CustomerPartID].Trim();
                                        // Pallet ID
                                        strPalletID = line[PalletSerialNum].Trim();

                                        strXMLData += "<HierarchicalCode_O_Level>" + HierarchicalCode + "</HierarchicalCode_O_Level>" + Environment.NewLine;
                                        strXMLData += "<HierarchicalLevelCode_O_Level>" + "O" + "</HierarchicalLevelCode_O_Level>" + Environment.NewLine;
                                        strXMLData += "<HierarchicalParentCode_O_Level>" + "1" + "</HierarchicalParentCode_O_Level>" + Environment.NewLine;
                                        strXMLData += "<GMPackaging>" + Environment.NewLine;
                                        strXMLData += "<GMNumberOfContainers>" + Common.myCInt(line[TotalContainerQty].Trim()) + "</GMNumberOfContainers>" + Environment.NewLine;
                                        strXMLData += "<GMContainerPackagingCode>" + (line[ContainerPkgCode].Trim().Equals("") ? "CTN90" : line[ContainerPkgCode].Trim()) + "</GMContainerPackagingCode>" + Environment.NewLine;
                                        strXMLData += "<GMPackagingID>" + "16" + "</GMPackagingID>" + Environment.NewLine;
                                        strXMLData += "</GMPackaging>" + Environment.NewLine;

                                        strXMLData += "<ItemIdentification_O_Level>" + Environment.NewLine;
                                        strXMLData += "<ItemCodeQualifier_O_Level>" + "O" + "</ItemCodeQualifier_O_Level>" + Environment.NewLine;
                                        strXMLData += "<ItemCode_O_Level>" + strItemID + "</ItemCode_O_Level>" + Environment.NewLine;
                                        strXMLData += "</ItemIdentification_O_Level>" + Environment.NewLine;
                                        strXMLData += "<ItemShipmentDetails_O_Level>" + Environment.NewLine;
                                        strXMLData += "<NumberofUnitsShipped_O_Level>" + Common.myCInt(line[ShippedQty].Trim()) + "</NumberofUnitsShipped_O_Level>" + Environment.NewLine;
                                        strXMLData += "<MeasurementCode_O_Level>" + (line[MeasurementCode].Trim().Equals("") ? "LT" : line[MeasurementCode].Trim()) + "</MeasurementCode_O_Level>" + Environment.NewLine;
                                        strXMLData += "<QuantityShippedToDate_O_Level>" + Common.myCInt(line[QtyShipToDate].Trim()) + "</QuantityShippedToDate_O_Level>" + Environment.NewLine;
                                        strXMLData += "</ItemShipmentDetails_O_Level>" + Environment.NewLine;
                                        strXMLData += "<PurchaseOrderReference_O_Level>" + Environment.NewLine;
                                        strXMLData += "<PurchaseOrderNumber_O_Level>" + line[CustomerPO].Trim() + "</PurchaseOrderNumber_O_Level>" + Environment.NewLine;
                                        strXMLData += "</PurchaseOrderReference_O_Level>" + Environment.NewLine;

                                        if (Common.REQUIRE_ORDER_LEVEL_PARTNER_LIST.Contains(line[CustomerID].Trim())) // require Order Level in ASN
                                        {
                                            HierarchicalCodeParent = HierarchicalCode;
                                            HierarchicalCode++;
                                        }
                                        else
                                        {
                                            HierarchicalCodeParent = 1;
                                        }
                                        strXMLData += "<HierarchicalCode>" + HierarchicalCode + "</HierarchicalCode>" + Environment.NewLine;
                                        strXMLData += "<HierarchicalLevelCode>" + "I" + "</HierarchicalLevelCode>" + Environment.NewLine;
                                        strXMLData += "<HierarchicalParentCode>" + HierarchicalCodeParent + "</HierarchicalParentCode>" + Environment.NewLine;

                                        strXMLData += "<ItemIdentification>" + Environment.NewLine;
                                        strXMLData += "<ItemAssignedID>" + (ItemAssignedID830.Equals("") ? (ItemAssignedID862.Equals("") ? POLineNum : ItemAssignedID862) : ItemAssignedID830) + "</ItemAssignedID>" + Environment.NewLine;
                                        strXMLData += "<ItemAssignedID2>" + (ItemAssignedID830.Equals("") ? (ItemAssignedID862.Equals("") ? POLineNum : ItemAssignedID862) : ItemAssignedID830) + "</ItemAssignedID2>" + Environment.NewLine;
                                        strXMLData += "<ItemCodeQualifier>" + "BP" + "</ItemCodeQualifier>" + Environment.NewLine;
                                        strXMLData += "<ItemCode>" + strItemID + "</ItemCode>" + Environment.NewLine;
                                        if (isChrysler)
                                        {
                                            if (ChryslerRetContID.Contains(strContID))
                                                strXMLData += "<ToteID>" + ChryslerRetContID + "</ToteID>" + Environment.NewLine;
                                            else if (ChryslerExpContID.Contains(strContID))
                                                strXMLData += "<ToteID>" + ChryslerExpContID + "</ToteID>" + Environment.NewLine;
                                            else
                                                strXMLData += "<ToteID>" + strContID + "</ToteID>" + Environment.NewLine;
                                        }
                                        strXMLData += "</ItemIdentification>" + Environment.NewLine;

                                        strXMLData += "<EDIItemIdentification>" + Environment.NewLine;
                                        strXMLData += "<DrawingRevisionQual>" + DrawingRevisionQual + "</DrawingRevisionQual>" + Environment.NewLine;
                                        strXMLData += "<DrawingRevision>" + DrawingRevision + "</DrawingRevision>" + Environment.NewLine;
                                        strXMLData += "<VendorPartQual>" + "" + "</VendorPartQual>" + Environment.NewLine;
                                        strXMLData += "<VendorPart>" + "" + "</VendorPart>" + Environment.NewLine;
                                        strXMLData += "<ReturnableContainerQual>" + ReturnableContainerQual + "</ReturnableContainerQual>" + Environment.NewLine;
                                        strXMLData += "<ReturnableContainer>" + ReturnableContainer + "</ReturnableContainer>" + Environment.NewLine;
                                        strXMLData += "<StandardPackQtyIDQual>" + StandardPackQtyIDQual + "</StandardPackQtyIDQual>" + Environment.NewLine;
                                        strXMLData += "<StandardParkQty>" + StandardParkQty + "</StandardParkQty>" + Environment.NewLine;
                                        strXMLData += "</EDIItemIdentification>" + Environment.NewLine;

                                        strXMLData += "<ItemShipmentDetails>" + Environment.NewLine;
                                        strXMLData += "<FinalDeliveryHouse>" + FinalDeliveryHouse + "</FinalDeliveryHouse>" + Environment.NewLine;
                                        strXMLData += "<NumberofUnitsShipped>" + Common.myCInt(line[ShippedQty].Trim()) + "</NumberofUnitsShipped>" + Environment.NewLine;
                                        strXMLData += "<MeasurementCode>" + line[MeasurementCode].Trim() + "</MeasurementCode>" + Environment.NewLine;
                                        strXMLData += "<QuantityShippedToDate>" + Common.myCInt(line[QtyShipToDate].Trim()) + "</QuantityShippedToDate>" + Environment.NewLine;
                                        strXMLData += "</ItemShipmentDetails>" + Environment.NewLine;

                                        strXMLData += "<PurchaseOrderReference>" + Environment.NewLine;
                                        strXMLData += "<PurchaseOrderNumber>" + line[CustomerPO].Trim() + "</PurchaseOrderNumber>" + Environment.NewLine;
                                        strXMLData += "<ProjectNum>" + ProjectNum + "</ProjectNum>" + Environment.NewLine;
                                        strXMLData += "<ReleaseNumber>" + ReleaseNumber + "</ReleaseNumber>" + Environment.NewLine;
                                        strXMLData += "<ReleaseDate>" + "" + "</ReleaseDate>" + Environment.NewLine;
                                        strXMLData += "<ASNNum>" + line[ShipmentNumber].Trim() + "</ASNNum>" + Environment.NewLine;
                                        strXMLData += "<RefLotNum>" + RefLotNum + "</RefLotNum>" + Environment.NewLine;
                                        strXMLData += "<RefLotSeq>" + RefLotSeq + "</RefLotSeq>" + Environment.NewLine;
                                        strXMLData += "<CustPONum>" + line[CustomerPO].Trim() + "</CustPONum>" + Environment.NewLine;
                                        strXMLData += "<RANNum>" + line[OrderNumber].Trim() + "</RANNum>" + Environment.NewLine;
                                        strXMLData += "<PackingListNumberLine>" + line[ShipmentNumber].Trim() + "</PackingListNumberLine>" + Environment.NewLine;
                                        strXMLData += "<GMRANNum>" + (line[OrderNumber].Trim().Equals("") ? line[CustomerPO].Trim() : line[OrderNumber].Trim()) + "</GMRANNum>" + Environment.NewLine;

                                        strXMLData += "</PurchaseOrderReference>" + Environment.NewLine;

                                        strXMLData += "<DetailIdentification>" + Environment.NewLine;
                                        strXMLData += "<DetailHierarchicalCode>" + HierarchicalCode + "</DetailHierarchicalCode>" + Environment.NewLine;
                                        strXMLData += "<DetailHierarchicalLevelCode>" + "I" + "</DetailHierarchicalLevelCode>" + Environment.NewLine;
                                        strXMLData += "<DetailHierarchicalParentCode>" + HierarchicalCodeParent + "</DetailHierarchicalParentCode>" + Environment.NewLine;
                                        strXMLData += "</DetailIdentification>" + Environment.NewLine;

                                        // Pallet level
                                        if (!line[PalletSerialNum].Trim().Equals(""))
                                        {
                                            strXMLData += "<NumberOfPalletInPallet>" + "1" + "</NumberOfPalletInPallet>" + Environment.NewLine;
                                            strXMLData += "<NumberOfUnitsShippedInPallet>" + Common.myCInt(line[ShippedQty].Trim()) + "</NumberOfUnitsShippedInPallet>" + Environment.NewLine;
                                            strXMLData += "<PalletPackagingCode>" + (line[PalletPkgCode].Trim().Equals("") ? "PLT90" : line[PalletPkgCode].Trim()) + "</PalletPackagingCode>" + Environment.NewLine;
                                            // Matinrea and TI Auto does not require pallet serial number here
                                            if (!NoPalletSerialRequireIDList.Contains(line[CustomerID].Trim()))
                                            {
                                                strXMLData += "<SerialNumberQualifier>" + "LS" + "</SerialNumberQualifier>" + Environment.NewLine;
                                                strXMLData += "<SerialNumber>" + line[PalletSerialNum].Trim() + "</SerialNumber>" + Environment.NewLine;
                                            }
                                        }
                                        
                                        strXMLData += "<NumberOfContainersInPallet>" + Common.myCInt(line[TotalContainerQty].Trim()) + "</NumberOfContainersInPallet>" + Environment.NewLine;
                                        strXMLData += "<NumberOfUnitsShippedInContainer>" + Common.myCInt(line[ContainerQty].Trim()) + "</NumberOfUnitsShippedInContainer>" + Environment.NewLine;
                                        strXMLData += "<ContainerPackagingCode>" + (line[ContainerPkgCode].Trim().Equals("") ? "CTN90" : line[ContainerPkgCode].Trim()) + "</ContainerPackagingCode>" + Environment.NewLine;
                                        // Matinrea requires pallet serial number here

                                        if (MatinreadIDList.Contains(line[CustomerID].Trim()) && !line[PalletSerialNum].Trim().Equals(""))
                                        {
                                            strXMLData += "<SerialNumberQualifier>" + "LS" + "</SerialNumberQualifier>" + Environment.NewLine;
                                            strXMLData += "<SerialNumber>" + line[PalletSerialNum].Trim() + "</SerialNumber>" + Environment.NewLine;

                                        }

                                        // calculate Hierarchical
                                        HierarchicalCodeParent = HierarchicalCode;
                                        HierarchicalCode++;

                                    }

                                    // Pallet Level
                                    if (!strPalletID.Equals(line[PalletSerialNum].Trim()))
                                    {
                                        strPalletID = line[PalletSerialNum].Trim();

                                        if (!strPalletID.Equals(""))
                                        {
                                            strXMLData += "<NumberOfPalletInPallet>" + "1" + "</NumberOfPalletInPallet>" + Environment.NewLine;
                                            strXMLData += "<NumberOfUnitsShippedInPallet>" + Common.myCInt(line[ShippedQty].Trim()) + "</NumberOfUnitsShippedInPallet>" + Environment.NewLine;
                                            strXMLData += "<PalletPackagingCode>" + (line[PalletPkgCode].Trim().Equals("") ? "PLT90" : line[PalletPkgCode].Trim()) + "</PalletPackagingCode>" + Environment.NewLine;
                                            // Matinrea does not require pallet serial number here
                                            if (!NoPalletSerialRequireIDList.Contains(line[CustomerID].Trim()))
                                            {
                                                strXMLData += "<SerialNumberQualifier>" + "LS" + "</SerialNumberQualifier>" + Environment.NewLine;
                                                strXMLData += "<SerialNumber>" + line[PalletSerialNum].Trim() + "</SerialNumber>" + Environment.NewLine;

                                            }

                                        }


                                        strXMLData += "<NumberOfContainersInPallet>" + Common.myCInt(line[TotalContainerQty].Trim()) + "</NumberOfContainersInPallet>" + Environment.NewLine;
                                        strXMLData += "<NumberOfUnitsShippedInContainer>" + Common.myCInt(line[ContainerQty].Trim()) + "</NumberOfUnitsShippedInContainer>" + Environment.NewLine;
                                        strXMLData += "<ContainerPackagingCode>" + (line[ContainerPkgCode].Trim().Equals("") ? "CTN90" : line[ContainerPkgCode].Trim()) + "</ContainerPackagingCode>" + Environment.NewLine;
                                        // Matinrea requires pallet serial number here

                                        if (MatinreadIDList.Contains(line[CustomerID].Trim()))
                                        {
                                            if (!strPalletID.Equals(""))
                                            {
                                                strXMLData += "<SerialNumberQualifier>" + "LS" + "</SerialNumberQualifier>" + Environment.NewLine;
                                                strXMLData += "<SerialNumber>" + line[PalletSerialNum].Trim() + "</SerialNumber>" + Environment.NewLine;
                                            }
                                        }

                                    }
                                    // Tote Level
                                    strXMLData += "<Carton>" + Environment.NewLine;
                                    if (MatinreadIDList.Contains(line[CustomerID].Trim()))
                                        strXMLData += "<SerialNumberQualifier>" + "SE" + "</SerialNumberQualifier>" + Environment.NewLine;
                                    else
                                        strXMLData += "<SerialNumberQualifier>" + "LS" + "</SerialNumberQualifier>" + Environment.NewLine;
                                    strXMLData += "<SerialNumber>" + line[ContainerSerialNum].Trim() + "</SerialNumber>" + Environment.NewLine;
                                    strXMLData += "</Carton>" + Environment.NewLine;
                                }
                            }
                        }
                        
                        else /////// Process for 810 Sale Invoice  /////////////////////
                        {
                            // data check
                            // data format
                            if (line.Length < NumberColumns810)
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: Incorrect data format at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;

                            }

                            // Customer ID same as ISA Sender ID at BHEDI
                            if (Common.isNullEmptyNothing(line[CustomerID810].Trim()))
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: missing Sender ID at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            else
                            {
                                // find EDI ID
                                if (!isHeader)
                                {
                                    strSenderID = line[CustomerID810].Trim();
                                    // Change to Chrysler ID
                                    if (strSenderID.Contains(ChryslerID1) || strSenderID.Contains(ChryslerID2))
                                    {
                                        strSenderID = ChryslerID1;
                                    }
                                    using (var edm = new BHEDI_EDM())
                                    {
                                        var trading = edm.tblTradingPartners.Where(s => s.InterchangeSenderID == strSenderID).Where (s=>s.blnUseSCP == true).FirstOrDefault<tblTradingPartner>();

                                        if (trading == null) // invalid sender id
                                        {   
                                            isError = true;
                                        }
                                        else
                                        {
                                            // get EDI ID from BHEDI
                                            strSenderIDQual = trading.InterchangeSenderIDQual;
                                            strReceiveID = trading.InterchangeReceiverID;
                                            strReceiveIDQual = trading.InterchangeReceiverIDQual;
                                            strAppSenderID = trading.ApplicationSenderCode;
                                            strAppReceiveID = trading.ApplicationReceiverCode;
                                        }
                                    }

                                    if (isError) // error when SCP sends incorrect customer sender id
                                    {
                                        strErrMsg = "Import 810 data : " + file + " Error: Invalid Sender ID: " + strSenderID + " at line:" + (i + 1);
                                        Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                        if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                        {
                                            Common.sendEmail(strErrMsg, Common.EMAIL);
                                        }
                                        break;
                                    }

                                }
                            }

                            // Invoice Number
                            if (Common.isNullEmptyNothing(line[InvoiceNumber810].Trim()))
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: missing Invoice Number at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            
                            // Invoice Date
                            if (Common.isNullEmptyNothing(line[InvoiceDate810].Trim()))
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: missing Invoice Date at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }

                            // Invoice Time
                            if (Common.isNullEmptyNothing(line[InvoiceTime810].Trim()))
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: missing Invoice Time at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Shipment Code
                            if (Common.isNullEmptyNothing(line[ShipmentCode810].Trim()))
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: missing Shipment Code at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Create Date
                            if (Common.isNullEmptyNothing(line[CreateDate810].Trim()))
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: missing Create Date at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Create Time
                            if (Common.isNullEmptyNothing(line[CreateTime810].Trim()))
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: missing Create Time at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Ship Date
                            if (Common.isNullEmptyNothing(line[ShipDate810].Trim()))
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: missing Ship Date at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Ship Time
                            if (Common.isNullEmptyNothing(line[ShipTime810].Trim()))
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: missing Ship Time at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            
                            // Ship To ID
                            if (Common.isNullEmptyNothing(line[ShiptoID810].Trim()))
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: missing Ship To ID at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Supplier ID
                            if (Common.isNullEmptyNothing(line[SupplierID810].Trim()))
                            {
                                if (strSenderID.Equals(ChryslerID1))
                                {
                                    line[SupplierID810] = ChryslerSupplierID1;
                                }
                                else
                                {
                                    strErrMsg = "Import 810 data : " + file + " Error: missing Supplier ID at line:" + (i + 1);
                                    Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                    if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                    {
                                        Common.sendEmail(strErrMsg, Common.EMAIL);
                                    }
                                    isError = true;
                                    break;
                                }
                                
                                
                            }
                            // Currency
                            if (Common.isNullEmptyNothing(line[CurrencyCode810].Trim()))
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: missing Currency Code at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Item Code
                            if (Common.isNullEmptyNothing(line[ItemCode810].Trim()))
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: missing Item Code at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Measurement Code
                            if (Common.isNullEmptyNothing(line[MeasurementCode810].Trim()))
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: missing Measurement Code at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Qty
                            if (Common.isNullEmptyNothing(line[QuantityInvoice810].Trim()))
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: missing Quantity at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Unit Price
                            if (Common.isNullEmptyNothing(line[UnitPrice810].Trim()))
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: missing Quantity at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }
                            // Customer PO
                            if (Common.isNullEmptyNothing(line[CustomerPO810].Trim()))
                            {
                                strErrMsg = "Import 810 data : " + file + " Error: missing Customer PO at line:" + (i + 1);
                                Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.EDI_ERROR);
                                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                                {
                                    Common.sendEmail(strErrMsg, Common.EMAIL);
                                }
                                isError = true;
                                break;
                            }

                            // Generate XML data
                            if (!isError)
                            {
                                // generate Header
                                if (!isHeader)
                                {
                                    isHeader = true;
                                    strXMLData = "<ASN>" + Environment.NewLine;
                                    strXMLData += "<TransactionSet>" + Environment.NewLine;
                                    strXMLData += "<TransactionSetCode>810</TransactionSetCode>" + Environment.NewLine;
                                    strXMLData += "<TransactionSetPurposeCode>00</TransactionSetPurposeCode>" + Environment.NewLine;
                                    strXMLData += "<Sender_ID>" + strSenderID.Trim() + "</Sender_ID>" + Environment.NewLine;
                                    strXMLData += "<Sender_ID_Qualifier>" + strSenderIDQual.Trim() + "</Sender_ID_Qualifier>" + Environment.NewLine;
                                    strXMLData += "<Receiver_ID>" + strReceiveID.Trim() + "</Receiver_ID>" + Environment.NewLine;
                                    strXMLData += "<Receiver_ID_Qualifier>" + strReceiveIDQual.Trim() + "</Receiver_ID_Qualifier>" + Environment.NewLine;
                                    strXMLData += "<Application_Sender_ID>" + strAppSenderID.Trim() + "</Application_Sender_ID>" + Environment.NewLine;
                                    strXMLData += "<Application_Receiver_ID>" + strAppReceiveID.Trim() + "</Application_Receiver_ID>" + Environment.NewLine;
                                    strXMLData += "<ShipmentCode>" + line[ShipmentCode810].Trim() + "</ShipmentCode>" + Environment.NewLine;
                                    //strXMLData += "<CreateDate>" + Common.convertDate4(line[CreateDate810].Trim()) + "</CreateDate>" + Environment.NewLine;
                                    //strXMLData += "<CreateTime>" + line[CreateTime810].Trim().Replace(":","") + "</CreateTime>" + Environment.NewLine;
                                    strXMLData += "<CreateDate>" + DateTime.Now.ToString("yyyyMMdd") + "</CreateDate>" + Environment.NewLine;
                                    strXMLData += "<CreateTime>" + DateTime.Now.ToString("HHmm") + "</CreateTime>" + Environment.NewLine;
                                    strXMLData += "<ShipDate>" + Common.convertDate4(line[ShipDate810].Trim()) + "</ShipDate>" + Environment.NewLine;
                                    //strXMLData += "<ShipTime>" + line[ShipTime810].Trim().Replace(":","") + "</ShipTime>" + Environment.NewLine;
                                    strXMLData += "<ShipTime>" + DateTime.Now.ToString("HHmm") + "</ShipTime>" + Environment.NewLine;
                                    strXMLData += "<InvoiceDate>" + Common.convertDate4(line[InvoiceDate810].Trim()) + "</InvoiceDate>" + Environment.NewLine;
                                    strXMLData += "<Shipment>" + Environment.NewLine;
                                    strXMLData += "<InvoiceNumber>" + line[InvoiceNumber810].Trim() + "</InvoiceNumber>" + Environment.NewLine;
                                    strXMLData += "<PONumerHeader>" + line[CustomerPO810].Trim() + "</PONumerHeader>" + Environment.NewLine;
                                    strXMLData += "<BaseCurrency>" + line[CurrencyCode810].Trim() + "</BaseCurrency>" + Environment.NewLine;
                                    strXMLData += "<PackingListNumberHeader>" + line[ShipmentCode810].Trim() + "</PackingListNumberHeader>" + Environment.NewLine;

                                }

                                // item level
                                strXMLData += "<Items>" + Environment.NewLine; // Item Level
                                strXMLData += "<SupplierNum>" + line[SupplierID810].Trim() + "</SupplierNum>" + Environment.NewLine;
                                strXMLData += "<EDIShipToID>" + line[ShiptoID810].Trim() + "</EDIShipToID>" + Environment.NewLine;
                                strXMLData += "<ShipmentDate>" + Common.convertDate4(line[ShipDate810].Trim()) + "</ShipmentDate>" + Environment.NewLine;

                                // Get PO Line Number from 850 most recent data
                                using (var sp = new BHEDI_SPTableAdapters.s_Invoice_GetEDITableAdapter())
                                {
                                    sp.SetCommandTimeout(0);
                                    BHEDI_SP.s_Invoice_GetEDIDataTable dt = new BHEDI_SP.s_Invoice_GetEDIDataTable();
                                    // run store procedure and return data table
                                    sp.Fill(dt, line[ItemCode810].Trim(), line[CustomerPO810].Trim());
                                    foreach (BHEDI_SP.s_Invoice_GetEDIRow dr in dt)
                                    {
                                        POLineNum = dr.POLineNum;
                                    }
                                }

                                if (Common.isNullEmptyNothing(POLineNum))
                                {
                                    POLineNum = line[ItemAssignedID810].Trim();   
                                }

                                strXMLData += "<LotSequence>" + POLineNum + "</LotSequence>" + Environment.NewLine;
                                
                                intQty = Common.myCInt(line[QuantityInvoice810]);
                                intTotalQty += intQty;
                                dblPrice = Common.myCDbl(line[UnitPrice810]);
                                decAmount = Math.Round(Convert.ToDecimal(intQty * dblPrice), 2);
                                decTotalAmount += decAmount;
                                strXMLData += "<Qty>" + intQty + "</Qty>" + Environment.NewLine;
                                strXMLData += "<Price>" + dblPrice + "</Price>" + Environment.NewLine;
                                strXMLData += "<LineNo>" + HierarchicalCode + "</LineNo>" + Environment.NewLine;
                                strXMLData += "<Item>" + line[ItemCode810].Trim() + "</Item>" + Environment.NewLine;
                                strXMLData += "<PONumerLine>" + line[CustomerPO810].Trim() + "</PONumerLine>" + Environment.NewLine;
                                strXMLData += "<RANNumQual>" + (line[OrderNumber810].Equals("") ? "":"RN") + "</RANNumQual>" + Environment.NewLine;
                                strXMLData += "<RANNum>" + line[OrderNumber810].Trim() + "</RANNum>" + Environment.NewLine;
                                strXMLData += "<ContainerTypeID>" + line[ItemCode810].Trim() + "</ContainerTypeID>" + Environment.NewLine;
                                strXMLData += "<PackingListNumber>" + line[ShipmentCode810].Trim() + "</PackingListNumber>" + Environment.NewLine;
                                strXMLData += "<ShipmentNum_v>" + line[ShipmentCode810].Trim() + "</ShipmentNum_v>" + Environment.NewLine;
                                strXMLData += "<Amount>" + decAmount + "</Amount>" + Environment.NewLine;
                                strXMLData += "<ItemDescription>" + line[ItemCode810].Trim() + "</ItemDescription>" + Environment.NewLine;
                                strXMLData += "</Items>" + Environment.NewLine;
                                HierarchicalCode++;

                            }

                        }
                        
                        
                    }

                    ////// Footer for 856 ASN /////
                    if (!isError && is856)
                    {
                        
                        // For Chrysler container summary
                        if (isChrysler)
                        {
                           
                            // container
                            strXMLData += "<ContainerPackingTotal>" + Environment.NewLine;
                            strXMLData += "<ContainerHierachical>" + HierarchicalCode + "</ContainerHierachical>" + Environment.NewLine;
                            strXMLData += "<ContainerHierachicalLevelCode>O</ContainerHierachicalLevelCode>" + Environment.NewLine;
                            strXMLData += "<ContainerParentHierachical>" + HierarchicalCodeParent + "</ContainerParentHierachical>" + Environment.NewLine;
                            //if (ChryslerRetContID.Contains(strContID))
                            //    strXMLData += "<ToteIDTotal>" + ChryslerRetContID + "</ToteIDTotal>" + Environment.NewLine;
                            //else if (ChryslerExpContID.Contains(strContID))
                            //    strXMLData += "<ToteIDTotal>" + ChryslerExpContID + "</ToteIDTotal>" + Environment.NewLine;
                            //else
                            //    strXMLData += "<ToteIDTotal>" + strContID + "</ToteIDTotal>" + Environment.NewLine;
                            strXMLData += "<ToteIDTotal>" + strContID + "</ToteIDTotal>" + Environment.NewLine;

                            strXMLData += "<ToteIDTotalNum>" + totalTote + "</ToteIDTotalNum>" + Environment.NewLine;
                            strXMLData += "<BLNUmContainer>" + strBOLNumber + "</BLNUmContainer>" + Environment.NewLine;
                            strXMLData += "<PackingListNumberContainer>" + strBOLNumber + "</PackingListNumberContainer>" + Environment.NewLine;
                            strXMLData += "</ContainerPackingTotal>" + Environment.NewLine;

                            // pallet
                            if (totalPallet > 0) {
                                HierarchicalCode++;
                                strXMLData += "<ContainerPackingTotal>" + Environment.NewLine;
                                strXMLData += "<ContainerHierachical>" + HierarchicalCode + "</ContainerHierachical>" + Environment.NewLine;
                                strXMLData += "<ContainerHierachicalLevelCode>O</ContainerHierachicalLevelCode>" + Environment.NewLine;
                                strXMLData += "<ContainerParentHierachical>" + HierarchicalCodeParent + "</ContainerParentHierachical>" + Environment.NewLine;
                                //if (ChryslerRetPalletID.Contains(strPalletPkgID))
                                //    strXMLData += "<ToteIDTotal>" + ChryslerRetPalletID + "</ToteIDTotal>" + Environment.NewLine;
                                //else if (ChryslerExpPalletID.Contains(strPalletPkgID))
                                //    strXMLData += "<ToteIDTotal>" + ChryslerExpPalletID + "</ToteIDTotal>" + Environment.NewLine;
                                //else
                                //    strXMLData += "<ToteIDTotal>" + strPalletPkgID + "</ToteIDTotal>" + Environment.NewLine;
                                strXMLData += "<ToteIDTotal>" + strPalletPkgID + "</ToteIDTotal>" + Environment.NewLine;

                                strXMLData += "<ToteIDTotalNum>" + totalPallet + "</ToteIDTotalNum>" + Environment.NewLine;
                                strXMLData += "<BLNUmContainer>" + strBOLNumber + "</BLNUmContainer>" + Environment.NewLine;
                                strXMLData += "<PackingListNumberContainer>" + strBOLNumber + "</PackingListNumberContainer>" + Environment.NewLine;
                                strXMLData += "</ContainerPackingTotal>" + Environment.NewLine;

                                // lid
                                HierarchicalCode++;
                                strXMLData += "<ContainerPackingTotal>" + Environment.NewLine;
                                strXMLData += "<ContainerHierachical>" + HierarchicalCode + "</ContainerHierachical>" + Environment.NewLine;
                                strXMLData += "<ContainerHierachicalLevelCode>O</ContainerHierachicalLevelCode>" + Environment.NewLine;
                                strXMLData += "<ContainerParentHierachical>" + HierarchicalCodeParent + "</ContainerParentHierachical>" + Environment.NewLine;
                                //if (ChryslerRetPalletID.Contains(strPalletPkgID))
                                //    strXMLData += "<ToteIDTotal>" + ChryslerRetLidID + "</ToteIDTotal>" + Environment.NewLine;
                                //else if (ChryslerExpPalletID.Contains(strPalletPkgID))
                                //    strXMLData += "<ToteIDTotal>" + ChryslerExpLidID + "</ToteIDTotal>" + Environment.NewLine;
                                //else
                                //    strXMLData += "<ToteIDTotal>" + strPalletPkgID + "</ToteIDTotal>" + Environment.NewLine;
                                strXMLData += "<ToteIDTotal>" + strLidPkgID + "</ToteIDTotal>" + Environment.NewLine;

                                strXMLData += "<ToteIDTotalNum>" + totalPallet + "</ToteIDTotalNum>" + Environment.NewLine;
                                strXMLData += "<BLNUmContainer>" + strBOLNumber + "</BLNUmContainer>" + Environment.NewLine;
                                strXMLData += "<PackingListNumberContainer>" + strBOLNumber + "</PackingListNumberContainer>" + Environment.NewLine;
                                strXMLData += "</ContainerPackingTotal>" + Environment.NewLine;

                            }
                            
                            

                        }
                       
                        strXMLData += "<Total>" + Environment.NewLine;
                        strXMLData += "<NumberOfItem>" + strNumberOfItem + "</NumberOfItem>" + Environment.NewLine;
                        strXMLData += "<TotalShipQty>" + strTotalShipQty + "</TotalShipQty>" + Environment.NewLine;
                        strXMLData += "</Total>" + Environment.NewLine;

                        strXMLData += "</Shipment>" + Environment.NewLine;
                        strXMLData += "</TransactionSet>" + Environment.NewLine;
                        strXMLData += "</ASN>" + Environment.NewLine;
                       
                        strBackupFile = Path.GetFileNameWithoutExtension(file);
                         // write to file
                        strXMLFile = Common.OUT_PATH + strBackupFile + "_" + DateTime.Now.ToString("MMddyyyy_HHmmssfff") + ".xml";
                        File.WriteAllText(strXMLFile, strXMLData);
                        strBackupFile = strBackupSCP + strBackupFile + "_" + DateTime.Now.ToString("MMddyyyy_HHmmssfff") + Path.GetExtension(file);
                       // Archive
                        File.Copy(file, strBackupFile);
                        //File.Delete(file);
                        strErrMsg = "Imported 856 data : " + file + " Generated: " + strXMLFile;
                        Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.JOB);

                    }
                    //////// Footer for 810 Sale Invoice //////
                    else if (!isError && !is856)
                    {
                        // Total
                        strXMLData += "<Total>" + Environment.NewLine;
                        strXMLData += "<TotalAmount>" + decTotalAmount.ToString("F2") + "</TotalAmount>" + Environment.NewLine;
                        strXMLData += "<NumberofItem>" + (HierarchicalCode-1) + "</NumberofItem>" + Environment.NewLine;
                        strXMLData += "</Total>" + Environment.NewLine;
                        strXMLData += "</Shipment>" + Environment.NewLine;
                        strXMLData += "</TransactionSet>" + Environment.NewLine;
                        strXMLData += "</ASN>" + Environment.NewLine;

                        strBackupFile = Path.GetFileNameWithoutExtension(file);
                        // write to file
                        strXMLFile = Common.OUT_PATH + strBackupFile + "_" + DateTime.Now.ToString("MMddyyyy_HHmmssfff") + ".xml";
                        File.WriteAllText(strXMLFile, strXMLData);
                        strBackupFile = strBackupSCP + strBackupFile + "_" + DateTime.Now.ToString("MMddyyyy_HHmmssfff") + Path.GetExtension(file);
                        // Archive
                        File.Copy(file, strBackupFile);
                        //File.Delete(file);
                        strErrMsg = "Imported 810 data : " + file + " Generated: " + strXMLFile;
                        Common.writeLog(-1, -1, strErrMsg, (int)Common.LOG_TYPE.JOB);

                    }

                    // 11/6/2023 Phuong changed move to backup file does not need to process error file
                    
                    File.Delete(file);
                }


            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
            }
        }

        /// <summary>
        /// Calculate weight and total ship qty
        /// </summary>
        /// <param name="lines"></param>
        /// <param name="totalShipQty"></param>
        /// <param name="totalItem"></param>
        /// <param name="grossWeight"></param>
        /// <param name="netWeight"></param>
        /// <param name="totalPallet"></param>
        /// <param name="totalNonPallet"></param>
        private void calculateTotalWeightAndShipQty(string[] lines,ref int totalShipQty,ref int totalItem,ref double grossWeight,ref double netWeight
            ,ref int totalPallet,ref int totalNonPallet,ref ArrayList palletSerialNumbers,ref int totalTotes)
        {
            totalShipQty = 0;
            totalItem = 0;
            grossWeight = 0;
            netWeight = 0;
            totalPallet = 0;
            totalNonPallet = 0;
            totalTotes = 0;

            string strItemID = "";
            string strPalletSerialNumber = "";

            try
            {
                for (int i = 1; i < lines.Length; i++)
                {
                    if (lines[i].Trim().Equals(""))
                        continue;


                    totalTotes++;

                    string[] line = lines[i].Split(',');
                    totalShipQty += Common.myCInt(line[ContainerQty].Trim());
                    netWeight += Common.myCDbl(line[ContainerWeight].Trim());

                    if (strItemID.Equals(""))
                    {
                        strItemID = line[CustomerPartID].Trim();
                        totalItem ++;
                        grossWeight += Common.myCDbl(line[ContainerQty].Trim());

                    }
                    else if (!strItemID.Equals(line[CustomerPartID].Trim()))
                    {
                        strItemID = line[CustomerPartID].Trim();
                        totalItem++;
                        if (strPalletSerialNumber.Equals(line[PalletSerialNum].Trim())) // Mixed Pallet
                        {
                            totalPallet--;
                            totalNonPallet++;
                        }
                    }

                    if (strPalletSerialNumber.Equals(""))
                    {
                        strPalletSerialNumber = line[PalletSerialNum].Trim();
                        grossWeight += Common.myCDbl(line[PalletWeight].Trim());
                        if (!strPalletSerialNumber.Equals(""))
                            totalPallet++;
                        
                    }
                    else if (!strPalletSerialNumber.Equals(line[PalletSerialNum].Trim()))
                    {
                        strPalletSerialNumber = line[PalletSerialNum].Trim();
                        grossWeight += Common.myCDbl(line[PalletWeight].Trim());
                        if (!strPalletSerialNumber.Equals(""))
                            totalPallet++;
                    }

                    // for FCA at Tare level output all pallet serial numbers
                    if (!palletSerialNumbers.Contains(strPalletSerialNumber) && !strPalletSerialNumber.Equals(""))
                    {
                        palletSerialNumbers.Add(strPalletSerialNumber);
                    }

                }

                grossWeight += netWeight;
            }
            catch(Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
            }
        }

        private string getForecastQualifier(string str)
        {
            switch (str)
            {
                case "C":
                    return "Firm";
                case "D":
                    return "Planning";
                case "S":
                    return "Strike Protection";
                case "A":
                    return "Immediate";
                case "B":
                    return "Pilot/Prevolume";
                case "F":
                    return "Immediate";
                case "X":
                    return "Modification";
                case "Z":
                    return "Prior Firm Order";
             
                       
            }
            return str;
        }

        private string getForecastTimmingQualifier(string str)
        {
            switch (str)
            {
                case "C":
                    return "Daily";
                case "D":
                    return "Discrete";
                case "F":
                    return "Flexible Interval";
                case "W":
                    return "Weekly Bucket";
                case "M":
                    return "Monthly Bucket";
                case "Z":
                    return "Mutually Defined";
                case "T":
                    return "Four Week Bucket (13 buckets per year)";
                


            }
            return str;
        }

        #endregion

    }
}
