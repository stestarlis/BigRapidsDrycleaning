using BRDObjects;

namespace BRDrycleaningDataAccess.Interfaces
{
    public interface IDataHooks
    {
        List<Customer> GetAllCustomerAccounts();
        List<Order> GetAllCustomerOrders(int customerAccountID);
        List<DiscountType> GetAllDiscountTypes();
        List<Promotional> GetAllPromotionals();
        List<Order> GetAllOrders();
        List<Order> GetOrderByID(int ID);
        Order GetOrderDetails(int orderID);
    }
}