using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BHEDI
{
    /// <summary>
    /// Outbound XML Data
    /// </summary>
    public class XMLNode
    {
        private string strNodeName;
        public string NodeName
        {
            get
            {
                return strNodeName;
            }
            set
            {
                strNodeName = value;
            }
        }
        private string strNodeValue;
        public string NodeValue
        {
            get
            {
                return strNodeValue;
            }
            set
            {
                strNodeValue = value;
            }
        }
    }
}
