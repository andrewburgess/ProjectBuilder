using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http;
using AttributeRouting.Web.Mvc;
using ProjectBuilder.Controllers.API.Attributes;
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
        [ValidationActionFilter]
        public AddReturnViewModel Create(AddNodeViewModel viewModel)
        {
            if (ModelState.IsValid)
                return Orchestrator.Add(viewModel);

            throw new HttpException((int)HttpStatusCode.BadRequest,
                                    ModelState.Values.Where(x => x.Errors.Count > 0).SelectMany(x => x.Errors).Select(
                                        x => x.ErrorMessage).Aggregate((x, y) => x + ", " + y));
        }
    }
}
