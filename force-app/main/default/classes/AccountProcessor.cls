public class AccountProcessor {
    
    @future 
    public static void countContacts (string[] acc){
        integer cc,i;
        list<Account> AccList=new List<Account>();
        for (i=0;i<acc.size();i++){
          cc=  [select count() from contact where contact.Account.id=:acc[i]];
            Account a=new Account();
            a.id=acc[i];
            a.Number_of_Contacts__c=cc;
            AccList.add(a);
        }
        update AccList;
    }

}