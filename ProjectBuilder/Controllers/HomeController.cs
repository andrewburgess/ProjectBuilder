using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AttributeRouting.Web.Mvc;
using ProjectBuilder.Orchestrators.Interfaces;

namespace ProjectBuilder.Controllers
{
    public class HomeController : Controller
    {
        private IHomeOrchestrator Orchestrator { get; set; }

        public HomeController(IHomeOrchestrator orchestrator)
        {
            Orchestrator = orchestrator;
        }

        //
        // GET: /Home/
        [GET("")]
        [GET("index")]
        public ActionResult Index()
        {
            return View(Orchestrator.GetIndex());
        }

    }
}
