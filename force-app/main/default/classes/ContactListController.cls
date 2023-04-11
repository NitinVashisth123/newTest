public class ContactListController {
    
    @AuraEnabled
    public static List<contact> getcontactlist(string accId)
    {
        List <contact> contactList =new List<contact>([select id,firstname,lastname,email ,phone from contact where email!= null AND accountId=:accId limit 2]);
        return contactList;
    }
    
    @AuraEnabled
    public static contact createContact(contact con, Id accountId)
    {
        con.AccountId=accountId;
        insert con;
        return con;
    }

}