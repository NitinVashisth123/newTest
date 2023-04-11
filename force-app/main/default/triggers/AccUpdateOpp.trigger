trigger AccUpdateOpp on Account (after update) {
    Set<Id> accId = new set<Id>();
    for(Account acc : trigger.new)
    {
        if(acc.phone!=trigger.oldmap.get(acc.id).phone)
            accId.add(acc.id);
    }
    
    List<opportunity> oppList = [select id, name,accountId from opportunity where accountId in : accId];
    for(opportunity opp : oppList)
    {
        opp.Name=trigger.newMap.get(opp.AccountId).name;
    }

}