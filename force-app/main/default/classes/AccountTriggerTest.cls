@istest public class AccountTriggerTest {

    @isTest public static void testAccountShippindState(){
        List<Account> acctList=new List<account>();
        for(integer i=0; i<200; i++){
            Account acct=new Account();
            acct.name ='Acct' + i;
            acct.BillingState ='CA';
            acctList.add(acct);
        }
     
        test.startTest();
              insert acctlist;
        test.stopTest();
        
        list<account> verifyBillState=[select id,name from account where billingstate='CA'];
          
       system.assertEquals(200, verifyBillState.size());
       list<account> verifyshippState=[select id,name from account where ShippingState='CA'];
          
       system.assertEquals(200, verifyshippState.size());
        
        
    } 
    
}