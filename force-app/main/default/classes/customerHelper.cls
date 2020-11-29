public class customerHelper
{
  public static void createInvoiceOnActive(List<apex_customers__c> custList,map<id,apex_customers__c>oldCustMap)
  { 
    system.debug('trigger fired:'+custlist);
    List<apex_invoice__C> invList= new List<apex_invoice__c>();
    for(apex_customers__C newCustList:custList)
    {
      system.debug('In for loop :'+custlist);
      if(newCustList.APEX_Customer_Status__c == 'Active' && oldCustMap.get(newCustList.id).APEX_Customer_Status__c == 'inactive')
      { 
           system.debug('in if condition:'+custlist);
          apex_invoice__C invobj=new apex_invoice__C();
          invobj.apex_status__C='Paid';
          invobj.apex_customer__c=newCustList.id;
          invList.add(invobj);
      }
    }
    system.debug('before update');
    insert invList;
  }
}