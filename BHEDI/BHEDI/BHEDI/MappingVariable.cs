using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BHEDI
{
    public class MappingVariable
    {
        private string strVariableName;
        public string VariableName
        {
            get
            {
                return strVariableName;
            }
            set
            {
                strVariableName = value;
            }
        }
        private string strVariableValue;
        public string VariableValue
        {
            get
            {
                return strVariableValue;
            }
            set
            {
                strVariableValue = value;
            }
        }
    }
}
