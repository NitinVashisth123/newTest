global class batchAccountUpdate implements Database.Batchable<sObject> {

   global Database.QueryLocator start(Database.BatchableContext BC) {

        String query = 'SELECT Id,Name FROM Account';

        return Database.getQueryLocator(query);

   }
    
    global void execute(Database.BatchableContext BC, List<Account> scope) {

       
    }   

   
    global void finish(Database.BatchableContext BC) {
        AsyncApexJob a = [Select Id,  CreatedBy.Email
        from AsyncApexJob where Id =:BC.getjobId()];
        
         Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {a.CreatedBy.Email};
            mail.setToAddresses(toAddresses);
            mail.setSubject('Presentation Details ');
            mail.setPlainTextBody('PRESENTATION' );
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        

    }

}