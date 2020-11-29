public class AccountUtils {
    public static List<account> accountsByState (string st1){
        list<account> ListAcct =new list<account>();
        listAcct=[select id,name from account  where billingstate=:st1];
        return listAcct;
    }

}