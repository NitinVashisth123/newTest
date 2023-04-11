trigger CreateAccountContact on Account (after insert) {
    List<contact> con = new List<contact>();
    for(account acc : trigger.new)
    {
        if(acc.industry=='banking')
        {
         contact c = new contact();
            c.AccountId=acc.id;
            c.lastname=acc.name;
            c.Phone=acc.Phone;
            con.add(c);
        }
    }
  insert con;
}