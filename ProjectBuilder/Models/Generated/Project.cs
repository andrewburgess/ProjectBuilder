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
    
    public partial class Project : IEntity
    {
        public Project()
        {
            this.Description = "";
            this.ProjectNodes = new HashSet<ProjectNode>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public System.DateTime DateCreated { get; set; }
        public System.DateTime DateModified { get; set; }
    
        public virtual ICollection<ProjectNode> ProjectNodes { get; set; }
    }
}
