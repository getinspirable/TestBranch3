@isTest
public class AddPrimaryContactTest {
 @TestSetup
    static void setup(){
        
        list<account> act1=new List<account>();
        for(integer i=0;i<50; i++){
            act1.add(new account(name='TestAccount'+i,billingstate='NY'));
            act1.add(new account(name='TestAccount'+i,billingstate='CA'));
         
        }
        insert act1;
        
    }
    
    @istest
    static void testmtd(){
        
         contact cc=new contact(lastname='Madhu1');
        test.startTest();
       
      AddPrimaryContact newjob=new AddPrimaryContact(cc,'CA');

      System.enqueueJob(newjob);
        test.stopTest();
        
    }
}