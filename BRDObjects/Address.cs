using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class Address
{
    public int Id { get; set; }

    public string AddressLine1 { get; set; } = null!;

    public string? AddressLine2 { get; set; }

    public string? AddressLine3 { get; set; }

    public string City { get; set; } = null!;

    public string State { get; set; } = null!;

    public string Country { get; set; } = null!;

    public string PostalCode { get; set; } = null!;

    public virtual ICollection<Customer> Customers { get; set; } = new List<Customer>();

    public virtual ICollection<StoreInformation> StoreInformations { get; set; } = new List<StoreInformation>();

    public virtual ICollection<Store> Stores { get; set; } = new List<Store>();
}
