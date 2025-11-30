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
    public partial class frmEDITransactionSet : Form
    {
        BHEDI_EDM edm;
        tblEDITransactionSet curEDITransactionSet;

        public frmEDITransactionSet()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Load form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmEDITransactionSet_Load(object sender, EventArgs e)
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
                // Phuong 03/30/2017 changed sort by transactio id, view in out
                bdsEDITransactionSet.DataSource = edm.tblEDITransactionSets.OrderBy(my => my.TransactionSetID).ToList();
                lbEDITransactionSet.DisplayMember = "TransactionSetDisplay2";
                lbEDITransactionSet.ValueMember = "TransactionSetNo";

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
                curEDITransactionSet = (tblEDITransactionSet)bdsEDITransactionSet.Current;

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
        public int GetTransactionSetNo()
        {
            int transactionSetNo = curEDITransactionSet.TransactionSetNo;

            return transactionSetNo;
        }

        /// <summary>
        /// Get In/Out
        /// </summary>
        /// <returns>true if Out; false if In</returns>
        public Boolean GetInOut()
        {
                Boolean InOut = curEDITransactionSet.InOut;

                return InOut;
        }
    }
}
