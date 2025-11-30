using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Collections;


namespace BHEDI
{
    /// <summary>
    /// Map EDI data to application data
    /// </summary>
    public partial class frmImport820ToSimply : Form
    {
        /// <summary>
        /// show process status
        /// </summary>
        private frmProcessDialog frmProcess;
        /// <summary>
        /// Local variable
        /// </summary>
        private int intTradingNo;
        private int intTransNo = 3;

        private List<Common.EDI_820> lstHdrKey = new List<Common.EDI_820>();
        private string strSimplyFile = "";
        private string strCheckingAccount = "";
        private string strReceivableAccount = "";

        /// <summary>
        /// Init
        /// </summary>
        public frmImport820ToSimply()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Close
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        /// <summary>
        /// Load combo data
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmImport820ToSimply_Load(object sender, EventArgs e)
        {
            try
            {
                // set date default
                dtpDateFrom.Value = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                dtpDateTo.Value = DateTime.Now;

                ////Bind Data
                using (var edm = new BHEDI_EDM())
                {

                    //Trading Partner combobox
                    cboTradingPartner.DataSource = edm.tblTradingPartners.ToList();
                    cboTradingPartner.DisplayMember = "TradingPartnerName";
                    cboTradingPartner.ValueMember = "TradingPartnerNo";

                }

                // load default
                loadData(true);
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Load EDI transaction data
        /// </summary>
        /// <param name="isDefault">true if loading by default filter; otherwise, false </param>
        private void loadData(bool blnDefault)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                ////Set Date
                DateTime dtDateFrom = dtpDateFrom.Value.Date;
                DateTime dtDateTo = dtpDateTo.Value.Date.AddDays(1);


                using (var edm = new BHEDI_EDM())
                {

                    
                    //Set Query
                    var query = (from tr in edm.tblEDI_820_HEADER
                                join tp in edm.tblTradingPartners on tr.ISASenderID equals tp.InterchangeSenderID
                                where tr.SubmitDateTime >= dtDateFrom && tr.SubmitDateTime < dtDateTo && tr.blnRepFlag == false && tr.GSReceiverID == tp.InterchangeReceiverID
                                select new
                                {
                                    tr.HdrKey,
                                    tp.TradingPartnerName,
                                    tr.TotalPaymentAmount,
                                    tr.RemittanceDate,
                                    tr.SubmitDateTime,
                                    tp.TradingPartnerNo,
                                    ImportStatus = tr.blnImportSimply
                                });

                    if (!blnDefault)
                    {

                        if (Common.myCInt(cboTradingPartner.SelectedValue) != 0)
                        {
                            int trading_partner = Common.myCInt(cboTradingPartner.SelectedValue);
                            query = query.Where(ts => ts.TradingPartnerNo == trading_partner).OrderByDescending(ts => ts.SubmitDateTime);
                        }

 
                    }
                    //Set DataGridView
                    bdsEDIData.DataSource = query.OrderByDescending(ts => ts.SubmitDateTime).ToList();
                    
                }
                
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

        /// <summary>
        /// Search data
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSearch_Click(object sender, EventArgs e)
        {
            loadData(false);
        }

        /// <summary>
        /// Map EDI data to application data
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnMap_Click(object sender, EventArgs e)
        {
            intTradingNo = Common.myCInt(cboTradingPartner.SelectedValue);

            if (MessageBox.Show("Do you want to import selected data to Simply Accouting ?", Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.No)
                return;

            try
            {
                // check error
                using (var edm = new BHEDI_EDM())
                {
                    var objTbl = edm.tblInboundOutboundSettings.Where(s => s.SettingName.Equals(Common.CONFIG_SIMPLY_FILE));
                    foreach (var objRow in objTbl)
                    {
                        strSimplyFile = objRow.Path;
                    }
                    if (strSimplyFile.Equals(""))
                    {
                        MessageBox.Show("Simply Accounting path file is not configured yet.", Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        return;
                    }

                    // check file is exits
                    if (!File.Exists(strSimplyFile))
                    {
                        MessageBox.Show(strSimplyFile + " is not exist.", Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        return;
                    }

                    var objTbl1 = edm.tblInboundOutboundSettings.Where(s => s.SettingName.Equals(Common.CONFIG_SIMPLY_CHECKING_ACCOUNT));
                    foreach (var objRow in objTbl1)
                    {
                        strCheckingAccount = objRow.Path;
                    }

                    var objTbl2 = edm.tblInboundOutboundSettings.Where(s => s.SettingName.Equals(Common.CONFIG_SIMPLY_RECEIVABLE_ACCOUNT));
                    foreach (var objRow in objTbl2)
                    {
                        strReceivableAccount = objRow.Path;
                    }

                    if (strCheckingAccount.Equals(""))
                        strCheckingAccount = Common.DEFAULT_SIMPLY_CHECKING_ACCOUNT;

                    if (strReceivableAccount.Equals(""))
                        strReceivableAccount = Common.DEFAULT_SIMPLY_RECEIVALE_ACCOUNT;

                }

                // clear array Hdrkey
                lstHdrKey.Clear();

                // get hdrkey
                foreach (DataGridViewRow row in dgvEDIData.Rows)
                {
                    if (Common.myCBool(row.Cells["colSelect"].Value) == true)
                    {
                        Common.EDI_820 edi_820 = new Common.EDI_820();
                        edi_820.HdrKey = Common.myCStr(row.Cells["colHdrKey"].Value);
                        edi_820.Amount = (decimal)Common.myCDbl(row.Cells["colAmount"].Value);
                        lstHdrKey.Add(edi_820);

                    }
                }

                if (lstHdrKey.Count == 0)
                {
                    MessageBox.Show("Please select data for import.", Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    return;
                }


                // show waiting dialog and run import
                if (backgroundWorker1.IsBusy != true)
                {
                    // create a new instance of the alert form
                    frmProcess = new frmProcessDialog();
                    // event handler for the Cancel button in AlertForm
                    frmProcess.Canceled += new EventHandler<EventArgs>(buttonCancel_Click);
                    //frmProcess.StartPosition = FormStartPosition.Manual;
                    //frmProcess.Location = new Point((this.ClientSize.Width - frmProcess.Width) / 2, (this.ClientSize.Height - frmProcess.Height) / 2);
                    frmProcess.Show();
                    // Start the asynchronous operation.
                    backgroundWorker1.RunWorkerAsync();
                }


            }
            catch (Exception ex)
            {
                Common.writeLog(intTradingNo, intTransNo, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        /// <summary>
        /// Start import data from another thread
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void backgroundWorker1_DoWork(object sender, DoWorkEventArgs e)
        {
            Common.writeLog(intTradingNo, intTransNo, "Start import 820 to Simply Accounting", (int)Common.LOG_TYPE.JOB);

            
            BackgroundWorker worker = sender as BackgroundWorker;

            // back up simly accounting file
            int intProcessNextValue = 100 / (lstHdrKey.Count + 1);
            Common.writeLog(intTradingNo, intTransNo, "Backup Simply Accouting File: " + strSimplyFile, (int)Common.LOG_TYPE.JOB);
            int i = 1;
            

            if (!Common.backupSimplyAccountingFile(strSimplyFile))
            {
                if (MessageBox.Show("Backup Simply Accounting is failed. Do you want to continue ?", Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.No)
                {
                    e.Cancel = true;
                    return;
                }
            }

            worker.ReportProgress(i * intProcessNextValue);

            // import data to Simply
            using (var sp = new BHEDI_SPTableAdapters.QueriesTableAdapter())
            {
                // set command time out
                sp.SetCommandTimeout(0);

                decimal totalPaymentAmount = 0;

                foreach (Common.EDI_820 hdrKey in lstHdrKey)
                {
                    i++;
                    if (worker.CancellationPending == true)
                    {
                        e.Cancel = true;
                        break;
                    }
                    else
                    {
                        totalPaymentAmount += hdrKey.Amount;

                        Common.writeLog(intTradingNo, intTransNo, "Import for " + hdrKey.HdrKey, (int)Common.LOG_TYPE.JOB);
                        // import data from SP without update checking amount
                        sp.EDI_Import_Payment_Simply(hdrKey.HdrKey, "", Common.myCInt(strCheckingAccount), Common.myCInt(strReceivableAccount),false);
                        worker.ReportProgress(i * intProcessNextValue);
                    }
                }
                Common.writeLog(intTradingNo, intTransNo, "Update " + totalPaymentAmount + " to Checking and Receivable Account", (int)Common.LOG_TYPE.JOB);
                // finally update total payment amount to Checking account and Receivable account
                sp.EDI_Import_Payment_Simply_Update_Checking_Amount(totalPaymentAmount, Common.myCInt(strCheckingAccount), Common.myCInt(strReceivableAccount));
            }

            Common.writeLog(intTradingNo, intTransNo, "End import 820 to Simply Accounting", (int)Common.LOG_TYPE.JOB);

        }

        /// <summary>
        /// Update progress bar 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void backgroundWorker1_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            // Pass the progress to AlertForm label and progressbar
            frmProcess.Message = "In progress, please wait... " + e.ProgressPercentage.ToString() + "%";
            frmProcess.ProgressValue = e.ProgressPercentage;
        }

        /// <summary>
        /// Close waiting dialog when done
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void backgroundWorker1_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            frmProcess.Close();
            loadData(false);
            MessageBox.Show("Import to Simply Accounting is completed. Please check the log for errors.", Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Information);

        }
        /// <summary>
        /// This event handler cancels the backgroundworker, fired from Cancel button in frmProcessDialog.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonCancel_Click(object sender, EventArgs e)
        {
            if (backgroundWorker1.WorkerSupportsCancellation == true)
            {
                // Cancel the asynchronous operation.
                backgroundWorker1.CancelAsync();
                // Close the AlertForm
                frmProcess.Close();
            }
        }

    }
}
