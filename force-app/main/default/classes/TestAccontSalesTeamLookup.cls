@istest
public class TestAccontSalesTeamLookup {

    TestMethod public static void testMethod1(){
       
        sales_Team__c st=new sales_Team__c();
        st.name='Sales1';
        st.St1__c=30;
        st.st2__c=40;
        st.st3__c=50;
        insert st;
         Account acct=new Account();
        acct.name='siriAcct';
        acct.Sales_Team__c=st.id;
        insert acct;
        
        test.startTest();
        AccontSalesTeamLookup.getSaleTeamDetails(acct);
        test.stopTest();
        
        //system.assertEquals(expected, actual)
        
    }
}