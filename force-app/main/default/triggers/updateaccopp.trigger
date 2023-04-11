trigger updateaccopp on Account (before update, after update){
   
       
       List<Account> acclist = [select id, name, (select id,name from opportunities) 
                                                                from Account where Id IN :Trigger.newMap.keySet()];
    
    
   // map<ID,account> accopplist=new map<ID,account>(accList);
    for(account acc : acclist){
   for(opportunity opp : acc.opportunities)
   {
       if(opp.stagename=='closed lost')
       {
           acc.industry.addError('Stage is closed');
       }
        if(opp.stagename=='closed won')
       {
           acc.industry='Banking';
       }
       
   }
       
       }
    
}