using System;

namespace EmmaEnginesProject
{
    public partial class CreateOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateOrder_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {

        }

        protected void btnIncrease_Click(object sender, EventArgs e)
        {
            int quantity = int.Parse(lblQuantity.Text);
            lblQuantity.Text = (++quantity).ToString();
        }

        protected void btnDecrease_Click(object sender, EventArgs e)
        {
            int quantity = int.Parse(lblQuantity.Text);
            if (quantity > 0)
            {
                lblQuantity.Text = (--quantity).ToString();
            }
        }


    }
}