@isTest
public class usingoldmap {
     static testMethod void insertacc1() {
       
         account acc = new account(phone ='45795254', name = 'harrrrrryyyy');
          insert acc;
        
         Test.startTest();
         acc.name = 'harrrrrryyyy45795254';
         update acc;
         Test.stopTest();
    }
      static testMethod void insertacc2() {
       
         account acc = new account(phone ='567678', name = 'rajesh');
          insert acc;
        
         Test.startTest();
         acc.phone = 'Phone number is same';
         update acc;
         Test.stopTest();
    }

}