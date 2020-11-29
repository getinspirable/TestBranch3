@isTest
private class customerTriggerTestClass{
   static testMethod void myUnitTest() {
      //create Date for customer object
      
      apex_customers__C objcust = new apex_customers__c();
      objcust.name='Test Customer';
      objcust.apex_customer_status__C='inactive';
      insert objcust;
      
      Test.startTest();
      objCust.apex_customer_status__C = 'Active';
      update objcust;
      Test.StopTest();
      
      List<apex_invoice__c> invList=[select id,apex_customer__C from
        apex_invoice__C where apex_customer__c=:objcust.Id ];
        system.assertEquals(1,invList.size());
        
      }
      }