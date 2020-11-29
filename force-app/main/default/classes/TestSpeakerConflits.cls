@ISTest
public class TestSpeakerConflits {

    @isTest
    public static void testmethod1(){
        Date mydate=Date.parse('03/17/2020');
       session__C session1=new Session__C(Name='Session1',Session_Date__c=mydate,Level__c='Begginer');  
        insert session1;
        speaker__C speaker1=new speaker__C(First_Name__c='aaryan1',Email__c='aaryan1@gmail.com');
        insert speaker1;
        
        session_speaker__c sessionspeaker=new session_speaker__C(session__c=session1.id,speaker__C=speaker1.id);
       Database.SaveResult res1=Database.insert(sessionspeaker,false);
        
        system.assert(res1.isSuccess());
        
       // [select id,session_Date__C from session__C where session__c.id=:session1.id]
       //session__C session2=new Session__C(Name='Session2',Session_Date__c=mydate,Level__c='Begginer');  
       // insert session1;
        
      // session_speaker__c sessionspeaker=new session_speaker__C(session_c=session2.id,speaker__C=speaker1.id);
      //  insert sessionspeaker;
        
    }
     @isTest
    public static void testmethod2(){
        Date mydate=Date.parse('03/17/2020');
        
         session__C session1=new Session__C(Name='Session1',Session_Date__c=mydate,Level__c='Begginer');  
        insert session1;
        
         session__C session2=new Session__C(Name='Session2',Session_Date__c=mydate,Level__c='Begginer');  
        insert session2;
        
        speaker__C speaker1=new speaker__C(First_Name__c='aaryan1',Email__c='aaryan1@gmail.com');
        insert speaker1;
        
        session_speaker__c sessionspeaker1=new session_speaker__C(session__c=session1.id,speaker__C=speaker1.id);
       //datebase.saveresult result=database.insert(sessionspeaker);
       insert sessionspeaker1;
        
        session_speaker__c sessionspeaker2=new session_speaker__C(session__c=session2.id,speaker__C=speaker1.id);
       Database.SaveResult result=Database.insert(sessionspeaker2,false);
        
        Test.startTest();
        System.assert(!result.isSuccess());
        test.stopTest();
      
    }
    
}