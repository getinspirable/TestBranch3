public class classCustStatusupdate
{
    public static void methodCustStatus(List<apex_customers__c> custList,map<id,apex_customers__C> newMapCust, map<id,apex_customers__C> oldMapCust)
    {
      insertInvoice(custList,oldMapCust);
      updateInvoiceDes(custList,newmapCust);
       
    }
    public static void insertInvoice(List<apex_customers__c> custList,map<id,apex_customers__C>oldMapCust)
    {
        List<apex_invoice__c> invList=new List<apex_invoice__c>();
        for(apex_customers__c custObj:custList)
        { 
           if (custObj.apex_customer_status__C=='Active' && oldmapCust.get(custObj.id).apex_customer_status__c =='inactive')
           {
              apex_invoice__c invobj=new apex_invoice__C();
              invobj.apex_status__c='pending';
              invobj.apex_customer__C=custObj.id;
              invList.add(invobj);
         
           }
        }
        insert invList;
    }
     public static void updateInvoiceDes(List<apex_customers__c> custList,map<id,apex_customers__C> newMapCust)
    {
       list<apex_customers__C> custinvList= [select id,name,(select id,name from Invoices__r) 
                       from apex_customers__C where id In:newMapCust.keyset()];
       
       apex_invoice__C[] invList=custinvList[0].invoices__r;
     
        list<apex_invoice__C> invToUpdate=new  list<apex_invoice__C>();
       for(apex_invoice__C inv:invList)
       { 
         apex_invoice__c invobj=new apex_invoice__C();
         invobj.apex_description__c='update from trigger';
         invToUpdate.add(invobj);
         
          
       }
         update invToUpdate;           
    }

}