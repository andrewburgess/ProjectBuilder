using System.Collections.Generic;

namespace ProjectBuilder.ViewModels.API
{
    public class AddReturnViewModel
    {
        public int Id { get; set; }
        public bool Success { get; set; }
        public List<string> ErrorMessages { get; set; }

        public AddReturnViewModel()
        {
            ErrorMessages = new List<string>();
        }
    }
}