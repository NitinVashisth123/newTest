public class accountauraclr {
                @AuraEnabled
    public static List<Account> getAccountRecord()
   {
        return new List<Account>([Select id,Name,Phone,AnnualRevenue from Account]);
    }
   
   
}