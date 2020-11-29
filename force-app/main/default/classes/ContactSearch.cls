public class ContactSearch {
    public static List<Contact> searchForContacts(string LName,string postalcode){
        List<contact> Conlist=[select id,name from contact where LastName=:LName and MailingPostalCode=:postalcode];
        return Conlist;
    }
}