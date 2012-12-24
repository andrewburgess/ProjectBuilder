using System;
using System.Data;
using System.Data.Entity;
using System.Linq;

namespace ProjectBuilder.Models
{
    public partial class DataModel
    {
        /// <summary>
        /// Automatically updates the DateCreated/DateModified properties when saving the entities
        /// </summary>
        /// <returns>Number of changed entities</returns>
        public override int SaveChanges()
        {
            foreach (var entity in ChangeTracker.Entries<IEntity>().
                                            Where(e => e.State == EntityState.Added).Select(e => e.Entity))
            {
                if (entity.DateCreated == DateTime.MinValue)
                {
                    entity.DateCreated = DateTime.Now;
                }

                if (entity.DateModified == DateTime.MinValue)
                {
                    entity.DateModified = DateTime.Now;
                }
            }

            foreach (var entity in ChangeTracker.Entries<IEntity>().
                                        Where(e => e.State == EntityState.Modified).Select(e => e.Entity))
            {
                entity.DateModified = DateTime.Now;
            }

            return base.SaveChanges();
        }
    }
}