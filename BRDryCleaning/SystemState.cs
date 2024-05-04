using BRDObjects;
using BRDrycleaningDataAccess;

namespace BRDryCleaning
{
    /// <summary>
    /// Use singleton pattern (SystemState.Instance)
    /// </summary>
    public class SystemState
    {
        #region [Singleton]
        private static readonly Lazy<SystemState> lazy = new(() => new());
        public static SystemState Instance { get { return lazy.Value; } }
        private SystemState() { }
        #endregion

        public Customer Customer { get; set; } = default!;
        public bool FilterForNonStaff => (SecurityRole?.Title == "Guest" || SecurityRole?.Title == "Customer");
        public string LoginButtonText => Customer == null ? "Login" : "Log out";

        public List<string> Hours =
        [
            "12",
            "01",
            "02",
            "03",
            "04",
            "05",
            "06",
            "07",
            "08",
            "09",
            "10",
            "11",
        ];

        public List<string> Minutes =
        [
            "00",
            "15",
            "30",
        ];

        public List<string> TimeOfDay =
        [
            "AM",
            "PM",
        ];

        public List<string> StoreInformationKeys =
        [
            "FacebookLink",
            "TwitterLink",
            "Instagram",
            "AboutUs",
            "AboutUsSecondParagraph"
        ];

        private SecurityRole? SecurityRole => Customer?.Accounts.FirstOrDefault()?.SecurityRole;
    }
}
