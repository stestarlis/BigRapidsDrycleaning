using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class OrderServicePromotional
{
    public int Id { get; set; }

    public int? OrderItemId { get; set; }

    public int? PromotionalId { get; set; }

    public virtual OrderItem? OrderItem { get; set; }

    public virtual Promotional? Promotional { get; set; }
}
