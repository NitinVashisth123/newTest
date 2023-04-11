({
	Add : function(component, event, helper) {
      var number1 = component.get('v.input1');
       var number2 = component.get('v.input2');
        alert(parseInt(number1) + parseInt(number2));
        //component.set('v.output', parseInt(number1) + parseInt(number2));
	},
    
    Subtract : function(component, event, helper) {
      var number1 = component.get('v.input1');
       var number2 = component.get('v.input2');
        alert(parseInt(number1) - parseInt(number2));
        //component.set('v.output', parseInt(number1) - parseInt(number2));
	},
    
    Multiply : function(component, event, helper) {
      var number1 = component.get('v.input1');
       var number2 = component.get('v.input2');
        alert(parseInt(number1) * parseInt(number2));
       //component.set('v.output', parseInt(number1) * parseInt(number2));
	},
    
    Divide : function(component, event, helper) {
      var number1 = component.get('v.input1');
       var number2 = component.get('v.input2');
        alert(parseInt(number1) / parseInt(number2));
        //component.set('v.output', parseInt(number1) / parseInt(number2));
	},
})