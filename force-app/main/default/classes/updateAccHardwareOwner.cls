public class updateAccHardwareOwner {
    public static void Fieldupdate(list<accountTeamMember> listAllATM){
         if (GlobalClass.accountTeamFlag==False ){
           
            list<Account> listAcct=new List<Account>();
            for (AccountTeamMember ATM:listAllATM){
                if (ATM.AccountId!=null){
                   
                    Account Acct=new Account();
                    acct.id=ATM.AccountId;
                    acct.Hardware_Owner__c=ATM.userid;
                    listAcct.add(acct);
                    
                }
                 GlobalClass.accountTeamFlag=true;
                if (!listAcct.isempty()) {update listAcct;}
               
            }
    }
    }

}