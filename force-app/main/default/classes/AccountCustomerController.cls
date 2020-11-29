public class AccountCustomerController {
  //Added comments
  //Added second comments to class
  //Third comment added
    public PageReference Save() {
    
        update account;
        return null;
    }


  private final Account account;
  public AccountCustomerController()
  {
     account = [select id,name,site from Account where id=:ApexPages.currentPage().getparameters().get('id')];
  }
  
  public Account getAccount()
  {
     return account;
  }
  
}