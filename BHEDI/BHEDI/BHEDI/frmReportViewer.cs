using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using CrystalDecisions.CrystalReports.Engine;
using BHEDI.Report;

namespace BHEDI
{
    /// <summary>
    /// Report Viewer
    /// </summary>
    public partial class frmReportViewer : Form
    {
        ReportDocument rptDoc;

        public frmReportViewer(ReportDocument rpt)
        {
            InitializeComponent();

            rptDoc = rpt;
        }

        private void frmReportViewer_Load(object sender, EventArgs e)
        {
            SetUpReport();
        }

        /// <summary>
        /// Set up report
        /// </summary>
        private void SetUpReport()
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                rptDoc = Common.SetDBNameForRptAtRunning(rptDoc);

                if (rptDoc != null)
                {
                    crvViewer.ReportSource = rptDoc;
                    crvViewer.Refresh();
                }
            }
            catch (DataSourceException exCR1)
            {
                Common.writeLog(-1, -1, exCR1.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(exCR1.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (ParameterFieldException exCR2)
            {
                Common.writeLog(-1, -1, exCR2.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(exCR2.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                Cursor.Current = Cursors.Default;
            }
        }
    }
}
