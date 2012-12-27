using System.Web.Mvc;
using AttributeRouting.Web.Mvc;
using ProjectBuilder.Controllers.Attributes;
using ProjectBuilder.Orchestrators.Interfaces;
using ProjectBuilder.ViewModels.Node;

namespace ProjectBuilder.Controllers
{
    [HandleAjaxError]
    public class NodeController : Controller
    {
        private INodeOrchestrator Orchestrator { get; set; }

        public NodeController(INodeOrchestrator orchestrator)
        {
            Orchestrator = orchestrator;
        }

        [POST("api/node/save")]
        [ValidationActionFilter]
        public ActionResult Save(SaveNodeViewModel viewModel)
        {
            return Json(Orchestrator.Save(viewModel));
        }

        [POST("api/node/delete/{id?}")]
        public ActionResult Delete(int id)
        {
            Orchestrator.Delete(id);
            return new EmptyResult();
        }
    }
}
