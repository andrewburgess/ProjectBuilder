using ProjectBuilder.ViewModels.Home;
using ProjectBuilder.ViewModels.Home.Index;

namespace ProjectBuilder.Orchestrators.Interfaces
{
    public interface IHomeOrchestrator
    {
        IndexViewModel GetIndexViewModel();
    }
}