trigger customerAfterUpdate on APEX_customers__c (after update) {

customerHelper.createInvoiceOnActive(trigger.new,trigger.oldmap);
}