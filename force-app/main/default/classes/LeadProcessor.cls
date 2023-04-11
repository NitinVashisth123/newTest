public without sharing class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {

   public integer count=0;
    public Database.QueryLocator start(Database.BatchableContext dbc)
    {
        return Database.getQueryLocator([select id from lead]);
    }
    
    public void execute(Database.BatchableContext bdc, list<lead> leads)
    {
        for(lead l : leads)
        {
            l.leadsource='Dreamforce';
        }
        update leads;
        count = count + 1;
    }
    public void finish(Database.BatchableContext dbc)
    {
        system.debug('Total processed records ' + count);
    }
    
}