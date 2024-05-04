using BRDObjects;
using BRDrycleaningDataAccess;
using BRDrycleaningDataAccess.Interfaces;
using FluentAssertions;
using NSubstitute;
using static BRDObjects.Statics.Enums;

namespace BRDryCleaningTests
{
    public class SpecificationTest
    {
        [Fact]
        public void BRDrycleaning_EndToEnd_SpecificationTest()
        {
            PasswordUtilityCases();
            OrderCalculationCases();
            OrderItemCalculationCases();
            OrderMonetaryTransactionCases();
            OrderFullyPaidCases();
            UserLoginCases();
            CustomerSecurityCases();
        }

        private static void CustomerSecurityCases()
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

        private static void UserLoginCases()
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

        private static void PasswordUtilityCases()
        {
            // Arrange
            var testPassword = $"NewPassword1x_$#";

            // Act
            var salt = PasswordHasher.BuildRandomSalt();
            var passwordHash = PasswordHasher.SlowHash(testPassword, salt);
            var verifiedPasswordHash = PasswordHasher.SlowHash(testPassword, salt);
            var passwordVerified = PasswordHasher.Verify(testPassword, passwordHash);

            // Assert
            passwordHash.Should().Be(verifiedPasswordHash);
            passwordVerified.Should().BeTrue(); // Seems redundant, but uses a diff verification through utilities itself.
        }

        private static void OrderCalculationCases()
        {
            // Arrange
            var order = new Order();
            var item1 = new OrderItem()
            {
                Price = 10.00m
            };
            var item2 = new OrderItem()
            {
                Price = 10.00m
            };
            var dollarDiscountType = new DiscountType()
            {
                Title = DiscountTypes.DollarAmount.ToString(),
                IsActive = true,
            };

            var percentDiscountType = new DiscountType()
            {
                Title = DiscountTypes.Percentage.ToString(),
                IsActive = true,
            };

            var dollarDiscount = new Discount()
            {
                DiscountType = dollarDiscountType,
                Amount = 1.00m
            };

            var percentDiscount = new Discount()
            {
                DiscountType = percentDiscountType,
                Amount = 1.00m
            };

            var orderDollarDiscount = new OrderDiscount()
            {
                Discount = dollarDiscount,
            };

            var orderPercentDiscount = new OrderDiscount()
            {
                Discount = percentDiscount
            };

            order.OrderItems.Add(item1);
            order.OrderItems.Add(item2);

            // Act
            var orderTotal = order.CalculateTotal().Total;

            // Adding discounts
            order.OrderDiscounts.Add(orderDollarDiscount);

            var dollarDiscountedOrderTotal = order.CalculateTotal().Total;

            order.OrderDiscounts.Add(orderPercentDiscount);
            var percentDiscountedOrderTotal = order.CalculateTotal().Total;

            // Assert
            orderTotal.Should().Be(order.OrderItems.Sum(x => x.Price));
            order.OrderItems.Should().HaveCount(2);
            dollarDiscountedOrderTotal.Should().Be(19.00m);
            percentDiscountedOrderTotal.Should().Be(18.81m);
        }

        private static void OrderItemCalculationCases()
        {
            // Arrange
            var order = new Order();
            var item1 = new OrderItem()
            {
                Price = 10.00m
            };
            var item2 = new OrderItem()
            {
                Price = 10.00m
            };

            // Discounts
            var dollarDiscountType = new DiscountType()
            {
                Title = DiscountTypes.DollarAmount.ToString(),
                IsActive = true,
            };

            var percentDiscountType = new DiscountType()
            {
                Title = DiscountTypes.Percentage.ToString(),
                IsActive = true,
            };

            var dollarDiscount = new Discount()
            {
                DiscountType = dollarDiscountType,
                Amount = 1.00m
            };

            var percentDiscount = new Discount()
            {
                DiscountType = percentDiscountType,
                Amount = 1.00m
            };

            var orderDollarDiscount = new OrderItemDiscount()
            {
                Discount = dollarDiscount,
            };

            var orderPercentDiscount = new OrderItemDiscount()
            {
                Discount = percentDiscount
            };

            item1.OrderItemDiscounts.Add(orderDollarDiscount);
            item2.OrderItemDiscounts.Add(orderPercentDiscount);
            order.OrderItems.Add(item1);
            order.OrderItems.Add(item2);

            // Act
            var discountedItemsTotal = order.CalculateTotal().Total;

            // Assert
            discountedItemsTotal.Should().Be(18.90m);
        }

        private static void OrderMonetaryTransactionCases()
        {
            // Arrange
            var monetaryTransactions = new List<MonetaryTransaction>()
            {
                new()
                {
                    AmountPaid = 50.00m
                },
                new()
                {
                    AmountPaid = 15.00m
                }
            };

            var order = new Order();
            order.MonetaryTransactions.As<List<MonetaryTransaction>>().AddRange(monetaryTransactions);

            // Act
            var amountPaid = order.CalculateAmountPaid();

            // Assert
            amountPaid.Should().Be(monetaryTransactions.Sum(x => x.AmountPaid));
        }

        private static void OrderFullyPaidCases()
        {
            // Arrange
            var monetaryTransactions = new List<MonetaryTransaction>()
            {
                new()
                {
                    AmountPaid = 50.00m
                },
                new()
                {
                    AmountPaid = 15.00m
                }
            };

            var item = new OrderItem()
            {
                Price = 65.00m
            };

            var order = new Order();
            order.OrderItems.Add(item);

            order.MonetaryTransactions.As<List<MonetaryTransaction>>().AddRange(monetaryTransactions);

            // Act
            var amountPaid = order.VerifyOrderPaid();

            // Assert
            amountPaid.Should().BeTrue();
        }
    }
}