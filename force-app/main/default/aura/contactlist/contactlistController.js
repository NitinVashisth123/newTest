({
	doInit : function(component, event, helper) {
        var action=component.get('c.getcontactlist');
        
       action.setParams({
            accId : component.get('v.recordId'), 
        });
        
        action.setCallback(this,function(response){
            var state =response.getState();
            var responseValue=response.getReturnValue();
            console.log('responseValue', responseValue);
            component.set('v.contactlist',responseValue);
        }); 
		
         $A.enqueueAction(action);
	},
    doRedirect : function(component, event, helper){
   var eventSource = event.getSource();
        var id =eventSource.get('v.name');
        var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId": id,
      "slideDevName": "details"
    });
    navEvt.fire();
} ,
})