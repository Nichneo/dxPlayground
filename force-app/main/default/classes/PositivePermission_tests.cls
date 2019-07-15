@isTest
private class PositivePermission_tests{
  @TestSetup
  static void testSetup(){
    Account a = TestFactory.getAccount('New POS Account', true);
    Private_Object__c po = new Private_Object__c(account__c = a.id, notes__c = 'foo');
    insert po;
  }
  @isTest static void PermissionSetTestPositive() {
    User u = TestFactory.generateUser('Custom User');
    System.runAs(u){
      Private_Object__c[] pos;
      Test.startTest();
      pos = [SELECT Id, Account__c, notes__c FROM Private_Object__c];
      Test.stopTest();
      System.assert(pos.size() == 1, 'user can see any Private Object record');
    }
  }
}