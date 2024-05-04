using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class Discount
{
    public int Id { get; set; }

    public string? Title { get; set; }

    public bool IsActive { get; set; }

    public decimal Amount { get; set; }

    public int? DiscountTypeId { get; set; }

    public virtual DiscountType? DiscountType { get; set; }

    public virtual ICollection<OrderDiscount> OrderDiscounts { get; set; } = new List<OrderDiscount>();

    public virtual ICollection<OrderItemDiscount> OrderItemDiscounts { get; set; } = new List<OrderItemDiscount>();
}
