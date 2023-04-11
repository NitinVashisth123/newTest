public class getaccountlist {

    @AuraEnabled
public static List<Account> GetAccount()
{
List<Account> lstAccount=[Select Id,Name,BillingState,BillingCity,Phone FROM Account];
return lstAccount;
} 
}