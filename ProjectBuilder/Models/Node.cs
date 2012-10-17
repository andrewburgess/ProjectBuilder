using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjectBuilder.Models
{
    public class Node
    {
        public Node()
        {
            Parent = new Node();
        }

        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public int? ParentId { get; set; }

        [ForeignKey("ParentId")]
        public Node Parent { get; set; }

        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }
    }
}