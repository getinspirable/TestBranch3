public class AccountExtention {

    public final Account acct;
    public AccountExtention(ApexPages.StandardController controller) {
      this.acct=(Account)controller.getRecord();
      
    }
   public string getGreeting(){
     return acct.name;
   }
}