public class schedulabledemo implements schedulable{

    public void execute(schedulablecontext sc){
        
        list<account> acc=[select Name from account where Name like 'test%'];
        for(account accs:acc){
            accs.Name=accs.Name +'support';
        }
        update acc;
        
    }
}