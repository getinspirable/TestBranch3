@istest
public class ParkLocatorTest {
    @istest static void testMtd(){
         Test.setMock(WebServiceMock.class, new ParkServiceMock());
       
      
        string[] result = ParkLocator.country('India');
        // Verify that a fake result is returned
        //System.assertEquals(3.0, result); 
    }

}