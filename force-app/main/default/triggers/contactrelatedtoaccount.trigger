trigger contactrelatedtoaccount on Contact (after insert, after delete, after update) {
     Set<Id> setAccountIds = new Set<Id>();
 
 if(Trigger.isInsert)
  {   for(contact con : Trigger.new)
   {
    setAccountIds.add(con.AccountId);
   }
   }
    
 if(Trigger.isupdate)
  {   for(contact con : Trigger.new)
   {
    setAccountIds.add(con.AccountId);
   }
   }
    if(Trigger.isDelete)
    {
    
    
   for(contact con : Trigger.old)
   {
    setAccountIds.add(con.AccountId);
   }
   
    }
  
  List<Account> listAccs = [Select id,name,Numberofcontacts__c ,(Select id from contacts) from Account where Id in : setAccountIds];
  for(Account acc :listAccs)
  {
   acc.Numberofcontacts__c= acc.contacts.size();
  }
  update listAccs;
  for(Account acc :listAccs)
  {
   acc.Numberofcontacts__c= acc.contacts.size();
  }

}