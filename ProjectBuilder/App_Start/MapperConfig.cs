using AutoMapper;
using ProjectBuilder.Models;
using ProjectBuilder.ViewModels.Configuration;
using ProjectBuilder.ViewModels.Home;
using ProjectBuilder.ViewModels.Node;

namespace ProjectBuilder.App_Start
{
    public static class MapperConfig
    {
        public static void RegisterMappings()
        {
            Mapper.CreateMap<Project, IndexProjectViewModel>();

            #region Node Mappings

            Mapper.CreateMap<Node, IndexNodeViewModel>();
            Mapper.CreateMap<Node, AddNodeViewModel>();
            Mapper.CreateMap<AddNodeViewModel, Node>();
            Mapper.CreateMap<Node, EditNodeViewModel>();
            Mapper.CreateMap<EditNodeViewModel, Node>();

            #endregion
        }
    }
}