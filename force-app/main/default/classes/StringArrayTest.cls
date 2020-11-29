public class StringArrayTest {

    public static list<string> generateStringArray(integer n1){
        list<string> str1=new list<string>();
        for(integer i=0; i<n1; i++){
           str1.add('Siri'+ i);
        }
        system.debug('String List:'+str1);
        return str1;   
        
    }
}