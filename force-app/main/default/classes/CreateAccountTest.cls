@isTest
private class CreateAccountTest {
    @isTest
    static void testCreateAcc() {
        Account acc = new Account(Name='Test Account', Phone='1234567890', AccountNumber='1234', Website='www.test.com');
     
        //Test.startTest();
        CreateAccount.createAcc(acc);
       // Test.stopTest();
        
        Account resultAcc = [SELECT Id, Name, Phone, AccountNumber, Website FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Test Account', resultAcc.Name, 'Unexpected account name');
        System.assertEquals('1234567890', resultAcc.Phone, 'Unexpected phone number');
        System.assertEquals('1234', resultAcc.AccountNumber, 'Unexpected account number');
        System.assertEquals('www.test.com', resultAcc.Website, 'Unexpected website');
    }
    
    @isTest
    static void testDisplayAcc() {
        Account acc1 = new Account(Name='Test Account 1', Phone='1234567890', AccountNumber='1234', Website='www.test1.com');
        Account acc2 = new Account(Name='Test Account 2', Phone='0987654321', AccountNumber='5678', Website='www.test2.com');
        insert acc1;
        insert acc2;

        //Test.startTest();
        List<Account> accs = CreateAccount.displayAcc();
       // Test.stopTest();
        
        System.assertEquals(2, accs.size(), 'Unexpected number of accounts');
        System.assertEquals('Test Account 1', accs[0].Name, 'Unexpected account name');
        System.assertEquals('Test Account 2', accs[1].Name, 'Unexpected account name');
    }
}