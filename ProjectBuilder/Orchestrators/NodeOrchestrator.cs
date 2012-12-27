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
        public int Save(SaveNodeViewModel viewModel)
        {
            using (var context = new DataModel())
            {
                Node node;
                if (viewModel.Id == -1)
                {
                    node = Mapper.Map<SaveNodeViewModel, Node>(viewModel);
                    context.Nodes.Add(node);
                }
                else
                {
                    node = context.Nodes.FirstOrDefault(x => x.Id == viewModel.Id);
                    if (node == null) throw new ArgumentException("Node was not found");

                    Mapper.Map(viewModel, node);
                }

                context.SaveChanges();

                return node.Id;
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