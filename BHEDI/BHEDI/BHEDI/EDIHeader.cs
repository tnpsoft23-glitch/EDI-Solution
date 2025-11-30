using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BHEDI
{
    public class EDIHeader
    {
        /// <summary>
        ///  define property
        /// </summary>
        private string strSenderID;
        private string strSenderQual;
        private string strReceiverID;
        private string strRereiverQual;
        private string strTSet;
        private string strAuthorQual;
        private string strAuthor;
        private string strSecurityQual;
        private string strSecurity;
        private string strVersion;
        private string strControlVersion;
        private string strElementSeparator;
        private string strSubElementSeparator;
        private string strDataElementSeparator;
        private string strRepetionSeparator;
        private string strAppSenderID;
        private string strAppReceiverID;
        private string strTSetControlNum;
        private string strFileName;
        private string strAgencyCode;
        private string strRawData;
        private int intGenerateFA;
        private DateTime dtTransaction;
        private int intRawDataNo;
        private string strGroupControlNum;
        private string strInterchangeNum;
        private bool isX12Format;
        // 05/09/2019 Phuong added for VDA
        private bool isVDAFormat;
        

        public EDIHeader()
        {
            strSenderID = "";
            strSenderQual = "";
            strReceiverID = "";
            strRereiverQual = "";
            strTSet = "";
            strAuthorQual = "";
            strAuthor = "";
            strSecurityQual = "";
            strSecurity = "";
            strVersion = "";
            strControlVersion = "";
            strElementSeparator = "";
            strSubElementSeparator = "";
            strDataElementSeparator = "";
            strRepetionSeparator = "";
            strAppSenderID = "";
            strAppReceiverID = "";
            strTSetControlNum = "";
            strFileName = "";
            strAgencyCode = "";
            strRawData = "";
            intGenerateFA = 0;
            dtTransaction = DateTime.Now;
            intRawDataNo = -1;
            strGroupControlNum = "";
            strInterchangeNum = "";
            isX12Format = true;
            isVDAFormat = false;
        }

        // define method
        public string getSenderID()
        {
            return strSenderID;
        }

        public void setSenderID(string str)
        {
            strSenderID = str;
        }

        public string getSenderQual()
        {
            return strSenderQual;
        }

        public void setSenderQual(string str)
        {
            strSenderQual = str;
        }

        public string getReceiverID()
        {
            return strReceiverID;
        }

        public void setReceiverID(string str)
        {
            strReceiverID = str;
        }

        public string getRereiverQual()
        {
            return strRereiverQual;
        }

        public void setRereiverQual(string str)
        {
            strRereiverQual = str;
        }

        public string getTSet()
        {
            return strTSet;
        }

        public void setTSet(string str)
        {
            strTSet = str;
        }

        public string getAuthorQual()
        {
            return strAuthorQual;
        }

        public void setAuthorQual(string str)
        {
            strAuthorQual = str;
        }

        public string getAuthor()
        {
            return strAuthor;
        }

        public void setAuthor(string str)
        {
            strAuthor = str;
        }

        public string getSecurityQual()
        {
            return strSecurityQual;
        }

        public void setSecurityQual(string str)
        {
            strSecurityQual = str;
        }

        public string getSecurity()
        {
            return strSecurity;
        }

        public void setSecurity(string str)
        {
            strSecurity = str;
        }

        public string getVersion()
        {
            return strVersion;
        }

        public void setVersion(string str)
        {
            strVersion = str;
        }

        public string getControlVersion()
        {
            return strControlVersion;
        }

        public void setControlVersion(string str)
        {
            strControlVersion = str;
        }

        public string getElementSeparator()
        {
            return strElementSeparator;
        }

        public void setElementSeparator(string str)
        {
            strElementSeparator = str;
        }
        public string getDataElementSeparator()
        {
            return strDataElementSeparator;
        }

        public void setDataElementSeparator(string str)
        {
            strDataElementSeparator = str;
        }
        public string getRepetionSeparator()
        {
            return strRepetionSeparator;
        }

        public void setRepetionSeparator(string str)
        {
            strRepetionSeparator = str;
        }
        public string getSubElementSeparator()
        {
            return strSubElementSeparator;
        }

        public void setSubElementSeparator(string str)
        {
            strSubElementSeparator = str;
        }

        public string getAppSenderID()
        {
            return strAppSenderID;
        }

        public void setAppSenderID(string str)
        {
            strAppSenderID = str;
        }

        public string getAppReceiverID()
        {
            return strAppReceiverID;
        }

        public void setAppReceiverID(string str)
        {
            strAppReceiverID = str;
        }

        public string getTSetControlNum()
        {
            return strTSetControlNum;
        }

        public void setTSetControlNum(string str)
        {
            strTSetControlNum = str;
        }
        public string getFileName()
        {
            return strFileName;
        }

        public void setFileName(string str)
        {
            strFileName = str;
        }

        public string getAgencyCode()
        {
            return strAgencyCode;
        }

        public void setAgencyCode(string str)
        {
            strAgencyCode = str;
        }
        public string getRawData()
        {
            return strRawData;
        }

        public void setRawData(string str)
        {
            strRawData = str;
        }
        public int getGenerateFA()
        {
            return intGenerateFA;
        }
        public void setGenerateFA(int intFA)
        {
            intGenerateFA = intFA;
        }
        public DateTime getTransactionDateTime()
        {
            return dtTransaction;
        }
        public void setTransactionDateTime(DateTime dt)
        {
            dtTransaction = dt;
        }
        public int getRawDataNo()
        {
            return intRawDataNo;
        }
        public void setRawDataNo(int intNo)
        {
            intRawDataNo = intNo;
        }
        public string getGroupControlNum()
        {
            return strGroupControlNum;
        }

        public void setGroupControlNum(string str)
        {
            strGroupControlNum = str;
        }
        public string getInterchangeNum()
        {
            return strInterchangeNum;
        }

        public void setInterchangeNum(string str)
        {
            strInterchangeNum = str;
        }
        public bool checkIsX12Format()
        {
            return isX12Format;
        }

        public void setIsX12Format(bool bln)
        {
            isX12Format = bln;
        }

        // 5/9/2019 Phuong added VDA format
        public bool checkIsVDAFormat()
        {
            return isVDAFormat;
        }

        public void setIsVDAFormat(bool bln)
        {
            isVDAFormat = bln;
        }
    }
}
