trigger AccountLookupSalesTeam on Account (before insert,before update,after insert,after update) {
   list<AccountTeamMember> listAcctTeam=new list<AccountTeamMember>();
    list<AccountShare> listAcctShare=new list<AccountShare>();
    if ((Trigger.isInsert || Trigger.isUpdate)){
    for(Account acct : trigger.new){
        if ( (Acct.Sales_Team__c!=null) && (Trigger.isBefore)){
               AccontSalesTeamLookup.getSaleTeamDetails(acct);
            }      
        if (Trigger.isAfter  &&  Acct.Hardware_Owner__c!=null){
             AccountTeamMember AcctTeam=new AccountTeamMember();
            AcctTeam.AccountId=acct.Id;
            AcctTeam.UserId=acct.Hardware_Owner__c;
            AcctTeam.TeamMemberRole ='Sales Rep';
            listAcctTeam.add(AcctTeam);   
            
           /* AccountShare AcctSh=new AccountShare();
            accsh.AccountId =acct.id;
            accsh.UserOrGroupId=acct.Hardware_Owner__c;
            accsh.AccountAccessLevel='Read Only';
            listAcctShare.add(accsh);*/
        }
      }
       insert listAcctTeam;
        //insert listAcctShare();
    }    
    
   /* if (trigger.isUpdate && Trigger.isAfter  ){
          for(Account acct : trigger.new){
              if (Acct.Hardware_Owner__c!=null){
                  AccountTeamMember AcctTeam=new AccountTeamMember();
                  AcctTeam.AccountId=acct.Id;
                   AcctTeam.UserId=acct.Hardware_Owner__c;
                  AcctTeam.TeamMemberRole ='Sales Rep';
                  listAcctTeam.add(AcctTeam);
              
              for(Account oldAcct:trigger.old){
                    AccountTeamMember AcctTeamRemove=new AccountTeamMember();           
                     AcctTeamRemove.AccountId=oldAcct.Id;
                     AcctTeamRemove.UserId=oldAcct.Hardware_Owner__c;
                    AcctTeamRemove.TeamMemberRole ='Sales Rep';
                     listAcctTeamRemove.add(AcctTeam);
                 }
              }
          }
        
   
    upsert listAcctTeam;
   delete listAcctTeamRemove;
    }*/
}