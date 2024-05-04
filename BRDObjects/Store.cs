using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class Store
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public int? AddressId { get; set; }

    public virtual Address? Address { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();

    public virtual ICollection<Service> Services { get; set; } = new List<Service>();

    public virtual ICollection<Testimonial> Testimonials { get; set; } = new List<Testimonial>();
}
