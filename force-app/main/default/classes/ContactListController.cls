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

    @AuraEnabled
    public static String getAccountValidation(String contactId){
        /*
        only 1 account, display an info toast message, "<Name of Member> belongs to only 1 account."
        to 2 accounts, display an info toast message, "<Name of Member> belongs to multiple accounts."
        more than 2 accounts, display an error toast message, "<Name of Member> belongs to a high # of accounts.
         Please validate with admin."*/
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