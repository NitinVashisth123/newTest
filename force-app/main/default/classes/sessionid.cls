public class sessionid {
    
    
    public static void returnsessionid()
    {
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        
        // Replace the placeholders with actual values
                String username = 'nitinvashisth82@gmail.com';
        String password = 'Nitin@123#';
        String clientId = '3MVG9fe4g9fhX0E5CA3U3SmyCQa6gcyL4O2RTYL4enq_Rjdy0XgDkkA4X24.NkamOg.Ki.BzjxNOLJVOvT1ZH';
        String clientSecret = 'D6B9DF0F9235901E585F91E395880F65F3770B2443FFFDEDA6B468B1A6E0F21F';
        
        String body = 'grant_type=password' +
            '&client_id=' + clientId +
            '&client_secret=' + clientSecret +
            '&username=' + username +
            '&password=' + password;
        
        req.setBody(body);
        
        Http http = new Http();
        HttpResponse res = http.send(req);
         system.debug('sessionId'+res.getBody());
        // Parse the response to obtain the session ID
        Map<String, Object> responseMap = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
        String sessionId = (String)responseMap.get('access_token');
        system.debug('sessionId'+sessionId);
        
        
    }
    
}