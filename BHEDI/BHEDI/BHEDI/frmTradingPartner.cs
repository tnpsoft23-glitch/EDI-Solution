using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Collections;
using CrystalDecisions.CrystalReports.Engine;
using BHEDI.Report;

namespace BHEDI
{
    /// <summary>
    ///  Traiding Partner View/Setup
    /// </summary>
    public partial class frmTradingPartner : Form
    {
        BHEDI_EDM edm;
        ErrorProvider ep;

        public frmTradingPartner()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Load form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmTradingPartner_Load(object sender, EventArgs e)
        {
            ep = new ErrorProvider();

            //load data
            loadDataCombo();
            loadData(true);
            toggleControl(false);

            coltransactionSetNo_Fk.DataPropertyName = "TransactionSetNo_Fk";
            colCopyTradingPartner.DataPropertyName = "TradingPartnerNo";

            if (!Common.IS_FOR_DAIDO)
            {
                lblOutboundID.Visible = false;
                txtOutboundID.Visible = false;
                    
            }
        }

        /// <summary>
        /// Form closing
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmTradingPartner_FormClosing(object sender, FormClosingEventArgs e)
        {
            try
            {
                if (saveData(true) == false)
                {
                    e.Cancel = true;
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Copy Trading Partner
        /// </summary>
        /// <param name="tradingPartnerNo">the trading partner no to create a copy</param>
        private void copyTradingPartner(int tradingPartnerNo)
        {
            try
            {
                tblTradingPartner copyTP = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == tradingPartnerNo).FirstOrDefault();
                tblTradingPartner newTP;

                bdsTradingPartner.AddNew();

                newTP = (tblTradingPartner)bdsTradingPartner.Current;

                newTP.TradingPartnerName = copyTP.TradingPartnerName;
                newTP.AuthorizationQual = copyTP.AuthorizationQual;
                newTP.AuthorizationInfo = copyTP.AuthorizationInfo;
                newTP.SecurityQual = copyTP.SecurityQual;
                newTP.SecurityInfo = copyTP.SecurityInfo;
                newTP.InterchangeSenderIDQual = copyTP.InterchangeSenderIDQual;
                newTP.InterchangeSenderID = copyTP.InterchangeSenderID;
                newTP.InterchangeReceiverIDQual = copyTP.InterchangeReceiverIDQual;
                newTP.InterchangeReceiverID = copyTP.InterchangeReceiverID;
                newTP.ApplicationSenderCode = copyTP.ApplicationSenderCode;
                newTP.ApplicationReceiverCode = copyTP.ApplicationReceiverCode;
                newTP.ResponsibleAgencyCode = copyTP.ResponsibleAgencyCode;
                newTP.SegmentTerminator = copyTP.SegmentTerminator;
                newTP.DataElementDelimiter = copyTP.DataElementDelimiter;
                newTP.RepetitionSep = copyTP.RepetitionSep;
                newTP.InterchangeVersion = copyTP.InterchangeVersion;
                newTP.StandardVersion = copyTP.StandardVersion;
                newTP.TestIndicator = copyTP.TestIndicator;
                newTP.SubElementSep = copyTP.SubElementSep;
                newTP.FunctionalAcknowledgement = copyTP.FunctionalAcknowledgement;
                newTP.OutBoundID = copyTP.OutBoundID;
                newTP.Output997FilePath = copyTP.Output997FilePath;
                newTP.blnIsGSYear4 = copyTP.blnIsGSYear4;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Check if data is valid
        /// </summary>
        /// <returns>true if data is valid; otherwise, false</returns>
        private Boolean isValid()
        {
            Boolean IsValidated = true;
            String strMsg = "";

            try
            {
                ep.BlinkStyle = ErrorBlinkStyle.NeverBlink;
                ep.Clear();

                if (txtTradingPartnerAlias.Text == "") strMsg = "-" + "Trading Partner Name";
                if (txtISA05InterchangeSenderIDQual.Text == "") strMsg += Environment.NewLine + "-" + "ISA 05 Interchange Sender ID Qual";
                if (txtISA06InterchangeSenderID.Text == "") strMsg += Environment.NewLine + "-" + "ISA 06 Interchange Sender ID";
                if (txtISA07InterchangeReceiverIDQual.Text == "") strMsg += Environment.NewLine + "-" + "ISA 07 Interchange Receiver ID Qual";
                if (txtISA08InterchangeReceiverID.Text == "") strMsg += Environment.NewLine + "-" + "ISA 08 Interchange Receiver ID";
                if (txtGS02ApplicationSenderCode.Text == "") strMsg += Environment.NewLine + "-" + "GS 02 Application Sender Code";
                if (txtGS03ApplicationReceiverCode.Text == "") strMsg += Environment.NewLine + "-" + "GS 03 Application Receiver Code";
                if (Common.myCInt(cboSegmentTerminator.SelectedValue) == 0) strMsg += Environment.NewLine + "-" + "Segment Terminator";
                if (Common.myCInt(cboDataElementDelimiter.SelectedValue) == 0) strMsg += Environment.NewLine + "-" + "Data Element Delimiter";
                if (Common.myCInt(cboISA11RepetitionSep.SelectedValue) == 0) strMsg += Environment.NewLine + "-" + "ISA 11 Repetion Sep";
                if (txtISA12InterchangeVer.Text == "") strMsg += Environment.NewLine + "-" + "ISA 12 Interchange Version";
                if (Common.myCInt(cboISA16SubElementSep.SelectedValue) == 0) strMsg += Environment.NewLine + "-" + "ISA 16 Sub Element Sep";
                if (strMsg != "")
                {
                    strMsg = "Missing Required Fields:" + Environment.NewLine + strMsg;
                    MessageBox.Show(strMsg, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    IsValidated = false;
                }
                else
                {
                    ep.Clear();
                }

                return IsValidated;
            }
            catch(Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        /// <summary>
        /// Load Trading Partner data
        /// </summary>
        /// <param name="IsDefault">true if loading by default filter; otherwise, false</param>
        private void loadData(Boolean IsDefault = false)
        {
            try
            {
                bdsTradingPartner.DataSource = edm.tblTradingPartners.OrderBy(it => it.TradingPartnerName);
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Load datasource for combobox
        /// </summary>
        private void loadDataCombo()
        {
            try
            {
                //Bind Data
                edm = new BHEDI_EDM();

                bdsSegmentTerminator.DataSource = edm.tblSegmentTerminators.ToList();
                bdsDataElementDelimiter.DataSource = edm.tblSegmentTerminators.ToList();
                bdsRepetitionSep.DataSource = edm.tblSegmentTerminators.ToList();
                bdsStandardVersion.DataSource = edm.tblEDIVersions.ToList();
                bdsSubElementSep.DataSource = edm.tblSegmentTerminators.ToList();
                bdsTransactionSetList.DataSource = edm.tblEDITransactionSets.ToList();
                bdsTradingPartnerCopyList.DataSource = edm.tblTradingPartners.ToList();
                colCopyTradingPartner.ValueMember = "TradingPartnerNo";
                colCopyTradingPartner.DisplayMember = "TradingPartnerName";
                coltransactionSetNo_Fk.DisplayMember = "TransactionSetDisplay";
                bdsERPType.DataSource = edm.tblERPTypes.ToList();
                cboERPType.ValueMember = "ERPNo";
                cboERPType.DisplayMember = "ERPName";


                //Error Handle combobox
                ArrayList aryErrorHandle = new ArrayList();

                aryErrorHandle.Add(new myCombobxItem(" ", -1));

                foreach (tblErrorHandle curErrorHandle in edm.tblErrorHandles)
                {
                    aryErrorHandle.Add(new myCombobxItem(curErrorHandle.Description, curErrorHandle.ErrorHandleNo));
                }

                cboErrorCheckOption.DataSource = aryErrorHandle;
                cboErrorCheckOption.DisplayMember = "Description";
                cboErrorCheckOption.ValueMember = "Value";

                //Functional Ack combobox
                ArrayList aryFuncAck = new ArrayList();

                aryFuncAck.Add(new myCombobxItem(" ", null));
                aryFuncAck.Add(new myCombobxItem("Generate Normal FA or CONTRL", (int)Common.FA_TYPE.GENERAL));
                aryFuncAck.Add(new myCombobxItem("Generate Detail FA (Include AK2 / AK5) or CONTRL", (int)Common.FA_TYPE.DETAIL));
                aryFuncAck.Add(new myCombobxItem("Do not generate FA and CONTRL", (int)Common.FA_TYPE.DO_NOT));

                cboFunctionalAck.DataSource = aryFuncAck;
                cboFunctionalAck.DisplayMember = "Description";
                cboFunctionalAck.ValueMember = "Value";
            }
            catch(Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error); 
            }
        }

        /// <summary>
        /// Load transaction set of a trading partner
        /// </summary>
        /// <param name="curTradingPartner">trading partner</param>
        private void loadTransactionSet(tblTradingPartner curTradingPartner)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;
                // phuong changed sort by transaction id 03/30/2017
                using (var edm = new BHEDI_EDM())
                {
                    var inboundResult = (from ib in curTradingPartner.tblInboundMappings
                                         join ts in edm.tblEDITransactionSets on ib.TransactionSetNo_FK equals ts.TransactionSetNo
                                         select new
                                         {
                                             TransactionSetNo_FK = ib.TransactionSetNo_FK,
                                             TransactionSetID = ts.TransactionSetID

                                         }).Distinct();

                    var outboundResult = (from ob in curTradingPartner.tblOutboundMappings
                                          join ts in edm.tblEDITransactionSets on ob.TransactionSetNo_FK equals ts.TransactionSetNo
                                          select new
                                          {
                                              TransactionSetNo_FK = ob.TransactionSetNo_FK,
                                              TransactionSetID = ts.TransactionSetID
                                          }).Distinct();

                    var query = inboundResult.Union(outboundResult);
                    var result = query.OrderBy(m => m.TransactionSetID).ToList(); 
                    bdsTransactionSets.DataSource = result;
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
        /// Save Data
        /// </summary>
        /// <param name="IsClosing">true if window is closing; otherwise, false</param>
        /// <returns>true if data is saved; otherwise, false</returns>
        private Boolean saveData(Boolean IsClosing = false)
        {
            Boolean IsSaved = true;

            try
            {
                if (edm.ObjectStateManager.GetObjectStateEntries(EntityState.Modified | EntityState.Deleted | EntityState.Added).Any() == true)
                {
                    MessageBoxButtons msgButton = IsClosing ?  MessageBoxButtons.YesNoCancel : MessageBoxButtons.OKCancel;

                    DialogResult AskPrompt = MessageBox.Show("Do you want to save the changes?", Common.SYSTEM_NAME, msgButton, MessageBoxIcon.Question);

                    switch (AskPrompt)
                    {

                        case System.Windows.Forms.DialogResult.Yes:

                        case System.Windows.Forms.DialogResult.OK:
                            if (isValid())
                            {
                               edm.SaveChanges();
                                IsSaved = true;
                            }
                            else
                            {
                                IsSaved = false;
                            }
                            break;

                        case System.Windows.Forms.DialogResult.Cancel:
                            IsSaved = false;
                            break;

                        default:
                            break;
                    }
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
        /// Enable/Disable controls based on Edit/Save action
        /// </summary>
        /// <param name="isEnabled">true to enable controls; otherwise, false</param>
        private void toggleControl(Boolean isEnabled = false)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                txtTradingPartnerAlias.Enabled = isEnabled;
                txtISA01AuthorizationQual.Enabled = isEnabled;
                txtISA02AuthorizationInfo.Enabled = isEnabled;
                txtISA03SecurityQual.Enabled = isEnabled;
                txtISA04SecurityInfo.Enabled = isEnabled;
                txtISA05InterchangeSenderIDQual.Enabled = isEnabled;
                txtISA06InterchangeSenderID.Enabled = isEnabled;
                txtISA07InterchangeReceiverIDQual.Enabled = isEnabled;
                txtISA08InterchangeReceiverID.Enabled = isEnabled;
                txtGS02ApplicationSenderCode.Enabled = isEnabled;
                txtGS03ApplicationReceiverCode.Enabled = isEnabled;
                txtGS07ResponsibleAgencyCode.Enabled = isEnabled;
                txtISA12InterchangeVer.Enabled = isEnabled;
                txtOutboundID.Enabled = isEnabled;
                txt997Path.Enabled = isEnabled;

                cboSegmentTerminator.Enabled = isEnabled;
                cboDataElementDelimiter.Enabled = isEnabled;
                cboStandardVer.Enabled = isEnabled;
                cboISA11RepetitionSep.Enabled = isEnabled;
                cboISA16SubElementSep.Enabled = isEnabled;
                cboErrorCheckOption.Enabled = isEnabled;
                cboFunctionalAck.Enabled = isEnabled;

                chkTestIndicator.Enabled = isEnabled;
                chkGSYearFormat.Enabled = isEnabled;
                chkUsingSCP.Enabled = isEnabled; // 10/23/2020 Phuong added for SCP SAP
                txtSCPFilePath.Enabled = isEnabled; // 5/4/2022 Phuong added for SCP SAP
                cboERPType.Enabled = isEnabled;

                btnAddTransactionSet.Enabled = isEnabled;
                btnRemoveTransactionSet.Enabled = isEnabled;
                btnAddCopyTrading.Enabled = isEnabled;
                btnRemoveCopyTrading.Enabled = isEnabled;
              
                btnOpenMapDesign.Enabled = !isEnabled;

                dgvTradingPartner.Enabled = !isEnabled;
                dgvTradingPartner.BackgroundColor = (dgvTradingPartner.Enabled) ? SystemColors.AppWorkspace : SystemColors.ControlLight;

                btnPrevious.Enabled = !isEnabled;
                btnNext.Enabled = !isEnabled;
                btnNew.Enabled = !isEnabled;
                btnDelete.Enabled = !isEnabled;
                btnCopy.Enabled = !isEnabled;
                btnPrint.Enabled = !isEnabled;

                //Change color for required fields
                txtTradingPartnerAlias.BackColor = (isEnabled) ? System.Drawing.SystemColors.Info : System.Drawing.SystemColors.Window;
                txtISA05InterchangeSenderIDQual.BackColor = (isEnabled) ? System.Drawing.SystemColors.Info : System.Drawing.SystemColors.Window;
                txtISA06InterchangeSenderID.BackColor = (isEnabled) ? System.Drawing.SystemColors.Info : System.Drawing.SystemColors.Window;
                txtISA07InterchangeReceiverIDQual.BackColor = (isEnabled) ? System.Drawing.SystemColors.Info : System.Drawing.SystemColors.Window;
                txtISA08InterchangeReceiverID.BackColor = (isEnabled) ? System.Drawing.SystemColors.Info : System.Drawing.SystemColors.Window;
                txtISA12InterchangeVer.BackColor = (isEnabled) ? System.Drawing.SystemColors.Info : System.Drawing.SystemColors.Window;
                txtGS02ApplicationSenderCode.BackColor = (isEnabled) ? System.Drawing.SystemColors.Info : System.Drawing.SystemColors.Window;
                txtGS03ApplicationReceiverCode.BackColor = (isEnabled) ? System.Drawing.SystemColors.Info : System.Drawing.SystemColors.Window;
                cboSegmentTerminator.BackColor = (isEnabled) ? System.Drawing.SystemColors.Info : System.Drawing.SystemColors.Window;
                cboDataElementDelimiter.BackColor = (isEnabled) ? System.Drawing.SystemColors.Info : System.Drawing.SystemColors.Window;
                cboStandardVer.BackColor = (isEnabled) ? System.Drawing.SystemColors.Info : System.Drawing.SystemColors.Window;
                cboISA11RepetitionSep.BackColor = (isEnabled) ? System.Drawing.SystemColors.Info : System.Drawing.SystemColors.Window;
                cboISA16SubElementSep.BackColor = (isEnabled) ? System.Drawing.SystemColors.Info : System.Drawing.SystemColors.Window;
                chkTestIndicator.BackColor = (isEnabled) ? System.Drawing.SystemColors.Info : System.Drawing.SystemColors.Window;
                chkGSYearFormat.BackColor = (isEnabled) ? System.Drawing.SystemColors.Info : System.Drawing.SystemColors.Window;
                chkUsingSCP.BackColor = (isEnabled) ? System.Drawing.SystemColors.Info : System.Drawing.SystemColors.Window;
                
                //Always constant
                dgvTransactionSets.ReadOnly = true;
                colTradingPartnerName.ReadOnly = true;
                colISASenderID.ReadOnly = true;
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
        /// Click action to go to previous trading partner
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnPrevious_Click(object sender, EventArgs e)
        {
            try
            {
                if (dgvTradingPartner.Rows.Count > 0)
                {
                    if ((dgvTradingPartner.CurrentRow.Index - 1) >= 0)
                    {
                        dgvTradingPartner.Rows[dgvTradingPartner.CurrentRow.Index].Selected = false;
                        dgvTradingPartner.Rows[dgvTradingPartner.CurrentRow.Index - 1].Selected = true;
                        bdsTradingPartner.MovePrevious();
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
        /// Click action to go to next trading partner
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnNext_Click(object sender, EventArgs e)
        {
            try
            {
                if (dgvTradingPartner.Rows.Count > 0)
                {
                    if ((dgvTradingPartner.CurrentRow.Index + 1) < dgvTradingPartner.Rows.Count)
                    {
                        dgvTradingPartner.Rows[dgvTradingPartner.CurrentRow.Index].Selected = false;
                        dgvTradingPartner.Rows[dgvTradingPartner.CurrentRow.Index + 1].Selected = true;
                        bdsTradingPartner.MoveNext();
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
        /// Click action to create a new Trading Partner
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnNew_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult dgCopyNew = MessageBox.Show("Do you want to create a copy of selected Trading Partner?", Common.SYSTEM_NAME, MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
                Boolean IsCancel = false;

                switch (dgCopyNew)
                {

                    case DialogResult.Yes:
                        //Copy selected trading partner
                        DataGridViewRow curRow = dgvTradingPartner.CurrentRow;

                        if (curRow != null)
                        {
                            if (curRow.Cells[colTradingPartnerNo.Name].Value != null)
                            {
                                tblTradingPartner curTP = (tblTradingPartner)bdsTradingPartner.Current;

                                this.copyTradingPartner(curTP.TradingPartnerNo);
                            }
                        }
                        break;

                    case DialogResult.No:
                        //Create a new
                        bdsTradingPartner.AddNew();
                        break;

                    case DialogResult.Cancel:
                        IsCancel = true;
                        break;

                    default:
                        break;
                }

                if (!IsCancel)
                {
                    toggleControl(true);
                    btnSaveEdit.Text = "Save";
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Copy trading partner data
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnCopy_Click(object sender, EventArgs e)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                DataGridViewRow curRow = dgvTradingPartner.CurrentRow;

                if (curRow != null)
                {
                    if (curRow.Cells[colTradingPartnerNo.Name].Value != null)
                    {
                        tblTradingPartner orgTradingPartner;
                        tblTradingPartner newTradingPartner;
                        int orgTradingPartnerNo = Common.myCInt(curRow.Cells[colTradingPartnerNo.Name].Value);

                        orgTradingPartner = edm.tblTradingPartners.FirstOrDefault(t => t.TradingPartnerNo == orgTradingPartnerNo);
                        copyTradingPartner(orgTradingPartnerNo);

                        newTradingPartner = (tblTradingPartner)bdsTradingPartner.Current;

                        //Copy Most Recent Transaction Raw Data
                        foreach (var tranSetNo in orgTradingPartner.tblEDITrasactionRawDatas.Select(t => t.TransactionSetNo_FK).Distinct().ToList())
                        {
                            int recentRawDataNo = Common.getMostRecentData(orgTradingPartnerNo, tranSetNo);
                            tblEDITrasactionRawData curRawData = edm.tblEDITrasactionRawDatas.FirstOrDefault(r => r.TransactionRawDataNo == recentRawDataNo);
                            edm.tblEDITrasactionRawDatas.Detach(curRawData);
                            newTradingPartner.tblEDITrasactionRawDatas.Add(curRawData);
                        }

                        //Copy Inbound
                        foreach (var curInboundMap in orgTradingPartner.tblInboundMappings.ToList())
                        {
                            List<tblOperatorInboundMapping> copyOperatorList = curInboundMap.tblOperatorInboundMappings.ToList();

                            edm.tblInboundMappings.Detach(curInboundMap);
                            curInboundMap.TransactionRawDataNo_FK = newTradingPartner.tblEDITrasactionRawDatas.FirstOrDefault(r => r.TransactionSetNo_FK == curInboundMap.TransactionSetNo_FK).TransactionRawDataNo;

                            //Copy Operator
                            foreach (tblOperatorInboundMapping curOperator in copyOperatorList)
                            {
                                edm.tblOperatorInboundMappings.Detach(curOperator);
                                curInboundMap.tblOperatorInboundMappings.Add(curOperator);
                            }

                            newTradingPartner.tblInboundMappings.Add(curInboundMap);
                        }

                        //Copy Outbound
                        foreach (var curOutboundMap in orgTradingPartner.tblOutboundMappings.ToList())
                        {
                            List<tblOperatorOutboundMapping> copyOpeartorList = curOutboundMap.tblOperatorOutboundMappings.ToList();

                            edm.tblOutboundMappings.Detach(curOutboundMap);
                            curOutboundMap.TransactionRawDataNo_FK = newTradingPartner.tblEDITrasactionRawDatas.FirstOrDefault(r => r.TransactionSetNo_FK == curOutboundMap.TransactionSetNo_FK).TransactionRawDataNo;

                            //Copy Operator
                            foreach (tblOperatorOutboundMapping curOperator in copyOpeartorList)
                            {
                                edm.tblOperatorOutboundMappings.Detach(curOperator);
                                curOutboundMap.tblOperatorOutboundMappings.Add(curOperator);
                            }

                            newTradingPartner.tblOutboundMappings.Add(curOutboundMap);
                        }

                        //Copy Error Handling
                        foreach (var curErrorHandling in orgTradingPartner.tblTradingPartnerErrorHandings.ToList())
                        {
                            edm.tblTradingPartnerErrorHandings.Detach(curErrorHandling);
                            newTradingPartner.tblTradingPartnerErrorHandings.Add(curErrorHandling);
                        }

                        //Copy Auto Forward 
                        foreach (var curCopy in orgTradingPartner.tblTradingPartnerAutoCopies.ToList())
                        {
                            edm.tblTradingPartnerAutoCopies.Detach(curCopy);
                            newTradingPartner.tblTradingPartnerAutoCopies.Add(curCopy);
                        }

                        loadTransactionSet(newTradingPartner);

                        toggleControl(true);
                        btnSaveEdit.Text = "Save";
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
        /// Click action to delete a Trading Partner
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                tblTradingPartner curTradingPartner = (tblTradingPartner)bdsTradingPartner.Current;
                string strDeleteMsg = String.Format("Are you sure you want to delete {0}?", curTradingPartner.TradingPartnerName);

                DialogResult dgDeleteConfirm = MessageBox.Show(strDeleteMsg, Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                if (dgDeleteConfirm == DialogResult.Yes)
                {
                    Cursor.Current = Cursors.WaitCursor;

                    //Delete Error Handlings
                    foreach (tblTradingPartnerErrorHanding curErrorHandling in curTradingPartner.tblTradingPartnerErrorHandings.ToList())
                    {
                        edm.tblTradingPartnerErrorHandings.DeleteObject(curErrorHandling);
                    }

                    //Delete InboundMapping
                    foreach (tblInboundMapping curMap in curTradingPartner.tblInboundMappings.ToList())
                    {
                        foreach (tblOperatorInboundMapping curOperator in curMap.tblOperatorInboundMappings.ToList())
                        {
                            edm.tblOperatorInboundMappings.DeleteObject(curOperator);
                        }

                        edm.tblInboundMappings.DeleteObject(curMap);
                    }

                    //Delete Outbound Mapping
                    foreach (tblOutboundMapping curMap in curTradingPartner.tblOutboundMappings.ToList())
                    {
                        foreach (tblOperatorOutboundMapping curOperator in curMap.tblOperatorOutboundMappings.ToList())
                        {
                            edm.tblOperatorOutboundMappings.DeleteObject(curOperator);
                        }

                        edm.tblOutboundMappings.DeleteObject(curMap);
                    }

                    //Delete Transaction Raw Data
                    foreach (tblEDITrasactionRawData curRawData in curTradingPartner.tblEDITrasactionRawDatas.ToList())
                    {
                        //Delete Error Log
                        foreach (tblErrorLog curErrorLog in curRawData.tblErrorLogs.ToList())
                        {
                            edm.tblErrorLogs.DeleteObject(curErrorLog);
                        }

                        edm.tblEDITrasactionRawDatas.DeleteObject(curRawData);
                    }

                    // delete Auto forward partner
                    foreach (tblTradingPartnerAutoCopy curCopy in curTradingPartner.tblTradingPartnerAutoCopies.ToList())
                    {
                        edm.tblTradingPartnerAutoCopies.DeleteObject(curCopy);
                    }

                    // delete error log 
                    foreach (tblErrorLog curErrorLog in curTradingPartner.tblErrorLogs.ToList())
                    {
                        edm.tblErrorLogs.DeleteObject(curErrorLog);
                    }
                    
                    //Delete Trading Partner
                    edm.tblTradingPartners.DeleteObject(curTradingPartner);

                    edm.SaveChanges();
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
        /// Click action to print
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnPrint_Click(object sender, EventArgs e)
        {
            try
            {
                if (bdsTradingPartner.Current != null)
                {
                    tblTradingPartner curTradingPartner = (tblTradingPartner)bdsTradingPartner.Current;
                    rptTradingPartner rpt = new rptTradingPartner();

                    //Set Filter
                    int tradingPartnerNo = curTradingPartner.TradingPartnerNo;
                    rpt.SetParameterValue("TradingPartnerNo", tradingPartnerNo);

                    frmReportViewer rptViewer = new frmReportViewer(rpt);
                    rptViewer.Show();
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Click action to edit Trading Partner
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSaveEdit_Click(object sender, EventArgs e)
        {
            try
            {
                if (btnSaveEdit.Text == "Edit")
                {
                    btnSaveEdit.Text = "Save";
                    toggleControl(true);
                }
                else
                {
                    if (saveData() == true)
                    {
                        btnSaveEdit.Text = "Edit";
                        toggleControl(false);
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
        /// Click action to add Transaction Set
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnAddTransactionSet_Click(object sender, EventArgs e)
        {
            try
            {
                frmEDITransactionSet obj = new frmEDITransactionSet();

                obj.StartPosition = FormStartPosition.Manual;
                obj.Location = new Point((this.ClientSize.Width - obj.Width) / 2, (this.ClientSize.Height - obj.Height) / 2);

                if (obj.ShowDialog() == DialogResult.OK)
                {
                    Cursor.Current = Cursors.WaitCursor;

                    //Create new Transaction Set
                    tblTradingPartner curTradingPartner = (tblTradingPartner)bdsTradingPartner.Current;
                    int tranSetNo = obj.GetTransactionSetNo();

                    if (curTradingPartner.tblEDITrasactionRawDatas.Any(tr => tr.TradingPartnerNo_FK == curTradingPartner.TradingPartnerNo && tr.TransactionSetNo_FK == tranSetNo) == false)
                    {
                        //Create TransactionRawData
                        tblEDITrasactionRawData newTransaction = new tblEDITrasactionRawData();

                        newTransaction.TransactionDate = DateTime.Now;
                        newTransaction.TradingPartnerNo_FK = curTradingPartner.TradingPartnerNo;
                        newTransaction.TransactionSetNo_FK = tranSetNo;
                        newTransaction.InOut = obj.GetInOut();
                        newTransaction.RawData = " ";
                        newTransaction.XMLData = " ";
                        newTransaction.TransactionKey = " ";

                        curTradingPartner.tblEDITrasactionRawDatas.Add(newTransaction);

                        if (obj.GetInOut() == true)
                        {
                            //Create Outbound Mapping
                            tblOutboundMapping newOutboundMapping = new tblOutboundMapping();

                            newOutboundMapping.TradingPartnerNo_FK = curTradingPartner.TradingPartnerNo;
                            newOutboundMapping.TransactionSetNo_FK = tranSetNo;
                            newOutboundMapping.SegmentNo_FK = (int?)null;
                            newOutboundMapping.Postion = 1;
                            newOutboundMapping.TransactionRawDataNo_FK = newTransaction.TransactionRawDataNo;

                            curTradingPartner.tblOutboundMappings.Add(newOutboundMapping);
                            loadTransactionSet(curTradingPartner);
                        }
                        else
                        {
                            //Create Inbound Maping
                            tblInboundMapping newInboundMapping = new tblInboundMapping();

                            newInboundMapping.TradingPartnerNo_FK = curTradingPartner.TradingPartnerNo;
                            newInboundMapping.TransactionSetNo_FK = tranSetNo;
                            newInboundMapping.SegmentNo_FK = (int?)null;
                            newInboundMapping.Postion = 1;
                            newInboundMapping.TransactionRawDataNo_FK = newTransaction.TransactionRawDataNo;

                            curTradingPartner.tblInboundMappings.Add(newInboundMapping);
                            loadTransactionSet(curTradingPartner);
                        }
                    }
                    else
                    {
                        MessageBox.Show("Sames transaction set already exists", Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
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
        /// Click action to remove Transaction Set
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnRemoveTransactionSet_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Are you sure you want to delete selected transaction set?", Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    Cursor.Current = Cursors.WaitCursor;

                    //Delete Inbound/Outbound 
                    DataGridViewRow curRow = dgvTransactionSets.CurrentRow;
                    tblTradingPartner curTradingPartner = (tblTradingPartner)bdsTradingPartner.Current;
                    int tranSetNo = Common.myCInt(curRow.Cells["coltransactionSetNo_Fk"].Value);
                    int tradingPartnerNo = curTradingPartner.TradingPartnerNo;

                    //Delete Inbound mapping
                    foreach (tblInboundMapping curMap in edm.tblInboundMappings.Where(ib => ib.TradingPartnerNo_FK == tradingPartnerNo && ib.TransactionSetNo_FK == tranSetNo).ToList())
                    {
                        foreach (tblOperatorInboundMapping curOperator in curMap.tblOperatorInboundMappings.ToList())
                        {
                            edm.tblOperatorInboundMappings.DeleteObject(curOperator);
                        }

                        edm.tblInboundMappings.DeleteObject(curMap);
                    }

                    //Delete Outbound mapping
                    foreach (tblOutboundMapping curMap in edm.tblOutboundMappings.Where(ib => ib.TradingPartnerNo_FK == tradingPartnerNo && ib.TransactionSetNo_FK == tranSetNo).ToList())
                    {
                        foreach (tblOperatorOutboundMapping curOperator in curMap.tblOperatorOutboundMappings.ToList())
                        {
                            edm.tblOperatorOutboundMappings.DeleteObject(curOperator);
                        }

                        edm.tblOutboundMappings.DeleteObject(curMap);
                    }

                    //Delete TransationRawData
                    foreach (tblEDITrasactionRawData curRawData in edm.tblEDITrasactionRawDatas.Where(r => r.TradingPartnerNo_FK == tradingPartnerNo && r.TransactionSetNo_FK == tranSetNo).ToList())
                    {
                        //Delete Error Log
                        foreach (tblErrorLog curErrorLog in curRawData.tblErrorLogs.ToList())
                        {
                            edm.tblErrorLogs.DeleteObject(curErrorLog);
                        }

                        edm.tblEDITrasactionRawDatas.DeleteObject(curRawData);
                    }

                    //Delete Error Handling
                    foreach (tblTradingPartnerErrorHanding curErrorHanding in edm.tblTradingPartnerErrorHandings.Where(eh => eh.TradingPartnerNo_FK == tradingPartnerNo && eh.TransactionSetNo_FK == tranSetNo).ToList())
                    {
                        edm.tblTradingPartnerErrorHandings.DeleteObject(curErrorHanding);
                    }

                    bdsTransactionSets.RemoveCurrent();
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
        /// Click action to open map design
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnOpenMapDesign_Click(object sender, EventArgs e)
        {
            try
            {
                DataGridViewRow curRow = dgvTransactionSets.CurrentRow;
                tblTradingPartner curTradingPartner = (tblTradingPartner)bdsTradingPartner.Current;
                tblEDITrasactionRawData curRawData;

                Form obj = null;

                if (curRow != null)
                {
                    int tranSetNo = Common.myCInt(curRow.Cells["coltransactionSetNo_Fk"].Value);
                    int tradingPartnerNo = curTradingPartner.TradingPartnerNo;
                    int tranRawDataNo;

                    //get most recent data
                    int mostTransactionRawDataNo = Common.getMostRecentData(tradingPartnerNo, tranSetNo);

                    curRawData = edm.tblEDITrasactionRawDatas.Where(tr => tr.TransactionRawDataNo == mostTransactionRawDataNo).FirstOrDefault();

                    if (curRawData.InOut == false)
                    {
                        if (mostTransactionRawDataNo != -1)
                        {
                            tranRawDataNo = mostTransactionRawDataNo;
                        }
                        else
                        {
                            tblInboundMapping curInbound = edm.tblInboundMappings.Where(ib => ib.TradingPartnerNo_FK == tradingPartnerNo && ib.TransactionSetNo_FK == tranSetNo).FirstOrDefault();
                            tranRawDataNo = curInbound.TransactionRawDataNo_FK;
                        }

                        //Open Inbound Design
                        obj = new frmInboundMapDesign(tradingPartnerNo, tranSetNo, tranRawDataNo);
                    }
                    else
                    {
                        if (mostTransactionRawDataNo != -1)
                        {
                            tranRawDataNo = mostTransactionRawDataNo;
                        }
                        else
                        {
                            tblOutboundMapping curOutbound = edm.tblOutboundMappings.Where(ob => ob.TradingPartnerNo_FK == tradingPartnerNo && ob.TransactionSetNo_FK == tranSetNo).FirstOrDefault();
                            tranRawDataNo = curOutbound.TransactionRawDataNo_FK;
                        }
               
                        //Open Outbound Design
                        obj = new frmOutboundMapDesign(tradingPartnerNo, tranSetNo, tranRawDataNo);
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
        /// Create a new Trading Partner
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void bdsTradingPartner_AddingNew(object sender, AddingNewEventArgs e)
        {
            try
            {
                tblTradingPartner newTradingPartner = new tblTradingPartner();

                newTradingPartner.TradingPartnerNo = 0;
                newTradingPartner.TestIndicator = false;

                e.NewObject = newTradingPartner;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Set Transanction Set
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void bdsTradingPartner_CurrentChanged(object sender, EventArgs e)
        {
            try
            {
                if (bdsTradingPartner.Current != null)
                {
                    tblTradingPartner curTradingPartner = (tblTradingPartner)bdsTradingPartner.Current;
                   
                    loadTransactionSet(curTradingPartner);
                }
            }
            catch (Exception ex)
            {
               Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
               MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cboErrorCheckOption_SelectionChangeCommitted(object sender, EventArgs e)
        {
            try
            {
                //Create new
                DataGridViewRow curRow = dgvTransactionSets.CurrentRow;
                tblTradingPartner curTradingPartner = (tblTradingPartner)bdsTradingPartner.Current;
                tblTradingPartnerErrorHanding curErrorHandling;
                int transactionSetNo = Common.myCInt(curRow.Cells["coltransactionSetNo_Fk"].Value);

                if (curTradingPartner.tblTradingPartnerErrorHandings.Any(eh => eh.TransactionSetNo_FK == transactionSetNo) == false)
                {
                    //Create a new error handling
                    if(Common.myCInt(cboErrorCheckOption.SelectedValue) != -1)
                    {
                        curErrorHandling = new tblTradingPartnerErrorHanding();
                        curErrorHandling.TradingPartnerNo_FK = curTradingPartner.TradingPartnerNo;
                        curErrorHandling.TransactionSetNo_FK = transactionSetNo;
                        curErrorHandling.ErrorHandleNo_FK = Common.myCInt(cboErrorCheckOption.SelectedValue);

                        curTradingPartner.tblTradingPartnerErrorHandings.Add(curErrorHandling);
                    }
                }
                else
                {
                    //Modify error handling
                    curErrorHandling = curTradingPartner.tblTradingPartnerErrorHandings.Where(eh => eh.TransactionSetNo_FK == transactionSetNo).FirstOrDefault();

                    if (Common.myCInt(cboErrorCheckOption.SelectedValue) != -1)
                    {
                        curErrorHandling.ErrorHandleNo_FK = Common.myCInt(cboErrorCheckOption.SelectedValue);
                    }
                    else
                    {
                        edm.tblTradingPartnerErrorHandings.DeleteObject(curErrorHandling);
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
        /// Data error
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvTransactionSets_DataError(object sender, DataGridViewDataErrorEventArgs e)
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
        /// Hide columns after data binding
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvTradingPartner_DataBindingComplete(object sender, DataGridViewBindingCompleteEventArgs e)
        {
            try
            {
                foreach (DataGridViewColumn col in dgvTradingPartner.Columns)
                {
                    switch (col.Name)
                    {

                        case "colTradingPartnerName":

                        case "colISASenderID":
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
        private void dgvTradingPartner_DataError(object sender, DataGridViewDataErrorEventArgs e)
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
        /// Set error handling option based on selected transaction set
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvTransactionSets_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                cboErrorCheckOption.SelectedValue = -1;

                if (dgvTransactionSets.CurrentRow != null)
                {
                    DataGridViewRow curRow = dgvTransactionSets.CurrentRow;
                    tblTradingPartner curTradingPartner = (tblTradingPartner)bdsTradingPartner.Current;
                    tblEDITransactionSet curTransactionSet;
                    int tranSetNo = Common.myCInt(curRow.Cells["coltransactionSetNo_Fk"].Value);
                    int tradingPartnerNo = curTradingPartner.TradingPartnerNo;

                    curTransactionSet = edm.tblEDITransactionSets.Where(ts => ts.TransactionSetNo == tranSetNo).FirstOrDefault();

                    //Toggle Open Design Map
                    if (curTransactionSet != null)
                    {
                        if (curTransactionSet.TransactionSetID.Equals("997") && curTransactionSet.InOut == true)
                        {
                            btnOpenMapDesign.Enabled = false;
                        }
                        else
                        {
                            btnOpenMapDesign.Enabled = (btnSaveEdit.Text =="Edit") ? true : false;
                        }
                    }

                    //Get Error Handling
                    tblTradingPartnerErrorHanding curErrorHandling = curTradingPartner.tblTradingPartnerErrorHandings.Where(eh => eh.TradingPartnerNo_FK == tradingPartnerNo && eh.TransactionSetNo_FK == tranSetNo).FirstOrDefault();
                    if (curErrorHandling != null)
                    {
                        cboErrorCheckOption.SelectedValue = curErrorHandling.ErrorHandleNo_FK;
                    }
                    
                    // 9/19/2017 Phuong added Auto Copy Function
                    loadAutoCopyTrading(curTradingPartner, tranSetNo);

               }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Load auto copy trading partner 
        /// </summary>
        /// <param name="TradingPartnerNo"></param>
        /// <param name="TransSetNo"></param>
        private void loadAutoCopyTrading(tblTradingPartner curTradingPartner, int TransSetNo)
        {
            try
            {
              
                using (var edm = new BHEDI_EDM())
                {
                    var copyTrading = (from c in curTradingPartner.tblTradingPartnerAutoCopies
                                       join t in edm.tblTradingPartners on c.TradingPartnerNo_AutoCopy_FK equals t.TradingPartnerNo
                                       where c.TradingPartnerNo_FK == curTradingPartner.TradingPartnerNo && c.TransactionSetNo_FK == TransSetNo
                                       select new
                                       {
                                           TradingPartnerNo = t.TradingPartnerNo,
                                           TradingPartnerName = t.TradingPartnerName,
                                           InterchangeSenderID = t.InterchangeSenderID
                                       });

                    var result = copyTrading.OrderBy(m => m.TradingPartnerName).ToList();
                    bdsTradingPartnerAutoCopy.DataSource = result;
                }

            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Add Auto Copy Trading Partner
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnAddCopyTrading_Click(object sender, EventArgs e)
        {
            try
            {
                frmTradingPartnerList obj = new frmTradingPartnerList();

                obj.StartPosition = FormStartPosition.Manual;
                obj.Location = new Point((this.ClientSize.Width - obj.Width) / 2, (this.ClientSize.Height - obj.Height) / 2);

                if (obj.ShowDialog() == DialogResult.OK)
                {
                    Cursor.Current = Cursors.WaitCursor;

                    //Create new Transaction Set
                    tblTradingPartner curTradingPartner = (tblTradingPartner)bdsTradingPartner.Current;
                    int tradingCopyNo = obj.GetTradingPartnerNo();

                    DataGridViewRow curRow = dgvTransactionSets.CurrentRow;
                    int tranSetNo = Common.myCInt(curRow.Cells["coltransactionSetNo_Fk"].Value);
                    int tradingPartnerNo = curTradingPartner.TradingPartnerNo;


                    if (curTradingPartner.tblTradingPartnerAutoCopies.Any(tr => tr.TradingPartnerNo_FK == curTradingPartner.TradingPartnerNo && tr.TransactionSetNo_FK == tranSetNo && tr.TradingPartnerNo_AutoCopy_FK == tradingCopyNo) == false)
                    {
                        //Create Copy Auto Trading Partner
                        tblTradingPartnerAutoCopy newTransaction = new tblTradingPartnerAutoCopy();
                        newTransaction.TradingPartnerNo_FK = curTradingPartner.TradingPartnerNo;
                        newTransaction.TransactionSetNo_FK = tranSetNo;
                        newTransaction.TradingPartnerNo_AutoCopy_FK = tradingCopyNo;
                        curTradingPartner.tblTradingPartnerAutoCopies.Add(newTransaction);

                        // refresh data
                        loadAutoCopyTrading(curTradingPartner, tranSetNo);

                    }
                    else
                    {
                        MessageBox.Show("Sames Trading Partner already exists", Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
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
        /// Remove Copy Auto Trading Partner
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnRemoveCopyTrading_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Are you sure you want to delete selected Trading Partner?", Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    DataGridViewRow curRow = dgvTransactionSets.CurrentRow;
                    tblTradingPartner curTradingPartner = (tblTradingPartner)bdsTradingPartner.Current;
                    int tranSetNo = Common.myCInt(curRow.Cells["coltransactionSetNo_Fk"].Value);
                    int tradingPartnerNo = curTradingPartner.TradingPartnerNo;
                    DataGridViewRow curRowCopyTrading = dvAutoCopy.CurrentRow;
                    int tradingPartnerCopy = Common.myCInt(curRowCopyTrading.Cells["colCopyTradingPartner"].Value);

                    foreach (tblTradingPartnerAutoCopy curRawData in edm.tblTradingPartnerAutoCopies.Where(r => r.TradingPartnerNo_FK == tradingPartnerNo && r.TransactionSetNo_FK == tranSetNo && r.TradingPartnerNo_AutoCopy_FK == tradingPartnerCopy).ToList())
                    {
                        edm.tblTradingPartnerAutoCopies.DeleteObject(curRawData);
                    }

                    bdsTradingPartnerAutoCopy.RemoveCurrent();
                }
            }

            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

    }
}
