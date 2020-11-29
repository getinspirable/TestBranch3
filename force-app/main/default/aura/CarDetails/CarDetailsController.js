({
	onCarSelect : function(component, event, helper) {
		
        component.set("v.carId",event.getParam("car").Id);
      
        console.log("carId--"+event.getParam("car").Id);
        component.find("service").reloadRecord();
	},
    onCarExpAdded : function(component,event,helper){
        /*here we are calling aura method named refresh which is
         * present in CarExp component calling to this mtd is not
         * manditory as we r using change evnt lister in carexp component
         * */
        component.set("v.tabId" , "Exptab");
       // debugger;
        //carExpTabId
     //  var com1= component.find("carExpId");
       // com1.refreshCarExpTab();
        //calling refresh methd in carExp
        
         
    }
})