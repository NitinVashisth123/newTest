trigger CreateAccountContactNew on Account (after insert) {
    List<contact> con= new list<contact>();
    for(Account acc : trigger.new){
        if(acc.Industry=='Banking')
        {
            contact c = new contact();
            c.AccountId=acc.id;
            c.LastName=acc.Name;
            c.phone=acc.Phone;
            con.add(c);
        }
    }
    insert con;

}