global class emailtocontact2 implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,Email FROM Contact where Email != null';
        return Database.getQueryLocator(query);
    }
    global String body='';
    global List<Contact> ContactList = new List<Contact>();
   global void execute(Database.BatchableContext BC, List<Contact> scope) {
     for(Contact a : scope)
     {
         ContactList.add(a);
     }

    List<Messaging.SingleEmailMessage> lstEmail = new List<Messaging.SingleEmailMessage>();
    
  

    for(Contact a:ContactList){
        
        Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
       
        list<string> toadd=new list<string>();
            toadd.add(a.Email);
        string b =  'MESSAGE FROM SAESFORCE' ; 
        body += b ;
        mail.setToAddresses(toadd);
        mail.setSubject('SALESFORCE MAIL');
        mail.setPlainTextBody('THIS MESSAGE IS FROM SALESFORCE');
        mail.setHtmlBody(body);
        lstEmail.add(mail);
    }
       
       Messaging.SendEmail(lstEmail,false);
      
}  

    global void finish(Database.BatchableContext BC) {
    
    }
 }