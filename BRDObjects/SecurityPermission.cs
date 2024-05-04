using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class SecurityPermission
{
    public int Id { get; set; }

    public string? Title { get; set; }

    public bool IsActive { get; set; }

    public virtual ICollection<SecurityRolePermission> SecurityRolePermissions { get; set; } = new List<SecurityRolePermission>();
}
