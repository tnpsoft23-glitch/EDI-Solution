using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Diagnostics;
using System.Data.Objects;

namespace BHEDI
{
    public partial class frmSetupInbound : Form
    {
        BHEDI_EDM edm;
        ErrorProvider ep;

        int currentRowIndex;

        public frmSetupInbound()
        {
            InitializeComponent();
        }
        
        /// <summary>
        /// Load form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmSetupInbound_Load(object sender, EventArgs e)
        {
            ep = new ErrorProvider();

            //load data
            loadData();
            toggleControl(false);
        }

        /// <summary>
        /// Form closing
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmSetupInbound_FormClosing(object sender, FormClosingEventArgs e)
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
        /// Copy setting info
        /// </summary>
        private void copySettingInfo(int SettingNo)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                tblInboundOutboundSetting copySI = edm.tblInboundOutboundSettings.Where(si => si.SettingNo == SettingNo).FirstOrDefault();
                tblInboundOutboundSetting newSI;

                bdsInboundSetting.AddNew();

                newSI = (tblInboundOutboundSetting)bdsInboundSetting.Current;

                newSI.SettingName = copySI.SettingName;
                newSI.InOut = copySI.InOut;
                newSI.Path = copySI.Path;
                newSI.IsArchive = copySI.IsArchive;
                newSI.IsDelete = copySI.IsDelete;
                newSI.IsCreate = copySI.IsCreate;
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
        /// Check if data is valid
        /// </summary>
        /// <returns>true if data is valid; otherwise, false</returns>
        private Boolean isValid()
        {
            Boolean IsValidated = true;
            String strMsg = "";
            tblInboundOutboundSetting curSetting;

            try
            {
                ep.BlinkStyle = ErrorBlinkStyle.NeverBlink;
                ep.Clear();

                curSetting = (tblInboundOutboundSetting)bdsInboundSetting.Current;

                if (curSetting.SettingName == null) strMsg = "-" + "Setting Name";

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
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        /// <summary>
        /// Load inbound setting data
        /// </summary>
        private void loadData()
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                edm = new BHEDI_EDM();

                ObjectQuery<tblInboundOutboundSetting> qry = edm.tblInboundOutboundSettings.Where("it.InOut = false");

                this.bdsInboundSetting.DataSource = qry.Execute(MergeOption.AppendOnly);

                currentRowIndex = -1;
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
                    DialogResult AskPrompt = MessageBox.Show("Do you want to save the changes?", Common.SYSTEM_NAME, MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);

                    switch (AskPrompt)
                    {

                        case System.Windows.Forms.DialogResult.Yes:
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

                        case System.Windows.Forms.DialogResult.No:
                            bdsInboundSetting.CancelEdit();
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
        /// Enable/Disable buttons
        /// </summary>
        /// <param name="IsEnabled">true to enable buttons; otherwise, false</param>
        private void toggleButton(Boolean IsEnabled)
        {
            try
            {
                btnNew.Enabled = IsEnabled;
                btnCopy.Enabled = IsEnabled;
                btnRemove.Enabled = IsEnabled;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Enable/Disable controls
        /// </summary>
        /// <param name="IsEnabled">true to enable controls; otherwise, false</param>
        private void toggleControl(Boolean IsEnabled)
        {
            try
            {
                chkArchive.Enabled = IsEnabled;
                chkDelete.Enabled = IsEnabled;
                chkCreate.Enabled = IsEnabled;

                dgvInboundSetting.ReadOnly = !IsEnabled;
                //colPath.ReadOnly = true;

                if (dgvInboundSetting.CurrentRow != null)
                {
                    dgvInboundSetting.CurrentRow.DefaultCellStyle.BackColor = (IsEnabled) ? Color.White : Color.LightGray;
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Create a new inbound setting
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void bdsInboundSetting_AddingNew(object sender, AddingNewEventArgs e)
        {
            try
            {
                tblInboundOutboundSetting newInboundSetting = new tblInboundOutboundSetting();

                newInboundSetting.InOut = false;

                e.NewObject = newInboundSetting;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Click action to create a new inbound setting
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnNew_Click(object sender, EventArgs e)
        {
            try
            {
                //Create a new
                bdsInboundSetting.AddNew();
                btnSaveModify.Text = "Save";
                currentRowIndex = dgvInboundSetting.CurrentRow.Index;

                toggleControl(true);
                toggleButton(false);
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Click action to save/modify current inbound setting
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSaveModify_Click(object sender, EventArgs e)
        {
            try
            {
                //Modify Setting Info
                if (btnSaveModify.Text == "Edit")
                {
                    btnSaveModify.Text = "Save";
                    currentRowIndex = dgvInboundSetting.CurrentRow.Index;
                    toggleControl(true);
                    toggleButton(false);
                }
                else
                {
                    if (saveData() == true)
                    {
                        btnSaveModify.Text = "Edit";
                        currentRowIndex = -1;
                        toggleControl(false);
                        toggleButton(true);
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
        /// Click action to create a copy
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnCopy_Click(object sender, EventArgs e)
        {
            try
            {
                tblInboundOutboundSetting curInboundSetting = (tblInboundOutboundSetting)bdsInboundSetting.Current;

                copySettingInfo(curInboundSetting.SettingNo);

                btnSaveModify.Text = "Save";
                currentRowIndex = dgvInboundSetting.CurrentRow.Index;
                toggleControl(true);
                toggleButton(false);
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Click action to remove current outbound setting
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnRemove_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult dgRemoveConfirm = MessageBox.Show("Are you sure you want to remove selected setting?", Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                if (dgRemoveConfirm == DialogResult.Yes)
                {
                    tblInboundOutboundSetting curInboundSetting = (tblInboundOutboundSetting)bdsInboundSetting.Current;

                    edm.tblInboundOutboundSettings.DeleteObject(curInboundSetting);

                    saveData();
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Disable rows except the current row
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvInboundSetting_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            try
            {
                if (dgvInboundSetting.CurrentRow.Index != currentRowIndex)
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
        /// Set inbound directory when the upload button is clicked
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvInboundSetting_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                switch (dgvInboundSetting.Columns[e.ColumnIndex].Name)
                {

                    case "colUpload": 
                        if (dgvInboundSetting.CurrentRow.Index == currentRowIndex)
                        {
                            tblInboundOutboundSetting curInbound = (tblInboundOutboundSetting)bdsInboundSetting.Current;
                            string strDirectory = Common.uploadDirectory(curInbound.Path);

                            if (strDirectory != null)
                            {
                                curInbound.Path = strDirectory;
                            }
                        }
                        break;

                    default:
                        break;
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
