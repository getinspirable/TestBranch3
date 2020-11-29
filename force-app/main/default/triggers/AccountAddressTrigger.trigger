trigger AccountAddressTrigger on Account (before insert,before update) {
   
      for(Account A:trigger.new){
      if ((a.Match_Billing_Address__c) ){
            system.debug('testing trigger');
          if((a.BillingPostalCode != null)){
              a.shippingpostalcode=a.billingpostalcode;
          }
        
     }  
    
}
}