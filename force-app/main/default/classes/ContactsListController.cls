public class ContactsListController {
    private final Account cc;
     public ContactsListController(ApexPages.StandardController stdController) {
        this.cc = (Account)stdController.getRecord();
         system.debug(this.cc.id);
    }
 public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [select name,lastname,firstname,description,accountid from contact where accountid=:this.cc.id]));
            }
            return setCon;
        }
        set;
    }

    // Initialize setCon and return a list of records
    public List<Contact> getContacts() {
       return (List<Contact>) setCon.getRecords();

}
}