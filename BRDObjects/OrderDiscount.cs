using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class OrderDiscount
{
    public int Id { get; set; }

    public int? OrderId { get; set; }

    public int? DiscountId { get; set; }

    public virtual Discount? Discount { get; set; }

    public virtual Order? Order { get; set; }
}
