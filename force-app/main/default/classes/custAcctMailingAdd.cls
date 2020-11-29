global class custAcctMailingAdd implements database.Batchable<sobject> {
    global Database.QueryLocator  start(Database.BatchableContext BC){
        return Database.getqueryLocator(
            'select id,billingstreet,billingcity,billingstate,'+
            'billingPostalCode,(select id,mailingstreet,mailingcity,'+
            'mailingState,Mailingpostalcode from contacts) from Account' +
            'where billingState = \'TX\'');
        
    }
    global void execute(Database.BatchableContext Bc,List<Account> scope){
        List<contact> contList=new List<contact>();
        for(account acct:scope)
        {
            for(contact cont:acct.contacts)
            {
                cont.mailingstreet = acct.billingstreet;
                cont.mailingcity= acct.billingcity;
                cont.mailingstate=acct.billingstate;
                cont.mailingpostalcode=acct.billingpostalcode;
                contList.add(cont);
                
            }
        }
        update contList;
    }
    global void finish(Database.BatchableContext bc)
    {
        
    }

}