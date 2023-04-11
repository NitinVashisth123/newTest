public class StringArrayTest {
    
    public static List<string> generateStringArray(Integer num)
    {
        Integer i;
     List<string> result= new List<string>();
       
        for(i=0;i<num;i++)
            result.add('Test '+i);
        
         return result;
    }
    
   
}