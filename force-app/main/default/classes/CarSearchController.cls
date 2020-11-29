public with sharing class CarSearchController {
    @AuraEnabled
    public static list<Car__c> getCars(string carTypeId){
      
        if (carTypeId != null && carTypeId.equalsIgnoreCase('')){
            return[select id,Name,Picture__C,Contact__r.Name,
                  Geolocation__latitude__s,Geolocation__longitude__s
                  from Car__C
                  where Available_For_Rent__c = true];
            
        }
        else{
            return[select id,Name,Picture__C,Contact__r.Name,
                  Geolocation__latitude__s,Geolocation__longitude__s
                  from Car__C
                  where Car_Type__c = :carTypeId 
                   AND Available_For_Rent__c = true ];
        }
    }

}