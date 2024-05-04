using BRDObjects;
using BRDryCleaning.Models;
using BRDrycleaningDataAccess;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Text.RegularExpressions;

namespace BRDryCleaning.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            TempData["Services"] = DataHooks.Instance.GetAllServices();
            TempData["Stores"] = DataHooks.Instance.GetAllStores();
            TempData["StoreInfo"] = DataHooks.Instance.GetNonKeyStoreInfo();
            TempData["StoreHours"] = DataHooks.Instance.GetAllStoreHours();

            return View();
        }

        public IActionResult Community()
        {
            TempData["Promos"] = DataHooks.Instance.GetAllPromotionals();

            return View();
        }

        public IActionResult Feedback()
        {
            return View();
        }

        public IActionResult CreateAccount()
        {
            return View();
        }

        public IActionResult Login()
        {
            SystemState.Instance.Customer = null!;
            TempData["AlertMsg"] = null;
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpPost]
        public ActionResult LoginAction(Customer customer)
        {
            var emailRegex = new Regex(@"[a-zA-Z0-9]\w+@[a-zA-Z0-9]\w+.[a-zA-Z0-9]\w+");

            if (!string.IsNullOrWhiteSpace(customer.EmailAddress) && !emailRegex.IsMatch(customer.EmailAddress))
            {
                TempData["AlertMsg"] = "Email must be in the format: email@address.domain";
                return View(nameof(Login));
            }

            Customer.Refresh();
            var customerFromDatabase = DataHooks.Instance.GetCustomerByFilters(customer);

            if (customerFromDatabase == null)
            {
                TempData["AlertMsg"] = "Those credentials don't match our records";
                return View(nameof(Login));
            }

            var passwordConfirmed = CustomerLoginVerifier.Instance.Login(customerFromDatabase, customer.TemporaryPassword);

            if (customerFromDatabase == null || !passwordConfirmed)
            {
                TempData["AlertMsg"] = "Unable to login";
                return View(nameof(Login));
            }

            TempData["AlertMsg"] = null!;
            SystemState.Instance.Customer = customerFromDatabase;

            return RedirectPermanent("/Admin");
        }

        [HttpPost]
        public async Task<ActionResult> CreateAccountAction(string firstName, string lastName, string phoneNumber, string email, string confirmEmail, string password, string confirmPassword)
        {
            var customer = new Customer()
            {
                FirstName = firstName,
                LastName = lastName,
                PhoneNumber = phoneNumber,
                EmailAddress = email,
                ConfirmEmail = confirmEmail,
                TemporaryPassword = password,
                ConfirmPassword = confirmPassword
            };

            if (customer.EmailAddress != customer.ConfirmEmail ||
                customer.TemporaryPassword != customer.ConfirmPassword)
            {
                TempData["AlertMsg"] = "Email and Password fields must match their confirmation fields and not be empty.";
                return View(nameof(CreateAccount));
            }

            if (string.IsNullOrWhiteSpace(customer.ConfirmEmail) ||
                string.IsNullOrWhiteSpace(customer.ConfirmPassword) ||
                string.IsNullOrWhiteSpace(customer.EmailAddress) ||
                string.IsNullOrWhiteSpace(customer.TemporaryPassword) ||
                string.IsNullOrWhiteSpace(customer.FirstName) ||
                string.IsNullOrWhiteSpace(customer.LastName))
            {
                TempData["AlertMsg"] = "First and last name, email, and password fields are required.";
                return View(nameof(CreateAccount));
            }

            var existentCustomer = DataHooks.Instance.GetCustomerByFilters(customer);
            var salt = PasswordHasher.BuildRandomSalt();
            var passwordHash = PasswordHasher.SlowHash(customer!.TemporaryPassword!, salt);
            customer.TemporaryPassword = string.Empty;
            customer.ConfirmPassword = string.Empty;
            customer.PasswordHash = passwordHash;

            await Customer.SaveAsync(customer, existentCustomer == null);
            var newlyCreatedCustomer = DataHooks.Instance.GetCustomerByFilters(customer);
            var newlyCreatedAccount = DataHooks.Instance.CreateAccountAsync(newlyCreatedCustomer);

            TempData["AlertMsg"] = null!;
            return RedirectToAction(nameof(Login));
        }

        [HttpPost]
        public async Task<ActionResult> SubmitTestimonial(string subjectLine, string bodyText, int testimonialLocationID)
        {
            if (string.IsNullOrWhiteSpace(subjectLine) || string.IsNullOrWhiteSpace(bodyText) || testimonialLocationID <= 0) 
            {
                TempData["AlertMsg"] = "All fields are required.";
                TempData["SubmissionAlert"] = null;
                TempData["subjectLine"] = subjectLine;
                TempData["bodyText"] = bodyText;
                TempData["locationID"] = testimonialLocationID;
                return RedirectToAction(nameof(Feedback));
            }

            var testimonial = new Testimonial()
            {
                Subject = subjectLine,
                Body = bodyText,
                CustomerId = SystemState.Instance.Customer?.Id,
                HideFromAdmin = false,
                DisplayToPublic = false,
                StoreId = testimonialLocationID
            };

            await Testimonial.SaveAsync(testimonial, true);
            TempData["AlertMsg"] = null;
            TempData["subjectLine"] = null;
            TempData["bodyText"] = null;
            TempData["SubmissionAlert"] = "Thank you for submitting your feedback!";
            return RedirectToAction(nameof(Feedback));
        }
    }
}
