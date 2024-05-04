using BRDObjects;

namespace BRDrycleaningDataAccess.Providers
{
    public class EntityProvider<T> where T : class
    {
        public void Save(BrdryCleaningContext context, T record, bool createCustomer)
        {
            TriggerGenericObjectFunction("SaveAsync", record, [context, createCustomer]);
        }

        public void Delete(BrdryCleaningContext context, T record)
        {
            TriggerGenericObjectFunction("DeleteAsync", record, [context, record]);
        }

        private void TriggerGenericObjectFunction(string methodName, object genericObject, object[] parameters)
        {
            var method = typeof(T).GetMethod(methodName);

            if (method == null)
            {
                return;
            }

            if (parameters == null || parameters.Length == 0)
            {
                method.Invoke(genericObject, null);
                return;
            }

            method.Invoke(genericObject, parameters);
        }
    }
}
