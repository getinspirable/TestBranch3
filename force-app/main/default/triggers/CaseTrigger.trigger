trigger CaseTrigger on Case (before insert,before update,after insert,after update) {
    
   if(Trigger.isBefore){  
       if(Trigger.isInsert){
           CaseTriggerHandular.RecordTypeQueues(trigger.new);  
       }
         if(Trigger.isUpdate){        
          CaseTriggerHandular.RecordTypeQueues(trigger.new);          
       }
   }
    

}