using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class Customer
{
    public int Id { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string? PhoneNumber { get; set; }

    public string? EmailAddress { get; set; }

    public int? AddressId { get; set; }

    public int? NotificationPreferenceId { get; set; }

    public string? PasswordHash { get; set; }

    public virtual ICollection<Account> Accounts { get; set; } = new List<Account>();

    public virtual Address? Address { get; set; }

    public virtual NotificationPreference? NotificationPreference { get; set; }

    public virtual ICollection<Testimonial> Testimonials { get; set; } = new List<Testimonial>();
}
