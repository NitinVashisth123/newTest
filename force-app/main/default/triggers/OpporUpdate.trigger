trigger OpporUpdate on Opportunity (before insert) {

    map<id,opportunity> oppold = Trigger.oldmap;
    map<id,opportunity> oppnew = Trigger.newmap;
    set<id> keys=oppold.keyset();
    for(id rid : keys)
    {
        opportunity oldopportunity = oppold.get(rid);
        opportunity newopportunity = oppnew.get(rid);
        if(oldopportunity.stagename!='closed won ' && newopportunity.stagename=='closed won')
        {
            newopportunity.closedate=system.today();
            newopportunity.type='New customer';
        }
    }
}