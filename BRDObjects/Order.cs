using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class Order
{
    public int Id { get; set; }

    public int? AccountId { get; set; }

    public DateTime CreatedDate { get; set; }

    public DateTime DropOffDate { get; set; }

    public DateTime EstimatedCompleteDate { get; set; }

    public string? Notes { get; set; }

    public int? StatusId { get; set; }

    public int? StoreId { get; set; }

    public virtual Account? Account { get; set; }

    public virtual ICollection<MonetaryTransaction> MonetaryTransactions { get; set; } = new List<MonetaryTransaction>();

    public virtual ICollection<OrderDiscount> OrderDiscounts { get; set; } = new List<OrderDiscount>();

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

    public virtual RecordStatus? Status { get; set; }

    public virtual Store? Store { get; set; }
}
