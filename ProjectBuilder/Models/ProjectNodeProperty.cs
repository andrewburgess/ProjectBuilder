using System;

namespace ProjectBuilder.Models
{
    public class ProjectNodeProperty
    {
        public ProjectNodeProperty()
        {
            Parent = new ProjectNodeProperty();
        }

        public int ID { get; set; }
        public string Value { get; set; }

        public ProjectNodeProperty Parent { get; set; }

        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }
    }
}