using EmmaEnginesLibrary;
using EmmaEnginesLibrary.EmmasDataSetTableAdapters;
using System;

namespace EmmaEnginesProject
{
    public partial class Customer2 : System.Web.UI.Page
    {
        internal EmmasDataSet dsEmma;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string city = txtCity.Text;

            if (txtCity.Text != "")
            {
                dsEmma = new EmmasDataSet();
                try
                {
                    customerByCityTableAdapter daCity = new customerByCityTableAdapter();
                    daCity.Fill(dsEmma.customerByCity, city);
                    gvCity.DataSource = dsEmma.customerByCity;
                    gvCity.DataBind();
                    txtCity.Text = "";
                }
                catch { }
            }
        }
    }
}