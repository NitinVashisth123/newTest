public class AccConTaskAura {
    
    
    @AuraEnabled
    public static List<Account> getAccDetails(){
        
        return [Select Id,Name,Phone From Account Limit 30];
        }
    
   @AuraEnabled
    public static List<Account> deleteAccount(String AccId)
    {
        Account delAccount=[Select Id from Account where id=:AccId];
        delete delAccount;
        return getAccDetails();
    } 
   

}