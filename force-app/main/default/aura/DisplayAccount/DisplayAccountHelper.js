({
getAccountList: function(component) {
var action = component.get('c.GetAccount');
// Set up the callback
var self = this;
action.setCallback(this, function(actionResult) {
component.set('v.lstAccount', actionResult.getReturnValue());
});
$A.enqueueAction(action);
}
})