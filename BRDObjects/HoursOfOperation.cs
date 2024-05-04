using System;
using System.Collections.Generic;

namespace BRDObjects
{
    public partial class HoursOfOperation
    {
        public int Id { get; set; }

        public string? DayOfWeek { get; set; }

        public TimeOnly? OpenTime { get; set; }

        public TimeOnly? CloseTime { get; set; }

        public int StoreId { get; set; }

        public virtual Store Store { get; set; } = null!;
    }
}