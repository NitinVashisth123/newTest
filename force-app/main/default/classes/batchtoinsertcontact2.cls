global class batchtoinsertcontact2 implements Database.Batchable<sObject> {

   global Database.QueryLocator start(Database.BatchableContext BC) {

        String query = 'SELECT Id,Name FROM contact ';

        return Database.getQueryLocator(query);

   }

    
    global void execute(Database.BatchableContext BC , list<contact> scope) {
        
       
        
    }   

   
    global void finish(Database.BatchableContext BC) {
     
        
    }

}