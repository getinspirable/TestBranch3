public class ServiceContractClass {
    
    public list<wrapperScClass> WrapSClist { get; set; } 
    public opportunity opp1{get;set;}
   // private final opportunity acct1;

     public String radioBtnValue { get; set; } 
     public Boolean closeWindow {get;set;}

   
    
    public ServiceContractClass(ApexPages.StandardController controller){
       
        WrapSClist =new list<wrapperScClass>(); 
        // acct1=(opportunity)controller.getRecord();
         opp1 = (opportunity)controller.getRecord();
       opportunity p1=[select accountId from opportunity  where id=:opp1.Id];
    
        for(serviceContract__c s:[select id,name,years__c,PlanType__c,AccountID__c from serviceContract__C where AccountID__C=:p1.AccountId])
       {
           WrapSClist.add(new wrapperScClass(false,s));
        }
    }
    
     public void checkSelectedValue(){
        
         system.debug('raidobtmvalue:'+radioBtnValue);
        //  String selcontactid = System.currentPagereference().getParameters().get('conid');  
         //Get the ID of the selected contact
        // system.debug('Valueselcontactid:'+selcontactid);
    //integer indexVal = Integer.valueof(system.currentpagereference().getparameters().get('index')); 
          
           //  system.debug('ValueindexVal:'+indexVal);
        // closeWindow=true;
         
          // window.close();
          //opportunity opppp=new opportunity();
      // system.PageReference  page1=apexpages.StandardController(opppp).view();
      /* Pagereference pageref;
        pageref = new PageReference('/' + opp1.Id);
        pageref.setRedirect(true);
        return pageref;*/
       
      }
    public PageReference updateopp(){
         system.debug('raidobtmvalue:'+radioBtnValue);
        
        for(wrapperScClass wc:WrapSClist){
            system.debug('wraprecord:'+wc);
        }
        opportunity p=new opportunity();
        p.id=opp1.id;
        p.serviceContract__c=radioBtnValue;
        update p;
        
        PageReference redirecturl = new PageReference( '/' + opp1.Id);
        return redirecturl;
}
        
    
    Public class wrapperScClass{
       public  serviceContract__c SC {get;set;}
       public boolean isSelected{get;set;}
        
       public wrapperScClass(boolean Sel ,serviceContract__c a){
         SC=a;
         isSelected=Sel;
       }
       
    }

}