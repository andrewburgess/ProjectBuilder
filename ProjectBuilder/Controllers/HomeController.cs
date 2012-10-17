using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AttributeRouting.Web.Mvc;

namespace ProjectBuilder.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        [GET("")]
        [GET("index")]
        public ActionResult Index()
        {
            return View();
        }

    }
}
