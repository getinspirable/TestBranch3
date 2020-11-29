public class AddPrimaryContact implements Queueable {
    Contact contact1;
    string st1;
    
    public AddPrimaryContact(Contact record, string state1) {
     
        this.contact1=record;
        this.st1=state1;
        
        
    }
    public void execute(QueueableContext context) {
      list<account> Acct=[select id,name,billingstate from account where billingstate=:this.st1]  ;
        list<contact> listcontact=new List<Contact>();
       
        for (Account a:Acct){
            Contact clonedContact= this.contact1.clone(false);
            clonedcontact.AccountId=a.id;
            clonedContact.lastname='Test'+a.name;
            listcontact.add(clonedcontact);
        }
        insert listcontact;
            
    }
}