trigger AccountTeamMemberTrigger on AccountTeamMember (After insert,After update,Before insert,before update) {
if(Trigger.isAfter){  
    if(Trigger.isInsert){
       updateAccHardwareOwner.Fieldupdate(trigger.new);
            
        }
    
    if(Trigger.isUpdate){
         updateAccHardwareOwner.Fieldupdate(trigger.new);
    }
}
}