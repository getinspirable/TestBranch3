public class RetrivePickListValues {

    public List<selectoption> getoptions(){
        list<selectoption> options=new List<selectoption>();
        Schema.DescribeFieldResult FieldRes=schema.sobjectType.Account.fields.Type;
        
            options.add(new selectoption('--none--','--none--'));
            for(pickListEntry ent:FieldRes.getpicklistvalues()){
                options.add(new selectoption(ent.getvalue(),ent.getlabel()));
            }
        return options;
        }   
}