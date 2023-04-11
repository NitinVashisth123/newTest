({
	doInit : function(component, event, helper) {
           helper.getopportunityRecord(component); // Calling Helper method
		
	}
})

({
                getopportunityRecord : function( component ) {
                                var action = component.get("c.getopportunityRecord"); //Calling Apex class controller 'getAccountRecord' method

        action.setCallback(this, function(response) {
            var state = response.getState(); //Checking response status
            var result = JSON.stringify(response.getReturnValue());
            if (component.isValid() && state === "SUCCESS")
                component.set("v.oppLst", response.getReturnValue());  // Adding values in Aura attribute variable.   
        });
        $A.enqueueAction(action);
                }
})

({
    edit : function(component, event, helper) {
    var editRecordEvent = $A.get("e.force:editRecord");
    editRecordEvent.setParams({
        "recordId": component.get("v.recordId")
    });
    editRecordEvent.fire();
}
})