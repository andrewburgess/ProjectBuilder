using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using AttributeRouting.Web.Mvc;
using ProjectBuilder.Orchestrators.Interfaces;
using ProjectBuilder.ViewModels.API;
using ProjectBuilder.ViewModels.API.Node;

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
        public AddReturnViewModel Create(AddNodeViewModel viewModel)
        {
            if (ModelState.IsValid)
                return Orchestrator.Add(viewModel);
            return new AddReturnViewModel
                       {
                           Success = false,
                           Id = -1,
                           ErrorMessages = new List<string>(ModelState.Values.Where(x => x.Errors.Count > 0).SelectMany(x => x.Errors).Select(x => x.ErrorMessage))
                       };
        }
    }
}
