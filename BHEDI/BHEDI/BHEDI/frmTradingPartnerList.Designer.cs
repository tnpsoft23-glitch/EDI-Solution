namespace BHEDI
{
    partial class frmTradingPartnerList
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmTradingPartnerList));
            this.bdsTradingPartner = new System.Windows.Forms.BindingSource(this.components);
            this.cmbTradingList = new System.Windows.Forms.ListBox();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTradingPartner)).BeginInit();
            this.SuspendLayout();
            // 
            // bdsTradingPartner
            // 
            this.bdsTradingPartner.DataSource = typeof(BHEDI.BHEDI_EDM);
            // 
            // cmbTradingList
            // 
            this.cmbTradingList.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.cmbTradingList.DataSource = this.bdsTradingPartner;
            this.cmbTradingList.FormattingEnabled = true;
            this.cmbTradingList.Location = new System.Drawing.Point(7, 5);
            this.cmbTradingList.Name = "cmbTradingList";
            this.cmbTradingList.Size = new System.Drawing.Size(334, 472);
            this.cmbTradingList.TabIndex = 0;
            this.cmbTradingList.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.lbEDITransactionSet_MouseDoubleClick);
            // 
            // frmTradingPartnerList
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(348, 483);
            this.Controls.Add(this.cmbTradingList);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmTradingPartnerList";
            this.Text = "Trading Partner List";
            this.Load += new System.EventHandler(this.frmTradingPartnerList_Load);
            ((System.ComponentModel.ISupportInitialize)(this.bdsTradingPartner)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.BindingSource bdsTradingPartner;
        private System.Windows.Forms.ListBox cmbTradingList;
    }
}