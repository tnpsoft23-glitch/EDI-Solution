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
    public partial class frmImportOutboundFile : Form
    {
        /// <summary>
        /// Inbound setting 
        /// </summary>
        private ArrayList arrOutboundSetting = new ArrayList();

        /// <summary>
        /// Header Data
        /// </summary>
        private ArrayList arrHeaderData = new ArrayList();
        
        public frmImportOutboundFile()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Get Outbound setting infor
        /// </summary>
        private void getOutboundSettingInfo()
        {
            try
            {
                arrOutboundSetting.Clear();

                using (var edm = new BHEDI_EDM())
                {
                    var objTbl = edm.tblInboundOutboundSettings.Where(s => s.InOut == true);
                    foreach (var objRow in objTbl)
                    {
                        if (!objRow.SettingName.Contains("997"))
                        arrOutboundSetting.Add(objRow);
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
        private void LoadListOutboundFiles()
        {
            try
            {

                // reset grid
                dgvFile.Rows.Clear();
                arrHeaderData.Clear();

                // EDITranslator
                EDITranslator edi = new EDITranslator();

                // no setting yet - default setting
                if (arrOutboundSetting.Count == 0)
                {
                    if (!Directory.Exists(Common.OUT_PATH))
                        Directory.CreateDirectory(Common.OUT_PATH);

                    // Transfer one XML that contain many shipment data to many XML files that contain one shipment data only
                    Common.transferOneXMLToManyXML(Common.OUT_PATH);
                    
                    string[] files = Directory.GetFiles(Common.OUT_PATH);

                    foreach (string file in files)
                    {
                        XMLHeader header = edi.getXMLHeaderData(file);
                        if (header != null)
                        {
                            arrHeaderData.Add(header);
                            dgvFile.Rows.Add(true, file, header.getTSet(), header.getSenderQual(), header.getSenderID(), header.getRereiverQual(), header.getReceiverID(), true, true, true);
                        }
                     }


                }

                else
                {
                    foreach (tblInboundOutboundSetting row in arrOutboundSetting)
                    {

                        if (Directory.Exists(row.Path))
                        {
                            // Transfer one XML that contain many shipment data to many XML files that contain one shipment data only
                            Common.transferOneXMLToManyXML(row.Path);
                            
                            string[] files = Directory.GetFiles(row.Path);
                            foreach (string file in files)
                            {
                                XMLHeader header = edi.getXMLHeaderData(file);
                                if (header != null)
                                {
                                    arrHeaderData.Add(header);
                                    dgvFile.Rows.Add(true, file, header.getTSet(), header.getSenderQual(), header.getSenderID(), header.getRereiverQual(), header.getReceiverID(), row.IsDelete, row.IsArchive, row.IsCreate);
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
        private void frmImportOutboundFile_Load(object sender, EventArgs e)
        {
            // load outboud setting
            getOutboundSettingInfo();
            // show all files
            LoadListOutboundFiles();
        }

        /// <summary>
        /// Refresh
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            // load outboud setting
            getOutboundSettingInfo();
            // show all files
            LoadListOutboundFiles();
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
        /// Import XML file
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
                        XMLHeader header = getXMLHeader(Common.myCStr(row.Cells["txtCol2"].Value));

                        if (header != null)
                        {
                            edi.importXMLOutboundData(header, Common.myCBool(row.Cells["colIsDelete"].Value), Common.myCBool(row.Cells["colIsArchive"].Value), Common.myCBool(row.Cells["colIsCreate"].Value));

                        }

                    }
                }

                // refresh data
                // load outboud setting
                getOutboundSettingInfo();
                // show all files
                LoadListOutboundFiles();
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
        /// Get XML header data
        /// </summary>
        /// <param name="strFileName"></param>
        /// <returns></returns>
        private XMLHeader getXMLHeader(string strFileName)
        {
            foreach (XMLHeader header in arrHeaderData)
            {
                if (header.getFileName().Equals(strFileName))
                    return header;
            }
            return null;
        }
    }
}
