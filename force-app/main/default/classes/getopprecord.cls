public class getopprecord {
     @AuraEnabled
    public static List<opportunity> getopportunityRecord()
   {
        return new List<opportunity>([Select id,Name,Amount from opportunity]);
    }

}