@isTest
private class Calculator_Tests {

  @isTest static void testAddition() {
    Test.startTest();
    System.assertEquals(Calculator.addition(2,3), 5, 'Expected to get 5');
    Test.stopTest();
  }

  @isTest static void testSubtraction() {
    Test.startTest();
    System.assertEquals(Calculator.subtraction(3,2), 1, 'Expected to get 1');
    Test.stopTest();
  }

  @isTest static void testMultiply() {
    Test.startTest();
    System.assertEquals(Calculator.multiply(2,1), 2, 'Expected to get 2');
    Test.stopTest();
  }

  @isTest static void testDivide() {
    Test.startTest();
    System.assertEquals(Calculator.divide(3,1), 3, 'Expected to get 3');
    Test.stopTest();
  }

   @isTest static void testNegativeMultiply() {
    Test.startTest();
    List<Boolean> excMultiply = new List<Boolean>();
    try{
      Calculator.multiply(2,0);
    }
    catch (Calculator.CalculatorException cex){
      if(cex.getMessage().equalsIgnoreCase('It doesn\'t make sense to multiply by zero')){
        excMultiply.add(true);
      }
    }
    Test.stopTest();
    for(Boolean b : excMultiply){
      System.assert(b, 'Class should have thrown an exception');
    }
  }

   @isTest static void testNegativeDenominator() {
    Test.startTest();
    List<Boolean> excDenominator = new List<Boolean>();
    try{
      Calculator.divide(2,0);
    }
    catch (Calculator.CalculatorException cex){
      if(cex.getMessage().equalsIgnoreCase('you still can\'t divide by zero')){
        excDenominator.add(true);
      }
    }
    Test.stopTest();
    for(Boolean b : excDenominator){
      System.assert(b, 'Class should have thrown an exception');
    }
  }

  @isTest static void testNegativeNumerator() {
    Test.startTest();
    List<Boolean> excNumerator = new List<Boolean>();
    try{
      Calculator.divide(-2,1);
    }
    catch (Calculator.CalculatorException cex){
      if(cex.getMessage().equalsIgnoreCase('Division returned a negative value.' + -2)){
        excNumerator.add(true);
      }
    }
    Test.stopTest();
    for(Boolean b : excNumerator){
      System.assert(b, 'Class should have thrown an exception');
    }
  }

}