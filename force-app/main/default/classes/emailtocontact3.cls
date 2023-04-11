global class emailtocontact3 implements Database.Batchable<sObject> {

     global Database.QueryLocator start(Database.BatchableContext bc){

     string sq='select id,Name,Email from Contact';
     system.debug('******'+sq);
     return Database.getQueryLocator(sq);
     }

     global  void execute(Database.BatchableContext bc, List<Contact> lst){
  list<Messaging.SingleEmailMessage> mail = new list<Messaging.SingleEmailMessage>();
          for(Contact c: lst){
            Messaging.SingleEmailMessage objEmail = new Messaging.SingleEmailMessage();
            list<string> toadd=new list<string>();
            toadd.add(c.Email);
            system.debug('*****'+c.Email);
            objEmail.settoaddresses(toadd);
            system.debug('*****'+toadd);
            objEmail.setsubject('birthday wishes');
            objEmail.setplaintextbody('happy birthday '+c.Name);
            mail.add(objEmail);            
          }           
   Messaging.sendEmail(mail,false);
    
      } 

     global void finish(Database.BatchableContext BC){
     System.debug(BC);
     }
}