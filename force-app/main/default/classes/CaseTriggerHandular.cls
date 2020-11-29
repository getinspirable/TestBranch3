public class CaseTriggerHandular {

   public static String getRecordTypeNameById(String objectName, Id strRecordTypeId)
    {
        return Schema.getGlobalDescribe().get(objectName).getDescribe().getRecordTypeInfosById().get(strRecordTypeId).getName();
    }  

    public static void RecordTypeQueues(list<Case> AllCases){
               //get data from custum setting object.
               list<CaseQueues__c> mcs = CaseQueues__c.getAll().values();
                       map<string,string> mapQueues=new map<string,string>();
        
        for(CaseQueues__c xx:mcs){
            mapQueues.put(xx.RecordType__c,xx.queues__c);
        }
                //get list of group ids for queues
               //list<group> gid=[Select id ,name from group where type='Queue'];
              // map<id,group> mapQueues=new map<id,group>(gid);
            
        for(case c1:AllCases){
            
            if(mapQueues.ContainsKey(c1.RecordTypeId)){
               string Qid= mapQueues.get(c1.RecordTypeId);
                c1.RecordTypeId=Qid;
                 }
            
                   /*  if (getRecordTypeNameById('Case',c1.RecordTypeId)==CusObj.RecordType__c){

                       for(id qid:mapQueues.keySet()){
                          if (CusObj.queues__c == mapQueues.get(qid).Name){
                               system.debug('quese id:'+qid);
                                c1.OwnerId=qid;
                           }
                       }*/
                  
                   
                  }
}
                        
    }