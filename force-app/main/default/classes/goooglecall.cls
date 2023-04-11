public class goooglecall {
    
     @future (callout=true)
     Public static void myMethod()
     {
         string accessToken = 'ya29.a0AX9GBdX6AGLIYIUMxmG-7dyOmNNxr7XLad5MxN9d0R5D9R3hD97jg9TF_PFij27AE03-gyN5Q3fkrTt3-WdDA3GQQfWTDh74DMEm5IGdzQ8oxiO2MtBsel5tbo8n0HzpmB4PhFLb5Os65CrbRgkSPeoJqcCQaCgYKAcYSARMSFQHUCsbCQcq0NXY-RLO-1wIBHy4gHw0163';
HttpRequest req = new HttpRequest();
req.setEndpoint('https://www.googleapis.com/calendar/v3/calendars/primary/events');
req.setMethod('POST');
req.setHeader('Content-Type', 'application/json');
req.setHeader('Authorization', 'Bearer ' + accessToken);

Event currentEvent = [SELECT Subject, StartDateTime, EndDateTime, Description FROM Event where id ='00U5g00000FByTbEAL'];
system.debug('currentEvent'+currentEvent);
// Create the JSON object for the event
String jsonEvent = '{' +
    '"summary": "' + currentEvent.Subject + '",' +
    '"start": {' +
        '"dateTime": "' + currentEvent.StartDateTime.format() + '",' +
        '"timeZone": "UTC"' +
    '},' +
    '"end": {' +
        '"dateTime": "' + currentEvent.EndDateTime.format() + '",' +
        '"timeZone": "UTC"' +
    '}' +
'}';
req.setBody(jsonEvent);

Http http = new Http();
HttpResponse res = http.send(req);
     }

}