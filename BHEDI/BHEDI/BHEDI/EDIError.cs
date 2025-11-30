using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

namespace BHEDI
{
    /// <summary>
    /// EDI Data Check Error
    /// </summary>
    public class EDIError
    {
        /// <summary>
        /// AK304 Error Code
        /// </summary>
        public static int AK304_1 = 1;       // Unrecognized segment ID
        public static int AK304_2 = 2;       // Unexpected segment
        public static int AK304_3 = 3;       // Mandatory segment missing
        public static int AK304_4 = 4;       // Loop occurs over maximum times
        public static int AK304_5 = 5;       // Segment exceeds maximum use
        public static int AK304_6 = 6;       // Segment not in defined transaction set
        public static int AK304_7 = 7;       // Segment not in proper sequence
        public static int AK304_8 = 8;       // Segment has data element errors
        public static int AK304_511 = 511;   // Trailing separators encountered (custom code)

        /// <summary>
        /// AK403 Error Codes
        /// </summary>
        public static int AK403_1 = 1;       // Mandatory data element missing
        public static int AK403_2 = 2;       // Conditional required data element missing
        public static int AK403_3 = 3;       // Too many data elements
        public static int AK403_4 = 4;       // Data element is too short
        public static int AK403_5 = 5;       // Data element is too long
        public static int AK403_6 = 6;       // Invalid character in data element
        public static int AK403_7 = 7;       // Invalid code value
        public static int AK403_8 = 8;       // Invalid date
        public static int AK403_9 = 9;       //Invalid time
        public static int AK403_10 = 10;       // Exclusion condition violated

        /// <summary>
        /// AK501 Error Codes
        /// </summary>
        public static string AK501_A = "A";   // Accepted
        public static string AK501_E = "E";   // Accepted but errors were noted
        public static string AK501_M = "M";   // Rejected, message authentication code (MAC) failed
        public static string AK501_P = "P";   // Partially accepted, at least one transaction set was rejected
        public static string AK501_R = "R";   // Rejected
        public static string AK501_W = "W";   // Rejected, assurance failed validity tests
        public static string AK501_X = "X";   // Rejected, content after decryption could not be analyzed

        /// <summary>
        /// AK502 through AK506 Error Codes
        /// </summary>
        public static int AK502_506_1 = 1;       // Transaction set not supported
        public static int AK502_506_2 = 2;       // Transaction set trailer missing
        public static int AK502_506_3 = 3;       // Transaction set control number in header and trailer do not match
        public static int AK502_506_4 = 4;       // Number of included segments does not match actual count
        public static int AK502_506_5 = 5;       // One or more segments in error
        public static int AK502_506_6 = 6;       // Missing or invalid transaction set identifier
        public static int AK502_506_7 = 7;       // Missing or invalid transaction set control number (a duplicate transaction number may have occurred)

        /// <summary>
        /// AK901 Error Codes
        /// </summary>
        public static string AK901_A = "A";   // Accepted
        public static string AK901_E = "E";   // Accepted but errors were noted
        public static string AK901_M = "M";   // Rejected, message authentication code (MAC) failed
        public static string AK901_P = "P";   // Partially accepted, at least one transaction set was rejected
        public static string AK901_R = "R";   // Rejected
        public static string AK901_W = "W";   // Rejected, assurance failed validity tests
        public static string AK901_X = "X";   // Rejected, content after decryption could not be analyzed

        /// <summary>
        /// AK905 through AK909 Error Codes
        /// </summary>
        public static int AK905_909_1 = 1;       // Transaction set not supported
        public static int AK905_909_2 = 2;       // Transaction set trailer missing
        public static int AK905_909_3 = 3;       // Transaction set control number in header and trailer do not match
        public static int AK905_909_4 = 4;       // Number of included segments does not match actual count
        public static int AK905_909_5 = 5;       // One or more segments in error
        public static int AK905_909_6 = 6;       // Missing or invalid transaction set identifier
        public static int AK905_909_7 = 7;       // Missing or invalid transaction set control number (a duplicate transaction number may have occurred)


        /// <summary>
        /// EDIFACT CONTROL CODE
        /// </summary>
        public static int CONTRL_1 = 1;       // Acknowledged (this level and all lower levels)
        public static int CONTRL_2 = 2;       // Acknowledged - errors detected and reported
        public static int CONTRL_3 = 3;       // One or more rejected - next lower level
        public static int CONTRL_4 = 4;       // This level and all lower levels rejected
        public static int CONTRL_5 = 5;       // UNB/UNZ accepted
        public static int CONTRL_6 = 6;       // UNB/UNZ rejected
        public static int CONTRL_7 = 7;       // This level acknowledged, next lower level acknowledged if not explicitly rejected
        public static int CONTRL_8 = 8;       // Interchange received
        
        /// <summary>
        /// properties
        /// </summary>
        private string strVersion;
        private string strTSetID;
        private string strFunctionGroup;
        private List<SegmentStructure> lstSegment;
        private string strRawData;
        private string[] strSegments;
        private char chDataSeparate;
        private char chSegmentSeparate;
        private List<SegmentStructure> lstAllSegment;
        private List<SegmentStructure> lstReqSegment;
        private int intTradingNo;
        private int intTSetNo;
        private int intRawDataNo;
        private bool isX12Format;
        // 5/9/2019 Phuong addded VDA
        private bool isVDAFormat;

        /// <summary>
        /// Load structure data
        /// </summary>
        /// <param name="strVersion"></param>
        /// <param name="strTSetID"></param>
        public void getEDISegmentStructure(string strVers, string strTSet,string strRaw,char chData, char chSegment,int intTno, int intSetNo,int intRawNo, bool blnX12, bool blnVDA)
        {
            this.intTradingNo = intTno;
            this.intTSetNo = intSetNo;
            this.strVersion = strVers;
            this.strTSetID = strTSet;
            this.strRawData = strRaw;
            this.chDataSeparate = chData;
            this.chSegmentSeparate = chSegment;
            this.intRawDataNo = intRawNo;
            this.isX12Format = blnX12;
            this.isVDAFormat = blnVDA;
            
            // get all segments
            strSegments = strRawData.Split(chSegmentSeparate);
            for (int i = 1; i < strSegments.Length; i++)
            {
                strSegments[i] = Common.removeSpecialCharater(strSegments[i]);
            }


            // get dat from [tblEDITransactionStructure]
            lstSegment = new List<SegmentStructure>();
            lstAllSegment = new List<SegmentStructure>();
            lstReqSegment = new List<SegmentStructure>();

            // get all segment from raw data and count appear

            foreach (string str in strSegments)
            {
                if (!Common.isNullEmptyNothing(str))
                {

                    string[] data = str.Split(chDataSeparate);

                    var qr1 = lstAllSegment.Where(my => my.SegmentName == data[0]).FirstOrDefault<SegmentStructure>();
                    if (Common.isNullEmptyNothing(qr1.SegmentName))
                    {
                        SegmentStructure seg = new SegmentStructure();
                        seg.SegmentName = data[0];
                        seg.MinLength = 0;
                        seg.MaxLength = 0;
                        lstAllSegment.Add(seg);
                    }
                    else
                        qr1.MaxLength = qr1.MaxLength + 1;
                }

            }

            

            using (var edm = new BHEDI_EDM())
            {
                var qr = edm.tblEDITransactionStructures.Where(my => my.Version == strVersion && my.TransactionSetID == strTSetID).ToList<tblEDITransactionStructure>();
                if (qr == null || qr.Count == 0)
                    return;

                foreach (tblEDITransactionStructure row in qr)
                {
                    strFunctionGroup = row.FunctionGroup;
                    SegmentStructure seg = new SegmentStructure();
                    seg.SegmentName = row.SegmentCode;
                    seg.MinLength = Common.myCInt(row.MinLength);
                    seg.MaxLength = Common.myCInt(row.MaxLength);
                    lstSegment.Add(seg);
                    // require segment
                    if (row.MinLength > 0)
                        lstReqSegment.Add(seg);
                }
            }
           
        }

        /// <summary>
        /// Check Unrecognized segment ID, Mandatory segment missing and max loop
        /// </summary>
        /// <returns></returns>
        public string generalCheck(DateTime dtTransaction, int checkType)
        {

            Common.writeLog(this.intTradingNo, this.intTSetNo, "Check EDI data error", (int)Common.LOG_TYPE.JOB, dtTransaction,this.intRawDataNo);

            string AK9Code = checkISA_GS_ST_Segment(dtTransaction);
            string strID = "";

            // check ISA - GS - ST segment
            if (AK9Code.Equals(AK901_R))
                return AK9Code;

            // Unrecognized segment ID
            if (checkType != (int)Common.ERROR_CHECK_TYPE.DO_NOT_CHECK_INVALID && lstSegment.Count > 0)
            {
                var qr1 = lstAllSegment.Where(s => !lstSegment.Any(l => l.SegmentName == s.SegmentName)).ToList<SegmentStructure>();

                if (qr1.Count > 0)
                {
                    foreach (SegmentStructure q in qr1)
                    {
                        strID += q.SegmentName + " ";
                    }
                    Common.writeLog(this.intTradingNo, this.intTSetNo, "Unrecognized segment ID: " + strID, (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction,this.intRawDataNo);
                    // 4/20/2023 Phuong added 
                    if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                    {
                        BHEDI_EDM edm = new BHEDI_EDM();
                        tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                        string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - Unrecognized segment ID: " + strID;
                        Common.sendEmail(strErrMsg, Common.EMAIL);
                    }
                    return AK901_R; // reject
                }
            }
            // Mandatory segment missing
            if (checkType != (int)Common.ERROR_CHECK_TYPE.DO_NOT_CHECK_MISSING && lstReqSegment.Count > 0)
            {
                var qr2 = lstReqSegment.Where(s => !lstAllSegment.Any(l => l.SegmentName == s.SegmentName)).ToList<SegmentStructure>();

                if (qr2.Count > 0)
                {
                    foreach (SegmentStructure q in qr2)
                    {
                        strID += q.SegmentName + " ";
                    }
                    Common.writeLog(this.intTradingNo, this.intTSetNo, "Mandatory segment missing: " + strID, (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                    // 4/20/2023 Phuong added 
                    if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                    {
                        BHEDI_EDM edm = new BHEDI_EDM();
                        tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                        string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - Mandatory segment missing: " + strID;
                        Common.sendEmail(strErrMsg, Common.EMAIL);
                    }
                    return AK901_R; // reject
                }
            }
            
            // max loop
            if (checkType != (int)Common.ERROR_CHECK_TYPE.DO_NO_CHECK_MAX && lstSegment.Count > 0)
            {
                foreach (SegmentStructure seg in lstAllSegment)
                {
                    if (lstSegment.Where(my => my.SegmentName == seg.SegmentName && seg.MaxLength > my.MaxLength).Count<SegmentStructure>() > 1)
                    {
                        Common.writeLog(this.intTradingNo, this.intTSetNo, "Over max loop: " + seg.SegmentName, (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                        return AK901_E; // accept but error noticed
                    }
                }
            }
            return AK9Code;
        }

        /// <summary>
        /// Check Unrecognized segment ID, Mandatory segment missing and max loop for EDIFact
        /// </summary>
        /// <returns></returns>
        public string generalCheck_EDIFACT(DateTime dtTransaction, int checkType)
        {

            Common.writeLog(this.intTradingNo, this.intTSetNo, "Check EDI data error", (int)Common.LOG_TYPE.JOB, dtTransaction, this.intRawDataNo);

            string AK9Code = getEDIFACTControlCodeForGeneralCheck(0).ToString();
            string strID = "";

            // Unrecognized segment ID
            if (checkType != (int)Common.ERROR_CHECK_TYPE.DO_NOT_CHECK_INVALID && lstSegment.Count > 0)
            {
                var qr1 = lstAllSegment.Where(s => !lstSegment.Any(l => l.SegmentName == s.SegmentName)).ToList<SegmentStructure>();

                if (qr1.Count > 0)
                {
                    foreach (SegmentStructure q in qr1)
                    {
                        strID += q.SegmentName + " ";
                    }
                    // 4/20/2023 Phuong added 
                    if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                    {
                        BHEDI_EDM edm = new BHEDI_EDM();
                        tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                        string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - Unrecognized segment ID: " + strID;
                        Common.sendEmail(strErrMsg, Common.EMAIL);
                    }
                    Common.writeLog(this.intTradingNo, this.intTSetNo, "Unrecognized segment ID: " + strID, (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                    return getEDIFACTControlCodeForGeneralCheck(2).ToString(); ; // reject
                }
            }
            // Mandatory segment missing
            if (checkType != (int)Common.ERROR_CHECK_TYPE.DO_NOT_CHECK_MISSING && lstReqSegment.Count > 0)
            {
                var qr2 = lstReqSegment.Where(s => !lstAllSegment.Any(l => l.SegmentName == s.SegmentName)).ToList<SegmentStructure>();

                if (qr2.Count > 0)
                {
                    foreach (SegmentStructure q in qr2)
                    {
                        strID += q.SegmentName + " ";
                    }
                    Common.writeLog(this.intTradingNo, this.intTSetNo, "Mandatory segment missing: " + strID, (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                    // 4/20/2023 Phuong added 
                    if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                    {
                        BHEDI_EDM edm = new BHEDI_EDM();
                        tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                        string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - Mandatory segment missing: " + strID;
                        Common.sendEmail(strErrMsg, Common.EMAIL);
                    }
                    return getEDIFACTControlCodeForGeneralCheck(2).ToString(); // reject
                }
            }

            // max loop
            if (checkType != (int)Common.ERROR_CHECK_TYPE.DO_NO_CHECK_MAX && lstSegment.Count > 0)
            {
                foreach (SegmentStructure seg in lstAllSegment)
                {
                    if (lstSegment.Where(my => my.SegmentName == seg.SegmentName && seg.MaxLength > my.MaxLength).Count<SegmentStructure>() > 1)
                    {
                        Common.writeLog(this.intTradingNo, this.intTSetNo, "Over max loop: " + seg.SegmentName, (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                        return getEDIFACTControlCodeForGeneralCheck(1).ToString(); // accept but error noticed
                    }
                }
            }
            return AK9Code;
        }

        /// <summary>
        /// Check header and footer segment
        /// ISA - Interchange Control Number

        /// GS  - Group Control Number

        /// ST  - Transaction Set Control Number

        /// SE  - Transaction Set Control Number

        /// GE  - Group Control Number

        /// IEA - Interchange Control Number

        /// </summary>
        /// <returns></returns>
        public string checkISA_GS_ST_Segment(DateTime dtTransaction)
        {
            string AK9Code = AK901_A;
            // ISA - GS - ST
            if (!lstAllSegment[0].SegmentName.Equals("ISA"))
            {

                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - Missing ISA segment";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "Missing ISA segment", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);

                return AK901_R;
            }
            if (!lstAllSegment[1].SegmentName.Equals("GS"))
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - Missing GS segment";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }
                
                Common.writeLog(this.intTradingNo, this.intTSetNo, "Missing GS segment", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }
            if (!lstAllSegment[2].SegmentName.Equals("ST"))
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - Missing ST segment";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }
                Common.writeLog(this.intTradingNo, this.intTSetNo, "Missing ST segment", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }

            if (!lstAllSegment[lstAllSegment.Count -1].SegmentName.Equals("IEA"))
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - Missing IEA segment";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }
                Common.writeLog(this.intTradingNo, this.intTSetNo, "Missing IEA segment", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }

            if (!lstAllSegment[lstAllSegment.Count - 2].SegmentName.Equals("GE"))
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - Missing GE segment";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }
                Common.writeLog(this.intTradingNo, this.intTSetNo, "Missing GE segment", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }

            if (!lstAllSegment[lstAllSegment.Count - 3].SegmentName.Equals("SE"))
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - Missing SE segment";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }
                Common.writeLog(this.intTradingNo, this.intTSetNo, "Missing SE segment", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }

            // check ISA segment length
            string[] strISA = strSegments[0].Split(chDataSeparate);
            if (strISA.Length < 16)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA length is invalid ", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;

            } if (strISA[1].Length != 2)
            {

                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA 01 length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }
                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA 01 length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;

            }
            if (strISA[2].Length != 10)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA 02 length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA 02 length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }
            if (strISA[3].Length != 2)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA 03 length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA 03 length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }

            if (strISA[4].Length != 10)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA 04 length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA 04 length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }
            if (strISA[5].Length != 2)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA 05 length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA 05 length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }
            if (strISA[6].Length != 15)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA 06 length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA 06 length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }
            if (strISA[7].Length != 2)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA 07 length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA 07 length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }
            if (strISA[8].Length != 15)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA 08 length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA 08 length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }
            if (strISA[9].Length != 6)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA 09 length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA 09 length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }
            if (strISA[10].Length != 4)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA 10 length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA 10 length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }
            if (strISA[11].Length != 1)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA 11 length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA 11 length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }
            if (strISA[12].Length != 5)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA 12 length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA 12 length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }
            if (strISA[13].Length != 9)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA 13 length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA 13 length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }
            if (strISA[14].Length != 1)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA 14 length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA 14 length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }
            if (strISA[15].Length != 1)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA 15 length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA 15 length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }
            if (!Common.isNullEmptyNothing( strISA[16]) && strISA[16].Length != 1)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ISA 16 length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ISA 16 length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }
            
            // check GS length
            string[] strGS = strSegments[1].Split(chDataSeparate);
            if (strGS.Length != 9)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - GS length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "GS length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }

            // check ST length
            string[] strST = strSegments[2].Split(chDataSeparate);
            if (strST.Length != 3)
            {
                // 4/20/2023 Phuong added 
                if (Common.SEND_SQL_ERROR_EMAIL.Equals(Common.CONFIG_ON) && !Common.EMAIL.Equals(""))
                {
                    BHEDI_EDM edm = new BHEDI_EDM();
                    tblTradingPartner trading = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.intTradingNo).FirstOrDefault();
                    string strErrMsg = "<p>Trading Partner: " + trading.TradingPartnerName + " - ST length is invalid";
                    Common.sendEmail(strErrMsg, Common.EMAIL);
                }

                Common.writeLog(this.intTradingNo, this.intTSetNo, "ST length is invalid", (int)Common.LOG_TYPE.EDI_ERROR, dtTransaction, this.intRawDataNo);
                return AK901_R;
            }


            return AK9Code;
        }

        /// <summary>
        /// Check invalid segment code
        /// </summary>
        /// <param name="segmentCode"></param>
        /// <returns></returns>
        private bool checkInvalidCode(string segmentCode)
        {
            var qr = lstSegment.Where(my => my.SegmentName == segmentCode).FirstOrDefault<SegmentStructure>();
            if (Common.isNullEmptyNothing(qr.SegmentName))
                return false;

            return true;
        }

        /// <summary>
        /// Get EDIFACT error check code
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        private int getEDIFACTControlCodeForGeneralCheck(int type)
        {
            switch (type)
            {
                case 0: // accept

                    if (strVersion.Contains("94A") || strVersion.Contains("94B") || strVersion.Contains("95B") || strVersion.Contains("96A")
                       || strVersion.Contains("96B") || strVersion.Contains("97A") || strVersion.Contains("93A"))
                        return CONTRL_1;
                    else
                        return CONTRL_7;

                case 1: // accept but error report
                    if (strVersion.Contains("94A") || strVersion.Contains("94B") || strVersion.Contains("95B") || strVersion.Contains("96A")
                      || strVersion.Contains("96B") || strVersion.Contains("97A") || strVersion.Contains("93A"))
                        return CONTRL_2;
                    else
                        return CONTRL_7;

                case 2: // reject
                        return CONTRL_4;

            }
            return CONTRL_1;
        }
        
    }

    /// <summary>
    /// Segment Structure
    /// </summary>
    public struct SegmentStructure
    {
        public string SegmentName;
        public int MinLength;
        public int MaxLength;
    }
}
