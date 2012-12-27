using ProjectBuilder.ViewModels.Node;

namespace ProjectBuilder.Orchestrators.Interfaces
{
    public interface INodeOrchestrator
    {
        /// <summary>
        /// Saves the provided node data to the database. If the Id is -1, then it creates a new node.
        /// </summary>
        /// <param name="viewModel">User supplied data of the node</param>
        /// <returns>Id of the node</returns>
        int Save(SaveNodeViewModel viewModel);

        /// <summary>
        /// Deletes an existing node
        /// </summary>
        /// <param name="id">Id of the node to delete</param>
        void Delete(int id);
    }
}