global class batchtclass implements Database.Batchable<sObject> {

       global Database.QueryLocator start(Database.BatchableContext BC)

       {

        String query = 'SELECT Id,Numberofcontacts__c FROM Contact ';

         return Database.getQueryLocator(query);

        }

 

       global void execute(Database.BatchableContext BC, List<Contact> scope)

      {

    //  List <Contact> oppnew = new List<Contact>(); 
        
       for(Contact c:scope){
           
           if(c.Numberofcontacts__c<10){
              
               
               c.Numberofcontacts__c=c.Numberofcontacts__c+1;
               
           }
            if(c.Numberofcontacts__c==null){
                   c.Numberofcontacts__c=1;
               }
       
          update scope;

      // oppnew.add(opp);
        //   opp.Count__c =oppnew.size();
           
      }

       

      // insert oppnew;

       } 

 

       global void finish(Database.BatchableContext BC)

      {

 

     }

       }