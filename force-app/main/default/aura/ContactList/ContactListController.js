({
	doinitaction : function(component, event, helper) {
		helper.getAccountContacts(component, event, helper)
	},
    searchKeyChange: function(component, event) {
     var searchKey = event.getParam("searchKey");
     var action = component.get("c.findByName");
     action.setParams({
       "searchKey": searchKey
     });
     action.setCallback(this, function(a) {
     	component.set("v.contacts", a.getReturnValue());
     });
     $A.enqueueAction(action);
    },
    ContactClick:function(component, event, helper){
       var myEvent = $A.get("e.c:EventContactDisplay");
       
         myEvent.setParams({"ContactId": event.target.id });
         myEvent.fire();
     }  
    
})