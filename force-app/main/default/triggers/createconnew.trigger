trigger createconnew on Account (after insert) {
    list<contact> con = new list<contact>();
    for(account acc : trigger.new)
    {
        contact c = new contact();
        c.AccountId=acc.id;
        c.LastName=acc.name;
        c.phone=acc.phone;
        con.add(c);
    }
    

}