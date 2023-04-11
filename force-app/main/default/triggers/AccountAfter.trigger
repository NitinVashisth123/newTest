trigger AccountAfter on Account (after insert) {
    List<contact> cons = new list<contact>();
    for(Account acc : trigger.new)
    {
        contact con = new contact();
        con.AccountId=acc.id;
        con.phone=acc.phone;
        con.LastName='Nitin';
        cons.add(con);
        
    }
    insert cons;
}