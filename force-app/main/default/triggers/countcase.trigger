trigger countcase on case(after insert, after delete) {
    
  Set<Id> setAccountIds = new Set<Id>();
 
 if(Trigger.isInsert)
  {   for(case con : Trigger.new)
   {
    setAccountIds.add(con.AccountId);
   }
   }
    if(Trigger.isDelete)
    {
    
    
   for(case con : Trigger.old)
   {
    setAccountIds.add(con.AccountId);
   }
   
    }
  
  List<Account> listAccs = [Select id,name,casecount__c ,(Select id from cases) from Account where Id in : setAccountIds];
  for(Account acc :listAccs)
  {
   acc.casecount__c= acc.cases.size();
  }
  update listAccs;

}