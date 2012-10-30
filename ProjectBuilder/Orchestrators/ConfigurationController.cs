using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AttributeRouting.Web.Mvc;

namespace ProjectBuilder.Orchestrators
{
    public class ConfigurationController : Controller
    {
        [GET("config")]
        [GET("config/index")]
        public ActionResult Index()
        {
            return View();
        }

    }
}
