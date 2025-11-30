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
    /// Review SQL Insert Statement and EDI data for inbound & outbound map design
    /// </summary>
    public partial class frmViewSetting : Form
    {
        /// <summary>
        /// define trading no, tsetno and rawdata no
        /// </summary>
        private int TradingPartnerNo_FK = 0;
        private int TransactionSetNo_FK = 0;
        private int TransactionRawDataNo_FK = 0;
        private bool IsInOut = false;

        public frmViewSetting(bool IsInOut,int TradingPartnerNo_FK, int TransactionSetNo_FK,int TransactionRawDataNo_FK)
        {
            InitializeComponent();
            this.IsInOut = IsInOut;
            this.TradingPartnerNo_FK = TradingPartnerNo_FK;
            this.TransactionSetNo_FK = TransactionSetNo_FK;
            this.TransactionRawDataNo_FK = TransactionRawDataNo_FK;

        }

        /// <summary>
        /// exit
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        /// <summary>
        /// Load data
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmViewSetting_Load(object sender, EventArgs e)
        {
            if (IsInOut)
                this.Text = "Review EDI Data";
            else
                this.Text = "Review SQL Query";

            try
            {
                Cursor.Current = Cursors.WaitCursor;
                EDITranslator edi = new EDITranslator();
                ArrayList arrData = null;
                
                // view SQL
                if (!IsInOut)
                    arrData = edi.reviewSQLStatement(TradingPartnerNo_FK, TransactionSetNo_FK, TransactionRawDataNo_FK);
                else // view EDI data
                    arrData = edi.reviewEDIData(TradingPartnerNo_FK, TransactionSetNo_FK, TransactionRawDataNo_FK);

                if (arrData.Count == 0)
                    txtData.Text = "No data for review";
                else
                {
                    foreach (string str in arrData)
                    {
                        txtData.Text += str + Environment.NewLine;
                    }

                    if (!IsInOut)
                    {
                        highLightText("INSERT INTO");
                        highLightText("VALUES");
                        highLightText("UPDATE");
                        highLightText(" SET ");
                        highLightText("WHERE");
                        txtData.SelectionLength = 0;
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
        /// Highlight Text
        /// </summary>
        /// <param name="searchString"></param>
        private void highLightText(string searchString)
        {
            int len = this.txtData.TextLength;
            int index = 0;
            int lastIndex = this.txtData.Text.LastIndexOf(searchString);

            while (index < lastIndex)
            {
                this.txtData.Find(searchString, index, len, RichTextBoxFinds.None);
                this.txtData.SelectionColor = Color.Blue;
                index = this.txtData.Text.IndexOf(searchString, index) + 1;
            }
        }
    }
}
