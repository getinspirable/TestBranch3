({
	getAccountContacts : function(component, event, helper) {
       var action= component.get("c.findAll");
       // action.setParams({"AcctId" : component.get("v.recordId")});
       
      // action.setParams({"AcctId" : 0016g00000IasNZAAZ});
        action.setCallback(this,function(response){
           component.set("v.contacts", response.getReturnValue());
           
            
        });
        $A.enqueueAction(action);
		
	}
})