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
            using (var context = new DataModel())
            {
                var nodes = Mapper.Map<List<Node>, List<IndexNodeViewModel>>(context.Nodes.ToList());

                return new IndexViewModel
                           {
                               Nodes = nodes.Where(x => x.ParentId == null).ToList()
                           };
            }
        }
    }
}