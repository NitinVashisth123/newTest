public class ContactSearch {
    
    public static List<contact> searchForContacts(string Lname, string mpc)
    {
       List<contact> con = new List<contact>();
         List<contact> con2 = new List<contact>();
        con = [select id, lastName, firstname, MailingPostalCode from contact];
        for(contact c : con)
        {
            if(c.lastname==Lname && c.MailingPostalCode==mpc)
            {
                con2.add(c);
            }
        }
        return con2; 
    }

}