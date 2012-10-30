using System;

namespace ProjectBuilder.ViewModels.DTO
{
    public class ProjectDTO
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }
    }
}