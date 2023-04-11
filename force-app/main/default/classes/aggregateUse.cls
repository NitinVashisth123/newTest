public class aggregateUse {

    public static void m1(){
        aggregateresult a1 = [select sum(Account.count_contact__c) from contact where accountid='0015g00000F2YE1AAN'];
        system.debug('dsf'+a1);
    }
}