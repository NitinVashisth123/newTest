public class AccountListController {
   @AuraEnabled
    public static List<Account> getAccDetails(){
        
        return [Select Id,Name,Phone From Account Limit 30];
        }

}