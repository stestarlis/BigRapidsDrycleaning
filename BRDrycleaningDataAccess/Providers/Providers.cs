using BRDObjects;

namespace BRDrycleaningDataAccess.Providers
{
    public class AccountProvider : EntityProvider<Account>;
    public class AddressProvider : EntityProvider<Address>;
    public class CustomerProvider : EntityProvider<Customer>;
    public class DiscountProvider : EntityProvider<Discount>;
    public class DiscountTypeProvider : EntityProvider<DiscountType>;
    public class MeetingPurposeProvider : EntityProvider<MeetingPurpose>;
    public class MeetingTypeProvider : EntityProvider<MeetingType>;
    public class MonetaryTransactionProvider : EntityProvider<MonetaryTransaction>;
    public class NotificationPreferenceProvider : EntityProvider<NotificationPreference>;
    public class OrderProvider : EntityProvider<Order>;
    public class OrderDiscountProvider : EntityProvider<OrderDiscount>;
    public class OrderItemProvider : EntityProvider<OrderItem>;
    public class OrderItemDiscountProvider : EntityProvider<OrderItemDiscount>;
    public class OrderServicePromotionalProvider : EntityProvider<OrderServicePromotional>;
    public class PaymentTypeProvider : EntityProvider<PaymentType>;
    public class PromotionalProvider : EntityProvider<Promotional>;
    public class RecordStatusProvider : EntityProvider<RecordStatus>;
    public class ScheduleEntryProvider : EntityProvider<ScheduleEntry>;
    public class SecurityPermissionProvider : EntityProvider<SecurityPermission>;
    public class SecurityRoleProvider : EntityProvider<SecurityRole>;
    public class SecurityRolePermissionProvider : EntityProvider<SecurityRolePermission>;
    public class ServiceProvider : EntityProvider<Service>;
    public class ServiceItemTypeProvider : EntityProvider<ServiceItemType>;
    public class ServicePromotionalProvider : EntityProvider<ServicePromotional>;
}
