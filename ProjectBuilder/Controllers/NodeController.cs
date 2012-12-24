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

        [POST("api/node/add")]
        [ValidationActionFilter]
        public ActionResult Create(AddNodeViewModel viewModel)
        {
            return Json(Orchestrator.Add(viewModel));
        }

        [POST("api/node/edit/{id?}")]
        [ValidationActionFilter]
        public ActionResult Edit(EditNodeViewModel viewModel)
        {
            Orchestrator.Edit(viewModel);

            return new EmptyResult();
        }

        [POST("api/node/delete/{id?}")]
        public ActionResult Delete(int id)
        {
            Orchestrator.Delete(id);
            return new EmptyResult();
        }
    }
}
