using System.Collections.Generic;

namespace ProjectBuilder.ViewModels.Configuration
{
    public class IndexNodeViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int? ParentId { get; set; }

        public List<IndexNodeViewModel> Children { get; set; }

        public IndexNodeViewModel()
        {
            Children = new List<IndexNodeViewModel>();
        }
    }
}