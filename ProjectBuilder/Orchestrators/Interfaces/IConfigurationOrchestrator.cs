using ProjectBuilder.ViewModels.Configuration;

namespace ProjectBuilder.Orchestrators.Interfaces
{
    public interface IConfigurationOrchestrator
    {
        IndexViewModel GetIndex();
    }
}