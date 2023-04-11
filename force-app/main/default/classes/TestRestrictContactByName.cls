@isTest
public class TestRestrictContactByName {
    
    @isTest public static void test(){
    contact con = new contact();
    con.LastName = 'INVALIDNAME';
        insert con;
   // system.assertEquals('The Last Name INVALIDNAME is not allowed for DML', 'The Last Name INVALIDNAME is not allowed for DML');   
    }

}