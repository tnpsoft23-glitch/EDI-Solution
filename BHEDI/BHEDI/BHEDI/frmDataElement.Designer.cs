namespace BHEDI
{
    partial class frmDataElement
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmDataElement));
            this.lbDataElement = new System.Windows.Forms.ListBox();
            this.lbXMLData = new System.Windows.Forms.ListBox();
            this.SuspendLayout();
            // 
            // lbDataElement
            // 
            this.lbDataElement.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lbDataElement.FormattingEnabled = true;
            this.lbDataElement.Location = new System.Drawing.Point(7, 5);
            this.lbDataElement.Name = "lbDataElement";
            this.lbDataElement.Size = new System.Drawing.Size(334, 472);
            this.lbDataElement.TabIndex = 0;
            this.lbDataElement.Visible = false;
            this.lbDataElement.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.lbDataElement_MouseDoubleClick);
            // 
            // lbXMLData
            // 
            this.lbXMLData.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lbXMLData.FormattingEnabled = true;
            this.lbXMLData.Location = new System.Drawing.Point(7, 5);
            this.lbXMLData.Name = "lbXMLData";
            this.lbXMLData.Size = new System.Drawing.Size(334, 472);
            this.lbXMLData.TabIndex = 2;
            this.lbXMLData.Visible = false;
            this.lbXMLData.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.lbXMLData_MouseDoubleClick);
            // 
            // frmDataElement
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(348, 483);
            this.Controls.Add(this.lbXMLData);
            this.Controls.Add(this.lbDataElement);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmDataElement";
            this.Text = "Data Element View";
            this.Load += new System.EventHandler(this.frmDataElement_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ListBox lbDataElement;
        private System.Windows.Forms.ListBox lbXMLData;
    }
}