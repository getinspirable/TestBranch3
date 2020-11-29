global class BatchContactDesUpdate implements Database.batchable<sObject>{
//global list<contact> listContact;
   global set<id> listContact=new set<ID>();
    global BatchContactDesUpdate(set<id> listContact1){
        listContact=listContact1;
    }
  global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
       system.debug('batch:contacts:'+listContact);
      return Database.getQueryLocator([SELECT Id, Description FROM contact where id IN :listContact]);
   }     
   global void execute(Database.BatchableContext info, List<contact> scope){
       List<contact> ContactToUpdate = new List<contact>();
       for(contact a : scope){ 
          a.description='SalesTEam discounts updated';
               
           ContactToUpdate.add(a); 
       } 
       update ContactToUpdate; 
   }     
   global void finish(Database.BatchableContext info){   
       system.debug('contacts records updated');
      
       
   } 


}