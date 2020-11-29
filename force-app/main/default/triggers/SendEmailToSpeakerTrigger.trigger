trigger SendEmailToSpeakerTrigger on Session_Speaker__c (After insert) {
    
    for(session_speaker__c sp1:trigger.new){
       
        session_speaker__C sessionspeaker=[select   Session__r.Name,
        Session__r.Session_Date__c,
        Speaker__r.First_name__C,
        Speaker__r.Last_Name__C,
        Speaker__r.Email__c
 from Session_speaker__c where id=:sp1.id];
        
        if (sessionspeaker.Speaker__r.Email__c!=null){
            
            string address=sessionspeaker.Speaker__r.Email__c;
            string subject='Speaker confirmation';
            string message='Dear '+ sessionspeaker.Speaker__r.First_name__C +',\n your Session ' 
                + sessionspeaker.Session__r.Session_Date__c +'on Date: ' + sessionspeaker.Session__r.Session_Date__c
                +'was confirmed \n\n Thanks you for ur partispation.';
            SendEmailManager.SendEmailMessage(address,subject,message);
        }
         
    }
       
}