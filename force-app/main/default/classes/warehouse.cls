@RESTResource(urlMapping='/CreateWarehouse/')
global class warehouse
{
    @HTTPPost
    global static string POST(string wname, string businessCat, string extId, string locate, string vId, string vName, string vType)
    { 
        String fieldName,fieldvalue;
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        string jasonBody = req.requestBody.toString();
        JSONParser parser = JSON.createParser(jasonBody);
        while(parser.nextToken()!=null)
        { 
            if(parser.getCurrentToken()!=JSONToken.END_OBJECT )
            {   fieldName = parser.getCurrentName();
            fieldvalue = parser.getText();
        
             if(fieldName == 'Name')
            {
                wname = fieldvalue;
            }
             
            else if(fieldName == 'businessCategory')
            {
                businessCat = fieldvalue;
            }
            
            else if(fieldName == 'externalId')
            {
                extId = fieldvalue;
            }
            
             else if(fieldName == 'location')
            {
                locate = fieldvalue;
            }
            
            
             else if(fieldName == 'vendorId')
            {
                vId = fieldvalue;
            }
            
            
             else if(fieldName == 'vendorName')
            {
               vName = fieldvalue;
            }
            
            
             else if(fieldName == 'vendorType')
            {
                vType = fieldvalue;
            }
        }
        
     }
   
        warehouse__c w = new warehouse__c();
        w.Name=wname;
        w.businessCategory__c=businessCat;
        w.externalId__c=extId;
        w.location__c=locate;
        w.vendorId__c= vId;
        w.vendorName__c=vName;
        w.vendorType__c=vType;
         insert w;
            return w.id;}
    }