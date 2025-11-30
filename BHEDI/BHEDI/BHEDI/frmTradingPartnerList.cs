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
    /// Show EDI Transaction Sets
    /// </summary>
    public partial class frmTradingPartnerList : Form
    {
        BHEDI_EDM edm;
        tblTradingPartner curTradingPartner;

        public frmTradingPartnerList()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Load form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmTradingPartnerList_Load(object sender, EventArgs e)
        {
            loadData();
        }

        /// <summary>
        /// Load data
        /// </summary>
        private void loadData()
        {
            try
            {
                ////Bind Data
                edm = new BHEDI_EDM();
                bdsTradingPartner.DataSource = edm.tblTradingPartners.OrderBy(my => my.TradingPartnerName).ToList();
                cmbTradingList.DisplayMember = "TradingPartnerName";
                cmbTradingList.ValueMember = "TradingPartnerNo";

            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Close form on mouse double click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void lbEDITransactionSet_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            try
            {
                curTradingPartner = (tblTradingPartner)bdsTradingPartner.Current;

                this.DialogResult = DialogResult.OK;
                this.Close();
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Get TransactionSetNo
        /// </summary>
        /// <returns>the transaction set no</returns>
        public int GetTradingPartnerNo()
        {
            int tradingPartnerNo = curTradingPartner.TradingPartnerNo;

            return tradingPartnerNo;
        }

    }
}
