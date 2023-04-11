trigger quoteing on QuoteLineItem (after update) {
    
   Set<Id> OppLineId =  new Set<Id>();
   Map<id,OpportunityLineItem> OppLineIdVsRecord = new Map<Id,OpportunityLineItem>();
   List<OpportunityLineItem> OpportunityLineItemToUpdate = new List<OpportunityLineItem>();
   for(QuoteLineItem QuoteLineItem : trigger.new)
   {
      if(QuoteLineItem.OpportunityLineItemId!=null)
      {
          OppLineId.add(QuoteLineItem.OpportunityLineItemId);
      }
       
   }
    
    List<OpportunityLineItem> OpportunityLineItemList = [select id,name,test_data__c from OpportunityLineItem where id in : OppLineId];
    for(OpportunityLineItem OpportunityLineItem : OpportunityLineItemList)
    {
        OppLineIdVsRecord.put(OpportunityLineItem.Id, OpportunityLineItem);
    }
    
   for(QuoteLineItem QuoteLineItem : trigger.new)
   {
     
       OpportunityLineItem oppLineItem = OppLineIdVsRecord.get(QuoteLineItem.OpportunityLineItemId);
       OpportunityLineItem opp = new OpportunityLineItem();
         opp.id=QuoteLineItem.OpportunityLineItemId;
         opp.test_data__c = QuoteLineItem.test_field__c;
       OpportunityLineItemToUpdate.add(opp);
       
   }
    update OpportunityLineItemToUpdate;
}