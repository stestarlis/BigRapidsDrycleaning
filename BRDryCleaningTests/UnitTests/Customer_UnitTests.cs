using BRDObjects;
using FluentAssertions;
using static BRDObjects.Statics.Enums;

namespace BRDryCleaningTests.UnitTests
{
    public class Customer_UnitTests
    {
        [Fact]
        public void Customer_WhenCheckingForSecurityRole_ThenVerifySecurityBasedOnAccount()
        {
            // Arrange
            var securityRole = new SecurityRole()
            {
                Title = SecurityRoles.Administrator.ToString(),
                SecurityRolePermissions = new[]
                {
                    new SecurityRolePermission()
                    {
                         SecurityPermission = new SecurityPermission()
                         {
                              Title = SecurityGates.AccessAdminPanel.ToString(),
                         }
                    }
                }
            };

            var customer = new Customer()
            {
                FirstName = "Test",
                LastName = "Test"
            };

            var account = new Account()
            {
                SecurityRole = securityRole
            };

            customer.Accounts.Add(account);

            // Act
            var customerHasRole = customer.HasSecurityRole(SecurityRoles.Administrator.ToString());

            // Assert
            customerHasRole.Should().BeTrue();
        }

        [Fact]
        public void Customer_WhenCheckingForSecurityRoleNotOnAnyCustomerAccounts_ThenVerifySecurityBasedOnAccount()
        {
            // Arrange
            var securityRole = new SecurityRole()
            {
                Title = SecurityRoles.Administrator.ToString(),
                SecurityRolePermissions = new[]
                {
                    new SecurityRolePermission()
                    {
                         SecurityPermission = new SecurityPermission()
                         {
                              Title = SecurityGates.AccessAdminPanel.ToString()
                         }
                    }
                }
            };

            var customer = new Customer()
            {
                FirstName = "Test",
                LastName = "Test"
            };

            var account = new Account()
            {
                SecurityRole = securityRole
            };

            customer.Accounts.Add(account);

            // Act
            var customerHasRole = customer.HasSecurityRole(SecurityRoles.Clerk.ToString());

            // Assert
            customerHasRole.Should().BeFalse();
        }
    }
}
