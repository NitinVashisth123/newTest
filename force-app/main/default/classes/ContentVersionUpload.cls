public class ContentVersionUpload {

    public static void uploadRecords() {
        String csv = 'C:\\Users\\dhvan\\Downloads\\test.csv';
        Http h = new Http();
        HttpRequest req = new HttpRequest();

        // Create a new job
        req.setMethod('POST');
        req.setHeader('X-SFDC-Session', UserInfo.getSessionId());
        req.setHeader('Content-Type', 'application/xml');
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/async/49.0/job');
        req.setBody('<?xml version="1.0" encoding="UTF-8"?>' +
                   '<jobInfo xmlns="http://www.force.com/2009/06/asyncapi/dataload">' +
                   '<operation>insert</operation>' +
                   '<object>ContentVersion</object>' +
                   '<contentType>CSV</contentType>' +
                   '</jobInfo>');
        HttpResponse res = h.send(req);
        String jobId = res.getHeader('Location').substring(res.getHeader('Location').lastIndexOf('/') + 1);

        // Add a batch of data to the job
        req = new HttpRequest();
        req.setMethod('POST');
        req.setHeader('X-SFDC-Session', UserInfo.getSessionId());
        req.setHeader('Content-Type', 'text/csv');
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/async/49.0/job/' + jobId + '/batch');
        req.setBody(csv);
        system.debug('body'+req.getBody());
        res = h.send(req);
        String batchId = res.getHeader('Location').substring(res.getHeader('Location').lastIndexOf('/') + 1);

        // Close the job
        req = new HttpRequest();
        req.setMethod('PUT');
        req.setHeader('X-SFDC-Session', UserInfo.getSessionId());
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/async/49.0/job/' + jobId);
        req.setBody('<?xml version="1.0" encoding="UTF-8"?><jobInfo xmlns="http://www.force.com/2009/06/asyncapi/dataload"><state>Closed</state></jobInfo>');
        res = h.send(req);
    }
}