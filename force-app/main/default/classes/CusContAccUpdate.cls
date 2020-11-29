public class CusContAccUpdate {
    
    private final Account account;
    public CusContAccUpdate()
    {
     account = [select id,name,site from Account where id=:ApexPages.currentPage().getParameters().get('id')];
    }
    public Account getGetAcct() {
        return account;
    }

}