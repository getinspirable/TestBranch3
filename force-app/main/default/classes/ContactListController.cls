public with sharing class ContactListController {

     @AuraEnabled
     public static List<Contact> findAll() {
         return [SELECT id, LastName,name, phone FROM Contact LIMIT 50];
     }

     @AuraEnabled
     public static List<Contact> findByName(String searchKey) {
         String name = '%' + searchKey + '%';
         return [SELECT id, LastName, phone FROM Contact WHERE name LIKE :name LIMIT 50];
     }

     @AuraEnabled
     public static Contact findById(String contactId) {
         system.debug('ContacitID:'+contactId);
         return [SELECT id,LastName, name, title, phone, mobilephone, Account.Name
                     FROM Contact WHERE Id = :contactId];
     }


 }