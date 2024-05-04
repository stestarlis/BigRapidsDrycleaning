using BRDObjects;
using BRDrycleaningDataAccess.Interfaces;

namespace BRDrycleaningDataAccess
{
    public class CustomerLoginVerifier
    {
        #region [Singleton]
        private static readonly Lazy<CustomerLoginVerifier> lazy = new(() => new());
        public static CustomerLoginVerifier Instance { get { return lazy.Value; } }
        private CustomerLoginVerifier() { }
        #endregion

        private IDataHooks _dataHooks = null!;

        /// <summary>
        /// Used mainly for testing.
        /// </summary>
        /// <param name="dataHooks"></param>
        /// <param name="forceDataHookRefresh">If running all tests (Spec and unit), this overcomes the singleton test issue.</param>
        public void InjectDataProvider(IDataHooks dataHooks, bool forceDataHookRefresh = false)
        {
            if (forceDataHookRefresh)
            {
                _dataHooks = null!;
            }

            _dataHooks ??= dataHooks ?? DataHooks.Instance;
        }

        public bool Login(Customer customerLoggingIn, string loginPassword)
        {
            if (_dataHooks == null)
            {
                InjectDataProvider(null!, true);
            }

            var databaseCustomer = _dataHooks!.GetAllCustomerAccounts()
                .FirstOrDefault(x => x.FirstName.Equals(customerLoggingIn.FirstName)
                    && x.LastName.Equals(customerLoggingIn.LastName));

            if (databaseCustomer == null)
            {
                return false;
            }

            return PasswordHasher.Verify(loginPassword, databaseCustomer!.PasswordHash!);
        }
    }
}
