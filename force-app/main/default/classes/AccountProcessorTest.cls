@Istest
public class AccountProcessorTest {

    @istest
    public static void  testmtd(){
        string[] acc1=new string[]{'0016g000007jpIB','0016g000008p7h3'};
       // acc1=(string[])[select id from account where Account.name ='aaryan' or account.name='harshit'];
       test.startTest();
        AccountProcessor.countContacts(acc1);
        test.stopTest();
    }
}