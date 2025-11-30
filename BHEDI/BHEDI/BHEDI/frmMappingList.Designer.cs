namespace BHEDI
{
    partial class frmMappingList
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMappingList));
            this.dgvTransactionSetList = new System.Windows.Forms.DataGridView();
            this.colTradingPartnerNo = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.bdsTradingPartner = new System.Windows.Forms.BindingSource(this.components);
            this.colTransactionSet = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.bdsTransactionSet = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dgvTransactionSetList)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTradingPartner)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTransactionSet)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvTransactionSetList
            // 
            this.dgvTransactionSetList.AllowUserToAddRows = false;
            this.dgvTransactionSetList.AllowUserToDeleteRows = false;
            this.dgvTransactionSetList.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvTransactionSetList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvTransactionSetList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colTradingPartnerNo,
            this.colTransactionSet});
            this.dgvTransactionSetList.Location = new System.Drawing.Point(9, 9);
            this.dgvTransactionSetList.MultiSelect = false;
            this.dgvTransactionSetList.Name = "dgvTransactionSetList";
            this.dgvTransactionSetList.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvTransactionSetList.Size = new System.Drawing.Size(388, 488);
            this.dgvTransactionSetList.TabIndex = 0;
            this.dgvTransactionSetList.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvTransactionSetList_CellDoubleClick);
            this.dgvTransactionSetList.DataBindingComplete += new System.Windows.Forms.DataGridViewBindingCompleteEventHandler(this.dgvTransactionSetList_DataBindingComplete);
            this.dgvTransactionSetList.DataError += new System.Windows.Forms.DataGridViewDataErrorEventHandler(this.dgvTransactionSetList_DataError);
            // 
            // colTradingPartnerNo
            // 
            this.colTradingPartnerNo.DataSource = this.bdsTradingPartner;
            this.colTradingPartnerNo.DisplayMember = "TradingPartnerName";
            this.colTradingPartnerNo.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.colTradingPartnerNo.HeaderText = "Trading Partner";
            this.colTradingPartnerNo.Name = "colTradingPartnerNo";
            this.colTradingPartnerNo.ValueMember = "TradingPartnerNo";
            this.colTradingPartnerNo.Width = 150;
            // 
            // bdsTradingPartner
            // 
            this.bdsTradingPartner.DataSource = typeof(BHEDI.tblTradingPartner);
            // 
            // colTransactionSet
            // 
            this.colTransactionSet.DataSource = this.bdsTransactionSet;
            this.colTransactionSet.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.colTransactionSet.HeaderText = "Transaction Set";
            this.colTransactionSet.Name = "colTransactionSet";
            this.colTransactionSet.ValueMember = "TransactionSetNo";
            this.colTransactionSet.Width = 150;
            // 
            // bdsTransactionSet
            // 
            this.bdsTransactionSet.DataSource = typeof(BHEDI.tblEDITransactionSet);
            // 
            // frmMappingList
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(407, 506);
            this.Controls.Add(this.dgvTransactionSetList);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmMappingList";
            this.Text = "Transaction Set List";
            this.Load += new System.EventHandler(this.frmMappingList_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvTransactionSetList)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTradingPartner)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdsTransactionSet)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvTransactionSetList;
        private System.Windows.Forms.BindingSource bdsTradingPartner;
        private System.Windows.Forms.BindingSource bdsTransactionSet;
        private System.Windows.Forms.DataGridViewComboBoxColumn colTradingPartnerNo;
        private System.Windows.Forms.DataGridViewComboBoxColumn colTransactionSet;
    }
}