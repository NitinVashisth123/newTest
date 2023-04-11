trigger updatephone on Account (after update) {
   
  List<Account> acclist=new list<account>();    
  for(Account acc :acclist)
  {
    string newphone= '1664566';
     string newname='naina123';
     if(acc.phone==newphone) 
     {
         acc.phone=acc.phone;
     }
      else
          acc.phone=newphone;
          acc.name=newname;
  }
  update acclist;
    }