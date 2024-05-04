using System.Diagnostics.CodeAnalysis;

namespace BRDObjects.Builders
{
    [ExcludeFromCodeCoverage]
    public class CustomerBuilder
    {
        private string _firstName = default!;
        private string _lastName = default!;
        private string _phoneNumber = default!;
        private string _emailAddress = default!;
        private string _passwordHash = default!;
        private byte[] _passwordSalt = default!;
        private List<Account> _accounts = default!;
        private Address _address = default!;
        private NotificationPreference _notificationPreference = default!;

        public CustomerBuilder WithFirstName(string firstName)
        {
            _firstName = firstName;
            return this;
        }

        public CustomerBuilder WithLastName(string lastName)
        {
            _lastName = lastName;
            return this;
        }

        public CustomerBuilder WithPhoneNumber(string phoneNumber)
        {
            _phoneNumber = phoneNumber;
            return this;
        }

        public CustomerBuilder WithEmailAddress(string emailAddress)
        {
            _emailAddress = emailAddress;
            return this;
        }

        public CustomerBuilder WithPasswordHash(string passwordHash)
        {
            _passwordHash = passwordHash;
            return this;
        }

        public CustomerBuilder WithPasswordSalt(byte[] passwordSalt)
        {
            _passwordSalt = passwordSalt;
            return this;
        }

        public CustomerBuilder WithAccounts(List<Account> accounts)
        {
            _accounts = accounts;
            return this;
        }

        public CustomerBuilder WithAddress(Address address)
        {
            _address = address;
            return this;
        }

        public CustomerBuilder WithNotificationPreference(NotificationPreference notificationPreference)
        {
            _notificationPreference = notificationPreference;
            return this;
        }

        public Customer BuildCustomer()
        {
            return new Customer(
                _firstName, 
                _lastName, 
                _phoneNumber, 
                _emailAddress, 
                _passwordHash, 
                _passwordSalt, 
                _accounts, 
                _address, 
                _notificationPreference
            );
        }
    }
}
