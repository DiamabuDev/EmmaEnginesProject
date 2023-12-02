using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Linq;

namespace EmmaEnginesProject
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            UserStore<IdentityUser> store = new UserStore<IdentityUser>();
            UserManager<IdentityUser> manager = new UserManager<IdentityUser>(store);

            IdentityUser user = new IdentityUser(txtUser.Text);

            IdentityResult result = manager.Create(user, txtPassword.Text);

            if (result.Succeeded)
            {
                lblMessage.Text = "User Created";
            }
            else
            {
                lblMessage.Text = result.Errors.FirstOrDefault();
            }
        }

        protected void SignIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void CustomValidatorUser_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {

        }
    }
}