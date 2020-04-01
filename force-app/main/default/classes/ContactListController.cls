public with sharing class ContactListController {

    @AuraEnabled
    public static List<Account> getAllSquadAccounts(){
       return [SELECT id, name FROM Account WHERE id IN (SELECT Account__c FROM Squad_Member__c)];
    }

    @AuraEnabled
    public static List<Contact> getSquadMembers(String accountId){
        return [SELECT id, name, title, image__c FROM Contact WHERE id IN (SELECT Contact__c FROM Squad_Member__c WHERE Account__c = :accountId)];
    } 

    @AuraEnabled
    public static String getAccountValidation(String contactId){

        Integer count = [SELECT COUNT() FROM Squad_Member__c WHERE Contact__c = :contactId];
        String accountValidation = 'Oh boy, if you are seeing this Alex made an Apex error';

        if(count == 1) {
            accountValidation = 'This character belongs to one account';
        } else if (count == 2) {
            accountValidation =  'This character belongs to two accounts';
        } else if (count > 2) {
            accountValidation = 'The number of accounts is TOO DANG HIGH!';
        }
        return accountValidation;
    }

}