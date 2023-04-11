({
        doInit : function(component, event, helper) {
      
        let action=component.get('c.getAccDetails');
        action.setCallback(this,function(response){
            let state=response.getState();
             if(state==="SUCCESS"){
                let responseValue=response.getReturnValue();
               // console.log(responseValue);
                component.set("v.accList",responseValue);
            }
        });
        $A.enqueueAction(action);
        }, 
    
    createCon: function(component, event, helper){
/*navigateToMyComponent : function(component, event, helper) {
    var evt = $A.get("e.force:navigateToComponent");
    evt.setParams({
        componentDef : "c:custommodal",
        componentAttributes: {
            contactId : component.get("v.name")
        }
    });
    evt.fire();
}
  */ this.custommodal },
    createTask: function(component, event, helper){
          var createRecord = $A.get('e.force:createRecord');
        createRecord.setParams({
            "entityApiName" : "Task",
            'AccountId' : component.get('v.name')
            
        });
        createRecord.fire();
    },
    deleteAcc:function(component, event, helper){
       var action = component.get('c.deleteAccount');
          let cmpEvent=event.getSource();
        let id=cmpEvent.get('v.name');
        action.setParams({ 
        
            AccId : id                    
        });
     
        action.setCallback(this, function(response) {
            alert('account deleted');
         //component.set("v.Acclist2",response.getReturnValue());
            window.location.reload();
        });
        $A.enqueueAction(action);
 
      
    },
    goToRecord : function (component, event, helper) {
        var id = component.get('c.recordId');
         alert(id);
    var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId":id,
      "slideDevName": "related"
    });
    navEvt.fire();
}
})