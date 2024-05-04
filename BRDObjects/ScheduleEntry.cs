using System;
using System.Collections.Generic;

namespace BRDObjects;

public partial class ScheduleEntry
{
    public int Id { get; set; }

    public int? AccountId { get; set; }

    public string? Notes { get; set; }

    public int? MeetingTypeId { get; set; }

    public int? MeetingPurposeId { get; set; }

    public DateTime? MeetingEnd { get; set; }

    public DateTime? MeetingStart { get; set; }

    public virtual Account? Account { get; set; }

    public virtual MeetingPurpose? MeetingPurpose { get; set; }

    public virtual MeetingType? MeetingType { get; set; }
}
