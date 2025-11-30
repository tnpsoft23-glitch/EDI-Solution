namespace BHEDI
{
    partial class frmImport820ToSimply
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmImport820ToSimply));
            this.gbSearch = new System.Windows.Forms.GroupBox();
            this.cboTradingPartner = new System.Windows.Forms.ComboBox();
            this.btnSearch = new System.Windows.Forms.Button();
            this.lblTradingPartnerList = new System.Windows.Forms.Label();
            this.dtpDateTo = new System.Windows.Forms.DateTimePicker();
            this.lblDateDash = new System.Windows.Forms.Label();
            this.dtpDateFrom = new System.Windows.Forms.DateTimePicker();
            this.lblDate = new System.Windows.Forms.Label();
            this.dgvEDIData = new System.Windows.Forms.DataGridView();
            this.bdsEDIData = new System.Windows.Forms.BindingSource(this.components);
            this.dsEDIData = new System.Data.DataSet();
            this.tableEDIData = new System.Data.DataTable();
            this.dcTradingPartnerNo = new System.Data.DataColumn();
            this.dcTradingPartnerName = new System.Data.DataColumn();
            this.dcTransactionSetID = new System.Data.DataColumn();
            this.dcTransactionDate = new System.Data.DataColumn();
            this.dcTransactionKey = new System.Data.DataColumn();
            this.dataColumn1 = new System.Data.DataColumn();
            this.dataColumn2 = new System.Data.DataColumn();
            this.btnExit = new System.Windows.Forms.Button();
            this.btnMap = new System.Windows.Forms.Button();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.colSelect = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.colTradingPartner = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colAmount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colPaymentDate = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTransactionDate = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colHdrKey = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.importStatusDataGridViewCheckBoxColumn = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.gbSearch.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEDIData)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsEDIData)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dsEDIData)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tableEDIData)).BeginInit();
            this.SuspendLayout();
            // 
            // gbSearch
            // 
            this.gbSearch.Controls.Add(this.cboTradingPartner);
            this.gbSearch.Controls.Add(this.btnSearch);
            this.gbSearch.Controls.Add(this.lblTradingPartnerList);
            this.gbSearch.Controls.Add(this.dtpDateTo);
            this.gbSearch.Controls.Add(this.lblDateDash);
            this.gbSearch.Controls.Add(this.dtpDateFrom);
            this.gbSearch.Controls.Add(this.lblDate);
            this.gbSearch.Location = new System.Drawing.Point(12, 12);
            this.gbSearch.Name = "gbSearch";
            this.gbSearch.Size = new System.Drawing.Size(577, 126);
            this.gbSearch.TabIndex = 1;
            this.gbSearch.TabStop = false;
            this.gbSearch.Text = "Search";
            // 
            // cboTradingPartner
            // 
            this.cboTradingPartner.FormattingEnabled = true;
            this.cboTradingPartner.Location = new System.Drawing.Point(98, 48);
            this.cboTradingPartner.Name = "cboTradingPartner";
            this.cboTradingPartner.Size = new System.Drawing.Size(293, 21);
            this.cboTradingPartner.TabIndex = 2;
            // 
            // btnSearch
            // 
            this.btnSearch.Location = new System.Drawing.Point(480, 86);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(91, 34);
            this.btnSearch.TabIndex = 4;
            this.btnSearch.Text = "Search";
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // lblTradingPartnerList
            // 
            this.lblTradingPartnerList.AutoSize = true;
            this.lblTradingPartnerList.Location = new System.Drawing.Point(4, 52);
            this.lblTradingPartnerList.Name = "lblTradingPartnerList";
            this.lblTradingPartnerList.Size = new System.Drawing.Size(82, 13);
            this.lblTradingPartnerList.TabIndex = 6;
            this.lblTradingPartnerList.Text = "Trading partner:";
            // 
            // dtpDateTo
            // 
            this.dtpDateTo.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpDateTo.Location = new System.Drawing.Point(223, 22);
            this.dtpDateTo.Name = "dtpDateTo";
            this.dtpDateTo.Size = new System.Drawing.Size(100, 20);
            this.dtpDateTo.TabIndex = 1;
            // 
            // lblDateDash
            // 
            this.lblDateDash.AutoSize = true;
            this.lblDateDash.Location = new System.Drawing.Point(202, 26);
            this.lblDateDash.Name = "lblDateDash";
            this.lblDateDash.Size = new System.Drawing.Size(16, 13);
            this.lblDateDash.TabIndex = 2;
            this.lblDateDash.Text = " - ";
            // 
            // dtpDateFrom
            // 
            this.dtpDateFrom.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpDateFrom.Location = new System.Drawing.Point(98, 22);
            this.dtpDateFrom.Name = "dtpDateFrom";
            this.dtpDateFrom.Size = new System.Drawing.Size(100, 20);
            this.dtpDateFrom.TabIndex = 0;
            // 
            // lblDate
            // 
            this.lblDate.AutoSize = true;
            this.lblDate.Location = new System.Drawing.Point(4, 27);
            this.lblDate.Name = "lblDate";
            this.lblDate.Size = new System.Drawing.Size(33, 13);
            this.lblDate.TabIndex = 0;
            this.lblDate.Text = "Date:";
            // 
            // dgvEDIData
            // 
            this.dgvEDIData.AllowUserToAddRows = false;
            this.dgvEDIData.AllowUserToDeleteRows = false;
            this.dgvEDIData.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvEDIData.AutoGenerateColumns = false;
            this.dgvEDIData.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colSelect,
            this.colTradingPartner,
            this.colAmount,
            this.colPaymentDate,
            this.colTransactionDate,
            this.colHdrKey,
            this.importStatusDataGridViewCheckBoxColumn});
            this.dgvEDIData.DataSource = this.bdsEDIData;
            this.dgvEDIData.Location = new System.Drawing.Point(12, 144);
            this.dgvEDIData.Name = "dgvEDIData";
            this.dgvEDIData.RowHeadersVisible = false;
            this.dgvEDIData.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvEDIData.Size = new System.Drawing.Size(575, 415);
            this.dgvEDIData.TabIndex = 5;
            // 
            // bdsEDIData
            // 
            this.bdsEDIData.DataMember = "tableEDIData";
            this.bdsEDIData.DataSource = this.dsEDIData;
            // 
            // dsEDIData
            // 
            this.dsEDIData.DataSetName = "dsEDIData";
            this.dsEDIData.Tables.AddRange(new System.Data.DataTable[] {
            this.tableEDIData});
            // 
            // tableEDIData
            // 
            this.tableEDIData.Columns.AddRange(new System.Data.DataColumn[] {
            this.dcTradingPartnerNo,
            this.dcTradingPartnerName,
            this.dcTransactionSetID,
            this.dcTransactionDate,
            this.dcTransactionKey,
            this.dataColumn1,
            this.dataColumn2});
            this.tableEDIData.TableName = "tableEDIData";
            // 
            // dcTradingPartnerNo
            // 
            this.dcTradingPartnerNo.ColumnName = "TradingPartnerNo";
            this.dcTradingPartnerNo.DataType = typeof(int);
            // 
            // dcTradingPartnerName
            // 
            this.dcTradingPartnerName.Caption = "TradingPartnerName";
            this.dcTradingPartnerName.ColumnName = "TradingPartnerName";
            // 
            // dcTransactionSetID
            // 
            this.dcTransactionSetID.ColumnName = "TotalPaymentAmount";
            this.dcTransactionSetID.DataType = typeof(decimal);
            // 
            // dcTransactionDate
            // 
            this.dcTransactionDate.ColumnName = "SubmitDateTime";
            this.dcTransactionDate.DataType = typeof(System.DateTime);
            // 
            // dcTransactionKey
            // 
            this.dcTransactionKey.ColumnName = "RemittanceDate";
            this.dcTransactionKey.DataType = typeof(System.DateTime);
            // 
            // dataColumn1
            // 
            this.dataColumn1.ColumnName = "HdrKey";
            // 
            // dataColumn2
            // 
            this.dataColumn2.ColumnName = "ImportStatus";
            this.dataColumn2.DataType = typeof(bool);
            // 
            // btnExit
            // 
            this.btnExit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnExit.Location = new System.Drawing.Point(496, 575);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(91, 34);
            this.btnExit.TabIndex = 7;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // btnMap
            // 
            this.btnMap.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnMap.Location = new System.Drawing.Point(399, 575);
            this.btnMap.Name = "btnMap";
            this.btnMap.Size = new System.Drawing.Size(91, 34);
            this.btnMap.TabIndex = 6;
            this.btnMap.Text = "Import To Simply";
            this.btnMap.UseVisualStyleBackColor = true;
            this.btnMap.Click += new System.EventHandler(this.btnMap_Click);
            // 
            // backgroundWorker1
            // 
            this.backgroundWorker1.WorkerReportsProgress = true;
            this.backgroundWorker1.DoWork += new System.ComponentModel.DoWorkEventHandler(this.backgroundWorker1_DoWork);
            this.backgroundWorker1.ProgressChanged += new System.ComponentModel.ProgressChangedEventHandler(this.backgroundWorker1_ProgressChanged);
            this.backgroundWorker1.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(this.backgroundWorker1_RunWorkerCompleted);
            // 
            // colSelect
            // 
            this.colSelect.HeaderText = "";
            this.colSelect.Name = "colSelect";
            this.colSelect.Width = 25;
            // 
            // colTradingPartner
            // 
            this.colTradingPartner.DataPropertyName = "TradingPartnerName";
            this.colTradingPartner.HeaderText = "Trading Partner";
            this.colTradingPartner.Name = "colTradingPartner";
            this.colTradingPartner.ReadOnly = true;
            this.colTradingPartner.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colTradingPartner.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            this.colTradingPartner.Width = 120;
            // 
            // colAmount
            // 
            this.colAmount.DataPropertyName = "TotalPaymentAmount";
            this.colAmount.HeaderText = "Payment Amount";
            this.colAmount.Name = "colAmount";
            this.colAmount.ReadOnly = true;
            this.colAmount.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colAmount.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // colPaymentDate
            // 
            this.colPaymentDate.DataPropertyName = "RemittanceDate";
            this.colPaymentDate.HeaderText = "Payment Date";
            this.colPaymentDate.Name = "colPaymentDate";
            this.colPaymentDate.ReadOnly = true;
            // 
            // colTransactionDate
            // 
            this.colTransactionDate.DataPropertyName = "SubmitDateTime";
            this.colTransactionDate.HeaderText = "Transaction Date";
            this.colTransactionDate.Name = "colTransactionDate";
            this.colTransactionDate.ReadOnly = true;
            this.colTransactionDate.Width = 120;
            // 
            // colHdrKey
            // 
            this.colHdrKey.DataPropertyName = "HdrKey";
            this.colHdrKey.HeaderText = "HdrKey";
            this.colHdrKey.Name = "colHdrKey";
            this.colHdrKey.Visible = false;
            // 
            // importStatusDataGridViewCheckBoxColumn
            // 
            this.importStatusDataGridViewCheckBoxColumn.DataPropertyName = "ImportStatus";
            this.importStatusDataGridViewCheckBoxColumn.HeaderText = "ImportStatus";
            this.importStatusDataGridViewCheckBoxColumn.Name = "importStatusDataGridViewCheckBoxColumn";
            // 
            // frmImport820ToSimply
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(599, 621);
            this.Controls.Add(this.btnMap);
            this.Controls.Add(this.btnExit);
            this.Controls.Add(this.dgvEDIData);
            this.Controls.Add(this.gbSearch);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmImport820ToSimply";
            this.Text = "Import 820 Payment To Simply Accounting";
            this.Load += new System.EventHandler(this.frmImport820ToSimply_Load);
            this.gbSearch.ResumeLayout(false);
            this.gbSearch.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEDIData)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsEDIData)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dsEDIData)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tableEDIData)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbSearch;
        private System.Windows.Forms.ComboBox cboTradingPartner;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.Label lblTradingPartnerList;
        private System.Windows.Forms.DateTimePicker dtpDateTo;
        private System.Windows.Forms.Label lblDateDash;
        private System.Windows.Forms.DateTimePicker dtpDateFrom;
        private System.Windows.Forms.Label lblDate;
        private System.Windows.Forms.DataGridView dgvEDIData;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Button btnMap;
        private System.Windows.Forms.BindingSource bdsEDIData;
        private System.Data.DataSet dsEDIData;
        private System.Data.DataTable tableEDIData;
        private System.Data.DataColumn dcTradingPartnerNo;
        private System.Data.DataColumn dcTradingPartnerName;
        private System.Data.DataColumn dcTransactionSetID;
        private System.Data.DataColumn dcTransactionDate;
        private System.Data.DataColumn dcTransactionKey;
        private System.Data.DataColumn dataColumn1;
        private System.Data.DataColumn dataColumn2;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private System.Windows.Forms.DataGridViewCheckBoxColumn colSelect;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTradingPartner;
        private System.Windows.Forms.DataGridViewTextBoxColumn colAmount;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPaymentDate;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTransactionDate;
        private System.Windows.Forms.DataGridViewTextBoxColumn colHdrKey;
        private System.Windows.Forms.DataGridViewCheckBoxColumn importStatusDataGridViewCheckBoxColumn;
    }
}