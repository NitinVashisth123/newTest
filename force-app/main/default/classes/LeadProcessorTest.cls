@isTest
public class LeadProcessorTest {
    @isTest
    public static void testbatchclass(){
    List<lead> l= new list<lead>();
        for(integer i=0;i<200;i++)
        {
           l.add(new lead(Lastname='nitin'+i,company='salesforce'));
           
        }
        insert l;
            Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp, 200);
        Test.stopTest();
        
        List<lead> updatedleads=[select id from lead where leadsource='Dreamforce'];
        system.assertEquals(200, updatedleads.size());
   }
    

    
}