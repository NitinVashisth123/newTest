trigger oppup on Opportunity (before update) {

    set<Id> oppIdSet = new set<Id>();
    for(opportunity opp : trigger.new)
    {
        if(opp.Amount<>trigger.oldMap.get(opp.Id).Amount)
            oppIdSet.add(opp.Id);
    }
    
    for(opportunity opp : trigger.new)
    {
        if(oppIdSet.contains(opp.id)){
            if(opp.atype__c<>trigger.oldMap.get(opp.Id).atype__c)
            {
                opp.atype__c = 'newOpp';
            }
        }
    }
}