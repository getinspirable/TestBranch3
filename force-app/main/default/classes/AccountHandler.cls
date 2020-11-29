public class AccountHandler {

    public static Account insertNewAccount (string AccName){
        
        try{
            Account acc=new Account(Name=AccName);
           insert acc;
            system.debug('Account Created:'+acc);
            return Acc;
            
        }catch(DMLException e){
            system.debug('Dml Exception Error:'+e.getMessage());
            return null;
        }
    }
}