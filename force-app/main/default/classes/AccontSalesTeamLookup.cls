public class AccontSalesTeamLookup {

    public  static void getSaleTeamDetails(Account Acct){
        
    
            
             sales_Team__c st= [select st1__c,st2__c,st3__c from sales_Team__c where id=:Acct.Sales_Team__c] ;
             Acct.st1__c=st.St1__c;
             Acct.st2__c=st.st2__c;
             Acct.st3__c=st.st3__c;
       }

    
}