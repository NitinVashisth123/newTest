@isTest
public class createconnewhandler {

    @isTest
    static void testme()
    {    Integer size =[select count() from account];
         Integer count =[select count() from contact];
        account acc = new account(Name = 'nitin', phone ='9267964290');
        insert acc;
     
         Integer newsize =[select count() from account];
         Integer newcount =[select count() from contact];
         contact con = [select lastname, phone from contact where accountid=:acc.id];
         system.assertEquals(con.lastname, acc.name);
         system.assertEquals(con.phone, acc.phone);
     
       
    }
}