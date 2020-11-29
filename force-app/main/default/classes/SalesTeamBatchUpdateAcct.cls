global class SalesTeamBatchUpdateAcct implements Database.batchable<sObject>,Database.Stateful{
 global sales_team__C salesTeam;
    global set<id> setAccID=new set<ID>();
    global SalesTeamBatchUpdateAcct(sales_team__C salesTeam1){
        salesTeam=salesTeam1;
    }
  global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
       
      return Database.getQueryLocator([SELECT Id, Name, Sales_Team__c,st1__c,st2__c,st3__c FROM Account where sales_Team__C =:salesTeam.id]);
   }     
   global void execute(Database.BatchableContext info, List<Account> scope){
       List<Account> accsToUpdate = new List<Account>();
       for(Account a : scope){ 
           setAccID.add(a.id);
           a.Sales_Team__c = salesTeam.Id; 
           a.st1__c = salesTeam.St1__c; 
           a.st2__c=salesTeam.st2__c;
           a.st3__c=salesTeam.st3__c;
               
           accsToUpdate.add(a); 
       } 
       update accsToUpdate; 
   }     
   global void finish(Database.BatchableContext info){   
       system.debug('records inserted in finish');
       system.debug('set of contacts:'+setAccId);
       list<contact>  listContact= [select id from contact  where accountID in :setAccID];
       if(!listContact.isempty()){ 
      		 set<id> setCid=new set<id>();
     		 // map<id,string> mapcontact=new map<id,string>();

     	  for(contact cid:listContact){  
         	 //mapcontact.put(cid.id,cid.description);
         	 setCid.add(cid.id);
      		 }
       
        	BatchContactDesUpdate  myBatchObject=new BatchContactDesUpdate(setCid);
            Id batchId = Database.executeBatch(myBatchObject);
       }
       
   } 

}