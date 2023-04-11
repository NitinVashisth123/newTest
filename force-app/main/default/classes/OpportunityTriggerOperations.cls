public class OpportunityTriggerOperations{
    
    public static void generateBitly(List<Account> lstacc){
        List<Id> accIdLst = new List<Id>();
		accIdLst.add(lstacc[0].id);
        createBit(accIdLst);
    }
    
    @future(callout=true)
    public static void createBit(List<Id> lstaccId){
        List<Account> lstacc = [Select id from Account where id =: lstaccId[0]];
        Map<String, Object> response = new Map<String,Object>();
        List<Account> accToUpdate = new List<Account>();
        String endpoint = System.label.Bitly_Endpoint + '/v4/shorten';    
        try {                  
	    HttpRequest req = new HttpRequest();
	    HttpResponse res = new HttpResponse();
	    Http http = new Http();
	    req.setHeader('Authorization', System.label.Bitley_Access_Token);
            req.setHeader('Content-Type', 'application/json');
	    req.setHeader('Accept', 'application/json');
	    req.setEndpoint(endpoint);
	    req.setMethod('POST');
	    req.setBody(JSON.serialize(new Map<String, Object>{               
	        'group_guid' => System.label.Bitly_GroupId,  
		'domain'=> 'bit.ly',
		'long_url' => 'https://astreaitservices46-dev-ed.my.salesforce.com/'+lstacc[0].id})); 
                // for eg. Base_URL = https://myorg-dev-ed.my.salesforce.com      
	        res = http.send(req);            
	        response = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
	        System.debug('Str:' + response);
            system.debug('fewdf'+response.get('link'));
	        lstacc[0].Bitly_URL__c  = (String) response.get('link');
	        accToUpdate.add(lstacc[0]);
            system.debug('uppp'+accToUpdate);
            update accToUpdate;
        
	                       
	}catch (Exception e) {         
	    System.debug('Error:' + e.getMessage() + 'LN:' + e.getLineNumber() );           
        }
        
    }
}