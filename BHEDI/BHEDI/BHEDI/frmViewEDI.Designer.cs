namespace BHEDI
{
    partial class frmViewEDI
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmViewEDI));
            this.gbSearch = new System.Windows.Forms.GroupBox();
            this.btnClear = new System.Windows.Forms.Button();
            this.cboTradingPartner = new System.Windows.Forms.ComboBox();
            this.txtEDIDataContains = new System.Windows.Forms.TextBox();
            this.cboTransactionSet = new System.Windows.Forms.ComboBox();
            this.txtTransactionKey_T = new System.Windows.Forms.TextBox();
            this.txtTransactionKey_F = new System.Windows.Forms.TextBox();
            this.btnSearch = new System.Windows.Forms.Button();
            this.lblTransactionKeyDash = new System.Windows.Forms.Label();
            this.lblTransactionKey = new System.Windows.Forms.Label();
            this.lblEDIDataContains = new System.Windows.Forms.Label();
            this.lblTransactionSet = new System.Windows.Forms.Label();
            this.lblTradingPartnerList = new System.Windows.Forms.Label();
            this.cboDirection = new System.Windows.Forms.ComboBox();
            this.lblDirection = new System.Windows.Forms.Label();
            this.dtpDateTo = new System.Windows.Forms.DateTimePicker();
            this.lblDateDash = new System.Windows.Forms.Label();
            this.dtpDateFrom = new System.Windows.Forms.DateTimePicker();
            this.lblDate = new System.Windows.Forms.Label();
            this.dgvEDIData = new System.Windows.Forms.DataGridView();
            this.colSelect = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.colTradingPartnerNo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTransactionSetNo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTransactionRawDataNo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colSegmentTerminator = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTerminator = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTradingPartner = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTransactionSetID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colInOutDisplay = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTransactionDate = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTransactionKey = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colRawData = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colXMLData = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colInterchangeSenderIDQual = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colInterchangeSenderID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colInterchangeReceiverIDQual = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colInterchangeReceiverID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colApplicationSenderCode = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colApplicationReceiverCode = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colInterchangeControlNum = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colGroupControlNum = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.bdsEDIData = new System.Windows.Forms.BindingSource(this.components);
            this.btnRemap = new System.Windows.Forms.Button();
            this.btnResend = new System.Windows.Forms.Button();
            this.btnErrorCheck = new System.Windows.Forms.Button();
            this.tabEDIData = new System.Windows.Forms.TabControl();
            this.tpgEDIData = new System.Windows.Forms.TabPage();
            this.txtEDIData = new System.Windows.Forms.RichTextBox();
            this.tpgXMLData = new System.Windows.Forms.TabPage();
            this.txtXMLData = new System.Windows.Forms.RichTextBox();
            this.tpgHeader = new System.Windows.Forms.TabPage();
            this.gbGS = new System.Windows.Forms.GroupBox();
            this.txtGS06GroupControlNumber = new System.Windows.Forms.TextBox();
            this.lblGS06GroupControlNumber = new System.Windows.Forms.Label();
            this.txtGS03ApplicationReceiverCode = new System.Windows.Forms.TextBox();
            this.lblGS02ApplicationSenderCode = new System.Windows.Forms.Label();
            this.txtGS02ApplicationSenderCode = new System.Windows.Forms.TextBox();
            this.lblGS03ApplicationReceiverCode = new System.Windows.Forms.Label();
            this.gbISA = new System.Windows.Forms.GroupBox();
            this.txtISA13InterchangeControlNum = new System.Windows.Forms.TextBox();
            this.lblISA13InterchangeControlNum = new System.Windows.Forms.Label();
            this.txtISA08InterchangeReceiverID = new System.Windows.Forms.TextBox();
            this.lblISA08InterchangeReceiverID = new System.Windows.Forms.Label();
            this.txtISA07InterchangeReceiverIDQual = new System.Windows.Forms.TextBox();
            this.lblISA07InterchangeReceiverIDQual = new System.Windows.Forms.Label();
            this.txtISA06InterchangeSenderID = new System.Windows.Forms.TextBox();
            this.lblISA06InterchangeSenderID = new System.Windows.Forms.Label();
            this.txtISA05InterchangeSenderIDQual = new System.Windows.Forms.TextBox();
            this.lblISA05InterchangeSenderIDQual = new System.Windows.Forms.Label();
            this.tpgLot = new System.Windows.Forms.TabPage();
            this.txtLogs = new System.Windows.Forms.TextBox();
            this.btnEdit = new System.Windows.Forms.Button();
            this.btnMapDesign = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.btnPrevious = new System.Windows.Forms.Button();
            this.btnNext = new System.Windows.Forms.Button();
            this.btnBackward = new System.Windows.Forms.Button();
            this.btnForward = new System.Windows.Forms.Button();
            this.btn997 = new System.Windows.Forms.Button();
            this.txtPartnerName = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.gbSearch.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEDIData)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsEDIData)).BeginInit();
            this.tabEDIData.SuspendLayout();
            this.tpgEDIData.SuspendLayout();
            this.tpgXMLData.SuspendLayout();
            this.tpgHeader.SuspendLayout();
            this.gbGS.SuspendLayout();
            this.gbISA.SuspendLayout();
            this.tpgLot.SuspendLayout();
            this.SuspendLayout();
            // 
            // gbSearch
            // 
            this.gbSearch.Controls.Add(this.label1);
            this.gbSearch.Controls.Add(this.txtPartnerName);
            this.gbSearch.Controls.Add(this.btnClear);
            this.gbSearch.Controls.Add(this.cboTradingPartner);
            this.gbSearch.Controls.Add(this.txtEDIDataContains);
            this.gbSearch.Controls.Add(this.cboTransactionSet);
            this.gbSearch.Controls.Add(this.txtTransactionKey_T);
            this.gbSearch.Controls.Add(this.txtTransactionKey_F);
            this.gbSearch.Controls.Add(this.btnSearch);
            this.gbSearch.Controls.Add(this.lblTransactionKeyDash);
            this.gbSearch.Controls.Add(this.lblTransactionKey);
            this.gbSearch.Controls.Add(this.lblEDIDataContains);
            this.gbSearch.Controls.Add(this.lblTransactionSet);
            this.gbSearch.Controls.Add(this.lblTradingPartnerList);
            this.gbSearch.Controls.Add(this.cboDirection);
            this.gbSearch.Controls.Add(this.lblDirection);
            this.gbSearch.Controls.Add(this.dtpDateTo);
            this.gbSearch.Controls.Add(this.lblDateDash);
            this.gbSearch.Controls.Add(this.dtpDateFrom);
            this.gbSearch.Controls.Add(this.lblDate);
            this.gbSearch.Location = new System.Drawing.Point(5, 5);
            this.gbSearch.Name = "gbSearch";
            this.gbSearch.Size = new System.Drawing.Size(455, 246);
            this.gbSearch.TabIndex = 0;
            this.gbSearch.TabStop = false;
            this.gbSearch.Text = "Search";
            // 
            // btnClear
            // 
            this.btnClear.Location = new System.Drawing.Point(215, 207);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(91, 34);
            this.btnClear.TabIndex = 17;
            this.btnClear.Text = "Clear";
            this.btnClear.UseVisualStyleBackColor = true;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // cboTradingPartner
            // 
            this.cboTradingPartner.FormattingEnabled = true;
            this.cboTradingPartner.Location = new System.Drawing.Point(110, 67);
            this.cboTradingPartner.Name = "cboTradingPartner";
            this.cboTradingPartner.Size = new System.Drawing.Size(293, 21);
            this.cboTradingPartner.TabIndex = 7;
            // 
            // txtEDIDataContains
            // 
            this.txtEDIDataContains.Location = new System.Drawing.Point(110, 152);
            this.txtEDIDataContains.Name = "txtEDIDataContains";
            this.txtEDIDataContains.Size = new System.Drawing.Size(293, 20);
            this.txtEDIDataContains.TabIndex = 11;
            // 
            // cboTransactionSet
            // 
            this.cboTransactionSet.FormattingEnabled = true;
            this.cboTransactionSet.Location = new System.Drawing.Point(110, 123);
            this.cboTransactionSet.Name = "cboTransactionSet";
            this.cboTransactionSet.Size = new System.Drawing.Size(293, 21);
            this.cboTransactionSet.TabIndex = 9;
            // 
            // txtTransactionKey_T
            // 
            this.txtTransactionKey_T.Location = new System.Drawing.Point(269, 180);
            this.txtTransactionKey_T.Name = "txtTransactionKey_T";
            this.txtTransactionKey_T.Size = new System.Drawing.Size(134, 20);
            this.txtTransactionKey_T.TabIndex = 15;
            // 
            // txtTransactionKey_F
            // 
            this.txtTransactionKey_F.Location = new System.Drawing.Point(110, 180);
            this.txtTransactionKey_F.Name = "txtTransactionKey_F";
            this.txtTransactionKey_F.Size = new System.Drawing.Size(134, 20);
            this.txtTransactionKey_F.TabIndex = 13;
            // 
            // btnSearch
            // 
            this.btnSearch.Location = new System.Drawing.Point(312, 207);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(91, 34);
            this.btnSearch.TabIndex = 16;
            this.btnSearch.Text = "Search";
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // lblTransactionKeyDash
            // 
            this.lblTransactionKeyDash.AutoSize = true;
            this.lblTransactionKeyDash.Location = new System.Drawing.Point(248, 184);
            this.lblTransactionKeyDash.Name = "lblTransactionKeyDash";
            this.lblTransactionKeyDash.Size = new System.Drawing.Size(16, 13);
            this.lblTransactionKeyDash.TabIndex = 14;
            this.lblTransactionKeyDash.Text = " - ";
            // 
            // lblTransactionKey
            // 
            this.lblTransactionKey.AutoSize = true;
            this.lblTransactionKey.Location = new System.Drawing.Point(14, 183);
            this.lblTransactionKey.Name = "lblTransactionKey";
            this.lblTransactionKey.Size = new System.Drawing.Size(87, 13);
            this.lblTransactionKey.TabIndex = 12;
            this.lblTransactionKey.Text = "Transaction Key:";
            // 
            // lblEDIDataContains
            // 
            this.lblEDIDataContains.AutoSize = true;
            this.lblEDIDataContains.Location = new System.Drawing.Point(3, 155);
            this.lblEDIDataContains.Name = "lblEDIDataContains";
            this.lblEDIDataContains.Size = new System.Drawing.Size(98, 13);
            this.lblEDIDataContains.TabIndex = 10;
            this.lblEDIDataContains.Text = "EDI Data Contains:";
            // 
            // lblTransactionSet
            // 
            this.lblTransactionSet.AutoSize = true;
            this.lblTransactionSet.Location = new System.Drawing.Point(16, 126);
            this.lblTransactionSet.Name = "lblTransactionSet";
            this.lblTransactionSet.Size = new System.Drawing.Size(85, 13);
            this.lblTransactionSet.TabIndex = 8;
            this.lblTransactionSet.Text = "Transaction Set:";
            // 
            // lblTradingPartnerList
            // 
            this.lblTradingPartnerList.AutoSize = true;
            this.lblTradingPartnerList.Location = new System.Drawing.Point(18, 70);
            this.lblTradingPartnerList.Name = "lblTradingPartnerList";
            this.lblTradingPartnerList.Size = new System.Drawing.Size(83, 13);
            this.lblTradingPartnerList.TabIndex = 6;
            this.lblTradingPartnerList.Text = "Trading Partner:";
            // 
            // cboDirection
            // 
            this.cboDirection.FormattingEnabled = true;
            this.cboDirection.Location = new System.Drawing.Point(110, 40);
            this.cboDirection.Name = "cboDirection";
            this.cboDirection.Size = new System.Drawing.Size(103, 21);
            this.cboDirection.TabIndex = 5;
            // 
            // lblDirection
            // 
            this.lblDirection.AutoSize = true;
            this.lblDirection.Location = new System.Drawing.Point(49, 43);
            this.lblDirection.Name = "lblDirection";
            this.lblDirection.Size = new System.Drawing.Size(52, 13);
            this.lblDirection.TabIndex = 4;
            this.lblDirection.Text = "Direction:";
            // 
            // dtpDateTo
            // 
            this.dtpDateTo.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpDateTo.Location = new System.Drawing.Point(235, 14);
            this.dtpDateTo.Name = "dtpDateTo";
            this.dtpDateTo.Size = new System.Drawing.Size(100, 20);
            this.dtpDateTo.TabIndex = 3;
            // 
            // lblDateDash
            // 
            this.lblDateDash.AutoSize = true;
            this.lblDateDash.Location = new System.Drawing.Point(214, 18);
            this.lblDateDash.Name = "lblDateDash";
            this.lblDateDash.Size = new System.Drawing.Size(16, 13);
            this.lblDateDash.TabIndex = 2;
            this.lblDateDash.Text = " - ";
            // 
            // dtpDateFrom
            // 
            this.dtpDateFrom.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpDateFrom.Location = new System.Drawing.Point(110, 14);
            this.dtpDateFrom.Name = "dtpDateFrom";
            this.dtpDateFrom.Size = new System.Drawing.Size(100, 20);
            this.dtpDateFrom.TabIndex = 1;
            // 
            // lblDate
            // 
            this.lblDate.AutoSize = true;
            this.lblDate.Location = new System.Drawing.Point(68, 16);
            this.lblDate.Name = "lblDate";
            this.lblDate.Size = new System.Drawing.Size(33, 13);
            this.lblDate.TabIndex = 0;
            this.lblDate.Text = "Date:";
            // 
            // dgvEDIData
            // 
            this.dgvEDIData.AllowUserToAddRows = false;
            this.dgvEDIData.AllowUserToDeleteRows = false;
            this.dgvEDIData.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.dgvEDIData.AutoGenerateColumns = false;
            this.dgvEDIData.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colSelect,
            this.colTradingPartnerNo,
            this.colTransactionSetNo,
            this.colTransactionRawDataNo,
            this.colSegmentTerminator,
            this.colTerminator,
            this.colTradingPartner,
            this.colTransactionSetID,
            this.colInOutDisplay,
            this.colTransactionDate,
            this.colTransactionKey,
            this.colRawData,
            this.colXMLData,
            this.colInterchangeSenderIDQual,
            this.colInterchangeSenderID,
            this.colInterchangeReceiverIDQual,
            this.colInterchangeReceiverID,
            this.colApplicationSenderCode,
            this.colApplicationReceiverCode,
            this.colInterchangeControlNum,
            this.colGroupControlNum});
            this.dgvEDIData.DataSource = this.bdsEDIData;
            this.dgvEDIData.Location = new System.Drawing.Point(5, 257);
            this.dgvEDIData.MultiSelect = false;
            this.dgvEDIData.Name = "dgvEDIData";
            this.dgvEDIData.RowHeadersVisible = false;
            this.dgvEDIData.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvEDIData.Size = new System.Drawing.Size(455, 368);
            this.dgvEDIData.TabIndex = 1;
            this.dgvEDIData.DataBindingComplete += new System.Windows.Forms.DataGridViewBindingCompleteEventHandler(this.dgvEDIData_DataBindingComplete);
            this.dgvEDIData.DataError += new System.Windows.Forms.DataGridViewDataErrorEventHandler(this.dgvEDIData_DataError);
            this.dgvEDIData.SelectionChanged += new System.EventHandler(this.dgvEDIData_SelectionChanged);
            // 
            // colSelect
            // 
            this.colSelect.HeaderText = "";
            this.colSelect.Name = "colSelect";
            this.colSelect.Width = 30;
            // 
            // colTradingPartnerNo
            // 
            this.colTradingPartnerNo.DataPropertyName = "TradingPartnerNo";
            this.colTradingPartnerNo.HeaderText = "TradingPartnerNo";
            this.colTradingPartnerNo.Name = "colTradingPartnerNo";
            this.colTradingPartnerNo.ReadOnly = true;
            this.colTradingPartnerNo.Visible = false;
            // 
            // colTransactionSetNo
            // 
            this.colTransactionSetNo.HeaderText = "TransactionSetNo";
            this.colTransactionSetNo.Name = "colTransactionSetNo";
            this.colTransactionSetNo.Visible = false;
            // 
            // colTransactionRawDataNo
            // 
            this.colTransactionRawDataNo.HeaderText = "TransactionRawDataNo";
            this.colTransactionRawDataNo.Name = "colTransactionRawDataNo";
            this.colTransactionRawDataNo.Visible = false;
            // 
            // colSegmentTerminator
            // 
            this.colSegmentTerminator.HeaderText = "SegmentTerminator";
            this.colSegmentTerminator.Name = "colSegmentTerminator";
            this.colSegmentTerminator.Visible = false;
            // 
            // colTerminator
            // 
            this.colTerminator.HeaderText = "Terminator";
            this.colTerminator.Name = "colTerminator";
            this.colTerminator.Visible = false;
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
            // colTransactionSetID
            // 
            this.colTransactionSetID.DataPropertyName = "TransactionSetID";
            this.colTransactionSetID.HeaderText = "T-Set";
            this.colTransactionSetID.Name = "colTransactionSetID";
            this.colTransactionSetID.ReadOnly = true;
            this.colTransactionSetID.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colTransactionSetID.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            this.colTransactionSetID.Width = 70;
            // 
            // colInOutDisplay
            // 
            this.colInOutDisplay.DataPropertyName = "InOutDisplay";
            this.colInOutDisplay.HeaderText = "In/Out";
            this.colInOutDisplay.Name = "colInOutDisplay";
            this.colInOutDisplay.ReadOnly = true;
            this.colInOutDisplay.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colInOutDisplay.Width = 50;
            // 
            // colTransactionDate
            // 
            this.colTransactionDate.DataPropertyName = "TransactionDate";
            this.colTransactionDate.HeaderText = "Transaction Date";
            this.colTransactionDate.Name = "colTransactionDate";
            this.colTransactionDate.ReadOnly = true;
            this.colTransactionDate.Width = 110;
            // 
            // colTransactionKey
            // 
            this.colTransactionKey.DataPropertyName = "TransactionKey";
            this.colTransactionKey.HeaderText = "Transaction Key";
            this.colTransactionKey.Name = "colTransactionKey";
            this.colTransactionKey.ReadOnly = true;
            // 
            // colRawData
            // 
            this.colRawData.HeaderText = "TransactionRawData";
            this.colRawData.Name = "colRawData";
            this.colRawData.Visible = false;
            // 
            // colXMLData
            // 
            this.colXMLData.HeaderText = "TransactionXMLData";
            this.colXMLData.Name = "colXMLData";
            this.colXMLData.Visible = false;
            // 
            // colInterchangeSenderIDQual
            // 
            this.colInterchangeSenderIDQual.HeaderText = "InterchangeSenderIDQual";
            this.colInterchangeSenderIDQual.Name = "colInterchangeSenderIDQual";
            this.colInterchangeSenderIDQual.Visible = false;
            // 
            // colInterchangeSenderID
            // 
            this.colInterchangeSenderID.HeaderText = "InterchangeSenderID";
            this.colInterchangeSenderID.Name = "colInterchangeSenderID";
            this.colInterchangeSenderID.Visible = false;
            // 
            // colInterchangeReceiverIDQual
            // 
            this.colInterchangeReceiverIDQual.HeaderText = "InterchangeReceiverIDQual";
            this.colInterchangeReceiverIDQual.Name = "colInterchangeReceiverIDQual";
            this.colInterchangeReceiverIDQual.Visible = false;
            // 
            // colInterchangeReceiverID
            // 
            this.colInterchangeReceiverID.HeaderText = "InterchangeReceiverID";
            this.colInterchangeReceiverID.Name = "colInterchangeReceiverID";
            this.colInterchangeReceiverID.Visible = false;
            // 
            // colApplicationSenderCode
            // 
            this.colApplicationSenderCode.HeaderText = "ApplicationSenderCode";
            this.colApplicationSenderCode.Name = "colApplicationSenderCode";
            this.colApplicationSenderCode.Visible = false;
            // 
            // colApplicationReceiverCode
            // 
            this.colApplicationReceiverCode.HeaderText = "ApplicationReceiverCode";
            this.colApplicationReceiverCode.Name = "colApplicationReceiverCode";
            this.colApplicationReceiverCode.Visible = false;
            // 
            // colInterchangeControlNum
            // 
            this.colInterchangeControlNum.HeaderText = "InterchangeControlNum";
            this.colInterchangeControlNum.Name = "colInterchangeControlNum";
            this.colInterchangeControlNum.Visible = false;
            // 
            // colGroupControlNum
            // 
            this.colGroupControlNum.HeaderText = "GroupControlNum";
            this.colGroupControlNum.Name = "colGroupControlNum";
            this.colGroupControlNum.Visible = false;
            // 
            // btnRemap
            // 
            this.btnRemap.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnRemap.Location = new System.Drawing.Point(9, 633);
            this.btnRemap.Name = "btnRemap";
            this.btnRemap.Size = new System.Drawing.Size(91, 34);
            this.btnRemap.TabIndex = 3;
            this.btnRemap.Text = "Re-Map";
            this.btnRemap.UseVisualStyleBackColor = true;
            this.btnRemap.Click += new System.EventHandler(this.btnRemap_Click);
            // 
            // btnResend
            // 
            this.btnResend.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnResend.Location = new System.Drawing.Point(109, 633);
            this.btnResend.Name = "btnResend";
            this.btnResend.Size = new System.Drawing.Size(91, 34);
            this.btnResend.TabIndex = 4;
            this.btnResend.Text = "Re-Send";
            this.btnResend.UseVisualStyleBackColor = true;
            this.btnResend.Click += new System.EventHandler(this.btnResend_Click);
            // 
            // btnErrorCheck
            // 
            this.btnErrorCheck.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnErrorCheck.Location = new System.Drawing.Point(210, 633);
            this.btnErrorCheck.Name = "btnErrorCheck";
            this.btnErrorCheck.Size = new System.Drawing.Size(91, 34);
            this.btnErrorCheck.TabIndex = 5;
            this.btnErrorCheck.Text = "Error Check";
            this.btnErrorCheck.UseVisualStyleBackColor = true;
            this.btnErrorCheck.Click += new System.EventHandler(this.btnErrorCheck_Click);
            // 
            // tabEDIData
            // 
            this.tabEDIData.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tabEDIData.Controls.Add(this.tpgEDIData);
            this.tabEDIData.Controls.Add(this.tpgXMLData);
            this.tabEDIData.Controls.Add(this.tpgHeader);
            this.tabEDIData.Controls.Add(this.tpgLot);
            this.tabEDIData.Location = new System.Drawing.Point(466, 5);
            this.tabEDIData.Name = "tabEDIData";
            this.tabEDIData.SelectedIndex = 0;
            this.tabEDIData.Size = new System.Drawing.Size(643, 622);
            this.tabEDIData.TabIndex = 2;
            // 
            // tpgEDIData
            // 
            this.tpgEDIData.Controls.Add(this.txtEDIData);
            this.tpgEDIData.Location = new System.Drawing.Point(4, 22);
            this.tpgEDIData.Name = "tpgEDIData";
            this.tpgEDIData.Padding = new System.Windows.Forms.Padding(3);
            this.tpgEDIData.Size = new System.Drawing.Size(635, 596);
            this.tpgEDIData.TabIndex = 0;
            this.tpgEDIData.Text = "EDI Data";
            this.tpgEDIData.UseVisualStyleBackColor = true;
            // 
            // txtEDIData
            // 
            this.txtEDIData.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtEDIData.Location = new System.Drawing.Point(6, 3);
            this.txtEDIData.Name = "txtEDIData";
            this.txtEDIData.Size = new System.Drawing.Size(623, 581);
            this.txtEDIData.TabIndex = 0;
            this.txtEDIData.Text = "";
            this.txtEDIData.WordWrap = false;
            // 
            // tpgXMLData
            // 
            this.tpgXMLData.Controls.Add(this.txtXMLData);
            this.tpgXMLData.Location = new System.Drawing.Point(4, 22);
            this.tpgXMLData.Name = "tpgXMLData";
            this.tpgXMLData.Padding = new System.Windows.Forms.Padding(3);
            this.tpgXMLData.Size = new System.Drawing.Size(635, 561);
            this.tpgXMLData.TabIndex = 1;
            this.tpgXMLData.Text = "XML Data";
            this.tpgXMLData.UseVisualStyleBackColor = true;
            // 
            // txtXMLData
            // 
            this.txtXMLData.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtXMLData.Location = new System.Drawing.Point(6, 3);
            this.txtXMLData.Name = "txtXMLData";
            this.txtXMLData.Size = new System.Drawing.Size(623, 552);
            this.txtXMLData.TabIndex = 11;
            this.txtXMLData.Text = "";
            // 
            // tpgHeader
            // 
            this.tpgHeader.Controls.Add(this.gbGS);
            this.tpgHeader.Controls.Add(this.gbISA);
            this.tpgHeader.Location = new System.Drawing.Point(4, 22);
            this.tpgHeader.Name = "tpgHeader";
            this.tpgHeader.Size = new System.Drawing.Size(635, 561);
            this.tpgHeader.TabIndex = 2;
            this.tpgHeader.Text = "Header";
            this.tpgHeader.UseVisualStyleBackColor = true;
            // 
            // gbGS
            // 
            this.gbGS.Controls.Add(this.txtGS06GroupControlNumber);
            this.gbGS.Controls.Add(this.lblGS06GroupControlNumber);
            this.gbGS.Controls.Add(this.txtGS03ApplicationReceiverCode);
            this.gbGS.Controls.Add(this.lblGS02ApplicationSenderCode);
            this.gbGS.Controls.Add(this.txtGS02ApplicationSenderCode);
            this.gbGS.Controls.Add(this.lblGS03ApplicationReceiverCode);
            this.gbGS.Location = new System.Drawing.Point(17, 195);
            this.gbGS.Name = "gbGS";
            this.gbGS.Size = new System.Drawing.Size(423, 102);
            this.gbGS.TabIndex = 1;
            this.gbGS.TabStop = false;
            this.gbGS.Text = "GS";
            // 
            // txtGS06GroupControlNumber
            // 
            this.txtGS06GroupControlNumber.Location = new System.Drawing.Point(225, 72);
            this.txtGS06GroupControlNumber.Name = "txtGS06GroupControlNumber";
            this.txtGS06GroupControlNumber.Size = new System.Drawing.Size(182, 20);
            this.txtGS06GroupControlNumber.TabIndex = 5;
            // 
            // lblGS06GroupControlNumber
            // 
            this.lblGS06GroupControlNumber.AutoSize = true;
            this.lblGS06GroupControlNumber.Location = new System.Drawing.Point(6, 76);
            this.lblGS06GroupControlNumber.Name = "lblGS06GroupControlNumber";
            this.lblGS06GroupControlNumber.Size = new System.Drawing.Size(148, 13);
            this.lblGS06GroupControlNumber.TabIndex = 4;
            this.lblGS06GroupControlNumber.Text = "GS 06 Group Control Number:";
            // 
            // txtGS03ApplicationReceiverCode
            // 
            this.txtGS03ApplicationReceiverCode.Location = new System.Drawing.Point(225, 46);
            this.txtGS03ApplicationReceiverCode.Name = "txtGS03ApplicationReceiverCode";
            this.txtGS03ApplicationReceiverCode.Size = new System.Drawing.Size(182, 20);
            this.txtGS03ApplicationReceiverCode.TabIndex = 3;
            // 
            // lblGS02ApplicationSenderCode
            // 
            this.lblGS02ApplicationSenderCode.AutoSize = true;
            this.lblGS02ApplicationSenderCode.Location = new System.Drawing.Point(6, 24);
            this.lblGS02ApplicationSenderCode.Name = "lblGS02ApplicationSenderCode";
            this.lblGS02ApplicationSenderCode.Size = new System.Drawing.Size(160, 13);
            this.lblGS02ApplicationSenderCode.TabIndex = 0;
            this.lblGS02ApplicationSenderCode.Text = "GS 02 Application Sender Code:";
            // 
            // txtGS02ApplicationSenderCode
            // 
            this.txtGS02ApplicationSenderCode.Location = new System.Drawing.Point(225, 20);
            this.txtGS02ApplicationSenderCode.Name = "txtGS02ApplicationSenderCode";
            this.txtGS02ApplicationSenderCode.Size = new System.Drawing.Size(182, 20);
            this.txtGS02ApplicationSenderCode.TabIndex = 1;
            // 
            // lblGS03ApplicationReceiverCode
            // 
            this.lblGS03ApplicationReceiverCode.AutoSize = true;
            this.lblGS03ApplicationReceiverCode.Location = new System.Drawing.Point(6, 50);
            this.lblGS03ApplicationReceiverCode.Name = "lblGS03ApplicationReceiverCode";
            this.lblGS03ApplicationReceiverCode.Size = new System.Drawing.Size(169, 13);
            this.lblGS03ApplicationReceiverCode.TabIndex = 2;
            this.lblGS03ApplicationReceiverCode.Text = "GS 03 Application Receiver Code:";
            // 
            // gbISA
            // 
            this.gbISA.Controls.Add(this.txtISA13InterchangeControlNum);
            this.gbISA.Controls.Add(this.lblISA13InterchangeControlNum);
            this.gbISA.Controls.Add(this.txtISA08InterchangeReceiverID);
            this.gbISA.Controls.Add(this.lblISA08InterchangeReceiverID);
            this.gbISA.Controls.Add(this.txtISA07InterchangeReceiverIDQual);
            this.gbISA.Controls.Add(this.lblISA07InterchangeReceiverIDQual);
            this.gbISA.Controls.Add(this.txtISA06InterchangeSenderID);
            this.gbISA.Controls.Add(this.lblISA06InterchangeSenderID);
            this.gbISA.Controls.Add(this.txtISA05InterchangeSenderIDQual);
            this.gbISA.Controls.Add(this.lblISA05InterchangeSenderIDQual);
            this.gbISA.Location = new System.Drawing.Point(17, 30);
            this.gbISA.Name = "gbISA";
            this.gbISA.Size = new System.Drawing.Size(423, 159);
            this.gbISA.TabIndex = 0;
            this.gbISA.TabStop = false;
            this.gbISA.Text = "ISA";
            // 
            // txtISA13InterchangeControlNum
            // 
            this.txtISA13InterchangeControlNum.Location = new System.Drawing.Point(225, 122);
            this.txtISA13InterchangeControlNum.Name = "txtISA13InterchangeControlNum";
            this.txtISA13InterchangeControlNum.Size = new System.Drawing.Size(182, 20);
            this.txtISA13InterchangeControlNum.TabIndex = 9;
            // 
            // lblISA13InterchangeControlNum
            // 
            this.lblISA13InterchangeControlNum.AutoSize = true;
            this.lblISA13InterchangeControlNum.Location = new System.Drawing.Point(6, 126);
            this.lblISA13InterchangeControlNum.Name = "lblISA13InterchangeControlNum";
            this.lblISA13InterchangeControlNum.Size = new System.Drawing.Size(178, 13);
            this.lblISA13InterchangeControlNum.TabIndex = 8;
            this.lblISA13InterchangeControlNum.Text = "ISA 13 Interchange Control Number:";
            // 
            // txtISA08InterchangeReceiverID
            // 
            this.txtISA08InterchangeReceiverID.Location = new System.Drawing.Point(225, 97);
            this.txtISA08InterchangeReceiverID.Name = "txtISA08InterchangeReceiverID";
            this.txtISA08InterchangeReceiverID.Size = new System.Drawing.Size(182, 20);
            this.txtISA08InterchangeReceiverID.TabIndex = 7;
            // 
            // lblISA08InterchangeReceiverID
            // 
            this.lblISA08InterchangeReceiverID.AutoSize = true;
            this.lblISA08InterchangeReceiverID.Location = new System.Drawing.Point(6, 101);
            this.lblISA08InterchangeReceiverID.Name = "lblISA08InterchangeReceiverID";
            this.lblISA08InterchangeReceiverID.Size = new System.Drawing.Size(162, 13);
            this.lblISA08InterchangeReceiverID.TabIndex = 6;
            this.lblISA08InterchangeReceiverID.Text = "ISA 08 Interchange Receiver ID:";
            // 
            // txtISA07InterchangeReceiverIDQual
            // 
            this.txtISA07InterchangeReceiverIDQual.Location = new System.Drawing.Point(225, 72);
            this.txtISA07InterchangeReceiverIDQual.Name = "txtISA07InterchangeReceiverIDQual";
            this.txtISA07InterchangeReceiverIDQual.Size = new System.Drawing.Size(182, 20);
            this.txtISA07InterchangeReceiverIDQual.TabIndex = 5;
            // 
            // lblISA07InterchangeReceiverIDQual
            // 
            this.lblISA07InterchangeReceiverIDQual.AutoSize = true;
            this.lblISA07InterchangeReceiverIDQual.Location = new System.Drawing.Point(6, 76);
            this.lblISA07InterchangeReceiverIDQual.Name = "lblISA07InterchangeReceiverIDQual";
            this.lblISA07InterchangeReceiverIDQual.Size = new System.Drawing.Size(187, 13);
            this.lblISA07InterchangeReceiverIDQual.TabIndex = 4;
            this.lblISA07InterchangeReceiverIDQual.Text = "ISA 07 Interchange Receiver ID Qual:";
            // 
            // txtISA06InterchangeSenderID
            // 
            this.txtISA06InterchangeSenderID.Location = new System.Drawing.Point(225, 47);
            this.txtISA06InterchangeSenderID.Name = "txtISA06InterchangeSenderID";
            this.txtISA06InterchangeSenderID.Size = new System.Drawing.Size(182, 20);
            this.txtISA06InterchangeSenderID.TabIndex = 3;
            // 
            // lblISA06InterchangeSenderID
            // 
            this.lblISA06InterchangeSenderID.AutoSize = true;
            this.lblISA06InterchangeSenderID.Location = new System.Drawing.Point(6, 51);
            this.lblISA06InterchangeSenderID.Name = "lblISA06InterchangeSenderID";
            this.lblISA06InterchangeSenderID.Size = new System.Drawing.Size(153, 13);
            this.lblISA06InterchangeSenderID.TabIndex = 2;
            this.lblISA06InterchangeSenderID.Text = "ISA 06 Interchange Sender ID:";
            // 
            // txtISA05InterchangeSenderIDQual
            // 
            this.txtISA05InterchangeSenderIDQual.Location = new System.Drawing.Point(225, 22);
            this.txtISA05InterchangeSenderIDQual.Name = "txtISA05InterchangeSenderIDQual";
            this.txtISA05InterchangeSenderIDQual.Size = new System.Drawing.Size(182, 20);
            this.txtISA05InterchangeSenderIDQual.TabIndex = 1;
            // 
            // lblISA05InterchangeSenderIDQual
            // 
            this.lblISA05InterchangeSenderIDQual.AutoSize = true;
            this.lblISA05InterchangeSenderIDQual.Location = new System.Drawing.Point(6, 26);
            this.lblISA05InterchangeSenderIDQual.Name = "lblISA05InterchangeSenderIDQual";
            this.lblISA05InterchangeSenderIDQual.Size = new System.Drawing.Size(178, 13);
            this.lblISA05InterchangeSenderIDQual.TabIndex = 0;
            this.lblISA05InterchangeSenderIDQual.Text = "ISA 05 Interchange Sender ID Qual:";
            // 
            // tpgLot
            // 
            this.tpgLot.Controls.Add(this.txtLogs);
            this.tpgLot.Location = new System.Drawing.Point(4, 22);
            this.tpgLot.Name = "tpgLot";
            this.tpgLot.Size = new System.Drawing.Size(635, 561);
            this.tpgLot.TabIndex = 3;
            this.tpgLot.Text = "Logs";
            this.tpgLot.UseVisualStyleBackColor = true;
            // 
            // txtLogs
            // 
            this.txtLogs.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtLogs.Location = new System.Drawing.Point(6, 3);
            this.txtLogs.Multiline = true;
            this.txtLogs.Name = "txtLogs";
            this.txtLogs.ReadOnly = true;
            this.txtLogs.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtLogs.Size = new System.Drawing.Size(663, 560);
            this.txtLogs.TabIndex = 0;
            // 
            // btnEdit
            // 
            this.btnEdit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnEdit.Location = new System.Drawing.Point(1013, 633);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(91, 34);
            this.btnEdit.TabIndex = 13;
            this.btnEdit.Text = "Edit";
            this.btnEdit.UseVisualStyleBackColor = true;
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // btnMapDesign
            // 
            this.btnMapDesign.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnMapDesign.Location = new System.Drawing.Point(698, 633);
            this.btnMapDesign.Name = "btnMapDesign";
            this.btnMapDesign.Size = new System.Drawing.Size(91, 34);
            this.btnMapDesign.TabIndex = 10;
            this.btnMapDesign.Text = "Map Design";
            this.btnMapDesign.UseVisualStyleBackColor = true;
            this.btnMapDesign.Click += new System.EventHandler(this.btnMapDesign_Click);
            // 
            // btnSave
            // 
            this.btnSave.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnSave.Location = new System.Drawing.Point(803, 633);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(91, 34);
            this.btnSave.TabIndex = 11;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnDelete.Location = new System.Drawing.Point(908, 633);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(91, 34);
            this.btnDelete.TabIndex = 12;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnExit
            // 
            this.btnExit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnExit.Location = new System.Drawing.Point(1014, 673);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(91, 34);
            this.btnExit.TabIndex = 14;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // btnPrevious
            // 
            this.btnPrevious.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnPrevious.Location = new System.Drawing.Point(109, 673);
            this.btnPrevious.Name = "btnPrevious";
            this.btnPrevious.Size = new System.Drawing.Size(91, 34);
            this.btnPrevious.TabIndex = 7;
            this.btnPrevious.Text = "Previous";
            this.btnPrevious.UseVisualStyleBackColor = true;
            this.btnPrevious.Click += new System.EventHandler(this.btnPrevious_Click);
            // 
            // btnNext
            // 
            this.btnNext.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnNext.Location = new System.Drawing.Point(209, 673);
            this.btnNext.Name = "btnNext";
            this.btnNext.Size = new System.Drawing.Size(91, 34);
            this.btnNext.TabIndex = 8;
            this.btnNext.Text = "Next";
            this.btnNext.UseVisualStyleBackColor = true;
            this.btnNext.Click += new System.EventHandler(this.btnNext_Click);
            // 
            // btnBackward
            // 
            this.btnBackward.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnBackward.Location = new System.Drawing.Point(9, 673);
            this.btnBackward.Name = "btnBackward";
            this.btnBackward.Size = new System.Drawing.Size(91, 34);
            this.btnBackward.TabIndex = 6;
            this.btnBackward.Text = "|<";
            this.btnBackward.UseVisualStyleBackColor = true;
            this.btnBackward.Click += new System.EventHandler(this.btnBackward_Click);
            // 
            // btnForward
            // 
            this.btnForward.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnForward.Location = new System.Drawing.Point(309, 673);
            this.btnForward.Name = "btnForward";
            this.btnForward.Size = new System.Drawing.Size(91, 34);
            this.btnForward.TabIndex = 9;
            this.btnForward.Text = ">|";
            this.btnForward.UseVisualStyleBackColor = true;
            this.btnForward.Click += new System.EventHandler(this.btnForward_Click);
            // 
            // btn997
            // 
            this.btn997.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btn997.Location = new System.Drawing.Point(309, 633);
            this.btn997.Name = "btn997";
            this.btn997.Size = new System.Drawing.Size(91, 34);
            this.btn997.TabIndex = 6;
            this.btn997.Text = "Re-Send 997";
            this.btn997.UseVisualStyleBackColor = true;
            this.btn997.Click += new System.EventHandler(this.btn997_Click);
            // 
            // txtPartnerName
            // 
            this.txtPartnerName.Location = new System.Drawing.Point(110, 95);
            this.txtPartnerName.Name = "txtPartnerName";
            this.txtPartnerName.Size = new System.Drawing.Size(293, 20);
            this.txtPartnerName.TabIndex = 8;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(26, 98);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(75, 13);
            this.label1.TabIndex = 19;
            this.label1.Text = "Partner Name:";
            // 
            // frmViewEDI
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1117, 719);
            this.Controls.Add(this.btn997);
            this.Controls.Add(this.btnEdit);
            this.Controls.Add(this.btnForward);
            this.Controls.Add(this.btnMapDesign);
            this.Controls.Add(this.btnBackward);
            this.Controls.Add(this.btnSave);
            this.Controls.Add(this.btnNext);
            this.Controls.Add(this.btnDelete);
            this.Controls.Add(this.btnPrevious);
            this.Controls.Add(this.btnExit);
            this.Controls.Add(this.tabEDIData);
            this.Controls.Add(this.btnErrorCheck);
            this.Controls.Add(this.gbSearch);
            this.Controls.Add(this.btnResend);
            this.Controls.Add(this.dgvEDIData);
            this.Controls.Add(this.btnRemap);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmViewEDI";
            this.Text = "EDI Data";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmViewEDI_FormClosing);
            this.Load += new System.EventHandler(this.frmViewEDI_Load);
            this.gbSearch.ResumeLayout(false);
            this.gbSearch.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEDIData)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsEDIData)).EndInit();
            this.tabEDIData.ResumeLayout(false);
            this.tpgEDIData.ResumeLayout(false);
            this.tpgXMLData.ResumeLayout(false);
            this.tpgHeader.ResumeLayout(false);
            this.gbGS.ResumeLayout(false);
            this.gbGS.PerformLayout();
            this.gbISA.ResumeLayout(false);
            this.gbISA.PerformLayout();
            this.tpgLot.ResumeLayout(false);
            this.tpgLot.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbSearch;
        private System.Windows.Forms.Label lblTransactionSet;
        private System.Windows.Forms.Label lblTradingPartnerList;
        private System.Windows.Forms.ComboBox cboDirection;
        private System.Windows.Forms.Label lblDirection;
        private System.Windows.Forms.DateTimePicker dtpDateTo;
        private System.Windows.Forms.Label lblDateDash;
        private System.Windows.Forms.DateTimePicker dtpDateFrom;
        private System.Windows.Forms.Label lblDate;
        private System.Windows.Forms.DataGridView dgvEDIData;
        private System.Windows.Forms.Button btnRemap;
        private System.Windows.Forms.Button btnResend;
        private System.Windows.Forms.Button btnErrorCheck;
        private System.Windows.Forms.TabControl tabEDIData;
        private System.Windows.Forms.TabPage tpgEDIData;
        private System.Windows.Forms.Button btnEdit;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.Button btnMapDesign;
        private System.Windows.Forms.TabPage tpgXMLData;
        private System.Windows.Forms.TabPage tpgHeader;
        private System.Windows.Forms.TabPage tpgLot;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.Label lblTransactionKeyDash;
        private System.Windows.Forms.Label lblTransactionKey;
        private System.Windows.Forms.Label lblEDIDataContains;
        private System.Windows.Forms.TextBox txtTransactionKey_T;
        private System.Windows.Forms.TextBox txtTransactionKey_F;
        private System.Windows.Forms.ComboBox cboTransactionSet;
        private System.Windows.Forms.ComboBox cboTradingPartner;
        private System.Windows.Forms.TextBox txtEDIDataContains;
        private System.Windows.Forms.Button btnPrevious;
        private System.Windows.Forms.Button btnNext;
        private System.Windows.Forms.Button btnBackward;
        private System.Windows.Forms.Button btnForward;
        private System.Windows.Forms.BindingSource bdsEDIData;
        private System.Windows.Forms.GroupBox gbISA;
        private System.Windows.Forms.Label lblISA08InterchangeReceiverID;
        private System.Windows.Forms.Label lblISA07InterchangeReceiverIDQual;
        private System.Windows.Forms.Label lblISA06InterchangeSenderID;
        private System.Windows.Forms.Label lblISA05InterchangeSenderIDQual;
        private System.Windows.Forms.TextBox txtISA08InterchangeReceiverID;
        private System.Windows.Forms.TextBox txtISA07InterchangeReceiverIDQual;
        private System.Windows.Forms.TextBox txtISA06InterchangeSenderID;
        private System.Windows.Forms.TextBox txtISA05InterchangeSenderIDQual;
        private System.Windows.Forms.TextBox txtLogs;
        private System.Windows.Forms.GroupBox gbGS;
        private System.Windows.Forms.TextBox txtGS03ApplicationReceiverCode;
        private System.Windows.Forms.Label lblGS02ApplicationSenderCode;
        private System.Windows.Forms.TextBox txtGS02ApplicationSenderCode;
        private System.Windows.Forms.Label lblGS03ApplicationReceiverCode;
        private System.Windows.Forms.TextBox txtGS06GroupControlNumber;
        private System.Windows.Forms.Label lblGS06GroupControlNumber;
        private System.Windows.Forms.TextBox txtISA13InterchangeControlNum;
        private System.Windows.Forms.Label lblISA13InterchangeControlNum;
        private System.Windows.Forms.RichTextBox txtEDIData;
        private System.Windows.Forms.RichTextBox txtXMLData;
        private System.Windows.Forms.DataGridViewCheckBoxColumn colSelect;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTradingPartnerNo;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTransactionSetNo;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTransactionRawDataNo;
        private System.Windows.Forms.DataGridViewTextBoxColumn colSegmentTerminator;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTerminator;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTradingPartner;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTransactionSetID;
        private System.Windows.Forms.DataGridViewTextBoxColumn colInOutDisplay;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTransactionDate;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTransactionKey;
        private System.Windows.Forms.DataGridViewTextBoxColumn colRawData;
        private System.Windows.Forms.DataGridViewTextBoxColumn colXMLData;
        private System.Windows.Forms.DataGridViewTextBoxColumn colInterchangeSenderIDQual;
        private System.Windows.Forms.DataGridViewTextBoxColumn colInterchangeSenderID;
        private System.Windows.Forms.DataGridViewTextBoxColumn colInterchangeReceiverIDQual;
        private System.Windows.Forms.DataGridViewTextBoxColumn colInterchangeReceiverID;
        private System.Windows.Forms.DataGridViewTextBoxColumn colApplicationSenderCode;
        private System.Windows.Forms.DataGridViewTextBoxColumn colApplicationReceiverCode;
        private System.Windows.Forms.DataGridViewTextBoxColumn colInterchangeControlNum;
        private System.Windows.Forms.DataGridViewTextBoxColumn colGroupControlNum;
        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.Button btn997;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtPartnerName;
    }
}