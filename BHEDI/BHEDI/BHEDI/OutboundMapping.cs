using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BHEDI
{
    /// <summary>
    /// Define Outbound mapping setting
    /// </summary>
    public class OutboundMapping : IComparable<OutboundMapping>
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

        private string strXMLPath;
        public string XMLPath
        {
            get
            {
                return strXMLPath;
            }
            set
            {
                strXMLPath = value;
            }
        }

        private string strValue;
        public string Value
        {
            get
            {
                return strValue;
            }
            set
            {
                strValue = value;
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

        private string strOutPutFile;
        public string OutPutFile
        {
            get
            {
                return strOutPutFile;
            }
            set
            {
                strOutPutFile = value;
            }
        }

        private int intOutboundMappingNo;
        public int OutboundMappingNo
        {
            get
            {
                return intOutboundMappingNo;
            }
            set
            {
                intOutboundMappingNo = value;
            }
        }

        private int intSegmentNumber;
        public int SegmentNumber
        {
            get
            {
                return intSegmentNumber;
            }
            set
            {
                intSegmentNumber = value;
            }
        }

        // 5/14/2019 Phuong addded VDA
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

        /// <summary>
        /// Default sort 
        /// </summary>
        /// <param name="comparePart"></param>
        /// <returns></returns>
        public int CompareTo(OutboundMapping comparePart)
        {
            // A null value means that this object is greater. 
            if (comparePart == null)
                return 1;

            else
                return this.Postion.CompareTo(comparePart.Postion);
        }
    }
}
