using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BHEDI
{
    public class MappingOperator
    {
        private string strOperatorName;
        public string OperatorName
        {
            get
            {
                return strOperatorName;
            }
            set
            {
                strOperatorName = value;
            }
        }
        private string strOperatorParameter;
        public string OperatorParameter
        {
            get
            {
                return strOperatorParameter;
            }
            set
            {
                strOperatorParameter = value;
            }
        }
    }
}
