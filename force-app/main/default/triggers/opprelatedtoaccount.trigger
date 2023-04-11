trigger opprelatedtoaccount on Opportunity (after insert, after delete) {
    
   List<Account> listAccs = [select id, name, (select id, name from opportunities)
                              from Account where Id IN :Trigger.newMap.keySet()];
 
     for(Account acc :  listAccs)
  {
   acc.oppcount__c= acc.opportunities.size(); 
    
  }
  update  listAccs;
    

}