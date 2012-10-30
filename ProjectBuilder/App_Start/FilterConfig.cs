using System.Web.Mvc;
using ProjectBuilder.Controllers.API.Attributes;

namespace ProjectBuilder.App_Start
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}