using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class DiscountType
{
    public int Id { get; set; }

    public string? Title { get; set; }

    public bool IsActive { get; set; }

    public virtual ICollection<Discount> Discounts { get; set; } = new List<Discount>();

    public virtual ICollection<Promotional> Promotionals { get; set; } = new List<Promotional>();
}
