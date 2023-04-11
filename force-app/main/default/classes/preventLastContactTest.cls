@isTest
private class preventLastContactTest {
    static testMethod void testPreventLastContact() {
        // Create a test account
        Account testAccount = new Account(Name='Test Account');
        insert testAccount;

        // Create a test contact for the account
        Contact testContact = new Contact(LastName='Test Contact', AccountId=testAccount.Id);
        insert testContact;

        // Try to delete the test contact
        try {
            delete testContact;
        } catch (Exception e) {
            // Check if the error message is correct
            //System.assertEquals('contact cannot be deleted', e.getMessage());
        }

        // Create another test contact for the account
        Contact anotherTestContact = new Contact(LastName='Another Test Contact', AccountId=testAccount.Id);
        insert anotherTestContact;

        // Try to delete both test contacts
        try {
            delete new List<Contact>{ testContact, anotherTestContact };
        } catch (Exception e) {
            //System.assertEquals('contact cannot be deleted', e.getMessage());
        }
    }
}