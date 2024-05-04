using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class OrderItemDiscount
{
    public int Id { get; set; }

    public int? OrderItemId { get; set; }

    public int? DiscountId { get; set; }

    public virtual Discount? Discount { get; set; }

    public virtual OrderItem? OrderItem { get; set; }
}
