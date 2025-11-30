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
    public partial class frmMappingList : Form
    {
        BHEDI_EDM edm;
        private Boolean InOut;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="inout">true if outbound, false if inbound</param>
        public frmMappingList(Boolean inout)
        {
            InitializeComponent();

            try
            {
                this.InOut = inout;
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
        private void frmMappingList_Load(object sender, EventArgs e)
        {
            try
            {
                loadData();

                colTradingPartnerNo.DataPropertyName = "TradingPartnerNo";
                colTransactionSet.DataPropertyName = "TransactionSetNo";
                colTransactionSet.DisplayMember = "TransactionSetDisplay2";
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Load Data
        /// </summary>
        private void loadData()
        {
            try
            {
                edm = new BHEDI_EDM();
                // 3/31/2013 Phuong changed sort by Trading partner and transaction id
                //Trading Partner
                bdsTradingPartner.DataSource = edm.tblTradingPartners.ToList();

                //Transaction Set
                bdsTransactionSet.DataSource = edm.tblEDITransactionSets.ToList();

                if (InOut == true)
                {
                    //Outbound
                    var query = (from m in edm.tblOutboundMappings
                                 join p in edm.tblTradingPartners on m.TradingPartnerNo_FK equals p.TradingPartnerNo
                                 join t in edm.tblEDITransactionSets on m.TransactionSetNo_FK equals t.TransactionSetNo

                             select new
                             {
                                 TradingPartnerNo = m.TradingPartnerNo_FK,
                                 TransactionSetNo = m.TransactionSetNo_FK,
                                 TradingPartnerName = p.TradingPartnerName,
                                 TransactionID = t.TransactionSetID
                             }).Distinct();
                    dgvTransactionSetList.DataSource = query.OrderBy(m => m.TradingPartnerName).ThenBy(m => m.TransactionID);
                }
                else
                {
                    //Inbound
                    var query = (from m in edm.tblInboundMappings
                                 join p in edm.tblTradingPartners on m.TradingPartnerNo_FK equals p.TradingPartnerNo
                                 join t in edm.tblEDITransactionSets on m.TransactionSetNo_FK equals t.TransactionSetNo

                                 select new
                             {
                                 TradingPartnerNo = m.TradingPartnerNo_FK,
                                 TransactionSetNo = m.TransactionSetNo_FK,
                                 TradingPartnerName = p.TradingPartnerName,
                                 TransactionID = t.TransactionSetID

                             }).Distinct();
                    dgvTransactionSetList.DataSource = query.OrderBy(m => m.TradingPartnerName).ThenBy( m => m.TransactionID);
                }  
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Get list of inbound mapping of selected row
        /// </summary>
        /// <returns></returns>
        public List<tblInboundMapping> GetInboundMappingList()
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                List<tblInboundMapping> mapList = null;

                if (dgvTransactionSetList.CurrentRow != null)
                {
                    DataGridViewRow curRow = this.dgvTransactionSetList.CurrentRow;
                    int tranSetNo = Common.myCInt(curRow.Cells[colTransactionSet.Name].Value);
                    int tradingPartnerNo = Common.myCInt(curRow.Cells[colTradingPartnerNo.Name].Value);

                    mapList = edm.tblInboundMappings.Where(m => m.TradingPartnerNo_FK == tradingPartnerNo && m.TransactionSetNo_FK == tranSetNo).OrderBy(r => r.InboundMappingNo).ToList();
                }

                return mapList;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return null;
            }
            finally
            {
                Cursor.Current = Cursors.Default;
            }
        }

        /// <summary>
        /// Get list of outbound mapping of selected row
        /// </summary>
        /// <returns></returns>
        public List<tblOutboundMapping> GetOutboundMappingList()
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                List<tblOutboundMapping> mapList = null;

                if (dgvTransactionSetList.CurrentRow != null)
                {
                    DataGridViewRow curRow = this.dgvTransactionSetList.CurrentRow;
                    int tranSetNo = Common.myCInt(curRow.Cells[colTransactionSet.Name].Value);
                    int tradingPartnerNo = Common.myCInt(curRow.Cells[colTradingPartnerNo.Name].Value);

                    mapList = edm.tblOutboundMappings.Where(m => m.TradingPartnerNo_FK == tradingPartnerNo && m.TransactionSetNo_FK == tranSetNo).OrderBy(r => r.OutboundMappingNo).ToList();
                }

                return mapList;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return null;
            }
            finally
            {
                Cursor.Current = Cursors.Default;
            }
        }

        /// <summary>
        /// DataGridView data error
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvTransactionSetList_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {

        }

        /// <summary>
        /// Hide columns after data binding
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvTransactionSetList_DataBindingComplete(object sender, DataGridViewBindingCompleteEventArgs e)
        {
            try
            {
                foreach (DataGridViewColumn col in dgvTransactionSetList.Columns)
                {
                    switch (col.Name)
                    {
                        case "colTradingPartnerNo":
                        case "colTransactionSet":
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
        /// Close window on double click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvTransactionSetList_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                this.DialogResult = DialogResult.OK;
                this.Close();
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
