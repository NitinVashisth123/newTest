import { LightningElement, api } from 'lwc';

export default class Target_config extends LightningElement {

    @api firstName ='Amit';
    @api strTitle ='Welcome in Salesforce';
    @api showImage =false;
    @api imgUrl ='';
}