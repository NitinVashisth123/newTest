public class RandomContactFactory {
    
    public static List<contact> generateRandomContacts(integer numcon, string CLname)
    {
        list<contact> con = new list<contact>();
        
        for(integer i=1;i<=numcon;i++)
        { 
            contact c = new contact();
            c.firstname=clname +' '+ i;
            //c.lastname=clname +' '+ i;
            con.add(c);
        }
       
        return con;
    }

}