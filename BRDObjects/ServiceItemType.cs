using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class ServiceItemType
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public bool? IsActive { get; set; }

    public decimal Price { get; set; }

    public int? ServiceId { get; set; }

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

    public virtual Service? Service { get; set; }
}
