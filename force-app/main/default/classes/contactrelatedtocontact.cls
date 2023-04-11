@isTest
public class contactrelatedtocontact {
     static testMethod void TestMethodOne() 
    {
         Account ObjAcc = new Account();
        ObjAcc.name = 'Test';
        insert ObjAcc;
        
        list<contact> lstcon = new list<Contact>();
        
        Contact objcon1 = new Contact();
        objcon1.LastName = 'Test1';
        objcon1.Accountid = objAcc.id ;
        lstcon.add(objcon1);
        
        Contact objcon2 = new Contact();
        objcon2.LastName = 'Test2';
        objcon2.Accountid = objAcc.id ;
        lstcon.add(objcon2);
        
        insert lstcon;
        
        
    }

}