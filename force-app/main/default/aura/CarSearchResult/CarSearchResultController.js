({
	doInit : function(component, event, helper) {
		helper.onSearch(component, event, helper);
	},
    dosearch : function(component, event,helper){
      var param1= event.getParam('arguments');
        if (param1){
            component.set("v.carTypeIdComp",param1.carTypeId);
            helper.onSearch(component, event, helper);
        }
    },
    onCarClick : function(component, event,helper){
       
     
            component.set("v.carSelectedId",event.getParam("carId"));
        console.log("selectedID:"+ event.getParam("carId") );
      
    }
})