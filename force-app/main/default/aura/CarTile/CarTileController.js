({
	onCarClick : function(component, event, helper) {
		 var Car = component.get("v.car");
	      var evt = component.getEvent("onCarSelect");
       
        evt.setParams({
            "carId" : Car.Id
        });
        evt.fire();
        
        //Calling application event on car select
        var appEvt= $A.get("e.c:CarSelectApplicatonEvent");
        if (appEvt){
            appEvt.setParams({
                "car" : Car,
            });
            appEvt.fire();
        }
        
        
    },
})