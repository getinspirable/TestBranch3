trigger TriggerContact on Contact (before insert, before update,after insert, after update,after undelete,before delete,after delete) {
    
    If (trigger.ISbefore){
         if(trigger.isInsert || trigger.Isupdate){
             
           list<contact> dubcont= ContactTriggerHandular.ValidateDublicate(trigger.New);
             if (!dubcont.isEmpty()){
                 for(contact con:dubcont){
                    con.Email.AddError('Contact Already exits'); 
                 }
             }
             //rollup sumamry on contacts
            
         }/*else if (trigger.isdelete){
             system.debug('beforedeletetrigger:'+trigger.old);
             // ContactTriggerHandular.rollupsummayContact(trigger.old);
         }*/
       
    }
    IF (trigger.ISafter){
        
        if (trigger.isundelete){
          list<contact> dubcont= ContactTriggerHandular.ValidateDublicate(trigger.New);
             if (!dubcont.isEmpty()){
                 for(contact con:dubcont){
                    con.Email.AddError('Contact Already exits'); 
                 }
             }
        }else if (trigger.ISinsert || trigger.ISupdate ){
             ContactTriggerHandular.rollupsummayContact(trigger.new);
        }else if(trigger.isdelete){
             //system.debug('afterdeletetrigger:'+trigger.old);
            ContactTriggerHandular.rollupsummayContact(trigger.old); 
        }
    }



}