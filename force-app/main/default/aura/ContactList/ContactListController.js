({
   doInit : function(component, event) {
       var action = component.get("c.getAllSquadAccounts");
       action.setCallback(this, function(a){
           console.log(a.getReturnValue());
           component.set("v.accounts", a.getReturnValue());
       });
       $A.enqueueAction(action);
   },
})
