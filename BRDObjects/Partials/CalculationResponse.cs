namespace BRDObjects
{
    public class CalculationResponse
    {
        public decimal Subtotal { get; private set; }
        public decimal Total { get; private set; }
        public decimal TaxAmount { get; private set; }
        public decimal AmountSaved { get; private set; }

        public CalculationResponse() { }

        public CalculationResponse(decimal subtotal, decimal total, decimal taxAmount, decimal amountSaved)
        {
            Subtotal = subtotal;
            Total = total;
            TaxAmount = taxAmount;
            AmountSaved = amountSaved;
        }

        public CalculationResponse WithSubtotal(decimal subtotal)
        {
            Subtotal = subtotal;
            return this;
        }

        public CalculationResponse WithTotal(decimal total)
        {
            Total = total;
            return this;
        }

        public CalculationResponse WithTaxAmount(decimal taxAmount)
        {
            TaxAmount = taxAmount;
            return this;
        }

        public CalculationResponse WithAmountSaved(decimal amountSaved)
        {
            AmountSaved = amountSaved;
            return this;
        }
    }
}
