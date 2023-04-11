trigger uniqueidaccount on Account (before insert) {
    
   
    
    List<Account> listAccs = [select id, name from Account where Id IN :Trigger.newMap.keySet()];
  
     for(Account acc :  listAccs)
  {
   string str= acc.name; 
    Pattern MyPattern = Pattern.compile('^[A-Z0-9]{3}-[A-Z0-9]+-[A-Z0-9]{1}[2-9]{1}$--');
    Matcher MyMatcher = MyPattern.matcher(str);
     if(MyMatcher.matches())
     {
         acc.matchedpattern__c=acc.name;
         update  listAccs;
     }
      else{
          acc.name.addError('Condition does not match');
      }
  }
  insert  listAccs;

}