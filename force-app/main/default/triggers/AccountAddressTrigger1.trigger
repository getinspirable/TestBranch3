trigger AccountAddressTrigger1 on Account (before insert,before update) {
   
      for(Account A:trigger.new){
      if ((a.Match_Billing_Address__c) ){
          if((a.BillingPostalCode != null)){
              a.shippingpostalcode=a.billingpostalcode;
              system.debug('trigger debug  '+a.BillingPostalCode);
          }
        
     }  
    
}
}