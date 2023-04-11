({
	createAccount : function(component, event, helper) {
		   var objname = component.get('v.sObjectName');
   alert(objname);
        component.set("v.obj",objname);
    var createRecordEvent = $A.get("e.force:createRecord");
    createRecordEvent.setParams({
        "entityApiName": "Account"
    });
    createRecordEvent.fire();
     
}
	
})