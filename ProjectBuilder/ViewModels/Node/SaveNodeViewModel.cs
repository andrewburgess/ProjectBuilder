using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ProjectBuilder.ViewModels.Node
{
    public class SaveNodeViewModel
    {
        public int? Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string Description { get; set; }

        public int? ParentId { get; set; }
    }
}