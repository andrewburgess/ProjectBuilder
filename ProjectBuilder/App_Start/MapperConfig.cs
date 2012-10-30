using AutoMapper;
using ProjectBuilder.Models;
using ProjectBuilder.ViewModels.Home;

namespace ProjectBuilder.App_Start
{
    public static class MapperConfig
    {
        public static void RegisterMappings()
        {
            Mapper.CreateMap<Project, IndexProjectViewModel>();
        }
    }
}