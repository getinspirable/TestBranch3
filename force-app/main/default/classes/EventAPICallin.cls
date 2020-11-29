@Restresource(urlMapping = '/Event/*')
global class EventAPICallin{

    @httpPost
    //subject,location,activityDate,endDate,ownerID,Date StartDate,DAte EndDate,activityDate=date.parse(SDate),endDate=date.parse(EDate)
    global static ID CreatEvent(string Name,string StartDate,string EndDate){
        
        event newevent=new event();
        newevent.Subject = 'Email';
        newevent.Subject= name;
        newEvent.StartDateTime= Datetime.parse(startDate);
        newEvent.EndDateTime=Datetime.parse(EndDate);
        
        insert newevent;
        return newEvent.id;
    }
    
}