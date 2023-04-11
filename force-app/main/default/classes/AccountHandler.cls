public class AccountHandler {
    public static account insertNewAccount(string s)
    {
       Account acct = new Account();
    try {

    
            acct.Name = s ;
    insert acct;
         return acct;
} catch (DmlException e) {
    acct = NUll;
}
        
return acct;
    }
}