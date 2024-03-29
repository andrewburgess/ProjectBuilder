using System.Reflection;
using System.Web.Mvc;
using System.Web.Routing;
using AttributeRouting.Web.Mvc;

[assembly: WebActivator.PreApplicationStartMethod(typeof(ProjectBuilder.App_Start.AttributeRouting), "Start")]

namespace ProjectBuilder.App_Start {
    public static class AttributeRouting {
		public static void RegisterRoutes(RouteCollection routes) {
            
			// See http://github.com/mccalltd/AttributeRouting/wiki for more options.
			// To debug routes locally using the built in ASP.NET development server, go to /routes.axd

            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapAttributeRoutes(config =>
            {
                config.ScanAssembly(Assembly.GetExecutingAssembly());
                config.UseLowercaseRoutes = true;
            });
		}

        public static void Start() {
            RegisterRoutes(RouteTable.Routes);
        }
    }
}
