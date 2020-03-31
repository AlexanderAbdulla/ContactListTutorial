({
    doInit : function(component, event) {
        console.log('starting init');
        var accountId = component.get("v.selectedAccount");
        console.log(accountId);
        var action = component.get("c.getSquadMembers");
        action.setParams({
            accountId : accountId
        });
        action.setCallback(this, function(a){
            console.log('doin the init');
            console.log(a.getReturnValue());
            component.set("v.squadMembers", a.getReturnValue());
        });
        $A.enqueueAction(action);
        //console.log(component.get("v.selectedAccount"));
    },
})
