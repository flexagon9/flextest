global with sharing class DreamHouseSampleDataController {
//worshop modification test
    @RemoteAction
    global static void deleteAll() {
        DELETE [SELECT ID FROM favorite__c];    
        DELETE [SELECT ID FROM property__c];    
        DELETE [SELECT ID FROM broker__c];
    }
    
}