trigger ContactAccountRelation1 on Contact (before insert) {
    Set<Id> conIdSet = new set<Id>();
    for(Contact con : trigger.new)
    {
        if(String.isNotBlank(con.AccountId))
        {
            conIdSet.add(con.AccountId);
        }
            
    }
    
    Map<Id,Account> accMap = new Map<Id,Account>([select id,name,phone from Account where id in : conIdSet]);
    
  for(Contact con : trigger.new)
  {if(con.AccountId!=null && accMap.containsKey(con.AccountId))
      if(accMap.get(con.AccountId).phone!=Null)
      con.phone=accMap.get(con.AccountId).phone;
  }
}