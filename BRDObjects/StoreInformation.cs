using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class StoreInformation
{
    public int Id { get; set; }

    public string InformationKey { get; set; } = null!;

    public string InformationValue { get; set; } = null!;

    public int? StoreId { get; set; }

    public virtual Address? Store { get; set; }
}
