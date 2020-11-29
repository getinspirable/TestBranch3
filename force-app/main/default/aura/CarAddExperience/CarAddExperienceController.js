({
	doInit : function(component, event, helper) {
		helper.callDoInit(component, event, helper);
	},
    onSave : function(component, event, helper){
        component.set("v.carExperience.Car__c",component.get("v.car.Id"));
        component.find("service").saveRecord($A.getCallback(function(saveResult){
            if(saveResult.state === 'SUCCESS' || saveResult.state ==='DRAFT'){
                var resultToast =$A.get("e.force:showToast");
                if(resultToast){
                    resultToast.setParams({
                        "title" : "Saved",
                        "message" :"Car Experience Added"
                    });
                    resultToast.fire();
                }
                else{
                    alert('Car Experience Added');
                }
             
                helper.callDoInit(component,event,helper);
                
           
                var evt = component.getEvent("carExpAddedEvent");
                evt.fire();
                
            }else if( saveResult.state === 'INCOMPLETE'){
                helper.showToast(component,event,helper,{
                    "title" : "ERROR !",
                    "type"  : "error",
                    "message" : "Device does not support draft"
                });
                console.log("User is offline,device doesn't support drafts");
            }else if(saveResult.state === 'ERROR'){
                helper.showToast(component,event,helper,{
                    "title" : "ERROR!",
                    "type" : "error",
                    "message" : "Problem saving record"
                });
                console.log('Problem savind record,error:' +JSON.stringify(saveResult.error));
            }else{
                helper.showToast(component,event,helper,{
                    "title" : "ERROR!",
                    "type" : "error",
                    "message" : "Unknow problem"
                }),
                    console.log('Unknow problem ,State:' + saveResult.state +',error:' + JSON.stringify(saveResult.error));
            }
                
            
        }))
    },
    onRecordUpdated: function(component ,event,helper){
        var eventParams =event.getParams();
        if(eventParams.changeType === 'CHANGED'){
            var changeFields = eventParams.changedFields;
            console.log('Fields that are changed:' + JSON.stringify(changedFields));
            helper.showToast(component,event,helper,{
                "title" : "Saved",
                "type" : "error",
                "message" : "The record was updated"
            });
        }else if(eventParams.changeType === 'LOADED'){
            //un can write for removed,error also sameway
        }
    },
})