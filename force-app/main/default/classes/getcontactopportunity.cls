public with sharing class getcontactopportunity {
      @AuraEnabled
    public static list<opportunity> getRelatedList(Id recordId)
    {
        List<opportunity> opplist = [Select id, name, StageName, Amount from opportunity where ContactId=: recordId ];
        return opplist;
    }

}