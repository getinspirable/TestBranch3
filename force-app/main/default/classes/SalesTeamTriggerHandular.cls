public class SalesTeamTriggerHandular {
    
    Public static void  UpdateAccont(list<sales_team__C> Steam){
        for(sales_team__c st:steam){
            SalesTeamBatchUpdateAcct  myBatchObject=new SalesTeamBatchUpdateAcct(st);
            Id batchId = Database.executeBatch(myBatchObject, 50);
        }
        
    }
    
    public static list<sales_Team__C> CheckSTUpdate(list<sales_team__C> newst,map<id,sales_team__C> oldST){
        
        list<sales_Team__C> listST=new List<saleS_Team__C>();
        for(sales_team__C st:newst){
            sales_team__c mapSt=new sales_Team__c();
            if(st.St1__c!=mapst.St1__c || st.St2__c!=mapst.St2__c || st.St3__c!=mapst.St3__c){
                listst.add(st);
            }
        }
        return listst;
    }

}