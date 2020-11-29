@RestResource(urlMapping='/Contact11/*')
global with sharing  class ContactManagement {
 
    @HttpGET
    global  static contact getContactData(){
       
        RestRequest req=RestContext.request;
        RestResponse res=RestContext.response;
        String contactid= req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        contact result= [SELECT Id, AccountId, LastName, FirstName FROM Contact where id=:contactid];
        return result;
    }
    
      @HttpPOST
    Global static void CreateCon(){
         RestRequest req=RestContext.request;
        map<string,object> params= (map<string,object>)system.JSON.deserializeUntyped(req.requestBody.toString());
        list<object> records=(list<object>)params.get('records');
        
        system.debug('recordslist:'+records);
        list<contact> contactList=new list<contact>();
        for(object record1: records){
            
           map<string,object> item=(map<string,object>)record1;
           system.debug(item.get('LastName'));
           contact cc= new contact();
            cc.LastName=item.get('LastName').toString();
            cc.FirstName= item .get('FirstName').toString();
                contactList.add(cc);
            
        }
        insert  contactList;
        /*
		contact cc=new contact();
        cc.LastName=LastName;
        cc.FirstName=FirstName;
        insert cc;
        return cc.Id;*/
    }

    /*<Global static void createContact(){
        string fieldname,fieldvalue,fvalue;
         RestRequest req=RestContext.request;
        
         string arr=req.requestBody.toString();
      
      JSONParser parser= json.createParser(arr);
        
        while(Parser.nextToken()!=null){
            if(parser.getCurrentToken()!= JSONToken.END_OBJECT){
                parser.nextValue();
                
               fieldname= parser.getCurrentName();
                fieldvalue=parser.getText();
                if(fieldname ==  'LastName'){
                    fvalue=fieldvalue;
                }
                if (fvalue !=null){
                  contact c1=new contact();
        			 c1.LastName =  fvalue; 
                     insert c1;
            	}
            }
        }
      
       
       
        
    }*/
    
    @HttpPATCH
    Global static ID  UpdateContact1(){
         RestRequest req=RestContext.request;
      
         String contactid= req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
         Contact thiscontact1=[select id from contact where id=:contactid];
        
        map<string,object> params= (map<string,object>)system.JSON.deserializeUntyped(req.requestBody.toString());
        for (string fieldName: params.keySet()){
            thiscontact1.put(fieldName,params.get(fieldName));
        }
        update thiscontact1;
        return thiscontact1.id;
    
        
    }
    @httpDelete
    global static void deleteContact(){
         RestRequest req=RestContext.request;
     
 
        String contactid= req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
         Contact contact1=[select id from contact where id=:contactid];
        delete contact1;
    }
    
}