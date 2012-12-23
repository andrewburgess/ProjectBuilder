using System.Web.Http;
using AttributeRouting.Web.Http.WebHost;
using ProjectBuilder.Controllers.API;

[assembly: WebActivator.PreApplicationStartMethod(typeof(ProjectBuilder.App_Start.AttributeRoutingHttp), "Start")]

namespace ProjectBuilder.App_Start
{
    public static class AttributeRoutingHttp
    {
        public static void RegisterRoutes(HttpRouteCollection routes)
        {

            // See http://github.com/mccalltd/AttributeRouting/wiki for more options.
            // To debug routes locally using the built in ASP.NET development server, go to /routes.axd

            routes.MapHttpAttributeRoutes(config =>
                                              {
                                                  config.AddRoutesFromController(typeof (NodeController));
                                              });
        }

        public static void Start()
        {
            RegisterRoutes(GlobalConfiguration.Configuration.Routes);
        }
    }
}
