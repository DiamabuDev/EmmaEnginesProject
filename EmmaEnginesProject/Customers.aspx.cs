using EmmaEnginesLibrary;
using EmmaEnginesLibrary.EmmasDataSetTableAdapters;
using System;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;

namespace EmmaEnginesProject
{
    public partial class Customers : System.Web.UI.Page
    {
        static EmmasDataSet dsEmma = new EmmasDataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                try
                {
                    customerTableAdapter daCustomer = new customerTableAdapter();
                    daCustomer.Fill(dsEmma.customer);

                    fvCustomer.Visible = false;
                }
                catch { }
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (dsEmma.customer.Count > 0)
            {
                //set up criteria based on user inputs
                string criteria = "";
                if (txtName.Text.Length > 0)
                {
                    criteria = "custFirst LIKE '%" + txtName.Text + "%' OR custLast LIKE '%" + txtName.Text + "%'";
                }

                if (txtCity.Text.Length > 0)
                {
                    if (criteria.Length > 0)
                    {
                        criteria += " AND ";
                    }
                    criteria += "custCity LIKE '%" + txtCity.Text + "%'";
                }

                //select records
                DataRow[] customers = dsEmma.customer.Select(criteria);

                //display records
                this.lstResults.Items.Clear();
                foreach (DataRow r in customers)
                    lstResults.Items.Add($"{r[0]}: {r[1]} {r[2]} - {r[5]}");

                if (customers.Length == 0) this.lstResults.Items.Add("No Results");

                fvCustomer.Visible = false;
            }
        }

        protected void Result_Selected(object sender, EventArgs e)
        {
            string selectedId = "";

            if (lstResults.SelectedIndex != -1)
            {
                string selectedItem = lstResults.SelectedItem.ToString();
                string[] parts = selectedItem.Split(new char[] { ':' }, 2);

                if (parts.Length > 0)
                {
                    selectedId = parts[0].Trim();
                }
            }
            Session["CustomerID"] = selectedId;

            fvCustomer.Visible = true;
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            //clear inputs and results
            this.txtName.Text = string.Empty;
            this.txtCity.Text = string.Empty;
            this.lstResults.Items.Clear();
            this.txtName.Focus();

            fvCustomer.Visible = false;
        }

        protected void SignOut_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
        }

        protected void CustomerSelected(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                // Storing CustomerID in Session
                Session["SelectedCustomerID"] = e.CommandArgument.ToString();
            }
        }
    }
}