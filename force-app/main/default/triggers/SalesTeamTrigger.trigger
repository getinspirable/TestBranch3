trigger SalesTeamTrigger on Sales_Team__c (before insert,before update,after insert,after update) {
    
     if(Trigger.isAfter){  
     if(Trigger.isupdate){
         
         list<sales_Team__c> listst=SalesTeamTriggerHandular.CheckSTUpdate(trigger.new,trigger.oldmap);
         if (!listst.isempty()){
            SalesTeamTriggerHandular.UpdateAccont(listst);             
         }
        
     }
     if(Trigger.isinsert){
        // SalesTeamTriggerHandular.UpdateAccont(trigger.new);
     }
     }
    

}