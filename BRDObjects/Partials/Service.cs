using BRDObjects.Partials;

namespace BRDObjects
{
    public partial class Service : BRDEntity<Service>
    {
        public Service() { }
        public Service(string? title, bool isActive, decimal price, bool? isTaxable, decimal? taxRate)
        {
            Title = title;
            IsActive = isActive;
            Price = price;
            IsTaxable = isTaxable;
            TaxRate = taxRate;
        }
    }
}
