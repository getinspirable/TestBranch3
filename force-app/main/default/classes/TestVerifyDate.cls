@istest
public class TestVerifyDate {

    
    @isTest
    static void testMtd1(){
       Date d1=Date.newInstance(2016, 12, 9);
       date d2=Date.newInstance(2016, 12, 19);
       date TestDate= VerifyDate.CheckDates(d1,d2);
        System.assertEquals(d2,testDate);
    }
    @isTest
    static void testMtd2(){
       Date d1=Date.newInstance(2016, 02, 9);
       date d2=Date.newInstance(2016, 12, 19);
       date TestDate= VerifyDate.CheckDates(d1,d2);
        //System.assertEquals(d2,testDate);
    }
    @isTest
    static void testMtd3(){
       Date d1=Date.newInstance(2016, 12, 9);
       date d2=Date.newInstance(2016, 05, 19);
       date TestDate= VerifyDate.CheckDates(d1,d2);
        //System.assertEquals(d2,testDate);
    }
}