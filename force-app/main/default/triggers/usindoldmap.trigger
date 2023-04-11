trigger usindoldmap on Account (before update) {
    for(account acc : trigger.new)
    {
        
        if(acc.phone==Trigger.oldMap.get(acc.id).phone)
        {
            acc.phone.addError('Phone number is same');
        }
         if(acc.phone!=Trigger.oldMap.get(acc.id).phone)
        {
            acc.name=acc.name + acc.phone;
        }
    }

}