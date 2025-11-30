namespace BHEDI
{
    partial class frmInboundMapDesign
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmInboundMapDesign));
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnEdit = new System.Windows.Forms.Button();
            this.btnSQLView = new System.Windows.Forms.Button();
            this.btnCopy = new System.Windows.Forms.Button();
            this.btnNew = new System.Windows.Forms.Button();
            this.btnNext = new System.Windows.Forms.Button();
            this.btnPrevious = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.dgvInbound = new System.Windows.Forms.DataGridView();
            this.colInboundMappingNo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTradingPartnerNoFK = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTransactionSetNoFK = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colSegmentNoFK = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.bdsEDISegment = new System.Windows.Forms.BindingSource(this.components);
            this.colPostion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTable = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colFieldName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colCommitDBAfterRead = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.bdsInboundMapping = new System.Windows.Forms.BindingSource(this.components);
            this.txtPosition = new System.Windows.Forms.TextBox();
            this.txtNote = new System.Windows.Forms.TextBox();
            this.lblPosition = new System.Windows.Forms.Label();
            this.lblTable = new System.Windows.Forms.Label();
            this.lblField = new System.Windows.Forms.Label();
            this.lblNote = new System.Windows.Forms.Label();
            this.tcInboundTab = new System.Windows.Forms.TabControl();
            this.tpGeneral = new System.Windows.Forms.TabPage();
            this.tlpGeneral = new System.Windows.Forms.TableLayoutPanel();
            this.chkIsInsert = new System.Windows.Forms.CheckBox();
            this.btnDataElement = new System.Windows.Forms.Button();
            this.chkCommit = new System.Windows.Forms.CheckBox();
            this.cboSegment = new System.Windows.Forms.ComboBox();
            this.cboField = new System.Windows.Forms.ComboBox();
            this.lblSegment = new System.Windows.Forms.Label();
            this.cboTable = new System.Windows.Forms.ComboBox();
            this.txtRawData = new System.Windows.Forms.TextBox();
            this.lblRawData = new System.Windows.Forms.Label();
            this.tpOperator = new System.Windows.Forms.TabPage();
            this.dgvOperator = new System.Windows.Forms.DataGridView();
            this.colOperatorMappingNo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colInboundMappingNoFK = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colDeleteOperator = new System.Windows.Forms.DataGridViewButtonColumn();
            this.colOperatorNo_FK = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.bdsOperator = new System.Windows.Forms.BindingSource(this.components);
            this.colOperatorParameter = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.bdsOperatorInboundMapping = new System.Windows.Forms.BindingSource(this.components);
            this.btnPrint = new System.Windows.Forms.Button();
            this.btnCopyFromList = new System.Windows.Forms.Button();
            this.btnExport = new System.Windows.Forms.Button();
            this.btnImport = new System.Windows.Forms.Button();
            this.btnView = new System.Windows.Forms.Button();
            this.rbtView = new System.Windows.Forms.GroupBox();
            this.rbtViewEntry = new System.Windows.Forms.RadioButton();
            this.rbtViewSegment = new System.Windows.Forms.RadioButton();
            this.rbtViewTable = new System.Windows.Forms.RadioButton();
            ((System.ComponentModel.ISupportInitialize)(this.dgvInbound)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsEDISegment)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsInboundMapping)).BeginInit();
            this.tcInboundTab.SuspendLayout();
            this.tpGeneral.SuspendLayout();
            this.tlpGeneral.SuspendLayout();
            this.tpOperator.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvOperator)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsOperator)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsOperatorInboundMapping)).BeginInit();
            this.rbtView.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnDelete
            // 
            this.btnDelete.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnDelete.Location = new System.Drawing.Point(811, 617);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(91, 34);
            this.btnDelete.TabIndex = 10;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnEdit
            // 
            this.btnEdit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnEdit.Location = new System.Drawing.Point(716, 617);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(91, 34);
            this.btnEdit.TabIndex = 9;
            this.btnEdit.Text = "Edit";
            this.btnEdit.UseVisualStyleBackColor = true;
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // btnSQLView
            // 
            this.btnSQLView.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnSQLView.Location = new System.Drawing.Point(522, 617);
            this.btnSQLView.Name = "btnSQLView";
            this.btnSQLView.Size = new System.Drawing.Size(91, 34);
            this.btnSQLView.TabIndex = 7;
            this.btnSQLView.Text = "SQL View";
            this.btnSQLView.UseVisualStyleBackColor = true;
            this.btnSQLView.Click += new System.EventHandler(this.btnSQLView_Click);
            // 
            // btnCopy
            // 
            this.btnCopy.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnCopy.Location = new System.Drawing.Point(285, 657);
            this.btnCopy.Name = "btnCopy";
            this.btnCopy.Size = new System.Drawing.Size(91, 34);
            this.btnCopy.TabIndex = 5;
            this.btnCopy.Text = "Copy";
            this.btnCopy.UseVisualStyleBackColor = true;
            this.btnCopy.Click += new System.EventHandler(this.btnCopy_Click);
            // 
            // btnNew
            // 
            this.btnNew.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnNew.Location = new System.Drawing.Point(194, 657);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(91, 34);
            this.btnNew.TabIndex = 4;
            this.btnNew.Text = "New";
            this.btnNew.UseVisualStyleBackColor = true;
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // btnNext
            // 
            this.btnNext.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnNext.Location = new System.Drawing.Point(103, 657);
            this.btnNext.Name = "btnNext";
            this.btnNext.Size = new System.Drawing.Size(91, 34);
            this.btnNext.TabIndex = 3;
            this.btnNext.Text = "Next";
            this.btnNext.UseVisualStyleBackColor = true;
            this.btnNext.Click += new System.EventHandler(this.btnNext_Click);
            // 
            // btnPrevious
            // 
            this.btnPrevious.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnPrevious.Location = new System.Drawing.Point(12, 657);
            this.btnPrevious.Name = "btnPrevious";
            this.btnPrevious.Size = new System.Drawing.Size(91, 34);
            this.btnPrevious.TabIndex = 2;
            this.btnPrevious.Text = "Previous";
            this.btnPrevious.UseVisualStyleBackColor = true;
            this.btnPrevious.Click += new System.EventHandler(this.btnPrevious_Click);
            // 
            // btnExit
            // 
            this.btnExit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnExit.Location = new System.Drawing.Point(908, 657);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(91, 34);
            this.btnExit.TabIndex = 12;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // btnSave
            // 
            this.btnSave.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnSave.Location = new System.Drawing.Point(908, 617);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(91, 34);
            this.btnSave.TabIndex = 11;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // dgvInbound
            // 
            this.dgvInbound.AllowUserToAddRows = false;
            this.dgvInbound.AllowUserToDeleteRows = false;
            this.dgvInbound.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvInbound.AutoGenerateColumns = false;
            this.dgvInbound.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvInbound.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colInboundMappingNo,
            this.colTradingPartnerNoFK,
            this.colTransactionSetNoFK,
            this.colSegmentNoFK,
            this.colPostion,
            this.colTable,
            this.colFieldName,
            this.colCommitDBAfterRead});
            this.dgvInbound.DataSource = this.bdsInboundMapping;
            this.dgvInbound.Location = new System.Drawing.Point(8, 12);
            this.dgvInbound.Name = "dgvInbound";
            this.dgvInbound.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvInbound.Size = new System.Drawing.Size(542, 599);
            this.dgvInbound.TabIndex = 0;
            this.dgvInbound.DataError += new System.Windows.Forms.DataGridViewDataErrorEventHandler(this.dgvInbound_DataError);
            // 
            // colInboundMappingNo
            // 
            this.colInboundMappingNo.DataPropertyName = "InboundMappingNo";
            this.colInboundMappingNo.HeaderText = "InboundMappingNo";
            this.colInboundMappingNo.Name = "colInboundMappingNo";
            this.colInboundMappingNo.Visible = false;
            this.colInboundMappingNo.Width = 126;
            // 
            // colTradingPartnerNoFK
            // 
            this.colTradingPartnerNoFK.DataPropertyName = "TradingPartnerNo_FK";
            this.colTradingPartnerNoFK.HeaderText = "TradingPartnerNo_FK";
            this.colTradingPartnerNoFK.Name = "colTradingPartnerNoFK";
            this.colTradingPartnerNoFK.Visible = false;
            this.colTradingPartnerNoFK.Width = 135;
            // 
            // colTransactionSetNoFK
            // 
            this.colTransactionSetNoFK.DataPropertyName = "TransactionSetNo_FK";
            this.colTransactionSetNoFK.HeaderText = "TransactionSetNo_FK";
            this.colTransactionSetNoFK.Name = "colTransactionSetNoFK";
            this.colTransactionSetNoFK.Visible = false;
            this.colTransactionSetNoFK.Width = 137;
            // 
            // colSegmentNoFK
            // 
            this.colSegmentNoFK.DataPropertyName = "SegmentNo_FK";
            this.colSegmentNoFK.DataSource = this.bdsEDISegment;
            this.colSegmentNoFK.HeaderText = "Segment";
            this.colSegmentNoFK.Name = "colSegmentNoFK";
            this.colSegmentNoFK.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colSegmentNoFK.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.colSegmentNoFK.Width = 60;
            // 
            // bdsEDISegment
            // 
            this.bdsEDISegment.DataSource = typeof(BHEDI.tblEDISegment);
            // 
            // colPostion
            // 
            this.colPostion.DataPropertyName = "Postion";
            this.colPostion.HeaderText = "Postion";
            this.colPostion.Name = "colPostion";
            this.colPostion.Width = 47;
            // 
            // colTable
            // 
            this.colTable.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells;
            this.colTable.DataPropertyName = "TableName";
            this.colTable.HeaderText = "Table";
            this.colTable.Name = "colTable";
            this.colTable.Width = 59;
            // 
            // colFieldName
            // 
            this.colFieldName.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells;
            this.colFieldName.DataPropertyName = "FieldName";
            this.colFieldName.HeaderText = "Field";
            this.colFieldName.Name = "colFieldName";
            this.colFieldName.Width = 54;
            // 
            // colCommitDBAfterRead
            // 
            this.colCommitDBAfterRead.DataPropertyName = "CommitDBAfterRead";
            this.colCommitDBAfterRead.HeaderText = "Commit";
            this.colCommitDBAfterRead.Name = "colCommitDBAfterRead";
            this.colCommitDBAfterRead.Width = 47;
            // 
            // bdsInboundMapping
            // 
            this.bdsInboundMapping.DataSource = typeof(BHEDI.tblInboundMapping);
            this.bdsInboundMapping.Sort = "InboundMappingNo";
            this.bdsInboundMapping.AddingNew += new System.ComponentModel.AddingNewEventHandler(this.bdsInboundMapping_AddingNew);
            this.bdsInboundMapping.CurrentChanged += new System.EventHandler(this.bdsInboundMapping_CurrentChanged);
            // 
            // txtPosition
            // 
            this.txtPosition.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.txtPosition.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsInboundMapping, "Postion", true));
            this.txtPosition.Location = new System.Drawing.Point(219, 56);
            this.txtPosition.Name = "txtPosition";
            this.txtPosition.Size = new System.Drawing.Size(210, 20);
            this.txtPosition.TabIndex = 6;
            // 
            // txtNote
            // 
            this.txtNote.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.tlpGeneral.SetColumnSpan(this.txtNote, 2);
            this.txtNote.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsInboundMapping, "Note", true));
            this.txtNote.Location = new System.Drawing.Point(3, 136);
            this.txtNote.Multiline = true;
            this.txtNote.Name = "txtNote";
            this.txtNote.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtNote.Size = new System.Drawing.Size(426, 114);
            this.txtNote.TabIndex = 12;
            // 
            // lblPosition
            // 
            this.lblPosition.AutoSize = true;
            this.lblPosition.Location = new System.Drawing.Point(219, 40);
            this.lblPosition.Name = "lblPosition";
            this.lblPosition.Size = new System.Drawing.Size(47, 13);
            this.lblPosition.TabIndex = 5;
            this.lblPosition.Text = "Position:";
            // 
            // lblTable
            // 
            this.lblTable.AutoSize = true;
            this.lblTable.Location = new System.Drawing.Point(3, 80);
            this.lblTable.Name = "lblTable";
            this.lblTable.Size = new System.Drawing.Size(37, 13);
            this.lblTable.TabIndex = 7;
            this.lblTable.Text = "Table:";
            // 
            // lblField
            // 
            this.lblField.AutoSize = true;
            this.lblField.Location = new System.Drawing.Point(219, 80);
            this.lblField.Name = "lblField";
            this.lblField.Size = new System.Drawing.Size(32, 13);
            this.lblField.TabIndex = 9;
            this.lblField.Text = "Field:";
            // 
            // lblNote
            // 
            this.lblNote.AutoSize = true;
            this.lblNote.Location = new System.Drawing.Point(3, 120);
            this.lblNote.Name = "lblNote";
            this.lblNote.Size = new System.Drawing.Size(33, 13);
            this.lblNote.TabIndex = 11;
            this.lblNote.Text = "Note:";
            // 
            // tcInboundTab
            // 
            this.tcInboundTab.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tcInboundTab.Controls.Add(this.tpGeneral);
            this.tcInboundTab.Controls.Add(this.tpOperator);
            this.tcInboundTab.Location = new System.Drawing.Point(556, 12);
            this.tcInboundTab.Name = "tcInboundTab";
            this.tcInboundTab.SelectedIndex = 0;
            this.tcInboundTab.Size = new System.Drawing.Size(446, 599);
            this.tcInboundTab.TabIndex = 0;
            // 
            // tpGeneral
            // 
            this.tpGeneral.Controls.Add(this.tlpGeneral);
            this.tpGeneral.Location = new System.Drawing.Point(4, 22);
            this.tpGeneral.Name = "tpGeneral";
            this.tpGeneral.Padding = new System.Windows.Forms.Padding(3);
            this.tpGeneral.Size = new System.Drawing.Size(438, 573);
            this.tpGeneral.TabIndex = 0;
            this.tpGeneral.Text = "General";
            this.tpGeneral.UseVisualStyleBackColor = true;
            // 
            // tlpGeneral
            // 
            this.tlpGeneral.AutoSize = true;
            this.tlpGeneral.ColumnCount = 2;
            this.tlpGeneral.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpGeneral.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpGeneral.Controls.Add(this.chkIsInsert, 0, 10);
            this.tlpGeneral.Controls.Add(this.btnDataElement, 0, 0);
            this.tlpGeneral.Controls.Add(this.chkCommit, 0, 9);
            this.tlpGeneral.Controls.Add(this.cboSegment, 0, 3);
            this.tlpGeneral.Controls.Add(this.txtNote, 0, 8);
            this.tlpGeneral.Controls.Add(this.lblNote, 0, 7);
            this.tlpGeneral.Controls.Add(this.cboField, 1, 5);
            this.tlpGeneral.Controls.Add(this.lblSegment, 0, 2);
            this.tlpGeneral.Controls.Add(this.txtPosition, 1, 3);
            this.tlpGeneral.Controls.Add(this.cboTable, 0, 5);
            this.tlpGeneral.Controls.Add(this.lblField, 1, 4);
            this.tlpGeneral.Controls.Add(this.lblTable, 0, 4);
            this.tlpGeneral.Controls.Add(this.lblPosition, 1, 2);
            this.tlpGeneral.Controls.Add(this.txtRawData, 1, 1);
            this.tlpGeneral.Controls.Add(this.lblRawData, 1, 0);
            this.tlpGeneral.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpGeneral.Location = new System.Drawing.Point(3, 3);
            this.tlpGeneral.Name = "tlpGeneral";
            this.tlpGeneral.RowCount = 11;
            this.tlpGeneral.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tlpGeneral.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tlpGeneral.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tlpGeneral.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tlpGeneral.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tlpGeneral.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tlpGeneral.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tlpGeneral.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tlpGeneral.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tlpGeneral.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tlpGeneral.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tlpGeneral.Size = new System.Drawing.Size(432, 567);
            this.tlpGeneral.TabIndex = 41;
            // 
            // chkIsInsert
            // 
            this.chkIsInsert.AutoSize = true;
            this.tlpGeneral.SetColumnSpan(this.chkIsInsert, 2);
            this.chkIsInsert.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.bdsInboundMapping, "IsInsert", true));
            this.chkIsInsert.Location = new System.Drawing.Point(3, 279);
            this.chkIsInsert.Name = "chkIsInsert";
            this.chkIsInsert.Size = new System.Drawing.Size(108, 17);
            this.chkIsInsert.TabIndex = 14;
            this.chkIsInsert.Text = "Add New Record";
            this.chkIsInsert.UseVisualStyleBackColor = true;
            // 
            // btnDataElement
            // 
            this.btnDataElement.Location = new System.Drawing.Point(3, 3);
            this.btnDataElement.Name = "btnDataElement";
            this.tlpGeneral.SetRowSpan(this.btnDataElement, 2);
            this.btnDataElement.Size = new System.Drawing.Size(91, 34);
            this.btnDataElement.TabIndex = 0;
            this.btnDataElement.Text = "Data Element";
            this.btnDataElement.UseVisualStyleBackColor = true;
            this.btnDataElement.Click += new System.EventHandler(this.btnDataElement_Click);
            // 
            // chkCommit
            // 
            this.chkCommit.AutoSize = true;
            this.tlpGeneral.SetColumnSpan(this.chkCommit, 2);
            this.chkCommit.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.bdsInboundMapping, "CommitDBAfterRead", true));
            this.chkCommit.Location = new System.Drawing.Point(3, 256);
            this.chkCommit.Name = "chkCommit";
            this.chkCommit.Size = new System.Drawing.Size(163, 17);
            this.chkCommit.TabIndex = 13;
            this.chkCommit.Text = "Commit Database After Read";
            this.chkCommit.UseVisualStyleBackColor = true;
            // 
            // cboSegment
            // 
            this.cboSegment.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.cboSegment.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.cboSegment.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.bdsInboundMapping, "SegmentNo_FK", true));
            this.cboSegment.DataSource = this.bdsEDISegment;
            this.cboSegment.FormattingEnabled = true;
            this.cboSegment.Location = new System.Drawing.Point(3, 56);
            this.cboSegment.Name = "cboSegment";
            this.cboSegment.Size = new System.Drawing.Size(210, 21);
            this.cboSegment.TabIndex = 4;
            // 
            // cboField
            // 
            this.cboField.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.cboField.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.cboField.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsInboundMapping, "FieldName", true));
            this.cboField.FormattingEnabled = true;
            this.cboField.Location = new System.Drawing.Point(219, 96);
            this.cboField.Name = "cboField";
            this.cboField.Size = new System.Drawing.Size(210, 21);
            this.cboField.TabIndex = 10;
            this.cboField.DropDown += new System.EventHandler(this.cboField_DropDown);
            // 
            // lblSegment
            // 
            this.lblSegment.AutoSize = true;
            this.lblSegment.Location = new System.Drawing.Point(3, 40);
            this.lblSegment.Name = "lblSegment";
            this.lblSegment.Size = new System.Drawing.Size(52, 13);
            this.lblSegment.TabIndex = 3;
            this.lblSegment.Text = "Segment:";
            // 
            // cboTable
            // 
            this.cboTable.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.cboTable.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsInboundMapping, "TableName", true));
            this.cboTable.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.bdsInboundMapping, "TableName", true));
            this.cboTable.FormattingEnabled = true;
            this.cboTable.Location = new System.Drawing.Point(3, 96);
            this.cboTable.Name = "cboTable";
            this.cboTable.Size = new System.Drawing.Size(210, 21);
            this.cboTable.TabIndex = 8;
            this.cboTable.SelectionChangeCommitted += new System.EventHandler(this.cboTable_SelectionChangeCommitted);
            this.cboTable.KeyDown += new System.Windows.Forms.KeyEventHandler(this.cboTable_KeyDown);
            // 
            // txtRawData
            // 
            this.txtRawData.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtRawData.Location = new System.Drawing.Point(219, 16);
            this.txtRawData.Name = "txtRawData";
            this.txtRawData.ReadOnly = true;
            this.txtRawData.Size = new System.Drawing.Size(210, 20);
            this.txtRawData.TabIndex = 2;
            // 
            // lblRawData
            // 
            this.lblRawData.AutoSize = true;
            this.lblRawData.Location = new System.Drawing.Point(219, 0);
            this.lblRawData.Name = "lblRawData";
            this.lblRawData.Size = new System.Drawing.Size(58, 13);
            this.lblRawData.TabIndex = 1;
            this.lblRawData.Text = "Raw Data:";
            // 
            // tpOperator
            // 
            this.tpOperator.Controls.Add(this.dgvOperator);
            this.tpOperator.Location = new System.Drawing.Point(4, 22);
            this.tpOperator.Name = "tpOperator";
            this.tpOperator.Padding = new System.Windows.Forms.Padding(3);
            this.tpOperator.Size = new System.Drawing.Size(438, 573);
            this.tpOperator.TabIndex = 1;
            this.tpOperator.Text = "Operator";
            this.tpOperator.UseVisualStyleBackColor = true;
            // 
            // dgvOperator
            // 
            this.dgvOperator.AllowUserToDeleteRows = false;
            this.dgvOperator.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvOperator.AutoGenerateColumns = false;
            this.dgvOperator.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dgvOperator.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dgvOperator.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvOperator.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colOperatorMappingNo,
            this.colInboundMappingNoFK,
            this.colDeleteOperator,
            this.colOperatorNo_FK,
            this.colOperatorParameter});
            this.dgvOperator.DataSource = this.bdsOperatorInboundMapping;
            this.dgvOperator.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.dgvOperator.Location = new System.Drawing.Point(7, 7);
            this.dgvOperator.Name = "dgvOperator";
            this.dgvOperator.Size = new System.Drawing.Size(425, 560);
            this.dgvOperator.TabIndex = 0;
            this.dgvOperator.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvOperator_CellContentClick);
            this.dgvOperator.CellPainting += new System.Windows.Forms.DataGridViewCellPaintingEventHandler(this.dgvOperator_CellPainting);
            this.dgvOperator.DataBindingComplete += new System.Windows.Forms.DataGridViewBindingCompleteEventHandler(this.dgvOperator_DataBindingComplete);
            this.dgvOperator.DataError += new System.Windows.Forms.DataGridViewDataErrorEventHandler(this.dgvOperator_DataError);
            this.dgvOperator.UserDeletingRow += new System.Windows.Forms.DataGridViewRowCancelEventHandler(this.dgvOperator_UserDeletingRow);
            // 
            // colOperatorMappingNo
            // 
            this.colOperatorMappingNo.DataPropertyName = "OperatorMappingNo";
            this.colOperatorMappingNo.HeaderText = "OperatorMappingNo";
            this.colOperatorMappingNo.Name = "colOperatorMappingNo";
            this.colOperatorMappingNo.Visible = false;
            this.colOperatorMappingNo.Width = 128;
            // 
            // colInboundMappingNoFK
            // 
            this.colInboundMappingNoFK.DataPropertyName = "InboundMappingNo_FK";
            this.colInboundMappingNoFK.HeaderText = "InboundMappingNo_FK";
            this.colInboundMappingNoFK.Name = "colInboundMappingNoFK";
            this.colInboundMappingNoFK.Visible = false;
            this.colInboundMappingNoFK.Width = 145;
            // 
            // colDeleteOperator
            // 
            this.colDeleteOperator.HeaderText = "";
            this.colDeleteOperator.Name = "colDeleteOperator";
            this.colDeleteOperator.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colDeleteOperator.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.colDeleteOperator.Text = "";
            this.colDeleteOperator.Width = 21;
            // 
            // colOperatorNo_FK
            // 
            this.colOperatorNo_FK.DataPropertyName = "OperatorNo_FK";
            this.colOperatorNo_FK.DataSource = this.bdsOperator;
            this.colOperatorNo_FK.DisplayMember = "OperatorName";
            this.colOperatorNo_FK.HeaderText = "Operator Name";
            this.colOperatorNo_FK.Name = "colOperatorNo_FK";
            this.colOperatorNo_FK.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colOperatorNo_FK.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.colOperatorNo_FK.ValueMember = "OperatorNo";
            this.colOperatorNo_FK.Width = 96;
            // 
            // bdsOperator
            // 
            this.bdsOperator.DataSource = typeof(BHEDI.tblOperator);
            // 
            // colOperatorParameter
            // 
            this.colOperatorParameter.DataPropertyName = "OperatorParameter";
            this.colOperatorParameter.HeaderText = "Operator Parameter";
            this.colOperatorParameter.Name = "colOperatorParameter";
            this.colOperatorParameter.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colOperatorParameter.Width = 114;
            // 
            // bdsOperatorInboundMapping
            // 
            this.bdsOperatorInboundMapping.DataMember = "tblOperatorInboundMappings";
            this.bdsOperatorInboundMapping.DataSource = this.bdsInboundMapping;
            // 
            // btnPrint
            // 
            this.btnPrint.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnPrint.Location = new System.Drawing.Point(619, 617);
            this.btnPrint.Name = "btnPrint";
            this.btnPrint.Size = new System.Drawing.Size(91, 34);
            this.btnPrint.TabIndex = 8;
            this.btnPrint.Text = "Print";
            this.btnPrint.UseVisualStyleBackColor = true;
            this.btnPrint.Click += new System.EventHandler(this.btnPrint_Click);
            // 
            // btnCopyFromList
            // 
            this.btnCopyFromList.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnCopyFromList.Location = new System.Drawing.Point(376, 657);
            this.btnCopyFromList.Name = "btnCopyFromList";
            this.btnCopyFromList.Size = new System.Drawing.Size(91, 34);
            this.btnCopyFromList.TabIndex = 6;
            this.btnCopyFromList.Text = "Copy From Other Setting";
            this.btnCopyFromList.UseVisualStyleBackColor = true;
            this.btnCopyFromList.Click += new System.EventHandler(this.btnCopyFromList_Click);
            // 
            // btnExport
            // 
            this.btnExport.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnExport.Location = new System.Drawing.Point(522, 657);
            this.btnExport.Name = "btnExport";
            this.btnExport.Size = new System.Drawing.Size(91, 34);
            this.btnExport.TabIndex = 13;
            this.btnExport.Text = "Export";
            this.btnExport.UseVisualStyleBackColor = true;
            this.btnExport.Click += new System.EventHandler(this.btnExport_Click);
            // 
            // btnImport
            // 
            this.btnImport.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnImport.Location = new System.Drawing.Point(619, 657);
            this.btnImport.Name = "btnImport";
            this.btnImport.Size = new System.Drawing.Size(91, 34);
            this.btnImport.TabIndex = 14;
            this.btnImport.Text = "Import";
            this.btnImport.UseVisualStyleBackColor = true;
            this.btnImport.Click += new System.EventHandler(this.btnImport_Click);
            // 
            // btnView
            // 
            this.btnView.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnView.Location = new System.Drawing.Point(12, 617);
            this.btnView.Name = "btnView";
            this.btnView.Size = new System.Drawing.Size(91, 34);
            this.btnView.TabIndex = 2;
            this.btnView.Text = "View";
            this.btnView.UseVisualStyleBackColor = true;
            this.btnView.Click += new System.EventHandler(this.btnView_Click);
            // 
            // rbtView
            // 
            this.rbtView.Controls.Add(this.rbtViewTable);
            this.rbtView.Controls.Add(this.rbtViewSegment);
            this.rbtView.Controls.Add(this.rbtViewEntry);
            this.rbtView.Location = new System.Drawing.Point(103, 612);
            this.rbtView.Name = "rbtView";
            this.rbtView.Size = new System.Drawing.Size(364, 39);
            this.rbtView.TabIndex = 2;
            this.rbtView.TabStop = false;
            // 
            // rbtViewEntry
            // 
            this.rbtViewEntry.AutoSize = true;
            this.rbtViewEntry.Location = new System.Drawing.Point(7, 11);
            this.rbtViewEntry.Name = "rbtViewEntry";
            this.rbtViewEntry.Size = new System.Drawing.Size(93, 17);
            this.rbtViewEntry.TabIndex = 0;
            this.rbtViewEntry.TabStop = true;
            this.rbtViewEntry.Text = "Entry Mapping";
            this.rbtViewEntry.UseVisualStyleBackColor = true;
            // 
            // rbtViewSegment
            // 
            this.rbtViewSegment.AutoSize = true;
            this.rbtViewSegment.Location = new System.Drawing.Point(106, 10);
            this.rbtViewSegment.Name = "rbtViewSegment";
            this.rbtViewSegment.Size = new System.Drawing.Size(67, 17);
            this.rbtViewSegment.TabIndex = 1;
            this.rbtViewSegment.TabStop = true;
            this.rbtViewSegment.Text = "Segment";
            this.rbtViewSegment.UseVisualStyleBackColor = true;
            // 
            // rbtViewTable
            // 
            this.rbtViewTable.AutoSize = true;
            this.rbtViewTable.Location = new System.Drawing.Point(179, 10);
            this.rbtViewTable.Name = "rbtViewTable";
            this.rbtViewTable.Size = new System.Drawing.Size(52, 17);
            this.rbtViewTable.TabIndex = 2;
            this.rbtViewTable.TabStop = true;
            this.rbtViewTable.Text = "Table";
            this.rbtViewTable.UseVisualStyleBackColor = true;
            // 
            // frmInboundMapDesign
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1009, 703);
            this.Controls.Add(this.rbtView);
            this.Controls.Add(this.btnView);
            this.Controls.Add(this.btnImport);
            this.Controls.Add(this.btnExport);
            this.Controls.Add(this.btnCopyFromList);
            this.Controls.Add(this.btnPrint);
            this.Controls.Add(this.tcInboundTab);
            this.Controls.Add(this.dgvInbound);
            this.Controls.Add(this.btnExit);
            this.Controls.Add(this.btnSave);
            this.Controls.Add(this.btnDelete);
            this.Controls.Add(this.btnEdit);
            this.Controls.Add(this.btnSQLView);
            this.Controls.Add(this.btnCopy);
            this.Controls.Add(this.btnNew);
            this.Controls.Add(this.btnNext);
            this.Controls.Add(this.btnPrevious);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MinimumSize = new System.Drawing.Size(1025, 741);
            this.Name = "frmInboundMapDesign";
            this.Text = "Inbound Map Design";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmInboundMapDesign_FormClosing);
            this.Load += new System.EventHandler(this.frmInboundMapDesign_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvInbound)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsEDISegment)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsInboundMapping)).EndInit();
            this.tcInboundTab.ResumeLayout(false);
            this.tpGeneral.ResumeLayout(false);
            this.tpGeneral.PerformLayout();
            this.tlpGeneral.ResumeLayout(false);
            this.tlpGeneral.PerformLayout();
            this.tpOperator.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvOperator)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsOperator)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsOperatorInboundMapping)).EndInit();
            this.rbtView.ResumeLayout(false);
            this.rbtView.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnEdit;
        private System.Windows.Forms.Button btnSQLView;
        private System.Windows.Forms.Button btnCopy;
        private System.Windows.Forms.Button btnNew;
        private System.Windows.Forms.Button btnNext;
        private System.Windows.Forms.Button btnPrevious;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.DataGridView dgvInbound;
        private System.Windows.Forms.TextBox txtPosition;
        private System.Windows.Forms.TextBox txtNote;
        private System.Windows.Forms.Label lblPosition;
        private System.Windows.Forms.Label lblTable;
        private System.Windows.Forms.Label lblField;
        private System.Windows.Forms.Label lblNote;
        private System.Windows.Forms.BindingSource bdsInboundMapping;
        private System.Windows.Forms.DataGridViewComboBoxColumn colOperatorNoFK;
        private System.Windows.Forms.TabControl tcInboundTab;
        private System.Windows.Forms.TabPage tpGeneral;
        private System.Windows.Forms.TabPage tpOperator;
        private System.Windows.Forms.CheckBox chkCommit;
        private System.Windows.Forms.ComboBox cboField;
        private System.Windows.Forms.ComboBox cboTable;
        private System.Windows.Forms.DataGridView dgvOperator;
        private System.Windows.Forms.BindingSource bdsOperatorInboundMapping;
        private System.Windows.Forms.BindingSource bdsOperator;
        private System.Windows.Forms.Button btnDataElement;
        private System.Windows.Forms.BindingSource bdsEDISegment;
        private System.Windows.Forms.Label lblSegment;
        private System.Windows.Forms.ComboBox cboSegment;
        private System.Windows.Forms.TableLayoutPanel tlpGeneral;
        private System.Windows.Forms.DataGridViewTextBoxColumn colOperatorMappingNo;
        private System.Windows.Forms.DataGridViewTextBoxColumn colInboundMappingNoFK;
        private System.Windows.Forms.DataGridViewButtonColumn colDeleteOperator;
        private System.Windows.Forms.DataGridViewComboBoxColumn colOperatorNo_FK;
        private System.Windows.Forms.DataGridViewTextBoxColumn colOperatorParameter;
        private System.Windows.Forms.TextBox txtRawData;
        private System.Windows.Forms.Label lblRawData;
        private System.Windows.Forms.Button btnPrint;
        private System.Windows.Forms.Button btnCopyFromList;
        private System.Windows.Forms.DataGridViewTextBoxColumn colInboundMappingNo;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTradingPartnerNoFK;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTransactionSetNoFK;
        private System.Windows.Forms.DataGridViewComboBoxColumn colSegmentNoFK;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPostion;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTable;
        private System.Windows.Forms.DataGridViewTextBoxColumn colFieldName;
        private System.Windows.Forms.DataGridViewCheckBoxColumn colCommitDBAfterRead;
        private System.Windows.Forms.CheckBox chkIsInsert;
        private System.Windows.Forms.Button btnExport;
        private System.Windows.Forms.Button btnImport;
        private System.Windows.Forms.Button btnView;
        private System.Windows.Forms.GroupBox rbtView;
        private System.Windows.Forms.RadioButton rbtViewTable;
        private System.Windows.Forms.RadioButton rbtViewSegment;
        private System.Windows.Forms.RadioButton rbtViewEntry;
    }
}