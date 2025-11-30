namespace BHEDI
{
    partial class frmEDITransactionSet
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmEDITransactionSet));
            this.lbEDITransactionSet = new System.Windows.Forms.ListBox();
            this.bdsEDITransactionSet = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.bdsEDITransactionSet)).BeginInit();
            this.SuspendLayout();
            // 
            // lbEDITransactionSet
            // 
            this.lbEDITransactionSet.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lbEDITransactionSet.DataSource = this.bdsEDITransactionSet;
            this.lbEDITransactionSet.FormattingEnabled = true;
            this.lbEDITransactionSet.Location = new System.Drawing.Point(7, 5);
            this.lbEDITransactionSet.Name = "lbEDITransactionSet";
            this.lbEDITransactionSet.Size = new System.Drawing.Size(334, 472);
            this.lbEDITransactionSet.TabIndex = 0;
            this.lbEDITransactionSet.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.lbEDITransactionSet_MouseDoubleClick);
            // 
            // bdsEDITransactionSet
            // 
            this.bdsEDITransactionSet.DataSource = typeof(BHEDI.tblEDITransactionSet);
            // 
            // frmEDITransactionSet
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(348, 483);
            this.Controls.Add(this.lbEDITransactionSet);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmEDITransactionSet";
            this.Text = "EDI Transaction Set";
            this.Load += new System.EventHandler(this.frmEDITransactionSet_Load);
            ((System.ComponentModel.ISupportInitialize)(this.bdsEDITransactionSet)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ListBox lbEDITransactionSet;
        private System.Windows.Forms.BindingSource bdsEDITransactionSet;
    }
}