namespace BRDObjects.Partials
{
    public class BRDEntity<T> where T : class
    {
        public static void Refresh()
        {
            var entity = Activator.CreateInstance(typeof(T))!;
            BrdryCleaningContext.Instance.Entry((T)entity).Reload();
        }

        public static async Task SaveAsync(T record, bool createRecord)
        {
            if (record == null)
            {
                return;
            }

            if (createRecord)
            {
                BrdryCleaningContext.Instance.Add(record);
            }
            else
            {
                BrdryCleaningContext.Instance.Update(record);
            }

            await BrdryCleaningContext.Instance.SaveChangesAsync();
        }

        public static async Task DeleteAsync(T record)
        {
            if (record == null)
            {
                return;
            }

            BrdryCleaningContext.Instance.Remove(record);
            await BrdryCleaningContext.Instance.SaveChangesAsync();
        }
    }
}
