({        
     fetchLeads : function(component, event, helper) {
         component.set('v.mycolumn', [
             {label: 'LastName', fieldName: 'LastName', type: 'text'},
             {label: 'Company', fieldName: 'Company', type: 'Text'},
             {label: 'Status', fieldName: 'Status', type: 'text'}            
         ]);
         var action = component.get("c.fetchLeadRecords");
         action.setCallback(this, function(response){
             component.set("v.leadList", response.getReturnValue());
         });
         $A.enqueueAction(action);
     },
 })