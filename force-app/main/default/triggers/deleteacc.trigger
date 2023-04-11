trigger deleteacc on Account (before delete) {
    if(trigger.isbefore && trigger.isdelete)
  deleteaccHelper.deleteAcc(trigger.old);
        
        
 }