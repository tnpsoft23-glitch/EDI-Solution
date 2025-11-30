using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Windows.Forms;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Net.Configuration;

namespace BHEDI
{
    /// <summary>
    /// Common class contains public static variables and functions
    /// </summary>
    public class Common
    {
        /// <summary>
        /// True for Daido EDI system False for another system such as Bi-Mode
        /// </summary>
        public static readonly bool IS_FOR_DAIDO = false;

        /// <summary>
        /// Daido Trading Partner List 
        /// </summary>
        public static string DAIDO_PARTNER_LIST = "";

        /// <summary>
        /// program tile
        /// </summary>
        public static readonly string SYSTEM_NAME = "BHEDI";

        /// <summary>
        /// archive folder
        /// </summary>
        public static readonly string ARCHIVE_PATH = "C:\\BeachHead\\BHEDI\\Archive\\";

        /// <summary>
        /// default import IN
        /// </summary>
        public static readonly string IN_PATH = "C:\\BeachHead\\BHEDI\\IN\\";

        /// <summary>
        /// default import OUT
        /// </summary>
        public static readonly string OUT_PATH = "C:\\BeachHead\\BHEDI\\XML\\";

        /// <summary>
        /// default OUT VAN
        /// </summary>
        public static readonly string VAN_PATH = "C:\\BeachHead\\BHEDI\\VAN\\";

        /// <summary>
        /// Bi-Mode SQL Sript 
        /// </summary>
        public static readonly string EDI_IN_SQL_BIMODE = "C:\\BeachHead\\BHEDI\\Script\\EDI_IN_SQL.bat";

        /// <summary>
        /// Daido SQL Sript 
        /// </summary>
        public static readonly string EDI_IN_SQL_DAIDO = "C:\\BeachHead\\DAIDO\\Shipping_ERP\\EDI\\SCRIPTS\\EDI_IN_SQL.bat";

        /// <summary>
        /// default Inbound/Outbound Mapping export path
        /// </summary>
        public static readonly string MAP_EXPORT_PATH = "C:\\BeachHead\\BHEDI\\EXPORT\\";

        /// <summary>
        /// Default Transaction ID
        /// </summary>
        public static string DEFAULT_TRANSACTION_ID = "0001";

        /// <summary>
        /// Inoutbound setting value for Daido partner list
        /// </summary>
        public static string CONFIG_DAIDO_PARTNER_LIST = "DAIDO PARTNER LIST";

        /// <summary>
        /// Inoutbound setting value for Simmply checking account
        /// </summary>
        public static string CONFIG_SIMPLY_CHECKING_ACCOUNT = "SIMPLY CHECKING ACCOUNT";

        /// <summary>
        /// Inoutbound setting value for Simmply receivale account
        /// </summary>
        public static string CONFIG_SIMPLY_RECEIVABLE_ACCOUNT = "SIMPLY RECEIVABLE ACCOUNT";

        /// <summary>
        /// Inoutbound setting value for Simmply path file
        /// </summary>
        public static string CONFIG_SIMPLY_FILE = "SIMPLY FILE";

        /// <summary>
        /// Default Simmply checking account
        /// </summary>
        public static string DEFAULT_SIMPLY_CHECKING_ACCOUNT = "10300000";

        /// <summary>
        /// Default Simmply receivale account
        /// </summary>
        public static string DEFAULT_SIMPLY_RECEIVALE_ACCOUNT = "11000000";

        /// <summary>
        /// Simply data folder
        /// </summary>
        public static string SIMPLY_DATA_FOLDER = "Kansai Paint (America), New.SAJ";

        /// <summary>
        /// Send SQL Error Email option
        /// </summary>
        public static string SEND_SQL_ERROR_EMAIL = "";
        public static readonly string CONFIG_SEND_SQL_ERROR_EMAIL = "SEND SQL ERROR EMAIL";

        /// <summary>
        /// Send SQL Email Address
        /// </summary>
        public static string EMAIL = "";
        public static readonly string CONFIG_EMAIL = "EMAIL";

        /// <summary>
        ///  Send SQL Error Email ON
        /// </summary>
        public static readonly string CONFIG_ON = "ON";

        /// <summary>
        /// SCP / SAP IN OUT
        /// </summary>
        public static readonly string CONFIG_SCP_IN = "SCP IN";
        public static readonly string CONFIG_SCP_OUT = "SCP OUT";
        public static string SCP_IN = "";
        public static string SCP_OUT = "";
        public static readonly DateTime MIN_DATE = new DateTime(1900, 1, 1);
        public static string SEND_SCP_ERROR_EMAIL = "";
        public static readonly string CONFIG_SEND_SCP_ERROR_EMAIL = "SEND SCP ERROR EMAIL";
        public static string REQUIRE_ORDER_LEVEL_PARTNER_LIST = "";
        public static readonly string CONFIG_REQUIRE_ORDER_LEVEL_PARTNER_LIST = "REQUIRE ORDER LEVEL PARTNER LIST";



        /// <summary>
        /// Operator use for mapping
        /// </summary>
        public static readonly string OPT_CREATE_KEY = "CK";
        public static readonly string OPT_TRIM = "TR";
        public static readonly string OPT_ADD_BY = "AB";
        public static readonly string OPT_SUB_BY = "SB";
        public static readonly string OPT_DIV_BY = "DB";
        public static readonly string OPT_MUL_BY = "MB";
        public static readonly string OPT_ADD_BYV = "ABV";
        public static readonly string OPT_SUB_BYV = "SBV";
        public static readonly string OPT_DIV_BYV = "DBV";
        public static readonly string OPT_MUL_BYV = "MBV";

        public static readonly string OPT_REP_BY = "RP";
        public static readonly string OPT_ADDT_LEFT = "ATL";
        public static readonly string OPT_ADDT_RIGHT = "ATR";
        public static readonly string OPT_ADDV_LEFT = "AVL";
        public static readonly string OPT_ADDV_RIGHT = "AVR";
        public static readonly string OPT_STORE = "SV";
        public static readonly string OPT_BLANK = "BE";
        public static readonly string OPT_CONV_D1 = "DC1";
        public static readonly string OPT_CONV_D2 = "DC2";
        public static readonly string OPT_CONV_D3 = "DC3";
        public static readonly string OPT_CONV_D4 = "DC4";
        public static readonly string OPT_CONV_D5 = "DC5";
        public static readonly string OPT_CONV_D6 = "DC6";
        public static readonly string OPT_CONV_D7 = "DC7";
        public static readonly string OPT_CONV_D8 = "DC8";
        public static readonly string OPT_CONV_D9 = "DC9";
        public static readonly string OPT_CONV_D10 = "DC10";
        public static readonly string OPT_CONV_D11 = "DC11";
        public static readonly string OPT_CONV_D12 = "DC12";
        public static readonly string OPT_CONV_D13 = "DC13";
        public static readonly string OPT_CONV_D14 = "DC14";
        public static readonly string OPT_CONV_D15 = "DC15";
        public static readonly string OPT_UPCASE = "UC";
        public static readonly string OPT_LOWERCASE = "LC";
        public static readonly string OPT_SUBST = "ST";
        public static readonly string OPT_PAY_LEFT = "PL";
        public static readonly string OPT_PAY_RIGHT = "PR";
        public static readonly string OPT_DONOT1 = "NOT1";
        public static readonly string OPT_DONOT2 = "NOT2";
        public static readonly string OPT_GETD = "GETD";
        public static readonly string OPT_GETT = "GETT";
        public static readonly string OPT_GETDNOW = "GETDNOW";
        public static readonly string OPT_GETTNOW = "GETTNOW";
        public static readonly string OPT_GETTSNOW = "GETTSNOW";
        public static readonly string OPT_CONV_DEC = "CONVDEC";
        public static readonly string OPT_GETTIMEZONE = "GETTIMEZONE";

        public static readonly string OPT_SPLIT = "SPLIT";
        public static readonly string OPT_CLEAR_VAR = "CLEAR_VAR";
        public static readonly string XML_TRANSACTION_SET = "<TransactionSet>";
        public static readonly string XML_ASN_BEGIN = "<ASN>";
        public static readonly string XML_ASN_END = "</ASN>";
        public static readonly string EDI_ISA = "ISA";
        public static readonly string DAIDO_EDI_FACT_LIST = "GM,GM_MGO,GMMGO,GM_SPO,GMSPO,LUK,CUMMINS";
        public static readonly string OPT_CONV_D16 = "DC16";
        public static readonly string EDI_ID_MUL_IN_ONE_1 = "HHPG   HPGEC";  // 9/8/2021 Phuong added for Honda. Honda send 864 and 850 in the same file
        public static readonly string EDI_ID_MUL_IN_ONE_2 = "HHSP   HSPEC";  // 9/8/2021 Phuong added for Honda. Honda send 864 and 850 in the same file
        public static readonly string EDI_ID_997_824 = "04000"; // 9/13/2021 Phuong added for Chrysler sends 997 and 824 in the same file
        public static readonly string EDI_DISAGREE = "DISAGREE"; // 9/16/2021 Phuong added do not separate file by DISAGREE string 
        public static readonly string EDI_FACT_LIST = "MZ7,BFT,PAF"; // 5/24/2022 Phuong added for GM
        public static readonly string EDI_GSYEAR4_ID_LIST = "2184632312"; // 5/31/2022 Phuong addded Polaris require 855 with GS CCYYMMDD format
        public static readonly string EDI_GSYEAR4_TRAN_LIST = "855";
        public static readonly string EDI_ID_NO_LF_SEPARATOR_LIST = "ECARFRN"; // 10/6/2022 Phuong added for EIF the LF separator is changed by VAN
        public static readonly string EDI_STANDARD_SEPARATOR = "~";         // Using for auto forward functions 
 
        /// <summary>
        /// Log type
        /// </summary>
        public enum LOG_TYPE
        {
            JOB = 0,
            EDI_ERROR = 1,
            SYSTEM_ERROR = 2
        }

        /// <summary>
        /// 997 Functional Acknowlegement Generate
        /// </summary>
        public enum FA_TYPE
        {
            GENERAL = 0,
            DETAIL = 1,
            DO_NOT = 2
        }

        /// <summary>
        /// Error check
        /// </summary>
        public enum ERROR_CHECK_TYPE
        {
            DO_NOT = 0,
            CHECK_ALL = 1,
            DO_NOT_CHECK_MISSING = 2,
            DO_NOT_CHECK_INVALID = 3,
            DO_NO_CHECK_MAX = 4
        }

        /// <summary>
        /// EDI in out 
        /// </summary>
        public enum DIRECTION_TYPE 
        { 
            ALL = 1, 
            IN = 2, 
            OUT = 3 
        }

        /// <summary>
        /// 820 data for import to Simply
        /// </summary>
        public struct EDI_820 
        {
            public string HdrKey;
            public decimal Amount;
        }

        /// <summary>
        /// Convert to string
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static string myCStr(object obj)
        {
            
            if (Convert.IsDBNull(obj)) 
                return "";
            else if (obj == null) 
                return "";
            else
                return obj.ToString();
            
        }

        /// <summary>
        /// Convert to integer
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static int myCInt(object obj)
        {
            try
            {
                if (Convert.IsDBNull(obj))
                    return 0;
                else if (obj == null)
                    return 0;
                else
                    return int.Parse(obj.ToString());
            }
            catch 
            {
                try
                {
                    return (int)Math.Round(myCDbl(obj));
                }
                catch
                {
                    return 0;
                }

            }

        }

        /// <summary>
        /// Convert to double
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static double myCDbl(object obj)
        {
            try
            {
                if (Convert.IsDBNull(obj))
                    return 0.0;
                else if (obj == null)
                    return 0.0;
                else
                    return double.Parse(obj.ToString());
            }
            catch
            {
                return 0.0;
            }

        }

        /// <summary>
        /// Convert to Boolean
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static bool myCBool(object obj)
        {
            try
            {
                if (Convert.IsDBNull(obj))
                    return false;
                else if (obj == null)
                    return false;
                else
                    return bool.Parse(obj.ToString());
            }
            catch
            {
                return false;
            }

        }

        /// <summary>
        /// Convert to Datetime
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static DateTime myCDate(object obj)
        {
            try
            {
                if (Convert.IsDBNull(obj))
                    return DateTime.Parse("1/1/1900");
                else if (obj == null)
                    return DateTime.Parse("1/1/1900");
                else
                    return DateTime.Parse(obj.ToString());
            }
            catch
            {
                return DateTime.Parse("1/1/1900");
            }

        }

        /// <summary>
        /// Check value is null or empty
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static bool isNullEmptyNothing(string str)
        {
            if (Convert.IsDBNull(str) || str == null || String.IsNullOrEmpty(str))
                return true;
            return false;
        }

        /// <summary>
        /// Write log
        /// </summary>
        /// <param name="tradingNo"></param>
        /// <param name="tsetNo"></param>
        /// <param name="errMsg"></param>
        /// <param name="logType"></param>
        /// <param name="dtTransaction"></param>
        public static void writeLog(int tradingNo, int tsetNo, string errMsg, int logType, DateTime? dtTransaction = null, int rawDataNo = -1)
        {
            try
            {
                BHEDI_EDM edm = new BHEDI_EDM();
                tblErrorLog errLog = new tblErrorLog();
                if (!dtTransaction.HasValue)
                    dtTransaction = DateTime.Now;

                errLog.LogDate = (DateTime)dtTransaction;

                if (tradingNo != -1)
                    errLog.TradingPartnerNo_FK = tradingNo;
                if (tsetNo != -1)
                    errLog.TransactionSetNo_FK = tsetNo;
                if (rawDataNo != -1)
                    errLog.TransactionRawDataNo_FK = rawDataNo;
                errLog.ErrorMessage = errMsg;
                errLog.LogType = logType;

                edm.AddTotblErrorLogs(errLog);
                edm.SaveChanges();

            }
            catch
            {
               
            }
        }

        /// <summary>
        /// Archice file
        /// </summary>
        /// <param name="str"></param>
        public static void archiveFile(string str)
        {
            if (!Directory.Exists(Common.ARCHIVE_PATH))
                Directory.CreateDirectory(Common.IN_PATH);

            string fileName = Path.GetFileNameWithoutExtension(str);
            fileName = Common.ARCHIVE_PATH +  fileName + "_" + DateTime.Now.ToString("MMddyyyy_HHmmss") +   Path.GetExtension(str);
            File.Copy(str, fileName);

        }

        /// <summary>
        /// Get upload directory
        /// </summary>
        /// <param name="directory"></param>
        /// <returns></returns>
        public static string uploadDirectory(string directory)
        {
            try
            {
                string strDirectory = "";

                FolderBrowserDialog fbd = new FolderBrowserDialog();

                if (Directory.Exists(directory))
                {
                    fbd.SelectedPath = directory;
                }
                else
                {
                    fbd.RootFolder = Environment.SpecialFolder.Desktop;
                }

                if (fbd.ShowDialog() == DialogResult.OK)
                {
                    strDirectory = fbd.SelectedPath + "\\";
                }
                else
                {
                    strDirectory = directory;
                }

                return strDirectory;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return null;
            }
        }

        /// <summary>
        /// Get upload file
        /// </summary>
        /// <param name="directory"></param>
        /// <returns></returns>
        public static string uploadFile(string fileName)
        {
            try
            {
                string strFileName = fileName;

                OpenFileDialog ofd = new OpenFileDialog();

                if (File.Exists(fileName))
                {
                    ofd.InitialDirectory = Path.GetDirectoryName(fileName);
                }
                else
                {
                    ofd.InitialDirectory = Environment.SpecialFolder.Desktop.ToString();
                }

                if (ofd.ShowDialog() == DialogResult.OK)
                {
                    strFileName = ofd.FileName;
                }

                return strFileName;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return null;
            }
        }

        /// <summary>
        /// add by use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string addBy(string str, string param)
        {
            if (isNullEmptyNothing(param))
                return str;

            try
            {
                int num1 = int.Parse(str);
                int num2 = int.Parse(param);
                num1 = num1 + num2;
                return num1.ToString();
            }
            catch
            {
                return str;
            }
        }
        /// <summary>
        /// add by VARIABLE use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string addByVariable(string str, string param)
        {
            if (isNullEmptyNothing(param))
                return str;

            try
            {
                double num1 = double.Parse(str);
                double num2 = double.Parse(param);
                num1 = num1 + num2;
                return num1.ToString();
            }
            catch
            {
                return (str.Equals("") ? param : str);
            }
        }
        /// <summary>
        /// subtract by use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string subBy(string str, string param)
        {
            if (isNullEmptyNothing(param))
                return str;

            try
            {
                int num1 = int.Parse(str);
                int num2 = int.Parse(param);
                num1 = num1 - num2;
                return num1.ToString();
            }
            catch
            {
                return str;
            }
        }
        /// <summary>
        /// subtract by Variable use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string subByVariable(string str, string param)
        {
            if (isNullEmptyNothing(param))
                return str;

            try
            {
                double num1 = double.Parse(str);
                double num2 = double.Parse(param);
                num1 = num1 - num2;
                return num1.ToString();
            }
            catch
            {
                return (str.Equals("") ? param : str);
            }
        }
        /// <summary>
        /// multi by use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string mulBy(string str, string param)
        {
            if (isNullEmptyNothing(param))
                return str;

            try
            {
                int num1 = int.Parse(str);
                int num2 = int.Parse(param);
                num1 = num1 * num2;
                return num1.ToString();
            }
            catch
            {
                return str;
            }
        }
        /// <summary>
        /// multi by Variable use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string mulByVariable(string str, string param)
        {
            if (isNullEmptyNothing(param))
                return str;

            try
            {
                double num1 = double.Parse(str);
                double num2 = double.Parse(param);
                num1 = num1 * num2;
                return num1.ToString();
            }
            catch
            {
                return  (str.Equals("") ? param : str);
            }
        }
        /// <summary>
        /// divide by use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string divBy(string str, string param)
        {
            if (isNullEmptyNothing(param))
                return str;

            try
            {
                int num1 = int.Parse(str);
                int num2 = int.Parse(param);
                num1 = num1 / num2;
                return num1.ToString();
            }
            catch
            {
                return str;
            }
        }
        /// <summary>
        /// divide by Variable use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string divByVariable(string str, string param)
        {
            if (isNullEmptyNothing(param))
                return str;

            try
            {
                double num1 = double.Parse(str);
                double num2 = double.Parse(param);
                num1 = num1 / num2;
                return num1.ToString();
            }
            catch
            {
                return (str.Equals("") ? param : str);
            }
        }
        /// <summary>
        /// replace by use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string replaceBy(string str, string param)
        {
            if (isNullEmptyNothing(param))
                return str;

            try
            {
                string[] p = param.Split(',');
                return str.Replace(p[0],p[1]);
            }
            catch
            {
                return str;
            }
        }

        /// <summary>
        /// add text on left use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string addTextOnLeft(string str, string param)
        {
            if (isNullEmptyNothing(param))
                return str;

            try
            {
                return param + str;
            }
            catch
            {
                return str;
            }
        }

        /// <summary>
        /// add text on right use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string addTextOnRight(string str, string param)
        {
            if (isNullEmptyNothing(param))
                return str;

            try
            {
                return str + param;
            }
            catch
            {
                return str;
            }
        }

        /// <summary>
        /// substring use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string substringBy(string str, string param)
        {
            if (isNullEmptyNothing(param))
                return str;

            try
            {
                string[] p = param.Split(',');
                int start = int.Parse(p[0]);
                int pos = int.Parse(p[1]);

                return str.Substring(start, pos);
            }
            catch
            {
                return str;
            }
        }
        
        /// <summary>
        /// pad left use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string padleftBy(string str, string param)
        {
            if (isNullEmptyNothing(param))
                return str;

            try
            {
                int start = int.Parse(param);

                return str.PadLeft(start);
            }
            catch
            {
                return str;
            }
        }

        /// <summary>
        /// pad right use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string padRightBy(string str, string param)
        {
            if (isNullEmptyNothing(param))
                return str;

            try
            {
                int start = int.Parse(param);

                return str.PadRight(start);
            }
            catch
            {
                return str;
            }
        }

        /// <summary>
        /// Convert CCYYMMDD To MM-DD-CCYY use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string convertDate1(string str)
        {

            try
            {
                DateTime dt = DateTime.ParseExact(str, "yyyyMMdd", CultureInfo.InvariantCulture);
                return dt.ToString("MM-dd-yyyy", CultureInfo.InvariantCulture);
            }
            catch
            {
                return DateTime.Now.ToString("MM-dd-yyyy", CultureInfo.InvariantCulture);
                //return str;
            }
        }

        /// <summary>
        /// Convert CCYYMMDD To MM/DD/CCYY use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static  string convertDate2(string str)
        {

            try
            {
                DateTime dt = DateTime.ParseExact(str, "yyyyMMdd", CultureInfo.InvariantCulture);
                return dt.ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            }
            catch
            {
                return DateTime.Now.ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                //return str;
            }
        }

        /// <summary>
        /// Convert CCYYMMDD To YYMMDD use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string convertDate3(string str)
        {

            try
            {
                DateTime dt = DateTime.ParseExact(str, "yyyyMMdd", CultureInfo.InvariantCulture);
                return dt.ToString("yyMMdd", CultureInfo.InvariantCulture);
            }
            catch
            {
                return DateTime.Now.ToString("yyMMdd", CultureInfo.InvariantCulture);
                //return str;
            }
        }


        /// <summary>
        /// Convert DD?MM?CCYY To CCYYMMDD use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string convertDate4(string str)
        {

            try
            {
                DateTime dt = DateTime.Parse(str, CultureInfo.InvariantCulture);
                return dt.ToString("yyyyMMdd");
            }
            catch
            {
                return DateTime.Now.ToString("yyyyMMdd", CultureInfo.InvariantCulture); 
                //return str;
            }
        }

        /// <summary>
        /// Convert DD?MM?CCYY To YYMMDD use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string convertDate5(string str)
        {

            try
            {
                DateTime dt = DateTime.Parse(str, CultureInfo.InvariantCulture);
                return dt.ToString("yyMMdd");
            }
            catch
            {
                return DateTime.Now.ToString("yyMMdd", CultureInfo.InvariantCulture); 
                //return str;
            }
        }

        /// <summary>
        /// Convert YYMMDD to YYYYMMDD use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string convertDate6(string str)
        {

            try
            {
                DateTime dt = DateTime.ParseExact(str, "yyMMdd", CultureInfo.InvariantCulture);

                return dt.ToString("yyyyMMdd", CultureInfo.InvariantCulture);
            }
            catch
            {
                return DateTime.Now.ToString("yyyyMMdd", CultureInfo.InvariantCulture);
                //return str;
            }
        }
        /// <summary>
        /// Convert YYMMDD to MM-DD-YYYY use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string convertDate7(string str)
        {

            try
            {
                DateTime dt = DateTime.ParseExact(str, "yyMMdd", CultureInfo.InvariantCulture);

                return dt.ToString("MM-dd-yyyy", CultureInfo.InvariantCulture);
            }
            catch
            {
                return DateTime.Now.ToString("MM-dd-yyyy", CultureInfo.InvariantCulture);
                //return str;
            }
        }

        /// <summary>
        /// Convert YYMMDD to MM-DD-YY use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string convertDate8(string str)
        {

            try
            {
                DateTime dt = DateTime.ParseExact(str, "yyMMdd", CultureInfo.InvariantCulture);

                return dt.ToString("MM-dd-yy", CultureInfo.InvariantCulture);
            }
            catch
            {
                return DateTime.Now.ToString("MM-dd-yy", CultureInfo.InvariantCulture);
                //return str;
            }
        }

        /// <summary>
        /// Convert YYMMDD to MM/DD/YYYY use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string convertDate9(string str)
        {

            try
            {
                DateTime dt = DateTime.ParseExact(str, "yyMMdd", CultureInfo.InvariantCulture);

                return dt.ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            }
            catch
            {
                return DateTime.Now.ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                //return str;
            }
        }

        /// <summary>
        /// Convert YYMMDD to MM/DD/YY use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string convertDate10(string str)
        {

            try
            {
                DateTime dt = DateTime.ParseExact(str, "yyMMdd", CultureInfo.InvariantCulture);

                return dt.ToString("MM/dd/yy", CultureInfo.InvariantCulture);
            }
            catch
            {
                return DateTime.Now.ToString("MM/dd/yy", CultureInfo.InvariantCulture);
                //return str;
            }
        }

        /// <summary>
        /// Convert HHMM to HH:MM use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string convertDate11(string str)
        {

            try
            {
                return str.Substring(0, 2) + ":" + str.Substring(2, 2);
            }
            catch
            {
                return str;
            }
        }

        /// <summary>
        /// Convert HHMMSS to HH:MM:SS use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string convertDate12(string str)
        {

            try
            {
                return str.Substring(0, 2) + ":" + str.Substring(2, 2) + ":" + str.Substring(4, 2);
            }
            catch
            {
                return str;
            }
        }

        /// <summary>
        /// Convert HH:MM:SS to HHMMSS use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string convertDate13(string str)
        {

            try
            {
                return str.Replace(":","");
            }
            catch
            {
                return str;
            }
        }

        /// <summary>
        /// Convert HH:MM:SS to HHMM use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string convertDate14(string str)
        {

            try
            {
                return str.Replace(":", "").Substring(0,4);
            }
            catch
            {
                return str;
            }
        }

        /// <summary>
        /// Get Date use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string getDate(string str)
        {

            try
            {
                string[] arr = str.Split(' ');
                return arr[0];
            }
            catch
            {
                return str;
            }
        }

        // <summary>
        /// Get Time use for mapping setting
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string getTime(string str)
        {

            try
            {
                string[] arr = str.Split(' ');
                return arr[1];
            }
            catch
            {
                return str;
            }
        }
        /// <summary>
        /// Get current date
        /// </summary>
        /// <returns></returns>
        public static string getDateNow()
        {
            return DateTime.Now.ToString("yyyyMMdd", CultureInfo.InvariantCulture);
        }
        /// <summary>
        /// Get current time
        /// </summary>
        /// <returns></returns>
        public static string getTimeNow()
        {
            return DateTime.Now.ToString("HHmm", CultureInfo.InvariantCulture);
        }
        /// <summary>
        /// Get Current Time until second
        /// </summary>
        /// <returns></returns>
        public static string getTimeSecondNow()
        {
            return DateTime.Now.ToString("HHmmss", CultureInfo.InvariantCulture);
        }
        /// <summary>
        /// Remove special charater
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string removeSpecialCharater(string str)
        {
            try
            {
                str = new string(str.Trim().Where(c => !char.IsControl(c)).ToArray());

                if (!char.IsLetterOrDigit(str[str.Length - 1]))
                    str = str.Substring(0, str.Length - 1);
            }
            catch
            {
                return str;
            }
                return str;
        }

        /// <summary>
        /// process string
        /// </summary>
        /// <param name="str"></param>
        /// <param name="lenght"></param>
        /// <param name="isPadLeft"></param>
        /// <param name="isPadRight"></param>
        /// <returns></returns>
        public static string getString(string str, int len, bool isPadLeft, bool isPadRight)
        {
            try
            {
                if (str.Length > len)
                    str = str.Substring(0, len);
                else if (str.Length < len)
                    str = str.PadRight(len);
                if (isPadLeft)
                    str = str.PadLeft(len);
                if (isPadRight)
                    str = str.PadRight(len);

                return str;
            }
            catch
            {
                return str;
            }
        }

        // <summary>
        /// split and get element
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string splitstringBy(string str, string param)
        {
            if (isNullEmptyNothing(param))
                return str;

            try
            {
                string[] p = param.Split(',');
                char ch = Char.Parse(p[0].Substring(0, 1));
                string[] st = str.Split(ch);
                str = st[myCInt(p[1])];
                return str;
                
            }
            catch
            {
                return str;
            }
        }

        /// <summary>
        /// Get most recent EDI data
        /// </summary>
        /// <param name="tradingNo"></param>
        /// <param name="tsetNo"></param>
        /// <returns></returns>
        public static int getMostRecentData(int tradingNo, int tsetNo)
        {
            int intNO = -1;

            using (var edm = new BHEDI_EDM())
            {
                var qr = edm.tblEDITrasactionRawDatas.Where(my => my.TradingPartnerNo_FK == tradingNo && my.TransactionSetNo_FK == tsetNo)
                                                     .OrderByDescending(t => t.TransactionDate).FirstOrDefault<tblEDITrasactionRawData>();

                if (qr != null)
                    intNO = qr.TransactionRawDataNo;
            }

            return intNO;
        }

        /// <summary>
        /// Set database name for crystal report at run time
        /// </summary>
        /// <param name="rptDoc"></param>
        /// <returns></returns>
        public static CrystalDecisions.CrystalReports.Engine.ReportDocument SetDBNameForRptAtRunning(CrystalDecisions.CrystalReports.Engine.ReportDocument rptDoc)
        {
            try
            {
                CrystalDecisions.CrystalReports.Engine.Tables crTables = rptDoc.Database.Tables;
                System.Data.SqlClient.SqlConnectionStringBuilder connectionStr = new System.Data.SqlClient.SqlConnectionStringBuilder(Properties.Settings.Default.BHEDI_ConnectionString.ToString());

                foreach (CrystalDecisions.CrystalReports.Engine.Table crTable in crTables)
                {
                    CrystalDecisions.Shared.TableLogOnInfo crTableLogOnInfo = crTable.LogOnInfo;
                    crTableLogOnInfo.ConnectionInfo.DatabaseName = connectionStr.InitialCatalog;
                    crTable.ApplyLogOnInfo(crTableLogOnInfo);
                }

                return rptDoc;
            }
            catch 
            {
                return null;
            }
        }

        /// <summary>
        /// make unique EDI Out file name by add date and time
        /// </summary>
        /// <param name="strFileName"></param>
        /// <returns></returns>
        public static string makeUniqueFileName(string strFileName)
        {
            try
            {

                string strName = Path.GetFileNameWithoutExtension(strFileName);
                strName += "_" + DateTime.Now.ToString("MMddyyyy_HHmmssffff") + Path.GetExtension(strFileName);
                strName = Path.GetDirectoryName(strFileName) + "\\" + strName;
                return strName;
            }
            catch
            {
                return strFileName;
            }

        }

        /// <summary>
        /// Transfer one XML that contain many shipment data to many XML files that contain one shipment data only
        /// </summary>
        /// <param name="strPath"></param>
        public static void transferOneXMLToManyXML(string strPath)
        {
             string[] files = Directory.GetFiles(strPath);
             foreach (string file in files)
             {
                 string lines = System.IO.File.ReadAllText(file, Encoding.ASCII);
                 string[] arrTrans  = System.Text.RegularExpressions.Regex.Split(lines, XML_TRANSACTION_SET);
                 if (arrTrans.Length > 2) // contains multi shipment data
                 {
                    // delete original file
                    File.Delete(file);
                    // make multi XML file
                    for (int i = 1; i < arrTrans.Length; i++) // i = 0 is ASN tag
                    {
                        string fileName = Path.GetFileNameWithoutExtension(file);
                        fileName = strPath + fileName + "_" + i + Path.GetExtension(file);
                        if (!arrTrans[i].Contains(XML_ASN_BEGIN) && !arrTrans[i].Contains(XML_ASN_END))
                            arrTrans[i] = XML_ASN_BEGIN + XML_TRANSACTION_SET + arrTrans[i] + XML_ASN_END;
                        else if (!arrTrans[i].Contains(XML_ASN_BEGIN))
                            arrTrans[i] = XML_ASN_BEGIN + XML_TRANSACTION_SET + arrTrans[i];
                        else if (!arrTrans[i].Contains(XML_ASN_END))
                            arrTrans[i] = XML_TRANSACTION_SET + arrTrans[i] + XML_ASN_END;

                        System.IO.File.WriteAllText(fileName, arrTrans[i], Encoding.ASCII);
                    }
                 }


             }
        }

        /// <summary>
        /// Check if is EDI data from Honda
        /// </summary>
        /// <param name="lines"></param>
        /// <returns></returns>
        public static bool checkHondaID(string lines)
        {
            if (lines.Contains("HAHM   AHMEC") || lines.Contains("HCMH   HCMEC") || lines.Contains("HOAM   HXMFG") || lines.Contains("HHCL   HCLEC") || lines.Contains("HDMH   HDMEC")
                    || lines.Contains("HHCL   HCLEC") || lines.Contains("HMFG   HMAEC") || lines.Contains("HDMH   HDMEC") || lines.Contains("HHSP   HSPEC")
                    || lines.Contains("HHTA   HTMXC") || lines.Contains("HHPG   HPGEC") || lines.Contains("HHSP   HSPEC") || lines.Contains("HONDANAEDIPRD"))
                return true;
            return false;
        }

        /// <summary>
        /// Transfer one EDI that contain many transaction data to many EDI files that contain one trasaction data only
        /// </summary>
        /// <param name="strPath"></param>
        public static void transferOneEDIToManyEDI(string strPath)
        {
            // 9/13/2023 Phuong turned OFF this function because after Honda moved to OpenText they send separate data
            /*
            string[] files = Directory.GetFiles(strPath);
            foreach (string file in files)
            {
                string lines = System.IO.File.ReadAllText(file, Encoding.ASCII);
                // 9/8/2021 Phuong added Honda send 864 and 850 in the same file
                if ((lines.Contains("ST*142*") || lines.Contains("ST#142#") || lines.Contains("ST?142?") || lines.Contains("ST|142|") || lines.Contains("ST~142~") || lines.Contains("ST+142+")
                    || lines.Contains("ST*850*") || lines.Contains("ST#850#") || lines.Contains("ST?850?") || lines.Contains("ST|850|") || lines.Contains("ST~850~") || lines.Contains("ST+850+")
                    || lines.Contains("ST*860*") || lines.Contains("ST#860#") || lines.Contains("ST?860?") || lines.Contains("ST|860|") || lines.Contains("ST~860~") || lines.Contains("ST+860+")
                    || lines.Contains("ST*864*") || lines.Contains("ST#864#") || lines.Contains("ST?864?") || lines.Contains("ST|864|") || lines.Contains("ST~864~") || lines.Contains("ST+864+")
                    || lines.Contains("ST*824*") || lines.Contains("ST#824#") || lines.Contains("ST?824?") || lines.Contains("ST|824|") || lines.Contains("ST~824~") || lines.Contains("ST+824+") 
                    || lines.Contains(Common.EDI_DISAGREE)) && !checkHondaID(lines)) // 2/21/2017 avoid 142 // 6/14/2021 avoid 850, 860, 864
                    continue;
                
                string[] arrTrans = System.Text.RegularExpressions.Regex.Split(lines, EDI_ISA);
                if (arrTrans.Length > 2) // contains multi shipment data
                {
                    // delete original file
                    File.Delete(file);
                    // make multi XML file
                    for (int i = 1; i < arrTrans.Length; i++) // i = 0 is ASN tag
                    {
                        string fileName = Path.GetFileNameWithoutExtension(file);
                        fileName = strPath + fileName + "_" + i + Path.GetExtension(file);
                        System.IO.File.WriteAllText(fileName, EDI_ISA + arrTrans[i], Encoding.ASCII);
                    }
                }
            }
            */
        }


        /// <summary>
        /// Convert value to CSV formatted string value
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        public static string writeCSVEntry(String s)
        {
            if (myCStr(s) != "")
            {
                char[] char_escape_list = { ',', '"', '\n' };

                if (s.Contains("\""))
                {
                    s = s.Replace("\"", "\"\"");
                }

                if (s.IndexOfAny(char_escape_list) > -1)
                {
                    s = "\"" + s + "\"";
                }
            }

            return s;
        }

        /// <summary>
        /// Init value for static variables
        /// </summary>
        public static void initStaticVariables()
        {

            using (var edm = new BHEDI_EDM())
            {
                var objTbl = edm.tblInboundOutboundSettings.Where(s => s.SettingName.Equals(CONFIG_DAIDO_PARTNER_LIST));
                foreach (var objRow in objTbl)
                {
                    DAIDO_PARTNER_LIST = objRow.Path;
                }
                // 10/23/2020 Phuong added send Sql ERROR
                var objTbl2 = edm.tblInboundOutboundSettings.Where(s => s.SettingName.Equals(CONFIG_SEND_SQL_ERROR_EMAIL));
                foreach (var objRow in objTbl2)
                {
                    SEND_SQL_ERROR_EMAIL = objRow.Path;
                }
                var objTbl3 = edm.tblInboundOutboundSettings.Where(s => s.SettingName.Equals(CONFIG_EMAIL));
                foreach (var objRow in objTbl3)
                {
                    EMAIL = objRow.Path;
                }
                // 10/27/2020 Phuong added Export to SCP / SAP
                var objTbl4 = edm.tblInboundOutboundSettings.Where(s => s.SettingName.Equals(CONFIG_SCP_IN));
                foreach (var objRow in objTbl4)
                {
                    SCP_IN = objRow.Path;
                }
                var objTbl5 = edm.tblInboundOutboundSettings.Where(s => s.SettingName.Equals(CONFIG_SCP_OUT));
                foreach (var objRow in objTbl5)
                {
                    SCP_OUT = objRow.Path;
                }
                var objTbl6 = edm.tblInboundOutboundSettings.Where(s => s.SettingName.Equals(CONFIG_SEND_SCP_ERROR_EMAIL));
                foreach (var objRow in objTbl6)
                {
                    SEND_SCP_ERROR_EMAIL = objRow.Path;
                }
                var objTbl7 = edm.tblInboundOutboundSettings.Where(s => s.SettingName.Equals(CONFIG_REQUIRE_ORDER_LEVEL_PARTNER_LIST));
                foreach (var objRow in objTbl7)
                {
                    REQUIRE_ORDER_LEVEL_PARTNER_LIST = objRow.Path;
                }

            }
        }

        /// <summary>
        /// Backup Simply Accounting file before import
        /// </summary>
        /// <param name="strSimplyFile"></param>
        /// <returns></returns>
        public static bool backupSimplyAccountingFile(string strSimplyFile)
        {
            try
            {
                string strPath = Path.GetDirectoryName(strSimplyFile);
                string strPathBackup = Path.Combine(ARCHIVE_PATH + "\\Simply",DateTime.Now.ToString("MMddyyyy"));
                if (!Directory.Exists(strPathBackup))
                    Directory.CreateDirectory(strPathBackup);
                File.Copy(strSimplyFile, Path.Combine(strPathBackup,Path.GetFileName(strSimplyFile)),true);

                string strDataFolder = Path.Combine(strPath, SIMPLY_DATA_FOLDER);
                strPathBackup = Path.Combine(strPathBackup, SIMPLY_DATA_FOLDER);
                
                if (!Directory.Exists(strPathBackup))
                    Directory.CreateDirectory(strPathBackup);

                DirectoryInfo diSource = new DirectoryInfo(strDataFolder);
                DirectoryInfo diTarget = new DirectoryInfo(strPathBackup);
                CopyAll(diSource, diTarget);

            }
            catch (Exception ex)
            {
                writeLog(-1, -1, ex.Message, (int)LOG_TYPE.SYSTEM_ERROR);
                return false;
            }
            
            
            return true;

        }
        

        /// <summary>
        /// Copy 2 directory
        /// </summary>
        /// <param name="source"></param>
        /// <param name="target"></param>
        public static void CopyAll(DirectoryInfo source, DirectoryInfo target)
        {
            // Copy each file into the new directory.
            foreach (FileInfo fi in source.GetFiles())
            {
                fi.CopyTo(Path.Combine(target.FullName, fi.Name), true);
            }

            // Copy each subdirectory using recursion.
            foreach (DirectoryInfo diSourceSubDir in source.GetDirectories())
            {
                DirectoryInfo nextTargetSubDir =
                    target.CreateSubdirectory(diSourceSubDir.Name);
                CopyAll(diSourceSubDir, nextTargetSubDir);
            }
       }

        /// <summary>
        /// Convert YYWW or YYMM to Date
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string convertDate16(string str)
        {

            try
            {
                
                // inside str value there are 2 FLAG option 999 YYWW 998 YYMM

                string[] arrTmp = str.Split(':');
                if (arrTmp[1].Equals("999")) // YYWW to YYMMDD
                {
                    int week = int.Parse(arrTmp[0].Substring(2, 2));
                    int year = int.Parse(arrTmp[0].Substring(0, 2)) + 2000;
                    DateTime firstWeekDay = FirstDateOfWeek(year,week);
                    return firstWeekDay.ToString("MM-dd-yyyy", CultureInfo.InvariantCulture);

                }
                else if (arrTmp[1].Equals("998")) // YYMM to YYMMDD
                {
                    DateTime dt = DateTime.ParseExact(arrTmp[0] + "01", "yyMMdd", CultureInfo.InvariantCulture);
                    dt = dt.AddMonths(1).AddDays(-1);
                    return dt.ToString("MM-dd-yyyy", CultureInfo.InvariantCulture);
                }

                else if (arrTmp[1].Equals("997")) // YYMMDD
                {
                    DateTime dt = DateTime.ParseExact(arrTmp[0].Substring(0, 8), "yyyyMMdd", CultureInfo.InvariantCulture);
                   
                    return dt.ToString("MM-dd-yyyy", CultureInfo.InvariantCulture);
                }

                return DateTime.Now.ToString("MM-dd-yyyy", CultureInfo.InvariantCulture);  


            }
            catch
            {
                return DateTime.Now.ToString("MM-dd-yyyy", CultureInfo.InvariantCulture); 
            }
        }


        /// <summary>
        /// Get first date of week
        /// </summary>
        /// <param name="year"></param>
        /// <param name="weekOfYear"></param>
        /// <returns></returns>
        public static DateTime FirstDateOfWeek(int year, int weekOfYear)
        {
            DateTime jan1 = new DateTime(year, 1, 1);

            int daysOffset = (int)CultureInfo.CurrentCulture.DateTimeFormat.FirstDayOfWeek - (int)jan1.DayOfWeek;

            DateTime firstMonday = jan1.AddDays(daysOffset);

            int firstWeek = CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(jan1, CultureInfo.CurrentCulture.DateTimeFormat.CalendarWeekRule, CultureInfo.CurrentCulture.DateTimeFormat.FirstDayOfWeek);

            if (firstWeek <= 1)
            {
                weekOfYear -= 1;
            }

            return firstMonday.AddDays(weekOfYear * 7);
        }


        /// <summary>
        /// Count string appear in string
        /// </summary>
        /// <param name="needle"></param>
        /// <param name="haystack"></param>
        /// <returns></returns>
        public static int countOccurences(string needle, string haystack)
        {
            return (haystack.Length - haystack.Replace(needle, "").Length) / needle.Length;
        }

        /// <summary>
        /// Send email error
        /// </summary>
        /// <param name="str"></param>
        public static void sendEmail(string str,string emailTo)
        {
            try
            {
                if (Common.IS_FOR_DAIDO)
                {

                    SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
                    using (MailMessage mm = new MailMessage(smtpSection.From, emailTo))
                    {
                        mm.Subject = "BHEDI Error Notification";
                        mm.Body = str;
                        mm.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = smtpSection.Network.Host;
                        smtp.EnableSsl = smtpSection.Network.EnableSsl;
                        NetworkCredential networkCred = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
                        smtp.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
                        smtp.Credentials = networkCred;
                        smtp.Port = smtpSection.Network.Port;
                        smtp.Send(mm);
                    }
                }
                else
                {
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("smtp-relay.gmail.com");
                    mail.From = new MailAddress("noreply@bhead.com", "BHEDI Error Notification");
                    mail.To.Add(emailTo);
                    mail.Subject = "BHEDI Error Notification";
                    mail.Body = str;
                    mail.IsBodyHtml = true;
                    SmtpServer.EnableSsl = false;
                    SmtpServer.Send(mail);

                }
            }
            catch (Exception ex)
            {
                writeLog(-1, -1, ex.Message, (int)LOG_TYPE.SYSTEM_ERROR);
            }
        }

        /// <summary>
        /// Get HH:MM from Date Time data and return black if no time
        /// </summary>
        /// <param name="dt"></param>
        /// <returns></returns>
        public static string getHourMinFromDateTime(DateTime dt)
        {
            string str = "";
            try
            {
                str = dt.ToString("HH:mm");
                if (str.Equals("00:00"))
                    str = "";
            }
            catch
            {
                return "";
            }
            return str;

        }


        /// <summary>
        /// Convert to decimal
        /// </summary>
        /// <param name="str"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string convertToDecimal(string str, string param)
        {
            if (isNullEmptyNothing(param))
                return str;

            string strRet = "";

            try
            {
                
                int intNum = int.Parse(param);
                int intPos = str.IndexOf(".");
                if (intPos >= 0)
                {
                    strRet = str.Substring(intPos + 1);

                }
                else{
                    strRet = "";    
                }


                if (strRet.Length < intNum)
                {
                    intNum -= strRet.Length;
                    strRet = str;

                    for (int i = 0; i < intNum; i++)
                    {
                        strRet = strRet + "0";
                    }

                }
                else
                {
                    strRet = str.Substring(0,strRet.Length+1);
                
                }
               
            }
            catch
            {
                return str;
            }

            return strRet;
        }

        /// <summary>
        /// Get Time Zone Code
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public static string getTimeZoneCode(string param)
        {
            try
            {
               
                // 0 Central Standard Time
                // 1 Eastern Standard Time
                // 2 Mountain Standard Time
                // 3 Pacific Standard Time
                bool blnDaylightSavingTime = true;
                string strTimeZone = "0";
                string strTimeCode = "";
                if (!isNullEmptyNothing(param))
                {
                    strTimeZone = param;
                    if (!strTimeZone.Equals("0") && !strTimeZone.Equals("1") && !strTimeZone.Equals("2") && !strTimeZone.Equals("3"))
                        strTimeZone = "0";
                    
                }
                string easternZoneId  = "Eastern Standard Time";
                string centralZoneId = "Central Standard Time";
                string mountainZoneId = "Mountain Standard Time";
                string pacificZoneId = "Pacific Standard Time";

                TimeZoneInfo easternZone = TimeZoneInfo.FindSystemTimeZoneById(easternZoneId);
                TimeZoneInfo centralZone = TimeZoneInfo.FindSystemTimeZoneById(centralZoneId);
                TimeZoneInfo mountainZone = TimeZoneInfo.FindSystemTimeZoneById(mountainZoneId);
                TimeZoneInfo pacificZone = TimeZoneInfo.FindSystemTimeZoneById(pacificZoneId);

                if (strTimeZone.Equals("0"))
                    blnDaylightSavingTime = easternZone.IsDaylightSavingTime(DateTime.Now);
                else if (strTimeZone.Equals("1"))
                    blnDaylightSavingTime = centralZone.IsDaylightSavingTime(DateTime.Now);
                else if (strTimeZone.Equals("2"))
                    blnDaylightSavingTime = mountainZone.IsDaylightSavingTime(DateTime.Now);
                else if (strTimeZone.Equals("3"))
                    blnDaylightSavingTime = pacificZone.IsDaylightSavingTime(DateTime.Now);

                switch (strTimeZone)
                {
                    case "0":
                        if (!blnDaylightSavingTime)
                            strTimeCode = "CT";
                        else
                            strTimeCode = "CD";
                        break;
                    case "1":
                        if (!blnDaylightSavingTime)
                            strTimeCode = "ET";
                        else
                            strTimeCode = "ED";
                        break;
                    case "2":
                        if (!blnDaylightSavingTime)
                            strTimeCode = "MT";
                        else
                            strTimeCode = "MD";
                        break;
                    case "3":
                        if (!blnDaylightSavingTime)
                            strTimeCode = "PT";
                        else
                            strTimeCode = "PD";
                        break;
                }

                return strTimeCode;
            }
            catch
            {
                return "";
            }
        }
    }

    /// <summary>
    /// Value and description set for combobox item
    /// </summary>
    public class myCombobxItem
    {
        private object myValue;
        private String myDescription;

        /// <summary>
        /// Set Description and Value
        /// </summary>
        /// <param name="desc"></param>
        /// <param name="value"></param>
        public myCombobxItem(string desc, object value)
        {
            this.myValue = value;
            this.myDescription = desc;
        }

        /// <summary>
        /// Get Description
        /// </summary>
        public string Description
        {
            get 
            {
                return myDescription;
            }
        }

        /// <summary>
        /// Get Value
        /// </summary>
        public object Value
        {
            get
            {
                return myValue;
            }
        }

        /// <summary>
        /// Return Description
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            return myDescription;
        }
    }

    /// <summary>
    /// Partial Class for tblEDITransactionSet
    /// </summary>
    public partial class tblEDITransactionSet
    {
        /// <summary>
        /// Return TransactionSetDisplay field
        /// </summary>
        public global::System.String TransactionSetDisplay
        {
            get
            {
                return this.TransactionSetID + " (" + this.Description + ")";
            }
        }
        /// <summary>
        /// Return TransactionSetDisplay field
        /// </summary>
        public global::System.String TransactionSetDisplay2
        {
            get
            {
                return this.TransactionSetID + " (" + this.Description + ")" + " : " + (this.InOut == false ? "IN" : "OUT");
            }
        }
    }
    /// <summary>
    /// Partial Class for tblSegmentTerminator
    /// </summary>
    public partial class tblSegmentTerminator
    {
        /// <summary>
        /// Return TerminatorDisplay field
        /// </summary>
        public global::System.String TerminatorDisplay
        {
            get
            {
                return this.TerminatorCode + " (" + this.Terminator + ")";
            }
        }
    }

    /// <summary>
    /// CSV Reader Class
    /// </summary>
    public sealed class CsvReader : System.IDisposable
    {
        /// <summary>
        /// Read CSV from file directory
        /// </summary>
        /// <param name="fileName"></param>
        public CsvReader(string fileName)
            : this(new FileStream(fileName, FileMode.Open, FileAccess.Read))
        {
        }

        /// <summary>
        /// Read CSV from stream
        /// </summary>
        /// <param name="stream"></param>
        public CsvReader(Stream stream)
        {
            __reader = new StreamReader(stream);
        }

        /// <summary>
        /// Read CSV lines into RowEnumerator
        /// </summary>
        public System.Collections.IEnumerable RowEnumerator
        {
            get
            {
                if (null == __reader)
                    throw new System.ApplicationException("Failed to load CSV data.");

                __rowno = 0;
                string sLine;
                string sNextLine;

                while (null != (sLine = __reader.ReadLine()))
                {
                    while (rexRunOnLine.IsMatch(sLine) && null != (sNextLine = __reader.ReadLine()))
                        sLine += "\n" + sNextLine;

                    __rowno++;
                    string[] values = rexCsvSplitter.Split(sLine);

                    for (int i = 0; i < values.Length; i++)
                        values[i] = Csv.Unescape(values[i]);

                    yield return values;
                }

                __reader.Close();
            }
        }

        /// <summary>
        /// Get RowIndex
        /// </summary>
        public long RowIndex { get { return __rowno; } }

        /// <summary>
        /// Dispose CSV reader
        /// </summary>
        public void Dispose()
        {
            if (null != __reader) __reader.Dispose();
        }

        //============================================

        private long __rowno = 0;
        private TextReader __reader;
        private static Regex rexCsvSplitter = new Regex(@",(?=(?:[^""]*""[^""]*"")*(?![^""]*""))");
        private static Regex rexRunOnLine = new Regex(@"^[^""]*(?:""[^""]*""[^""]*)*""[^""]*$");
    }

    /// <summary>
    /// CSV String Converter Class
    /// </summary>
    public static class Csv
    {
        public static string Escape(string s)
        {
            if (s.Contains(QUOTE))
                s = s.Replace(QUOTE, ESCAPED_QUOTE);

            if (s.IndexOfAny(CHARACTERS_THAT_MUST_BE_QUOTED) > -1)
                s = QUOTE + s + QUOTE;

            return s;
        }

        public static string Unescape(string s)
        {
            if (s.StartsWith(QUOTE) && s.EndsWith(QUOTE))
            {
                s = s.Substring(1, s.Length - 2);

                if (s.Contains(ESCAPED_QUOTE))
                    s = s.Replace(ESCAPED_QUOTE, QUOTE);
            }

            return s;
        }


        private const string QUOTE = "\"";
        private const string ESCAPED_QUOTE = "\"\"";
        private static char[] CHARACTERS_THAT_MUST_BE_QUOTED = { ',', '"', '\n' };
    }
}
