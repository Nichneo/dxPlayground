@isTest
private class ExternalSearch_tests {
@isTest static void test_method_one() {
    HttpMockFactory mock = new HttpMockFactory(200, 'OK', 'I found it!', new Map<String,String>());
    Test.setMock(HttpCalloutMock.class, mock);
    String result;
    Test.startTest();
      result = ExternalSearch.googleIt('epic search');
    Test.stopTest();
    system.assertEquals('I found it!', result); 
  }
@isTest static void test_method_two() {
    HttpMockFactory mock = new HttpMockFactory(500, 'Internal Server Error', 'Error 500', new Map<String,String>());
    Test.setMock(HttpCalloutMock.class, mock);
    String result;
    Test.startTest();
    List<Boolean> excHttp = new List<Boolean>();
    try {
        result = ExternalSearch.googleIt('epic search');
    } catch (ExternalSearch.ExternalSearchException ese) {
        if(ese.getMessage().equalsIgnoreCase('Did not recieve a 200 status code: 500')){
        excHttp.add(true);
        }
    }
    Test.stopTest();
    for(Boolean b : excHttp){
      System.assert(b, 'Class should have thrown an exception');
    } 
  }
}