public class mapdemo {
    
    public void mapdemomethod()
    {  list<account> acc=[select id , name from account limit 2];
     
       map<ID,account> accidmap=new map<ID,account>(acc);  
     system.debug(accidmap);
        //map<ID,account> accidmap=new map<ID,account>([select id, name from account limit 2]);
        //system.debug('accidndrecord'+ accidmap);
        //map<integer,string> intstrmap=new map<integer,string>();
         //map<integer,string> intstrmap1=new map<integer,string>();
        //intstrmap.put(1,'A');
        //intstrmap.put(2,'B');
          //intstrmap.put(3,'B');
       // intstrmap.remove(2);
         //system.debug('intstrmap=>'+intstrmap);
       //system.debug('intstrmap=>'+intstrmap.size());
      // List<string> strlist=new list<string>();
        //strlist=intstrmap.values();
        //system.debug('intstrmap=>'+strlist);
        
        //set<integer> intlist=new set<integer>();
        //intlist=intstrmap.keyset();
        //system.debug('intstrmap=>'+ intstrmap);
       //intstrmap1= intstrmap.clone();
         // system.debug('intstrmap1=>'+ intstrmap1);
        //system.debug('intstrmap=>'+ intstrmap.containskey(2));
        //system.debug('intstrmap=>'+ intstrmap.get(2));
        
    }

}