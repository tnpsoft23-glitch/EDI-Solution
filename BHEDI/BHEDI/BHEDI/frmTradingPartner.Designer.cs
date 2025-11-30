namespace BHEDI
{
    partial class frmTradingPartner
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmTradingPartner));
            this.dgvTradingPartner = new System.Windows.Forms.DataGridView();
            this.colTradingPartnerNo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTradingPartnerName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colISASenderID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tradingPartnerNoDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tradingPartnerNameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.authorizationQualDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.authorizationInfoDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.securityQualDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.securityInfoDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.interchangeSenderIDQualDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.interchangeSenderIDDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.interchangeReceiverIDQualDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.interchangeReceiverIDDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.applicationSenderCodeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.applicationReceiverCodeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.responsibleAgencyCodeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.segmentTerminatorDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataElementDelimiterDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.repetitionSepDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.interchangeVersionDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.standardVersionDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.testIndicatorDataGridViewCheckBoxColumn = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.subElementSepDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tblEDITrasactionRawDatasDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tblEDIVersionDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tblErrorLogsDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tblInboundMappingsDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tblOutboundMappingsDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tblSegmentTerminatorDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tblSegmentTerminator1DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tblSegmentTerminator2DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tblSegmentTerminator3DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tblTradingPartnerErrorHandingsDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.bdsTradingPartner = new System.Windows.Forms.BindingSource(this.components);
            this.tabTradingPartner = new System.Windows.Forms.TabControl();
            this.tpgGeneral = new System.Windows.Forms.TabPage();
            this.gbGeneral = new System.Windows.Forms.GroupBox();
            this.cboERPType = new System.Windows.Forms.ComboBox();
            this.bdsERPType = new System.Windows.Forms.BindingSource(this.components);
            this.txtSCPFilePath = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.chkUsingSCP = new System.Windows.Forms.CheckBox();
            this.label3 = new System.Windows.Forms.Label();
            this.chkGSYearFormat = new System.Windows.Forms.CheckBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtOutboundID = new System.Windows.Forms.TextBox();
            this.lblOutboundID = new System.Windows.Forms.Label();
            this.chkTestIndicator = new System.Windows.Forms.CheckBox();
            this.txtISA12InterchangeVer = new System.Windows.Forms.TextBox();
            this.txtGS07ResponsibleAgencyCode = new System.Windows.Forms.TextBox();
            this.txtGS03ApplicationReceiverCode = new System.Windows.Forms.TextBox();
            this.txtGS02ApplicationSenderCode = new System.Windows.Forms.TextBox();
            this.txtISA08InterchangeReceiverID = new System.Windows.Forms.TextBox();
            this.txtISA07InterchangeReceiverIDQual = new System.Windows.Forms.TextBox();
            this.txtISA06InterchangeSenderID = new System.Windows.Forms.TextBox();
            this.txtISA05InterchangeSenderIDQual = new System.Windows.Forms.TextBox();
            this.txtISA04SecurityInfo = new System.Windows.Forms.TextBox();
            this.txtISA03SecurityQual = new System.Windows.Forms.TextBox();
            this.txtISA02AuthorizationInfo = new System.Windows.Forms.TextBox();
            this.txtISA01AuthorizationQual = new System.Windows.Forms.TextBox();
            this.lblGS07ResponsibleAgencyCode = new System.Windows.Forms.Label();
            this.lblGS03ApplicationReceiverCode = new System.Windows.Forms.Label();
            this.lblGS02ApplicationSenderCode = new System.Windows.Forms.Label();
            this.lblISA08InterchangeReceiverID = new System.Windows.Forms.Label();
            this.lblISA07InterchangeReceiverIDQual = new System.Windows.Forms.Label();
            this.lblISA06InterchangeSenderID = new System.Windows.Forms.Label();
            this.lblISA05InterchangeSenderIDQual = new System.Windows.Forms.Label();
            this.lblISA04SecurityInfo = new System.Windows.Forms.Label();
            this.lblISA03SecurityQual = new System.Windows.Forms.Label();
            this.lblISA02AuthorizationInfo = new System.Windows.Forms.Label();
            this.lblISA01AuthorizationQual = new System.Windows.Forms.Label();
            this.cboISA16SubElementSep = new System.Windows.Forms.ComboBox();
            this.bdsSubElementSep = new System.Windows.Forms.BindingSource(this.components);
            this.cboStandardVer = new System.Windows.Forms.ComboBox();
            this.bdsStandardVersion = new System.Windows.Forms.BindingSource(this.components);
            this.cboISA11RepetitionSep = new System.Windows.Forms.ComboBox();
            this.bdsRepetitionSep = new System.Windows.Forms.BindingSource(this.components);
            this.cboDataElementDelimiter = new System.Windows.Forms.ComboBox();
            this.bdsDataElementDelimiter = new System.Windows.Forms.BindingSource(this.components);
            this.cboSegmentTerminator = new System.Windows.Forms.ComboBox();
            this.bdsSegmentTerminator = new System.Windows.Forms.BindingSource(this.components);
            this.lblISA16SubElementSep = new System.Windows.Forms.Label();
            this.lblISA15TestIndicator = new System.Windows.Forms.Label();
            this.lblStandardVer = new System.Windows.Forms.Label();
            this.lblISA12InterchangeVer = new System.Windows.Forms.Label();
            this.lblISA11RepetitionSep = new System.Windows.Forms.Label();
            this.lblDataElementDelimiter = new System.Windows.Forms.Label();
            this.lblSegmentTerminator = new System.Windows.Forms.Label();
            this.txtTradingPartnerAlias = new System.Windows.Forms.TextBox();
            this.lblTraidingPartnerName = new System.Windows.Forms.Label();
            this.tpgTransactionSets = new System.Windows.Forms.TabPage();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.dvAutoCopy = new System.Windows.Forms.DataGridView();
            this.colCopyTradingPartner = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.bdsTradingPartnerCopyList = new System.Windows.Forms.BindingSource(this.components);
            this.bdsTradingPartnerAutoCopy = new System.Windows.Forms.BindingSource(this.components);
            this.btnRemoveCopyTrading = new System.Windows.Forms.Button();
            this.btnAddCopyTrading = new System.Windows.Forms.Button();
            this.txt997Path = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.gbFunctionalAck = new System.Windows.Forms.GroupBox();
            this.cboFunctionalAck = new System.Windows.Forms.ComboBox();
            this.dgvTransactionSets = new System.Windows.Forms.DataGridView();
            this.coltransactionSetNo_Fk = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.bdsTransactionSetList = new System.Windows.Forms.BindingSource(this.components);
            this.bdsTransactionSets = new System.Windows.Forms.BindingSource(this.components);
            this.btnOpenMapDesign = new System.Windows.Forms.Button();
            this.btnRemoveTransactionSet = new System.Windows.Forms.Button();
            this.btnAddTransactionSet = new System.Windows.Forms.Button();
            this.gbErrorAction = new System.Windows.Forms.GroupBox();
            this.cboErrorCheckOption = new System.Windows.Forms.ComboBox();
            this.bdsErrorHandleList = new System.Windows.Forms.BindingSource(this.components);
            this.bdsTransactionSetErrorHandlings = new System.Windows.Forms.BindingSource(this.components);
            this.btnPrevious = new System.Windows.Forms.Button();
            this.btnNext = new System.Windows.Forms.Button();
            this.btnNew = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnPrint = new System.Windows.Forms.Button();
            this.btnSaveEdit = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.btnCopy = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTradingPartner)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTradingPartner)).BeginInit();
            this.tabTradingPartner.SuspendLayout();
            this.tpgGeneral.SuspendLayout();
            this.gbGeneral.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.bdsERPType)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsSubElementSep)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsStandardVersion)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsRepetitionSep)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsDataElementDelimiter)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsSegmentTerminator)).BeginInit();
            this.tpgTransactionSets.SuspendLayout();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dvAutoCopy)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTradingPartnerCopyList)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTradingPartnerAutoCopy)).BeginInit();
            this.gbFunctionalAck.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTransactionSets)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTransactionSetList)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTransactionSets)).BeginInit();
            this.gbErrorAction.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.bdsErrorHandleList)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTransactionSetErrorHandlings)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvTradingPartner
            // 
            this.dgvTradingPartner.AllowUserToAddRows = false;
            this.dgvTradingPartner.AllowUserToDeleteRows = false;
            this.dgvTradingPartner.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.dgvTradingPartner.AutoGenerateColumns = false;
            this.dgvTradingPartner.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvTradingPartner.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colTradingPartnerNo,
            this.colTradingPartnerName,
            this.colISASenderID,
            this.tradingPartnerNoDataGridViewTextBoxColumn,
            this.tradingPartnerNameDataGridViewTextBoxColumn,
            this.authorizationQualDataGridViewTextBoxColumn,
            this.authorizationInfoDataGridViewTextBoxColumn,
            this.securityQualDataGridViewTextBoxColumn,
            this.securityInfoDataGridViewTextBoxColumn,
            this.interchangeSenderIDQualDataGridViewTextBoxColumn,
            this.interchangeSenderIDDataGridViewTextBoxColumn,
            this.interchangeReceiverIDQualDataGridViewTextBoxColumn,
            this.interchangeReceiverIDDataGridViewTextBoxColumn,
            this.applicationSenderCodeDataGridViewTextBoxColumn,
            this.applicationReceiverCodeDataGridViewTextBoxColumn,
            this.responsibleAgencyCodeDataGridViewTextBoxColumn,
            this.segmentTerminatorDataGridViewTextBoxColumn,
            this.dataElementDelimiterDataGridViewTextBoxColumn,
            this.repetitionSepDataGridViewTextBoxColumn,
            this.interchangeVersionDataGridViewTextBoxColumn,
            this.standardVersionDataGridViewTextBoxColumn,
            this.testIndicatorDataGridViewCheckBoxColumn,
            this.subElementSepDataGridViewTextBoxColumn,
            this.tblEDITrasactionRawDatasDataGridViewTextBoxColumn,
            this.tblEDIVersionDataGridViewTextBoxColumn,
            this.tblErrorLogsDataGridViewTextBoxColumn,
            this.tblInboundMappingsDataGridViewTextBoxColumn,
            this.tblOutboundMappingsDataGridViewTextBoxColumn,
            this.tblSegmentTerminatorDataGridViewTextBoxColumn,
            this.tblSegmentTerminator1DataGridViewTextBoxColumn,
            this.tblSegmentTerminator2DataGridViewTextBoxColumn,
            this.tblSegmentTerminator3DataGridViewTextBoxColumn,
            this.tblTradingPartnerErrorHandingsDataGridViewTextBoxColumn});
            this.dgvTradingPartner.DataSource = this.bdsTradingPartner;
            this.dgvTradingPartner.Location = new System.Drawing.Point(5, 3);
            this.dgvTradingPartner.Name = "dgvTradingPartner";
            this.dgvTradingPartner.RowHeadersVisible = false;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.dgvTradingPartner.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvTradingPartner.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvTradingPartner.Size = new System.Drawing.Size(225, 665);
            this.dgvTradingPartner.TabIndex = 0;
            this.dgvTradingPartner.DataBindingComplete += new System.Windows.Forms.DataGridViewBindingCompleteEventHandler(this.dgvTradingPartner_DataBindingComplete);
            this.dgvTradingPartner.DataError += new System.Windows.Forms.DataGridViewDataErrorEventHandler(this.dgvTradingPartner_DataError);
            // 
            // colTradingPartnerNo
            // 
            this.colTradingPartnerNo.DataPropertyName = "TradingPartnerNo";
            this.colTradingPartnerNo.HeaderText = "TradingPartnerNo";
            this.colTradingPartnerNo.Name = "colTradingPartnerNo";
            this.colTradingPartnerNo.Visible = false;
            // 
            // colTradingPartnerName
            // 
            this.colTradingPartnerName.DataPropertyName = "TradingPartnerName";
            this.colTradingPartnerName.HeaderText = "Trading Partner";
            this.colTradingPartnerName.Name = "colTradingPartnerName";
            this.colTradingPartnerName.Width = 120;
            // 
            // colISASenderID
            // 
            this.colISASenderID.DataPropertyName = "InterchangeSenderID";
            this.colISASenderID.HeaderText = "ISA Sender ID";
            this.colISASenderID.Name = "colISASenderID";
            // 
            // tradingPartnerNoDataGridViewTextBoxColumn
            // 
            this.tradingPartnerNoDataGridViewTextBoxColumn.DataPropertyName = "TradingPartnerNo";
            this.tradingPartnerNoDataGridViewTextBoxColumn.HeaderText = "TradingPartnerNo";
            this.tradingPartnerNoDataGridViewTextBoxColumn.Name = "tradingPartnerNoDataGridViewTextBoxColumn";
            // 
            // tradingPartnerNameDataGridViewTextBoxColumn
            // 
            this.tradingPartnerNameDataGridViewTextBoxColumn.DataPropertyName = "TradingPartnerName";
            this.tradingPartnerNameDataGridViewTextBoxColumn.HeaderText = "TradingPartnerName";
            this.tradingPartnerNameDataGridViewTextBoxColumn.Name = "tradingPartnerNameDataGridViewTextBoxColumn";
            // 
            // authorizationQualDataGridViewTextBoxColumn
            // 
            this.authorizationQualDataGridViewTextBoxColumn.DataPropertyName = "AuthorizationQual";
            this.authorizationQualDataGridViewTextBoxColumn.HeaderText = "AuthorizationQual";
            this.authorizationQualDataGridViewTextBoxColumn.Name = "authorizationQualDataGridViewTextBoxColumn";
            // 
            // authorizationInfoDataGridViewTextBoxColumn
            // 
            this.authorizationInfoDataGridViewTextBoxColumn.DataPropertyName = "AuthorizationInfo";
            this.authorizationInfoDataGridViewTextBoxColumn.HeaderText = "AuthorizationInfo";
            this.authorizationInfoDataGridViewTextBoxColumn.Name = "authorizationInfoDataGridViewTextBoxColumn";
            // 
            // securityQualDataGridViewTextBoxColumn
            // 
            this.securityQualDataGridViewTextBoxColumn.DataPropertyName = "SecurityQual";
            this.securityQualDataGridViewTextBoxColumn.HeaderText = "SecurityQual";
            this.securityQualDataGridViewTextBoxColumn.Name = "securityQualDataGridViewTextBoxColumn";
            // 
            // securityInfoDataGridViewTextBoxColumn
            // 
            this.securityInfoDataGridViewTextBoxColumn.DataPropertyName = "SecurityInfo";
            this.securityInfoDataGridViewTextBoxColumn.HeaderText = "SecurityInfo";
            this.securityInfoDataGridViewTextBoxColumn.Name = "securityInfoDataGridViewTextBoxColumn";
            // 
            // interchangeSenderIDQualDataGridViewTextBoxColumn
            // 
            this.interchangeSenderIDQualDataGridViewTextBoxColumn.DataPropertyName = "InterchangeSenderIDQual";
            this.interchangeSenderIDQualDataGridViewTextBoxColumn.HeaderText = "InterchangeSenderIDQual";
            this.interchangeSenderIDQualDataGridViewTextBoxColumn.Name = "interchangeSenderIDQualDataGridViewTextBoxColumn";
            // 
            // interchangeSenderIDDataGridViewTextBoxColumn
            // 
            this.interchangeSenderIDDataGridViewTextBoxColumn.DataPropertyName = "InterchangeSenderID";
            this.interchangeSenderIDDataGridViewTextBoxColumn.HeaderText = "InterchangeSenderID";
            this.interchangeSenderIDDataGridViewTextBoxColumn.Name = "interchangeSenderIDDataGridViewTextBoxColumn";
            // 
            // interchangeReceiverIDQualDataGridViewTextBoxColumn
            // 
            this.interchangeReceiverIDQualDataGridViewTextBoxColumn.DataPropertyName = "InterchangeReceiverIDQual";
            this.interchangeReceiverIDQualDataGridViewTextBoxColumn.HeaderText = "InterchangeReceiverIDQual";
            this.interchangeReceiverIDQualDataGridViewTextBoxColumn.Name = "interchangeReceiverIDQualDataGridViewTextBoxColumn";
            // 
            // interchangeReceiverIDDataGridViewTextBoxColumn
            // 
            this.interchangeReceiverIDDataGridViewTextBoxColumn.DataPropertyName = "InterchangeReceiverID";
            this.interchangeReceiverIDDataGridViewTextBoxColumn.HeaderText = "InterchangeReceiverID";
            this.interchangeReceiverIDDataGridViewTextBoxColumn.Name = "interchangeReceiverIDDataGridViewTextBoxColumn";
            // 
            // applicationSenderCodeDataGridViewTextBoxColumn
            // 
            this.applicationSenderCodeDataGridViewTextBoxColumn.DataPropertyName = "ApplicationSenderCode";
            this.applicationSenderCodeDataGridViewTextBoxColumn.HeaderText = "ApplicationSenderCode";
            this.applicationSenderCodeDataGridViewTextBoxColumn.Name = "applicationSenderCodeDataGridViewTextBoxColumn";
            // 
            // applicationReceiverCodeDataGridViewTextBoxColumn
            // 
            this.applicationReceiverCodeDataGridViewTextBoxColumn.DataPropertyName = "ApplicationReceiverCode";
            this.applicationReceiverCodeDataGridViewTextBoxColumn.HeaderText = "ApplicationReceiverCode";
            this.applicationReceiverCodeDataGridViewTextBoxColumn.Name = "applicationReceiverCodeDataGridViewTextBoxColumn";
            // 
            // responsibleAgencyCodeDataGridViewTextBoxColumn
            // 
            this.responsibleAgencyCodeDataGridViewTextBoxColumn.DataPropertyName = "ResponsibleAgencyCode";
            this.responsibleAgencyCodeDataGridViewTextBoxColumn.HeaderText = "ResponsibleAgencyCode";
            this.responsibleAgencyCodeDataGridViewTextBoxColumn.Name = "responsibleAgencyCodeDataGridViewTextBoxColumn";
            // 
            // segmentTerminatorDataGridViewTextBoxColumn
            // 
            this.segmentTerminatorDataGridViewTextBoxColumn.DataPropertyName = "SegmentTerminator";
            this.segmentTerminatorDataGridViewTextBoxColumn.HeaderText = "SegmentTerminator";
            this.segmentTerminatorDataGridViewTextBoxColumn.Name = "segmentTerminatorDataGridViewTextBoxColumn";
            // 
            // dataElementDelimiterDataGridViewTextBoxColumn
            // 
            this.dataElementDelimiterDataGridViewTextBoxColumn.DataPropertyName = "DataElementDelimiter";
            this.dataElementDelimiterDataGridViewTextBoxColumn.HeaderText = "DataElementDelimiter";
            this.dataElementDelimiterDataGridViewTextBoxColumn.Name = "dataElementDelimiterDataGridViewTextBoxColumn";
            // 
            // repetitionSepDataGridViewTextBoxColumn
            // 
            this.repetitionSepDataGridViewTextBoxColumn.DataPropertyName = "RepetitionSep";
            this.repetitionSepDataGridViewTextBoxColumn.HeaderText = "RepetitionSep";
            this.repetitionSepDataGridViewTextBoxColumn.Name = "repetitionSepDataGridViewTextBoxColumn";
            // 
            // interchangeVersionDataGridViewTextBoxColumn
            // 
            this.interchangeVersionDataGridViewTextBoxColumn.DataPropertyName = "InterchangeVersion";
            this.interchangeVersionDataGridViewTextBoxColumn.HeaderText = "InterchangeVersion";
            this.interchangeVersionDataGridViewTextBoxColumn.Name = "interchangeVersionDataGridViewTextBoxColumn";
            // 
            // standardVersionDataGridViewTextBoxColumn
            // 
            this.standardVersionDataGridViewTextBoxColumn.DataPropertyName = "StandardVersion";
            this.standardVersionDataGridViewTextBoxColumn.HeaderText = "StandardVersion";
            this.standardVersionDataGridViewTextBoxColumn.Name = "standardVersionDataGridViewTextBoxColumn";
            // 
            // testIndicatorDataGridViewCheckBoxColumn
            // 
            this.testIndicatorDataGridViewCheckBoxColumn.DataPropertyName = "TestIndicator";
            this.testIndicatorDataGridViewCheckBoxColumn.HeaderText = "TestIndicator";
            this.testIndicatorDataGridViewCheckBoxColumn.Name = "testIndicatorDataGridViewCheckBoxColumn";
            // 
            // subElementSepDataGridViewTextBoxColumn
            // 
            this.subElementSepDataGridViewTextBoxColumn.DataPropertyName = "SubElementSep";
            this.subElementSepDataGridViewTextBoxColumn.HeaderText = "SubElementSep";
            this.subElementSepDataGridViewTextBoxColumn.Name = "subElementSepDataGridViewTextBoxColumn";
            // 
            // tblEDITrasactionRawDatasDataGridViewTextBoxColumn
            // 
            this.tblEDITrasactionRawDatasDataGridViewTextBoxColumn.DataPropertyName = "tblEDITrasactionRawDatas";
            this.tblEDITrasactionRawDatasDataGridViewTextBoxColumn.HeaderText = "tblEDITrasactionRawDatas";
            this.tblEDITrasactionRawDatasDataGridViewTextBoxColumn.Name = "tblEDITrasactionRawDatasDataGridViewTextBoxColumn";
            // 
            // tblEDIVersionDataGridViewTextBoxColumn
            // 
            this.tblEDIVersionDataGridViewTextBoxColumn.DataPropertyName = "tblEDIVersion";
            this.tblEDIVersionDataGridViewTextBoxColumn.HeaderText = "tblEDIVersion";
            this.tblEDIVersionDataGridViewTextBoxColumn.Name = "tblEDIVersionDataGridViewTextBoxColumn";
            // 
            // tblErrorLogsDataGridViewTextBoxColumn
            // 
            this.tblErrorLogsDataGridViewTextBoxColumn.DataPropertyName = "tblErrorLogs";
            this.tblErrorLogsDataGridViewTextBoxColumn.HeaderText = "tblErrorLogs";
            this.tblErrorLogsDataGridViewTextBoxColumn.Name = "tblErrorLogsDataGridViewTextBoxColumn";
            // 
            // tblInboundMappingsDataGridViewTextBoxColumn
            // 
            this.tblInboundMappingsDataGridViewTextBoxColumn.DataPropertyName = "tblInboundMappings";
            this.tblInboundMappingsDataGridViewTextBoxColumn.HeaderText = "tblInboundMappings";
            this.tblInboundMappingsDataGridViewTextBoxColumn.Name = "tblInboundMappingsDataGridViewTextBoxColumn";
            // 
            // tblOutboundMappingsDataGridViewTextBoxColumn
            // 
            this.tblOutboundMappingsDataGridViewTextBoxColumn.DataPropertyName = "tblOutboundMappings";
            this.tblOutboundMappingsDataGridViewTextBoxColumn.HeaderText = "tblOutboundMappings";
            this.tblOutboundMappingsDataGridViewTextBoxColumn.Name = "tblOutboundMappingsDataGridViewTextBoxColumn";
            // 
            // tblSegmentTerminatorDataGridViewTextBoxColumn
            // 
            this.tblSegmentTerminatorDataGridViewTextBoxColumn.DataPropertyName = "tblSegmentTerminator";
            this.tblSegmentTerminatorDataGridViewTextBoxColumn.HeaderText = "tblSegmentTerminator";
            this.tblSegmentTerminatorDataGridViewTextBoxColumn.Name = "tblSegmentTerminatorDataGridViewTextBoxColumn";
            // 
            // tblSegmentTerminator1DataGridViewTextBoxColumn
            // 
            this.tblSegmentTerminator1DataGridViewTextBoxColumn.DataPropertyName = "tblSegmentTerminator1";
            this.tblSegmentTerminator1DataGridViewTextBoxColumn.HeaderText = "tblSegmentTerminator1";
            this.tblSegmentTerminator1DataGridViewTextBoxColumn.Name = "tblSegmentTerminator1DataGridViewTextBoxColumn";
            // 
            // tblSegmentTerminator2DataGridViewTextBoxColumn
            // 
            this.tblSegmentTerminator2DataGridViewTextBoxColumn.DataPropertyName = "tblSegmentTerminator2";
            this.tblSegmentTerminator2DataGridViewTextBoxColumn.HeaderText = "tblSegmentTerminator2";
            this.tblSegmentTerminator2DataGridViewTextBoxColumn.Name = "tblSegmentTerminator2DataGridViewTextBoxColumn";
            // 
            // tblSegmentTerminator3DataGridViewTextBoxColumn
            // 
            this.tblSegmentTerminator3DataGridViewTextBoxColumn.DataPropertyName = "tblSegmentTerminator3";
            this.tblSegmentTerminator3DataGridViewTextBoxColumn.HeaderText = "tblSegmentTerminator3";
            this.tblSegmentTerminator3DataGridViewTextBoxColumn.Name = "tblSegmentTerminator3DataGridViewTextBoxColumn";
            // 
            // tblTradingPartnerErrorHandingsDataGridViewTextBoxColumn
            // 
            this.tblTradingPartnerErrorHandingsDataGridViewTextBoxColumn.DataPropertyName = "tblTradingPartnerErrorHandings";
            this.tblTradingPartnerErrorHandingsDataGridViewTextBoxColumn.HeaderText = "tblTradingPartnerErrorHandings";
            this.tblTradingPartnerErrorHandingsDataGridViewTextBoxColumn.Name = "tblTradingPartnerErrorHandingsDataGridViewTextBoxColumn";
            // 
            // bdsTradingPartner
            // 
            this.bdsTradingPartner.DataSource = typeof(BHEDI.tblTradingPartner);
            this.bdsTradingPartner.AddingNew += new System.ComponentModel.AddingNewEventHandler(this.bdsTradingPartner_AddingNew);
            this.bdsTradingPartner.CurrentChanged += new System.EventHandler(this.bdsTradingPartner_CurrentChanged);
            // 
            // tabTradingPartner
            // 
            this.tabTradingPartner.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tabTradingPartner.Controls.Add(this.tpgGeneral);
            this.tabTradingPartner.Controls.Add(this.tpgTransactionSets);
            this.tabTradingPartner.Location = new System.Drawing.Point(232, 4);
            this.tabTradingPartner.Name = "tabTradingPartner";
            this.tabTradingPartner.SelectedIndex = 0;
            this.tabTradingPartner.Size = new System.Drawing.Size(797, 611);
            this.tabTradingPartner.TabIndex = 0;
            // 
            // tpgGeneral
            // 
            this.tpgGeneral.Controls.Add(this.gbGeneral);
            this.tpgGeneral.Controls.Add(this.txtTradingPartnerAlias);
            this.tpgGeneral.Controls.Add(this.lblTraidingPartnerName);
            this.tpgGeneral.Location = new System.Drawing.Point(4, 22);
            this.tpgGeneral.Name = "tpgGeneral";
            this.tpgGeneral.Padding = new System.Windows.Forms.Padding(3);
            this.tpgGeneral.Size = new System.Drawing.Size(789, 585);
            this.tpgGeneral.TabIndex = 0;
            this.tpgGeneral.Text = "General";
            this.tpgGeneral.UseVisualStyleBackColor = true;
            // 
            // gbGeneral
            // 
            this.gbGeneral.Controls.Add(this.cboERPType);
            this.gbGeneral.Controls.Add(this.txtSCPFilePath);
            this.gbGeneral.Controls.Add(this.label4);
            this.gbGeneral.Controls.Add(this.chkUsingSCP);
            this.gbGeneral.Controls.Add(this.label3);
            this.gbGeneral.Controls.Add(this.chkGSYearFormat);
            this.gbGeneral.Controls.Add(this.label2);
            this.gbGeneral.Controls.Add(this.txtOutboundID);
            this.gbGeneral.Controls.Add(this.lblOutboundID);
            this.gbGeneral.Controls.Add(this.chkTestIndicator);
            this.gbGeneral.Controls.Add(this.txtISA12InterchangeVer);
            this.gbGeneral.Controls.Add(this.txtGS07ResponsibleAgencyCode);
            this.gbGeneral.Controls.Add(this.txtGS03ApplicationReceiverCode);
            this.gbGeneral.Controls.Add(this.txtGS02ApplicationSenderCode);
            this.gbGeneral.Controls.Add(this.txtISA08InterchangeReceiverID);
            this.gbGeneral.Controls.Add(this.txtISA07InterchangeReceiverIDQual);
            this.gbGeneral.Controls.Add(this.txtISA06InterchangeSenderID);
            this.gbGeneral.Controls.Add(this.txtISA05InterchangeSenderIDQual);
            this.gbGeneral.Controls.Add(this.txtISA04SecurityInfo);
            this.gbGeneral.Controls.Add(this.txtISA03SecurityQual);
            this.gbGeneral.Controls.Add(this.txtISA02AuthorizationInfo);
            this.gbGeneral.Controls.Add(this.txtISA01AuthorizationQual);
            this.gbGeneral.Controls.Add(this.lblGS07ResponsibleAgencyCode);
            this.gbGeneral.Controls.Add(this.lblGS03ApplicationReceiverCode);
            this.gbGeneral.Controls.Add(this.lblGS02ApplicationSenderCode);
            this.gbGeneral.Controls.Add(this.lblISA08InterchangeReceiverID);
            this.gbGeneral.Controls.Add(this.lblISA07InterchangeReceiverIDQual);
            this.gbGeneral.Controls.Add(this.lblISA06InterchangeSenderID);
            this.gbGeneral.Controls.Add(this.lblISA05InterchangeSenderIDQual);
            this.gbGeneral.Controls.Add(this.lblISA04SecurityInfo);
            this.gbGeneral.Controls.Add(this.lblISA03SecurityQual);
            this.gbGeneral.Controls.Add(this.lblISA02AuthorizationInfo);
            this.gbGeneral.Controls.Add(this.lblISA01AuthorizationQual);
            this.gbGeneral.Controls.Add(this.cboISA16SubElementSep);
            this.gbGeneral.Controls.Add(this.cboStandardVer);
            this.gbGeneral.Controls.Add(this.cboISA11RepetitionSep);
            this.gbGeneral.Controls.Add(this.cboDataElementDelimiter);
            this.gbGeneral.Controls.Add(this.cboSegmentTerminator);
            this.gbGeneral.Controls.Add(this.lblISA16SubElementSep);
            this.gbGeneral.Controls.Add(this.lblISA15TestIndicator);
            this.gbGeneral.Controls.Add(this.lblStandardVer);
            this.gbGeneral.Controls.Add(this.lblISA12InterchangeVer);
            this.gbGeneral.Controls.Add(this.lblISA11RepetitionSep);
            this.gbGeneral.Controls.Add(this.lblDataElementDelimiter);
            this.gbGeneral.Controls.Add(this.lblSegmentTerminator);
            this.gbGeneral.Location = new System.Drawing.Point(6, 38);
            this.gbGeneral.Name = "gbGeneral";
            this.gbGeneral.Size = new System.Drawing.Size(777, 524);
            this.gbGeneral.TabIndex = 0;
            this.gbGeneral.TabStop = false;
            // 
            // cboERPType
            // 
            this.cboERPType.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.bdsTradingPartner, "ERPNo_FK", true));
            this.cboERPType.DataSource = this.bdsERPType;
            this.cboERPType.DisplayMember = "ERPNo";
            this.cboERPType.FormattingEnabled = true;
            this.cboERPType.Location = new System.Drawing.Point(527, 250);
            this.cboERPType.Name = "cboERPType";
            this.cboERPType.Size = new System.Drawing.Size(121, 21);
            this.cboERPType.TabIndex = 41;
            // 
            // txtSCPFilePath
            // 
            this.txtSCPFilePath.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsTradingPartner, "SCPFolder", true));
            this.txtSCPFilePath.Location = new System.Drawing.Point(504, 280);
            this.txtSCPFilePath.Name = "txtSCPFilePath";
            this.txtSCPFilePath.Size = new System.Drawing.Size(259, 20);
            this.txtSCPFilePath.TabIndex = 42;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(358, 280);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(76, 13);
            this.label4.TabIndex = 41;
            this.label4.Text = "ERP File Path:";
            // 
            // chkUsingSCP
            // 
            this.chkUsingSCP.AutoSize = true;
            this.chkUsingSCP.BackColor = System.Drawing.SystemColors.Window;
            this.chkUsingSCP.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.bdsTradingPartner, "blnUseSCP", true));
            this.chkUsingSCP.Location = new System.Drawing.Point(503, 250);
            this.chkUsingSCP.Name = "chkUsingSCP";
            this.chkUsingSCP.Size = new System.Drawing.Size(15, 14);
            this.chkUsingSCP.TabIndex = 40;
            this.chkUsingSCP.UseVisualStyleBackColor = false;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(358, 247);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(102, 13);
            this.label3.TabIndex = 39;
            this.label3.Text = "Import / Export ERP";
            // 
            // chkGSYearFormat
            // 
            this.chkGSYearFormat.AutoSize = true;
            this.chkGSYearFormat.BackColor = System.Drawing.SystemColors.Window;
            this.chkGSYearFormat.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.bdsTradingPartner, "blnIsGSYear4", true));
            this.chkGSYearFormat.Location = new System.Drawing.Point(198, 307);
            this.chkGSYearFormat.Name = "chkGSYearFormat";
            this.chkGSYearFormat.Size = new System.Drawing.Size(15, 14);
            this.chkGSYearFormat.TabIndex = 22;
            this.chkGSYearFormat.UseVisualStyleBackColor = false;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(8, 307);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(140, 13);
            this.label2.TabIndex = 38;
            this.label2.Text = "GS 04 YYYYMMDD Format:";
            // 
            // txtOutboundID
            // 
            this.txtOutboundID.BackColor = System.Drawing.SystemColors.Window;
            this.txtOutboundID.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsTradingPartner, "OutBoundID", true));
            this.txtOutboundID.Location = new System.Drawing.Point(503, 221);
            this.txtOutboundID.Name = "txtOutboundID";
            this.txtOutboundID.Size = new System.Drawing.Size(145, 20);
            this.txtOutboundID.TabIndex = 37;
            // 
            // lblOutboundID
            // 
            this.lblOutboundID.AutoSize = true;
            this.lblOutboundID.Location = new System.Drawing.Point(358, 221);
            this.lblOutboundID.Name = "lblOutboundID";
            this.lblOutboundID.Size = new System.Drawing.Size(68, 13);
            this.lblOutboundID.TabIndex = 36;
            this.lblOutboundID.Text = "Outbound ID";
            // 
            // chkTestIndicator
            // 
            this.chkTestIndicator.AutoSize = true;
            this.chkTestIndicator.BackColor = System.Drawing.SystemColors.Info;
            this.chkTestIndicator.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.bdsTradingPartner, "TestIndicator", true));
            this.chkTestIndicator.Location = new System.Drawing.Point(503, 163);
            this.chkTestIndicator.Name = "chkTestIndicator";
            this.chkTestIndicator.Size = new System.Drawing.Size(47, 17);
            this.chkTestIndicator.TabIndex = 33;
            this.chkTestIndicator.Text = "Test";
            this.chkTestIndicator.UseVisualStyleBackColor = false;
            // 
            // txtISA12InterchangeVer
            // 
            this.txtISA12InterchangeVer.BackColor = System.Drawing.SystemColors.Info;
            this.txtISA12InterchangeVer.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsTradingPartner, "InterchangeVersion", true));
            this.txtISA12InterchangeVer.Location = new System.Drawing.Point(503, 101);
            this.txtISA12InterchangeVer.Name = "txtISA12InterchangeVer";
            this.txtISA12InterchangeVer.Size = new System.Drawing.Size(145, 20);
            this.txtISA12InterchangeVer.TabIndex = 29;
            // 
            // txtGS07ResponsibleAgencyCode
            // 
            this.txtGS07ResponsibleAgencyCode.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsTradingPartner, "ResponsibleAgencyCode", true));
            this.txtGS07ResponsibleAgencyCode.Location = new System.Drawing.Point(198, 273);
            this.txtGS07ResponsibleAgencyCode.Name = "txtGS07ResponsibleAgencyCode";
            this.txtGS07ResponsibleAgencyCode.Size = new System.Drawing.Size(145, 20);
            this.txtGS07ResponsibleAgencyCode.TabIndex = 21;
            // 
            // txtGS03ApplicationReceiverCode
            // 
            this.txtGS03ApplicationReceiverCode.BackColor = System.Drawing.SystemColors.Info;
            this.txtGS03ApplicationReceiverCode.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsTradingPartner, "ApplicationReceiverCode", true));
            this.txtGS03ApplicationReceiverCode.Location = new System.Drawing.Point(198, 247);
            this.txtGS03ApplicationReceiverCode.Name = "txtGS03ApplicationReceiverCode";
            this.txtGS03ApplicationReceiverCode.Size = new System.Drawing.Size(145, 20);
            this.txtGS03ApplicationReceiverCode.TabIndex = 19;
            // 
            // txtGS02ApplicationSenderCode
            // 
            this.txtGS02ApplicationSenderCode.BackColor = System.Drawing.SystemColors.Info;
            this.txtGS02ApplicationSenderCode.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsTradingPartner, "ApplicationSenderCode", true));
            this.txtGS02ApplicationSenderCode.Location = new System.Drawing.Point(198, 221);
            this.txtGS02ApplicationSenderCode.Name = "txtGS02ApplicationSenderCode";
            this.txtGS02ApplicationSenderCode.Size = new System.Drawing.Size(145, 20);
            this.txtGS02ApplicationSenderCode.TabIndex = 17;
            // 
            // txtISA08InterchangeReceiverID
            // 
            this.txtISA08InterchangeReceiverID.BackColor = System.Drawing.SystemColors.Info;
            this.txtISA08InterchangeReceiverID.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsTradingPartner, "InterchangeReceiverID", true));
            this.txtISA08InterchangeReceiverID.Location = new System.Drawing.Point(198, 195);
            this.txtISA08InterchangeReceiverID.Name = "txtISA08InterchangeReceiverID";
            this.txtISA08InterchangeReceiverID.Size = new System.Drawing.Size(145, 20);
            this.txtISA08InterchangeReceiverID.TabIndex = 15;
            // 
            // txtISA07InterchangeReceiverIDQual
            // 
            this.txtISA07InterchangeReceiverIDQual.BackColor = System.Drawing.SystemColors.Info;
            this.txtISA07InterchangeReceiverIDQual.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsTradingPartner, "InterchangeReceiverIDQual", true));
            this.txtISA07InterchangeReceiverIDQual.Location = new System.Drawing.Point(198, 169);
            this.txtISA07InterchangeReceiverIDQual.Name = "txtISA07InterchangeReceiverIDQual";
            this.txtISA07InterchangeReceiverIDQual.Size = new System.Drawing.Size(145, 20);
            this.txtISA07InterchangeReceiverIDQual.TabIndex = 13;
            // 
            // txtISA06InterchangeSenderID
            // 
            this.txtISA06InterchangeSenderID.BackColor = System.Drawing.SystemColors.Info;
            this.txtISA06InterchangeSenderID.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsTradingPartner, "InterchangeSenderID", true));
            this.txtISA06InterchangeSenderID.Location = new System.Drawing.Point(198, 143);
            this.txtISA06InterchangeSenderID.Name = "txtISA06InterchangeSenderID";
            this.txtISA06InterchangeSenderID.Size = new System.Drawing.Size(145, 20);
            this.txtISA06InterchangeSenderID.TabIndex = 11;
            // 
            // txtISA05InterchangeSenderIDQual
            // 
            this.txtISA05InterchangeSenderIDQual.BackColor = System.Drawing.SystemColors.Info;
            this.txtISA05InterchangeSenderIDQual.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsTradingPartner, "InterchangeSenderIDQual", true));
            this.txtISA05InterchangeSenderIDQual.Location = new System.Drawing.Point(198, 121);
            this.txtISA05InterchangeSenderIDQual.Name = "txtISA05InterchangeSenderIDQual";
            this.txtISA05InterchangeSenderIDQual.Size = new System.Drawing.Size(145, 20);
            this.txtISA05InterchangeSenderIDQual.TabIndex = 9;
            // 
            // txtISA04SecurityInfo
            // 
            this.txtISA04SecurityInfo.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsTradingPartner, "SecurityInfo", true));
            this.txtISA04SecurityInfo.Location = new System.Drawing.Point(198, 98);
            this.txtISA04SecurityInfo.Name = "txtISA04SecurityInfo";
            this.txtISA04SecurityInfo.Size = new System.Drawing.Size(145, 20);
            this.txtISA04SecurityInfo.TabIndex = 7;
            // 
            // txtISA03SecurityQual
            // 
            this.txtISA03SecurityQual.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsTradingPartner, "SecurityQual", true));
            this.txtISA03SecurityQual.Location = new System.Drawing.Point(198, 72);
            this.txtISA03SecurityQual.Name = "txtISA03SecurityQual";
            this.txtISA03SecurityQual.Size = new System.Drawing.Size(145, 20);
            this.txtISA03SecurityQual.TabIndex = 5;
            // 
            // txtISA02AuthorizationInfo
            // 
            this.txtISA02AuthorizationInfo.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsTradingPartner, "AuthorizationInfo", true));
            this.txtISA02AuthorizationInfo.Location = new System.Drawing.Point(198, 46);
            this.txtISA02AuthorizationInfo.Name = "txtISA02AuthorizationInfo";
            this.txtISA02AuthorizationInfo.Size = new System.Drawing.Size(145, 20);
            this.txtISA02AuthorizationInfo.TabIndex = 3;
            // 
            // txtISA01AuthorizationQual
            // 
            this.txtISA01AuthorizationQual.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsTradingPartner, "AuthorizationQual", true));
            this.txtISA01AuthorizationQual.Location = new System.Drawing.Point(198, 20);
            this.txtISA01AuthorizationQual.Name = "txtISA01AuthorizationQual";
            this.txtISA01AuthorizationQual.Size = new System.Drawing.Size(145, 20);
            this.txtISA01AuthorizationQual.TabIndex = 1;
            // 
            // lblGS07ResponsibleAgencyCode
            // 
            this.lblGS07ResponsibleAgencyCode.AutoSize = true;
            this.lblGS07ResponsibleAgencyCode.Location = new System.Drawing.Point(8, 280);
            this.lblGS07ResponsibleAgencyCode.Name = "lblGS07ResponsibleAgencyCode";
            this.lblGS07ResponsibleAgencyCode.Size = new System.Drawing.Size(168, 13);
            this.lblGS07ResponsibleAgencyCode.TabIndex = 20;
            this.lblGS07ResponsibleAgencyCode.Text = "GS 07 Responsible Agency Code:";
            // 
            // lblGS03ApplicationReceiverCode
            // 
            this.lblGS03ApplicationReceiverCode.AutoSize = true;
            this.lblGS03ApplicationReceiverCode.Location = new System.Drawing.Point(8, 254);
            this.lblGS03ApplicationReceiverCode.Name = "lblGS03ApplicationReceiverCode";
            this.lblGS03ApplicationReceiverCode.Size = new System.Drawing.Size(169, 13);
            this.lblGS03ApplicationReceiverCode.TabIndex = 18;
            this.lblGS03ApplicationReceiverCode.Text = "GS 03 Application Receiver Code:";
            // 
            // lblGS02ApplicationSenderCode
            // 
            this.lblGS02ApplicationSenderCode.AutoSize = true;
            this.lblGS02ApplicationSenderCode.Location = new System.Drawing.Point(8, 228);
            this.lblGS02ApplicationSenderCode.Name = "lblGS02ApplicationSenderCode";
            this.lblGS02ApplicationSenderCode.Size = new System.Drawing.Size(160, 13);
            this.lblGS02ApplicationSenderCode.TabIndex = 16;
            this.lblGS02ApplicationSenderCode.Text = "GS 02 Application Sender Code:";
            // 
            // lblISA08InterchangeReceiverID
            // 
            this.lblISA08InterchangeReceiverID.AutoSize = true;
            this.lblISA08InterchangeReceiverID.Location = new System.Drawing.Point(8, 202);
            this.lblISA08InterchangeReceiverID.Name = "lblISA08InterchangeReceiverID";
            this.lblISA08InterchangeReceiverID.Size = new System.Drawing.Size(162, 13);
            this.lblISA08InterchangeReceiverID.TabIndex = 14;
            this.lblISA08InterchangeReceiverID.Text = "ISA 08 Interchange Receiver ID:";
            // 
            // lblISA07InterchangeReceiverIDQual
            // 
            this.lblISA07InterchangeReceiverIDQual.AutoSize = true;
            this.lblISA07InterchangeReceiverIDQual.Location = new System.Drawing.Point(8, 176);
            this.lblISA07InterchangeReceiverIDQual.Name = "lblISA07InterchangeReceiverIDQual";
            this.lblISA07InterchangeReceiverIDQual.Size = new System.Drawing.Size(187, 13);
            this.lblISA07InterchangeReceiverIDQual.TabIndex = 12;
            this.lblISA07InterchangeReceiverIDQual.Text = "ISA 07 Interchange Receiver ID Qual:";
            // 
            // lblISA06InterchangeSenderID
            // 
            this.lblISA06InterchangeSenderID.AutoSize = true;
            this.lblISA06InterchangeSenderID.Location = new System.Drawing.Point(8, 150);
            this.lblISA06InterchangeSenderID.Name = "lblISA06InterchangeSenderID";
            this.lblISA06InterchangeSenderID.Size = new System.Drawing.Size(153, 13);
            this.lblISA06InterchangeSenderID.TabIndex = 10;
            this.lblISA06InterchangeSenderID.Text = "ISA 06 Interchange Sender ID:";
            // 
            // lblISA05InterchangeSenderIDQual
            // 
            this.lblISA05InterchangeSenderIDQual.AutoSize = true;
            this.lblISA05InterchangeSenderIDQual.Location = new System.Drawing.Point(8, 124);
            this.lblISA05InterchangeSenderIDQual.Name = "lblISA05InterchangeSenderIDQual";
            this.lblISA05InterchangeSenderIDQual.Size = new System.Drawing.Size(178, 13);
            this.lblISA05InterchangeSenderIDQual.TabIndex = 8;
            this.lblISA05InterchangeSenderIDQual.Text = "ISA 05 Interchange Sender ID Qual:";
            // 
            // lblISA04SecurityInfo
            // 
            this.lblISA04SecurityInfo.AutoSize = true;
            this.lblISA04SecurityInfo.Location = new System.Drawing.Point(8, 98);
            this.lblISA04SecurityInfo.Name = "lblISA04SecurityInfo";
            this.lblISA04SecurityInfo.Size = new System.Drawing.Size(104, 13);
            this.lblISA04SecurityInfo.TabIndex = 6;
            this.lblISA04SecurityInfo.Text = "ISA 04 Security Info:";
            // 
            // lblISA03SecurityQual
            // 
            this.lblISA03SecurityQual.AutoSize = true;
            this.lblISA03SecurityQual.Location = new System.Drawing.Point(8, 72);
            this.lblISA03SecurityQual.Name = "lblISA03SecurityQual";
            this.lblISA03SecurityQual.Size = new System.Drawing.Size(108, 13);
            this.lblISA03SecurityQual.TabIndex = 4;
            this.lblISA03SecurityQual.Text = "ISA 03 Security Qual:";
            // 
            // lblISA02AuthorizationInfo
            // 
            this.lblISA02AuthorizationInfo.AutoSize = true;
            this.lblISA02AuthorizationInfo.Location = new System.Drawing.Point(8, 46);
            this.lblISA02AuthorizationInfo.Name = "lblISA02AuthorizationInfo";
            this.lblISA02AuthorizationInfo.Size = new System.Drawing.Size(127, 13);
            this.lblISA02AuthorizationInfo.TabIndex = 2;
            this.lblISA02AuthorizationInfo.Text = "ISA 02 Authorization Info:";
            // 
            // lblISA01AuthorizationQual
            // 
            this.lblISA01AuthorizationQual.AutoSize = true;
            this.lblISA01AuthorizationQual.Location = new System.Drawing.Point(8, 20);
            this.lblISA01AuthorizationQual.Name = "lblISA01AuthorizationQual";
            this.lblISA01AuthorizationQual.Size = new System.Drawing.Size(131, 13);
            this.lblISA01AuthorizationQual.TabIndex = 0;
            this.lblISA01AuthorizationQual.Text = "ISA 01 Authorization Qual:";
            // 
            // cboISA16SubElementSep
            // 
            this.cboISA16SubElementSep.BackColor = System.Drawing.SystemColors.Info;
            this.cboISA16SubElementSep.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.bdsTradingPartner, "SubElementSep", true));
            this.cboISA16SubElementSep.DataSource = this.bdsSubElementSep;
            this.cboISA16SubElementSep.DisplayMember = "TerminatorDisplay";
            this.cboISA16SubElementSep.FormattingEnabled = true;
            this.cboISA16SubElementSep.Location = new System.Drawing.Point(503, 188);
            this.cboISA16SubElementSep.Name = "cboISA16SubElementSep";
            this.cboISA16SubElementSep.Size = new System.Drawing.Size(145, 21);
            this.cboISA16SubElementSep.TabIndex = 35;
            this.cboISA16SubElementSep.ValueMember = "SegmentTerminatorNo";
            // 
            // bdsSubElementSep
            // 
            this.bdsSubElementSep.DataSource = typeof(BHEDI.tblSegmentTerminator);
            // 
            // cboStandardVer
            // 
            this.cboStandardVer.BackColor = System.Drawing.SystemColors.Info;
            this.cboStandardVer.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.bdsTradingPartner, "StandardVersion", true));
            this.cboStandardVer.DataSource = this.bdsStandardVersion;
            this.cboStandardVer.DisplayMember = "Version";
            this.cboStandardVer.FormattingEnabled = true;
            this.cboStandardVer.Location = new System.Drawing.Point(503, 130);
            this.cboStandardVer.Name = "cboStandardVer";
            this.cboStandardVer.Size = new System.Drawing.Size(145, 21);
            this.cboStandardVer.TabIndex = 31;
            this.cboStandardVer.ValueMember = "EDIVersionNo";
            // 
            // bdsStandardVersion
            // 
            this.bdsStandardVersion.DataSource = typeof(BHEDI.tblEDIVersion);
            // 
            // cboISA11RepetitionSep
            // 
            this.cboISA11RepetitionSep.BackColor = System.Drawing.SystemColors.Info;
            this.cboISA11RepetitionSep.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.bdsTradingPartner, "RepetitionSep", true));
            this.cboISA11RepetitionSep.DataSource = this.bdsRepetitionSep;
            this.cboISA11RepetitionSep.DisplayMember = "TerminatorDisplay";
            this.cboISA11RepetitionSep.FormattingEnabled = true;
            this.cboISA11RepetitionSep.Location = new System.Drawing.Point(503, 72);
            this.cboISA11RepetitionSep.Name = "cboISA11RepetitionSep";
            this.cboISA11RepetitionSep.Size = new System.Drawing.Size(145, 21);
            this.cboISA11RepetitionSep.TabIndex = 27;
            this.cboISA11RepetitionSep.ValueMember = "SegmentTerminatorNo";
            // 
            // bdsRepetitionSep
            // 
            this.bdsRepetitionSep.DataSource = typeof(BHEDI.tblSegmentTerminator);
            // 
            // cboDataElementDelimiter
            // 
            this.cboDataElementDelimiter.BackColor = System.Drawing.SystemColors.Info;
            this.cboDataElementDelimiter.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.bdsTradingPartner, "DataElementDelimiter", true));
            this.cboDataElementDelimiter.DataSource = this.bdsDataElementDelimiter;
            this.cboDataElementDelimiter.DisplayMember = "TerminatorDisplay";
            this.cboDataElementDelimiter.FormattingEnabled = true;
            this.cboDataElementDelimiter.Location = new System.Drawing.Point(503, 43);
            this.cboDataElementDelimiter.Name = "cboDataElementDelimiter";
            this.cboDataElementDelimiter.Size = new System.Drawing.Size(145, 21);
            this.cboDataElementDelimiter.TabIndex = 25;
            this.cboDataElementDelimiter.ValueMember = "SegmentTerminatorNo";
            // 
            // bdsDataElementDelimiter
            // 
            this.bdsDataElementDelimiter.DataSource = typeof(BHEDI.tblSegmentTerminator);
            // 
            // cboSegmentTerminator
            // 
            this.cboSegmentTerminator.BackColor = System.Drawing.SystemColors.Info;
            this.cboSegmentTerminator.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.bdsTradingPartner, "SegmentTerminator", true));
            this.cboSegmentTerminator.DataSource = this.bdsSegmentTerminator;
            this.cboSegmentTerminator.DisplayMember = "TerminatorDisplay";
            this.cboSegmentTerminator.FormattingEnabled = true;
            this.cboSegmentTerminator.Location = new System.Drawing.Point(503, 16);
            this.cboSegmentTerminator.Name = "cboSegmentTerminator";
            this.cboSegmentTerminator.Size = new System.Drawing.Size(145, 21);
            this.cboSegmentTerminator.TabIndex = 23;
            this.cboSegmentTerminator.ValueMember = "SegmentTerminatorNo";
            // 
            // bdsSegmentTerminator
            // 
            this.bdsSegmentTerminator.DataSource = typeof(BHEDI.tblSegmentTerminator);
            // 
            // lblISA16SubElementSep
            // 
            this.lblISA16SubElementSep.AutoSize = true;
            this.lblISA16SubElementSep.Location = new System.Drawing.Point(358, 192);
            this.lblISA16SubElementSep.Name = "lblISA16SubElementSep";
            this.lblISA16SubElementSep.Size = new System.Drawing.Size(124, 13);
            this.lblISA16SubElementSep.TabIndex = 34;
            this.lblISA16SubElementSep.Text = "ISA 16 Sub Element Sep";
            // 
            // lblISA15TestIndicator
            // 
            this.lblISA15TestIndicator.AutoSize = true;
            this.lblISA15TestIndicator.Location = new System.Drawing.Point(358, 163);
            this.lblISA15TestIndicator.Name = "lblISA15TestIndicator";
            this.lblISA15TestIndicator.Size = new System.Drawing.Size(107, 13);
            this.lblISA15TestIndicator.TabIndex = 32;
            this.lblISA15TestIndicator.Text = "ISA 15 Test Indicator";
            // 
            // lblStandardVer
            // 
            this.lblStandardVer.AutoSize = true;
            this.lblStandardVer.Location = new System.Drawing.Point(358, 134);
            this.lblStandardVer.Name = "lblStandardVer";
            this.lblStandardVer.Size = new System.Drawing.Size(91, 13);
            this.lblStandardVer.TabIndex = 30;
            this.lblStandardVer.Text = "Standard Version:";
            // 
            // lblISA12InterchangeVer
            // 
            this.lblISA12InterchangeVer.AutoSize = true;
            this.lblISA12InterchangeVer.Location = new System.Drawing.Point(358, 105);
            this.lblISA12InterchangeVer.Name = "lblISA12InterchangeVer";
            this.lblISA12InterchangeVer.Size = new System.Drawing.Size(140, 13);
            this.lblISA12InterchangeVer.TabIndex = 28;
            this.lblISA12InterchangeVer.Text = "ISA 12 Interchange Version:";
            // 
            // lblISA11RepetitionSep
            // 
            this.lblISA11RepetitionSep.AutoSize = true;
            this.lblISA11RepetitionSep.Location = new System.Drawing.Point(358, 76);
            this.lblISA11RepetitionSep.Name = "lblISA11RepetitionSep";
            this.lblISA11RepetitionSep.Size = new System.Drawing.Size(115, 13);
            this.lblISA11RepetitionSep.TabIndex = 26;
            this.lblISA11RepetitionSep.Text = "ISA 11 Repetition Sep:";
            // 
            // lblDataElementDelimiter
            // 
            this.lblDataElementDelimiter.AutoSize = true;
            this.lblDataElementDelimiter.Location = new System.Drawing.Point(358, 47);
            this.lblDataElementDelimiter.Name = "lblDataElementDelimiter";
            this.lblDataElementDelimiter.Size = new System.Drawing.Size(114, 13);
            this.lblDataElementDelimiter.TabIndex = 24;
            this.lblDataElementDelimiter.Text = "Data Element Delimiter";
            // 
            // lblSegmentTerminator
            // 
            this.lblSegmentTerminator.AutoSize = true;
            this.lblSegmentTerminator.Location = new System.Drawing.Point(358, 20);
            this.lblSegmentTerminator.Name = "lblSegmentTerminator";
            this.lblSegmentTerminator.Size = new System.Drawing.Size(105, 13);
            this.lblSegmentTerminator.TabIndex = 22;
            this.lblSegmentTerminator.Text = "Segment Terminator:";
            // 
            // txtTradingPartnerAlias
            // 
            this.txtTradingPartnerAlias.BackColor = System.Drawing.SystemColors.Info;
            this.txtTradingPartnerAlias.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsTradingPartner, "TradingPartnerName", true));
            this.txtTradingPartnerAlias.Location = new System.Drawing.Point(126, 9);
            this.txtTradingPartnerAlias.Name = "txtTradingPartnerAlias";
            this.txtTradingPartnerAlias.Size = new System.Drawing.Size(296, 20);
            this.txtTradingPartnerAlias.TabIndex = 1;
            // 
            // lblTraidingPartnerName
            // 
            this.lblTraidingPartnerName.AutoSize = true;
            this.lblTraidingPartnerName.Location = new System.Drawing.Point(11, 13);
            this.lblTraidingPartnerName.Name = "lblTraidingPartnerName";
            this.lblTraidingPartnerName.Size = new System.Drawing.Size(114, 13);
            this.lblTraidingPartnerName.TabIndex = 0;
            this.lblTraidingPartnerName.Text = "Trading Partner Name:";
            // 
            // tpgTransactionSets
            // 
            this.tpgTransactionSets.Controls.Add(this.groupBox1);
            this.tpgTransactionSets.Controls.Add(this.txt997Path);
            this.tpgTransactionSets.Controls.Add(this.label1);
            this.tpgTransactionSets.Controls.Add(this.gbFunctionalAck);
            this.tpgTransactionSets.Controls.Add(this.dgvTransactionSets);
            this.tpgTransactionSets.Controls.Add(this.btnOpenMapDesign);
            this.tpgTransactionSets.Controls.Add(this.btnRemoveTransactionSet);
            this.tpgTransactionSets.Controls.Add(this.btnAddTransactionSet);
            this.tpgTransactionSets.Controls.Add(this.gbErrorAction);
            this.tpgTransactionSets.Location = new System.Drawing.Point(4, 22);
            this.tpgTransactionSets.Name = "tpgTransactionSets";
            this.tpgTransactionSets.Padding = new System.Windows.Forms.Padding(3);
            this.tpgTransactionSets.Size = new System.Drawing.Size(789, 585);
            this.tpgTransactionSets.TabIndex = 1;
            this.tpgTransactionSets.Text = "Transaction Sets";
            this.tpgTransactionSets.UseVisualStyleBackColor = true;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.dvAutoCopy);
            this.groupBox1.Controls.Add(this.btnRemoveCopyTrading);
            this.groupBox1.Controls.Add(this.btnAddCopyTrading);
            this.groupBox1.Location = new System.Drawing.Point(18, 429);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(555, 150);
            this.groupBox1.TabIndex = 27;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Auto Forward Trading Partner";
            // 
            // dvAutoCopy
            // 
            this.dvAutoCopy.AllowUserToAddRows = false;
            this.dvAutoCopy.AllowUserToDeleteRows = false;
            this.dvAutoCopy.AutoGenerateColumns = false;
            this.dvAutoCopy.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dvAutoCopy.ColumnHeadersVisible = false;
            this.dvAutoCopy.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colCopyTradingPartner});
            this.dvAutoCopy.DataSource = this.bdsTradingPartnerAutoCopy;
            this.dvAutoCopy.Location = new System.Drawing.Point(13, 33);
            this.dvAutoCopy.MultiSelect = false;
            this.dvAutoCopy.Name = "dvAutoCopy";
            this.dvAutoCopy.RowHeadersVisible = false;
            this.dvAutoCopy.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dvAutoCopy.Size = new System.Drawing.Size(311, 96);
            this.dvAutoCopy.TabIndex = 24;
            // 
            // colCopyTradingPartner
            // 
            this.colCopyTradingPartner.DataSource = this.bdsTradingPartnerCopyList;
            this.colCopyTradingPartner.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.colCopyTradingPartner.HeaderText = "Trading Partner";
            this.colCopyTradingPartner.Name = "colCopyTradingPartner";
            this.colCopyTradingPartner.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colCopyTradingPartner.Width = 300;
            // 
            // bdsTradingPartnerCopyList
            // 
            this.bdsTradingPartnerCopyList.DataSource = typeof(BHEDI.tblEDITransactionSet);
            this.bdsTradingPartnerCopyList.Sort = "";
            // 
            // bdsTradingPartnerAutoCopy
            // 
            this.bdsTradingPartnerAutoCopy.Sort = "";
            // 
            // btnRemoveCopyTrading
            // 
            this.btnRemoveCopyTrading.Location = new System.Drawing.Point(360, 84);
            this.btnRemoveCopyTrading.Name = "btnRemoveCopyTrading";
            this.btnRemoveCopyTrading.Size = new System.Drawing.Size(146, 34);
            this.btnRemoveCopyTrading.TabIndex = 26;
            this.btnRemoveCopyTrading.Text = "Remove Trading Partner";
            this.btnRemoveCopyTrading.UseVisualStyleBackColor = true;
            this.btnRemoveCopyTrading.Click += new System.EventHandler(this.btnRemoveCopyTrading_Click);
            // 
            // btnAddCopyTrading
            // 
            this.btnAddCopyTrading.Location = new System.Drawing.Point(360, 44);
            this.btnAddCopyTrading.Name = "btnAddCopyTrading";
            this.btnAddCopyTrading.Size = new System.Drawing.Size(146, 34);
            this.btnAddCopyTrading.TabIndex = 25;
            this.btnAddCopyTrading.Text = "Add Trading Partner";
            this.btnAddCopyTrading.UseVisualStyleBackColor = true;
            this.btnAddCopyTrading.Click += new System.EventHandler(this.btnAddCopyTrading_Click);
            // 
            // txt997Path
            // 
            this.txt997Path.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsTradingPartner, "Output997FilePath", true));
            this.txt997Path.Location = new System.Drawing.Point(151, 385);
            this.txt997Path.Name = "txt997Path";
            this.txt997Path.Size = new System.Drawing.Size(311, 20);
            this.txt997Path.TabIndex = 23;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(15, 392);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(107, 13);
            this.label1.TabIndex = 22;
            this.label1.Text = "Output 997 File Path:";
            // 
            // gbFunctionalAck
            // 
            this.gbFunctionalAck.Controls.Add(this.cboFunctionalAck);
            this.gbFunctionalAck.Location = new System.Drawing.Point(18, 308);
            this.gbFunctionalAck.Name = "gbFunctionalAck";
            this.gbFunctionalAck.Size = new System.Drawing.Size(445, 69);
            this.gbFunctionalAck.TabIndex = 5;
            this.gbFunctionalAck.TabStop = false;
            this.gbFunctionalAck.Text = "Functional Acknowledgement";
            // 
            // cboFunctionalAck
            // 
            this.cboFunctionalAck.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.bdsTradingPartner, "FunctionalAcknowledgement", true));
            this.cboFunctionalAck.FormattingEnabled = true;
            this.cboFunctionalAck.Location = new System.Drawing.Point(13, 30);
            this.cboFunctionalAck.Name = "cboFunctionalAck";
            this.cboFunctionalAck.Size = new System.Drawing.Size(417, 21);
            this.cboFunctionalAck.TabIndex = 0;
            // 
            // dgvTransactionSets
            // 
            this.dgvTransactionSets.AllowUserToAddRows = false;
            this.dgvTransactionSets.AllowUserToDeleteRows = false;
            this.dgvTransactionSets.AutoGenerateColumns = false;
            this.dgvTransactionSets.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvTransactionSets.ColumnHeadersVisible = false;
            this.dgvTransactionSets.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.coltransactionSetNo_Fk});
            this.dgvTransactionSets.DataSource = this.bdsTransactionSets;
            this.dgvTransactionSets.Location = new System.Drawing.Point(17, 14);
            this.dgvTransactionSets.MultiSelect = false;
            this.dgvTransactionSets.Name = "dgvTransactionSets";
            this.dgvTransactionSets.RowHeadersVisible = false;
            this.dgvTransactionSets.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvTransactionSets.Size = new System.Drawing.Size(542, 184);
            this.dgvTransactionSets.TabIndex = 0;
            this.dgvTransactionSets.DataError += new System.Windows.Forms.DataGridViewDataErrorEventHandler(this.dgvTransactionSets_DataError);
            this.dgvTransactionSets.SelectionChanged += new System.EventHandler(this.dgvTransactionSets_SelectionChanged);
            // 
            // coltransactionSetNo_Fk
            // 
            this.coltransactionSetNo_Fk.DataSource = this.bdsTransactionSetList;
            this.coltransactionSetNo_Fk.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.coltransactionSetNo_Fk.HeaderText = "Transaction Set";
            this.coltransactionSetNo_Fk.Name = "coltransactionSetNo_Fk";
            this.coltransactionSetNo_Fk.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.coltransactionSetNo_Fk.ValueMember = "TransactionSetNo";
            this.coltransactionSetNo_Fk.Width = 300;
            // 
            // bdsTransactionSetList
            // 
            this.bdsTransactionSetList.DataSource = typeof(BHEDI.tblEDITransactionSet);
            this.bdsTransactionSetList.Sort = "";
            // 
            // bdsTransactionSets
            // 
            this.bdsTransactionSets.Sort = "";
            // 
            // btnOpenMapDesign
            // 
            this.btnOpenMapDesign.Location = new System.Drawing.Point(567, 82);
            this.btnOpenMapDesign.Name = "btnOpenMapDesign";
            this.btnOpenMapDesign.Size = new System.Drawing.Size(146, 34);
            this.btnOpenMapDesign.TabIndex = 3;
            this.btnOpenMapDesign.Text = "Open Map Design";
            this.btnOpenMapDesign.UseVisualStyleBackColor = true;
            this.btnOpenMapDesign.Click += new System.EventHandler(this.btnOpenMapDesign_Click);
            // 
            // btnRemoveTransactionSet
            // 
            this.btnRemoveTransactionSet.Location = new System.Drawing.Point(567, 48);
            this.btnRemoveTransactionSet.Name = "btnRemoveTransactionSet";
            this.btnRemoveTransactionSet.Size = new System.Drawing.Size(146, 34);
            this.btnRemoveTransactionSet.TabIndex = 2;
            this.btnRemoveTransactionSet.Text = "Remove Transaction Set";
            this.btnRemoveTransactionSet.UseVisualStyleBackColor = true;
            this.btnRemoveTransactionSet.Click += new System.EventHandler(this.btnRemoveTransactionSet_Click);
            // 
            // btnAddTransactionSet
            // 
            this.btnAddTransactionSet.Location = new System.Drawing.Point(567, 14);
            this.btnAddTransactionSet.Name = "btnAddTransactionSet";
            this.btnAddTransactionSet.Size = new System.Drawing.Size(146, 34);
            this.btnAddTransactionSet.TabIndex = 1;
            this.btnAddTransactionSet.Text = "Add Transaction Set";
            this.btnAddTransactionSet.UseVisualStyleBackColor = true;
            this.btnAddTransactionSet.Click += new System.EventHandler(this.btnAddTransactionSet_Click);
            // 
            // gbErrorAction
            // 
            this.gbErrorAction.Controls.Add(this.cboErrorCheckOption);
            this.gbErrorAction.Location = new System.Drawing.Point(17, 219);
            this.gbErrorAction.Name = "gbErrorAction";
            this.gbErrorAction.Size = new System.Drawing.Size(445, 69);
            this.gbErrorAction.TabIndex = 4;
            this.gbErrorAction.TabStop = false;
            this.gbErrorAction.Text = "Error Actions";
            // 
            // cboErrorCheckOption
            // 
            this.cboErrorCheckOption.DataSource = this.bdsErrorHandleList;
            this.cboErrorCheckOption.DisplayMember = "Description";
            this.cboErrorCheckOption.FormattingEnabled = true;
            this.cboErrorCheckOption.Location = new System.Drawing.Point(13, 32);
            this.cboErrorCheckOption.Name = "cboErrorCheckOption";
            this.cboErrorCheckOption.Size = new System.Drawing.Size(417, 21);
            this.cboErrorCheckOption.TabIndex = 0;
            this.cboErrorCheckOption.ValueMember = "ErrorHandleNo";
            this.cboErrorCheckOption.SelectionChangeCommitted += new System.EventHandler(this.cboErrorCheckOption_SelectionChangeCommitted);
            // 
            // bdsErrorHandleList
            // 
            this.bdsErrorHandleList.DataSource = typeof(BHEDI.tblErrorHandle);
            // 
            // btnPrevious
            // 
            this.btnPrevious.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnPrevious.Location = new System.Drawing.Point(293, 627);
            this.btnPrevious.Name = "btnPrevious";
            this.btnPrevious.Size = new System.Drawing.Size(91, 34);
            this.btnPrevious.TabIndex = 2;
            this.btnPrevious.Text = "Previous";
            this.btnPrevious.UseVisualStyleBackColor = true;
            this.btnPrevious.Click += new System.EventHandler(this.btnPrevious_Click);
            // 
            // btnNext
            // 
            this.btnNext.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnNext.Location = new System.Drawing.Point(384, 627);
            this.btnNext.Name = "btnNext";
            this.btnNext.Size = new System.Drawing.Size(91, 34);
            this.btnNext.TabIndex = 3;
            this.btnNext.Text = "Next";
            this.btnNext.UseVisualStyleBackColor = true;
            this.btnNext.Click += new System.EventHandler(this.btnNext_Click);
            // 
            // btnNew
            // 
            this.btnNew.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnNew.Location = new System.Drawing.Point(475, 627);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(91, 34);
            this.btnNew.TabIndex = 4;
            this.btnNew.Text = "New";
            this.btnNew.UseVisualStyleBackColor = true;
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnDelete.Location = new System.Drawing.Point(657, 627);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(91, 34);
            this.btnDelete.TabIndex = 6;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnPrint
            // 
            this.btnPrint.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnPrint.Location = new System.Drawing.Point(748, 627);
            this.btnPrint.Name = "btnPrint";
            this.btnPrint.Size = new System.Drawing.Size(91, 34);
            this.btnPrint.TabIndex = 7;
            this.btnPrint.Text = "Print";
            this.btnPrint.UseVisualStyleBackColor = true;
            this.btnPrint.Click += new System.EventHandler(this.btnPrint_Click);
            // 
            // btnSaveEdit
            // 
            this.btnSaveEdit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnSaveEdit.Location = new System.Drawing.Point(839, 627);
            this.btnSaveEdit.Name = "btnSaveEdit";
            this.btnSaveEdit.Size = new System.Drawing.Size(91, 34);
            this.btnSaveEdit.TabIndex = 8;
            this.btnSaveEdit.Text = "Edit";
            this.btnSaveEdit.UseVisualStyleBackColor = true;
            this.btnSaveEdit.Click += new System.EventHandler(this.btnSaveEdit_Click);
            // 
            // btnExit
            // 
            this.btnExit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnExit.Location = new System.Drawing.Point(930, 627);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(91, 34);
            this.btnExit.TabIndex = 9;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // btnCopy
            // 
            this.btnCopy.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnCopy.Location = new System.Drawing.Point(566, 627);
            this.btnCopy.Name = "btnCopy";
            this.btnCopy.Size = new System.Drawing.Size(91, 34);
            this.btnCopy.TabIndex = 5;
            this.btnCopy.Text = "Copy";
            this.btnCopy.UseVisualStyleBackColor = true;
            this.btnCopy.Click += new System.EventHandler(this.btnCopy_Click);
            // 
            // frmTradingPartner
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1033, 673);
            this.Controls.Add(this.btnCopy);
            this.Controls.Add(this.btnExit);
            this.Controls.Add(this.dgvTradingPartner);
            this.Controls.Add(this.btnNext);
            this.Controls.Add(this.tabTradingPartner);
            this.Controls.Add(this.btnNew);
            this.Controls.Add(this.btnSaveEdit);
            this.Controls.Add(this.btnPrint);
            this.Controls.Add(this.btnPrevious);
            this.Controls.Add(this.btnDelete);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmTradingPartner";
            this.Text = "Trading Partner Setup";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmTradingPartner_FormClosing);
            this.Load += new System.EventHandler(this.frmTradingPartner_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvTradingPartner)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTradingPartner)).EndInit();
            this.tabTradingPartner.ResumeLayout(false);
            this.tpgGeneral.ResumeLayout(false);
            this.tpgGeneral.PerformLayout();
            this.gbGeneral.ResumeLayout(false);
            this.gbGeneral.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.bdsERPType)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsSubElementSep)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsStandardVersion)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsRepetitionSep)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsDataElementDelimiter)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsSegmentTerminator)).EndInit();
            this.tpgTransactionSets.ResumeLayout(false);
            this.tpgTransactionSets.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dvAutoCopy)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTradingPartnerCopyList)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTradingPartnerAutoCopy)).EndInit();
            this.gbFunctionalAck.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvTransactionSets)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTransactionSetList)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTransactionSets)).EndInit();
            this.gbErrorAction.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.bdsErrorHandleList)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTransactionSetErrorHandlings)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvTradingPartner;
        private System.Windows.Forms.TabControl tabTradingPartner;
        private System.Windows.Forms.TabPage tpgGeneral;
        private System.Windows.Forms.TabPage tpgTransactionSets;
        private System.Windows.Forms.TextBox txtTradingPartnerAlias;
        private System.Windows.Forms.GroupBox gbGeneral;
        private System.Windows.Forms.Label lblSegmentTerminator;
        private System.Windows.Forms.Label lblTraidingPartnerName;
        private System.Windows.Forms.ComboBox cboISA16SubElementSep;
        private System.Windows.Forms.ComboBox cboStandardVer;
        private System.Windows.Forms.ComboBox cboISA11RepetitionSep;
        private System.Windows.Forms.ComboBox cboDataElementDelimiter;
        private System.Windows.Forms.ComboBox cboSegmentTerminator;
        private System.Windows.Forms.Label lblISA16SubElementSep;
        private System.Windows.Forms.Label lblISA15TestIndicator;
        private System.Windows.Forms.Label lblStandardVer;
        private System.Windows.Forms.Label lblISA12InterchangeVer;
        private System.Windows.Forms.Label lblISA11RepetitionSep;
        private System.Windows.Forms.Label lblDataElementDelimiter;
        private System.Windows.Forms.Button btnPrevious;
        private System.Windows.Forms.Button btnNext;
        private System.Windows.Forms.Button btnNew;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnPrint;
        private System.Windows.Forms.Button btnSaveEdit;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.DataGridView dgvTransactionSets;
        private System.Windows.Forms.Button btnOpenMapDesign;
        private System.Windows.Forms.Button btnRemoveTransactionSet;
        private System.Windows.Forms.Button btnAddTransactionSet;
        private System.Windows.Forms.GroupBox gbErrorAction;
        private System.Windows.Forms.ComboBox cboErrorCheckOption;
        private System.Windows.Forms.Label lblISA04SecurityInfo;
        private System.Windows.Forms.Label lblISA03SecurityQual;
        private System.Windows.Forms.Label lblISA02AuthorizationInfo;
        private System.Windows.Forms.Label lblISA01AuthorizationQual;
        private System.Windows.Forms.Label lblGS03ApplicationReceiverCode;
        private System.Windows.Forms.Label lblGS02ApplicationSenderCode;
        private System.Windows.Forms.Label lblISA08InterchangeReceiverID;
        private System.Windows.Forms.Label lblISA07InterchangeReceiverIDQual;
        private System.Windows.Forms.Label lblISA06InterchangeSenderID;
        private System.Windows.Forms.Label lblISA05InterchangeSenderIDQual;
        private System.Windows.Forms.Label lblGS07ResponsibleAgencyCode;
        private System.Windows.Forms.TextBox txtGS07ResponsibleAgencyCode;
        private System.Windows.Forms.TextBox txtGS03ApplicationReceiverCode;
        private System.Windows.Forms.TextBox txtGS02ApplicationSenderCode;
        private System.Windows.Forms.TextBox txtISA08InterchangeReceiverID;
        private System.Windows.Forms.TextBox txtISA07InterchangeReceiverIDQual;
        private System.Windows.Forms.TextBox txtISA06InterchangeSenderID;
        private System.Windows.Forms.TextBox txtISA05InterchangeSenderIDQual;
        private System.Windows.Forms.TextBox txtISA04SecurityInfo;
        private System.Windows.Forms.TextBox txtISA03SecurityQual;
        private System.Windows.Forms.TextBox txtISA02AuthorizationInfo;
        private System.Windows.Forms.TextBox txtISA01AuthorizationQual;
        private System.Windows.Forms.BindingSource bdsTradingPartner;
        private System.Windows.Forms.TextBox txtISA12InterchangeVer;
        private System.Windows.Forms.BindingSource bdsSegmentTerminator;
        private System.Windows.Forms.BindingSource bdsStandardVersion;
        private System.Windows.Forms.BindingSource bdsDataElementDelimiter;
        private System.Windows.Forms.BindingSource bdsRepetitionSep;
        private System.Windows.Forms.CheckBox chkTestIndicator;
        private System.Windows.Forms.BindingSource bdsSubElementSep;
        private System.Windows.Forms.BindingSource bdsTransactionSetErrorHandlings;
        private System.Windows.Forms.BindingSource bdsErrorHandleList;
        private System.Windows.Forms.BindingSource bdsTransactionSetList;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTradingPartnerNo;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTradingPartnerName;
        private System.Windows.Forms.DataGridViewTextBoxColumn colISASenderID;
        private System.Windows.Forms.DataGridViewTextBoxColumn tradingPartnerNoDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn tradingPartnerNameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn authorizationQualDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn authorizationInfoDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn securityQualDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn securityInfoDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn interchangeSenderIDQualDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn interchangeSenderIDDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn interchangeReceiverIDQualDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn interchangeReceiverIDDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn applicationSenderCodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn applicationReceiverCodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn responsibleAgencyCodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn segmentTerminatorDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataElementDelimiterDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn repetitionSepDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn interchangeVersionDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn standardVersionDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewCheckBoxColumn testIndicatorDataGridViewCheckBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn subElementSepDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn tblEDITransactionStructuresDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn tblEDITrasactionRawDatasDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn tblEDIVersionDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn tblErrorLogsDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn tblInboundMappingsDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn tblOutboundMappingsDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn tblSegmentTerminatorDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn tblSegmentTerminator1DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn tblSegmentTerminator2DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn tblSegmentTerminator3DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn tblTradingPartnerErrorHandingsDataGridViewTextBoxColumn;
        private System.Windows.Forms.BindingSource bdsTransactionSets;
        private System.Windows.Forms.DataGridViewComboBoxColumn coltransactionSetNo_Fk;
        private System.Windows.Forms.GroupBox gbFunctionalAck;
        private System.Windows.Forms.ComboBox cboFunctionalAck;
        private System.Windows.Forms.Button btnCopy;
        private System.Windows.Forms.TextBox txtOutboundID;
        private System.Windows.Forms.Label lblOutboundID;
        private System.Windows.Forms.TextBox txt997Path;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.CheckBox chkGSYearFormat;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridView dvAutoCopy;
        private System.Windows.Forms.BindingSource bdsTradingPartnerAutoCopy;
        private System.Windows.Forms.Button btnRemoveCopyTrading;
        private System.Windows.Forms.Button btnAddCopyTrading;
        private System.Windows.Forms.BindingSource bdsTradingPartnerCopyList;
        private System.Windows.Forms.DataGridViewComboBoxColumn colCopyTradingPartner;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.CheckBox chkUsingSCP;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtSCPFilePath;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.BindingSource bdsERPType;
        private System.Windows.Forms.ComboBox cboERPType;
    }
}