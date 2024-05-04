using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class SecurityRole
{
    public int Id { get; set; }

    public string? Title { get; set; }

    public bool? IsActive { get; set; }

    public virtual ICollection<Account> Accounts { get; set; } = new List<Account>();

    public virtual ICollection<SecurityRolePermission> SecurityRolePermissions { get; set; } = new List<SecurityRolePermission>();
}
