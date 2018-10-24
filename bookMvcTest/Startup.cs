using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(bookMvcTest.Startup))]
namespace bookMvcTest
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
