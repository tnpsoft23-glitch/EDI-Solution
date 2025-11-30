using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.Objects;

namespace BHEDI
{
    public partial class frmSetupOutbound : Form
    {
        BHEDI_EDM edm;
        ErrorProvider ep;

        int currentRowIndex;

        public frmSetupOutbound()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Load form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmSetupOutbound_Load(object sender, EventArgs e)
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
        private void frmSetupOutbound_FormClosing(object sender, FormClosingEventArgs e)
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
        /// <param name="SettingNo">the inbound setting no to create a copy</param>
        private void copySettingInfo(int SettingNo)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                tblInboundOutboundSetting copySI = edm.tblInboundOutboundSettings.Where(si => si.SettingNo == SettingNo).FirstOrDefault();
                tblInboundOutboundSetting newSI;

                bdsOutboundSetting.AddNew();

                newSI = (tblInboundOutboundSetting)bdsOutboundSetting.Current;

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

                curSetting = (tblInboundOutboundSetting)bdsOutboundSetting.Current;

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
        /// Load outbound setting data
        /// </summary>
        private void loadData()
        {
            try
            {
                edm = new BHEDI_EDM();

                ObjectQuery<tblInboundOutboundSetting> qry = edm.tblInboundOutboundSettings.Where("it.InOut = true");

                this.bdsOutboundSetting.DataSource = qry.Execute(MergeOption.AppendOnly);

                currentRowIndex = -1;
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
                            bdsOutboundSetting.CancelEdit();
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

                dgvOutboundSetting.ReadOnly = !IsEnabled;
                //colPath.ReadOnly = true;

                if (dgvOutboundSetting.CurrentRow != null)
                {
                    dgvOutboundSetting.CurrentRow.DefaultCellStyle.BackColor = (IsEnabled) ? Color.White : Color.LightGray;
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Create a new outbound setting
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void bdsOutboundSetting_AddingNew(object sender, AddingNewEventArgs e)
        {
            try
            {
                tblInboundOutboundSetting newOutboundSetting = new tblInboundOutboundSetting();

                newOutboundSetting.InOut = true;

                e.NewObject = newOutboundSetting;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Click action to create a new outbound setting
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnNew_Click(object sender, EventArgs e)
        {
            try
            {
                //Create a new
                bdsOutboundSetting.AddNew();
                btnSaveModify.Text = "Save";
                currentRowIndex = dgvOutboundSetting.CurrentRow.Index;

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
        /// Click action to save/codify current outbound setting
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
                    currentRowIndex = dgvOutboundSetting.CurrentRow.Index;
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
                tblInboundOutboundSetting curOutboundSetting = (tblInboundOutboundSetting)bdsOutboundSetting.Current;

                copySettingInfo(curOutboundSetting.SettingNo);

                btnSaveModify.Text = "Save";
                currentRowIndex = dgvOutboundSetting.CurrentRow.Index;
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
                    tblInboundOutboundSetting curOutboundSetting = (tblInboundOutboundSetting)bdsOutboundSetting.Current;

                    edm.tblInboundOutboundSettings.DeleteObject(curOutboundSetting);

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
        private void dgvOutboundSetting_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            try
            {
                if (dgvOutboundSetting.CurrentRow.Index != currentRowIndex)
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
        /// Set Outbound directory when the upload button is clicked
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvOutboundSetting_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                switch (dgvOutboundSetting.Columns[e.ColumnIndex].Name)
                {

                    case "colUpload":
                        if (dgvOutboundSetting.CurrentRow.Index == currentRowIndex)
                        {
                            tblInboundOutboundSetting curOutbound = (tblInboundOutboundSetting)bdsOutboundSetting.Current;
                            string strDirectory = Common.uploadDirectory(curOutbound.Path);

                            if (strDirectory != null)
                            {
                                curOutbound.Path = strDirectory;
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
