global class LeadProcessor implements  
              Database.Batchable<sObject>, Database.Stateful {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('select id from lead');
        
    }

      global void execute(Database.BatchableContext bc, List<Lead> scope){
       
          list<lead> ListLead= new List<Lead>();
          for (lead le:scope){
              //lead newlead=new lead();
              
              le.LeadSource = 'Dreamforce';
              listlead.add(le);
          }
          update listlead;
             
      }
     global void finish(Database.BatchableContext bc){
     }         
}