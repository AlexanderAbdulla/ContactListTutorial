public with sharing class ContactListController {
    
    @AuraEnabled
    public static List<Contact> findAll(){
        return [SELECT id, name, phone FROM Contact LIMIT 50];
    }

    @AuraEnabled
    public static List<Contact> findByName(String searchKey){
        String name = '%' + searchKey + '%';
        return [SELECT id, name, phone FROM Contact WHERE name LIKE :name LIMIT 50];
    }

    @AuraEnabled
    public static Contact findById(String contactId){
        return [SELECT id, name, title, phone, mobilephone, Account.Name FROM Contact WHERE Id = :contactId];
    }

    @AuraEnabled
    public static List<Account> getAllSquadAccounts(){
        //Id IN (SELECT Parent__c FROM Child__c)
        return [SELECT id, name FROM Account WHERE id IN (SELECT Account__c FROM Squad_Member__c)];
    }

}