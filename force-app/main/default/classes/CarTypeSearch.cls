public class CarTypeSearch {
    @AuraEnabled
    public static List<car_type__c> getcartype(){
        system.debug('in severCall');
        list<car_type__c> ll=[select id,name from Car_Type__c];
        return ll;
    }

}