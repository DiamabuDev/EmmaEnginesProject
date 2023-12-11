using EmmaEnginesLibrary;
using EmmaEnginesLibrary.EmmasDataSetTableAdapters;
using Microsoft.Owin.Logging;
using System;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;

namespace EmmaEnginesProject
{
    public partial class Home : System.Web.UI.Page
    {
        static EmmasDataSet dsEmma = new EmmasDataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                try
                {
                    employeeTableAdapter daEmployee = new employeeTableAdapter();
                    daEmployee.Fill(dsEmma.employee);
                    positionTableAdapter daPosition = new positionTableAdapter();
                    daPosition.Fill(dsEmma.position);

                    this.ddlPosition.Items.Clear();
                    this.ddlPosition.Items.Add(new ListItem("None", "None"));

                    // Add positions from the database
                    foreach (DataRow dr in dsEmma.position)
                        this.ddlPosition.Items.Add(new ListItem(dr[1].ToString(), dr[0].ToString()));

                    fvEmployee.Visible = false;
                }
                catch { }
            }

            System.Diagnostics.Debug.WriteLine("This is a test message");
        }

        protected void btnSearchClick(object sender, EventArgs e)
        {
            

            if (dsEmma.employee.Count > 0)
            {
                //set up criteria based on user inputs
                string criteria = "";
                
                if (txtName.Text.Length > 0)
                {
                    criteria = "empFirst LIKE '%" + txtName.Text + "%' OR empLast LIKE '%" + txtName.Text + "%'";
                }

                if (ddlPosition.SelectedValue != "None") {
                    string positionCriteria = "posID = '" + ddlPosition.SelectedValue.ToString() + "'";

                    if (criteria.Length > 0) {
                        criteria = "(" + criteria + ") AND (" + positionCriteria + ")";
                    } else {
                        criteria = positionCriteria;
                    }
                }

                //select records
                DataRow[] employees = dsEmma.employee.Select(criteria);

                //display records
                this.lstResults.Items.Clear();
                foreach (DataRow r in employees)
                    lstResults.Items.Add($"{r[0]}: {r[1]} {r[2]}");

                if (employees.Length == 0) this.lstResults.Items.Add("No Results");

                fvEmployee.Visible = false;
            }
        }

        protected void SignOut_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
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
            Session["employeeID"] = selectedId;

            fvEmployee.Visible = true;
        }
        protected void Clear_Click(object sender, EventArgs e)
        {
            //clear inputs and results
            this.txtName.Text = string.Empty;
            this.ddlPosition.SelectedIndex = 0;
            this.lstResults.Items.Clear();
            this.txtName.Focus();

            fvEmployee.Visible = false;
        }

        protected void EmployeeSelected(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                Session["SelectedEmployeeID"] = e.CommandArgument.ToString();
                Response.Redirect("Customers.aspx");

            }
        }
    }
}