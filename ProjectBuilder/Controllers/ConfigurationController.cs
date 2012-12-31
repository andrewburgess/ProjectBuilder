using System.Web.Mvc;
using AttributeRouting.Web.Mvc;

using Newtonsoft.Json;

using ProjectBuilder.Controllers.Helpers.JSON;
using ProjectBuilder.Orchestrators.Interfaces;

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
            var viewModel = Orchestrator.GetIndex();
            viewModel.NodesJson = JsonConvert.SerializeObject(viewModel.Nodes, Formatting.None, new JsonSerializerSettings
                                                                                                {
                                                                                                     ContractResolver = new LowercaseContractResolver()
                                                                                                });
            return View(viewModel);
        }
    }
}
