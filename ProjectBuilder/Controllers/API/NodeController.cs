using System.Web.Http;
using AttributeRouting.Web.Mvc;
using ProjectBuilder.Controllers.API.Attributes;
using ProjectBuilder.Orchestrators.Interfaces;
using ProjectBuilder.ViewModels.Node;

namespace ProjectBuilder.Controllers.API
{
    public class NodeController : ApiController
    {
        private INodeOrchestrator Orchestrator { get; set; }

        public NodeController(INodeOrchestrator orchestrator)
        {
            Orchestrator = orchestrator;
        }

        [POST("api/node/add")]
        [ValidationActionFilter]
        public int Create(AddNodeViewModel viewModel)
        {
            return Orchestrator.Add(viewModel);
        }

        [POST("api/node/edit")]
        [ValidationActionFilter]
        public void Edit(EditNodeViewModel viewModel)
        {
            Orchestrator.Edit(viewModel);
        }
    }
}
