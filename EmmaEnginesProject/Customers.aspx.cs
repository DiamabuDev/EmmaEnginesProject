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
        internal static EmmasDataSet dsEmma;

        private DataRow[] rows;

        static Customers()
        {
            dsEmma = new EmmasDataSet();
            customerTableAdapter daCustomer = new customerTableAdapter();

            try
            {
                daCustomer.Fill(dsEmma.customer);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error filling dataset: " + ex.Message);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCustomersGridView();
            }
        }

        private void BindCustomersGridView()
        {
            if (dsEmma != null && dsEmma.customer.Rows.Count > 0)
            {
                gvCustomers.DataSource = dsEmma.customer;
                gvCustomers.DataBind();
            }
            else
            {
                lblMessage.Text = "No customer records available.";
            }
        }


        protected void SearchCustomer_Click(object sender, EventArgs e)
        {
            if (dsEmma == null || dsEmma.customer == null || dsEmma.customer.Rows.Count == 0)
            {
                this.lblMessage.Text = "No records available";
                return;
            }

            string criteria = GetCriteria();
            rows = (criteria.Length > 0) ? dsEmma.customer.Select(criteria) : dsEmma.customer.Select();
            DisplayCustomers();
        }

        private string GetCriteria()
        {
            string criteria = "";
            if (this.txtSearch.Text.Length > 0)
            {
                criteria = $"custFirst Like '%{txtSearch.Text}%'";
            }
            return criteria;
        }

        private void DisplayCustomers()
        {
            if (rows != null && rows.Length > 0)
            {
                DataTable dataTable = rows.CopyToDataTable();
                this.gvCustomers.DataSource = dataTable;
                this.gvCustomers.DataBind();
            }
            else
            {
                this.gvCustomers.DataSource = null;
                this.gvCustomers.DataBind();
                this.lblMessage.Text = "No records found";
            }
        }

        protected void SignOut_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
        }
        protected void lnkSelect_Click(object sender, EventArgs e)
        {
            LinkButton lnkSelect = (LinkButton)sender;
            string customerId = lnkSelect.CommandArgument;
            // Perform your select action here, e.g., redirect to a details page
            Response.Redirect("Orders.aspx?id=" + customerId);
        }

        protected void gvCustomers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCustomers.EditIndex = e.NewEditIndex;
            BindCustomersGridView();
        }

        protected void gvCustomers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DataRow r = dsEmma.customer[gvCustomers.SelectedIndex];

            TextBox txtCustFirst = (TextBox)gvCustomers.Rows[e.RowIndex].FindControl("txtCustFirst");
            TextBox txtCustLast = (TextBox)gvCustomers.Rows[e.RowIndex].FindControl("txtCustLast");
            TextBox txtCustPhone = (TextBox)gvCustomers.Rows[e.RowIndex].FindControl("txtCustPhone");
            TextBox txtCustAddress = (TextBox)gvCustomers.Rows[e.RowIndex].FindControl("txtCustAddress");
            TextBox txtCustCity = (TextBox)gvCustomers.Rows[e.RowIndex].FindControl("txtCustCity");
            TextBox txtCustPostal = (TextBox)gvCustomers.Rows[e.RowIndex].FindControl("txtCustPostal");
            TextBox txtCustEmail = (TextBox)gvCustomers.Rows[e.RowIndex].FindControl("txtCustEmail");

            r[1] = txtCustFirst.Text;
            r[2] = txtCustLast.Text;
            r[3] = txtCustPhone.Text;
            r[4] = txtCustAddress.Text;
            r[5] = txtCustCity.Text;
            r[6] = txtCustPostal.Text;
            r[7] = txtCustEmail.Text;

            int customerId = Convert.ToInt32(gvCustomers.DataKeys[e.RowIndex].Value);

            try
            {
                customerTableAdapter daCustomer = new customerTableAdapter();

                daCustomer.Update(r);
                dsEmma.AcceptChanges();


                gvCustomers.EditIndex = -1;
                BindCustomersGridView();
            }
            catch (Exception ex)
            {

                lblMessage.Text = "Update failed: " + ex.Message;
            }
        }


        protected void gvCustomers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCustomers.EditIndex = -1;
            BindCustomersGridView();
        }

    }
}