({
 myAction : function(component, event, helper) 
    {
        var oppList = component.get("c.getRelatedList");
        oppList.setParams
        ({
            recordId: component.get("v.recordId")
        });
        
        ConList.setCallback(this, function(data) 
                           {
                               component.set("v.opportunityList", data.getReturnValue());
                           });
        $A.enqueueAction(oppList);
 }
})