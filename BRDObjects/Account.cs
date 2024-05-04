using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class Account
{
    public int Id { get; set; }

    public int LoyaltyPoints { get; set; }

    public int? CustomerId { get; set; }

    public int? StatusId { get; set; }

    public int? SecurityRoleId { get; set; }

    public virtual Customer? Customer { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();

    public virtual ICollection<ScheduleEntry> ScheduleEntries { get; set; } = new List<ScheduleEntry>();

    public virtual SecurityRole? SecurityRole { get; set; }

    public virtual RecordStatus? Status { get; set; }
}
