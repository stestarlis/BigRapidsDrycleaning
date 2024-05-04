using BRDObjects.Statics;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics.CodeAnalysis;

namespace BRDObjects
{
    /// <summary>
    /// This partial exists just to ignore the context from code coverage.
    /// </summary>
    [ExcludeFromCodeCoverage]
    public partial class BrdryCleaningContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) => optionsBuilder.UseSqlServer(Connections.GetConnection());

        #region [Singleton]
        private static readonly Lazy<BrdryCleaningContext> lazyContext = new(() => new());

        public static BrdryCleaningContext Instance { get { return lazyContext.Value; } }
        #endregion
    }
}
