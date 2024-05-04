using BRDObjects;
using BRDrycleaningDataAccess;
using Humanizer;
using Microsoft.AspNetCore.Mvc;

namespace BRDryCleaning.Controllers
{
    public class AdminController : Controller
    {
        public IActionResult Index()
        {
            TempData["PartialView"] = "Dashboard";
            return View();
        }

        public IActionResult Error()
        {
            return View();
        }

        #region Appointments
        public IActionResult Appointments()
        {
            TempData["PartialView"] = "CRUD/Appointments_Edit";
            return View("Index");
        }

        public IActionResult ReadAppointments()
        {
            TempData["AlertMsg"] = null;
            TempData["PartialView"] = "CRUD/Appointments";
            TempData["Appointments"] =
                SystemState.Instance.FilterForNonStaff ?
                DataHooks.Instance.GetAllCustomerScheduleEntries(SystemState.Instance.Customer.Accounts.First().Id) :
                DataHooks.Instance.GetAllScheduleEntries();
            TempData["MeetingTypes"] = DataHooks.Instance.GetAllMeetingTypes();
            TempData["MeetingPurposes"] = DataHooks.Instance.GetAllMeetingPurposes();

            return View("Index");
        }

        public IActionResult ToggleShowPastAppointments(bool showPastValues)
        {
            TempData["ShowPastValues"] = showPastValues;

            return RedirectToAction(nameof(ReadAppointments));
        }
        #endregion

        #region Services
        public IActionResult ReadServices()
        {
            TempData["PartialView"] = "CRUD/Services";
            TempData["myServices"] = DataHooks.Instance.GetAllServices();
            TempData["ServiceItemTypes"] = DataHooks.Instance.GetAllServiceItemTypes();
            TempData["Promotionals"] = DataHooks.Instance.GetAllPromotionals();
            TempData["myStores"] = DataHooks.Instance.GetAllStores();
            return View("Index");
        }

        public IActionResult EditService(int serviceID)
        {
            TempData["PartialView"] = "CRUD/Service_Edit";
            TempData["myService"] = DataHooks.Instance.GetServiceByID(serviceID);
            TempData["ServiceItemTypes"] = DataHooks.Instance.GetAllServiceItemTypes();
            TempData["Promotionals"] = DataHooks.Instance.GetAllPromotionals();
            TempData["Stores"] = DataHooks.Instance.GetAllStores();
            return View("Index");
        }

        public IActionResult ServiceDetails(int serviceID)
        {
            TempData["PartialView"] = "CRUD/Service_Detail";
            TempData["myService"] = DataHooks.Instance.GetServiceByID(serviceID);
            TempData["Stores"] = DataHooks.Instance.GetAllStores();
            return View("Index");
        }
        #endregion

        #region Promotional
        public IActionResult ReadPromotionals()
        {
            TempData["PartialView"] = "CRUD/Promotional";
            TempData["Promos"] = DataHooks.Instance.GetAllPromotionals();
            TempData["DiscountTypes"] = DataHooks.Instance.GetAllDiscountTypes();
            return View("Index");
        }

        public IActionResult EditPromotional(int promoID)
        {
            TempData["PartialView"] = "CRUD/Promotion_Edit";
            TempData["myPromo"] = DataHooks.Instance.GetPromotionalByID(promoID);
            TempData["DiscountTypes"] = DataHooks.Instance.GetAllDiscountTypes();
            return View("Index");
        }
        #endregion

        #region Orders 
        public IActionResult ReadOrders()
        {
            TempData["PartialView"] = "CRUD/Orders";
            TempData["AllOrders"] =
                SystemState.Instance.FilterForNonStaff ?
                DataHooks.Instance.GetAllCustomerOrders(SystemState.Instance.Customer.Accounts.First().Id) :
                DataHooks.Instance.GetAllOrders();

            TempData["Accounts"] =
                SystemState.Instance.FilterForNonStaff ?
                SystemState.Instance.Customer.Accounts.First() :
                DataHooks.Instance.GetAllAccounts();

            TempData["Statuses"] = DataHooks.Instance.GetAllRecordStatuses();
            TempData["ServiceItemTypes"] = DataHooks.Instance.GetAllServiceItemTypes();
            TempData["Discounts"] = DataHooks.Instance.GetAllDiscounts();
            TempData["PaymentTypes"] = DataHooks.Instance.GetAllPaymentTypes();
            return View("Index");
        }

        public IActionResult GetOrderDetails(int orderID)
        {
            TempData["PartialView"] = "CRUD/Order_Details";
            TempData["OrderDetails"] = DataHooks.Instance.GetOrderDetails(orderID);
            return View("Index");
        }

        public IActionResult EditOrder(int orderID)
        {
            TempData["PartialView"] = "CRUD/Order_Edit";
            TempData["myOrder"] = DataHooks.Instance.GetOrderDetails(orderID);
            TempData["Accounts"] = DataHooks.Instance.GetAllAccounts();
            TempData["Statuses"] = DataHooks.Instance.GetAllRecordStatuses();
            TempData["Discounts"] = DataHooks.Instance.GetAllDiscounts();
            TempData["ServiceItemTypes"] = DataHooks.Instance.GetAllServiceItemTypes();
            TempData["PaymentTypes"] = DataHooks.Instance.GetAllPaymentTypes();
            return View("Index");
        }

        #endregion

        #region Accounts and Customers
        public IActionResult CreateAccount()
        {
            return View();
        }

        public IActionResult ReadCustomers()
        {
            TempData["PartialView"] = "CRUD/Customers";
            TempData["AllCustomers"] = DataHooks.Instance.GetAllCustomerAccounts();
            return View("Index");
        }

        public IActionResult ReadAccounts()
        {
            TempData["PartialView"] = "CRUD/Accounts";
            TempData["AllAccounts"] = DataHooks.Instance.GetAllAccounts();
            return View("Index");
        }

        public IActionResult ResetPassword()
        {
            TempData["PartialView"] = "CRUD/PasswordManagement";
            return View("Index");
        }

        public IActionResult Customer_Edit()
        {
            TempData["PartialView"] = "CRUD/Customer_Edit";
            return View("Index");
        }
        #endregion

        #region Testimonials
        public IActionResult ReadTestimonials()
        {
            TempData["PartialView"] = "CRUD/Testimonials";
            TempData["AllTestimonials"] = DataHooks.Instance.GetAllTestimonials();
            return View("Index");
        }
        #endregion

        #region Settings 
        public IActionResult Settings()
        {
            TempData["discountTypes"] = DataHooks.Instance.GetAllDiscountTypes();
            TempData["meetingTypes"] = DataHooks.Instance.GetAllMeetingTypes();
            TempData["serviceItemTypes"] = DataHooks.Instance.GetAllServiceItemTypes();
            TempData["paymentType"] = DataHooks.Instance.GetAllPaymentTypes();
            TempData["storeInformation"] = DataHooks.Instance.GetNonKeyStoreInfo();
            TempData["stores"] = DataHooks.Instance.GetAllStores();
            TempData["storeInformationKeys"] = DataHooks.Instance.GetAllStoreInfoKeys();
            TempData["storeHours"] = DataHooks.Instance.GetAllStoreHours();
            TempData["PartialView"] = "CRUD/Settings";
            return View("Index");
        }
        #endregion

        #region Promotional POST
        [HttpPost]
        public async Task<ActionResult> NewPromo(string NewPromoTitle, string NewPromoPrice, bool NewPromoActiveStatus, int NewPromoDiscountItemID, List<int> OrderServicePromotionalIDs)
        {
            var addMe = new Promotional();
            addMe.Title = NewPromoTitle;
            addMe.Price = Convert.ToDecimal(NewPromoPrice);
            addMe.DiscountTypeId = NewPromoDiscountItemID;
            addMe.IsActive = NewPromoActiveStatus;

            await DataHooks.Instance.CreateNewPromo(addMe);

            TempData["PartialView"] = "CRUD/Promotional";
            return RedirectToAction("ReadPromotionals");
        }
        #endregion

        #region Service POST
        [HttpPost]
        public async Task<ActionResult> CreateService(string ServiceTitle, bool IsActive, decimal ServicePrice,
            bool IsTaxable, decimal TaxRate, List<int> ServicePromos, int locationID)
        {
            Service addMe = new Service();
            addMe.Title = ServiceTitle;
            addMe.IsActive = IsActive;
            addMe.Price = ServicePrice;
            addMe.IsTaxable = IsTaxable;
            addMe.TaxRate = TaxRate;
            addMe.StoreId = locationID;
            var saveResult = await DataHooks.Instance.CreateServiceAsync(addMe);

            foreach (var item in ServicePromos)
            {
                ServicePromotional servicePromotional = new ServicePromotional();
                servicePromotional.ServiceId = saveResult.Id;
                servicePromotional.PromotionalId = item;

                await DataHooks.Instance.CreateServicePromotionalAsync(servicePromotional);
            }

            TempData["PartialView"] = "CRUD/Services";
            return RedirectToAction("ReadServices");
        }

        [HttpPost]
        public async Task<ActionResult> EditServiceAsync(string submitButton, int ServiceID, string ServiceTitle, bool IsActive, decimal ServicePrice, bool IsTaxable, decimal TaxRate, int locationID)
        {
            switch (submitButton)
            {
                case "Save":
                    var saveResult = await DataHooks.Instance.UpdateService(ServiceID, ServiceTitle, IsActive, ServicePrice, IsTaxable, TaxRate, locationID);
                    TempData["saveResults"] = saveResult;
                    TempData["PartialView"] = "CRUD/Services";
                    return RedirectToAction("ReadServices");
                case "Delete":
                    await DataHooks.Instance.DeleteService(ServiceID);
                    TempData["PartialView"] = "CRUD/Services";
                    return RedirectToAction("ReadServices");
                default:
                    return RedirectToAction("ReadServices");
            }
        }
        #endregion

        #region Appointment POST
        [HttpPost]
        public async Task<ActionResult> CreateAppointment(string submitButton, string meetingType,
            string meetingPurpose, string appointmentNotes, string customerFirstName, string customerLastName,
            DateTime meetingStart, DateTime meetingEnd)
        {
            if (!SystemState.Instance.FilterForNonStaff &&
                (string.IsNullOrWhiteSpace(customerFirstName) ||
                string.IsNullOrWhiteSpace(customerLastName)))
            {
                TempData["AlertMsg"] = "First and last name are required.";
                return RedirectToAction(nameof(ReadAppointments));
            }

            switch (submitButton)
            {
                case "Save":
                    Customer customer;
                    Account account;

                    if (SystemState.Instance.FilterForNonStaff)
                    {
                        customer = SystemState.Instance.Customer;
                        account = DataHooks.Instance.GetAllAccounts()!.FirstOrDefault(x => x.CustomerId == customer?.Id)!;
                    }
                    else
                    {
                        customer = DataHooks.Instance.GetCustomerByFilters(customerFirstName, customerLastName)!;
                        account = DataHooks.Instance.GetAllAccounts().FirstOrDefault(x => x.CustomerId == customer?.Id)!;
                    }

                    if (customer == null || account == null)
                    {
                        TempData["AlertMsg"] = "Customer account not provided.";
                        return RedirectToAction(nameof(ReadAppointments));
                    }

                    var meetingTypeID = Convert.ToInt32(meetingType);
                    var meetingPurposeID = Convert.ToInt32(meetingPurpose);
                    var fetchedMeetingType = DataHooks.Instance.GetAllMeetingTypes().FirstOrDefault(x => x.Id == meetingTypeID);
                    var fetchedMeetingPurpose = DataHooks.Instance.GetAllMeetingPurposes().FirstOrDefault(x => x.Id == meetingPurposeID);

                    //The meeting ends on the same day - so just set the hours to the start date
                    DateTime endTime = meetingStart.Date.AddHours(meetingEnd.Hour);
                    endTime = endTime.AddMinutes(meetingEnd.Minute);

                    var appointment = new ScheduleEntry()
                    {
                        Notes = appointmentNotes,
                        AccountId = account?.Id,
                        MeetingTypeId = fetchedMeetingType?.Id,
                        MeetingPurposeId = fetchedMeetingPurpose?.Id,
                        MeetingType = fetchedMeetingType,
                        MeetingPurpose = fetchedMeetingPurpose,
                        MeetingStart = meetingStart,
                        MeetingEnd = endTime
                    };

                    await ScheduleEntry.SaveAsync(appointment, true);
                    break;
                default: break;
            }

            return RedirectToAction(nameof(ReadAppointments));
        }

        [HttpPost]
        public ActionResult LoadEditAppointment(int appointmentID, int meetingTypeID, int meetingPurposeID, string customerName)
        {
            TempData["customerName"] = customerName;
            TempData["meetingTypeID"] = meetingTypeID;
            TempData["meetingPurposeID"] = meetingPurposeID;
            TempData["scheduleEntryID"] = appointmentID;
            return RedirectToAction(nameof(Appointments));
        }

        [HttpPost]
        public async Task<ActionResult> UpdateAppointment(string submitButton, int AppointmentID,
    int MeetingTypeID, int MeetingPurposeID, string appointmentNotes, DateTime meetingStart, DateTime meetingEnd)
        {
            if (AppointmentID <= 0)
            {
                TempData["AlertMsg"] = "Appointment record could not be accessed.";
                return RedirectToAction(nameof(ReadAppointments));
            }

            var scheduleEntry = DataHooks.Instance.GetScheduleEntryByID(AppointmentID);
            if (scheduleEntry == null)
            {
                TempData["AlertMsg"] = "Appointment could not be fetched from the database.";
                return RedirectToAction(nameof(ReadAppointments));
            }

            switch (submitButton)
            {
                case "Save":
                    var fetchedMeetingType = DataHooks.Instance.GetAllMeetingTypes().FirstOrDefault(x => x.Id == MeetingTypeID);
                    var fetchedMeetingPurpose = DataHooks.Instance.GetAllMeetingPurposes().FirstOrDefault(x => x.Id == MeetingPurposeID);
                    var account = DataHooks.Instance.GetAllAccounts().FirstOrDefault(x => x.Id == scheduleEntry.AccountId);

                    //The meeting ends on the same day - so just set the hours to the start date


                    scheduleEntry.Id = AppointmentID;
                    scheduleEntry.Notes = appointmentNotes;
                    scheduleEntry.AccountId = account!.Id;
                    scheduleEntry.MeetingTypeId = fetchedMeetingType?.Id;
                    scheduleEntry.MeetingPurposeId = fetchedMeetingPurpose?.Id;
                    scheduleEntry.MeetingType = fetchedMeetingType;
                    scheduleEntry.MeetingPurpose = fetchedMeetingPurpose;

                    if (meetingStart.ToString() != "1/1/0001 12:00:00 AM")
                    {
                        DateTime endTime = meetingStart.Date.AddHours(meetingEnd.Hour);
                        endTime = endTime.AddMinutes(meetingEnd.Minute);
                        scheduleEntry.MeetingStart = meetingStart;
                        scheduleEntry.MeetingEnd = endTime;
                    }

                    await ScheduleEntry.SaveAsync(scheduleEntry, false);
                    break;
                case "Delete":
                    await ScheduleEntry.DeleteAsync(scheduleEntry!);
                    break;
            }

            return RedirectToAction(nameof(ReadAppointments));
        }

        #endregion

        #region Customer POST
        [HttpPost]
        public async Task<ActionResult> CreateCustomer(string submitButton, string CustomerFName,
            string CustomerLName, string CustomerPhone, string CustomerEmail, bool customerActiveStatus)
        {
            if (string.IsNullOrWhiteSpace(CustomerFName) ||
                string.IsNullOrWhiteSpace(CustomerLName) ||
                string.IsNullOrWhiteSpace(CustomerEmail))
            {
                TempData["AlertMsg"] = "First name, last name, and email are required.";
                return RedirectToAction(nameof(ReadCustomers));
            }

            var customer = new Customer(CustomerFName, CustomerLName, CustomerPhone, CustomerEmail);
            await Customer.SaveAsync(customer, true);

            customer = DataHooks.Instance.GetCustomerByFilters(customer);
            var account = new Account()
            {
                CustomerId = customer!.Id,
                SecurityRoleId = 5,
                StatusId = 1,
                LoyaltyPoints = 0
            };
            await Account.SaveAsync(account, true);
            return RedirectToAction(nameof(ReadCustomers));
        }

        [HttpPost]
        public ActionResult LoadEditCustomer(int CustomerID)
        {
            TempData["CustomerID"] = CustomerID;
            return RedirectToAction(nameof(Customer_Edit));
        }

        [HttpPost]
        public async Task<ActionResult> UpdateCustomer(string submitButton, int CustomerID, string firstName, string lastName, string phoneNumber, string email, string password, string confirmPassword, bool customerActiveStatus, int customerSecurityRole)
        {
            if (submitButton == "Cancel")
            {
                return RedirectToAction(nameof(ReadCustomers));
            }

            if (CustomerID <= 0)
            {
                TempData["AlertMsg"] = "Customer record could not be accessed.";
                return RedirectToAction(nameof(ReadCustomers));
            }

            if (password != confirmPassword)
            {
                TempData["AlertMsg"] = "Passwords much match.";
                return RedirectToAction(nameof(Customer_Edit));
            }

            var customer = DataHooks.Instance.GetCustomerByID(CustomerID);
            if (customer == null)
            {
                TempData["AlertMsg"] = "Customer could not be fetched from the database.";
                return RedirectToAction(nameof(ReadCustomers));
            }

            switch (submitButton)
            {
                case "Save":
                    customer.FirstName = firstName;
                    customer.LastName = lastName;
                    customer.PhoneNumber = phoneNumber;
                    customer.EmailAddress = email;
                    customer.Accounts.First().SecurityRoleId = customerSecurityRole;


                    if (!string.IsNullOrWhiteSpace(password) || !string.IsNullOrWhiteSpace(confirmPassword))
                    {
                        var salt = PasswordHasher.BuildRandomSalt();
                        var passwordHash = PasswordHasher.SlowHash(password, salt);
                        customer.PasswordHash = passwordHash;
                        customer.TemporaryPassword = string.Empty;
                        customer.ConfirmPassword = string.Empty;
                    }

                    await Customer.SaveAsync(customer, false);
                    break;
                case "Delete":
                    await Customer.DeleteAsync(customer!);
                    break;
            }

            return RedirectToAction(nameof(ReadCustomers));
        }

        [HttpPost]
        public async Task<ActionResult> SaveCustomerAddress(int customerID, int addressID, string addressLine1, string addressLine2, string addressLine3, string city, string state, string country, string postalCode)
        {
            if (string.IsNullOrWhiteSpace(addressLine1) ||
                    string.IsNullOrWhiteSpace(city) ||
                    string.IsNullOrWhiteSpace(state) ||
                    string.IsNullOrWhiteSpace(country) ||
                    string.IsNullOrWhiteSpace(postalCode))
            {
                TempData["AlertMsg"] = "Address form incomplete";
                return RedirectToAction(nameof(LoadEditCustomer), new { CustomerID = customerID });
            }

            var customer = DataHooks.Instance.GetCustomerByID(customerID);
            var address = customer?.Address;
            var addressExisted = address != null;

            address = addressExisted ? address : new();
            address!.AddressLine1 = addressLine1;
            address!.AddressLine2 = addressLine2;
            address!.AddressLine3 = addressLine3;
            address!.City = city;
            address!.State = state;
            address!.Country = country;
            address!.PostalCode = postalCode;

            await Address.SaveAsync(address, !addressExisted);

            if (!addressExisted)
            {
                var insertedAddress = DataHooks.Instance.GetAddressByFilters(address);
                customer.AddressId = insertedAddress?.Id;
                await Customer.SaveAsync(customer!, false);
            }

            return RedirectToAction(nameof(ReadCustomers));
        }


        [HttpPost]
        public async Task<ActionResult> TriggerResetPassword(Customer customer, string currentPassword)
        {
            if (customer.TemporaryPassword != customer.ConfirmPassword)
            {
                TempData["AlertMsg"] = "Passwords must match.";
                return RedirectToAction(nameof(ResetPassword));
            }

            var confirmed = PasswordHasher.Verify(currentPassword, SystemState.Instance.Customer!.PasswordHash!);

            if (!confirmed)
            {
                TempData["AlertMsg"] = "Your current password does not match our records.";
                return RedirectToAction(nameof(ResetPassword));
            }

            var salt = PasswordHasher.BuildRandomSalt();
            var passwordHash = PasswordHasher.SlowHash(customer!.TemporaryPassword!, salt);
            SystemState.Instance.Customer.PasswordHash = passwordHash;
            SystemState.Instance.Customer.TemporaryPassword = string.Empty;
            SystemState.Instance.Customer.ConfirmPassword = string.Empty;

            return RedirectToAction(nameof(Index));
        }
        #endregion

        #region Order POST
        [HttpPost]
        public async Task<ActionResult> CreateOrder(string submitButton, string dropOffDate,
            string dropOffHour, string dropOffMinute, string dropOffTimeOfDay, string finishedDate,
            string finishedHour, string finishedMinute, string finishedTimeOfDay, string OrderNotes,
            int StatusID, int AccountID, List<int> ServiceItemTypeID, List<int> DiscountItem)
        {
            var orderDate =
                DateTime.Parse($"{dropOffDate} {dropOffHour}:{dropOffMinute} {dropOffTimeOfDay}");
            var completeDate =
                DateTime.Parse($"{finishedDate} {finishedHour}:{finishedMinute} {finishedTimeOfDay}");

            switch (submitButton)
            {
                case "Create Order":
                    var addMe = new Order();
                    addMe.CreatedDate = DateTime.Now;
                    addMe.DropOffDate = orderDate;

                    addMe.EstimatedCompleteDate =
                        SystemState.Instance.FilterForNonStaff ?
                        addMe.DropOffDate.AddDays(7) :
                        completeDate;

                    addMe.Notes = OrderNotes;
                    addMe.StatusId =
                        SystemState.Instance.FilterForNonStaff ?
                        DataHooks.Instance.GetAllRecordStatuses().FirstOrDefault(x => x.Title == "Active")?.Id :
                        StatusID;
                    addMe.AccountId =
                        SystemState.Instance.FilterForNonStaff ?
                        SystemState.Instance.Customer?.Accounts.First().Id :
                        AccountID;

                    var saveResult = await DataHooks.Instance.CreateOrder(addMe);
                    var serviceItemTypes = DataHooks.Instance.GetAllServiceItemTypes();

                    foreach (var item in ServiceItemTypeID)
                    {
                        var orderItem = new OrderItem();
                        orderItem.OrderId = saveResult.Id;
                        orderItem.ServiceItemTypeId = item;
                        orderItem.ServiceItemType = serviceItemTypes.FirstOrDefault(x => x.Id == orderItem.ServiceItemTypeId);
                        orderItem.Price = orderItem.ServiceItemType.Price;

                        await DataHooks.Instance.CreateOrderItem(orderItem);
                    }

                    foreach (var item in DiscountItem)
                    {
                        var orderDiscount = new OrderDiscount();
                        orderDiscount.OrderId = saveResult.Id;
                        orderDiscount.DiscountId = item;

                        DataHooks.Instance.CreateOrderDiscount(orderDiscount);
                    }

                    TempData["PartialView"] = "CRUD/Orders";
                    return RedirectToAction("ReadOrders");
                case "Add Payment":
                    return RedirectToAction("ReadOrders");
                default:
                    return RedirectToAction("ReadOrders");
            }
        }

        [HttpPost]
        public async Task<ActionResult> EditOrderAsync(string submitButton, int OrderID, string OrderNotes,
            int StatusID, int AccountID, List<int> ServiceItemTypeID, List<int> DiscountItem, string PaymentAmount, int PaymentTypeID,
            string dropOffDate, string dropOffHour, string dropOffMinute, string dropOffTimeOfDay,
            string doneDate, string doneHours, string doneMinutes, string doneTimeOfDay, int? paymentID = null)
        {
            var orderDate =
                DateTime.Parse($"{dropOffDate} {dropOffHour}:{dropOffMinute} {dropOffTimeOfDay}");
            var completeDate =
                DateTime.Parse($"{doneDate} {doneHours}:{doneMinutes} {doneTimeOfDay}");

            switch (submitButton)
            {
                case "Save":
                    Order updateMe = new();
                    updateMe.Id = OrderID;
                    updateMe.DropOffDate = orderDate;
                    updateMe.EstimatedCompleteDate = completeDate;
                    updateMe.Notes = OrderNotes;
                    updateMe.StatusId = StatusID;
                    updateMe.AccountId = AccountID;

                    await DataHooks.Instance.UpdateOrder(updateMe, ServiceItemTypeID, DiscountItem);

                    TempData["PartialView"] = "CRUD/Orders";
                    return RedirectToAction("ReadOrders");
                case "Delete":
                    await DataHooks.Instance.DeleteOrder(OrderID);
                    TempData["PartialView"] = "CRUD/Orders";
                    return RedirectToAction("ReadOrders");
                case "Add Payment":
                    MonetaryTransaction addMe = new();
                    addMe.AmountPaid = Convert.ToDecimal(PaymentAmount);
                    addMe.OrderId = OrderID;
                    addMe.PaymentTypeId = PaymentTypeID;
                    if (addMe.AmountPaid > 0)
                    {
                        await DataHooks.Instance.CreateMonetaryTransaction(addMe);
                    }
                    return RedirectToAction("GetOrderDetails", new { orderID = OrderID });
                case "DeleteTransaction":
                    if (paymentID == null || paymentID <= 0)
                    {
                        return RedirectToAction(nameof(EditOrder), new { orderID = OrderID });
                    }

                    var payment = DataHooks.Instance.GetMonetaryTransactionByID((int)paymentID);

                    if (payment == null)
                    {
                        return RedirectToAction(nameof(EditOrder), new { orderID = OrderID });
                    }

                    await MonetaryTransaction.DeleteAsync(payment);
                    return RedirectToAction(nameof(EditOrder), new { orderID = OrderID });
                default:
                    return RedirectToAction("ReadOrders");
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddPayment(int orderID, int paymentTypeID, decimal paymentAmount)
        {
            if (orderID <= 0 || paymentTypeID <= 0 || paymentAmount <= 0)
            {
                TempData["AlertMsg"] = "Payment information incomplete";
                return RedirectToAction(nameof(EditOrder), new { orderID = orderID });
            }

            var paymentType = DataHooks.Instance.GetAllPaymentTypes().FirstOrDefault(x => x.Id == paymentTypeID);
            var isLoyaltyPayment = paymentType!.Title!.Contains("loyalty", StringComparison.OrdinalIgnoreCase);
            var account = DataHooks.Instance.GetAccountByOrderID(orderID);

            if (paymentType.Title.Contains("loyalty", StringComparison.OrdinalIgnoreCase) && account?.LoyaltyPoints <= 0)
            {
                isLoyaltyPayment = false;
                TempData["AlertMsg"] = "Unsufficient Loyalty Points.";
                return RedirectToAction(nameof(EditOrder), new { orderID = orderID });
            }

            var monetaryTransaction = new MonetaryTransaction()
            {
                OrderId = orderID,
                PaymentTypeId = paymentTypeID,
                AmountPaid = isLoyaltyPayment ? paymentAmount / 100 : paymentAmount
            };

            await MonetaryTransaction.SaveAsync(monetaryTransaction, true);

            if (isLoyaltyPayment)
            {
                var order = DataHooks.Instance.GetOrderByID(orderID).FirstOrDefault() ?? new();

                account.LoyaltyPoints -= (int)paymentAmount;

                if (account != null)
                {
                    await Account.SaveAsync(account, false);
                }
            }

            return RedirectToAction(nameof(EditOrder), new { orderID = orderID });
        }

        #endregion

        #region Store Info POST 

        [HttpPost]
        public async Task<ActionResult> UpdateStoreInfoRecord(string submitButton, int storeRecordID, string informationKey, string storeInfoValue)
        {
            if (storeRecordID <= 0 || string.IsNullOrWhiteSpace(informationKey))
            {
                TempData["AlertMsg"] = "The store information record could not be found for updatability.";
                return RedirectToAction(nameof(Settings));
            }

            var storeInformationRecord = DataHooks.Instance.GetNonKeyStoreInfo()
                .FirstOrDefault(x => x.Id == storeRecordID &&
                    x.InformationKey == informationKey
                );

            if (storeInformationRecord == null)
            {
                TempData["AlertMsg"] = "The store information record could not be found from the information key.";
                return RedirectToAction(nameof(Settings));
            }

            switch (submitButton)
            {
                case "Save":
                    storeInformationRecord.InformationValue = storeInfoValue;
                    await StoreInformation.SaveAsync(storeInformationRecord, false);
                    break;
            }

            return RedirectToAction(nameof(Settings));
        }

        [HttpPost]
        public async Task<ActionResult> AddStoreInformationRecord(int informationStoreID, string informationKey, string informationValue)
        {
            if (informationStoreID <= 0)
            {
                TempData["AlertMsg"] = "Store ID not found";
                return RedirectToAction(nameof(Settings));
            }

            var storeInformationRecord = new StoreInformation()
            {
                StoreId = informationStoreID,
                InformationKey = informationKey,
                InformationValue = informationValue
            };

            await StoreInformation.SaveAsync(storeInformationRecord, true);

            return RedirectToAction(nameof(Settings));
        }

        [HttpPost]
        public async Task<ActionResult> AddStoreInformationKey(string informationKey)
        {
            if (string.IsNullOrWhiteSpace("informationKey"))
            {
                TempData["AlertMsg"] = "Information key name is required.";
                return RedirectToAction(nameof(Settings));
            }

            var stores = DataHooks.Instance.GetAllStores();

            foreach (var store in stores)
            {
                var infoKey = new StoreInformation()
                {
                    StoreId = store.Id,
                    InformationKey = "StoreInformationKey",
                    InformationValue = informationKey
                };

                await StoreInformation.SaveAsync(infoKey, true);
            }

            return RedirectToAction(nameof(Settings));
        }

        [HttpPost]
        public async Task<ActionResult> UpdateHoursOfOperation(bool closedCheck, int storeHourID, TimeOnly storeCloseTime, TimeOnly storeOpenTime)
        {
            HoursOfOperation updateMe = new();
            updateMe.Id = storeHourID;

            if (!closedCheck)
            {
                updateMe.OpenTime = storeOpenTime;
                updateMe.CloseTime = storeCloseTime;
            }
            else
            {
                updateMe.OpenTime = null;
                updateMe.CloseTime = null;
            }


            var test = await DataHooks.Instance.UpdateHoursOfOp(updateMe);
            return RedirectToAction(nameof(Settings));
        }

        [HttpPost]
        public async Task<ActionResult> CreateHoursOfOperation(string dayOfWeek, int storeId, TimeOnly storeCloseTime, TimeOnly storeOpenTime)
        {
            HoursOfOperation updateMe = new();
            updateMe.StoreId = storeId;
            updateMe.DayOfWeek = dayOfWeek;
            updateMe.OpenTime = storeOpenTime;
            updateMe.CloseTime = storeCloseTime;

            await DataHooks.Instance.CreateHoursOfOp(updateMe);
            return RedirectToAction(nameof(Settings));
        }
        #endregion

        #region Testimonial POST 
        [HttpPost]
        public async Task<ActionResult> SetTestimonialResponse(string submitButton, int testimonialID)
        {
            var testimonial = DataHooks.Instance.GetAllTestimonials().First(x => x.Id == testimonialID);

            switch (submitButton)
            {
                case "toggle":
                    testimonial.DisplayToPublic = !testimonial.DisplayToPublic;
                    break;
                case "deny":
                    testimonial.HideFromAdmin = true;
                    break;
            }

            await Testimonial.SaveAsync(testimonial, false);
            return RedirectToAction(nameof(ReadTestimonials));
        }

        #endregion

    }
}
