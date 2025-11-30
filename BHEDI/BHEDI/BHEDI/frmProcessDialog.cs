using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace BHEDI
{
    public partial class frmProcessDialog : Form
    {
        public frmProcessDialog()
        {
            InitializeComponent();
        }

        public event EventHandler<EventArgs> Canceled;

        /// <summary>
        /// set message
        /// </summary>
        public string Message
        {
            set { labelMessage.Text = value; }
        }

        /// <summary>
        /// set progress status
        /// </summary>
        public int ProgressValue
        {
            set { progressBar1.Value = value; }
        }

        /// <summary>
        /// Cancel processs
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnCancel_Click(object sender, EventArgs e)
        {
            // Create a copy of the event to work with
            EventHandler<EventArgs> ea = Canceled;
            /* If there are no subscribers, ea will be null so we need to check
                * to avoid a NullReferenceException. */
            if (ea != null)
                ea(this, e);
        }
    }
}
