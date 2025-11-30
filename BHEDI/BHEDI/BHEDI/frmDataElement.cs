using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.IO;
using System.Xml;
using System.Windows.Forms;
using System.Collections;

namespace BHEDI
{
    /// <summary>
    /// Show Data Element List
    /// </summary>
    public partial class frmDataElement : Form
    {
        BHEDI_EDM edm;
        private Boolean InOut;
        private int TradingPartnerNo_FK = 0;
        private int TransactionRawDataNo_FK = 0;
        private int? SegmentNo_FK = 0;
        private string XMLPathField = "";
        private int Position = 0;
        private string strRawXMLData = "";

        /// <summary>
        /// 
        /// </summary>
        /// <param name="inout">true if outbound, false if inbound</param>
        /// <param name="TradingPartnerNo">trading partner no</param>
        /// <param name="TransactionRawDataNo">transaction raw data no</param>
        /// <param name="SegmentNo">segment no</param>
        /// <param name="XMLPathField">xml path field</param>
        /// <param name="PositionNo">position no</param>
        public frmDataElement(Boolean inout, int trading_partner_no = 0, int transaction_raw_no = 0, int? segment_no = 0, string xml_field = "", int position_no = 0, string raw_xml_data = "")
        {
            InitializeComponent();

            try
            {
                this.InOut = inout;
                this.TradingPartnerNo_FK = trading_partner_no;
                this.TransactionRawDataNo_FK = transaction_raw_no;
                this.SegmentNo_FK = segment_no;
                this.XMLPathField = xml_field;
                this.Position = position_no;
                this.strRawXMLData = raw_xml_data;
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
        private void frmDataElement_Load(object sender, EventArgs e)
        {
            try
            {
                edm = new BHEDI_EDM();

                if (this.InOut == false)
                {
                    lbDataElement.Visible = true;
                    loadInboundDataElement();
                }
                else
                {
                    lbXMLData.Visible = true;
                    loadOutboundDataElement();
                    this.Width = Width * 2;
                }
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Load data
        /// </summary>
        private void loadInboundDataElement()
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                //Bind data
                tblEDITrasactionRawData curEDIRawData = edm.tblEDITrasactionRawDatas.Where(tr => tr.TransactionRawDataNo == this.TransactionRawDataNo_FK).FirstOrDefault();
                tblTradingPartner curTradingParnter = edm.tblTradingPartners.Where(tp => tp.TradingPartnerNo == this.TradingPartnerNo_FK).FirstOrDefault();
                tblSegmentTerminator curSegmentTerminator = edm.tblSegmentTerminators.Where(st => st.SegmentTerminatorNo == curTradingParnter.SegmentTerminator).FirstOrDefault();
                tblSegmentTerminator curDataElementDelimiter = edm.tblSegmentTerminators.Where(st => st.SegmentTerminatorNo == curTradingParnter.DataElementDelimiter).FirstOrDefault();
                tblEDISegment curEDISegment = edm.tblEDISegments.Where(s => s.SegmentNo == this.SegmentNo_FK).FirstOrDefault();
                string[] rawData;

                //Split raw data by segment terminator
                if (strRawXMLData != "")
                {
                    //Set xml data value if transaction is created by import function
                    rawData = strRawXMLData.Split(curSegmentTerminator.Terminator.ToCharArray()).Select(t => t.Trim()).ToArray();
                }
                else
                {
                    rawData = curEDIRawData.RawData.Split(curSegmentTerminator.Terminator.ToCharArray()).Select(t => t.Trim()).ToArray();
                }

                string strSegment = Array.Find(rawData, r => r.StartsWith(curEDISegment.SegmentCode));

                //Split segment by sub element sep
                if (strSegment != null)
                {
                    string[] arrRawElementList = strSegment.Split(curDataElementDelimiter.Terminator.ToCharArray());

                    ArrayList aryElementList = new ArrayList();

                    for (int i = 0; i < arrRawElementList.Length; i++)
                    {
                        aryElementList.Add(new myCombobxItem(curEDISegment.SegmentCode + " " + i.ToString("00") + " | " + arrRawElementList[i], arrRawElementList[i]));
                    }

                    aryElementList.RemoveAt(0);

                    //Bind Data to listbox
                    lbDataElement.DataSource = aryElementList;
                    lbDataElement.DisplayMember = "Description";
                    lbDataElement.ValueMember = "Value";

                    //Set position
                    if (lbDataElement.Items.Count > (Position - 1))
                    {
                        lbDataElement.SelectedIndex = Position - 1;
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
        /// Load data
        /// </summary>
        private void loadOutboundDataElement()
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;

                //Bind data
                tblEDITrasactionRawData curEDIRawData = edm.tblEDITrasactionRawDatas.Where(tr => tr.TransactionRawDataNo == this.TransactionRawDataNo_FK).FirstOrDefault();
                string xmlData = "";

                //Set xml data value if transaction is created by import function
                if (strRawXMLData != "")
                {
                    xmlData = strRawXMLData;
                }
                else
                {
                    xmlData = curEDIRawData.XMLData;
                }
   
                //Split XML data into an array list
                string[] arrXMLList = xmlData.Split(Environment.NewLine.ToCharArray()).Where(i => i.Count() > 0).ToArray();

                //Find xml path field from the array list
                if (Common.myCStr(XMLPathField) != "")
                {
                    if (arrXMLList.Any(i => i.Contains("<" + XMLPathField + "/>")))
                    {
                        arrXMLList = arrXMLList.Where(i => i.Contains("<" + XMLPathField + "/>")).ToArray();
                    }
                    else
                    {
                        int firstIndex;
                        int lastIndex;

                        firstIndex = arrXMLList.ToList().FindIndex(i => i.Contains("<" + XMLPathField + ">"));
                        lastIndex = arrXMLList.ToList().FindIndex(i => i.Contains("</" + XMLPathField + ">"));

                        if (firstIndex != -1 && (lastIndex - firstIndex) >= 0)
                        {
                            arrXMLList = arrXMLList.ToList().GetRange(firstIndex, (lastIndex - firstIndex) + 1).ToArray();
                        }
                    }
                }

                lbXMLData.DataSource = arrXMLList.ToArray();
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
        /// Close form on double click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void lbDataElement_MouseDoubleClick(object sender, MouseEventArgs e)
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

        /// <summary>
        /// Close form on double click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void lbXMLData_MouseDoubleClick(object sender, MouseEventArgs e)
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

        /// <summary>
        /// Get current position
        /// </summary>
        /// <returns>current position</returns>
        public int GetPosition()
        {
            int position = Common.myCInt(lbDataElement.SelectedIndex);
            return position;
        }

        /// <summary>
        /// Get selected value from listbox
        /// </summary>
        /// <returns></returns>
        public string GetRawData()
        {
            string value = Common.myCStr(lbDataElement.SelectedValue);
            return value;
        }

        /// <summary>
        /// Get current xml path field
        /// </summary>
        /// <returns></returns>
        public string GetPathField()
        {
            try
            {
                String pathField = "";

                object curItem = lbXMLData.SelectedItem;
                pathField = curItem.ToString().Trim();

                int startIndex = pathField.StartsWith("</") ? pathField.IndexOf("</") + 2 : pathField.IndexOf("<") + 1;
                int endIndex;

                pathField = pathField.Substring(startIndex);

                endIndex = pathField.EndsWith("/>") ? pathField.IndexOf("/>") : pathField.IndexOf(">");
                pathField = pathField.Substring(0, endIndex);

                return pathField;
            }
            catch (Exception ex)
            {
                Common.writeLog(-1, -1, ex.Message, (int)Common.LOG_TYPE.SYSTEM_ERROR);
                MessageBox.Show(ex.Message, Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return "";
            }
        }
    }
}
