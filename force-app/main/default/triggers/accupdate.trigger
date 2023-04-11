trigger accupdate on Account (after update) {
   list<contact> conlist=new list<contact>();
map<id,Account> accountIds=new map<id,account>();

for(Account acc:trigger.new)
{
    accountIds.put(acc.id, acc);
}
Map<id, Account> accList=new Map<id, Account> ([select id, phone,(select id, phone from contacts) from account where id in:accountIds.keyset()]);

for(account a:trigger.new)
{
    list<contact> con=accList.get(a.id).contacts;
    for(contact cc:con)
    {
        cc.Phone=a.phone;
        conList.add(cc);
    }
}
Update conList;

}