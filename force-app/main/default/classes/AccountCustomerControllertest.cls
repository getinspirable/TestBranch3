public class AccountCustomerControllertest {

   
     public Account account { get; set; }
 
    


  
  public AccountCustomerControllertest()
  {
     account = [select id,name,site from Account where id=:ApexPages.currentPage().getparameters().get('id')];
  }
  public PageReference Save() {
    
        update account;
        return null;
    }
  
  
}