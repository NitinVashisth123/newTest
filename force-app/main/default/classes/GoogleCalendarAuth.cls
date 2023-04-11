public class GoogleCalendarAuth {
    //@future (callout = true)
    public static void accessToken()
    {
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://accounts.google.com/o/oauth2/token');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        //system.debug('fghjk'+ApexPages.currentPage().getParameters().get('code'));            
        String body =  '&client_secret=' + 'AIzaSyA5nj8Ejn2ShYJnRm5eveAC-j7MjvIk7SA' +
            '&redirect_uri=' + 'https://astreaitservices46-dev-ed.my.salesforce.com/services/apex/GoogleCalendarAuthCallback' +
            '&grant_type=authorization_code' + '&auth_url=' + 'https://accounts.google.com/o/oauth2/auth' + '&access_token_url=' + 'https://accounts.google.com/o/oauth2/token' + '&scope=' + 'https://www.googleapis.com/auth/calendar' + '&client_id=' + '914025215924-01ldh31pettde6f0kbm83of43qq9vbqf.apps.googleusercontent.com';
        req.setBody(body);
        HttpResponse res = h.send(req);
        system.debug('res'+res); 
    }
}