using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class MonetaryTransaction
{
    public int Id { get; set; }

    public decimal AmountPaid { get; set; }

    public int? OrderId { get; set; }

    public int? PaymentTypeId { get; set; }

    public virtual Order? Order { get; set; }

    public virtual PaymentType? PaymentType { get; set; }
}
