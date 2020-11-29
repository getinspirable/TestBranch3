public class AccountUpsert {

    public Account account { get; set; }
   
  
    public AccountUpsert()
    {
       Id acctid=ApexPages.currentPage().getParameters().get('id');
      account= (acctid==null)?new Account():[select id,name,phone,Industry from Account where id=:acctid];
    
    }
    public pageReference updateSave()
    {
       try
       {
         upsert account;
       }
       catch(System.DMLException ex)
       {
        ApexPages.addMessages(ex);
        return null;
       }  
       
       pageReference sucessredirect=new ApexPages.StandardController(Account).view();
       return sucessredirect;
    
    }
    
}