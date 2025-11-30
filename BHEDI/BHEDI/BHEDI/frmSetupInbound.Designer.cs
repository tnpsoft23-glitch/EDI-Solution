namespace BHEDI
{
    partial class frmSetupInbound
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmSetupInbound));
            this.lblFileList = new System.Windows.Forms.Label();
            this.btnNew = new System.Windows.Forms.Button();
            this.btnSaveModify = new System.Windows.Forms.Button();
            this.btnCopy = new System.Windows.Forms.Button();
            this.btnRemove = new System.Windows.Forms.Button();
            this.bdsInboundSetting = new System.Windows.Forms.BindingSource(this.components);
            this.dgvInboundSetting = new System.Windows.Forms.DataGridView();
            this.settingNoDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colSettingName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colPath = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colUpload = new System.Windows.Forms.DataGridViewButtonColumn();
            this.gbFileDefinition = new System.Windows.Forms.GroupBox();
            this.chkArchive = new System.Windows.Forms.CheckBox();
            this.chkCreate = new System.Windows.Forms.CheckBox();
            this.chkDelete = new System.Windows.Forms.CheckBox();
            ((System.ComponentModel.ISupportInitialize)(this.bdsInboundSetting)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvInboundSetting)).BeginInit();
            this.gbFileDefinition.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblFileList
            // 
            this.lblFileList.AutoSize = true;
            this.lblFileList.Location = new System.Drawing.Point(12, 19);
            this.lblFileList.Name = "lblFileList";
            this.lblFileList.Size = new System.Drawing.Size(87, 13);
            this.lblFileList.TabIndex = 0;
            this.lblFileList.Text = "Inbound File List:";
            // 
            // btnNew
            // 
            this.btnNew.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnNew.Location = new System.Drawing.Point(492, 35);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(91, 34);
            this.btnNew.TabIndex = 2;
            this.btnNew.Text = "New";
            this.btnNew.UseVisualStyleBackColor = true;
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // btnSaveModify
            // 
            this.btnSaveModify.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnSaveModify.Location = new System.Drawing.Point(492, 75);
            this.btnSaveModify.Name = "btnSaveModify";
            this.btnSaveModify.Size = new System.Drawing.Size(91, 34);
            this.btnSaveModify.TabIndex = 3;
            this.btnSaveModify.Text = "Edit";
            this.btnSaveModify.UseVisualStyleBackColor = true;
            this.btnSaveModify.Click += new System.EventHandler(this.btnSaveModify_Click);
            // 
            // btnCopy
            // 
            this.btnCopy.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnCopy.Location = new System.Drawing.Point(492, 115);
            this.btnCopy.Name = "btnCopy";
            this.btnCopy.Size = new System.Drawing.Size(91, 34);
            this.btnCopy.TabIndex = 4;
            this.btnCopy.Text = "Copy";
            this.btnCopy.UseVisualStyleBackColor = true;
            this.btnCopy.Click += new System.EventHandler(this.btnCopy_Click);
            // 
            // btnRemove
            // 
            this.btnRemove.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnRemove.Location = new System.Drawing.Point(492, 155);
            this.btnRemove.Name = "btnRemove";
            this.btnRemove.Size = new System.Drawing.Size(91, 34);
            this.btnRemove.TabIndex = 5;
            this.btnRemove.Text = "Delete";
            this.btnRemove.UseVisualStyleBackColor = true;
            this.btnRemove.Click += new System.EventHandler(this.btnRemove_Click);
            // 
            // bdsInboundSetting
            // 
            this.bdsInboundSetting.DataSource = typeof(BHEDI.tblInboundOutboundSetting);
            this.bdsInboundSetting.AddingNew += new System.ComponentModel.AddingNewEventHandler(this.bdsInboundSetting_AddingNew);
            // 
            // dgvInboundSetting
            // 
            this.dgvInboundSetting.AllowUserToAddRows = false;
            this.dgvInboundSetting.AllowUserToDeleteRows = false;
            this.dgvInboundSetting.AutoGenerateColumns = false;
            this.dgvInboundSetting.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvInboundSetting.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.settingNoDataGridViewTextBoxColumn,
            this.colSettingName,
            this.colPath,
            this.colUpload});
            this.dgvInboundSetting.DataSource = this.bdsInboundSetting;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.LightGray;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvInboundSetting.DefaultCellStyle = dataGridViewCellStyle1;
            this.dgvInboundSetting.Location = new System.Drawing.Point(16, 36);
            this.dgvInboundSetting.Name = "dgvInboundSetting";
            this.dgvInboundSetting.ReadOnly = true;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.LightGray;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvInboundSetting.RowHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvInboundSetting.Size = new System.Drawing.Size(468, 256);
            this.dgvInboundSetting.TabIndex = 1;
            this.dgvInboundSetting.CellBeginEdit += new System.Windows.Forms.DataGridViewCellCancelEventHandler(this.dgvInboundSetting_CellBeginEdit);
            this.dgvInboundSetting.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvInboundSetting_CellContentClick);
            // 
            // settingNoDataGridViewTextBoxColumn
            // 
            this.settingNoDataGridViewTextBoxColumn.DataPropertyName = "SettingNo";
            this.settingNoDataGridViewTextBoxColumn.HeaderText = "SettingNo";
            this.settingNoDataGridViewTextBoxColumn.Name = "settingNoDataGridViewTextBoxColumn";
            this.settingNoDataGridViewTextBoxColumn.ReadOnly = true;
            this.settingNoDataGridViewTextBoxColumn.Visible = false;
            // 
            // colSettingName
            // 
            this.colSettingName.DataPropertyName = "SettingName";
            this.colSettingName.HeaderText = "Setting";
            this.colSettingName.Name = "colSettingName";
            this.colSettingName.ReadOnly = true;
            // 
            // colPath
            // 
            this.colPath.DataPropertyName = "Path";
            this.colPath.HeaderText = "Path";
            this.colPath.Name = "colPath";
            this.colPath.ReadOnly = true;
            this.colPath.Width = 200;
            // 
            // colUpload
            // 
            this.colUpload.HeaderText = "";
            this.colUpload.Name = "colUpload";
            this.colUpload.ReadOnly = true;
            this.colUpload.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colUpload.Text = "Select Folder";
            this.colUpload.UseColumnTextForButtonValue = true;
            this.colUpload.Width = 75;
            // 
            // gbFileDefinition
            // 
            this.gbFileDefinition.Controls.Add(this.chkArchive);
            this.gbFileDefinition.Controls.Add(this.chkCreate);
            this.gbFileDefinition.Controls.Add(this.chkDelete);
            this.gbFileDefinition.Location = new System.Drawing.Point(16, 298);
            this.gbFileDefinition.Name = "gbFileDefinition";
            this.gbFileDefinition.Size = new System.Drawing.Size(468, 103);
            this.gbFileDefinition.TabIndex = 6;
            this.gbFileDefinition.TabStop = false;
            this.gbFileDefinition.Text = "Select the properties for file definition:";
            // 
            // chkArchive
            // 
            this.chkArchive.AutoSize = true;
            this.chkArchive.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.bdsInboundSetting, "IsArchive", true));
            this.chkArchive.Location = new System.Drawing.Point(16, 25);
            this.chkArchive.Name = "chkArchive";
            this.chkArchive.Size = new System.Drawing.Size(155, 17);
            this.chkArchive.TabIndex = 0;
            this.chkArchive.Text = "Archive any processed files";
            this.chkArchive.UseVisualStyleBackColor = true;
            // 
            // chkCreate
            // 
            this.chkCreate.AutoSize = true;
            this.chkCreate.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.bdsInboundSetting, "IsCreate", true));
            this.chkCreate.Location = new System.Drawing.Point(16, 75);
            this.chkCreate.Name = "chkCreate";
            this.chkCreate.Size = new System.Drawing.Size(237, 17);
            this.chkCreate.TabIndex = 2;
            this.chkCreate.Text = "Create a default map if a map is not specified";
            this.chkCreate.UseVisualStyleBackColor = true;
            // 
            // chkDelete
            // 
            this.chkDelete.AutoSize = true;
            this.chkDelete.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.bdsInboundSetting, "IsDelete", true));
            this.chkDelete.Location = new System.Drawing.Point(16, 50);
            this.chkDelete.Name = "chkDelete";
            this.chkDelete.Size = new System.Drawing.Size(150, 17);
            this.chkDelete.TabIndex = 1;
            this.chkDelete.Text = "Delete any processed files";
            this.chkDelete.UseVisualStyleBackColor = true;
            // 
            // frmSetupInbound
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(595, 452);
            this.Controls.Add(this.gbFileDefinition);
            this.Controls.Add(this.dgvInboundSetting);
            this.Controls.Add(this.btnRemove);
            this.Controls.Add(this.btnCopy);
            this.Controls.Add(this.btnSaveModify);
            this.Controls.Add(this.btnNew);
            this.Controls.Add(this.lblFileList);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmSetupInbound";
            this.Text = "Inbound Setup";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmSetupInbound_FormClosing);
            this.Load += new System.EventHandler(this.frmSetupInbound_Load);
            ((System.ComponentModel.ISupportInitialize)(this.bdsInboundSetting)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvInboundSetting)).EndInit();
            this.gbFileDefinition.ResumeLayout(false);
            this.gbFileDefinition.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblFileList;
        private System.Windows.Forms.Button btnNew;
        private System.Windows.Forms.Button btnSaveModify;
        private System.Windows.Forms.Button btnCopy;
        private System.Windows.Forms.Button btnRemove;
        private System.Windows.Forms.BindingSource bdsInboundSetting;
        private System.Windows.Forms.DataGridView dgvInboundSetting;
        private System.Windows.Forms.GroupBox gbFileDefinition;
        private System.Windows.Forms.CheckBox chkArchive;
        private System.Windows.Forms.CheckBox chkCreate;
        private System.Windows.Forms.CheckBox chkDelete;
        private System.Windows.Forms.DataGridViewTextBoxColumn settingNoDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn colSettingName;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPath;
        private System.Windows.Forms.DataGridViewButtonColumn colUpload;
    }
}