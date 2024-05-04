using BRDObjects;

namespace BRDryCleaning.Models
{
    public class ObjectTypes
    {
        public virtual ICollection<DiscountType> DiscountTypes { get; set; } = new List<DiscountType>();
        public virtual ICollection<ServiceItemType> ServiceItemTypes { get; set; } = new List<ServiceItemType>();
        public virtual ICollection<PaymentType> PaymentTypes { get; set; } = new List<PaymentType>();
        public virtual ICollection<MeetingType> MeetingTypes { get; set; } = new List<MeetingType>();
        public virtual ICollection<RecordStatus> RecordStatus { get; set; } = new List<RecordStatus>();

    }
}
