using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmmaEnginesProject
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchOrder_Click(object sender, EventArgs e)
        {

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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}