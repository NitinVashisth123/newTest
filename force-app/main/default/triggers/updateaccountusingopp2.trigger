trigger updateaccountusingopp2 on Opportunity (before insert) {
    if(trigger.isUpdate){
    List<Account> acc=new List<Account>();
      for (opportunity opp : Trigger.new)
      {
          
      }
    }
}