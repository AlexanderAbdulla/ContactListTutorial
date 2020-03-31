public with sharing class ContactListController {

    @AuraEnabled
    public static List<Account> getAllSquadAccounts(){
        //Id IN (SELECT Parent__c FROM Child__c)
        return [SELECT id, name FROM Account WHERE id IN (SELECT Account__c FROM Squad_Member__c)];
    }

    @AuraEnabled
    public static List<Contact> getSquadMembers(String accountId){
        return [SELECT id, name, title, image__c FROM Contact WHERE id IN (SELECT Contact__c FROM Squad_Member__c WHERE Account__c = :accountId)];
    }

}