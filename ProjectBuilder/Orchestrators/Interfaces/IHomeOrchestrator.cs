using ProjectBuilder.ViewModels.DTO;
using ProjectBuilder.ViewModels.Home;

namespace ProjectBuilder.Orchestrators.Interfaces
{
    public interface IHomeOrchestrator
    {
        IndexViewModel GetIndexViewModel();
    }
}