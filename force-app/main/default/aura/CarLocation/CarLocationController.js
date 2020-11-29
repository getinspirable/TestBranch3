({
	jsLoaded : function(component, event, helper) {
		component.set("v.jsLoaded", true);
	},
    
    loadMap : function(component, event,helper){
        var car = event.getParam('car');
        var latitude = '-33.86882';
        var longitude ='151.209296';
        //car.Geolocation__Latitude__s
        component.set("v.location",{'lat' : latitude,'long':longitude});
    },
})