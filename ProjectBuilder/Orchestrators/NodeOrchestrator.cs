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
                var node = !viewModel.Id.HasValue ? AddNode(context, viewModel) : SaveNode(context, viewModel);

                context.SaveChanges();

                return node.Id;
            }
        }

        public void Delete(int id)
        {
            using (var context = new DataModel())
            {
                var node = context.Nodes.FirstOrDefault(x => x.Id == id);
                if (node == null)
                    throw new ArgumentException("Id was not found");

                DeleteChildren(context, node);

                context.Nodes.Remove(node);
                context.SaveChanges();
            }
        }

        private Node AddNode(DataModel context, SaveNodeViewModel viewModel)
        {
            var node = Mapper.Map<SaveNodeViewModel, Node>(viewModel);
            if (viewModel.ParentId.HasValue)
            {
                var parent = context.Nodes.FirstOrDefault(x => x.Id == viewModel.ParentId);
                if (parent == null)
                    throw new ArgumentException("Parent node was not found");
                node.Parent = parent;
            }
            context.Nodes.Add(node);
            return node;
        }

        private Node SaveNode(DataModel context, SaveNodeViewModel viewModel)
        {
            var node = context.Nodes.FirstOrDefault(x => x.Id == viewModel.Id);
            if (node == null)
                throw new ArgumentException("Node was not found");

            Mapper.Map(viewModel, node);

            if (viewModel.ParentId.HasValue && (node.Parent == null || viewModel.ParentId.GetValueOrDefault(-1) != node.Parent.Id))
            {
                var parent = context.Nodes.FirstOrDefault(x => x.Id == viewModel.ParentId);
                if (parent == null)
                    throw new ArgumentException("Parent node was not found");
                node.Parent = parent;
            }
            else if (!viewModel.ParentId.HasValue && node.Parent != null)
                node.Parent = null;

            return node;
        }

        private void DeleteChildren(DataModel context, Node parent)
        {
            var children = context.Nodes.Where(x => x.Parent.Id == parent.Id);
            foreach (var child in children)
            {
                DeleteChildren(context, child);
            }

            context.Nodes.Remove(parent);
        }
    }
}