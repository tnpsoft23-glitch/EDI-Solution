using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BHEDI
{
    public class InboundMapping
    {
 
        // define properties 
        private string strSegmentName;
        public string SegmentName
        {
            get
            {
                return strSegmentName;
            }
            set
            {
                strSegmentName = value;
            }
        }

        private int intPostion;
        public int Postion
        {
            get
            {
                return intPostion;
            }
            set
            {
                intPostion = value;
            }
        }

        private string strTableName;
        public string TableName
        {
            get
            {
                return strTableName;
            }
            set
            {
                strTableName = value;
            }
        }

        private string strFieldName;
        public string FieldName
        {
            get
            {
                return strFieldName;
            }
            set
            {
                strFieldName = value;
            }
        }

        private List<MappingOperator> arrOperator;
        public List<MappingOperator> Operator
        {
            get
            {
                return arrOperator;
            }
            set
            {
                arrOperator = value;
            }
        }

        private bool blnCommit;
        public bool CommitDB
        {
            get
            {
                return blnCommit;
            }
            set
            {
                blnCommit = value;
            }
        }

        private bool blnInsert;
        public bool InsertDB
        {
            get
            {
                return blnInsert;
            }
            set
            {
                blnInsert = value;
            }
        }

        // 5/10/2019 Phuong addded VDA
        private string strNote;
        public string Note
        {
            get
            {
                return strNote;
            }
            set
            {
                strNote = value;
            }
        }

    }
}
