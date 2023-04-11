trigger accURLshort on Account ( after update) {
if(Trigger.isAfter){
        if(Trigger.isUpdate){
            AccountURLShortner.generateBit(Trigger.new);
        }
    }
}