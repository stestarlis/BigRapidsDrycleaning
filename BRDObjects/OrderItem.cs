using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class OrderItem
{
    public int Id { get; set; }

    public string? Notes { get; set; }

    public decimal Price { get; set; }

    public int? OrderId { get; set; }

    public int? ServiceItemTypeId { get; set; }

    public virtual Order? Order { get; set; }

    public virtual ICollection<OrderItemDiscount> OrderItemDiscounts { get; set; } = new List<OrderItemDiscount>();

    public virtual ICollection<OrderServicePromotional> OrderServicePromotionals { get; set; } = new List<OrderServicePromotional>();

    public virtual ServiceItemType? ServiceItemType { get; set; }
}
