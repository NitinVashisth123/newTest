public class projectapex {
    Public String Name{get;set;}
    Public String Email{get;set;}
    Public String Phone{get;set;}
    
    
    public PageReference projectapexmethod(){
        Project__c c=new Project__c();
        c.Name=Name;
      c.Email__c=Email;
        c.Phone__c=Phone;
      
        insert c;
        PageReference pageref=new PageReference('/apex/thankspage');
        return pageref;
    }
}