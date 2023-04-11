public class wrapperDisplayController2 {
    @AuraEnabled
    public static wrapperClass initMethod(){
        // create a wrapper class object and set the wrapper class @AuraEnabled properties and return it to the lightning component.
        wrapperClass returnwrapperClass = new  wrapperClass();        
        returnwrapperClass.lstContact = [SELECT firstName, LastName, Department,LeadSource from contact Limit 25];
         returnwrapperClass.lstAccount = [SELECT Industry, AccountNumber, AnnualRevenue, Phone from account Limit 25];
        returnwrapperClass.lstOpp = [SELECT ExpectedRevenue, Amount from opportunity Limit 25];
       returnwrapperClass.contactCount = returnwrapperClass.lstContact.size(); 
         returnwrapperClass.AccountCount = returnwrapperClass.lstAccount.size();
         returnwrapperClass.OppCount = returnwrapperClass.lstOpp.size();
        returnwrapperClass.headerMsg1 = 'CONTACTS';
        returnwrapperClass.headerMsg2 = 'ACCOUNT';
         returnwrapperClass.headerMsg3 = 'OPPORTUNITY';
        return returnwrapperClass;    
    }
    
    // wrapper or Inner class with @AuraEnabled {get;set;} properties*    
    public class wrapperClass{
        @AuraEnabled public List<contact> lstContact{get;set;}
         @AuraEnabled public Integer contactCount{get;set;}
        @AuraEnabled public String headerMsg1 {get;set;}
        @AuraEnabled public List<Account> lstAccount{get;set;}
        @AuraEnabled public Integer AccountCount{get;set;}
        @AuraEnabled public String headerMsg2 {get;set;}
        @AuraEnabled public List<Opportunity> lstOpp{get;set;}
       @AuraEnabled public Integer OppCount{get;set;}
       @AuraEnabled public String headerMsg3 {get;set;}
    }
    


}