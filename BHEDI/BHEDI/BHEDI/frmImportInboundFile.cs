using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Collections;
using System.IO;

namespace BHEDI
{
    /// <summary>
    /// Import inbound EDI file
    /// </summary>
    public partial class frmImportInboundFile : Form
    {
        public frmImportInboundFile()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Inbound setting 
        /// </summary>
        private ArrayList arrInboundSetting = new ArrayList();

        /// <summary>
        /// Header Data
        /// </summary>
        private ArrayList arrHeaderData = new ArrayList();

        /// <summary>
        /// Get inbound setting infor
        /// </summary>
        private void getInboundSettingInfo()
        {
            try
            {
                arrInboundSetting.Clear();

                using (var edm = new BHEDI_EDM())
                {
                    var objTbl = edm.tblInboundOutboundSettings.Where(s => s.InOut == false  && !s.SettingName.Equals(Common.CONFIG_DAIDO_PARTNER_LIST)
                        && !s.SettingName.Equals(Common.CONFIG_SIMPLY_CHECKING_ACCOUNT) && !s.SettingName.Equals(Common.CONFIG_SIMPLY_FILE)
                        && !s.SettingName.Equals(Common.CONFIG_SIMPLY_RECEIVABLE_ACCOUNT) && !s.SettingName.Equals(Common.CONFIG_EMAIL) && !s.SettingName.Equals(Common.CONFIG_SEND_SQL_ERROR_EMAIL)
                        && !s.SettingName.Equals(Common.CONFIG_SCP_IN) && !s.SettingName.Equals(Common.CONFIG_SCP_OUT) && !s.SettingName.Equals(Common.CONFIG_SEND_SCP_ERROR_EMAIL)
                        && !s.SettingName.Equals(Common.CONFIG_REQUIRE_ORDER_LEVEL_PARTNER_LIST));
                    foreach (var objRow in objTbl)
                    {
                        arrInboundSetting.Add(objRow);
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
        /// Load inbound file list
        /// </summary>
        private void LoadListInboundFiles()
        {
            try
            {

                // reset grid
                dgvFile.Rows.Clear();
                arrHeaderData.Clear();

                // EDITranslator
                EDITranslator edi = new EDITranslator();
               
                // no setting yet - default setting
                if (arrInboundSetting.Count == 0)
                {
                    if (!Directory.Exists(Common.IN_PATH))
                        Directory.CreateDirectory(Common.IN_PATH);

                    // Transfer one EDI that contain many transaction data to many EDI files that contain one  data only
                    Common.transferOneEDIToManyEDI(Common.IN_PATH);

                    string[] files = Directory.GetFiles(Common.IN_PATH);

                    foreach (string file in files)
                    {
                        EDIHeader header = edi.getEDIHeaderData(file);
                        if (header != null)
                        {
                            arrHeaderData.Add(header);
                            dgvFile.Rows.Add(true, file, header.getTSet(), header.getSenderQual(), header.getSenderID(), header.getRereiverQual(), header.getReceiverID(), true, true, true);
                        }
                        else if (Common.IS_FOR_DAIDO) // for Daido version process file after 1EDIHQ run, delete and move to new archive folder
                        {
                            // it is not file for process, already processed by 1EDIHQ
                            Common.archiveFile(file);
                            File.Delete(file);
                        }
                   }


                }

                else
                {
                    foreach (tblInboundOutboundSetting row in arrInboundSetting)
                    {

                        if (Directory.Exists(row.Path))
                        {
                            // Transfer one EDI that contain many transaction data to many EDI files that contain one  data only
                            Common.transferOneEDIToManyEDI(row.Path);

                            string[] files = Directory.GetFiles(row.Path);
                            foreach (string file in files)
                            {
                                EDIHeader header = edi.getEDIHeaderData(file);
                                if (header != null)
                                {
                                    arrHeaderData.Add(header);
                                    dgvFile.Rows.Add(true, file, header.getTSet(), header.getSenderQual(), header.getSenderID(), header.getRereiverQual(), header.getReceiverID(), row.IsDelete, row.IsArchive, row.IsCreate);
                                }
                                else if (Common.IS_FOR_DAIDO) // for Daido version process file after 1EDIHQ run, delete and move to new archive folder
                                {
                                    // it is not file for process, already processed by 1EDIHQ
                                    Common.archiveFile(file);
                                    File.Delete(file);
                                }
                            }
                        }

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
        /// Init data
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmImportInboundFile_Load(object sender, EventArgs e)
        {
            // load inboud setting
            getInboundSettingInfo();
            // show all files
            LoadListInboundFiles();
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
        /// Import EDI inbound data files
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnImport_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Do you want to import selected data ?", Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.No)
                    return;

                Cursor.Current = Cursors.WaitCursor;
                EDITranslator edi = new EDITranslator();

                foreach (DataGridViewRow row in dgvFile.Rows)
                {
                    if (Common.myCBool(row.Cells["chkCol1"].Value) == true)
                    {
                        EDIHeader header = getEDIHeader(Common.myCStr(row.Cells["txtCol2"].Value));
                        if (header != null)
                        {
                            edi.importEDIInboundData(header, Common.myCBool(row.Cells["colIsDelete"].Value), Common.myCBool(row.Cells["colIsArchive"].Value), Common.myCBool(row.Cells["colIsCreate"].Value));
                            
                            // check EDI data
                            string strErr = edi.generalEDICheck(header);
                        }
                    }
                }

                // refresh data
                // load inboud setting
                getInboundSettingInfo();
                // show all files
                LoadListInboundFiles();

            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                Cursor.Current = Cursors.WaitCursor;            
            }
        }

        /// <summary>
        /// Get EDI header data
        /// </summary>
        /// <param name="strFileName"></param>
        /// <returns></returns>
        private EDIHeader getEDIHeader(string strFileName)
        {
            foreach (EDIHeader header in arrHeaderData)
            {
                if (header.getFileName().Equals(strFileName))
                    return header;
            }
            return null;
        }

        /// <summary>
        /// Refresh
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            
            // load inboud setting
            getInboundSettingInfo();
            // show all files
            LoadListInboundFiles();
        }

    }

}
