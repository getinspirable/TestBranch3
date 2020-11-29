@Restresource(urlmapping='/cases/*')
global with sharing class CaseManager {
@httpGet
    global static case getCaseById(){
        RestRequest request=RestContext.request;
        string caseId = request.requestURI.substring(request.requestURI.lastIndexof('/')+1);
        case result = [select casenumber,subject,status,origin,priority from case where id=:caseId];
        return result;
    }
}