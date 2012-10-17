using System.Data.Entity;

namespace ProjectBuilder.Models
{
    public class ProjectBuilderDBContext : DbContext
    {
        public DbSet<Project> Projects { get; set; }
        public DbSet<Node> Nodes { get; set; }
        public DbSet<Property> Properties { get; set; }
        public DbSet<ProjectNode> ProjectNodes { get; set; }
        public DbSet<ProjectNodeProperty> ProjectNodeProperties { get; set; }
    }
}