public class tokenX {
  
    public void getAccessToken()
    {
        HttpRequest req = new HttpRequest();
String endpoint = 'https://api-ssl.bitly.com/oauth/access_token';
req.setEndpoint(endpoint);
        
req.setMethod('POST');
req.setHeader('Content-Type','application/x-www-form-urlencoded');
req.setHeader('Content-Length', '0');
       
String clientId='49d5e04372a6b07fe43cd85d2e6fa64db723e3d7';
String clientSecret='cd0133f0e58a5c3ff876cf31bd68182e1558c2e8';
        String body='client_id='+clientId+'&client_secret='+clientSecret;
String username = 'nitinastreait';
String password = 'Bitly123';
system.debug('us'+username);
system.debug('us'+password);
Blob headerValue = Blob.valueOf(username + ':' + password);
String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
System.debug('abfgs: '+authorizationHeader);
req.setHeader('Authorization', authorizationHeader);
        req.setBody(body);
Http http = new Http();
HTTPResponse res = http.send(req);
    System.debug('respose pura: '+res);
System.debug(res.getBody());
    }
}