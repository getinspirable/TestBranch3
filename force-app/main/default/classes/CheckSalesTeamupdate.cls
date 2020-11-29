public class CheckSalesTeamupdate {

    public static list<Account> checkupdate(list<Account> acctList,map<id,Account> oldMapAcct){
        list<Account> updateAccList =new list<Account>();
        for (account acc:acctList){
            if ( acc.sales_Team__C != oldMapAcct.get(acc.id).sales_Team__C){
                updateAccList.add(acc);
            }
                
        }
        return updateAccList;
    }
}