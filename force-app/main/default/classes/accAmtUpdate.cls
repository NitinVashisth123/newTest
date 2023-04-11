public class accAmtUpdate implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([Select Id,name,TotalOpportunityAmount__c,(select Id,name,Amount from opportunities) from account]);
    }
    
     public void execute(Database.BatchableContext bc, List<Account> scope){
         
         for (Account acc : scope) {
                 Decimal tSum=0;
            for (opportunity opp : acc.opportunities) {
               if(opp.Amount!=null) 
                tSum=tSum+opp.Amount;
            }
             acc.TotalOpportunityAmount__c=tSum;

        }
              update scope;
       }
     
    public void finish(Database.BatchableContext bc){
        
    }
}