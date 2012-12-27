using System.Web.Mvc;

using ProjectBuilder.Controllers.Attributes;

namespace ProjectBuilder.App_Start
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleAjaxErrorAttribute());
            filters.Add(new HandleErrorAttribute());
        }
    }
}