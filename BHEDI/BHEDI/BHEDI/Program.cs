using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace BHEDI
{
    static class Program
    {
        /// <summary>
        /// BHEDI EDI Mapping and Translator Tool
        /// </summary>
        [STAThread]
        static void Main()
        {
            // run as command line
            String[] arguments = Environment.GetCommandLineArgs();

            if (arguments.Length != 2) // run as gui
            {

                Application.EnableVisualStyles();
                Application.SetCompatibleTextRenderingDefault(false);
                Application.Run(new frmMain());
            }
            else // run as command
            {
                InOutProcess edi = new InOutProcess();
                Common.initStaticVariables();

                if (arguments[1].ToLower().Equals("in"))
                    edi.processIncommingData(); // run job in
                else if (arguments[1].ToLower().Equals("out"))
                    edi.processOutgoingData();  // run job out
            }
        }
    }
}
