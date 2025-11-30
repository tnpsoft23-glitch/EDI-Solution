using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Collections;

namespace BHEDI
{
    /// <summary>
    /// EDI Data View
    /// </summary>
    public partial class frmViewEDI : Form
    {
        BHEDI_EDM edm;

        public frmViewEDI()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Form closing
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmViewEDI_FormClosing(object sender, FormClosingEventArgs e)
        {
            try
            {
                if (btnSave.Enabled == true)
                {
                    if (saveData(true) == false)
                    {
                        e.Cancel = true;
                    }
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Load form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmViewEDI_Load(object sender, EventArgs e)
        {
            btnSave.Enabled = false;

            // load data
            loadDataCombo();
            loadData(true);
            toggleControl(false);

            colTradingPartnerNo.DataPropertyName = "TradingPartnerNo";
            colTransactionSetNo.DataPropertyName = "TransactionSetNo";
            colTransactionRawDataNo.DataPropertyName = "TransactionRawDataNo";
            colTradingPartner.DataPropertyName = "TradingPartnerName";
            colTransactionSetID.DataPropertyName = "TransactionSetID";
            colInOutDisplay.DataPropertyName = "InOutDisplay";
            colTransactionDate.DataPropertyName = "TransactionDate";
            colTransactionKey.DataPropertyName = "TransactionKey";
            colSegmentTerminator.DataPropertyName = "SegmentTerminator";
            colTerminator.DataPropertyName = "Terminator";
            colRawData.DataPropertyName = "RawData";
            colXMLData.DataPropertyName = "XMLData";
            colInterchangeSenderIDQual.DataPropertyName = "InterchangeSenderIDQual";
            colInterchangeSenderID.DataPropertyName = "InterchangeSenderID";
            colInterchangeReceiverIDQual.DataPropertyName = "InterchangeReceiverIDQual";
            colInterchangeReceiverID.DataPropertyName = "InterchangeReceiverID";
            colApplicationSenderCode.DataPropertyName = "ApplicationSenderCode";
            colApplicationReceiverCode.DataPropertyName = "ApplicationReceiverCode";
            colInterchangeControlNum.DataPropertyName = "InterchangeControlNum";
            colGroupControlNum.DataPropertyName = "GroupControlNum";
        }

        /// <summary>
        /// Format raw data with terminator
        /// </summary>
        /// <param name="SegmentTerminatorNo">the segment terminator for the raw data</param>
        /// <param name="rawData">the raw data</param>
        /// <returns>formmated raw data with segment terminator</returns>
        private string formatRawData(int SegmentTerminatorNo, string rawData)
        {
            try
            {
                String strRawData = "";

                if (Common.myCInt(SegmentTerminatorNo) != 0)
                {
                    tblSegmentTerminator segTerm = edm.tblSegmentTerminators.Where(st => st.SegmentTerminatorNo == SegmentTerminatorNo).FirstOrDefault();
                    string terminator = segTerm.Terminator;

                    strRawData = rawData.Replace(terminator, Environment.NewLine);
                }

                return strRawData;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return "";
            }
        }

        /// <summary>
        /// Load EDI transaction data
        /// </summary>
        /// <param name="isDefault">true if loading by default filter; otherwise, false </param>
        private void loadData(Boolean isDefault = false)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                //Set Query
                var query = (from tp in edm.tblTradingPartners
                             join tr in edm.tblEDITrasactionRawDatas on tp.TradingPartnerNo equals tr.TradingPartnerNo_FK
                             join ts in edm.tblEDITransactionSets on tr.TransactionSetNo_FK equals ts.TransactionSetNo
                             join st in edm.tblSegmentTerminators on tp.SegmentTerminator equals st.SegmentTerminatorNo
                             orderby tr.TransactionDate
                             select new
                             {
                                 TransactionRawDataNo = tr.TransactionRawDataNo,
                                 TradingPartnerNo = tp.TradingPartnerNo,
                                 TradingPartnerName = tp.TradingPartnerName,
                                 TransactionSetNo = ts.TransactionSetNo,
                                 TransactionSetID = ts.TransactionSetID,
                                 InOut = tr.InOut,
                                 InOutDisplay = (tr.InOut == false) ? "In" : "Out",
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
                                 InterchangeControlNum = tr.InterchangeControlNum,
                                 GroupControlNum = tr.GroupControlNum,
                                 SegmentTerminator = tp.SegmentTerminator,
                                 Terminator = st.Terminator
                             });

                ////Set Default filter
                if (isDefault == true)
                {
                    //Default - First day of month to current date
                    //dtpDateFrom.Value = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                    dtpDateFrom.Value = DateTime.Now;

                    dtpDateTo.Value = DateTime.Now;
                    cboTradingPartner.SelectedItem = null;
                    cboTransactionSet.SelectedItem = null;
                    cboDirection.SelectedValue = Common.DIRECTION_TYPE.ALL;
                    txtEDIDataContains.Text = "";
                    txtTransactionKey_F.Text = "";
                    txtTransactionKey_T.Text = "";
                    txtPartnerName.Text = "";
                }

                //Set Date
                DateTime dtDateFrom = dtpDateFrom.Value.Date;
                DateTime dtDateTo = dtpDateTo.Value.Date.AddDays(1);

                query = query.Where(tr => tr.TransactionDate >= dtDateFrom && tr.TransactionDate < dtDateTo);

                //Set Direction
                if (cboDirection.SelectedValue.Equals(Common.DIRECTION_TYPE.ALL) == false)
                {
                    Boolean direction_type;

                    if (cboDirection.SelectedValue.Equals(Common.DIRECTION_TYPE.IN))
                    {
                        direction_type = false;
                    }
                    else
                    {
                        direction_type = true;
                    }

                    query = query.Where(ts => ts.InOut == direction_type);
                }

                //Set Trading Partner
                if (Common.myCInt(cboTradingPartner.SelectedValue) != 0)
                {
                    int trading_partner = Common.myCInt(cboTradingPartner.SelectedValue);

                    query = query.Where(ts => ts.TradingPartnerNo == trading_partner);
                }
                
                // Trading Partner name
                if (!txtPartnerName.Text.Trim().Equals(""))
                {
                    query = query.Where(ts => ts.TradingPartnerName.Contains(txtPartnerName.Text.Trim()));
                }

                //Set Transaction Set
                if (Common.myCInt(cboTransactionSet.SelectedValue) != 0)
                {
                    int transaction_set = Common.myCInt(cboTransactionSet.SelectedValue);

                    query = query.Where(ts => ts.TransactionSetNo == transaction_set);
                }

                //Set EDI Data Contains field
                if (!txtEDIDataContains.Text.Trim().Equals(""))
                {
                    query = query.Where(tr => tr.RawData.Contains(txtEDIDataContains.Text.Trim()));
                }

                //Set Transaction Key Range
                if (!txtTransactionKey_F.Text.Trim().Equals(""))
                {
                    query = query.Where(tr => tr.TransactionKey.CompareTo(txtTransactionKey_F.Text) >= 0);
                }

                if (!txtTransactionKey_T.Text.Trim().Equals(""))
                {
                    query = query.Where(tr => tr.TransactionKey.CompareTo(txtTransactionKey_T.Text) <= 0);
                }

                //Set DataGridView
                var result = query.ToList().Select(r => new
                {
                    TradingPartnerNo = r.TradingPartnerNo,
                    TransactionSetNo = r.TransactionSetNo,
                    TransactionRawDataNo = r.TransactionRawDataNo,
                    TradingPartnerName = r.TradingPartnerName,
                    TransactionSetID = r.TransactionSetID,
                    InOutDisplay = r.InOutDisplay,
                    TransactionDate = r.TransactionDate,
                    TransactionKey = r.TransactionKey,
                    SegmentTerminator = r.SegmentTerminator,
                    Terminator = r.Terminator,
                    RawData = (r.RawData != "") ? ((r.Terminator.Trim() != "") ? r.RawData.Replace(r.Terminator, Environment.NewLine) : r.RawData) : "",
                    XMLData = r.XMLData,
                    InterchangeSenderIDQual = r.InterchangeSenderIDQual,
                    InterchangeSenderID = r.InterchangeSenderID,
                    InterchangeReceiverIDQual = r.InterchangeReceiverIDQual,
                    InterchangeReceiverID = r.InterchangeReceiverID,
                    ApplicationSenderCode = r.ApplicationSenderCode,
                    ApplicationReceiverCode = r.ApplicationReceiverCode,
                    InterchangeControlNum = r.InterchangeControlNum,
                    GroupControlNum = r.GroupControlNum,
                }).OrderByDescending(it => it.TransactionDate);

                if (result.Count() > 0)
                {
                    bdsEDIData.DataSource = result;
                }
                else
                {
                    dgvEDIData.Rows.Clear();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.StackTrace.ToString());
                //Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                //MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                Cursor.Current = Cursors.Default;
            }
        }
        
        /// <summary>
        /// Load datasource for combobox
        /// </summary>
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
                // 3/30/2017 Phuong changed sort by trading partner name
                cboTradingPartner.DataSource = edm.tblTradingPartners.OrderBy(my => my.TradingPartnerName).ToList();
                cboTradingPartner.DisplayMember = "TradingPartnerName";
                cboTradingPartner.ValueMember = "TradingPartnerNo";

                //Transaction Set combobox
                cboTransactionSet.DataSource = edm.tblEDITransactionSets.OrderBy(my => my.TransactionSetID).ToList();

                cboTransactionSet.ValueMember = "TransactionSetNo";
                cboTransactionSet.DisplayMember = "TransactionSetDisplay2";
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Save Data
        /// </summary>
        /// <param name="IsClosing">true if window is closing; otherwise, false</param>
        /// <returns>true if data is saved; otherwise, false</returns>
        private Boolean saveData(Boolean IsClosing = false)
        {
            Boolean IsSaved = true;

            try
            {
                DialogResult AskPrompt = MessageBox.Show("Do you want to save the changes?", Common.SYSTEM_NAME, MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);

                switch (AskPrompt)
                {

                    case System.Windows.Forms.DialogResult.Yes:
                    case System.Windows.Forms.DialogResult.OK:
                        if (dgvEDIData.CurrentRow != null)
                        {
                            DataGridViewRow curRow = dgvEDIData.CurrentRow;
                            string Terminator;
                            int TransactionRawDataNo_FK;
                   
                            TransactionRawDataNo_FK = Common.myCInt(curRow.Cells["colTransactionRawDataNo"].Value);
                            Terminator = Common.myCStr(curRow.Cells["colTerminator"].Value);

                            tblEDITrasactionRawData curRawData = edm.tblEDITrasactionRawDatas.Where(r => r.TransactionRawDataNo == TransactionRawDataNo_FK).FirstOrDefault();

                            if (curRawData != null)
                            {
                                String rawData = (Terminator.Trim() != "") ? txtEDIData.Text.Replace(Environment.NewLine, Terminator) : txtEDIData.Text;
                                String xmlData = txtXMLData.Text;

                                //Save Raw Data if different from original
                                if (rawData.Equals(curRawData.RawData) == false)
                                {
                                    curRawData.RawData = rawData;
                                }

                                //Save XML Data
                                if (xmlData.Equals(curRawData.XMLData) == false)
                                {
                                    curRawData.XMLData = xmlData;
                                }
                                
                                edm.SaveChanges();
                            }
                        }
                        IsSaved = true;
                        break;

                    case System.Windows.Forms.DialogResult.Cancel:
                        IsSaved = false;
                        break;

                    default:
                        break;
                }

                return IsSaved;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }
        
        /// <summary>
        /// Enable/disable controls based on Edit/Save action
        /// </summary>
        /// <param name="isEnabled">true to enable controls; otherwise, false</param>
        private void toggleControl(Boolean isEnabled = false)
        {
            try
            {
                txtEDIData.ReadOnly = !isEnabled;
                txtXMLData.ReadOnly = !isEnabled;

                //Always constant
                txtISA05InterchangeSenderIDQual.Enabled = false;
                txtISA06InterchangeSenderID.Enabled = false;
                txtISA07InterchangeReceiverIDQual.Enabled = false;
                txtISA08InterchangeReceiverID.Enabled = false;
                txtISA13InterchangeControlNum.Enabled = false;
                txtGS02ApplicationSenderCode.Enabled = false;
                txtGS03ApplicationReceiverCode.Enabled = false;
                txtGS06GroupControlNumber.Enabled = false;

                //Change button
                btnBackward.Enabled = !isEnabled;
                btnPrevious.Enabled = !isEnabled;
                btnNext.Enabled = !isEnabled;
                btnForward.Enabled = !isEnabled;
                btnDelete.Enabled = !isEnabled;

                //Change Datagridview
                dgvEDIData.Enabled = !isEnabled;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Undo editing
        /// </summary>
        public void undoEdit_Click()
        {
            if (tabEDIData.SelectedTab == tpgEDIData)
            {
                txtEDIData.Undo();
            }
            else
            {
                txtXMLData.Undo();
            } 
        }

        /// <summary>
        /// Redo editing
        /// </summary>
        public void redoEdit_Click()
        {
            if (tabEDIData.SelectedTab == tpgEDIData)
            {
                txtEDIData.Redo();
            }
            else
            {
                txtXMLData.Redo();
            }
        }

        /// <summary>
        /// Cut text
        /// </summary>
        public void cutEdit_Click()
        {
            if (tabEDIData.SelectedTab == tpgEDIData)
            {
                txtEDIData.Cut();
            }
            else
            {
                txtXMLData.Cut();
            }
        }

        /// <summary>
        /// Copy text
        /// </summary>
        public void copyEdit_Click()
        {
            if (tabEDIData.SelectedTab == tpgEDIData)
            {
                txtEDIData.Copy();
            }
            else
            {
                txtXMLData.Copy();
            }
        }

        /// <summary>
        /// Paste text
        /// </summary>
        public void pasteEdit_Click()
        {
            if (tabEDIData.SelectedTab == tpgEDIData)
            {
                txtEDIData.Paste();
            }
            else
            {
                txtXMLData.Paste();
            }
        }

        /// <summary>
        /// Search click action to search by filter
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                loadData();
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Clear search fields
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnClear_Click(object sender, EventArgs e)
        {
            loadData(true);
        }

        /// <summary>
        /// Click action to remap transaction
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnRemap_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Do you want to map selected data ?", Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.No)
                return;
            try
            {
                Cursor.Current = Cursors.WaitCursor;
                EDITranslator edi = new EDITranslator();
                bool isSent = false;
                string Terminator = "";
                foreach (DataGridViewRow row in dgvEDIData.Rows)
                {
                    if (Common.myCBool(row.Cells["colSelect"].Value) == true)
                    {
                        if (Common.myCStr(row.Cells["colInOutDisplay"].Value).Equals("In"))
                        {
                            EDIHeader header = new EDIHeader();
                            header.setTSet(Common.myCStr(row.Cells["colTransactionSetID"].Value));
                            header.setAppSenderID(Common.myCStr(row.Cells["colApplicationSenderCode"].Value));
                            header.setAppReceiverID(Common.myCStr(row.Cells["colApplicationReceiverCode"].Value));
                            header.setSenderID(Common.myCStr(row.Cells["colInterchangeSenderID"].Value));
                            header.setSenderQual(Common.myCStr(row.Cells["colInterchangeSenderIDQual"].Value));
                            header.setReceiverID(Common.myCStr(row.Cells["colInterchangeReceiverID"].Value));
                            header.setRereiverQual(Common.myCStr(row.Cells["colInterchangeReceiverIDQual"].Value));
                            Terminator = Common.myCStr(row.Cells["colTerminator"].Value);
                            if (txtEDIData.Text.Contains(Environment.NewLine))
                                header.setRawData(txtEDIData.Text.Replace(Environment.NewLine, Terminator));
                            else
                                header.setRawData(txtEDIData.Text.Replace("\n", Terminator));
                            bool isX12Format = true;
                            if (!txtEDIData.Text.Substring(0, 3).Equals("ISA")) // check X12 or Edifact
                                isX12Format = false;

                            header.setIsX12Format(isX12Format);

                            bool isVDAFormat = false;
                            if (!isX12Format)
                            {
                                if (!txtEDIData.Text.Substring(0, 3).Equals("UNB")) // check VDA or Edifact
                                    isVDAFormat = true;
                            }
                            header.setIsVDAFormat(isVDAFormat);

                            header.setRawDataNo(Common.myCInt(row.Cells["colTransactionRawDataNo"].Value));
                            edi.mapEDIDataToApplicationData(header);
                            isSent = true;
                        }
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

        /// <summary>
        /// Click action to resend transaction
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnResend_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Do you want to re-send selected data ?", Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.No)
                    return;
                Cursor.Current = Cursors.WaitCursor;
                EDITranslator edi = new EDITranslator();
                bool isSent = false;

                foreach (DataGridViewRow row in dgvEDIData.Rows)
                {
                    if (Common.myCBool(row.Cells["colSelect"].Value) == true)
                    {
                        if (Common.myCStr(row.Cells["colInOutDisplay"].Value).Equals("Out"))
                        {
                            XMLHeader header = new XMLHeader();
                            header.setTSet(Common.myCStr(row.Cells["colTransactionSetID"].Value));
                            header.setAppSenderID(Common.myCStr(row.Cells["colApplicationSenderCode"].Value));
                            header.setAppReceiverID(Common.myCStr(row.Cells["colApplicationReceiverCode"].Value));
                            header.setSenderID(Common.myCStr(row.Cells["colInterchangeSenderID"].Value));
                            header.setSenderQual(Common.myCStr(row.Cells["colInterchangeSenderIDQual"].Value));
                            header.setReceiverID(Common.myCStr(row.Cells["colInterchangeReceiverID"].Value));
                            header.setRereiverQual(Common.myCStr(row.Cells["colInterchangeReceiverIDQual"].Value));
                            header.setRawData(Common.myCStr(row.Cells["colXMLData"].Value));
                            header.setRawDataNo(Common.myCInt(row.Cells["colTransactionRawDataNo"].Value));
                            edi.mapXMLDataToEDIData(header);
                            isSent = true;
                        }
                    }
                }

                if (isSent)
                    MessageBox.Show("Data sending is completed. Please check the log for errors.", Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Information);
                else
                    MessageBox.Show("Please select data for sending.", Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);


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
        /// Click action to error check
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnErrorCheck_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Do you want to check selected data ?", Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.No)
                    return;
                Cursor.Current = Cursors.WaitCursor;
                EDITranslator edi = new EDITranslator();
                bool isSent = false;
                string Terminator = "";
                string strErr = "";

                foreach (DataGridViewRow row in dgvEDIData.Rows)
                {
                    if (Common.myCBool(row.Cells["colSelect"].Value) == true)
                    {
                        if (Common.myCStr(row.Cells["colInOutDisplay"].Value).Equals("In"))
                        {
                            EDIHeader header = new EDIHeader();
                            header.setTSet(Common.myCStr(row.Cells["colTransactionSetID"].Value));
                            header.setAppSenderID(Common.myCStr(row.Cells["colApplicationSenderCode"].Value));
                            header.setAppReceiverID(Common.myCStr(row.Cells["colApplicationReceiverCode"].Value));
                            header.setSenderID(Common.myCStr(row.Cells["colInterchangeSenderID"].Value));
                            header.setSenderQual(Common.myCStr(row.Cells["colInterchangeSenderIDQual"].Value));
                            header.setReceiverID(Common.myCStr(row.Cells["colInterchangeReceiverID"].Value));
                            header.setRereiverQual(Common.myCStr(row.Cells["colInterchangeReceiverIDQual"].Value));
                            Terminator = Common.myCStr(row.Cells["colTerminator"].Value);
                            if (txtEDIData.Text.Contains(Environment.NewLine))
                                header.setRawData(txtEDIData.Text.Replace(Environment.NewLine, Terminator));
                            else
                                header.setRawData(txtEDIData.Text.Replace("\n", Terminator));
                            bool isX12Format = true;
                            if (!txtEDIData.Text.Substring(0, 3).Equals("ISA")) // check X12 or Edifact
                                isX12Format = false;
                            header.setIsX12Format(isX12Format);

                            bool isVDAFormat = false;
                            if (!isX12Format)
                            {
                                if (!txtEDIData.Text.Substring(0, 3).Equals("UNB")) // check VDA or Edifact
                                    isVDAFormat = true;
                            }
                            header.setIsVDAFormat(isVDAFormat);

                            header.setRawDataNo(Common.myCInt(row.Cells["colTransactionRawDataNo"].Value));
                            strErr = edi.generalEDICheck(header);
                            isSent = true;
                        }
                    }
                }

                if (isSent)
                    MessageBox.Show("Data checking is completed. Please check the log for errors.", Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Information);
                else
                    MessageBox.Show("Please select data for checking.", Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);


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
        /// Click action to exit form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnExit_Click(object sender, EventArgs e)
        {
            try
            {
                this.Close();
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Click action to open map design
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnMapDesign_Click(object sender, EventArgs e)
        {
            try
            {
                //DataRowView curRow = (DataRowView)bdsEDIData.Current;
                DataGridViewRow curRow = dgvEDIData.CurrentRow;

                Form obj = null;

                if (curRow != null)
                {
                    int TransactionSetNo_FK, TradingPartnerNo_FK, TransactionRawDataNo_FK;
                    String InOut;

                    TransactionSetNo_FK = Common.myCInt(curRow.Cells["colTransactionSetNo"].Value);
                    TradingPartnerNo_FK = Common.myCInt(curRow.Cells["colTradingPartnerNo"].Value);
                    TransactionRawDataNo_FK = Common.myCInt(curRow.Cells["colTransactionRawDataNo"].Value);
                    InOut = Common.myCStr(curRow.Cells["colInOutDisplay"].Value);

                    // get most recent data
                    int mostTransactionRawDataNo = Common.getMostRecentData(TradingPartnerNo_FK, TransactionSetNo_FK);
                    if (mostTransactionRawDataNo != -1 && mostTransactionRawDataNo != TransactionRawDataNo_FK)
                        TransactionRawDataNo_FK = mostTransactionRawDataNo;

                    if (InOut.Equals("Out"))
                    {
                        //Open Outbound Map Design
                        obj = new frmOutboundMapDesign(TradingPartnerNo_FK, TransactionSetNo_FK, TransactionRawDataNo_FK);
                    }
                    else
                    {
                        //Open Inbound Map Design
                        obj = new frmInboundMapDesign(TradingPartnerNo_FK, TransactionSetNo_FK, TransactionRawDataNo_FK);
                    }

                    obj.StartPosition = FormStartPosition.CenterParent;
                    obj.Location = new Point((this.ClientSize.Width - obj.Width) / 2, (this.ClientSize.Height - obj.Height) / 2);

                    obj.Show();
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Click action to save data
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (saveData(false) == true)
                {
                    //Change Control Toggle
                    btnEdit.Enabled = true;
                    btnSave.Enabled = false;

                    toggleControl(false);
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Click action to delete a transaction
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult dgDeleteConfirm = MessageBox.Show("Are you sure you want to delete selected Transaction?", Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                if (dgDeleteConfirm == DialogResult.Yes)
                {
                    Cursor.Current = Cursors.WaitCursor;

                    //Delete Transaction
                    DataGridViewRow curRow = dgvEDIData.CurrentRow;

                    if (curRow != null)
                    {
                        if (Common.myCInt(curRow.Cells["colTransactionRawDataNo"].Value) != 0)
                        {
                            int rawDataNo = Common.myCInt(curRow.Cells["colTransactionRawDataNo"].Value);
                            int tranSetNo = Common.myCInt(curRow.Cells["colTransactionSetNo"].Value);
                            int tradingPartnerNo = Common.myCInt(curRow.Cells["colTradingPartnerNo"].Value);
                            tblEDITrasactionRawData curEDITransactionRawData = edm.tblEDITrasactionRawDatas.Where(tr => tr.TransactionRawDataNo == rawDataNo).FirstOrDefault();

                            //Get the most recent raw data
                            int mostTransactionRawDataNo = -1;

                            var query = edm.tblEDITrasactionRawDatas.Where(r => r.TradingPartnerNo_FK == tradingPartnerNo && r.TransactionSetNo_FK == tranSetNo && r.TransactionRawDataNo != curEDITransactionRawData.TransactionRawDataNo).OrderByDescending(t => t.TransactionDate).FirstOrDefault();

                            if (query != null)
                            {
                                mostTransactionRawDataNo = query.TransactionRawDataNo;
                            }

                            //Inbound Mapping
                            foreach (tblInboundMapping curMap in curEDITransactionRawData.tblInboundMappings.ToList())
                            {
                                //Set the value to most recent raw data
                                if (mostTransactionRawDataNo != -1 && mostTransactionRawDataNo != rawDataNo)
                                {
                                    curMap.TransactionRawDataNo_FK = mostTransactionRawDataNo;
                                }
                                else
                                {
                                    //Delete Operator
                                    foreach (tblOperatorInboundMapping curOperator in curMap.tblOperatorInboundMappings.ToList())
                                    {
                                        edm.tblOperatorInboundMappings.DeleteObject(curOperator);
                                    }

                                    edm.tblInboundMappings.DeleteObject(curMap);
                                }
                            }

                            //Outbound Mapping
                            foreach (tblOutboundMapping curMap in curEDITransactionRawData.tblOutboundMappings.ToList())
                            {
                                //Set the value to most recent raw data
                                if (mostTransactionRawDataNo != -1 && mostTransactionRawDataNo != rawDataNo)
                                {
                                    curMap.TransactionRawDataNo_FK = mostTransactionRawDataNo;
                                }
                                else
                                {
                                    //Delete Operator
                                    foreach (tblOperatorOutboundMapping curOperator in curMap.tblOperatorOutboundMappings.ToList())
                                    {
                                        edm.tblOperatorOutboundMappings.DeleteObject(curOperator);
                                    }

                                    edm.tblOutboundMappings.DeleteObject(curMap);
                                }
                            }

                            //Delete Error Log
                            foreach (tblErrorLog curErrorLog in curEDITransactionRawData.tblErrorLogs.ToList())
                            {
                                edm.tblErrorLogs.DeleteObject(curErrorLog);
                            }

                            //Delete TransactionRawData
                            edm.tblEDITrasactionRawDatas.DeleteObject(curEDITransactionRawData);
                            edm.SaveChanges();
                            bdsEDIData.RemoveCurrent();
                        }
                    }
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
        /// Click action to edit data
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                //Change Control Toggle
                btnEdit.Enabled = false;
                btnSave.Enabled = true;

                toggleControl(true);
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Click action to go to first row
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnBackward_Click(object sender, EventArgs e)
        {
            try
            {
                if (dgvEDIData.Rows.Count > 0)
                {
                    if (dgvEDIData.CurrentRow.Index < dgvEDIData.Rows.Count)
                    {
                        bdsEDIData.MoveFirst();
                    }
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Click action to go to previous row
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnPrevious_Click(object sender, EventArgs e)
        {
            try
            {
                if (dgvEDIData.Rows.Count > 0)
                {
                    if ((dgvEDIData.CurrentRow.Index - 1) >= 0)
                    {
                        bdsEDIData.MovePrevious();
                    }
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Click action to go to next row
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnNext_Click(object sender, EventArgs e)
        {
            try
            {
                if (dgvEDIData.Rows.Count > 0)
                {
                    if ((dgvEDIData.CurrentRow.Index + 1) < dgvEDIData.Rows.Count)
                    {
                        bdsEDIData.MoveNext();
                    }
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Click action to go to last row
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnForward_Click(object sender, EventArgs e)
        {
            try
            {
                if (dgvEDIData.Rows.Count > 0)
                {
                     bdsEDIData.MoveLast();
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Hide columns after data binding
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvEDIData_DataBindingComplete(object sender, DataGridViewBindingCompleteEventArgs e)
        {
            try
            {
                foreach (DataGridViewColumn col in dgvEDIData.Columns)
                {
                    switch (col.Name)
                    {

                        case "colTradingPartner":
                        case "colTransactionSetID":
                        case "colInOutDisplay":
                        case "colTransactionDate":
                        case "colTransactionKey":
                        case "colSelect":
                            break;

                        default:
                            col.Visible = false;
                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// DataGridview data error
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvEDIData_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Set Error Log based on selected data row
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvEDIData_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                txtLogs.Text = "";

                if (dgvEDIData.CurrentRow != null)
                {
                    DataGridViewRow curRow = dgvEDIData.CurrentRow;

                    int TransactionSetNo_FK, TradingPartnerNo_FK;
                    String TransactionSetID, InOut;
                    DateTime TransactionDate;

                    TransactionSetNo_FK = Common.myCInt(curRow.Cells["colTransactionSetNo"].Value);
                    TradingPartnerNo_FK = Common.myCInt(curRow.Cells["colTradingPartnerNo"].Value);
                    TransactionSetID = Common.myCStr(curRow.Cells["colTransactionSetID"].Value);
                    TransactionDate = Common.myCDate(curRow.Cells["colTransactionDate"].Value);
                    InOut = Common.myCStr(curRow.Cells["colInOutDisplay"].Value);

                    //Load Detail
                    txtEDIData.Text = Common.myCStr(curRow.Cells["colRawData"].Value);
                    txtXMLData.Text = Common.myCStr(curRow.Cells["colXMLData"].Value);
                    txtISA05InterchangeSenderIDQual.Text = Common.myCStr(curRow.Cells["colInterchangeSenderIDQual"].Value);
                    txtISA06InterchangeSenderID.Text = Common.myCStr(curRow.Cells["colInterchangeSenderID"].Value);
                    txtISA07InterchangeReceiverIDQual.Text = Common.myCStr(curRow.Cells["colInterchangeReceiverIDQual"].Value);
                    txtISA13InterchangeControlNum.Text = Common.myCStr(curRow.Cells["colInterchangeControlNum"].Value);
                    txtISA08InterchangeReceiverID.Text = Common.myCStr(curRow.Cells["colInterchangeReceiverID"].Value);
                    txtGS02ApplicationSenderCode.Text = Common.myCStr(curRow.Cells["colApplicationSenderCode"].Value);
                    txtGS03ApplicationReceiverCode.Text = Common.myCStr(curRow.Cells["colApplicationReceiverCode"].Value);
                    txtGS06GroupControlNumber.Text = Common.myCStr(curRow.Cells["colGroupControlNum"].Value);

                    //Load Error Log
                    int rawDataNo = Common.myCInt(curRow.Cells["colTransactionRawDataNo"].Value);

                    var queryErrorLog = (from el in edm.tblErrorLogs
                                         where el.TransactionSetNo_FK == TransactionSetNo_FK &&
                                             el.TradingPartnerNo_FK == TradingPartnerNo_FK && el.TransactionRawDataNo_FK == rawDataNo
                                         select new
                                         {
                                             LogDate = el.LogDate,
                                             TradingPartnerNo_FK = el.TradingPartnerNo_FK,
                                             TransactionSetNo_FK = el.TransactionSetNo_FK,
                                             ErrorMessage = el.ErrorMessage,
                                             LogType = el.LogType
                                         }).ToList();


                    foreach (var row in queryErrorLog)
                    {
                        txtLogs.Text += row.LogDate + " : " + row.ErrorMessage + Environment.NewLine;
                    }

                    //Toggle Map Design 
                    if ((TransactionSetID.Equals("997") && InOut.Equals("Out")) || (TransactionSetID.Equals("CONTRL") && InOut.Equals("Out")))
                    {
                        btnMapDesign.Enabled = false;
                    }
                    else
                    {
                        btnMapDesign.Enabled = true;
                    }
                }
                else
                {
                    //Clear textfields if row is null
                    txtEDIData.Text = "";
                    txtXMLData.Text = "";
                    txtISA05InterchangeSenderIDQual.Text = "";
                    txtISA06InterchangeSenderID.Text = "";
                    txtISA07InterchangeReceiverIDQual.Text = "";
                    txtISA13InterchangeControlNum.Text = "";
                    txtISA08InterchangeReceiverID.Text = "";
                    txtGS02ApplicationSenderCode.Text = "";
                    txtGS03ApplicationReceiverCode.Text = "";
                    txtGS06GroupControlNumber.Text = "";
                    txtLogs.Text = "";
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Resend 997
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn997_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Do you want to resend 997 for selected data ?", Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.No)
                return;
            try
            {
                Cursor.Current = Cursors.WaitCursor;
                EDITranslator edi = new EDITranslator();
                // 997 generate set
                List<EDITranslator.T997Set> lst997 = new List<EDITranslator.T997Set>();
                string Terminator = "";
                string strCheckStatus = "";
                int tradingNo = -1;
                int tsetNo = -1;
                int rawNo = -1;

                foreach (DataGridViewRow row in dgvEDIData.Rows)
                {
                    if (Common.myCBool(row.Cells["colSelect"].Value) == true)
                    {
                        if (Common.myCStr(row.Cells["colInOutDisplay"].Value).Equals("In"))
                        {
                            EDIHeader header = new EDIHeader();
                            header.setTSet(Common.myCStr(row.Cells["colTransactionSetID"].Value));
                            header.setAppSenderID(Common.myCStr(row.Cells["colApplicationSenderCode"].Value));
                            header.setAppReceiverID(Common.myCStr(row.Cells["colApplicationReceiverCode"].Value));
                            header.setSenderID(Common.myCStr(row.Cells["colInterchangeSenderID"].Value));
                            header.setSenderQual(Common.myCStr(row.Cells["colInterchangeSenderIDQual"].Value));
                            header.setReceiverID(Common.myCStr(row.Cells["colInterchangeReceiverID"].Value));
                            header.setRereiverQual(Common.myCStr(row.Cells["colInterchangeReceiverIDQual"].Value));
                            header.setGroupControlNum(txtGS06GroupControlNumber.Text);
                            header.setInterchangeNum(txtISA13InterchangeControlNum.Text);
                            Terminator = Common.myCStr(row.Cells["colTerminator"].Value);
                            if (txtEDIData.Text.Contains(Environment.NewLine))
                                header.setRawData(txtEDIData.Text.Replace(Environment.NewLine, Terminator));
                            else
                                header.setRawData(txtEDIData.Text.Replace("\n", Terminator));
                            bool isX12Format = true;
                            if (!txtEDIData.Text.Substring(0, 3).Equals("ISA")) // check X12 or Edifact
                                isX12Format = false;
                            header.setIsX12Format(isX12Format);
                            header.setRawDataNo(Common.myCInt(row.Cells["colTransactionRawDataNo"].Value));

                            // check EDI data 
                            strCheckStatus = edi.generalEDICheck(header);

                            // generate 997
                            int intFA = (int)Common.FA_TYPE.DO_NOT;

                            var trading = edi.getTradingByEDIHeader(edm, header);
                            tradingNo = -1;
                            tsetNo = edi.getTSetNo(edm, header.getTSet());
                            rawNo = header.getRawDataNo();

                            if (trading != null)
                            {
                                intFA = Common.myCInt(trading.FunctionalAcknowledgement);
                                tradingNo = trading.TradingPartnerNo;
                            }
                            // if no error, map data to application data
                            if (strCheckStatus.Equals(EDIError.AK901_A) || strCheckStatus.Equals(EDIError.AK901_E) || strCheckStatus.Equals(EDIError.CONTRL_1.ToString())
                                || strCheckStatus.Equals(EDIError.CONTRL_7.ToString()) || strCheckStatus.Equals(EDIError.CONTRL_2.ToString()))
                            {
                                // generate 997 normal
                                if (intFA != (int)Common.FA_TYPE.DO_NOT && !header.getTSet().Equals("997") && !header.getTSet().Equals("CONTRL"))
                                {
                                    EDITranslator.T997Set obj997 = new EDITranslator.T997Set();
                                    obj997.header = header;
                                    obj997.strCheckStatus = strCheckStatus;
                                    obj997.intTradingNo = tradingNo;
                                    obj997.intTSetNo = tsetNo;
                                    obj997.intGenerateType = intFA;
                                    obj997.intErrorCode = 0;
                                    lst997.Add(obj997);
                                }


                            }
                            else
                            {

                                // generate 997 error
                                if (intFA != (int)Common.FA_TYPE.DO_NOT && !header.getTSet().Equals("997") && !header.getTSet().Equals("CONTRL"))
                                {
                                    EDITranslator.T997Set obj997 = new EDITranslator.T997Set();
                                    obj997.header = header;
                                    obj997.strCheckStatus = strCheckStatus;
                                    obj997.intTradingNo = tradingNo;
                                    obj997.intTSetNo = tsetNo;
                                    obj997.intGenerateType = intFA;
                                    obj997.intErrorCode = EDIError.AK502_506_5;
                                    lst997.Add(obj997);
                                }

                            }
                            
                            
                        }
                    }
                }

                InOutProcess inOut = new InOutProcess();
                inOut.generate997CONTROL_general(edm, edi, lst997);

                MessageBox.Show("Resend 997 is completed. Please check the log for errors.", Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Information);

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
