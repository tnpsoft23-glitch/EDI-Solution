namespace BHEDI
{
    partial class frmSetupOutbound
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmSetupOutbound));
            this.lblFileList = new System.Windows.Forms.Label();
            this.btnRemove = new System.Windows.Forms.Button();
            this.btnCopy = new System.Windows.Forms.Button();
            this.btnSaveModify = new System.Windows.Forms.Button();
            this.btnNew = new System.Windows.Forms.Button();
            this.dgvOutboundSetting = new System.Windows.Forms.DataGridView();
            this.colSettingNo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colSettingName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colPath = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colUpload = new System.Windows.Forms.DataGridViewButtonColumn();
            this.bdsOutboundSetting = new System.Windows.Forms.BindingSource(this.components);
            this.chkArchive = new System.Windows.Forms.CheckBox();
            this.chkDelete = new System.Windows.Forms.CheckBox();
            this.chkCreate = new System.Windows.Forms.CheckBox();
            this.gbFileDefinition = new System.Windows.Forms.GroupBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvOutboundSetting)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsOutboundSetting)).BeginInit();
            this.gbFileDefinition.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblFileList
            // 
            this.lblFileList.AutoSize = true;
            this.lblFileList.Location = new System.Drawing.Point(12, 19);
            this.lblFileList.Name = "lblFileList";
            this.lblFileList.Size = new System.Drawing.Size(95, 13);
            this.lblFileList.TabIndex = 0;
            this.lblFileList.Text = "Outbound File List:";
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
            // dgvOutboundSetting
            // 
            this.dgvOutboundSetting.AllowUserToAddRows = false;
            this.dgvOutboundSetting.AllowUserToDeleteRows = false;
            this.dgvOutboundSetting.AutoGenerateColumns = false;
            this.dgvOutboundSetting.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvOutboundSetting.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colSettingNo,
            this.colSettingName,
            this.colPath,
            this.colUpload});
            this.dgvOutboundSetting.DataSource = this.bdsOutboundSetting;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.LightGray;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvOutboundSetting.DefaultCellStyle = dataGridViewCellStyle1;
            this.dgvOutboundSetting.Location = new System.Drawing.Point(16, 36);
            this.dgvOutboundSetting.Name = "dgvOutboundSetting";
            this.dgvOutboundSetting.Size = new System.Drawing.Size(468, 256);
            this.dgvOutboundSetting.TabIndex = 1;
            this.dgvOutboundSetting.CellBeginEdit += new System.Windows.Forms.DataGridViewCellCancelEventHandler(this.dgvOutboundSetting_CellBeginEdit);
            this.dgvOutboundSetting.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvOutboundSetting_CellContentClick);
            // 
            // colSettingNo
            // 
            this.colSettingNo.DataPropertyName = "SettingNo";
            this.colSettingNo.HeaderText = "SettingNo";
            this.colSettingNo.Name = "colSettingNo";
            this.colSettingNo.Visible = false;
            // 
            // colSettingName
            // 
            this.colSettingName.DataPropertyName = "SettingName";
            this.colSettingName.HeaderText = "Setting";
            this.colSettingName.Name = "colSettingName";
            // 
            // colPath
            // 
            this.colPath.DataPropertyName = "Path";
            this.colPath.HeaderText = "Path";
            this.colPath.Name = "colPath";
            this.colPath.Width = 200;
            // 
            // colUpload
            // 
            this.colUpload.HeaderText = "";
            this.colUpload.Name = "colUpload";
            this.colUpload.Text = "Select Folder";
            this.colUpload.UseColumnTextForButtonValue = true;
            this.colUpload.Width = 75;
            // 
            // bdsOutboundSetting
            // 
            this.bdsOutboundSetting.DataSource = typeof(BHEDI.tblInboundOutboundSetting);
            this.bdsOutboundSetting.AddingNew += new System.ComponentModel.AddingNewEventHandler(this.bdsOutboundSetting_AddingNew);
            // 
            // chkArchive
            // 
            this.chkArchive.AutoSize = true;
            this.chkArchive.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.bdsOutboundSetting, "IsArchive", true));
            this.chkArchive.Location = new System.Drawing.Point(16, 25);
            this.chkArchive.Name = "chkArchive";
            this.chkArchive.Size = new System.Drawing.Size(155, 17);
            this.chkArchive.TabIndex = 0;
            this.chkArchive.Text = "Archive any processed files";
            this.chkArchive.UseVisualStyleBackColor = true;
            // 
            // chkDelete
            // 
            this.chkDelete.AutoSize = true;
            this.chkDelete.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.bdsOutboundSetting, "IsDelete", true));
            this.chkDelete.Location = new System.Drawing.Point(16, 50);
            this.chkDelete.Name = "chkDelete";
            this.chkDelete.Size = new System.Drawing.Size(150, 17);
            this.chkDelete.TabIndex = 1;
            this.chkDelete.Text = "Delete any processed files";
            this.chkDelete.UseVisualStyleBackColor = true;
            // 
            // chkCreate
            // 
            this.chkCreate.AutoSize = true;
            this.chkCreate.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.bdsOutboundSetting, "IsCreate", true));
            this.chkCreate.Location = new System.Drawing.Point(16, 75);
            this.chkCreate.Name = "chkCreate";
            this.chkCreate.Size = new System.Drawing.Size(237, 17);
            this.chkCreate.TabIndex = 2;
            this.chkCreate.Text = "Create a default map if a map is not specified";
            this.chkCreate.UseVisualStyleBackColor = true;
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
            // frmSetupOutbound
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(595, 452);
            this.Controls.Add(this.gbFileDefinition);
            this.Controls.Add(this.dgvOutboundSetting);
            this.Controls.Add(this.btnRemove);
            this.Controls.Add(this.btnCopy);
            this.Controls.Add(this.btnSaveModify);
            this.Controls.Add(this.btnNew);
            this.Controls.Add(this.lblFileList);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmSetupOutbound";
            this.Text = "Outbound Setup";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmSetupOutbound_FormClosing);
            this.Load += new System.EventHandler(this.frmSetupOutbound_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvOutboundSetting)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsOutboundSetting)).EndInit();
            this.gbFileDefinition.ResumeLayout(false);
            this.gbFileDefinition.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblFileList;
        private System.Windows.Forms.Button btnRemove;
        private System.Windows.Forms.Button btnCopy;
        private System.Windows.Forms.Button btnSaveModify;
        private System.Windows.Forms.Button btnNew;
        private System.Windows.Forms.DataGridView dgvOutboundSetting;
        private System.Windows.Forms.BindingSource bdsOutboundSetting;
        private System.Windows.Forms.CheckBox chkArchive;
        private System.Windows.Forms.CheckBox chkDelete;
        private System.Windows.Forms.CheckBox chkCreate;
        private System.Windows.Forms.GroupBox gbFileDefinition;
        private System.Windows.Forms.DataGridViewTextBoxColumn colSettingNo;
        private System.Windows.Forms.DataGridViewTextBoxColumn colSettingName;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPath;
        private System.Windows.Forms.DataGridViewButtonColumn colUpload;
    }
}