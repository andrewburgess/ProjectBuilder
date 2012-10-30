using System.ComponentModel.DataAnnotations;

namespace ProjectBuilder.ViewModels.API.Node
{
    public class AddNodeViewModel
    {
        [Required]
        public string Name { get; set; }

        [Required]
        public string Description { get; set; }
    }
}