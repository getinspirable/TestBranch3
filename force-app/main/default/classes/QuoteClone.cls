global class QuoteClone {

    webservice static string CloneMethod(id qid){
        system.debug('Methodclone started');
        
        quote oldQ = [select id,Name,Contactid,Opportunityid,Accountid from quote where id=:qid];
        
        quote newQ=new quote();
        newQ.name='New ' + oldQ.name;
        newQ.OpportunityId=oldQ.OpportunityId;
        //newQ.AccountId=oldQ.AccountId;
        newQ.ContactId=oldQ.ContactId;
        
        insert newQ;
        system.debug('newidQ:'+newQ.id);
        return newQ.id;
        
        
    }
}