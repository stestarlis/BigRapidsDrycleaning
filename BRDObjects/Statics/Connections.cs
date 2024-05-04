using System.Net.NetworkInformation;

namespace BRDObjects.Statics
{
    public static class Connections
    {
        public static string GetDefaultConnection() => "Server=localhost;Database=BRDryCleaning;Trusted_Connection=True;TrustServerCertificate=True;";
        public static string GetEllisConnection() => "Server=MEDIASERVER\\SQLExpress;Database=BRDryCleaning;Trusted_Connection=true;TrustServerCertificate=true;Integrated Security=false;User ID=readOnlyUser; Password=Cyndaquil2023;";

        public static string GetConnection()
        {
            var useEllisConnection = PingHost("MEDIASERVER");
            return useEllisConnection ? GetEllisConnection() : GetDefaultConnection();
        }

        public static bool PingHost(string nameOrAddress)
        {
            bool pingable = false;
            Ping? pinger = null;

            try
            {
                pinger = new Ping();
                var reply = pinger.Send(nameOrAddress);
                pingable = reply.Status == IPStatus.Success;
            }
            catch (PingException)
            {
                // Discard PingExceptions and return false;
            }
            finally
            {
                pinger?.Dispose();
            }

            return pingable;
        }
    }
}
