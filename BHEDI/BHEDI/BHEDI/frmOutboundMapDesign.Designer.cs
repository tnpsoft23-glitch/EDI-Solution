namespace BHEDI
{
    partial class frmOutboundMapDesign
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmOutboundMapDesign));
            this.btnPrevious = new System.Windows.Forms.Button();
            this.btnNext = new System.Windows.Forms.Button();
            this.btnNew = new System.Windows.Forms.Button();
            this.btnCopy = new System.Windows.Forms.Button();
            this.btnEDIView = new System.Windows.Forms.Button();
            this.btnEdit = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.dgvOutput = new System.Windows.Forms.DataGridView();
            this.colOutboundMappingNo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTradingPartnerNoFK = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTransactionSetNoFK = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colSegmentNoFK = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.bdsEDISegment = new System.Windows.Forms.BindingSource(this.components);
            this.colPostion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colValue = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colXMLPathField = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colSegmentNumber = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.bdsOutboundMapping = new System.Windows.Forms.BindingSource(this.components);
            this.lblOutput = new System.Windows.Forms.Label();
            this.lblNote = new System.Windows.Forms.Label();
            this.lblXMLField = new System.Windows.Forms.Label();
            this.lblValue = new System.Windows.Forms.Label();
            this.lblPosition = new System.Windows.Forms.Label();
            this.txtValue = new System.Windows.Forms.TextBox();
            this.lblSegment = new System.Windows.Forms.Label();
            this.txtOutput = new System.Windows.Forms.TextBox();
            this.txtNote = new System.Windows.Forms.TextBox();
            this.txtXMLField = new System.Windows.Forms.TextBox();
            this.txtPosition = new System.Windows.Forms.TextBox();
            this.cboSegment = new System.Windows.Forms.ComboBox();
            this.tcOutboundTab = new System.Windows.Forms.TabControl();
            this.tpGeneral = new System.Windows.Forms.TabPage();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.tlpOutputFile = new System.Windows.Forms.TableLayoutPanel();
            this.btnSelectFolder = new System.Windows.Forms.Button();
            this.btnDataElement = new System.Windows.Forms.Button();
            this.txtSegmentNumber = new System.Windows.Forms.TextBox();
            this.lblSegmentNumber = new System.Windows.Forms.Label();
            this.tpOperator = new System.Windows.Forms.TabPage();
            this.dgvOperator = new System.Windows.Forms.DataGridView();
            this.colOperatorMappingNo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colDeleteOperator = new System.Windows.Forms.DataGridViewButtonColumn();
            this.colOperatorNo_FK = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.bdsOperator = new System.Windows.Forms.BindingSource(this.components);
            this.colOperatorParameter = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.bdsOperatorOutboundMapping = new System.Windows.Forms.BindingSource(this.components);
            this.btnPrint = new System.Windows.Forms.Button();
            this.btnCopyFromList = new System.Windows.Forms.Button();
            this.btnExport = new System.Windows.Forms.Button();
            this.btnImport = new System.Windows.Forms.Button();
            this.rbtView = new System.Windows.Forms.GroupBox();
            this.rbtViewTable = new System.Windows.Forms.RadioButton();
            this.rbtViewSegment = new System.Windows.Forms.RadioButton();
            this.rbtViewEntry = new System.Windows.Forms.RadioButton();
            this.btnView = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvOutput)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsEDISegment)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsOutboundMapping)).BeginInit();
            this.tcOutboundTab.SuspendLayout();
            this.tpGeneral.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.tlpOutputFile.SuspendLayout();
            this.tpOperator.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvOperator)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsOperator)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsOperatorOutboundMapping)).BeginInit();
            this.rbtView.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnPrevious
            // 
            this.btnPrevious.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnPrevious.Location = new System.Drawing.Point(13, 657);
            this.btnPrevious.Name = "btnPrevious";
            this.btnPrevious.Size = new System.Drawing.Size(91, 34);
            this.btnPrevious.TabIndex = 2;
            this.btnPrevious.Text = "Previous";
            this.btnPrevious.UseVisualStyleBackColor = true;
            this.btnPrevious.Click += new System.EventHandler(this.btnPrevious_Click);
            // 
            // btnNext
            // 
            this.btnNext.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnNext.Location = new System.Drawing.Point(104, 657);
            this.btnNext.Name = "btnNext";
            this.btnNext.Size = new System.Drawing.Size(91, 34);
            this.btnNext.TabIndex = 3;
            this.btnNext.Text = "Next";
            this.btnNext.UseVisualStyleBackColor = true;
            this.btnNext.Click += new System.EventHandler(this.btnNext_Click);
            // 
            // btnNew
            // 
            this.btnNew.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnNew.Location = new System.Drawing.Point(195, 657);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(91, 34);
            this.btnNew.TabIndex = 4;
            this.btnNew.Text = "New";
            this.btnNew.UseVisualStyleBackColor = true;
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // btnCopy
            // 
            this.btnCopy.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnCopy.Location = new System.Drawing.Point(286, 657);
            this.btnCopy.Name = "btnCopy";
            this.btnCopy.Size = new System.Drawing.Size(91, 34);
            this.btnCopy.TabIndex = 5;
            this.btnCopy.Text = "Copy";
            this.btnCopy.UseVisualStyleBackColor = true;
            this.btnCopy.Click += new System.EventHandler(this.btnCopy_Click);
            // 
            // btnEDIView
            // 
            this.btnEDIView.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnEDIView.Location = new System.Drawing.Point(522, 614);
            this.btnEDIView.Name = "btnEDIView";
            this.btnEDIView.Size = new System.Drawing.Size(91, 34);
            this.btnEDIView.TabIndex = 7;
            this.btnEDIView.Text = "EDI View";
            this.btnEDIView.UseVisualStyleBackColor = true;
            this.btnEDIView.Click += new System.EventHandler(this.btnEDIView_Click);
            // 
            // btnEdit
            // 
            this.btnEdit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnEdit.Location = new System.Drawing.Point(716, 614);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(91, 34);
            this.btnEdit.TabIndex = 9;
            this.btnEdit.Text = "Edit";
            this.btnEdit.UseVisualStyleBackColor = true;
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnDelete.Location = new System.Drawing.Point(813, 614);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(91, 34);
            this.btnDelete.TabIndex = 10;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnSave
            // 
            this.btnSave.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnSave.Location = new System.Drawing.Point(910, 614);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(91, 34);
            this.btnSave.TabIndex = 11;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // btnExit
            // 
            this.btnExit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnExit.Location = new System.Drawing.Point(911, 657);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(91, 34);
            this.btnExit.TabIndex = 12;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // dgvOutput
            // 
            this.dgvOutput.AllowUserToAddRows = false;
            this.dgvOutput.AllowUserToDeleteRows = false;
            this.dgvOutput.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.dgvOutput.AutoGenerateColumns = false;
            this.dgvOutput.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvOutput.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colOutboundMappingNo,
            this.colTradingPartnerNoFK,
            this.colTransactionSetNoFK,
            this.colSegmentNoFK,
            this.colPostion,
            this.colValue,
            this.colXMLPathField,
            this.colSegmentNumber});
            this.dgvOutput.DataSource = this.bdsOutboundMapping;
            this.dgvOutput.Location = new System.Drawing.Point(8, 12);
            this.dgvOutput.Name = "dgvOutput";
            this.dgvOutput.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvOutput.Size = new System.Drawing.Size(544, 599);
            this.dgvOutput.TabIndex = 0;
            this.dgvOutput.DataError += new System.Windows.Forms.DataGridViewDataErrorEventHandler(this.dgvOutput_DataError);
            // 
            // colOutboundMappingNo
            // 
            this.colOutboundMappingNo.DataPropertyName = "OutboundMappingNo";
            this.colOutboundMappingNo.HeaderText = "OutboundMappingNo";
            this.colOutboundMappingNo.Name = "colOutboundMappingNo";
            this.colOutboundMappingNo.Visible = false;
            this.colOutboundMappingNo.Width = 134;
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
            // colValue
            // 
            this.colValue.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells;
            this.colValue.DataPropertyName = "Value";
            this.colValue.HeaderText = "Value";
            this.colValue.Name = "colValue";
            this.colValue.Width = 59;
            // 
            // colXMLPathField
            // 
            this.colXMLPathField.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells;
            this.colXMLPathField.DataPropertyName = "XMLPathField";
            this.colXMLPathField.HeaderText = "XML Field";
            this.colXMLPathField.Name = "colXMLPathField";
            this.colXMLPathField.Width = 73;
            // 
            // colSegmentNumber
            // 
            this.colSegmentNumber.DataPropertyName = "SegmentNumber";
            this.colSegmentNumber.HeaderText = "Segment Number";
            this.colSegmentNumber.Name = "colSegmentNumber";
            this.colSegmentNumber.Width = 60;
            // 
            // bdsOutboundMapping
            // 
            this.bdsOutboundMapping.DataSource = typeof(BHEDI.tblOutboundMapping);
            this.bdsOutboundMapping.AddingNew += new System.ComponentModel.AddingNewEventHandler(this.bdsOutboundMapping_AddingNew);
            // 
            // lblOutput
            // 
            this.lblOutput.AutoSize = true;
            this.lblOutput.Location = new System.Drawing.Point(3, 276);
            this.lblOutput.Name = "lblOutput";
            this.lblOutput.Size = new System.Drawing.Size(107, 13);
            this.lblOutput.TabIndex = 13;
            this.lblOutput.Text = "Output EDI File Path:";
            // 
            // lblNote
            // 
            this.lblNote.AutoSize = true;
            this.lblNote.Location = new System.Drawing.Point(3, 158);
            this.lblNote.Name = "lblNote";
            this.lblNote.Size = new System.Drawing.Size(33, 13);
            this.lblNote.TabIndex = 11;
            this.lblNote.Text = "Note:";
            // 
            // lblXMLField
            // 
            this.lblXMLField.AutoSize = true;
            this.lblXMLField.Location = new System.Drawing.Point(218, 80);
            this.lblXMLField.Name = "lblXMLField";
            this.lblXMLField.Size = new System.Drawing.Size(57, 13);
            this.lblXMLField.TabIndex = 7;
            this.lblXMLField.Text = "XML Field:";
            // 
            // lblValue
            // 
            this.lblValue.AutoSize = true;
            this.lblValue.Location = new System.Drawing.Point(3, 80);
            this.lblValue.Name = "lblValue";
            this.lblValue.Size = new System.Drawing.Size(37, 13);
            this.lblValue.TabIndex = 5;
            this.lblValue.Text = "Value:";
            // 
            // lblPosition
            // 
            this.lblPosition.AutoSize = true;
            this.lblPosition.Location = new System.Drawing.Point(218, 40);
            this.lblPosition.Name = "lblPosition";
            this.lblPosition.Size = new System.Drawing.Size(47, 13);
            this.lblPosition.TabIndex = 3;
            this.lblPosition.Text = "Position:";
            // 
            // txtValue
            // 
            this.txtValue.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.txtValue.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsOutboundMapping, "Value", true));
            this.txtValue.Location = new System.Drawing.Point(3, 96);
            this.txtValue.Name = "txtValue";
            this.txtValue.Size = new System.Drawing.Size(209, 20);
            this.txtValue.TabIndex = 6;
            // 
            // lblSegment
            // 
            this.lblSegment.AutoSize = true;
            this.lblSegment.Location = new System.Drawing.Point(3, 40);
            this.lblSegment.Name = "lblSegment";
            this.lblSegment.Size = new System.Drawing.Size(52, 13);
            this.lblSegment.TabIndex = 1;
            this.lblSegment.Text = "Segment:";
            // 
            // txtOutput
            // 
            this.txtOutput.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtOutput.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsOutboundMapping, "OutputEDIFilePath", true));
            this.txtOutput.Location = new System.Drawing.Point(3, 3);
            this.txtOutput.Name = "txtOutput";
            this.txtOutput.Size = new System.Drawing.Size(305, 20);
            this.txtOutput.TabIndex = 0;
            // 
            // txtNote
            // 
            this.txtNote.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.tableLayoutPanel1.SetColumnSpan(this.txtNote, 2);
            this.txtNote.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsOutboundMapping, "Note", true));
            this.txtNote.Location = new System.Drawing.Point(3, 174);
            this.txtNote.Multiline = true;
            this.txtNote.Name = "txtNote";
            this.txtNote.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtNote.Size = new System.Drawing.Size(424, 99);
            this.txtNote.TabIndex = 12;
            // 
            // txtXMLField
            // 
            this.txtXMLField.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.txtXMLField.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsOutboundMapping, "XMLPathField", true));
            this.txtXMLField.Location = new System.Drawing.Point(218, 96);
            this.txtXMLField.Name = "txtXMLField";
            this.txtXMLField.Size = new System.Drawing.Size(209, 20);
            this.txtXMLField.TabIndex = 8;
            // 
            // txtPosition
            // 
            this.txtPosition.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.txtPosition.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsOutboundMapping, "Postion", true));
            this.txtPosition.Location = new System.Drawing.Point(218, 56);
            this.txtPosition.Name = "txtPosition";
            this.txtPosition.Size = new System.Drawing.Size(209, 20);
            this.txtPosition.TabIndex = 4;
            // 
            // cboSegment
            // 
            this.cboSegment.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.cboSegment.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.cboSegment.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.bdsOutboundMapping, "SegmentNo_FK", true));
            this.cboSegment.DataSource = this.bdsEDISegment;
            this.cboSegment.DisplayMember = "SegmentNo";
            this.cboSegment.FormattingEnabled = true;
            this.cboSegment.Location = new System.Drawing.Point(3, 56);
            this.cboSegment.Name = "cboSegment";
            this.cboSegment.Size = new System.Drawing.Size(209, 21);
            this.cboSegment.TabIndex = 2;
            this.cboSegment.ValueMember = "SegmentNo";
            // 
            // tcOutboundTab
            // 
            this.tcOutboundTab.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tcOutboundTab.Controls.Add(this.tpGeneral);
            this.tcOutboundTab.Controls.Add(this.tpOperator);
            this.tcOutboundTab.Location = new System.Drawing.Point(558, 12);
            this.tcOutboundTab.Name = "tcOutboundTab";
            this.tcOutboundTab.SelectedIndex = 0;
            this.tcOutboundTab.Size = new System.Drawing.Size(444, 599);
            this.tcOutboundTab.TabIndex = 0;
            // 
            // tpGeneral
            // 
            this.tpGeneral.Controls.Add(this.tableLayoutPanel1);
            this.tpGeneral.Location = new System.Drawing.Point(4, 22);
            this.tpGeneral.Name = "tpGeneral";
            this.tpGeneral.Padding = new System.Windows.Forms.Padding(3);
            this.tpGeneral.Size = new System.Drawing.Size(436, 573);
            this.tpGeneral.TabIndex = 0;
            this.tpGeneral.Text = "General";
            this.tpGeneral.UseVisualStyleBackColor = true;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Controls.Add(this.tlpOutputFile, 0, 10);
            this.tableLayoutPanel1.Controls.Add(this.btnDataElement, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.lblOutput, 0, 9);
            this.tableLayoutPanel1.Controls.Add(this.txtSegmentNumber, 1, 6);
            this.tableLayoutPanel1.Controls.Add(this.txtNote, 0, 8);
            this.tableLayoutPanel1.Controls.Add(this.lblNote, 0, 7);
            this.tableLayoutPanel1.Controls.Add(this.lblSegment, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.lblSegmentNumber, 1, 5);
            this.tableLayoutPanel1.Controls.Add(this.lblPosition, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.cboSegment, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.txtPosition, 1, 2);
            this.tableLayoutPanel1.Controls.Add(this.lblValue, 0, 3);
            this.tableLayoutPanel1.Controls.Add(this.lblXMLField, 1, 3);
            this.tableLayoutPanel1.Controls.Add(this.txtValue, 0, 4);
            this.tableLayoutPanel1.Controls.Add(this.txtXMLField, 1, 4);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(3, 3);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 11;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.Size = new System.Drawing.Size(430, 567);
            this.tableLayoutPanel1.TabIndex = 54;
            // 
            // tlpOutputFile
            // 
            this.tlpOutputFile.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tlpOutputFile.ColumnCount = 2;
            this.tableLayoutPanel1.SetColumnSpan(this.tlpOutputFile, 2);
            this.tlpOutputFile.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 73.48887F));
            this.tlpOutputFile.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 26.51114F));
            this.tlpOutputFile.Controls.Add(this.txtOutput, 0, 0);
            this.tlpOutputFile.Controls.Add(this.btnSelectFolder, 1, 0);
            this.tlpOutputFile.Location = new System.Drawing.Point(3, 292);
            this.tlpOutputFile.Name = "tlpOutputFile";
            this.tlpOutputFile.RowCount = 1;
            this.tlpOutputFile.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpOutputFile.Size = new System.Drawing.Size(424, 53);
            this.tlpOutputFile.TabIndex = 52;
            // 
            // btnSelectFolder
            // 
            this.btnSelectFolder.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnSelectFolder.Location = new System.Drawing.Point(330, 3);
            this.btnSelectFolder.Name = "btnSelectFolder";
            this.btnSelectFolder.Size = new System.Drawing.Size(91, 34);
            this.btnSelectFolder.TabIndex = 1;
            this.btnSelectFolder.Text = "Select Folder";
            this.btnSelectFolder.UseVisualStyleBackColor = true;
            this.btnSelectFolder.Click += new System.EventHandler(this.btnSelectFolder_Click);
            // 
            // btnDataElement
            // 
            this.btnDataElement.Location = new System.Drawing.Point(3, 3);
            this.btnDataElement.Name = "btnDataElement";
            this.btnDataElement.Size = new System.Drawing.Size(91, 34);
            this.btnDataElement.TabIndex = 0;
            this.btnDataElement.Text = "Data Element";
            this.btnDataElement.UseVisualStyleBackColor = true;
            this.btnDataElement.Click += new System.EventHandler(this.btnDataElement_Click);
            // 
            // txtSegmentNumber
            // 
            this.txtSegmentNumber.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.txtSegmentNumber.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.bdsOutboundMapping, "SegmentNumber", true));
            this.txtSegmentNumber.Location = new System.Drawing.Point(218, 135);
            this.txtSegmentNumber.Name = "txtSegmentNumber";
            this.txtSegmentNumber.Size = new System.Drawing.Size(209, 20);
            this.txtSegmentNumber.TabIndex = 10;
            // 
            // lblSegmentNumber
            // 
            this.lblSegmentNumber.AutoSize = true;
            this.lblSegmentNumber.Location = new System.Drawing.Point(218, 119);
            this.lblSegmentNumber.Name = "lblSegmentNumber";
            this.lblSegmentNumber.Size = new System.Drawing.Size(92, 13);
            this.lblSegmentNumber.TabIndex = 9;
            this.lblSegmentNumber.Text = "Segment Number:";
            // 
            // tpOperator
            // 
            this.tpOperator.Controls.Add(this.dgvOperator);
            this.tpOperator.Location = new System.Drawing.Point(4, 22);
            this.tpOperator.Name = "tpOperator";
            this.tpOperator.Padding = new System.Windows.Forms.Padding(3);
            this.tpOperator.Size = new System.Drawing.Size(436, 573);
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
            this.colDeleteOperator,
            this.colOperatorNo_FK,
            this.colOperatorParameter});
            this.dgvOperator.DataSource = this.bdsOperatorOutboundMapping;
            this.dgvOperator.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.dgvOperator.Location = new System.Drawing.Point(7, 7);
            this.dgvOperator.Name = "dgvOperator";
            this.dgvOperator.Size = new System.Drawing.Size(423, 560);
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
            // colDeleteOperator
            // 
            this.colDeleteOperator.HeaderText = "";
            this.colDeleteOperator.Name = "colDeleteOperator";
            this.colDeleteOperator.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colDeleteOperator.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.colDeleteOperator.Text = "";
            this.colDeleteOperator.UseColumnTextForButtonValue = true;
            this.colDeleteOperator.Width = 21;
            // 
            // colOperatorNo_FK
            // 
            this.colOperatorNo_FK.DataPropertyName = "OperatorNo_FK";
            this.colOperatorNo_FK.DataSource = this.bdsOperator;
            this.colOperatorNo_FK.DisplayMember = "OperatorName";
            this.colOperatorNo_FK.HeaderText = "Operator Name";
            this.colOperatorNo_FK.Name = "colOperatorNo_FK";
            this.colOperatorNo_FK.ValueMember = "OperatorNo";
            this.colOperatorNo_FK.Width = 77;
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
            this.colOperatorParameter.Width = 114;
            // 
            // bdsOperatorOutboundMapping
            // 
            this.bdsOperatorOutboundMapping.DataMember = "tblOperatorOutboundMappings";
            this.bdsOperatorOutboundMapping.DataSource = this.bdsOutboundMapping;
            this.bdsOperatorOutboundMapping.Filter = "";
            this.bdsOperatorOutboundMapping.AddingNew += new System.ComponentModel.AddingNewEventHandler(this.bdsOperatorOutboundMapping_AddingNew);
            // 
            // btnPrint
            // 
            this.btnPrint.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnPrint.Location = new System.Drawing.Point(619, 614);
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
            this.btnCopyFromList.Location = new System.Drawing.Point(377, 657);
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
            this.btnExport.Location = new System.Drawing.Point(522, 654);
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
            this.btnImport.Location = new System.Drawing.Point(619, 654);
            this.btnImport.Name = "btnImport";
            this.btnImport.Size = new System.Drawing.Size(91, 34);
            this.btnImport.TabIndex = 14;
            this.btnImport.Text = "Import";
            this.btnImport.UseVisualStyleBackColor = true;
            this.btnImport.Click += new System.EventHandler(this.btnImport_Click);
            // 
            // rbtView
            // 
            this.rbtView.Controls.Add(this.rbtViewTable);
            this.rbtView.Controls.Add(this.rbtViewSegment);
            this.rbtView.Controls.Add(this.rbtViewEntry);
            this.rbtView.Location = new System.Drawing.Point(104, 612);
            this.rbtView.Name = "rbtView";
            this.rbtView.Size = new System.Drawing.Size(364, 39);
            this.rbtView.TabIndex = 16;
            this.rbtView.TabStop = false;
            // 
            // rbtViewTable
            // 
            this.rbtViewTable.AutoSize = true;
            this.rbtViewTable.Location = new System.Drawing.Point(179, 10);
            this.rbtViewTable.Name = "rbtViewTable";
            this.rbtViewTable.Size = new System.Drawing.Size(107, 17);
            this.rbtViewTable.TabIndex = 2;
            this.rbtViewTable.TabStop = true;
            this.rbtViewTable.Text = "Segment Number";
            this.rbtViewTable.UseVisualStyleBackColor = true;
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
            // btnView
            // 
            this.btnView.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnView.Location = new System.Drawing.Point(13, 617);
            this.btnView.Name = "btnView";
            this.btnView.Size = new System.Drawing.Size(91, 34);
            this.btnView.TabIndex = 15;
            this.btnView.Text = "View";
            this.btnView.UseVisualStyleBackColor = true;
            this.btnView.Click += new System.EventHandler(this.btnView_Click);
            // 
            // frmOutboundMapDesign
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
            this.Controls.Add(this.tcOutboundTab);
            this.Controls.Add(this.dgvOutput);
            this.Controls.Add(this.btnExit);
            this.Controls.Add(this.btnSave);
            this.Controls.Add(this.btnDelete);
            this.Controls.Add(this.btnEdit);
            this.Controls.Add(this.btnEDIView);
            this.Controls.Add(this.btnCopy);
            this.Controls.Add(this.btnNew);
            this.Controls.Add(this.btnNext);
            this.Controls.Add(this.btnPrevious);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MinimumSize = new System.Drawing.Size(1025, 741);
            this.Name = "frmOutboundMapDesign";
            this.Text = "Outbound Map Design";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmOutboundMapDesign_FormClosing);
            this.Load += new System.EventHandler(this.frmOutboundMapDesign_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvOutput)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsEDISegment)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsOutboundMapping)).EndInit();
            this.tcOutboundTab.ResumeLayout(false);
            this.tpGeneral.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.tlpOutputFile.ResumeLayout(false);
            this.tlpOutputFile.PerformLayout();
            this.tpOperator.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvOperator)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsOperator)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsOperatorOutboundMapping)).EndInit();
            this.rbtView.ResumeLayout(false);
            this.rbtView.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnPrevious;
        private System.Windows.Forms.Button btnNext;
        private System.Windows.Forms.Button btnNew;
        private System.Windows.Forms.Button btnCopy;
        private System.Windows.Forms.Button btnEDIView;
        private System.Windows.Forms.Button btnEdit;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.DataGridView dgvOutput;
        private System.Windows.Forms.Label lblOutput;
        private System.Windows.Forms.Label lblNote;
        private System.Windows.Forms.Label lblXMLField;
        private System.Windows.Forms.Label lblValue;
        private System.Windows.Forms.Label lblPosition;
        private System.Windows.Forms.TextBox txtValue;
        private System.Windows.Forms.Label lblSegment;
        private System.Windows.Forms.TextBox txtOutput;
        private System.Windows.Forms.TextBox txtNote;
        private System.Windows.Forms.TextBox txtXMLField;
        private System.Windows.Forms.TextBox txtPosition;
        private System.Windows.Forms.ComboBox cboSegment;
        private System.Windows.Forms.BindingSource bdsOutboundMapping;
        private System.Windows.Forms.DataGridViewComboBoxColumn operatorNoFKDataGridViewTextBoxColumn;
        private System.Windows.Forms.TabControl tcOutboundTab;
        private System.Windows.Forms.TabPage tpGeneral;
        private System.Windows.Forms.TabPage tpOperator;
        private System.Windows.Forms.DataGridView dgvOperator;
        private System.Windows.Forms.Button btnDataElement;
        private System.Windows.Forms.BindingSource bdsOperatorOutboundMapping;
        private System.Windows.Forms.BindingSource bdsEDISegment;
        private System.Windows.Forms.BindingSource bdsOperator;
        private System.Windows.Forms.TextBox txtSegmentNumber;
        private System.Windows.Forms.Label lblSegmentNumber;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.TableLayoutPanel tlpOutputFile;
        private System.Windows.Forms.Button btnSelectFolder;
        private System.Windows.Forms.Button btnPrint;
        private System.Windows.Forms.Button btnCopyFromList;
        private System.Windows.Forms.DataGridViewTextBoxColumn colOutboundMappingNo;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTradingPartnerNoFK;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTransactionSetNoFK;
        private System.Windows.Forms.DataGridViewComboBoxColumn colSegmentNoFK;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPostion;
        private System.Windows.Forms.DataGridViewTextBoxColumn colValue;
        private System.Windows.Forms.DataGridViewTextBoxColumn colXMLPathField;
        private System.Windows.Forms.DataGridViewTextBoxColumn colSegmentNumber;
        private System.Windows.Forms.DataGridViewTextBoxColumn colOperatorMappingNo;
        private System.Windows.Forms.DataGridViewButtonColumn colDeleteOperator;
        private System.Windows.Forms.DataGridViewComboBoxColumn colOperatorNo_FK;
        private System.Windows.Forms.DataGridViewTextBoxColumn colOperatorParameter;
        private System.Windows.Forms.Button btnExport;
        private System.Windows.Forms.Button btnImport;
        private System.Windows.Forms.GroupBox rbtView;
        private System.Windows.Forms.RadioButton rbtViewTable;
        private System.Windows.Forms.RadioButton rbtViewSegment;
        private System.Windows.Forms.RadioButton rbtViewEntry;
        private System.Windows.Forms.Button btnView;
    }
}