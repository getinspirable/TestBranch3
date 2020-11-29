public with sharing class APIopenWeather {

    public string temp{set;get;}
     public string temp_min{set;get;}
      public string temp_max{set;get;}
       public string pressure{set;get;}
        public string humidity{set;get;}
         public string city{set;get;}
         public Account Acct{set;get;}

    public APIopenWeather(ApexPages.StandardController stdcontroller) {
    
       Account Acct=(Account) stdcontroller.getRecord();
        
     Account  A1= [select Id,ShippingCity from Account where Id=:Acct.Id];
      String apikey='c779ac28a4c17e8a58efcb3170d7d8ad';
      
      string shippingCity=A1.ShippingCity;
      
      string reqEndpoint='http://api.openweathermap.org/data/2.5/weather';
      reqEndpoint+='?q='+shippingCity;
      reqEndpoint +='&units=metric';
      reqEndpoint+='&APPID='+apikey;
      
     
      Http http=new Http();
      HttpRequest request=new HttpRequest();
      request.setEndPoint(reqEndpoint);
      request.setMethod('GET');
      
      HttpResponse response=http.send(request);
      
      if (response.getStatusCode()==200){
         Map<string,object> results= (Map<string,object>)JSON.deserializeUntyped(response.getBody());
         city=String.valueOf(results.get('name'));
         Map<String,object> mainresults=(Map<String,Object>)(results.get('main'));
         temp=String.ValueOf(mainresults.get('temp'));
         pressure=String.ValueOf(mainresults.get('pressure'));
                  temp_min=String.ValueOf(mainresults.get('temp_min'));
          temp_max=String.ValueOf(mainresults.get('temp_max'));
          humidity=String.ValueOf(mainresults.get('humidity'));
          }
          Else{
              ApexPages.Message myMsg=new ApexPages.Message(ApexPages.Severity.Error,'There was an error in reading data');
              ApexPages.addMessage(myMsg);
          }

    }

}