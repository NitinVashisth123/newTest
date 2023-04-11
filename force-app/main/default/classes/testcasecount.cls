@isTest
public class testcasecount {
    static testMethod void insertCas1e() {
         Case cas = new Case(Status ='New', Priority = 'Medium', Origin = 'Email');
          insert cas;
    }
      

  static testMethod void insertCase3()
  {
			 Case[] deletedCase = [SELECT status FROM case WHERE status='New'];
			delete deletedCase;
	

  }

}