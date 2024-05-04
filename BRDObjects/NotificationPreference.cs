using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class NotificationPreference
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public bool IsActive { get; set; }

    public virtual ICollection<Customer> Customers { get; set; } = new List<Customer>();
}
