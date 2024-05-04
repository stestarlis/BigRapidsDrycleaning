using BRDObjects;
using FluentAssertions;
using static BRDObjects.Statics.Enums;

namespace BRDryCleaningTests.UnitTests
{
    public class Order_UnitTests
    {
        [Fact]
        public void Order_WhenCalculatingOrderTotal_ThenSumAllItems()
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
            var item3 = new OrderItem()
            {
                Price = 10.00m
            };

            order.OrderItems.Add(item1);
            order.OrderItems.Add(item2);
            order.OrderItems.Add(item3);

            // Act
            var orderTotal = order.CalculateTotal().Total;

            // Assert
            orderTotal.Should().Be(order.OrderItems.Sum(x => x.Price));
            order.OrderItems.Should().HaveCount(3);
        }

        [Fact]
        public void Order_WhenAddingItems_ThenOrderItemsShouldNotBeEmpty()
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

            order.OrderItems.Add(item1);
            order.OrderItems.Add(item2);

            // Act
            var orderItemsCount = order.OrderItems.Count;

            // Assert
            orderItemsCount.Should().Be(2);
        }

        [Fact]
        public void Order_WhenDiscountingAnOrderWithADollarDiscount_ThenDiscountsAreSubtractedFromOrderTotal()
        {
            // Arrange
            var discountType = new DiscountType()
            {
                Title = DiscountTypes.DollarAmount.ToString()
            };

            var discount = new Discount()
            {
                DiscountType = discountType,
                Amount = 1.00m
            };

            var orderDiscount = new OrderDiscount()
            {
                Discount = discount
            };

            var orderItem1 = new OrderItem()
            {
                Price = 10.00m
            };

            var order = new Order();

            order.OrderDiscounts.Add(orderDiscount);
            order.OrderItems.Add(orderItem1);

            // Act
            var orderTotal = order.CalculateTotal().Total;

            // Assert
            orderTotal.Should().Be(9.00m);
        }

        [Fact]
        public void Order_WhenDiscountingAnOrderWithAPercentDiscount_ThenDiscountsAreSubtractedFromOrderTotal()
        {
            // Arrange
            var discountType = new DiscountType()
            {
                Title = DiscountTypes.Percentage.ToString()
            };

            var discount = new Discount()
            {
                DiscountType = discountType,
                Amount = 1.00m
            };

            var orderDiscount = new OrderDiscount()
            {
                Discount = discount
            };

            var orderItem1 = new OrderItem()
            {
                Price = 10.00m
            };

            var order = new Order();

            order.OrderDiscounts.Add(orderDiscount);
            order.OrderItems.Add(orderItem1);

            // Act
            var orderTotal = order.CalculateTotal().Total;

            // Assert
            orderTotal.Should().Be(9.90m);
        }

        [Fact]
        public void Order_WhenCalculatingTotalWithDiscountedItems_ThenTotalShouldBeReducedByDiscountTypeAndAmount()
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

            // Act
            var orderTotal = order.CalculateTotal();

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

            var discountedItemsTotal = order.CalculateTotal().Total;

            // Assert
            discountedItemsTotal.Should().Be(18.90m);
        }

        [Fact]
        public void Order_WhenCalculatingAmountPaid_ThenTotalOfAllMonetaryTransactionsShouldBeSummed()
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

        [Fact]
        public void Order_WhenVerifyingOrderIsFullyPaidFor_ThenCalculateDifferenceBetweenTransactionsTotalAndOrderPriceTotal()
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
