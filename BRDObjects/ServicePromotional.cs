using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class ServicePromotional
{
    public int Id { get; set; }

    public string? Title { get; set; }

    public int? ServiceId { get; set; }

    public int? PromotionalId { get; set; }

    public virtual Promotional? Promotional { get; set; }

    public virtual Service? Service { get; set; }
}
