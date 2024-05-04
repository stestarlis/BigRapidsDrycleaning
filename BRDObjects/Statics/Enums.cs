using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BRDObjects.Statics
{
    public class Enums
    {
        public enum DiscountTypes
        {
            Percentage,
            DollarAmount
        }

        public enum MeetingTypes
        {
            Onsite,
            VideoCall,
            PhoneCall
        }

        public enum MeetingPurposes
        {
            Inquiry,
            Complaint,
            Quote
        }

        public enum PaymentTypes
        {
            Cash,
            Check,
            Card,
            Loyalty,
            Complimentary
        }

        public enum ServiceItemTypes
        {
            DryClean,
            WetClean,
            Pressing,
            Rental,
            Tailoring
        }

        public enum RecordStatuses
        {
            Unknown,
            Active,
            Inactive,
            Flagged,
            Banned,
            Archived,
            Paid,
            Credited,
            Voided,
            Created,
            Updated
        }

        public enum SecurityRoles
        {
            Administrator,
            Customer,
            Clerk,
            Manager
        }

        public enum SecurityGates
        {
            AccessAdminPanel,
            AccessFinance,
            AccessUserManagement,
            AccessUserOrderHistory,
            AccessPromotionalsManagement,
            AccessDiscountsManagement,
            AccessSecurityManagement,
            AccessServiceManagement,
            AccessPaymentTypesManagement
        }
    }
}
