@istest
private class DailyLeadProcessorTest {
     static String CRON_EXP = '0 0 0 15 3 ? 2022';
    @testsetup
    static void setup(){
        
        list<lead> listLead=new List<lead>();
        for (integer i=0;i<10; i++){
            listlead.add(new lead(lastname='lead1'+i,company='TestCom'));
        }
        insert listlead;
    }
    
    static testmethod void testmtd1(){
                system.debug('testing started...');
        test.startTest();
        DailyLeadProcessor job1=new DailyLeadProcessor();
          system.schedule('schededapex','20 30 8 10 2 ?',job1);
        test.stopTest();
        system.debug('testing done');
      System.assertEquals(200,[select count() from Lead where Leadsource = 'DreamForce']);
       
        
    }

}