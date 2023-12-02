using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Owin;

[assembly: OwinStartup(typeof(EmmaEnginesProject.Startup1))]

namespace EmmaEnginesProject
{
    public class Startup1
    {
        public void Configuration(IAppBuilder app)
        {
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                CookieName = "PROG1210Cookie",
                LoginPath = new PathString("/Login"),
                LogoutPath = new PathString("/Login"),
                ExpireTimeSpan = System.TimeSpan.FromMinutes(10)
            });
        }
    }
}
