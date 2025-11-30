using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Collections;
using System.Data.Objects;
using CrystalDecisions.CrystalReports.Engine;
using BHEDI.Report;

namespace BHEDI
{
    public partial class frmLogJob : Form
    {
        BHEDI_EDM edm;

        public frmLogJob()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Load form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmLogJob_Load(object sender, EventArgs e)
        {
            // load data
            loadDataCombo();
        }

        private void loadDataCombo()
        {
            try
            {
                ////Bind Data
                edm = new BHEDI_EDM();

                //Direction combobox
                ArrayList aryDirectionType = new ArrayList();
                aryDirectionType.Add(new myCombobxItem("All", Common.DIRECTION_TYPE.ALL));
                aryDirectionType.Add(new myCombobxItem("In", Common.DIRECTION_TYPE.IN));
                aryDirectionType.Add(new myCombobxItem("Out", Common.DIRECTION_TYPE.OUT));
                cboDirection.DataSource = aryDirectionType;
                cboDirection.DisplayMember = "Description";
                cboDirection.ValueMember = "Value";

                //Trading Partner combobox
                cboTradingPartner.DataSource = edm.tblTradingPartners.ToList();
                cboTradingPartner.DisplayMember = "TradingPartnerName";
                cboTradingPartner.ValueMember = "TradingPartnerNo";

                //Transaction Set combobox
                cboTransactionSet.DataSource = edm.tblEDITransactionSets.ToList();

                cboTransactionSet.ValueMember = "TransactionSetNo";
                cboTransactionSet.DisplayMember = "TransactionSetDisplay";

                dtpDateFrom.Value = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                dtpDateTo.Value = DateTime.Now;
                cboTradingPartner.SelectedItem = null;
                cboTransactionSet.SelectedItem = null;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        
        
        /// <summary>
        /// Preview report 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnPreview_Click(object sender, EventArgs e)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                rptLogJob rpt = new rptLogJob();
                
                rpt = (rptLogJob)(Common.SetDBNameForRptAtRunning(rpt));

                if (rpt != null)
                {
                    //Set Date Range
                    rpt.SetParameterValue("LogDate_F", dtpDateFrom.Text);
                    rpt.SetParameterValue("LogDate_T", dtpDateTo.Text);

                    //Set Trading Partner
                    if (Common.myCInt(cboTradingPartner.SelectedValue) != 0)
                    {
                        rpt.SetParameterValue("TradingPartnerNO", cboTradingPartner.SelectedValue);
                    }
                    else
                    {
                        rpt.ParameterFields["TradingPartnerNO"].CurrentValues.IsNoValue = true;
                    }

                    //Set Transaction Set
                    if (Common.myCInt(cboTransactionSet.SelectedValue) != 0)
                    {
                        rpt.SetParameterValue("TransactionSetNO", cboTransactionSet.SelectedValue);
                    }
                    else
                    {
                        rpt.ParameterFields["TransactionSetNO"].CurrentValues.IsNoValue = true;
                    }

                    rpt.SetParameterValue("Direction", cboDirection.Text);

                    crvLogJob.ReportSource = rpt;
                    crvLogJob.Refresh();             
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
