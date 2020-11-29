@isTest
private class LeadProcessorTest {
    
  @testSetup  
      static void setup() {
         list<Lead> le=new List<lead>();
          for(integer i=0;i<200; i++){
              le.add(new lead(lastname='Siri'+i,company='ABCCompany'));
          }
          insert le;
      }
     
    static testmethod void testmtd1(){
        test.startTest();
        LeadProcessor uca = new LeadProcessor();
       id batchid=Database.executeBatch(uca);
        test.stopTest();
        //list<string> st= (string)[select leadsource from lead limit 1];
       // System.assertEquals('Dreamforce ',st[0]);
    }    

}