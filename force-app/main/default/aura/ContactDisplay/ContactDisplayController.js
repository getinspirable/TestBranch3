({
	DisplayContact : function(component, event, helper) {
		/* var ConID = event.getParam("ContactId");
      
        component.set("v.Cid",ConID);*/
        var token = event.getParam("token");
        console.log("tokenofcontactId:"+ token);
        if (token.indexOf('contact/') === 0) {
            var contactId = token.substr(token.indexOf('/') + 1);
            var action = component.get("c.findById");
            action.setParams({
              "contactId": contactId
            });
            action.setCallback(this, function(a) {
                console.log("returnvalueofcontactId:"+ a.getReturnValue());
                component.set("v.contact", a.getReturnValue());
               /*console.log("contactID:"+ component.get("v.contact").Id);
                component.set("v.Cid", component.get("v.contact").Id);*/
               
            });
            $A.enqueueAction(action);
        }
	}
})