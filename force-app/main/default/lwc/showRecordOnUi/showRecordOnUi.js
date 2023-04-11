import { LightningElement,wire } from 'lwc';
import getAccounts from '@salesforce/apex/showAccount.returnacc';

const COLUMNS = [{label:'Account Name', fieldName:'Name'},
                 {label:'Industry', fieldName:'Industry'},
                {label:'phone', fieldName:'Phone'}];
 
export default class ShowRecordOnUi extends LightningElement {
columns = COLUMNS;
accounts = [];

@wire(getAccounts)
wiredAccounts({error,data}){
if(data){
    console.log('if data',data);
    this.accounts = data;
}
else if(error){
    console.error('error',error);
}
}

}