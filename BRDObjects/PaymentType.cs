using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class PaymentType
{
    public int Id { get; set; }

    public string? Title { get; set; }

    public bool IsActive { get; set; }

    public virtual ICollection<MonetaryTransaction> MonetaryTransactions { get; set; } = new List<MonetaryTransaction>();
}
