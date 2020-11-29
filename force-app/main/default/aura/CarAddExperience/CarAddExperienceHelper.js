({
	callDoInit : function(component, event, helper) {
		component.find("service").getNewRecord(
          "Car_Experience__c", //sobject type(entity Api name)
           null,     //recordTypeId
            false, //skip cache
            $A.getCallback(function(){
              
                var rec = component.get("v.carExperience");
                var error = component.get("v.recordError");
                var car=component.get("v.car");
                if(error || rec === null ){
                    console.log("Error initializing record template:" + error);
                }
                else {
                    component.set("v.carExperience.Car__c" , car.Id);
                }
            })
        )
	},
})