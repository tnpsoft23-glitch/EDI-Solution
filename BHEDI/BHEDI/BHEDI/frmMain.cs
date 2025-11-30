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
    /// EDI Configuration & Translator tool main menu
    /// </summary>
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
        }

        /// Define child form objects
        private frmViewEDI objfrmViewEDI = null;
        private frmTradingPartner objfrmTradingPartner = null;
        private frmImportInboundFile objfrmImportInboundFile = null;
        private frmImportOutboundFile objfrmImportOutboundFile = null;
        private frmLogError objfrmLogError = null;
        private frmLogJob objfrmLogJob = null;
        private frmSetupInbound objfrmSetupInbound = null;
        private frmSetupOutbound objfrmSetupOutbound = null;
        private frmMapEDIData objfrmMapEDIData = null;
        private frmWriteXMLToEDI objfrmWriteXMLToEDI = null;
        private frmImport820ToSimply objfrmImport820ToSimply = null;

        /// <summary>
        /// Show EDI Data
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void eDIDataToolStripMenuItem_Click(object sender, EventArgs e)
        {
            openChildForm(objfrmViewEDI,9);
        }

        /// <summary>
        /// Cascade child window
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cascadeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //Cascade all child forms.        
            this.LayoutMdi(System.Windows.Forms.MdiLayout.Cascade);
        }

        /// <summary>
        /// Arrange child window
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void arrangeAllToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.LayoutMdi(System.Windows.Forms.MdiLayout.ArrangeIcons);
        }

        /// <summary>
        /// Arrange child window
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void arrangeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.LayoutMdi(System.Windows.Forms.MdiLayout.TileHorizontal);
        }

        /// <summary>
        /// Arrange child window
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void arrangeToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            this.LayoutMdi(System.Windows.Forms.MdiLayout.TileVertical);
        }

        /// <summary>
        /// Maximize all child windows
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void maximizeAllToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //Gets forms that represent the MDI child forms 
            //that are parented to this form in an array
            Form[] charr = this.MdiChildren;

            //for each child form set the window state to Maximized
            foreach (Form chform in charr)
                chform.WindowState = FormWindowState.Maximized;
        }

        /// <summary>
        /// Minimize all child windows
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void minimizeAllToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //Gets forms that represent the MDI child forms 
            //that are parented to this form in an array
            Form[] charr = this.MdiChildren;

            //for each child form set the window state to Maximized
            foreach (Form chform in charr)
                chform.WindowState = FormWindowState.Minimized;
        }

        /// <summary>
        /// Close active child window
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void optionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //Gets the currently active MDI child window.
            Form a = this.ActiveMdiChild;
            //Close the MDI child window
            if (a != null)
                a.Close();
        }

        /// <summary>
        /// Close all child windows
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void closeAllToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //Gets forms that represent the MDI child forms 
            //that are parented to this form in an array
            Form[] charr = this.MdiChildren;

            //for each child form set the window state to Minimized
            foreach (Form chform in charr)
                chform.Close();
        }

        /// <summary>
        /// Trading partner setup
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tradingPartnerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            openChildForm(objfrmTradingPartner,0);
        }

        /// <summary>
        /// View EDI Data
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            openChildForm(objfrmViewEDI,9);
        }

        /// <summary>
        /// Check child form is already open
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        private bool isAlreadyOpen(string name)
        {
            FormCollection fc = Application.OpenForms;

            foreach (Form frm in fc)
            {
                if (frm.Text == name)
                {
                    return true;
                }
            }
            return false;
        }

        /// <summary>
        /// Exit
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        /// <summary>
        /// Open child form
        /// </summary>
        /// <param name="obj"></param>
        private void openChildForm(Form obj, int opt)
        {
            if (obj == null || obj.Text == "")
            {
                switch (opt)
                {
                    case 0:
                        obj = new frmTradingPartner();
                        break;
                    case 1:
                        obj = new frmImportInboundFile();
                        break;
                    case 2:
                        obj = new frmImportOutboundFile();
                        break;
                    case 3:
                        obj = new frmLogError();
                        break;
                    case 4:
                        obj = new frmLogJob();
                        break;
                    case 5:
                        obj = new frmSetupInbound();
                        break;
                    case 6:
                        obj = new frmSetupOutbound();
                        break;
                    case 7:
                        obj = new frmMapEDIData();
                        break;
                    case 8:
                        obj = new frmWriteXMLToEDI();
                        break;
                    case 9:
                        editToolStripMenuItem.Visible = true;
                        obj = new frmViewEDI();
                        break;
                    case 10:
                        obj = new frmImport820ToSimply();
                        break;
 
                }

                //obj.Dock = DockStyle.Fill;
                obj.StartPosition = FormStartPosition.Manual;
                obj.Location = new Point((this.ClientSize.Width - obj.Width) / 2, (this.ClientSize.Height - obj.Height) / 2);
              
                obj.MdiParent = this;
                obj.Show();
            }
            else if (isAlreadyOpen(obj.Text))
            {
                obj.WindowState = FormWindowState.Normal;
                //obj.Dock = DockStyle.Fill;
                obj.Show();
                obj.Focus();
            }      
        }

        /// <summary>
        /// View trading partner
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            openChildForm(objfrmTradingPartner,0);
        }

        /// <summary>
        /// View Job Log
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            openChildForm(objfrmLogJob,4);
        }

        /// <summary>
        /// Setup inbound
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void inboundDefinitionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            openChildForm(objfrmSetupInbound,5);
        }

        /// <summary>
        ///  Setup outbound 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void outboundDefinitionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            openChildForm(objfrmSetupOutbound,6);
        }

        /// <summary>
        /// Trading partner setup
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tradingPartnerToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            openChildForm(objfrmTradingPartner,0);
        }

        /// <summary>
        /// Run job In
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void importInboundToolStripMenuItem_Click(object sender, EventArgs e)
        {
            InOutProcess pro = new InOutProcess();
            if (MessageBox.Show("Do you want to run job in ?", Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.No)
                return;

            try
            {
                Cursor.Current = Cursors.WaitCursor;
                pro.processIncommingData();
                MessageBox.Show("Job in is completed. Please check the log for errors.", Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Information);


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
        /// Run job out
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void outToolStripMenuItem_Click(object sender, EventArgs e)
        {
            InOutProcess pro = new InOutProcess();
            if (MessageBox.Show("Do you want to run job out ?", Common.SYSTEM_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.No)
                return;

            try
            {
                Cursor.Current = Cursors.WaitCursor;
                pro.processOutgoingData();
                MessageBox.Show("Job out is completed. Please check the log for errors.", Common.SYSTEM_NAME, MessageBoxButtons.OK, MessageBoxIcon.Information);


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
        /// Import inbound EDI
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void importEDIFilesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            openChildForm(objfrmImportInboundFile,1);
        }

        /// <summary>
        /// Map EDI data to application data
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void mapToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            openChildForm(objfrmMapEDIData,7);
        }

        /// <summary>
        /// Job report
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void jobToolStripMenuItem_Click(object sender, EventArgs e)
        {
            openChildForm(objfrmLogJob,4);
        }

        /// <summary>
        /// Error report
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void errorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            openChildForm(objfrmLogError,3);
        }

        /// <summary>
        /// Version Information
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void versionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmAbout obj = new frmAbout();
            obj.StartPosition = FormStartPosition.CenterParent;
            obj.ShowDialog(this);
        }

        /// <summary>
        /// Import XML file
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void importXMLFilesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            openChildForm(objfrmImportOutboundFile,2);
        }

        /// <summary>
        /// Write to EDI File
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void writeMappedOutboundXMLToEDIFileToolStripMenuItem_Click(object sender, EventArgs e)
        {
            openChildForm(objfrmWriteXMLToEDI,8);
          
        }

        /// <summary>
        /// Undo Editing
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void undoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormCollection fc = Application.OpenForms;

            foreach (Form fm in fc)
            {
                if (fm.Text == "EDI Data")
                {
                    frmViewEDI ViewEDIForm = (frmViewEDI)fm;
                    ViewEDIForm.undoEdit_Click();
                }
            }
        }

        /// <summary>
        /// Redo Editing
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void redoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormCollection fc = Application.OpenForms;

            foreach (Form fm in fc)
            {
                if (fm.Text == "EDI Data")
                {
                    frmViewEDI ViewEDIForm = (frmViewEDI)fm;
                    ViewEDIForm.redoEdit_Click();
                }
            }
        }

        /// <summary>
        /// Cut text
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormCollection fc = Application.OpenForms;

            foreach (Form fm in fc)
            {
                if (fm.Text == "EDI Data")
                {
                    frmViewEDI ViewEDIForm = (frmViewEDI)fm;
                    ViewEDIForm.cutEdit_Click();
                }
            }
        }

        /// <summary>
        /// Copy text
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void copyToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormCollection fc = Application.OpenForms;

            foreach (Form fm in fc)
            {
                if (fm.Text == "EDI Data")
                {
                    frmViewEDI ViewEDIForm = (frmViewEDI)fm;
                    ViewEDIForm.copyEdit_Click();
                }
            }
        }

        /// <summary>
        /// Paste text
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void pasteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormCollection fc = Application.OpenForms;

            foreach (Form fm in fc)
            {
                if (fm.Text == "EDI Data")
                {
                    frmViewEDI ViewEDIForm = (frmViewEDI)fm;
                    ViewEDIForm.pasteEdit_Click();
                }
            }
        }

        /// <summary>
        /// Init static variable
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmMain_Load(object sender, EventArgs e)
        {
            Common.initStaticVariables();
        }

        /// <summary>
        /// Open import 820 form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void import820ToSImplyAccountingToolStripMenuItem_Click(object sender, EventArgs e)
        {
            openChildForm(objfrmImport820ToSimply, 10);
        }

    }
}
