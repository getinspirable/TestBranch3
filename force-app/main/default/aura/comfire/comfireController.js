({
	fireApplicationEvent : function(component, event, helper) {
		
        // Get the application event by using the
        // e.<namespace>.<event> syntax
        var appEvent = $A.get("e.c:AppEvent1");
        appEvent.setParams({
            "message" : "An application event fired me" });
        appEvent.fire();
    }
	}
)