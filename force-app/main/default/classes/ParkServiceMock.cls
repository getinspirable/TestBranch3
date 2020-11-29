@istest
global class ParkServiceMock implements WebServiceMock {
global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        ParkService.byCountryResponse response_x=new parkService.byCountryResponse();
               string[] s1=new string[]{'Anamudi shola National park','Anshi National Park','Bandipur National Park'};
        response_x.return_x = s1;
        // end
        response.put('response_x', response_x); 
   }
}