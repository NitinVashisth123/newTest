({
	doSave : function(component, event, helper) {
		var action = component.get('c.createContact');
        var contc= component.get('c.createContact');
        if(contc.FirstName===null || contc.FirstName==='' || contc.FirstName===undefined){
            alert('please enter firstname');
            return; 
        }
	
    
    action.setParams({
        con : component.get('v.createContact'),
        AccountId : component.get('v.accountId')
    
});

action.setCallback(this,function(response){
    var state = response.getState();
    alert(state);
    if(state === 'SUCCESS' || state === 'DRAFT')
    {
        var responseValue=response.getReturnValue();
    }
    else if(state === 'INCOMPLETE')
    {
        
    }
        else if(state==='ERROR'){
            var error = response.getError();
            console.log('Error',errors[0].duplicateResults);
            console.log('Error',errors[0].fieldErrors);
            console.log('Error',errors[0].pageErrors);
            if(errors || errors[0].message){
                
            }
        }
        },'ALL');
    
    $A.enqueueAction(action);
    }
    
})