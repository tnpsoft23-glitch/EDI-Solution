namespace BHEDI
{
    partial class frmLogError
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmLogError));
            this.gbFilter = new System.Windows.Forms.GroupBox();
            this.btnPreview = new System.Windows.Forms.Button();
            this.cboTradingPartner = new System.Windows.Forms.ComboBox();
            this.cboTransactionSet = new System.Windows.Forms.ComboBox();
            this.lblTransactionSet = new System.Windows.Forms.Label();
            this.lblTradingPartnerList = new System.Windows.Forms.Label();
            this.cboDirection = new System.Windows.Forms.ComboBox();
            this.lblDirection = new System.Windows.Forms.Label();
            this.dtpDateTo = new System.Windows.Forms.DateTimePicker();
            this.lblDateDash = new System.Windows.Forms.Label();
            this.dtpDateFrom = new System.Windows.Forms.DateTimePicker();
            this.lblDate = new System.Windows.Forms.Label();
            this.crvErrorReport = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
            this.gbFilter.SuspendLayout();
            this.SuspendLayout();
            // 
            // gbFilter
            // 
            this.gbFilter.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.gbFilter.Controls.Add(this.btnPreview);
            this.gbFilter.Controls.Add(this.cboTradingPartner);
            this.gbFilter.Controls.Add(this.cboTransactionSet);
            this.gbFilter.Controls.Add(this.lblTransactionSet);
            this.gbFilter.Controls.Add(this.lblTradingPartnerList);
            this.gbFilter.Controls.Add(this.cboDirection);
            this.gbFilter.Controls.Add(this.lblDirection);
            this.gbFilter.Controls.Add(this.dtpDateTo);
            this.gbFilter.Controls.Add(this.lblDateDash);
            this.gbFilter.Controls.Add(this.dtpDateFrom);
            this.gbFilter.Controls.Add(this.lblDate);
            this.gbFilter.Location = new System.Drawing.Point(13, 10);
            this.gbFilter.Name = "gbFilter";
            this.gbFilter.Size = new System.Drawing.Size(859, 138);
            this.gbFilter.TabIndex = 0;
            this.gbFilter.TabStop = false;
            this.gbFilter.Text = "Filter";
            // 
            // btnPreview
            // 
            this.btnPreview.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnPreview.Location = new System.Drawing.Point(749, 88);
            this.btnPreview.Name = "btnPreview";
            this.btnPreview.Size = new System.Drawing.Size(91, 34);
            this.btnPreview.TabIndex = 10;
            this.btnPreview.Text = "Preview";
            this.btnPreview.UseVisualStyleBackColor = true;
            this.btnPreview.Click += new System.EventHandler(this.btnPreview_Click);
            // 
            // cboTradingPartner
            // 
            this.cboTradingPartner.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.cboTradingPartner.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.cboTradingPartner.FormattingEnabled = true;
            this.cboTradingPartner.Location = new System.Drawing.Point(111, 76);
            this.cboTradingPartner.Name = "cboTradingPartner";
            this.cboTradingPartner.Size = new System.Drawing.Size(293, 21);
            this.cboTradingPartner.TabIndex = 7;
            // 
            // cboTransactionSet
            // 
            this.cboTransactionSet.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.cboTransactionSet.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.cboTransactionSet.FormattingEnabled = true;
            this.cboTransactionSet.Location = new System.Drawing.Point(111, 105);
            this.cboTransactionSet.Name = "cboTransactionSet";
            this.cboTransactionSet.Size = new System.Drawing.Size(293, 21);
            this.cboTransactionSet.TabIndex = 9;
            // 
            // lblTransactionSet
            // 
            this.lblTransactionSet.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.lblTransactionSet.AutoSize = true;
            this.lblTransactionSet.Location = new System.Drawing.Point(17, 109);
            this.lblTransactionSet.Name = "lblTransactionSet";
            this.lblTransactionSet.Size = new System.Drawing.Size(85, 13);
            this.lblTransactionSet.TabIndex = 8;
            this.lblTransactionSet.Text = "Transaction Set:";
            // 
            // lblTradingPartnerList
            // 
            this.lblTradingPartnerList.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.lblTradingPartnerList.AutoSize = true;
            this.lblTradingPartnerList.Location = new System.Drawing.Point(17, 80);
            this.lblTradingPartnerList.Name = "lblTradingPartnerList";
            this.lblTradingPartnerList.Size = new System.Drawing.Size(82, 13);
            this.lblTradingPartnerList.TabIndex = 6;
            this.lblTradingPartnerList.Text = "Trading partner:";
            // 
            // cboDirection
            // 
            this.cboDirection.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.cboDirection.FormattingEnabled = true;
            this.cboDirection.Location = new System.Drawing.Point(111, 47);
            this.cboDirection.Name = "cboDirection";
            this.cboDirection.Size = new System.Drawing.Size(103, 21);
            this.cboDirection.TabIndex = 5;
            // 
            // lblDirection
            // 
            this.lblDirection.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.lblDirection.AutoSize = true;
            this.lblDirection.Location = new System.Drawing.Point(17, 51);
            this.lblDirection.Name = "lblDirection";
            this.lblDirection.Size = new System.Drawing.Size(52, 13);
            this.lblDirection.TabIndex = 4;
            this.lblDirection.Text = "Direction:";
            // 
            // dtpDateTo
            // 
            this.dtpDateTo.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.dtpDateTo.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpDateTo.Location = new System.Drawing.Point(236, 17);
            this.dtpDateTo.Name = "dtpDateTo";
            this.dtpDateTo.Size = new System.Drawing.Size(100, 20);
            this.dtpDateTo.TabIndex = 3;
            // 
            // lblDateDash
            // 
            this.lblDateDash.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.lblDateDash.AutoSize = true;
            this.lblDateDash.Location = new System.Drawing.Point(215, 21);
            this.lblDateDash.Name = "lblDateDash";
            this.lblDateDash.Size = new System.Drawing.Size(16, 13);
            this.lblDateDash.TabIndex = 2;
            this.lblDateDash.Text = " - ";
            // 
            // dtpDateFrom
            // 
            this.dtpDateFrom.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.dtpDateFrom.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpDateFrom.Location = new System.Drawing.Point(111, 17);
            this.dtpDateFrom.Name = "dtpDateFrom";
            this.dtpDateFrom.Size = new System.Drawing.Size(100, 20);
            this.dtpDateFrom.TabIndex = 1;
            // 
            // lblDate
            // 
            this.lblDate.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.lblDate.AutoSize = true;
            this.lblDate.Location = new System.Drawing.Point(17, 22);
            this.lblDate.Name = "lblDate";
            this.lblDate.Size = new System.Drawing.Size(33, 13);
            this.lblDate.TabIndex = 0;
            this.lblDate.Text = "Date:";
            // 
            // crvErrorReport
            // 
            this.crvErrorReport.ActiveViewIndex = -1;
            this.crvErrorReport.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.crvErrorReport.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.crvErrorReport.Cursor = System.Windows.Forms.Cursors.Default;
            this.crvErrorReport.Location = new System.Drawing.Point(13, 154);
            this.crvErrorReport.Name = "crvErrorReport";
            this.crvErrorReport.ShowCloseButton = false;
            this.crvErrorReport.ShowCopyButton = false;
            this.crvErrorReport.ShowGroupTreeButton = false;
            this.crvErrorReport.ShowLogo = false;
            this.crvErrorReport.ShowParameterPanelButton = false;
            this.crvErrorReport.ShowRefreshButton = false;
            this.crvErrorReport.Size = new System.Drawing.Size(859, 460);
            this.crvErrorReport.TabIndex = 1;
            this.crvErrorReport.ToolPanelView = CrystalDecisions.Windows.Forms.ToolPanelViewType.None;
            // 
            // frmLogError
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(884, 626);
            this.Controls.Add(this.crvErrorReport);
            this.Controls.Add(this.gbFilter);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmLogError";
            this.Text = "Error Report";
            this.Load += new System.EventHandler(this.frmLogError_Load);
            this.gbFilter.ResumeLayout(false);
            this.gbFilter.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbFilter;
        private System.Windows.Forms.Button btnPreview;
        private System.Windows.Forms.ComboBox cboTradingPartner;
        private System.Windows.Forms.ComboBox cboTransactionSet;
        private System.Windows.Forms.Label lblTransactionSet;
        private System.Windows.Forms.Label lblTradingPartnerList;
        private System.Windows.Forms.ComboBox cboDirection;
        private System.Windows.Forms.Label lblDirection;
        private System.Windows.Forms.DateTimePicker dtpDateTo;
        private System.Windows.Forms.Label lblDateDash;
        private System.Windows.Forms.DateTimePicker dtpDateFrom;
        private System.Windows.Forms.Label lblDate;
        private CrystalDecisions.Windows.Forms.CrystalReportViewer crvErrorReport;
    }
}