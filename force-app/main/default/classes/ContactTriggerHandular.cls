public class ContactTriggerHandular {
    public static void rollupsummayContact(list<contact> contactList){
        set<id> AcctId=new set<id>();
        for (contact con :contactlist){
            if (con.AccountId!= null)
            acctid.add(con.AccountId);
           
        }
 system.debug('acctid'+AcctId);
        list<account> newAcctList=new list<account>();
        list<AggregateResult> agrRes=[select accountid,count(id)cc from contact where accountid IN :acctid and accountid !=null group by accountId];
        integer size=agrRes.size();
        system.debug('aggreate:'+agrRes);
        for (integer i=0; i<size; i++){
            aggregateResult acc=agrRes.get(i);
            
            id aid=(Id)acc.get('accountid');
            decimal count = (decimal)acc.get('cc');
            account aa1=new account(id=aid,Number_of_Contacts__c	=count);
            newAcctList.add(aa1);
            if (AcctId.contains(aid)){
                acctid.remove(aid);
            }
        }
        for (ID aa:AcctId){
             account aa1=new account(id=aa,Number_of_Contacts__c=0);
            newAcctList.add(aa1);
        }
 system.debug('updatelist:'+newAcctList);
        if(!newAcctList.Isempty()){
            system.debug('updating Accoutlist:'+newAcctList);
            update newAcctList;
        }
        
    }
    public static list<contact> ValidateDublicate(list<contact> contactList){
        
       set<string> newEmaillist=new set<string>();
        
        for(contact con : contactlist){
            if(con.Email!=null){
                newEmaillist.add(con.Email);
            } 
        }
        system.debug('method starting: '+newEmaillist );
        list<Contact> Debcontacts =new list<contact>();
       // list<contact> DeblicateContacts= new list<contact>([select id,Name,Email from contact where email IN:newEmaillist]);
       // set<string> dubExitEmails  new Set<string>();
        map<id,contact> dublicatEmailIds= new map<id , contact>([select id,Name,Email from contact where email IN:newEmaillist and email!=null]);
                   for (contact con: contactlist){
               
                if(dublicatEmailIds.containsKey(con.id)){
                  
                   Debcontacts.add(new contact(id=con.id,email=con.email));
                }else{
                    dublicatEmailIds.put(con.id,new contact(id=con.id,email=con.email));
                }
            }
          
        return Debcontacts;
        
        
    }
}