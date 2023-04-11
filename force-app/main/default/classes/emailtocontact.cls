global class emailtocontact implements Database.Batchable<sObject> {

   global Database.QueryLocator start(Database.BatchableContext BC) {

        String query = 'SELECT Id,Name,Email FROM Contact';

        return Database.getQueryLocator(query);

   }
    
    global void execute(Database.BatchableContext BC, List<contact> scope) {
       
        for(contact c:scope){     
           list<Messaging.SingleEmailMessage> maillist = new list<Messaging.SingleEmailMessage>();
            EmailTemplate emailTemp=[select Id,Subject,body from EmailTemplate where DeveloperName='contactemailtemp'];
            contact con=[select Id,Email from contact where LastName='vashisth82'];
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setTemplateId(emailTemp.id);
            mail.setTargetObjectId(con.id);
            maillist.add(mail);
            if(!maillist.isempty())
            {
                Messaging.sendEmail(maillist);
            }
         
        
        }

    }   

   
    global void finish(Database.BatchableContext BC) {
               
        

    }

}