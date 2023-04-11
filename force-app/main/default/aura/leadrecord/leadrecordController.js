({        
     fetchAccount : function(component, event, helper) {
         component.set('v.mycolumn', [
             {label: 'Name', fieldName: 'Name', type: 'Name'},
             {label: 'AccountNumber', fieldName: 'AccountNumber', type: 'Text'}           
         ]);
         var action = component.get("c.fetchaccRecords");
         action.setCallback(this, function(response){
             component.set("v.accList", response.getReturnValue());
         });
         $A.enqueueAction(action);
     },
    
  createAccount : function(component, event) {
    var newAcc = component.get("v.newAccount");
    var action = component.get("c.saveAccount");
    action.setParams({ 
        "acc": newAcc
    });
    action.setCallback(this, function(a) {
           var state = a.getState();
            if (state === "SUCCESS") {
                var name = a.getReturnValue();
               alert("hello from here"+name);
            }
        });
    $A.enqueueAction(action)
}
 })