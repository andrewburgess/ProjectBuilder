using System;

namespace ProjectBuilder.Models
{
    public class Property
    {
        public Property()
        {
            Node = new Node();
        }

        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public PropertyTypes PropertyType { get; set; }

        public Node Node { get; set; }

        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }
    }
}