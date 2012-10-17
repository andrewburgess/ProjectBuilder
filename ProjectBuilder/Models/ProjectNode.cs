using System;

namespace ProjectBuilder.Models
{
    public class ProjectNode
    {
        public ProjectNode()
        {
            Project = new Project();
            Node = new Node();
        }

        public int ID { get; set; }

        public int Order { get; set; }
        public Project Project { get; set; }
        public Node Node { get; set; }

        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }
    }
}