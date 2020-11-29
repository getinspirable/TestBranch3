public class StudentDetClass {
      public StudentInfo__c stuDet;
    public string Name1 {get;set;}
    public string inputFirstName {get;set;}
    public string inputMotherName {get;set;}
    public string inputFatherName {get;set;}
     public string inputAddress {get;set;} 
   
    public void Search() {
		//stuDet = [select id,name,first_name__C,father_name__c,mother_name__c,Address__c from StudentInfo__c where id =: ApexPages.currentPage().getParameters().get('id')];
        if (Name1!=null){
            Name1='%'+name1+'%';
              stuDet = [select id,name,first_name__C,father_name__c,mother_name__c,Address__c from StudentInfo__c where name like :name1 limit 1];
             Name1=stuDet.Name;
            inputFirstName=stuDet.First_Name__c;
            inputMotherName=stuDet.Mother_Name__c;
            inputFatherName=stuDet.Father_Name__c;
            inputAddress=stuDet.Address__c;
            
        }
        
    }
    public void cancel(){
       // new ApexPages.StandardController(studet).cancel;
    }
	
	public PageReference save() {
        StudentInfo__c stuDet=new StudentInfo__c();
        stuDet.name=Name1;
        stuDet.First_Name__c=inputFirstName;
        stuDet.Mother_Name__c=inputMotherName;
        stuDet.Father_Name__c=inputFatherName;
        stuDet.Address__c=inputAddress;
        upsert stuDet;
		//database.insert(stuDet) ;
		//apex/StudentDet?sfdc.tabName=
		PageReference redirecturl = new PageReference( '/' + stuDet.Id);
       return redirecturl;
        
        
		//PageReference pref = new ApexPages.StandardController(stuDet).view();
		//return pref;
	}
}