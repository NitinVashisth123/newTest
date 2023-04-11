@isTest
private class googleCallTest {
    @isTest
    static void testMyMethod() {
        Event testEvent = new Event(Subject='Test Event', StartDateTime=DateTime.now(), EndDateTime=DateTime.now().addHours(2), Description='Test Description');
        insert testEvent;

        //Test.startTest();
        gooogleCall.myMethod();
        //Test.stopTest();
        
        Event[] events = [SELECT Id, Subject, StartDateTime, EndDateTime, Description FROM Event WHERE Id = :testEvent.Id];
        System.assertEquals(1, events.size(), 'Expected one event');
        System.assertEquals('Test Event', events[0].Subject, 'Unexpected subject');
        System.assertEquals('Test Description', events[0].Description, 'Unexpected description');
    }
}