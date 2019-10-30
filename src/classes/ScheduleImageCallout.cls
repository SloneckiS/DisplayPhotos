global class ScheduleImageCallout implements Schedulable {

    global void execute(SchedulableContext SC) {
        List<Image__c> images =  [SELECT Id FROM Image__c ];
        ImageCallout.makeGetCallout();
        delete images;
    }
}