public class NewCaseListController {
 
    public List<case> getNewCases (){
        List<case> c1=new List<case>();
        c1=[select id,casenumber from  case where status='new'];
        return c1;
    }
}