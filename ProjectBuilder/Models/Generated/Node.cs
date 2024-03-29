//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProjectBuilder.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Node : IEntity
    {
        public Node()
        {
            this.Description = "";
            this.Children = new HashSet<Node>();
            this.Properties = new HashSet<Property>();
            this.ProjectNodes = new HashSet<ProjectNode>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public System.DateTime DateCreated { get; set; }
        public System.DateTime DateModified { get; set; }
    
        public virtual ICollection<Node> Children { get; set; }
        public virtual Node Parent { get; set; }
        public virtual ICollection<Property> Properties { get; set; }
        public virtual ICollection<ProjectNode> ProjectNodes { get; set; }
    }
}
