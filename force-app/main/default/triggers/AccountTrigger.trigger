trigger AccountTrigger on Account (before insert,before update,after insert,after update) {
   if(Trigger.isBefore){  
     if(Trigger.isInsert){
         
       AccountTriggerHandler.salesTeam(Trigger.new);
         AccountTriggerHandler.UpdateEXUser(Trigger.new);
         
     }
     if(Trigger.isUpdate){
         //SalesTeam Update
         list<account> ListAcct=AccountTriggerHandler.checkSalesTeam(Trigger.new,trigger.oldMap);
         if(!listAcct.isEmpty()){
        		AccountTriggerHandler.salesTeam(listAcct);
         }  
         //ExUser Update
         list<account> ListAcct1=AccountTriggerHandler.checkExUserupdate(Trigger.new,trigger.oldMap);
         if(!ListAcct1.isEmpty()){
        		AccountTriggerHandler.UpdateEXUser(ListAcct1);
         } 
         
          
     }
  }
    if(Trigger.isAfter){
      if(Trigger.isInsert){
       AccountTriggerHandler.insertAcctTeam(Trigger.new);
     }   
     if(Trigger.isUpdate){
        
         //Add and Delete AccountTeamMember 
           AccountTriggerHandler.DeleteAcctTeam(Trigger.new,trigger.oldMap);
            AccountTriggerHandler.insertAcctTeam(Trigger.new); 
           //update Account owner
         map<id,string> MapAcctOwner=AccountTriggerHandler.checkAccountOwner(Trigger.new,trigger.oldMap);
         if(!MapAcctOwner.isEmpty()){
        		AccountTriggerHandler.UpdateOpportunity(MapAcctOwner);
         } 
         }
     }
    
  }