public class DisplayListofRecordsUsingDataTable {
    @AuraEnabled
    public static list<Account> fetchaccRecords(){
        return [select id,Name,AccountNumber from Account Limit 10];        
    }

    @AuraEnabled

public static Account saveAccount (Account acc) {

upsert acc;
return acc;
}
}