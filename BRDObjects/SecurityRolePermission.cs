using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class SecurityRolePermission
{
    public int Id { get; set; }

    public int? SecurityPermissionId { get; set; }

    public bool IsActive { get; set; }

    public int? SecurityRoleId { get; set; }

    public virtual SecurityPermission? SecurityPermission { get; set; }

    public virtual SecurityRole? SecurityRole { get; set; }
}
