trigger DuplicateAccountRestrict on Account (before insert,before update) {
    if(trigger.isInsert || trigger.isUpdate){
       // DuplicateAccountRestrictHelper(trigger.new);
    }

}