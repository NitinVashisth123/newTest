public class BitlyService {
  
    private String accessToken;
    
    public BitlyService() {
        this.accessToken = getAccessToken();
    }
    
   
    public String shorten( String url ) {

        HttpRequest req = new HttpRequest();
        req.setEndpoint(
            'https://api-ssl.bitly.com/v3/shorten' +
            '?access_token=' + this.accessToken +
            '&longUrl=' + EncodingUtil.urlEncode( url, 'UTF-8' ) +
            '&format=txt'
        );
        req.setMethod('GET');
        

        Http http = new Http();
        HttpResponse res = http.send(req);
        return res.getBody();
    }
    
    /**
     * Get the access token to make authenticated oauth calls.
     * The actual username/password credentials are stored in
     * Named Credentials so that the password is stored securely.
     * 
     * This does require an extra http request when instantiating
     * the service which adds to latency. Alternatively, you could
     * store the generated access token in a custom setting and simply
     * reference it from your code, but then anyone who can view
     * custom settings can view the access token and use the API.
     * Trade-offs.
     */
    private String getAccessToken() {

        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Bitly/oauth/access_token');
        req.setMethod('POST');
        system.debug('endpoint: '+req.getEndpoint());
        req.setHeader('Content-Type','text/xml');
         system.debug('bghhg'+req);
        String username = 'nitinastreait';
        String password = 'Bitly123';
        system.debug('us'+username);
        system.debug('us'+password);
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
        System.debug('abfgs: '+authorizationHeader);
        req.setHeader('Authorization', authorizationHeader);
        //req.setHeader('Content-Type','application/x-www-form-urlencoded');
		req.setHeader('Content-Length', '0');
        Http http = new Http();
        HttpResponse res = http.send(req);
        System.debug('bopdy:'+res.getBody());
        return res.getBody();
    }
}