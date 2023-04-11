trigger ContactsCreation on Account (after insert) {

    List<contact> con = new List<contact>();
    decimal l;
    for(account acc : trigger.new)
    {    integer p=0;
        l=acc.location__c;
        while(p!=l)
        {
            contact c = new contact();
            c.lastname='test '+p;
            p++;
            con.add(c);
            
        }
    }
    system.debug(con);
    insert con;
    
}