using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;
using ProjectBuilder.App_Start;
using StackExchange.Profiling;

namespace ProjectBuilder
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            MapperConfig.RegisterMappings();

            MiniProfilerEF.Initialize();
        }

        protected void Application_BeginRequest()
        {
            if (Request.IsLocal)
            {
                var ignored = MiniProfiler.Settings.IgnoredPaths.ToList();
                ignored.Add("Glimpse.axd");
                MiniProfiler.Settings.IgnoredPaths = ignored.ToArray();

                MiniProfiler.Start();
            }
        }
    }
}