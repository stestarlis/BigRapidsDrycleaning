using BRDObjects;
using FluentAssertions;
using BRDrycleaningDataAccess.Interfaces;
using NSubstitute;
using BRDrycleaningDataAccess;

namespace BRDryCleaningTests.UnitTests
{
    public class CustomerLoginVerifier_UnitTests
    {
        [Fact]
        public void CustomerLoginVerifier_WhenLoggingIn_ThenConfirmStoredPasswordSaltedHash()
        {
            // Arrange
            var testPassword = $"NewPassword1x_$#";
            var saltFromDatabase = PasswordHasher.BuildRandomSalt();
            var passHash = PasswordHasher.SlowHash(testPassword, saltFromDatabase);

            var databaseCustomer = new Customer()
            {
                FirstName = "Test",
                LastName = "Test",
                PasswordHash = passHash.ToString(),
                //PasswordSalt = saltFromDatabase,
            };

            var customerLoggingIn = new Customer()
            {
                FirstName = "Test",
                LastName = "Test",
                PasswordHash = passHash.ToString(),
            };

            var dataHooks = Substitute.For<IDataHooks>();
            dataHooks.GetAllCustomerAccounts().Returns(new List<Customer> { databaseCustomer });
            CustomerLoginVerifier.Instance.InjectDataProvider(dataHooks);

            // Act
            var customerConfirmedMatch = CustomerLoginVerifier.Instance.Login(customerLoggingIn, testPassword);

            // Assert
            customerConfirmedMatch.Should().BeTrue();
        }

        [Fact]
        public void CustomerLoginVerifier_WhenLoggingInWithUnregisteredCustomer_ThenFailPasswordVerification()
        {
            // Arrange
            var testPassword = $"NewPassword1x_$#";
            var saltFromDatabase = PasswordHasher.BuildRandomSalt();
            var passHash = PasswordHasher.SlowHash(testPassword, saltFromDatabase);

            var customerLoggingIn = new Customer()
            {
                FirstName = "Test",
                LastName = "Test",
                PasswordHash = passHash.ToString(),
            };

            var dataHooks = Substitute.For<IDataHooks>();
            dataHooks.GetAllCustomerAccounts().Returns([]);
            CustomerLoginVerifier.Instance.InjectDataProvider(dataHooks, true);

            // Act
            var customerConfirmedMatch = CustomerLoginVerifier.Instance.Login(customerLoggingIn, testPassword);

            // Assert
            customerConfirmedMatch.Should().BeFalse();
        }
    }
}
