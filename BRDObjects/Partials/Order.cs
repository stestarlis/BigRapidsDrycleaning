using BRDObjects.Partials;
using System.ComponentModel.DataAnnotations;
using System.Net.Http.Headers;
using static BRDObjects.Statics.Enums;

namespace BRDObjects
{
    public partial class Order : BRDEntity<Order>
    {
        public CalculationResponse CalculateTotal()
        {
            var response = new CalculationResponse();
            response.WithTotal(CalculateItemTotals().Subtotal);
            response.WithTotal(ApplyOrderDiscounts(response.Total).Total);

            return response;
        }

        private CalculationResponse CalculateItemTotals()
        {
            var workingTotal = 0.00m;
            var workingSubtotal = 0.00m;
            var workingTaxTotal = 0.00m;
            var workingAmountSaved = 0.00m;

            var listOfItems = OrderItems.ToList();
            listOfItems.ForEach(x => workingTotal += x.CalculateItemPrice().Subtotal);

            foreach (var item in listOfItems)
            {
                var itemValues = item.CalculateItemPrice();

                workingSubtotal += itemValues.Subtotal;
                workingTaxTotal += itemValues.TaxAmount;
                workingAmountSaved += itemValues.AmountSaved;
                workingTotal += itemValues.Total;
            }

            return new CalculationResponse()
                .WithSubtotal(workingSubtotal)
                .WithAmountSaved(workingAmountSaved)
                .WithTaxAmount(workingTaxTotal)
                .WithTotal(workingTotal);
        }

        private CalculationResponse ApplyOrderDiscounts(decimal itemSum)
        {
            var workingTotal = itemSum;
            if (OrderDiscounts.Count <= 0)
            {
                return new CalculationResponse()
                    .WithTotal(itemSum);
            }

            var dollarDiscounts = OrderDiscounts
                .Where(x => x.Discount!.DiscountType!.Title!.Equals(DiscountTypes.DollarAmount.ToString()))
                .ToList();

            dollarDiscounts.ForEach(x => workingTotal = ApplyDollarDiscount(x, workingTotal));

            var percentDiscounts = OrderDiscounts
                .Where(x => x.Discount!.DiscountType!.Title!.Equals(DiscountTypes.Percentage.ToString()))
                .ToList();

            percentDiscounts.ForEach(x => workingTotal = ApplyPercentDiscount(x, workingTotal));
            var discountTotal = itemSum - workingTotal;


            return new CalculationResponse()
                .WithAmountSaved(discountTotal)
                .WithTotal(workingTotal);
        }

        private decimal ApplyPercentDiscount(OrderDiscount discount, decimal workingTotal)
        {
            var amount = (discount.Discount!.Amount / 100) * workingTotal;

            return workingTotal -= amount;
        }

        private decimal ApplyDollarDiscount(OrderDiscount discount, decimal workingTotal)
        {
            return workingTotal -= discount.Discount!.Amount;
        }

        public decimal CalculateAmountPaid()
        {
            return MonetaryTransactions.Sum(x => x.AmountPaid);
        }

        public bool VerifyOrderPaid()
        {
            var orderTotal = CalculateTotal().Total;
            var paidTotal = CalculateAmountPaid();

            return orderTotal == paidTotal;
        }
    }
}
