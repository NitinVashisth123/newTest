trigger preventLastContact on Contact (before delete) {
    set<id> accId = new set<id>();
    for(contact con : trigger.old)
    {
        accId.add(con.AccountId);
    }
    
    map<id,Account> accCon = new map<id,account>([select id,(select id from contacts where accountid in :accId) from Account where id in :accId]);
    
    for(contact con : trigger.old)
    {
        if(accCOn.get(con.AccountId).contacts.size()==1)
        {
            con.adderror('contact cannot be deleted');
        }
    }

}