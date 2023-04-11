@RESTResource(urlMapping='/CreateWrapperWarehouse2/')
global with sharing class wrappperwarehouse
{ 
    @HTTPPost
    global static wrapperclass POST()
    {  
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
       string jasonBody = req.requestBody.toString();
        JSONParser parser = JSON.createParser(jasonBody);
        wrapperclass Wrap = new wrapperclass();
        wrapperwarehouse__c[] wrapper = new List<wrapperwarehouse__c>();
       wrapperwarehouse__c w = new wrapperwarehouse__c();
       // List<wrapperclass> wrap= (List<wrapperclass>)JSON.deserialize(req.requestbody.tostring(),List<wrapperclass>.class);
        while(parser.nextToken()!=null)
        { 
            if(parser.getCurrentToken()!=JSONToken.END_OBJECT )
            {   wrap.fieldName = parser.getCurrentName();
            wrap.fieldvalue = parser.getText();
        
             if(wrap.fieldName == 'Name')
            {
                wrap.wname = wrap.fieldvalue;
            }
             
            else if(wrap.fieldName == 'businessCategory')
            {
                wrap.businessCat = wrap.fieldvalue;
            }
            
            else if(wrap.fieldName == 'externalId')
            {
                wrap.extId = wrap.fieldvalue;
            }
            
             else if(wrap.fieldName == 'location')
            {
                wrap.locate = wrap.fieldvalue;
            }
            
            
             else if(wrap.fieldName == 'vendorId')
            {
                wrap.vId = wrap.fieldvalue;
            }
            
            
             else if(wrap.fieldName == 'vendorName')
            {
               wrap.vName = wrap.fieldvalue;
            }
            
            
             else if(wrap.fieldName == 'vendorType')
            {
                wrap.vType = wrap.fieldvalue;
            }
        }
              
        }
       w.name=wrap.wname;
       w.businessCategory__c=wrap.businessCat;
        w.externalId__c=wrap.extId;
        w.location__c=wrap.locate;
        w.vendorId__c= wrap.vId;
        w.vendorName__c=wrap.vName;
            w.vendorType__c=wrap.vType;
          wrapper.add(w);
            insert wrapper;
         return wrap;
     }
       global class wrapperclass{
    // global List<wrapperwarehouse__c> w{get;set;}
         global string wname;
         global string businessCat;
         global string extId;
         global string locate;
        global string vId;
         global string vName;
         global string vType;
         global string fieldName;
         global string fieldvalue;
        
    
 }
    }