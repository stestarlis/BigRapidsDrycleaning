using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class Testimonial
{
    public int Id { get; set; }

    public string Subject { get; set; } = null!;

    public string Body { get; set; } = null!;

    public int? CustomerId { get; set; }

    public int? StoreId { get; set; }

    public bool? DisplayToPublic { get; set; }

    public bool? HideFromAdmin { get; set; }

    public virtual Customer? Customer { get; set; }

    public virtual Store? Store { get; set; }
}
