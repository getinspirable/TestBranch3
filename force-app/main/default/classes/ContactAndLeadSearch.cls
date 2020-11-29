public class ContactAndLeadSearch {
 
    public static list<list<SObject> > searchContactsAndLeads(string lname){
        list<list<SObject>> S1=[Find :lname in Name Fields returning Contact(LastName),Lead(LastName)];
        List<contact> cc=S1[0];
        list<Lead> AA=S1[1];
        System.debug('Contacts:' + cc +',Account:' + AA);
        return S1;
    }

}