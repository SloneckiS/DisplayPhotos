public with sharing class MailModalController
{

    @AuraEnabled
    public static void sendEmail(String inAddress, String inAddressCc, String inSubject, String inBody)
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> toAddress = new List<String>{inAddress};
        List<String> toAddressCC = new List<String>{inAddressCc};
        mail.setToAddresses(toAddress);
        if (inAddressCc!=null )
        {
            mail.setCcAddresses(toAddressCC);
        }
        mail.setSubject(inSubject);
        mail.setPlainTextBody(inBody);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }

}