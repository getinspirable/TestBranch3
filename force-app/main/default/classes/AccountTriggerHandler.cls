public class AccountTriggerHandler {
    
    
    public static void UpdateOpportunity(map<id,string> mapOfAcct){
        
       list<Account> AcctOpp=[select id,(select id,name,OwnerId from Opportunities) from account where id in :mapOfAcct.keySet()];
       //map<id,list<Opportunity>> AcctOpp=new map<id,list<Opportunity>>(AccOpp);
       list<opportunity> listopp=new list<opportunity>();
        for(Account acct:AcctOpp){
            //system.debug('acctOpp:'+AcctOpp.get(acct.id).opportunity);
            for(opportunity opp:acct.opportunities){
                if (opp.OwnerId==mapOfAcct.get(acct.id)){
                    opportunity p1=new opportunity();
                    p1.id=opp.id;
                    p1.AccountId=acct.id;
                    p1.OwnerId=mapOfAcct.get(acct.id);
                    listopp.add(p1);
                }
                
            }
            if (!listopp.isempty()){update listopp;}
            
        }
        
    }
    
    
     public static list<Account> checkSalesTeam(list<Account> acctList, map<id,Account> oldMapAcct){
        list<Account> updateAccList =new list<Account>();
        for (account acc:acctList){
            if ( acc.sales_Team__C != oldMapAcct.get(acc.id).sales_Team__C){
                updateAccList.add(acc);
            }
                
        }
        return updateAccList;
    }
    public static map<id,string> checkAccountOwner(list<account> ListofAcct,map<id,account> oldMapAcct){
        //list<Account> updateAccList =new list<Account>();
        map<id,string> acctOwner =new map<id,string>();
        for (account acc:ListofAcct){
            if ( acc.OwnerId != oldMapAcct.get(acc.id).OwnerId){
                //.add(acc);
                acctOwner.put(acc.id,oldMapAcct.get(acc.id).OwnerId);              
            }
                
        }
        return acctOwner;
    }
    public static list<Account> checkExUserupdate(list<account> ListofAcct,map<id,account> oldMapAcct){
        list<Account> updateAccList =new list<Account>();
        for (account acc:ListofAcct){
            if ( acc.Exuser__C != oldMapAcct.get(acc.id).Exuser__C){
                updateAccList.add(acc);
            }
                
        }
        return updateAccList;
    }
    public static void UpdateEXUser(list<account> listOfAcct){
        set<id> userSet=new set<id>();
          for(account acc:listOfAcct){
                if (acc.ExUser__c!=null){
                userSet.add(acc.ExUser__c);
                }  
             
            }      
            if(userSet.isEmpty()){
                return;
            }
         //system.debug('listofset:'+userSet);
        list<user> usList= [select id,AU1__c,AU2__c,AU3__c,AccountUser__C from user where id IN :userSet];
         
            map<id, user> mapsales=new   map<id, user>(usList);
            
         for(account acc:listOfAcct){
             if (mapsales.get(acc.ExUser__C).AccountUser__C){
                 system.debug('items:'+mapsales.get(acc.ExUser__C).AU1__c);
             acc.U1__c= mapsales.get(acc.ExUser__C).AU1__c;
             acc.U2__c= mapsales.get(acc.ExUser__C).AU2__c;
             acc.U3__c= mapsales.get(acc.ExUser__C).AU3__c;
             }else{
                 acc.U1__c=0;
                  acc.U2__c=0;
                 acc.U3__c=0;
             }
         }
         
        
    }
    public static void salesTeam(list<account> listOfAcct){
        
      
        set<id> salesTeam=new set<id>();
            for(account acc:listOfAcct){
                if (acc.Sales_Team__c!=null){
                salesTeam.add(acc.Sales_Team__c);
                }
               
            }
      
            if(salesTeam.isEmpty()){
                return;
            }
          
            //map<id,list<Sales_Team__c>> mapsales=new  map<id,list<Sales_Team__c>>([select id,st1__c,st2__c,st3__c from sales_Team__c where id IN :salesTeam]);
             list<Sales_Team__c> st= [select id,st1__c,st2__c,st3__c from sales_Team__c where id IN :salesTeam];
         
            map<id, Sales_Team__c> mapsales=new   map<id, Sales_Team__c>(st);
             //mapsales.put(st.id,st);
              
         for(account acc:listOfAcct){
          
             acc.st1__c= mapsales.get(acc.Sales_Team__c).st1__c;
             acc.st2__c= mapsales.get(acc.Sales_Team__c).st2__c;
             acc.st3__c= mapsales.get(acc.Sales_Team__c).st3__c;
         }
         
            
        }
    public static void insertAcctTeam(List<account> listOfAcct){
       list<AccountTeamMember> listAcctTeam=new list<AccountTeamMember>();
       list<AccountShare> listAcctShare=new list<AccountShare>();
        if (GlobalClass.accountTeamFlag==False){
 
         for (account acct:listOfAcct){
            if (acct.Hardware_Owner__c!=null){
            AccountTeamMember AcctTeam=new AccountTeamMember();
            AcctTeam.AccountId=acct.Id;
            AcctTeam.UserId=acct.Hardware_Owner__c;
            AcctTeam.TeamMemberRole ='Sales Rep';
            listAcctTeam.add(AcctTeam); 
            
          /*  AccountShare accsh=new AccountShare();
            accsh.AccountId =acct.id;
            accsh.UserOrGroupId=acct.Hardware_Owner__c;
            accsh.AccountAccessLevel='Edit';
              // accsh.ContactAccessLevel='Edit';
                //accsh.CaseAccessLevel='Edit';
               accsh.OpportunityAccessLevel='Edit';           
                
            listAcctShare.add(accsh);  
*/         
            }
            
        }  
            GlobalClass.accountTeamFlag=true;
        if (!listAcctTeam.isEmpty()){ insert listAcctTeam; }
      //  if (!listAcctShare.isEmpty()){ insert ListAcctShare; }
        
        }
    }
    public static void DeleteAcctTeam(list<account> listofAcct,map<id,account> oldMapAcct){
      
        
         
            list<AccountTeamMember> listAT=[select id,Accountid,userid from AccountTeamMember where accountid in :listofAcct];
              //map<id, Account> mapAT=new   map<id, Account>(listAT);
           //set<id> tid =new set<id>();
           //tid=map.keySet();
             list<AccountTeamMember> removeAT=new list<AccountTeamMember>();
      		  for(account acc:listofAcct){
                  if (acc.Hardware_Owner__c!=null && acc.Hardware_Owner__c!=oldMapAcct.get(acc.id).Hardware_Owner__c){
                      for(AccountTeamMember AT:listAT){
                          if (AT.Accountid==acc.id && AT.userid!=acc.Hardware_Owner__c){
                              removeAT.add(AT);
                          }
                      }
                      
                  }       		 
               }
      
       /* system.debug('deleteStarted before for:') ; 
        *  list<AccountTeamMember> listAcctTeam=new list<AccountTeamMember>();
       list<AccountShare> listAcctShare=new list<AccountShare>();
         for (account acct:listofAcct){
             system.debug('insideforloopbeforeifstm');
            if( acct.Hardware_Owner__c!=null && acct.Hardware_Owner__c!=oldMapAcct.get(acct.id).Hardware_Owner__c){
              
                 system.debug('owenre:'+acct.Hardware_Owner__c);
                AccountTeamMember AcctTeam=new AccountTeamMember();
                AcctTeam.AccountId=acct.Id;
                AcctTeam.UserId=acct.Hardware_Owner__c;
                //AcctTeam.TeamMemberRole ='Sales Rep';
                listAcctTeam.add(AcctTeam); 
                
                AccountShare accsh=new AccountShare();
            accsh.AccountId =acct.id;
            accsh.UserOrGroupId=acct.Hardware_Owner__c;
            accsh.AccountAccessLevel='Read Only';
            listAcctShare.add(accsh);*/     
           if (!removeAT.isEmpty()){ database.delete(removeAT,false); }
          // if (!listAcctShare.isEmpty()){ database.delete(ListAcctShare) ; }
        }
        
    }