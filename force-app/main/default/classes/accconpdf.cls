public class accconpdf {
   public List<Account> acclist {get; set;} 
public accconpdf(){ 
acclist = [select Name, AccountNumber from Account]; 
} 
    
}