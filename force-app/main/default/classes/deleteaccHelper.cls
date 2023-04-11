public class deleteaccHelper {
    
    public static void deleteAcc(List<Account> accL)
    {
        set<id> acIdSet = new set<id>();
        for(Account acc : accL)
            acIdSet.add(acc.id);
        
        List<Account> accList = [select id,name, (select id,name from contacts) from Account where id in : acIdSet];
        
        for(Account acc : accList)
        {
            if(acc.contacts.size()>=2)
                acc.adderror('Account cannot be deleted');
        }
    }
    
}