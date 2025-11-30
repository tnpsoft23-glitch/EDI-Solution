using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.Metadata.Edm;
using System.Collections;
using System.Data.Objects;
using CrystalDecisions.CrystalReports.Engine;
using BHEDI.Report;
using System.IO;

namespace BHEDI
{
    /// <summary>
    /// Inbound Map Design
    /// </summary>
    public partial class frmInboundMapDesign : Form
    {
        BHEDI_EDM edm;
        private int TradingPartnerNo_FK = 0;
        private int TransactionSetNo_FK = 0;
        private int TransactionRawDataNo_FK = 0;
        private string[] aryRawData;
        private string strRawData = "";
        private string strDataElementDelimiter = "";
        private string strSegmentTerminator = "";

        private System.Collections.ObjectModel.ReadOnlyCollection<System.Data.Metadata.Edm.EntityType> edmObjectList;

        public frmInboundMapDesign(int TradingPartnerNo = 0, int TransactionSetNo = 0, int TransactionRawDataNo = 0)
        {
            InitializeComponent();

            this.TradingPartnerNo_FK = TradingPartnerNo;
            this.TransactionSetNo_FK = TransactionSetNo;
            this.TransactionRawDataNo_FK = TransactionRawDataNo;
        }

        /// <summary>
        /// Form Closing
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmInboundMapDesign_FormClosing(object sender, FormClosingEventArgs e)
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
        /// Load Form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmInboundMapDesign_Load(object sender, EventArgs e)
        {
            btnSave.Enabled = false;
            rbtViewEntry.Checked = true;

            //load data
            loadDataCombo();
            loadData();
            toggleControl(false);
        }

        /// <summary>
        /// Copy Inbound Mapping
        /// </summary>
        /// <param name="inboundMappingNo"></param>
        private void copyInboundMapping(tblInboundMapping copyMapping)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                tblInboundMapping newMapping = new tblInboundMapping();
                newMapping.TradingPartnerNo_FK = TradingPartnerNo_FK;
                newMapping.TransactionSetNo_FK = TransactionSetNo_FK;
                newMapping.SegmentNo_FK = copyMapping.SegmentNo_FK;
                newMapping.Postion = copyMapping.Postion;
                newMapping.TableName = copyMapping.TableName;
                newMapping.FieldName = copyMapping.FieldName;
                newMapping.CommitDBAfterRead = copyMapping.CommitDBAfterRead;
                newMapping.Note = copyMapping.Note;
                newMapping.TransactionRawDataNo_FK = TransactionRawDataNo_FK;
                edm.AddTotblInboundMappings(newMapping);
                edm.SaveChanges();

                //Copy Operator
                foreach (tblOperatorInboundMapping copyOperator in copyMapping.tblOperatorInboundMappings)
                {
                    tblOperatorInboundMapping newOperator = new tblOperatorInboundMapping();

                    newOperator.OperatorNo_FK = copyOperator.OperatorNo_FK;
                    newOperator.OperatorParameter = copyOperator.OperatorParameter;
                    newOperator.InboundMappingNo_FK = newMapping.InboundMappingNo;
                    edm.AddTotblOperatorInboundMappings(newOperator);
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
        /// Get Raw Data
        /// </summary>
        /// <returns></returns>
        private String getRawData(int Position, string segmentCode)
        {
            try
            {
                String rawData = "";

                string strSegment = Array.Find(aryRawData, r => r.StartsWith(segmentCode));

                if (strSegment != null)
                {
                    string[] aryElementList = strSegment.Split(strDataElementDelimiter.ToCharArray());

                    if (aryElementList.Count() > Position)
                    {
                        rawData = aryElementList[Position];
                    }
                }

                return rawData;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return "";
            }
        }

        /// <summary>
        /// Load data
        /// </summary>
        private void loadData()
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                var qry = (from tp in edm.tblTradingPartners
                           join tr in edm.tblEDITrasactionRawDatas on tp.TradingPartnerNo equals tr.TradingPartnerNo_FK
                           join st in edm.tblSegmentTerminators on tp.SegmentTerminator equals st.SegmentTerminatorNo
                           join de in edm.tblSegmentTerminators on tp.DataElementDelimiter equals de.SegmentTerminatorNo
                           where tp.TradingPartnerNo == this.TradingPartnerNo_FK && tr.TransactionRawDataNo == this.TransactionRawDataNo_FK
                           select new
                           {
                               RawData = tr.RawData,
                               SegmentTerminator = st.Terminator,
                               DataElementDelimiter = de.Terminator
                           }).FirstOrDefault();

                aryRawData = qry.RawData.Split(qry.SegmentTerminator.ToCharArray()).Select(t => t.Trim()).ToArray();
                strSegmentTerminator = qry.SegmentTerminator;
                strDataElementDelimiter = qry.DataElementDelimiter;

                // 3/30/2017 Phuong changed view data by entry , segment and table


                IQueryable<tblInboundMapping> result = null;
                
                if (rbtViewEntry.Checked) // view by entry mapping
                    result = edm.tblInboundMappings.Where(im =>
                                                                                    im.TransactionSetNo_FK == this.TransactionSetNo_FK &
                                                                                    im.TradingPartnerNo_FK == this.TradingPartnerNo_FK &
                                                                                    im.TransactionRawDataNo_FK == this.TransactionRawDataNo_FK).OrderBy(r => r.InboundMappingNo);

                else if (rbtViewSegment.Checked)
                    result = edm.tblInboundMappings.Where(im =>
                                                                                    im.TransactionSetNo_FK == this.TransactionSetNo_FK &
                                                                                    im.TradingPartnerNo_FK == this.TradingPartnerNo_FK &
                                                                                    im.TransactionRawDataNo_FK == this.TransactionRawDataNo_FK).OrderBy(r => r.SegmentNo_FK);

                else if (rbtViewTable.Checked)

                    result = edm.tblInboundMappings.Where(im =>
                                                                                     im.TransactionSetNo_FK == this.TransactionSetNo_FK &
                                                                                     im.TradingPartnerNo_FK == this.TradingPartnerNo_FK &
                                                                                     im.TransactionRawDataNo_FK == this.TransactionRawDataNo_FK).OrderBy(r => r.TableName);


                ObjectQuery query = (ObjectQuery)result;

                this.bdsInboundMapping.DataSource = query.Execute(MergeOption.AppendOnly);
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
        /// Load Data Combobox
        /// </summary>
        private void loadDataCombo()
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                ////Bind Data
                edm = new BHEDI_EDM();

                // Get EDM Object lists
                MetadataWorkspace mw = edm.MetadataWorkspace;

                edmObjectList = mw.GetItems<EntityType>(DataSpace.CSpace);

                List<String> tblList = new List<String>();

                //Insert table name into array
                foreach (var i in edmObjectList)
                {
                    if (i.Name.StartsWith("tblEDI_"))
                    {
                        tblList.Add(i.Name);
                    }
                }

                //List Table Names
                cboTable.DataSource = tblList.ToList();

                //Get Transaction Set ID
                tblEDITransactionSet curTransactionSet = edm.tblEDITransactionSets.Where(ts => ts.TransactionSetNo == this.TransactionSetNo_FK).FirstOrDefault();
                String transactionSetID = curTransactionSet.TransactionSetID;

                //Segment
                ArrayList arySegment = new ArrayList();
                arySegment.Add(new myCombobxItem(" ", null));

                var query = (from tp in edm.tblTradingPartners
                             join ver in edm.tblEDIVersions on tp.StandardVersion equals ver.EDIVersionNo
                             join es in edm.tblEDITransactionStructures on ver.Version equals es.Version
                             join seg in edm.tblEDISegments on es.SegmentCode equals seg.SegmentCode
                             join ts in edm.tblEDITransactionSets on es.TransactionSetID equals ts.TransactionSetID
                             where tp.TradingPartnerNo == this.TradingPartnerNo_FK && es.TransactionSetID == transactionSetID && ver.EDITypeNo_FK == ts.EDITypeNo_FK
                             select new
                             {
                                 SegmentNo = seg.SegmentNo,
                                 SegmentCode = seg.SegmentCode
                             }
                            );

                if (query.ToList().Count() == 0)
                {
                    foreach (tblEDISegment curSegment in edm.tblEDISegments.OrderBy(it => it.SegmentCode))
                    {
                        arySegment.Add(new myCombobxItem(curSegment.SegmentCode, curSegment.SegmentNo));
                    }
                }
                else
                {
                    foreach (var curSegment in query.ToList().Distinct().OrderBy(it => it.SegmentCode))
                    {
                        arySegment.Add(new myCombobxItem(curSegment.SegmentCode, curSegment.SegmentNo));
                    }
                }

                bdsEDISegment.DataSource = arySegment;
                cboSegment.DisplayMember = "Description";
                cboSegment.ValueMember = "Value";
                colSegmentNoFK.DisplayMember = "Description";
                colSegmentNoFK.ValueMember = "Value";

                //Operator Name
                bdsOperator.DataSource = edm.tblOperators.OrderBy(o => o.OperatorName).ToList();
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
                //Clear dirty rows
                foreach (ObjectStateEntry entry in edm.ObjectStateManager.GetObjectStateEntries(EntityState.Modified | EntityState.Added))
                {
                    if (entry.EntitySet.Name == "tblOperatorInboundMappings")
                    {
                        tblOperatorInboundMapping curOpt = (tblOperatorInboundMapping)entry.Entity;

                        tblInboundMapping curInbound = curOpt.tblInboundMapping;

                        if (curInbound == null)
                        {
                            edm.tblOperatorInboundMappings.DeleteObject(curOpt);
                        }
                    }
                }

                if (edm.ObjectStateManager.GetObjectStateEntries(EntityState.Modified | EntityState.Deleted | EntityState.Added).Any() == true)
                {
                    MessageBoxButtons msgButton = IsClosing ? MessageBoxButtons.YesNoCancel : MessageBoxButtons.OKCancel;

                    DialogResult AskPrompt = MessageBox.Show("Do you want to save the changes?", Common.SYSTEM_NAME, msgButton, MessageBoxIcon.Question);

                    switch (AskPrompt)
                    {

                        case System.Windows.Forms.DialogResult.Yes:
                        case System.Windows.Forms.DialogResult.OK:
                            edm.SaveChanges();
                            IsSaved = true;
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
        /// Enable/Disable Controls based on Edit/Save action
        /// </summary>
        private void toggleControl(Boolean isEnabled = false)
        {
            try
            {
                //Change button
                btnDelete.Enabled = isEnabled;
                btnNew.Enabled = isEnabled;
                btnCopy.Enabled = isEnabled;
                btnCopyFromList.Enabled = isEnabled;
                btnDataElement.Enabled = isEnabled;
                btnPrint.Enabled = !btnSave.Enabled;
                btnSQLView.Enabled = !btnSave.Enabled;
                btnView.Enabled = !btnSave.Enabled;
                rbtView.Enabled = !btnSave.Enabled;

                //Change DataGridView
                dgvInbound.ReadOnly = !isEnabled;
                dgvOperator.ReadOnly = !isEnabled;
                colDeleteOperator.Visible = isEnabled;

                //General tab
                txtPosition.ReadOnly = !isEnabled;
                txtNote.Enabled = isEnabled;
                cboSegment.Enabled = isEnabled;
                cboTable.Enabled = isEnabled;
                cboField.Enabled = isEnabled;
                chkCommit.Enabled = isEnabled;
                chkIsInsert.Enabled = isEnabled;

            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Go to previous list
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnPrevious_Click(object sender, EventArgs e)
        {
            try
            {
                if (dgvInbound.Rows.Count > 0)
                {
                    if ((dgvInbound.CurrentRow.Index - 1) >= 0)
                    {
                        int rowIndex = dgvInbound.CurrentRow.Index;
                        dgvInbound.Rows[rowIndex].Selected = false;
                        dgvInbound.Rows[rowIndex - 1].Selected = true;
                        bdsInboundMapping.MovePrevious();
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
        /// Go to next list
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnNext_Click(object sender, EventArgs e)
        {
            try
            {
                if (dgvInbound.Rows.Count > 0)
                {
                    if ((dgvInbound.CurrentRow.Index + 1) < dgvInbound.Rows.Count)
                    {
                        dgvInbound.Rows[dgvInbound.CurrentRow.Index].Selected = false;
                        dgvInbound.Rows[dgvInbound.CurrentRow.Index + 1].Selected = true;
                        bdsInboundMapping.MoveNext();
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
        /// Create a new setting
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnNew_Click(object sender, EventArgs e)
        {
            try
            {
                bdsInboundMapping.AddNew();
                cboField.DataSource = null;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Copy a setting
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnCopy_Click(object sender, EventArgs e)
        {
            try
            {
                if (bdsInboundMapping.Current != null)
                {
                    tblInboundMapping curInbound = (tblInboundMapping)bdsInboundMapping.Current;
                    copyInboundMapping(curInbound);

                    loadData();
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Copy from other outbound setting
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnCopyFromList_Click(object sender, EventArgs e)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                frmMappingList obj = new frmMappingList(false);
                obj.StartPosition = FormStartPosition.Manual;
                obj.Location = new Point((this.ClientSize.Width - obj.Width) / 2, (this.ClientSize.Height - obj.Height) / 2);

                if (obj.ShowDialog() == DialogResult.OK)
                {
                    List<tblInboundMapping> mapList = obj.GetInboundMappingList();

                    foreach (tblInboundMapping curMap in mapList.OrderBy(i => i.InboundMappingNo))
                    {
                        copyInboundMapping(curMap);
                    }

                    loadData();
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
        /// View SQL insert query
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSQLView_Click(object sender, EventArgs e)
        {
            try
            {
                frmViewSetting obj = new frmViewSetting(false, this.TradingPartnerNo_FK, this.TransactionSetNo_FK, this.TransactionRawDataNo_FK);

                obj.StartPosition = FormStartPosition.Manual;
                obj.Location = new Point((this.ClientSize.Width - obj.Width) / 2, (this.ClientSize.Height - obj.Height) / 2);

                obj.Show();
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Edit a setting
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
        /// Delete a setting
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Are you sure you want to delete selected inbound map?", Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
                {
                    tblInboundMapping curMap = (tblInboundMapping)bdsInboundMapping.Current;

                    //Delete Operator
                    foreach (tblOperatorInboundMapping curOperator in curMap.tblOperatorInboundMappings.ToList())
                    {
                        edm.tblOperatorInboundMappings.DeleteObject(curOperator);
                    }

                    edm.tblInboundMappings.DeleteObject(curMap);
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Save settings
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                //Change Control Toggle
                if (saveData() == true)
                {
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
        /// Exit Form
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
        /// Print Inbound mapping setting
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnPrint_Click(object sender, EventArgs e)
        {
            try
            {
                rptInboundSetting rpt = new rptInboundSetting();
                
                //Set Filter
                rpt.SetParameterValue("TradingPartnerNo", TradingPartnerNo_FK);
                rpt.SetParameterValue("TransactionSetNo", TransactionSetNo_FK);
                rpt.SetParameterValue("TransactionRawDataNo", TransactionRawDataNo_FK);

                frmReportViewer rptViewer = new frmReportViewer(rpt);
                rptViewer.Show();
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
        }

        /// <summary>
        /// Show sample data element
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnDataElement_Click(object sender, EventArgs e)
        {
            try
            {
                if (bdsInboundMapping.Current != null)
                {
                    tblInboundMapping curInbound = (tblInboundMapping)bdsInboundMapping.Current;

                    if (curInbound.SegmentNo_FK != null)
                    {
                        frmDataElement obj = new frmDataElement(false, this.TradingPartnerNo_FK, this.TransactionRawDataNo_FK, curInbound.SegmentNo_FK, "", curInbound.Postion, strRawData);

                        obj.StartPosition = FormStartPosition.Manual;
                        obj.Location = new Point((this.ClientSize.Width - obj.Width) / 2, (this.ClientSize.Height - obj.Height) / 2);

                        if (obj.ShowDialog() == DialogResult.OK)
                        {
                            curInbound.Postion = obj.GetPosition() + 1;
                            txtRawData.Text = obj.GetRawData();
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
        /// Export Inbound Mapping To CSV File
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnExport_Click(object sender, EventArgs e)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;
                
                //Create Directory if does not exists
                if(!Directory.Exists(Common.MAP_EXPORT_PATH)) 
                {
                    Directory.CreateDirectory(Common.MAP_EXPORT_PATH);
                }

                String strTradingPartnerName = edm.tblTradingPartners.First(t => t.TradingPartnerNo == TradingPartnerNo_FK).TradingPartnerName;
                String strTransactionSet = edm.tblEDITransactionSets.First(t => t.TransactionSetNo == TransactionSetNo_FK).TransactionSetID;

                String strFileName = "IN_MAP_" + strTradingPartnerName + "_" + strTransactionSet + "_" + DateTime.Now.ToString("yyyyMMddHmmss") + ".CSV";
                
                var csv = new StringBuilder();

                //Loop Inbound map data
                foreach (var result in edm.s_InboundMapping_ExportToCSV(TradingPartnerNo_FK, TransactionSetNo_FK, TransactionRawDataNo_FK).ToList())
                {

                    var newLine = string.Format("{0},{1},{2},{3},{4},{5},\"{6}\",{7},{8},{9},\"{10}\",{11},{12},{13},{14},{15},\"{16}\"{17}",
                                                Common.writeCSVEntry(result.SegmentCode), result.Postion, Common.writeCSVEntry(result.TableName), Common.writeCSVEntry(result.FieldName), 
                                                result.CommitDBAfterRead, result.isInsert, result.Note, result.NumDist, result.LineNum, 
                                                Common.writeCSVEntry(result.OperatorCode), result.OperatorParameter, Common.writeCSVEntry(result.TransactionDate.ToString()), 
                                                Common.writeCSVEntry(result.TransactionKey), result.InOut, Common.writeCSVEntry(result.InterchangeControlNum), 
                                                Common.writeCSVEntry(result.GroupControlNum), result.RawData, Environment.NewLine);
                    csv.Append(newLine);
                }

                //Export to File
                File.WriteAllText(Common.MAP_EXPORT_PATH + strFileName, csv.ToString(), Encoding.ASCII);

                MessageBox.Show("CSV file has been successfully exported.", Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Information);
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
        /// Import Inbound Mapping
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnImport_Click(object sender, EventArgs e)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                // Open file dialog box
                OpenFileDialog ofd = new OpenFileDialog();
  
                // Set filter option
                ofd.Filter = "CSV files (*.csv)|*.csv";
                ofd.InitialDirectory = Common.MAP_EXPORT_PATH;
                ofd.Multiselect = false;

                if (ofd.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                {
                    using (CsvReader reader = new CsvReader(@ofd.FileName))
                    {
                        tblEDITrasactionRawData newRawData = new tblEDITrasactionRawData();
                        TransactionRawDataNo_FK = newRawData.TransactionRawDataNo;

                        newRawData.TradingPartnerNo_FK = TradingPartnerNo_FK;
                        newRawData.TransactionSetNo_FK = TransactionSetNo_FK;
                        tblInboundMapping newInboundMap = null;

                        //Read each line
                        foreach (string[] values in reader.RowEnumerator)
                        {
                            String strSegmentCode = values[0];
                            int intPosition = Common.myCInt(values[1]);
                            String strTableName = values[2];
                            String strFieldName = values[3];
                            Boolean blnCommitDBAfterRead = Common.myCBool(values[4]);
                            Boolean blnIsInsert = Common.myCBool(values[5]);
                            String strNote = values[6];
                            int intNumDist = Common.myCInt(values[7]);
                            int intLineNum = Common.myCInt(values[8]);
                            String strOperatorCode = values[9];
                            String strOperatorParameter = values[10];
                            DateTime dtTransactionDate = Common.myCDate(values[11]);
                            String strTransactionKey = values[12];
                            Boolean blnInOut = Common.myCBool(values[13]);
                            String strInterchangeControlNum = values[14];
                            String strGroupControlNum = values[15];

                            strRawData = values[16].Replace("\n", strSegmentTerminator);
                            newRawData.TransactionDate = DateTime.Now;
                            newRawData.TransactionKey = strTransactionKey;
                            newRawData.InOut = blnInOut;
                            newRawData.InterchangeControlNum = strInterchangeControlNum;
                            newRawData.GroupControlNum = strGroupControlNum;
                            newRawData.RawData = strRawData;
                            newRawData.XMLData = " ";

                            if (intLineNum == 1)
                            {
                                //Create new Inbound Mapping
                                newInboundMap = new tblInboundMapping();

                                newInboundMap.TradingPartnerNo_FK = TradingPartnerNo_FK;
                                newInboundMap.TransactionSetNo_FK = TransactionSetNo_FK;

                                newInboundMap.Postion = intPosition;
                                newInboundMap.TableName = strTableName;
                                newInboundMap.FieldName = strFieldName;
                                newInboundMap.CommitDBAfterRead = blnCommitDBAfterRead;
                                newInboundMap.IsInsert = blnIsInsert;
                                newInboundMap.Note = strNote;

                                newRawData.tblInboundMappings.Add(newInboundMap);

                                if (strSegmentCode != "")
                                {
                                    if (edm.tblEDISegments.Any(s => s.SegmentCode.Equals(strSegmentCode)) == true)
                                    {
                                        newInboundMap.SegmentNo_FK = edm.tblEDISegments.FirstOrDefault(s => s.SegmentCode.Equals(strSegmentCode)).SegmentNo;
                                    }
                                }
                            }

                            if (newInboundMap != null)
                            {
                                if (strOperatorCode != "" || strOperatorParameter != "")
                                {
                                    //Create Operator data
                                    tblOperatorInboundMapping newOperator = new tblOperatorInboundMapping();
                                    newOperator.OperatorParameter = strOperatorParameter;

                                    if (strOperatorCode != "")
                                    {
                                        if (edm.tblOperators.Any(o => o.OperatorCode.Equals(strOperatorCode)) == true)
                                        {
                                            newOperator.OperatorNo_FK = edm.tblOperators.FirstOrDefault(o => o.OperatorCode.Equals(strOperatorCode)).OperatorNo;
                                        }
                                    }

                                    newInboundMap.tblOperatorInboundMappings.Add(newOperator);
                                }
                            } 
                        }

                        this.bdsInboundMapping.DataSource = newRawData.tblInboundMappings;
                        edm.tblEDITrasactionRawDatas.AddObject(newRawData);

                        aryRawData = strRawData.Split(strSegmentTerminator.ToCharArray()).Select(t => t.Trim()).ToArray();
                    }
                }
               
                // Change to Edit Mode
                btnEdit.Enabled = false;
                btnSave.Enabled = true;

                toggleControl(true);
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
        /// Hide column after data binding
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvOperator_DataBindingComplete(object sender, DataGridViewBindingCompleteEventArgs e)
        {
            try
            {
                dgvOperator.Columns[0].Visible = false;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Control button action on Operator datagridview
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvOperator_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                switch (dgvOperator.Columns[e.ColumnIndex].Name)
                {
                    case "colDeleteOperator":
                        //Delete Operator
                        if (MessageBox.Show("Are you sure you want to delete selected operator?", Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
                        {
                           bdsInboundMapping.ResetBindings(false);

                          tblOperatorInboundMapping curOperator = (tblOperatorInboundMapping)bdsOperatorInboundMapping.Current;

                          if (curOperator != null)
                          {
                              edm.tblOperatorInboundMappings.DeleteObject(curOperator);
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

        /// <summary>
        /// Set image for datagridview button columns
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvOperator_CellPainting(object sender, DataGridViewCellPaintingEventArgs e)
        {
            try
            {
                Bitmap bmpView;

                if (e.ColumnIndex > 0 && e.RowIndex >= 0)
                {
                    switch (dgvOperator.Columns[e.ColumnIndex].Name)
                    {

                        case "colDeleteOperator":
                            e.Paint(e.CellBounds, DataGridViewPaintParts.All);
                            bmpView = BHEDI.Properties.Resources.file_exit;
                            e.Graphics.DrawImage(bmpView, e.CellBounds.Left + 2, e.CellBounds.Top + 3, 15, 15);
                            e.Handled = true;
                            break;

                        default:
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
        /// Data Error
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvOperator_DataError(object sender, DataGridViewDataErrorEventArgs e)
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
        /// Data Error
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvInbound_DataError(object sender, DataGridViewDataErrorEventArgs e)
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
        /// Create a new inbound mapping
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void bdsInboundMapping_AddingNew(object sender, AddingNewEventArgs e)
        {
            try
            {
                tblInboundMapping newInbound = new tblInboundMapping();

                newInbound.TradingPartnerNo_FK = this.TradingPartnerNo_FK;
                newInbound.TransactionSetNo_FK = this.TransactionSetNo_FK;
                newInbound.TransactionRawDataNo_FK = this.TransactionRawDataNo_FK;
                newInbound.Postion = 1;

                e.NewObject = newInbound;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Load Raw Data when Inbound Mapping binding changes
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void bdsInboundMapping_CurrentChanged(object sender, EventArgs e)
        {
            try
            {
                if (bdsInboundMapping.Current != null)
                {
                    tblInboundMapping curMap = (tblInboundMapping)bdsInboundMapping.Current;

                    if (Common.myCInt(curMap.SegmentNo_FK) != 0 && Common.myCInt(curMap.Postion) != 0)
                    {
                        txtRawData.Text = getRawData(curMap.Postion, cboSegment.Text);
                    }
                    else
                    {
                        txtRawData.Text = "";
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
        /// Clear field name on backspace keydown
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cboTable_KeyDown(object sender, KeyEventArgs e)
        {
            try
            {
                if (e.KeyCode == Keys.Back || e.KeyCode == Keys.Delete)
                {
                    tblInboundMapping curInbound = (tblInboundMapping)bdsInboundMapping.Current;

                    if (bdsInboundMapping.Current != null)
                    {
                        curInbound.FieldName = "";
                        cboField.DataSource = null;
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
        /// Load column names based on selected table
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cboTable_SelectionChangeCommitted(object sender, EventArgs e)
        {
            try
            {
                string tableName = Common.myCStr(cboTable.SelectedValue);
                tblInboundMapping curInbound = (tblInboundMapping)bdsInboundMapping.Current;

                if (bdsInboundMapping.Current != null)
                {
                    if (tableName != null)
                    {
                        EntityType entity = edmObjectList.Where(t => t.Name == tableName).First();
                        cboField.DataSource = entity.Members.ToList();
                        
                        curInbound.TableName = tableName;
                        curInbound.FieldName = "";
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
        /// Load column names when drop down list is shown
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cboField_DropDown(object sender, EventArgs e)
        {
            try
            {
                tblInboundMapping curInbound = (tblInboundMapping)bdsInboundMapping.Current;
                string tableName = Common.myCStr(curInbound.TableName);

                if (bdsInboundMapping.Current != null)
                {
                    if (tableName != "")
                    {
                        EntityType entity = edmObjectList.Where(t => t.Name == tableName).First();
                        cboField.DataSource = entity.Members.ToList();
                        cboField.Text = curInbound.FieldName;
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
        /// Prevent Foreign Key Error
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvOperator_UserDeletingRow(object sender, DataGridViewRowCancelEventArgs e)
        {
            e.Cancel = true;
        }

        /// <summary>
        /// View data by type
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnView_Click(object sender, EventArgs e)
        {
            loadData();
        }

    }
}
