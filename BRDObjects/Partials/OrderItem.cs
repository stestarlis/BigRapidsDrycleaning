using BRDObjects.Partials;
using static BRDObjects.Statics.Enums;

namespace BRDObjects
{
    public partial class OrderItem : BRDEntity<OrderItem>
    {
        public CalculationResponse CalculateItemPrice()
        {
            var workingSubtotal = Price;
            var workingTaxAmount = 0.00m;
            var workingDiscountTotal = 0.00m;
            var workingTotal = Price;

            if (OrderItemDiscounts.Count <= 0)
            {
                return new CalculationResponse()
                    .WithSubtotal(workingTotal)
                    .WithTotal(workingTotal)
                    .WithTaxAmount(workingTaxAmount)
                    .WithAmountSaved(workingDiscountTotal);
            }

            var dollarDiscounts = OrderItemDiscounts
                .Where(x => x.Discount!.DiscountType!.Title!.Equals(DiscountTypes.DollarAmount.ToString()))
                .ToList();

            dollarDiscounts.ForEach(x => workingSubtotal = ApplyDollarDiscount(x, workingSubtotal));

            var percentDiscounts = OrderItemDiscounts
                .Where(x => x.Discount!.DiscountType!.Title!.Equals(DiscountTypes.Percentage.ToString()))
                .ToList();

            percentDiscounts.ForEach(x => workingSubtotal = ApplyPercentDiscount(x, workingSubtotal));
            
            workingDiscountTotal = Price - workingSubtotal;

            if (ServiceItemType?.Service?.IsTaxable == true)
            {
                workingTaxAmount = (1 + (decimal)ServiceItemType!.Service!.TaxRate!) * workingTotal;
                workingTotal += workingTaxAmount;
            }
            else
            {
                workingTotal = workingSubtotal;
            }

            return new CalculationResponse()
                    .WithSubtotal(workingSubtotal)
                    .WithTotal(workingTotal)
                    .WithTaxAmount(workingTaxAmount)
                    .WithAmountSaved(workingDiscountTotal);
        }

        private decimal ApplyPercentDiscount(OrderItemDiscount discount, decimal workingTotal)
        {
            var amount = (discount.Discount!.Amount / 100) * workingTotal;

            return workingTotal -= amount;
        }

        private decimal ApplyDollarDiscount(OrderItemDiscount discount, decimal workingTotal)
        {
            return workingTotal -= discount.Discount!.Amount;
        }
    }
}
