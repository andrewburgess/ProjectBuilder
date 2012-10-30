using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using ProjectBuilder.Models;
using ProjectBuilder.Orchestrators.Interfaces;
using ProjectBuilder.ViewModels.DTO;
using ProjectBuilder.ViewModels.Home;

namespace ProjectBuilder.Orchestrators
{
    public class HomeOrchestrator : IHomeOrchestrator
    {
        public IndexViewModel GetIndexViewModel()
        {
            using (var context = new DataModel())
            {
                var projects = context.Projects.OrderByDescending(x => x.DateModified).Take(5).ToList();

                return new IndexViewModel
                           {
                               Projects = Mapper.Map<List<Project>, List<ProjectDTO>>(projects)
                           };
            }
        }
    }
}