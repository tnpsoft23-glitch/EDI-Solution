using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace BHEDI
{
    /// <summary>
    /// Map EDI data to application data
    /// </summary>
    public partial class frmMapEDIData : Form
    {
        public frmMapEDIData()
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
        private void frmMapEDIData_Load(object sender, EventArgs e)
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

                    //Transaction Set combobox
                    cboTransactionSet.DataSource = edm.tblEDITransactionSets.Where(s => s.InOut == false).ToList();
                    cboTransactionSet.ValueMember = "TransactionSetNo";
                    cboTransactionSet.DisplayMember = "TransactionSetDisplay";
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
                    var query = (from tr in edm.tblEDITrasactionRawDatas
                                 join tp in edm.tblTradingPartners on tr.TradingPartnerNo_FK equals tp.TradingPartnerNo
                                 join ts in edm.tblEDITransactionSets on tr.TransactionSetNo_FK equals ts.TransactionSetNo
                                 where ts.InOut == false && tr.TransactionDate >= dtDateFrom && tr.TransactionDate < dtDateTo
                                 select new
                                 {
                                     TransactionRawDataNo = tr.TransactionRawDataNo,
                                     TradingPartnerNo = tp.TradingPartnerNo,
                                     TradingPartnerName = tp.TradingPartnerName,
                                     TransactionSetNo = ts.TransactionSetNo,
                                     TransactionSetID = ts.TransactionSetID,
                                     TransactionDate = tr.TransactionDate,
                                     TransactionKey = tr.TransactionKey,
                                     RawData = tr.RawData,
                                     XMLData = tr.XMLData,
                                     InterchangeSenderIDQual = tp.InterchangeSenderIDQual,
                                     InterchangeSenderID = tp.InterchangeSenderID,
                                     InterchangeReceiverIDQual = tp.InterchangeReceiverIDQual,
                                     InterchangeReceiverID = tp.InterchangeReceiverID,
                                     ApplicationSenderCode = tp.ApplicationSenderCode,
                                     ApplicationReceiverCode = tp.ApplicationReceiverCode,
                                     SegmentTerminator = tp.SegmentTerminator,
                                     ElementTerminator = tp.DataElementDelimiter 
                                 });

                    if (!blnDefault)
                    {

                        if (Common.myCInt(cboTradingPartner.SelectedValue) != 0)
                        {
                            int trading_partner = Common.myCInt(cboTradingPartner.SelectedValue);
                            query = query.Where(ts => ts.TradingPartnerNo == trading_partner);
                        }

                        //Set Transaction Set
                        if (Common.myCInt(cboTransactionSet.SelectedValue) != 0)
                        {
                            int transaction_set = Common.myCInt(cboTransactionSet.SelectedValue);
                            query = query.Where(ts => ts.TransactionSetNo == transaction_set);
                        }

                    }
                    //Set DataGridView
                    bdsEDIData.DataSource = query.ToList();
                    
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
            if (MessageBox.Show("Do you want to map selected data ?", Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.No)
                return;
            
            try
            {
                Cursor.Current = Cursors.WaitCursor;
                EDITranslator edi = new EDITranslator();
                bool isSent = false;

                foreach (DataGridViewRow row in dgvEDIData.Rows)
                {
                    if (Common.myCBool(row.Cells["colSelect"].Value) == true)
                    {
                        EDIHeader header = new EDIHeader();
                        header.setTSet(Common.myCStr(row.Cells["colTSet"].Value));
                        header.setAppSenderID(Common.myCStr(row.Cells["colAppSenderID"].Value));
                        header.setAppReceiverID(Common.myCStr(row.Cells["colAppReceiverID"].Value));
                        header.setSenderID(Common.myCStr(row.Cells["colSenderID"].Value));
                        header.setSenderQual(Common.myCStr(row.Cells["colSenderQual"].Value));
                        header.setReceiverID(Common.myCStr(row.Cells["colReceiverID"].Value));
                        header.setRereiverQual(Common.myCStr(row.Cells["colReceiverQual"].Value));
                        header.setRawData(Common.myCStr(row.Cells["colRawData"].Value));
                        header.setRawDataNo(Common.myCInt(row.Cells["colTransactionRawDataNo"].Value));
                        edi.mapEDIDataToApplicationData(header);
                        isSent = true;
                    }
                }

                if (isSent)
                    MessageBox.Show("Data mapping is completed. Please check the log for errors.", Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Information);
                else
                    MessageBox.Show("Please select data for mapping.", Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

 
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
