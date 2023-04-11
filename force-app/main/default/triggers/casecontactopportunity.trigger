trigger casecontactopportunity on case (before insert) {
    
    List<contact> conlist = [select id, (select id,name from opportunities) 
                                                                from contact where Id IN :Trigger.newMap.keySet()];

}