@isTest
public class testSalesTeamBatchUpdateAcct {

   static testMethod void testMethod1() 
    {
        sales_team__C st=new sales_Team__C();
        st.Name='Sales11';
        st.st2__c=10;
        st.st1__c=20;
        st.st3__c=30;
        
        insert st;
        
        List<Account> lstAccount= new List<Account>();
        for(Integer i=0 ;i <200;i++)
        {
            Account acc = new Account();
            acc.Name ='Name'+i;
            acc.Sales_Team__c=st.id;
            lstAccount.add(acc);
        }
        
        insert lstAccount;
        
       /* sales_team__C st1=new sales_Team__C();
        st1.Name='Sales11';
        st1.st2__c=122;
         st1.st1__c=122;  
         st1.st3__c=122; 
        insert st1;*/
        
        Test.startTest();           
            SalesTeamBatchUpdateAcct  myBatchObject=new SalesTeamBatchUpdateAcct(st);
            Database.executeBatch(myBatchObject);
        Test.stopTest();
        
    }
         
}