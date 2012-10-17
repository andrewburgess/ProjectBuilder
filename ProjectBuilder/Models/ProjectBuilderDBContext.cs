using System.Data.Entity;

namespace ProjectBuilder.Models
{
    public class ProjectBuilderDBContext : DbContext
    {
        public DbSet<Project> Projects { get; set; }
    }
}