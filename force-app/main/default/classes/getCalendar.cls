global class getCalendar {

  public static void makeCallout() {
        HttpRequest request = new HttpRequest();
        request.setMethod('REST API METHOD');
        //request.setMethod('GET');
        request.setEndpoint('callout:googleconnect/https://www.googleapis.com');
        //request.setEndpoint('callout:NAMED_CREDENTIALS_NAME' + '/users/me/calendarList');

        Http http = new Http();
        HTTPResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            System.debug(response.getBody());
        }
    }
}