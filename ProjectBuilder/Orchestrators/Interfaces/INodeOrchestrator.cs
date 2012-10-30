using ProjectBuilder.ViewModels.API;
using ProjectBuilder.ViewModels.API.Node;

namespace ProjectBuilder.Orchestrators.Interfaces
{
    public interface INodeOrchestrator
    {
        AddReturnViewModel Add(AddNodeViewModel viewModel);
    }
}