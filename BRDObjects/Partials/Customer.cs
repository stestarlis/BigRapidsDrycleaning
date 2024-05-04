using BRDObjects.Partials;
using System.ComponentModel.DataAnnotations.Schema;

namespace BRDObjects
{
    public partial class Customer : BRDEntity<Customer>
    {
        [NotMapped]
        public string? TemporaryPassword { get; set; }

        [NotMapped]
        public string? ConfirmEmail { get; set; }

        [NotMapped]
        public string? ConfirmPassword { get; set; }

        public Customer() { }

        /// <summary>
        /// Use the Customer builder
        /// </summary>
        /// <param name="firstName"></param>
        /// <param name="lastName"></param>
        /// <param name="phoneNumber"></param>
        /// <param name="emailAddress"></param>
        /// <param name="passwordHash"></param>
        /// <param name="passwordSalt"></param>
        /// <param name="accounts"></param>
        /// <param name="address"></param>
        /// <param name="notificationPreference"></param>
        public Customer(string firstName, string lastName, string phoneNumber, string emailAddress, string passwordHash, byte[] passwordSalt, List<Account> accounts, Address address, NotificationPreference notificationPreference)
        {
            FirstName = firstName;
            LastName = lastName;
            PhoneNumber = phoneNumber;
            EmailAddress = emailAddress;
            PasswordHash = passwordHash;
            Accounts = accounts;
            Address = address;
            NotificationPreference = notificationPreference;
        }

        public Customer(string firstName, string lastName, string phoneNumber, string emailAddress)
        {
            FirstName = firstName;
            LastName = lastName;
            PhoneNumber = phoneNumber;
            EmailAddress = emailAddress;
        }

        public bool HasSecurityRole(string securityRoleName)
        {
            if (securityRoleName == null)
            {
                return false;
            }

            return Accounts.Any(x => x.SecurityRole?.Title!.Equals(securityRoleName) == true);
        }
    }
}
