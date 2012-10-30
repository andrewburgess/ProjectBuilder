using System.Web.Mvc;
using AttributeRouting.Web.Mvc;
using ProjectBuilder.Orchestrators.Interfaces;
using ProjectBuilder.ViewModels.API.Node;

namespace ProjectBuilder.Controllers
{
    public class ConfigurationController : Controller
    {
        private IConfigurationOrchestrator Orchestrator { get; set; }

        public ConfigurationController(IConfigurationOrchestrator orchestrator)
        {
            Orchestrator = orchestrator;
        }

        [GET("config")]
        [GET("config/index")]
        public ActionResult Index()
        {
            return View(Orchestrator.GetIndex());
        }
    }
}
