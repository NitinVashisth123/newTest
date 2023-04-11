public with sharing class getAccessToken {
         String username;
     String password;
     String accesstoken ;
     String instanceURL ;
    String clientId;
     String clientSecret;    

     public getAccessToken(string username, 
                                  string pwd, string clientId, string clientSecret)
     {        
         this.username = username;
         this.password = pwd;    
         this.clientId = clientId; 
         this.clientSecret = clientSecret;  

     }
    
     public void startTransfert(){
        //step 1 : get the access token
        Http httpCls = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api-ssl.bitly.com/');
        request.setMethod('POST');
        request.setTimeout(2 * 60 * 1000);  

        request.setHeader('Accept','application/json');        
       request.setBody('grant_type=password' + 
                    '&client_id=' + clientId + 
                    '&client_secret=' + clientSecret + 
                    '&username=' + username + 
                    '&password=' + password);
          //sending the json to the request body
          system.debug('dcdsc'+username);
         system.debug('dcdsc'+clientSecret);
         system.debug('dcdsc'+clientId);
         system.debug('dcdsc'+password);
          httpResponse response = httpCls.send(request); 
           system.debug('## response:' + response);
        

          if(response.getStatusCode() == 200){            
               system.debug('## Successfully retrieving access token' ); 

               map<string,Object> resultMap = (map<string,Object>)JSON.deserializeUntyped(response.getBody());

               accesstoken = (String)resultMap.get('access_token');
               instanceURL = (String)resultMap.get('instance_url');            
                  system.debug('accesstoken'+accesstoken);
               //step 2 : use the token for the salesforce api call


           }
           else{
             system.debug('## Could not retrieve the access token' ); 
             system.debug('## response status :' + response.getStatus()); 
             system.debug('## response message :' + response.getBody());             
    }


}
}