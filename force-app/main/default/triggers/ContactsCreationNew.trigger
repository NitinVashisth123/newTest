trigger ContactsCreationNew on Account (after insert) {
     List<contact> con= new List<contact>();
    map<id,decimal> mapAcc = new map<id,decimal>();
    for(Account acc : trigger.new)
    {
        mapAcc.put(acc.id,acc.Number_of_Locations__c);
    }
     if(mapAcc.size()>0 && mapAcc!=Null)
     {
         for(id accId : mapAcc.keySet())
         {
             for(integer i=0;i<mapAcc.get(accId);i++)
             {
                 contact c = new contact();
                 
             }
         }
     }
    
}