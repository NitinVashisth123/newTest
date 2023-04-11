public class ContactAndLeadSearch {
     public static  List<List< sObject>> searchContactsAndLeads(string s)
     {    
         
         List<List<sobject>> records = [FIND :s IN ALL FIELDS RETURNING Contact(Name,Phone),LEAD(Name,Company)];
         system.debug(records);
        return records;
        //asdf
     }
    
}