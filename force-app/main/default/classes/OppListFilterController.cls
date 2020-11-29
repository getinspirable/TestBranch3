public class OppListFilterController {
 private final Account cc;
    public string strOppStatus{get;set;}
     public OppListFilterController(ApexPages.StandardController stdController) {
        this.cc = (Account)stdController.getRecord();
        // system.debug(this.cc.id);
         
    }
   /* public ApexPages.StandardSetController getopps {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Id, OwnerId, LeadSource, IsClosed, CloseDate, Amount, Description,stageName, Name FROM Opportunity where accountid=:this.cc.id]));
            }elseif(strOppStatus!=null){
                 setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Id, OwnerId, LeadSource, IsClosed, CloseDate, Amount, Description,stageName, Name FROM Opportunity where accountid=:this.cc.id]));
  
            }
            return setCon;
        }
        set;
    }*/
    public List<opportunity> getopps(){
        list<opportunity> opplist;
        if ((strOppStatus==null)){
        	opplist=[SELECT Id, OwnerId, LeadSource, IsClosed, CloseDate, Amount, Description,stageName, Name FROM Opportunity where accountid=:this.cc.id];
        }else if(strOppStatus!=null){
           opplist=[SELECT Id, OwnerId, LeadSource, IsClosed, CloseDate, Amount, Description,stageName, Name FROM Opportunity where accountid=:this.cc.id and stageName=:strOppStatus];
 
        }
        return opplist;
    }    
     public List<SelectOption> getOppStatus(){
        
        Schema.DescribeFieldResult F =  opportunity.StageName.getDescribe();
        List<Schema.PicklistEntry> P = F.getPicklistValues();
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('','--All--'));
        for(Integer i = 0; i < P.size(); i++){
            options.add(new SelectOption(P[i].getValue(), P[i].getLabel()));
        }
        return options;
    }
   
      /*public List<opportunity> getopps() {
       return (List<opportunity>) setCon.getRecords();

}*/
}