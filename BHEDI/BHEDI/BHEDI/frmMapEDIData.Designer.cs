namespace BHEDI
{
    partial class frmMapEDIData
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMapEDIData));
            this.gbSearch = new System.Windows.Forms.GroupBox();
            this.cboTradingPartner = new System.Windows.Forms.ComboBox();
            this.cboTransactionSet = new System.Windows.Forms.ComboBox();
            this.btnSearch = new System.Windows.Forms.Button();
            this.lblTransactionSet = new System.Windows.Forms.Label();
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
            this.dcTransactionSetNo = new System.Data.DataColumn();
            this.dcTradingPartnerName = new System.Data.DataColumn();
            this.dcTransactionSetID = new System.Data.DataColumn();
            this.dcTransactionDate = new System.Data.DataColumn();
            this.dcTransactionKey = new System.Data.DataColumn();
            this.dcRawData = new System.Data.DataColumn();
            this.dcXMLData = new System.Data.DataColumn();
            this.dcInterchangeSenderIDQual = new System.Data.DataColumn();
            this.dcInterchangeSenderID = new System.Data.DataColumn();
            this.dcInterchangeReceiverIDQual = new System.Data.DataColumn();
            this.dcInterchangeReceiverID = new System.Data.DataColumn();
            this.dcApplicationSenderCode = new System.Data.DataColumn();
            this.dcApplicationReceiverCode = new System.Data.DataColumn();
            this.dcSegmentTerminator = new System.Data.DataColumn();
            this.dcTransactionRawDataNo = new System.Data.DataColumn();
            this.dcElementTerminator = new System.Data.DataColumn();
            this.btnExit = new System.Windows.Forms.Button();
            this.btnMap = new System.Windows.Forms.Button();
            this.colSelect = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.colTradingPartner = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTSet = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTransactionDate = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTransactionKey = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colSenderID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colSenderQual = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colReceiverID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colReceiverQual = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colAppSenderID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colAppReceiverID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colRawData = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTransactionRawDataNo = new System.Windows.Forms.DataGridViewTextBoxColumn();
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
            this.gbSearch.Controls.Add(this.cboTransactionSet);
            this.gbSearch.Controls.Add(this.btnSearch);
            this.gbSearch.Controls.Add(this.lblTransactionSet);
            this.gbSearch.Controls.Add(this.lblTradingPartnerList);
            this.gbSearch.Controls.Add(this.dtpDateTo);
            this.gbSearch.Controls.Add(this.lblDateDash);
            this.gbSearch.Controls.Add(this.dtpDateFrom);
            this.gbSearch.Controls.Add(this.lblDate);
            this.gbSearch.Location = new System.Drawing.Point(12, 12);
            this.gbSearch.Name = "gbSearch";
            this.gbSearch.Size = new System.Drawing.Size(423, 145);
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
            // cboTransactionSet
            // 
            this.cboTransactionSet.FormattingEnabled = true;
            this.cboTransactionSet.Location = new System.Drawing.Point(98, 77);
            this.cboTransactionSet.Name = "cboTransactionSet";
            this.cboTransactionSet.Size = new System.Drawing.Size(293, 21);
            this.cboTransactionSet.TabIndex = 3;
            // 
            // btnSearch
            // 
            this.btnSearch.Location = new System.Drawing.Point(300, 104);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(91, 34);
            this.btnSearch.TabIndex = 4;
            this.btnSearch.Text = "Search";
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // lblTransactionSet
            // 
            this.lblTransactionSet.AutoSize = true;
            this.lblTransactionSet.Location = new System.Drawing.Point(4, 81);
            this.lblTransactionSet.Name = "lblTransactionSet";
            this.lblTransactionSet.Size = new System.Drawing.Size(85, 13);
            this.lblTransactionSet.TabIndex = 8;
            this.lblTransactionSet.Text = "Transaction Set:";
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
            this.colTSet,
            this.colTransactionDate,
            this.colTransactionKey,
            this.colSenderID,
            this.colSenderQual,
            this.colReceiverID,
            this.colReceiverQual,
            this.colAppSenderID,
            this.colAppReceiverID,
            this.colRawData,
            this.colTransactionRawDataNo});
            this.dgvEDIData.DataSource = this.bdsEDIData;
            this.dgvEDIData.Location = new System.Drawing.Point(12, 163);
            this.dgvEDIData.Name = "dgvEDIData";
            this.dgvEDIData.RowHeadersVisible = false;
            this.dgvEDIData.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvEDIData.Size = new System.Drawing.Size(420, 400);
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
            this.dcTransactionSetNo,
            this.dcTradingPartnerName,
            this.dcTransactionSetID,
            this.dcTransactionDate,
            this.dcTransactionKey,
            this.dcRawData,
            this.dcXMLData,
            this.dcInterchangeSenderIDQual,
            this.dcInterchangeSenderID,
            this.dcInterchangeReceiverIDQual,
            this.dcInterchangeReceiverID,
            this.dcApplicationSenderCode,
            this.dcApplicationReceiverCode,
            this.dcSegmentTerminator,
            this.dcTransactionRawDataNo,
            this.dcElementTerminator});
            this.tableEDIData.TableName = "tableEDIData";
            // 
            // dcTradingPartnerNo
            // 
            this.dcTradingPartnerNo.ColumnName = "TradingPartnerNo";
            this.dcTradingPartnerNo.DataType = typeof(int);
            // 
            // dcTransactionSetNo
            // 
            this.dcTransactionSetNo.ColumnName = "TransactionSetNo";
            this.dcTransactionSetNo.DataType = typeof(int);
            // 
            // dcTradingPartnerName
            // 
            this.dcTradingPartnerName.Caption = "TradingPartnerName";
            this.dcTradingPartnerName.ColumnName = "TradingPartnerName";
            // 
            // dcTransactionSetID
            // 
            this.dcTransactionSetID.ColumnName = "TransactionSetID";
            // 
            // dcTransactionDate
            // 
            this.dcTransactionDate.ColumnName = "TransactionDate";
            this.dcTransactionDate.DataType = typeof(System.DateTime);
            // 
            // dcTransactionKey
            // 
            this.dcTransactionKey.ColumnName = "TransactionKey";
            // 
            // dcRawData
            // 
            this.dcRawData.ColumnName = "RawData";
            // 
            // dcXMLData
            // 
            this.dcXMLData.ColumnName = "XMLData";
            // 
            // dcInterchangeSenderIDQual
            // 
            this.dcInterchangeSenderIDQual.ColumnName = "InterchangeSenderIDQual";
            // 
            // dcInterchangeSenderID
            // 
            this.dcInterchangeSenderID.ColumnName = "InterchangeSenderID";
            // 
            // dcInterchangeReceiverIDQual
            // 
            this.dcInterchangeReceiverIDQual.ColumnName = "InterchangeReceiverIDQual";
            // 
            // dcInterchangeReceiverID
            // 
            this.dcInterchangeReceiverID.ColumnName = "InterchangeReceiverID";
            // 
            // dcApplicationSenderCode
            // 
            this.dcApplicationSenderCode.ColumnName = "ApplicationSenderCode";
            // 
            // dcApplicationReceiverCode
            // 
            this.dcApplicationReceiverCode.ColumnName = "ApplicationReceiverCode";
            // 
            // dcSegmentTerminator
            // 
            this.dcSegmentTerminator.ColumnName = "SegmentTerminator";
            this.dcSegmentTerminator.DataType = typeof(int);
            // 
            // dcTransactionRawDataNo
            // 
            this.dcTransactionRawDataNo.ColumnName = "TransactionRawDataNo";
            this.dcTransactionRawDataNo.DataType = typeof(int);
            // 
            // dcElementTerminator
            // 
            this.dcElementTerminator.ColumnName = "ElementTerminator";
            this.dcElementTerminator.DataType = typeof(int);
            // 
            // btnExit
            // 
            this.btnExit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnExit.Location = new System.Drawing.Point(344, 575);
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
            this.btnMap.Location = new System.Drawing.Point(247, 575);
            this.btnMap.Name = "btnMap";
            this.btnMap.Size = new System.Drawing.Size(91, 34);
            this.btnMap.TabIndex = 6;
            this.btnMap.Text = "Map To App";
            this.btnMap.UseVisualStyleBackColor = true;
            this.btnMap.Click += new System.EventHandler(this.btnMap_Click);
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
            this.colTradingPartner.Width = 90;
            // 
            // colTSet
            // 
            this.colTSet.DataPropertyName = "TransactionSetID";
            this.colTSet.HeaderText = "T-Set";
            this.colTSet.Name = "colTSet";
            this.colTSet.ReadOnly = true;
            this.colTSet.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colTSet.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            this.colTSet.Width = 50;
            // 
            // colTransactionDate
            // 
            this.colTransactionDate.DataPropertyName = "TransactionDate";
            this.colTransactionDate.HeaderText = "Transaction Date";
            this.colTransactionDate.Name = "colTransactionDate";
            this.colTransactionDate.ReadOnly = true;
            this.colTransactionDate.Width = 150;
            // 
            // colTransactionKey
            // 
            this.colTransactionKey.DataPropertyName = "TransactionKey";
            this.colTransactionKey.HeaderText = "Transaction Key";
            this.colTransactionKey.Name = "colTransactionKey";
            this.colTransactionKey.ReadOnly = true;
            // 
            // colSenderID
            // 
            this.colSenderID.DataPropertyName = "InterchangeSenderID";
            this.colSenderID.HeaderText = "Sender ID";
            this.colSenderID.Name = "colSenderID";
            this.colSenderID.Visible = false;
            // 
            // colSenderQual
            // 
            this.colSenderQual.DataPropertyName = "InterchangeSenderIDQual";
            this.colSenderQual.HeaderText = "Sender Qual";
            this.colSenderQual.Name = "colSenderQual";
            this.colSenderQual.Visible = false;
            // 
            // colReceiverID
            // 
            this.colReceiverID.DataPropertyName = "InterchangeReceiverID";
            this.colReceiverID.HeaderText = "Receiver ID";
            this.colReceiverID.Name = "colReceiverID";
            this.colReceiverID.Visible = false;
            // 
            // colReceiverQual
            // 
            this.colReceiverQual.DataPropertyName = "InterchangeReceiverIDQual";
            this.colReceiverQual.HeaderText = "Receiver Qual";
            this.colReceiverQual.Name = "colReceiverQual";
            this.colReceiverQual.Visible = false;
            // 
            // colAppSenderID
            // 
            this.colAppSenderID.DataPropertyName = "ApplicationSenderCode";
            this.colAppSenderID.HeaderText = "App Sender ID";
            this.colAppSenderID.Name = "colAppSenderID";
            this.colAppSenderID.Visible = false;
            // 
            // colAppReceiverID
            // 
            this.colAppReceiverID.DataPropertyName = "ApplicationReceiverCode";
            this.colAppReceiverID.HeaderText = "App Receiver Qual";
            this.colAppReceiverID.Name = "colAppReceiverID";
            this.colAppReceiverID.Visible = false;
            // 
            // colRawData
            // 
            this.colRawData.DataPropertyName = "RawData";
            this.colRawData.HeaderText = "RawData";
            this.colRawData.Name = "colRawData";
            this.colRawData.Visible = false;
            // 
            // colTransactionRawDataNo
            // 
            this.colTransactionRawDataNo.DataPropertyName = "TransactionRawDataNo";
            this.colTransactionRawDataNo.HeaderText = "TransactionRawDataNo";
            this.colTransactionRawDataNo.Name = "colTransactionRawDataNo";
            this.colTransactionRawDataNo.Visible = false;
            // 
            // frmMapEDIData
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(447, 621);
            this.Controls.Add(this.btnMap);
            this.Controls.Add(this.btnExit);
            this.Controls.Add(this.dgvEDIData);
            this.Controls.Add(this.gbSearch);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmMapEDIData";
            this.Text = "Map EDI Data To Application Data";
            this.Load += new System.EventHandler(this.frmMapEDIData_Load);
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
        private System.Windows.Forms.ComboBox cboTransactionSet;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.Label lblTransactionSet;
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
        private System.Data.DataColumn dcTransactionSetNo;
        private System.Data.DataColumn dcTradingPartnerName;
        private System.Data.DataColumn dcTransactionSetID;
        private System.Data.DataColumn dcTransactionDate;
        private System.Data.DataColumn dcTransactionKey;
        private System.Data.DataColumn dcRawData;
        private System.Data.DataColumn dcXMLData;
        private System.Data.DataColumn dcInterchangeSenderIDQual;
        private System.Data.DataColumn dcInterchangeSenderID;
        private System.Data.DataColumn dcInterchangeReceiverIDQual;
        private System.Data.DataColumn dcInterchangeReceiverID;
        private System.Data.DataColumn dcApplicationSenderCode;
        private System.Data.DataColumn dcApplicationReceiverCode;
        private System.Data.DataColumn dcSegmentTerminator;
        private System.Data.DataColumn dcTransactionRawDataNo;
        private System.Data.DataColumn dcElementTerminator;
        private System.Windows.Forms.DataGridViewCheckBoxColumn colSelect;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTradingPartner;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTSet;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTransactionDate;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTransactionKey;
        private System.Windows.Forms.DataGridViewTextBoxColumn colSenderID;
        private System.Windows.Forms.DataGridViewTextBoxColumn colSenderQual;
        private System.Windows.Forms.DataGridViewTextBoxColumn colReceiverID;
        private System.Windows.Forms.DataGridViewTextBoxColumn colReceiverQual;
        private System.Windows.Forms.DataGridViewTextBoxColumn colAppSenderID;
        private System.Windows.Forms.DataGridViewTextBoxColumn colAppReceiverID;
        private System.Windows.Forms.DataGridViewTextBoxColumn colRawData;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTransactionRawDataNo;
    }
}