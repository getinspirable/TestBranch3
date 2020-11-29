global class DailyLeadProcessor implements Schedulable {
    
     global void execute(SchedulableContext ctx) {
      
         list<lead> newlead=new list<lead>();
         list<lead> oldlead=[select id ,leadsource from lead where leadsource=null];
         if(!oldlead.isEmpty()) {
             for (lead le:oldlead){
            
             le.leadsource='Dreamforce';
             newlead.add(le);
         }
         }
         update newlead;
     }

}