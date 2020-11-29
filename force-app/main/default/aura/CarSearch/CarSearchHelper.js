({
	
    getcartype: function(component, helper) {
       /* var action=component.get("c.getcartype");
        action.setCallback(this , function(data){
           
            
             var state = data.getState();
            if(state == 'SUCCESS'){
                console.log("onsucess"+data.getReturnValue());
                component.set("v.carTypes",data.getReturnValue());
               
               
            }else if(state == 'ERROR'){
                alert('unknow error');
            }
        });
        $A.enqueueAction(action);*/
        helper.callServer(component,"c.getcartype",
                          function(response){
                              component.set("v.carTypes",response);
                          });
                      
        
    }
})