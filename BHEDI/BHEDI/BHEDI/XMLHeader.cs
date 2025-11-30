using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BHEDI
{
    public class XMLHeader
    {
        // define properties
        private string strFileName;
        private string strTSet;
        private string strTSetControlNum;
        private string strSenderID;
        private string strSenderQual;
        private string strReceiverID;
        private string strRereiverQual;
        private string strAppSenderID;
        private string strAppReceiverID;
        private string strRawData;
        private DateTime dtTransaction;
        private int intRawDataNo;

        // define method
        public XMLHeader()
        {
            strSenderID = "";
            strSenderQual = "";
            strReceiverID = "";
            strRereiverQual = "";
            strTSet = "";
            strAppSenderID = "";
            strAppReceiverID = "";
            strFileName = "";
            strRawData = "";
            intRawDataNo = -1;
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

        public string getFileName()
        {
            return strFileName;
        }

        public void setFileName(string str)
        {
            strFileName = str;
        }
        public string getTSetControlNum()
        {
            return strTSetControlNum;
        }

        public void setTSetControlNum(string str)
        {
            strTSetControlNum = str;
        }
        public string getRawData()
        {
            return strRawData;
        }

        public void setRawData(string str)
        {
            strRawData = str;
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
    }
}
