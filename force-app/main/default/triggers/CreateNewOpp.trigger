trigger CreateNewOpp on Opportunity (before insert,before update) {
             List<Opportunity> OppList = new List<Opportunity>();
    Set<Id> acctSet = new Set<Id>();
    if(Trigger.isInsert && Trigger.isBefore)
    {        
        for(Opportunity opp : Trigger.new)
        {
            acctSet.add(opp.AccountId);
        }        
        Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id,Name, Type FROM Account WHERE Id IN: acctSet]);      
        List<Opportunity> oppList = new List<Opportunity>();
        System.debug('Keyset'+accountMap.keySet());
        for(Account acc : [SELECT ID,Name, Type FROM Account WHERE Id IN: accountMap.keySet()]) {
            for(Opportunity opp : Trigger.new) {
                opp.atype__c = acc.Type;
                opp.AccountId = acc.ID;
                oppList.add(opp);
            }
        }  
    }
    if(trigger.isUpdate) {
        Map<Id,Opportunity> oMap = new Map<Id,Opportunity>();
        oMap = trigger.oldMap;
        Opportunity gettype = [Select Id ,Account.Type From Opportunity where Id =:Trigger.new];
        system.debug('hdhdhdh'+gettype.Account.Type);
        for(Opportunity newOpp : trigger.new)
        {
            Opportunity oldOpp = new Opportunity();
            oldOpp = oMap.get(newOpp.Id);
            if(newOpp.AccountId != oldOpp.AccountId)
            {
                newOpp.atype__c =gettype.Account.Type;
            }
        }
    }
}