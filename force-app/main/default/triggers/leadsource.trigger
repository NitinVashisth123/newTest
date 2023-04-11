trigger leadsource on Lead (before insert) {
    for(lead l : trigger.new)
    {
        if(l.leadsource=='web')
            l.Rating='hot';
            
        else
            l.Rating='cold';
        
    }

}