@isTest
private class myDataGenerationTests {
    @TestSetup
    static void loadMockData(){
        List<SObject> accounts = Test.loadData(Account.SObjectType, 'Mock_Data');
    }
    @isTest static void testloadMockData() {
        List<Account> accts = [SELECT ID FROM Account];
        System.assert(accts.size() == 15, 'expected 15 accounts');

    }
}