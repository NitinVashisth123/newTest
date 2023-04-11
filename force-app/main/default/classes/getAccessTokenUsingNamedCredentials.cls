public class getAccessTokenUsingNamedCredentials {
     
    private String accessToken;
    
    public getAccessTokenUsingNamedCredentials() {
        this.accessToken = getAccessToken();
    }
   
    public String shorten( String url ) {

        HttpRequest req = new HttpRequest();
        req.setEndpoint(
            'callout:getAccessToken/v3/shorten' +
            '?access_token=' + this.accessToken +
            '&longUrl=' + EncodingUtil.urlEncode( url, 'UTF-8' ) +
            '&format=txt'
        );
        req.setMethod('GET');

        Http http = new Http();
        HttpResponse res = http.send(req);
        //system.debug('short url=='+res.getBody());
        return res.getBody();
    }
    
    
    private String getAccessToken() {

        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:getAccessToken/oauth/access_token');
        req.setMethod('POST');
        req.setHeader('Content-Length', '0');
        Http http = new Http();
        HttpResponse res = http.send(req);
        system.debug('at=='+res);
        system.debug('Access token generated on every call =='+res.getBody());
        return res.getBody();
        
    }
}