public class check {
  public static Map<String,Integer> mp=new Map<String,Integer>();
    public static void fun()
    {
        mp.put('first',1);
        mp.put('second',2);
        mp.put('third',3);
        mp.put('fourth',4);
        mp.put('five',5);  
    }
    public static void fun2(){
        system.debug(mp.get('first'));
          system.debug(mp.get('second'));
    }
}