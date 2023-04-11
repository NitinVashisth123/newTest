global class emailtolead implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail  email , Messaging.InboundEnvelope env)
    {
      Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        string myplainText = '';
        myplainText = email.plainTextBody;
        Lead[] leads=[Select Id, Name , Email from lead WHERE Email= :email.fromAddress];
        if(leads.size()==0)
        {
            Lead newLead = new Lead(Email= email.fromAddress, LastNAme = 'email.LastName' , company = 'email.company');
            insert newLead;
            system.debug('New Lead records: '+ newLead);
        }
        else{
            System.debug('Incoming email duplicates existing Lead records: '+leads);
            
        }
        result.success = true;
        return result;
    }

}