public with sharing class DisplayPhotosController
{

    @AuraEnabled
    public static List<Image__c> retrieveImages()
    {
        return [SELECT id__c, albumId__c, title__c, url__c, thumbnailUrl__c FROM Image__c];
    }
    @AuraEnabled
    public static List<Image__c> searchByTitle(String inTitle)
    {
        return [SELECT url__c,title__c FROM Image__c WHERE title__c LIKE :inTitle + '%'];
    }
}