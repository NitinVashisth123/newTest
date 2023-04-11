@isTest
public class TestVerifyDate {
    
    @isTest static void testdate1()
    {
        Date myDate = Date.newInstance(1960, 2, 17);
     Date newDate = mydate.addDays(2);
       Date OG = VerifyDate.CheckDates(myDate,newDate);
     system.assertEquals(newDate,OG);
       
    
}
     
    @isTest static void testdate2()
    {
        Date myDate = Date.newInstance(1960, 2, 17);
     Date newDate = mydate.addDays(40);
       Date OG = VerifyDate.CheckDates(myDate,newDate);
     system.assertEquals(newDate,OG);
       
    
}
}