public class SendEmailManager {
 
    public static void SendEmailMessage(string address,string subject,string body){
        
       Messaging.SingleEmailMessage   mail=new Messaging.SingleEmailMessage();
         String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        
        messaging.sendEmail(new messaging.SingleEmailMessage[] {mail});
       
    }
}