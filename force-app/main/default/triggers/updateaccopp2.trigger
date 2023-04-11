trigger updateaccopp2 on Account (before update, after update) {
     List<Account> acclists = [select id, name, (select id,name from opportunities) 
                                                                from Account where Id IN :Trigger.newMap.keySet()];
      List<opportunity> opplist = [select id, name from opportunity where Id IN :Trigger.newMap.keySet()];
    
    for(Account acc :acclists)
        
  {
     
   if(acc.industry==Trigger.oldMap.get(acc.id).industry)
   {
       acc.industry.addError('same industry');
   }
       for(opportunity opp : opplist)
       {
           if(opp.stagename=='closed lost')
           {   acc.industry.addError(' stage is losed');
             }
            if(opp.stagename=='closed won')
           {   acc.industry='banking';
             }
} 
  }
  update acclists;
   
}