public class CustomListController1Class {

    public List<Account> getAccounts() {
       
        return (List<Account>)acct.getRecords();
    }

  
    public ApexPages.standardSetController acct{
    
      get{ 
        
         if (acct==null){
      
                acct= new ApexPages.standardSetController(Database.getquerylocator([select Name,AccountNumber from Account]));
            }
            return acct;
          }
      set;
    }

    public string getAccount() {
         return null;
    }

}