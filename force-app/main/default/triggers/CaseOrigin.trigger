trigger CaseOrigin on Case (before insert) {
    
    for(case c : trigger.new)
    {
        if(c.origin=='Email')
        {
            c.Status='New';
            c.priority='Medium';
        }
    }

}