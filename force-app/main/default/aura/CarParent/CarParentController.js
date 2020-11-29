({
	doFormSubmit : function(component, event, helper) {
	 
        var carTypeId = event.getParam('carTypeId');
      
       // console.log('IDof carType selecred:'+ carTypeId);
         var carSearchResultComp = component.find("carSearchResult");
        var carSearchCompResult = carSearchResultComp.searchCars(carTypeId);
        //console.log("auromethod:"+ carSearchCompResult)
	}
})