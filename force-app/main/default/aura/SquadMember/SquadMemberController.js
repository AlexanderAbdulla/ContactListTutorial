({
    doInit : function(component, event) {
        console.log('starting init');
        var accountId = component.get("v.selectedAccount");
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
    
    validateAccounts : function(component, event) {
        console.log("validating accounts: " + event.getSource().get("v.label"));
        var contactId = event.getSource().get("v.label");
        var action = component.get("c.getAccountValidation");
        action.setParams({
            contactId : contactId
        });

        action.setCallback(this, function(a){
            console.log('callback reached!');
            console.log(a.getReturnValue());
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                title : 'Accounts Found',
                message: a.getReturnValue(),
                messageTemplate: 'Record {0} created! See it {1}!',
                duration:' 3000',
                key: 'info_alt',
                type: 'info',
                mode: 'dismissible'
            });
            toastEvent.fire();
            //component.set("v.squadMembers", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
})
