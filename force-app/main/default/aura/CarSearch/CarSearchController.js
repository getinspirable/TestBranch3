({
	
    doinit : function(component, event, helper) {
        var newCar=$A.get("e.force:createRecord");
        if (newCar){
            component.set("v.showNew",true);
        }else{
            component.set("v.showNew",false);
        }
       //component.set("v.carTypes",['SportsCar','LuxuryCar']);
       helper.getcartype(component,helper);	
	},
    onSearchClick : function(component, event, helper) {
		var searchFormSubmit = component.getEvent("searchFormSubmit");
        debugger;
        searchFormSubmit.setParams({
            "carTypeId" : component.find("carTypeList").get("v.value")
        });
        searchFormSubmit.fire();
	},
    
    createrecord : function(component, event, helper) {
       
        //var cartypeid=component.find("catType").get("v.value");
        var createCarRecord = $A.get("e.force:createRecord");
        createCarRecord.setParams({
            "entityApiName" : "Car_Type__c"
            
        });
        createCarRecord.fire();
    },
})