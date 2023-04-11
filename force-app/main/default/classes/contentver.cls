public class contentver{

    public static void uploadRecords(List<String> csvFiles) {
        Http h = new Http();
        HttpRequest req = new HttpRequest();

        // Create a new job
        req.setMethod('POST');
        System.debug('UserInfo.getSessionId()'+UserInfo.getSessionId());
        req.setHeader('X-SFDC-Session', UserInfo.getSessionId());
        req.setHeader('Content-Type', 'application/xml');
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/async/49.0/job');
       // req.setEndpoint('https://astreaitservices46-dev-ed.lightning.force.com/services/data/v55.0/sobjects/ContentVersion/');
        system.debug('erdgf'+req.getEndpoint());
        req.setBody('<?xml version="1.0" encoding="UTF-8"?>' +
                   '<jobInfo xmlns="http://www.force.com/2009/06/asyncapi/dataload">' +
                   '<operation>insert</operation>' +
                   '<object>ContentVersion</object>' +
                   '<contentType>CSV</contentType>' +
                   '</jobInfo>');
        system.debug('erfg'+req.getBody());
        HttpResponse res = h.send(req);
        String jobId = res.getHeader('Location').substring(res.getHeader('Location').lastIndexOf('/') + 1);

       
        for (String csvFile : csvFiles) {
            req = new HttpRequest();
            req.setMethod('POST');
            req.setHeader('X-SFDC-Session', UserInfo.getSessionId());
            req.setHeader('Content-Type', 'text/csv');
            req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/async/49.0/job/' + jobId + '/batch');
            //req.setEndpoint('https://astreaitservices46-dev-ed.lightning.force.com/services/data/v55.0/job' + jobId + '/sobjects/ContentVersion/');
            req.setBody(csvFile);
            system.debug('body'+req.getBody());
            res = h.send(req);
            String batchId = res.getHeader('Location').substring(res.getHeader('Location').lastIndexOf('/') + 1);
        }

        
        req = new HttpRequest();
        req.setMethod('PUT');
        req.setHeader('X-SFDC-Session', UserInfo.getSessionId());
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/async/49.0/job/' + jobId + '/batch');
        //req.setEndpoint('https://astreaitservices46-dev-ed.lightning.force.com/services/data/v55.0/job' + jobId + '/sobjects/ContentVersion/');
        req.setBody('<?xml version="1.0" encoding="UTF-8"?><jobInfo xmlns="http://www.force.com/2009/06/asyncapi/dataload"><state>Closed</state></jobInfo>');
        res = h.send(req);
    }
}