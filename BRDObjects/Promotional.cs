using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class Promotional
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public bool IsActive { get; set; }

    public decimal Price { get; set; }

    public int? DiscountTypeId { get; set; }

    public virtual DiscountType? DiscountType { get; set; }

    public virtual ICollection<OrderServicePromotional> OrderServicePromotionals { get; set; } = new List<OrderServicePromotional>();
}
