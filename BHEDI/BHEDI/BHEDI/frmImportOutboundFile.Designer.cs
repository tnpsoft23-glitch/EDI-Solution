namespace BHEDI
{
    partial class frmImportOutboundFile
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmImportOutboundFile));
            this.btnRefresh = new System.Windows.Forms.Button();
            this.btnImport = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.dgvFile = new System.Windows.Forms.DataGridView();
            this.chkCol1 = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.txtCol2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.txtCol3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.txtCol4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.txtCol5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.txtCol6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.txtCol7 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colIsDelete = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.colIsArchive = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.colIsCreate = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dgvFile)).BeginInit();
            this.SuspendLayout();
            // 
            // btnRefresh
            // 
            this.btnRefresh.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnRefresh.Location = new System.Drawing.Point(819, 530);
            this.btnRefresh.Name = "btnRefresh";
            this.btnRefresh.Size = new System.Drawing.Size(91, 34);
            this.btnRefresh.TabIndex = 4;
            this.btnRefresh.Text = "Refresh";
            this.btnRefresh.UseVisualStyleBackColor = true;
            this.btnRefresh.Click += new System.EventHandler(this.btnRefresh_Click);
            // 
            // btnImport
            // 
            this.btnImport.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnImport.Location = new System.Drawing.Point(925, 530);
            this.btnImport.Name = "btnImport";
            this.btnImport.Size = new System.Drawing.Size(91, 34);
            this.btnImport.TabIndex = 5;
            this.btnImport.Text = "Import";
            this.btnImport.UseVisualStyleBackColor = true;
            this.btnImport.Click += new System.EventHandler(this.btnImport_Click);
            // 
            // btnExit
            // 
            this.btnExit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnExit.Location = new System.Drawing.Point(1031, 530);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(91, 34);
            this.btnExit.TabIndex = 6;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // dgvFile
            // 
            this.dgvFile.AllowUserToAddRows = false;
            this.dgvFile.AllowUserToDeleteRows = false;
            this.dgvFile.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvFile.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvFile.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.chkCol1,
            this.txtCol2,
            this.txtCol3,
            this.txtCol4,
            this.txtCol5,
            this.txtCol6,
            this.txtCol7,
            this.colIsDelete,
            this.colIsArchive,
            this.colIsCreate});
            this.dgvFile.Location = new System.Drawing.Point(12, 12);
            this.dgvFile.Name = "dgvFile";
            this.dgvFile.Size = new System.Drawing.Size(1116, 510);
            this.dgvFile.TabIndex = 7;
            // 
            // chkCol1
            // 
            this.chkCol1.HeaderText = "";
            this.chkCol1.Name = "chkCol1";
            this.chkCol1.Width = 30;
            // 
            // txtCol2
            // 
            this.txtCol2.HeaderText = "File Name";
            this.txtCol2.Name = "txtCol2";
            this.txtCol2.ReadOnly = true;
            this.txtCol2.Width = 250;
            // 
            // txtCol3
            // 
            this.txtCol3.HeaderText = "Transaction Set";
            this.txtCol3.Name = "txtCol3";
            this.txtCol3.ReadOnly = true;
            this.txtCol3.Width = 70;
            // 
            // txtCol4
            // 
            this.txtCol4.HeaderText = "ISA Sender Qualifier Code";
            this.txtCol4.Name = "txtCol4";
            this.txtCol4.ReadOnly = true;
            // 
            // txtCol5
            // 
            this.txtCol5.HeaderText = "ISA Sender ID";
            this.txtCol5.Name = "txtCol5";
            this.txtCol5.ReadOnly = true;
            // 
            // txtCol6
            // 
            this.txtCol6.HeaderText = "ISA Receiver Qualifier Code";
            this.txtCol6.Name = "txtCol6";
            this.txtCol6.ReadOnly = true;
            // 
            // txtCol7
            // 
            this.txtCol7.HeaderText = "ISA Receiver ID";
            this.txtCol7.Name = "txtCol7";
            this.txtCol7.ReadOnly = true;
            // 
            // colIsDelete
            // 
            this.colIsDelete.HeaderText = "Delete After Import";
            this.colIsDelete.Name = "colIsDelete";
            // 
            // colIsArchive
            // 
            this.colIsArchive.HeaderText = "Archive After Import";
            this.colIsArchive.Name = "colIsArchive";
            // 
            // colIsCreate
            // 
            this.colIsCreate.HeaderText = "Create Map";
            this.colIsCreate.Name = "colIsCreate";
            // 
            // frmImportOutboundFile
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1140, 576);
            this.Controls.Add(this.dgvFile);
            this.Controls.Add(this.btnRefresh);
            this.Controls.Add(this.btnImport);
            this.Controls.Add(this.btnExit);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmImportOutboundFile";
            this.Text = "Import Outbound XML Files";
            this.Load += new System.EventHandler(this.frmImportOutboundFile_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvFile)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnRefresh;
        private System.Windows.Forms.Button btnImport;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.DataGridView dgvFile;
        private System.Windows.Forms.DataGridViewCheckBoxColumn chkCol1;
        private System.Windows.Forms.DataGridViewTextBoxColumn txtCol2;
        private System.Windows.Forms.DataGridViewTextBoxColumn txtCol3;
        private System.Windows.Forms.DataGridViewTextBoxColumn txtCol4;
        private System.Windows.Forms.DataGridViewTextBoxColumn txtCol5;
        private System.Windows.Forms.DataGridViewTextBoxColumn txtCol6;
        private System.Windows.Forms.DataGridViewTextBoxColumn txtCol7;
        private System.Windows.Forms.DataGridViewCheckBoxColumn colIsDelete;
        private System.Windows.Forms.DataGridViewCheckBoxColumn colIsArchive;
        private System.Windows.Forms.DataGridViewCheckBoxColumn colIsCreate;
    }
}