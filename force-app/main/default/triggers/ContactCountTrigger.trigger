Trigger ContactCountTrigger on Contact(After insert,after delete)
{
  Set<Id> setAccountIds = new Set<Id>();
    
    if(Trigger.isInsert)
    {      
   for(Contact con : Trigger.new)
   {
    setAccountIds.add(con.AccountId);
   }
    
    }
     if(Trigger.isDelete)
  {
   
   for(Contact con : Trigger.old) 
   {
    setAccountIds.add(con.AccountId);
   }
  }
  
  List<Account> listAccs = [Select id,name,no_of_saces__c ,(Select id from contacts) from Account where Id in : setAccountIds];
  for(Account acc :listAccs)
  {
   acc.no_of_saces__c = acc.contacts.size();
  }
  update listAccs;
}