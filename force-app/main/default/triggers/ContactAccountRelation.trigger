trigger ContactAccountRelation on Contact (before insert) {
    set<id> accId=new set<id>();
    for(contact con : trigger.new)
    {
        accId.add(con.AccountId);
    }
   
    map<id,account> amap= new map<id,account>([select name,phone from account where id in : accid]);
    for(contact con : trigger.new)
    {
        if(amap.containsKey(con.AccountId))
        {
            con.phone=amap.get(con.AccountId).phone;
        }
    }
       

}