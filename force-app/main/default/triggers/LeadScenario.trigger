trigger LeadScenario on Lead (before insert) {
 for(Lead l : trigger.new)
 {
     if(l.LeadSource=='Web')
     {
         l.Rating='cold';
     }
     else
         l.Rating='hot';
 }
}