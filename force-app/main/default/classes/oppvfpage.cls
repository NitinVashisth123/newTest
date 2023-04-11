public class oppvfpage {
    
    public Opportunity opp {get;set;}
    public List<Opportunity> opportunities {get;set;}
    
    public oppvfpage () {
        opp = new Opportunity();
		opportunities = new List<Opportunity>();
    }
    
    public void showOpp() {
        if(opp.StageName == 'Prospecting'){
            opportunities = [SELECT Id, Name, StageName FROM Opportunity WHERE StageName='Prospecting'];
        }
        if(opp.StageName == 'Qualification'){
            opportunities = [SELECT Id, Name, StageName FROM Opportunity WHERE StageName='Qualification'];
        }
        if(opp.StageName == 'Need Analysis'){
            opportunities = [SELECT Id, Name, StageName FROM Opportunity WHERE StageName='Need Analysis'];
        }
        if(opp.StageName == 'Need Analysis'){
            opportunities = [SELECT Id, Name, StageName FROM Opportunity WHERE StageName='Need Analysis'];
        }
        if(opp.StageName == 'Closed Won'){
            opportunities = [SELECT Id, Name, StageName FROM Opportunity WHERE StageName='Closed Won'];
        }
        if(opp.StageName == 'Closed Lost'){
            opportunities = [SELECT Id, Name, StageName FROM Opportunity WHERE StageName='Closed Lost'];
        }
   
    }
    
     
}