trigger SpeakerConflit on Session_Speaker__c (before insert) {
    
    for(session_speaker__C sessionspeaker:trigger.new){
    session__C session=[select id,Session_Date__c from session__C where session__c.id=:sessionspeaker.Session__C];
        
     List<session_speaker__C> conflit= [select id from session_speaker__C where speaker__C=:sessionspeaker.speaker__C 
           and session__r.Session_Date__c=:session.session_Date__C]; 
        if(!conflit.isEmpty()){
            sessionspeaker.addError('Speaker is already booked');
        }
        }

}