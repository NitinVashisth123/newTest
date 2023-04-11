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
       alert('working');
    },
    createTask: function(component, event, helper){
         alert('working');
    },
    deleteAcc:function(component, event, helper){
        alert('working');
    }
})