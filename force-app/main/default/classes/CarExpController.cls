public with sharing class CarExpController {
    @AuraEnabled
    public static list<Car_Experience__c> getCarExperience(Id CarId){
        return [select Id,
                       Name,
                       Experience__c,
                       LastModifiedDate,
                       CreatedDate,
                       CreatedBy.Name,
                       CreatedBy.MediumPhotoUrl,
                       CreatedBy.CompanyName
                FROM Car_Experience__c
                Where Car__c = :Carid
                order by CreatedDate DESC];
            
        
    }
}