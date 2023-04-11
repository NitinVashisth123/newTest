trigger countattachemets on Attachment (after insert,after delete) {
   
    
    List<Account> listAccs = [select id, name, (select id, name from Attachments)
                              from Account where Id IN :Trigger.newMap.keySet()];
 
     for(Account acc :  listAccs)
  {
   acc.no_of_attachements__c= acc.attachments.size();
  }
  update  listAccs;
    


}