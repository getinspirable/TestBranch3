public class RandomContactFactory{

    public static List<contact> generateRandomContacts(integer num,string Cname){
        List<contact> clist=new List<contact>();
        for(integer i=1; i<=num; i++){
            contact c=new contact(firstname='Test'+i ,LastName=cname+i);
            clist.add(c);
            
        }
        system.debug('listof contact:'+clist);
        return clist;
    }
}