using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class Service
{
    public int Id { get; set; }

    public string? Title { get; set; }

    public bool IsActive { get; set; }

    public decimal Price { get; set; }

    public bool? IsTaxable { get; set; }

    public decimal? TaxRate { get; set; }

    public int? StoreId { get; set; }

    public virtual ICollection<ServiceItemType> ServiceItemTypes { get; set; } = new List<ServiceItemType>();

    public virtual ICollection<ServicePromotional> ServicePromotionals { get; set; } = new List<ServicePromotional>();

    public virtual Store? Store { get; set; }
}
