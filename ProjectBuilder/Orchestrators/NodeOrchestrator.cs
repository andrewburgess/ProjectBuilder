using System;
using System.Linq;
using AutoMapper;
using ProjectBuilder.Models;
using ProjectBuilder.Orchestrators.Interfaces;
using ProjectBuilder.ViewModels.Node;

namespace ProjectBuilder.Orchestrators
{
    public class NodeOrchestrator : INodeOrchestrator
    {
        public int Add(AddNodeViewModel viewModel)
        {
            using (var context = new DataModel())
            {
                var node = Mapper.Map<AddNodeViewModel, Node>(viewModel);
                context.Nodes.Add(node);
                context.SaveChanges();

                return node.Id;
            }
        }

        public void Edit(EditNodeViewModel viewModel)
        {
            using (var context = new DataModel())
            {
                var node = context.Nodes.FirstOrDefault(x => x.Id == viewModel.Id);
                if (node == null) throw new ArgumentException("Id was not found");

                Mapper.Map(viewModel, node);

                context.SaveChanges();
            }
        }

        public void Delete(int id)
        {
            using (var context = new DataModel())
            {
                var node = context.Nodes.FirstOrDefault(x => x.Id == id);
                if (node == null) throw new ArgumentException("Id was not found");

                context.Nodes.Remove(node);
                context.SaveChanges();
            }
        }
    }
}