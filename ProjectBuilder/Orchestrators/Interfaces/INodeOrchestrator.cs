using ProjectBuilder.ViewModels.Node;

namespace ProjectBuilder.Orchestrators.Interfaces
{
    public interface INodeOrchestrator
    {
        /// <summary>
        /// Adds a new node to the system
        /// </summary>
        /// <param name="viewModel">Data for the new node</param>
        /// <returns>Id of the newly inserted node</returns>
        int Add(AddNodeViewModel viewModel);

        /// <summary>
        /// Edits an existing node
        /// </summary>
        /// <param name="viewModel">Updated information for the node</param>
        void Edit(EditNodeViewModel viewModel);

        /// <summary>
        /// Deletes an existing node
        /// </summary>
        /// <param name="id">Id of the node to delete</param>
        void Delete(int id);
    }
}