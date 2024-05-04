using BRDObjects;
using BRDrycleaningDataAccess.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics.CodeAnalysis;
using System.Linq;

namespace BRDrycleaningDataAccess
{
    [ExcludeFromCodeCoverage]
    public class DataHooks : IDataHooks
    {
        #region [Singleton]
        private static Lazy<DataHooks> Lazy { get; } = new(() => new());
        public static DataHooks Instance { get { return Lazy.Value; } }
        public DataHooks() { }
        #endregion

        #region GET TYPES 
        public List<DiscountType> GetAllDiscountTypes() => BrdryCleaningContext.Instance.DiscountTypes.ToList();
        public List<ServiceItemType> GetAllServiceItemTypes() => BrdryCleaningContext.Instance.ServiceItemTypes.ToList();
        public List<MeetingType> GetAllMeetingTypes() => BrdryCleaningContext.Instance.MeetingTypes.ToList();
        public List<PaymentType> GetAllPaymentTypes() => BrdryCleaningContext.Instance.PaymentTypes.ToList();

        public List<MeetingPurpose> GetAllMeetingPurposes() => BrdryCleaningContext.Instance.MeetingPurposes.ToList();
        #endregion

        public List<Customer> GetAllCustomerAccounts() =>
            BrdryCleaningContext.Instance.Customers
            .Include(x => x.Address)
            .Include(x => x.Accounts)
                .ThenInclude(x => x.Orders)
            .ToList();

        public List<Account> GetAllAccounts() => BrdryCleaningContext.Instance.Accounts
            .Include(x => x.Customer)
            .Include(x => x.Status)
            .ToList();

        public List<Order> GetAllCustomerOrders(int customerAccountID) =>
            BrdryCleaningContext.Instance.Orders
            .Where(o => o.AccountId == customerAccountID)
            .Include(x => x.MonetaryTransactions)
            .ToList();

        public List<Order> GetOrderByID(int ID) => BrdryCleaningContext.Instance.Orders.Where(x => x.Id == ID)
            .Include(x => x.OrderItems)
            .Include(x => x.OrderDiscounts)
            .Include(x => x.MonetaryTransactions)
            .ToList();

        public List<ServicePromotional> GetAllServicePromotionals() => BrdryCleaningContext.Instance.ServicePromotionals
            .ToList();

        public List<Discount> GetAllDiscounts() => BrdryCleaningContext.Instance.Discounts
            .Include(x => x.DiscountType)
            .ToList();

        public List<ScheduleEntry> GetAllScheduleEntries() => BrdryCleaningContext.Instance.ScheduleEntries
            .Include(x => x.Account)
                .ThenInclude(x => x.Customer)
          .Include(x => x.MeetingPurpose)
          .Include(x => x.MeetingType)
          .ToList();

        public List<ScheduleEntry> GetAllCustomerScheduleEntries(int accountId) => BrdryCleaningContext.Instance.ScheduleEntries
            .Where(x => x.AccountId == accountId).Include(x => x.Account)
                .ThenInclude(x => x.Customer)
            .Include(x => x.MeetingPurpose)
            .Include(x => x.MeetingType)
            .ToList();

        public List<SecurityRole> GetAllSecurityRoles() => BrdryCleaningContext.Instance.SecurityRoles
          .Include(x => x.SecurityRolePermissions)
          .ToList();

        public List<MonetaryTransaction> GetAllTransactions() => BrdryCleaningContext.Instance.MonetaryTransactions
          .Include(x => x.Order)
          .ToList();

        public Promotional GetPromotionalByID(int ID) => BrdryCleaningContext.Instance.Promotionals
            .Include(x => x.DiscountType)
            .First(x => x.Id == ID);

        public ScheduleEntry GetScheduleEntryByID(int ID) => BrdryCleaningContext.Instance.ScheduleEntries
            .Where(x => x.Id == ID)
            .Include(x => x.MeetingPurpose)
            .Include(x => x.MeetingType)
            .Include(x => x.Account)
            .First(x => x.Id == ID);

        public List<SecurityRole> GetSecurityRolesById(int ID) => BrdryCleaningContext.Instance.SecurityRoles
            .Where(x => x.Id == ID)
          .Include(x => x.Accounts)
          .Include(x => x.SecurityRolePermissions)
          .ToList();

        public List<Order> GetOrdersByAccount(int accountId) => BrdryCleaningContext.Instance.Orders
            .Where(order => order.AccountId == accountId)
            .Include(x => x.MonetaryTransactions)
        .ToList();

        public SecurityRole? GetSecurityRolesByAccount(int accountId) => (SecurityRole?)BrdryCleaningContext.Instance.Accounts
            .Where(account => account.Id == accountId)
            .Select(x => x.SecurityRole);

        public List<MonetaryTransaction> GetTransactionsByAccount(int accountId) => BrdryCleaningContext.Instance.MonetaryTransactions
            .Include(order => order.Order)
            .ThenInclude(x => x!.Account).Where(x => x.Order!.Account!.Id == accountId)
            .ToList();

        public List<RecordStatus> GetAllRecordStatuses() => BrdryCleaningContext.Instance.RecordStatuses.ToList();

        #region SERVICE
        public Service GetServiceByID(int ID)
        {
            var myService = BrdryCleaningContext.Instance.Services
             .Include(x => x.ServicePromotionals)
             .FirstOrDefault(x => x.Id == ID);

            return myService!;
        }

        public List<Service> GetAllServices() => BrdryCleaningContext.Instance.Services
            .Include(x => x.ServiceItemTypes)
            .Include(x => x.ServicePromotionals)
            .ToList();

        public List<Store> GetAllStores() => BrdryCleaningContext.Instance.Stores
            .Include(x => x.Address)
            .ToList();

        public List<StoreInformation> GetAllStoreInfo() => BrdryCleaningContext.Instance.StoreInformations
            .ToList();

        public List<StoreInformation> GetAllStoreInfoKeys() => BrdryCleaningContext.Instance.StoreInformations
            .Where(x => x.InformationKey == "StoreInformationKey")
            .ToList();

        public List<StoreInformation> GetNonKeyStoreInfo() => BrdryCleaningContext.Instance.StoreInformations
            .Where(x => x.InformationKey != "StoreInformationKey")
            .ToList();

        public List<HoursOfOperation> GetAllStoreHours() => BrdryCleaningContext.Instance.HoursOfOperations
            .ToList();

        public async Task<Service> CreateServiceAsync(Service addMe)
        {
            try
            {
                await Service.SaveAsync(addMe, true);
                var retService = BrdryCleaningContext.Instance.Services.FirstOrDefault(c => c == addMe);
                return retService!;
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public async Task CreateServiceItemTypeAsync(ServiceItemType addMe)
        {
            try
            {
                await ServiceItemType.SaveAsync(addMe, true);
            }
            catch (Exception e)
            {
                return;
            }
        }

        public async Task CreateServicePromotionalAsync(ServicePromotional addMe)
        {
            try
            {
                await ServicePromotional.SaveAsync(addMe, true);
            }
            catch (Exception e)
            {
                return;
            }
        }

        public async Task<string> UpdateService(int ServiceID, string ServiceTitle, bool IsActive, decimal ServicePrice, bool IsTaxable, decimal TaxRate, int locationID)
        {
            var updateMe = BrdryCleaningContext.Instance.Services.FirstOrDefault(s => s.Id == ServiceID)!;
            if (updateMe == null)
            {
                return "Oopsie daisy! Something went wrong";
            }

            updateMe.Title = ServiceTitle;
            updateMe.IsActive = IsActive;
            updateMe.Price = ServicePrice;
            updateMe.IsTaxable = IsTaxable;
            updateMe.TaxRate = TaxRate;
            updateMe.StoreId = locationID;

            try
            {
                await Service.SaveAsync(updateMe, false);
                return "https://www.youtube.com/watch?v=MdN0NXgjsn8";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }

        public async Task<string> DeleteService(int serviceID)
        {
            var service = BrdryCleaningContext.Instance.Services.FirstOrDefault(x => x.Id == serviceID);
            if (service != null)
            {
                try
                {
                    await Service.DeleteAsync(service);
                    return "https://www.youtube.com/watch?v=MdN0NXgjsn8";
                }
                catch (Exception e)
                {
                    return e.Message;
                }

            }

            return "Oopsies - something went wrong";
        }
        #endregion

        #region ORDER 
        public List<Order> GetAllOrders() => BrdryCleaningContext.Instance.Orders
            .Include(x => x.Account)
                .ThenInclude(x => x.Customer)
            .Include(x => x.Status)
            .ToList();

        public List<Order> GetCustomerSpecificOrders(int accountId) => BrdryCleaningContext.Instance.Orders
            .Where(x => x.AccountId == accountId)
            .Include(x => x.Account)
            .Include(x => x.Status)
            .ToList();

        public Order GetOrderDetails(int orderID) => BrdryCleaningContext.Instance.Orders
             .Include(x => x.Account)
             .Include(x => x.Status)
             .Include(x => x.OrderDiscounts)
             .Include(x => x.OrderItems)
             .Include(x => x.MonetaryTransactions)
             .First(x => x.Id == orderID)!;

        public async Task<Order?> CreateOrder(Order addMe)
        {
            try
            {
                await Order.SaveAsync(addMe, true);
                var order = BrdryCleaningContext.Instance.Orders
                    .OrderByDescending(x => x.Id).FirstOrDefault();

                return order;
            }
            catch (Exception)
            {
                return null!;
            }
        }

        public async Task CreateOrderItem(OrderItem addMe)
        {
            try
            {
                await OrderItem.SaveAsync(addMe, true);
            }
            catch (Exception e)
            {
                return;
            }
        }

        public async void CreateOrderDiscount(OrderDiscount addMe)
        {
            try
            {
                await OrderDiscount.SaveAsync(addMe, true);
            }
            catch (Exception e)
            {
                return;
            }
        }

        public async Task CreateMonetaryTransaction(MonetaryTransaction addMe)
        {
            try
            {
                await MonetaryTransaction.SaveAsync(addMe, true);
            }
            catch (Exception e)
            {
                return;
            }
        }

        public async Task UpdateOrder(Order order, List<int> orderItems, List<int> orderDiscounts)
        {
            var updateMe = BrdryCleaningContext.Instance.Orders
                .Include(x => x.OrderItems)
                .Include(x => x.OrderDiscounts)
                .First(o => o.Id == order.Id);

            if (updateMe != null)
            {
                updateMe.CreatedDate = updateMe.CreatedDate;
                updateMe.AccountId = order.AccountId;
                updateMe.StatusId = order.StatusId;
                updateMe.DropOffDate = order.DropOffDate;
                updateMe.EstimatedCompleteDate = order.EstimatedCompleteDate;
                updateMe.Notes = order.Notes;

                await Order.SaveAsync(updateMe, false);

                // The following uses the base EF save structure because calling
                // SaveChanges in for/foreach loops is performance degrading.
                // Don't do it.
                List<int> oI = new();
                foreach (var item in updateMe.OrderItems)
                {
                    oI.Add(item.Id);
                }

                List<int> oD = new();
                foreach (var item in updateMe.OrderDiscounts)
                {
                    oD.Add(item.Id);
                }

                foreach (var item in orderItems)
                {
                    if (!oI.Contains(item))
                    {
                        OrderItem orderItem = new();
                        orderItem.OrderId = updateMe.Id;
                        orderItem.ServiceItemTypeId = item;
                        BrdryCleaningContext.Instance.OrderItems.Add(orderItem);
                    }
                }

                foreach (var item in orderDiscounts)
                {
                    if (!oD.Contains(item))
                    {
                        OrderDiscount discountItem = new();
                        discountItem.OrderId = updateMe.Id;
                        discountItem.DiscountId = item;
                        BrdryCleaningContext.Instance.OrderDiscounts.Add(discountItem);
                    }
                }

                BrdryCleaningContext.Instance.SaveChanges();
            }
        }

        public async Task DeleteOrder(int deleteID)
        {
            var deleteMe = BrdryCleaningContext.Instance.Orders.First(o => o.Id == deleteID);

            if (deleteMe != null)
            {
                await Order.DeleteAsync(deleteMe);
            }
        }
        #endregion

        #region PROMOTIONAL 
        public List<Promotional> GetAllPromotionals() => BrdryCleaningContext.Instance.Promotionals
            .Include(x => x.DiscountType)
            .ToList();

        public async Task CreateNewPromo(Promotional addMe)
        {
            try
            {
                await Promotional.SaveAsync(addMe, true);
            }
            catch (Exception e)
            {
                return;
            }
        }
        #endregion

        // Pls help
        public async Task<HoursOfOperation> UpdateHoursOfOp(HoursOfOperation updateMe)
        {
            HoursOfOperation test = BrdryCleaningContext.Instance.HoursOfOperations.First(x => x.Id == updateMe.Id);

            if (test != null)
            {
                test.OpenTime = updateMe.OpenTime;
                test.CloseTime = updateMe.CloseTime;

                await HoursOfOperation.SaveAsync(test, false);
                return test;
            }
            else
            {
                return null;
            }
        } 
        
        public async Task CreateHoursOfOp(HoursOfOperation updateMe)
        {
            var test = BrdryCleaningContext.Instance.HoursOfOperations.FirstOrDefault(x => x.DayOfWeek == updateMe.DayOfWeek && x.StoreId == updateMe.StoreId);

            if (test != null)
            {
                test.OpenTime = updateMe.OpenTime;
                test.CloseTime = updateMe.CloseTime;

                await HoursOfOperation.SaveAsync(test, false);
                await Task.CompletedTask;
            }
            else
            {
                await HoursOfOperation.SaveAsync(updateMe, true);
                await Task.CompletedTask;
            }
        }

        #region Customers and Accounts
        public Customer? GetCustomerByFilters(Customer customer)
        {
            var foundCustomer = BrdryCleaningContext.Instance.Customers
                .Include(x => x.Accounts)
                    .ThenInclude(x => x.SecurityRole)
                .FirstOrDefault(x =>
                    x.EmailAddress == customer.EmailAddress
                );

            return foundCustomer;
        }

        public Customer? GetCustomerByFilters(string firstName, string lastName)
        {
            var foundCustomer = BrdryCleaningContext.Instance.Customers
                .FirstOrDefault(x =>
                    x.FirstName == firstName &&
                    x.LastName == lastName
                );

            return foundCustomer;
        }

        public Customer? GetCustomerByID(int ID)
        {
            return BrdryCleaningContext.Instance.Customers
                .Include(x => x.Accounts)
                .FirstOrDefault(x => x.Id == ID);
        }

        public async Task<Account?> TryGetCustomerAccountAsync(string customerFirstName, string customerLastName)
        {
            if (string.IsNullOrWhiteSpace(customerFirstName) || string.IsNullOrWhiteSpace(customerLastName))
            {
                return null;
            }

            var existentCustomer = GetCustomerByFilters(customerFirstName, customerLastName);

            Account? customerAccount = default!;
            // Customer exists, return their account.
            if (existentCustomer != null)
            {
                customerAccount = GetAccountByCustomerID(existentCustomer.Id)!;
            }

            // If the account doesn't exist, then create it
            if (customerAccount == null)
            {
                customerAccount = await CreateAccountAsync(existentCustomer);
            }

            return customerAccount;
        }

        public async Task<Account?> CreateAccountAsync(Customer? customer)
        {
            var accountToCreate = new Account()
            {
                LoyaltyPoints = 0,
                CustomerId = customer!.Id,
                StatusId = 1,
                SecurityRoleId = 5
            };

            await Account.SaveAsync(accountToCreate, true);

            // Recurse the TryGetAccount
            return await TryGetCustomerAccountAsync(customer.FirstName, customer.LastName);
        }

        private Account? GetAccountByCustomerID(int id)
        {
            return BrdryCleaningContext.Instance.Accounts
                .FirstOrDefault(x => x.CustomerId == id);
        }

        public SecurityRole GetSecurityRoleByName(string roleName)
        {
            return BrdryCleaningContext.Instance.SecurityRoles.FirstOrDefault(x => x.Title == roleName)!;
        }

        public Account? GetAccountByOrderID(int orderID)
        {
            // It is known that this is an odd execution, 
            // but it should work for what we need.
            return BrdryCleaningContext.Instance.Accounts
                .Include(x => x.Orders)
                .FirstOrDefault(x => x.Orders!.FirstOrDefault(o => o.Id == orderID)!.Id == orderID);
        }

        public Customer? GetCustomerByAccountID(int? accountID)
        {
            if (accountID == null)
            {
                return null;
            }

            return BrdryCleaningContext.Instance.Accounts
                .Where(x => x.Id == accountID!)
                .Include(x => x.Customer)
                .Select(x => x.Customer)
                .First();
        }

        public Address? GetAddressByFilters(Address address)
        {
            return BrdryCleaningContext.Instance.Addresses
                .FirstOrDefault(x =>
                    x.AddressLine1.Equals(address.AddressLine1) &&
                    x.City.Equals(address.City) &&
                    x.State.Equals(address.State) &&
                    x.PostalCode.Equals(address.PostalCode));
        }

        #endregion

        public MonetaryTransaction? GetMonetaryTransactionByID(int paymentID)
        {
            return BrdryCleaningContext.Instance.MonetaryTransactions
                .FirstOrDefault(x => x.Id == paymentID);
        }

        public List<Testimonial> GetAllTestimonials() =>
            BrdryCleaningContext.Instance.Testimonials
            .Where(x => x.HideFromAdmin == false)
            .Include(x => x.Customer)
            .ToList();

        public List<OrderItem> GetOrderItemsByOrderID(int orderID) =>
            BrdryCleaningContext.Instance.OrderItems
            .Where(x => x.OrderId == orderID)
            .Include(x => x.ServiceItemType)
            .ToList();
    }
}
