using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using ProjectBuilder.Models;
using ProjectBuilder.Orchestrators.Interfaces;
using ProjectBuilder.ViewModels.Configuration;

namespace ProjectBuilder.Orchestrators
{
    public class ConfigurationOrchestrator : IConfigurationOrchestrator
    {
        public IndexViewModel GetIndex()
        {
            return new IndexViewModel
                       {
                           Nodes = new List<IndexNodeViewModel>()
                                       {
                                           new IndexNodeViewModel
                                               {
                                                   Id = 0,
                                                   Description = "This node is the first one",
                                                   Name = "First Node"
                                               }
                                       }
                       };

            /*using (var context = new DataModel())
            {
                return new IndexViewModel
                           {
                               Nodes = Mapper.Map<List<Node>, List<IndexNodeViewModel>>(context.Nodes.ToList())
                           };
            }*/
        }
    }
}