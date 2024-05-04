using BRDObjects;
using FluentAssertions;
using static BRDObjects.Statics.Enums;

namespace BRDryCleaningTests.UnitTests
{
    public class OrderItem_UnitTests
    {
        [Fact]
        public void OrderItem_WhenCalculatingTotalWithoutDiscountedItems_ThenSumItemPrices()
        {
            // Arrange
            var item = new OrderItem()
            {
                Price = 10.00m
            };

            // Act
            var itemTotal = item.CalculateItemPrice().Total;

            // Assert
            itemTotal.Should().Be(10.00m);
        }

        [Fact]
        public void OrderItem_WhenCalculatingTotalWithDollarAmountDiscount_ThenItemPriceIsLessTheDollarAmountDiscount()
        {
            // Arrange
            var item = new OrderItem()
            {
                Price = 10.00m
            };

            // Discounts
            var dollarDiscountType = new DiscountType()
            {
                Title = DiscountTypes.DollarAmount.ToString(),
                IsActive = true,
            };

            var dollarDiscount = new Discount()
            {
                DiscountType = dollarDiscountType,
                Amount = 1.00m
            };

            var orderDollarDiscount = new OrderItemDiscount()
            {
                Discount = dollarDiscount,
            };

            item.OrderItemDiscounts.Add(orderDollarDiscount);

            // Act
            var itemTotal = item.CalculateItemPrice().Total;

            // Assert
            itemTotal.Should().Be(9.00m);
        }

        [Fact]
        public void OrderItem_WhenCalculatingTotalWithPercentageAmountDiscount_ThenItemPriceIsLessThePercentageAmountDiscount()
        {
            // Arrange
            var item = new OrderItem()
            {
                Price = 10.00m
            };

            // Discounts
            var percentageDiscountType = new DiscountType()
            {
                Title = DiscountTypes.Percentage.ToString(),
                IsActive = true,
            };

            var percentageDiscount = new Discount()
            {
                DiscountType = percentageDiscountType,
                Amount = 1.00m
            };

            var orderDollarDiscount = new OrderItemDiscount()
            {
                Discount = percentageDiscount,
            };

            item.OrderItemDiscounts.Add(orderDollarDiscount);

            // Act
            var itemTotal = item.CalculateItemPrice().Total;

            // Assert
            itemTotal.Should().Be(9.90m);
        }
    }
}
