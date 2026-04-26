unit PE.Tests.BoundedTypes.Digit;
{$ASSERTIONS ON}
{$BOOLEVAL OFF}
{$DEFINITIONINFO ON}
{$DENYPACKAGEUNIT ON}
{$EXTENDEDSYNTAX ON}
{$HIGHCHARUNICODE ON}
{$HINTS ON}
{$IMPLICITBUILD OFF}
{$IMPORTEDDATA OFF}
{$IOCHECKS ON}
{$LOCALSYMBOLS ON}
{$OPTIMIZATION ON}
{$POINTERMATH OFF}
{$RANGECHECKS ON}
{$REFERENCEINFO ON}
{$SCOPEDENUMS ON}
{$STACKFRAMES OFF}
{$WARNINGS ON}
{$WRITEABLECONST OFF}

interface

uses
  PE.Actors.Rando,  //In the interface section for inlining
  PE.Delphi.TypeIdentity,  //In the interface section for inlining
  PE.Types;

type
  ExecutableSpecification_Digit_Defintion = record
  strict private
    class procedure TheSystemUnderTestRecognizesTheTermDigitDotZeroAsEquatingToTheNaturalNumberOf0(); static; inline;
    class procedure TheSystemUnderTestRecognizesTheTermDigitDotOneAsEquatingToTheNaturalNumberOf1(); static; inline;
    class procedure TheSystemUnderTestRecognizesTheTermDigitDotTwoAsEquatingToTheNaturalNumberOf2(); static; inline;
    class procedure TheSystemUnderTestRecognizesTheTermDigitDotThreeAsEquatingToTheNaturalNumberOf3(); static; inline;
    class procedure TheSystemUnderTestRecognizesTheTermDigitDotFourAsEquatingToTheNaturalNumberOf4(); static; inline;
    class procedure TheSystemUnderTestRecognizesTheTermDigitDotFiveAsEquatingToTheNaturalNumberOf5(); static; inline;
    class procedure TheSystemUnderTestRecognizesTheTermDigitDotSixAsEquatingToTheNaturalNumberOf6(); static; inline;
    class procedure TheSystemUnderTestRecognizesTheTermDigitDotSevenAsEquatingToTheNaturalNumberOf7(); static; inline;
    class procedure TheSystemUnderTestRecognizesTheTermDigitDotEightAsEquatingToTheNaturalNumberOf8(); static; inline;
    class procedure TheSystemUnderTestRecognizesTheTermDigitDotNineAsEquatingToTheNaturalNumberOf9(); static; inline;
    class procedure TheSystemUnderTestRecognizesTheNumericalEstablishmentOfTheDigitRangeAsStartingWith0AndEndingWith9(); static; inline;
  strict private
    class procedure TheSystemUnderTestRecognizesTheSmallestPossibleValueOfDigitAs0(); static; inline;
    class procedure TheSystemUnderTestRecognizesTheLargestPossibleValueOfDigitAs9(); static; inline;
    class procedure TheSystemUnderTestRecognizesDigitAsAnEntityThatHasTypeIdentity(); static; inline;
  strict private
    class procedure TheSystemUnderTestRecognizesSymmetricAssignmentCompatibilityBetweenAnObserverOfDigitAndAnObserverOfDigit(); static; inline;
    class procedure TheSystemUnderTestRecognizesSymmetricAssignmentCompatibilityBetweenAnObserverOfIntegerAndAnInstanceOfDigit(); static; inline;
  public
    class procedure Exercise(); static; inline;
  end;

implementation

{ ExecutableSpecification_Digit_Defintion }

class procedure ExecutableSpecification_Digit_Defintion.Exercise;
begin
  TheSystemUnderTestRecognizesTheTermDigitDotZeroAsEquatingToTheNaturalNumberOf0();
  TheSystemUnderTestRecognizesTheTermDigitDotOneAsEquatingToTheNaturalNumberOf1();
  TheSystemUnderTestRecognizesTheTermDigitDotTwoAsEquatingToTheNaturalNumberOf2();
  TheSystemUnderTestRecognizesTheTermDigitDotThreeAsEquatingToTheNaturalNumberOf3();
  TheSystemUnderTestRecognizesTheTermDigitDotFourAsEquatingToTheNaturalNumberOf4();
  TheSystemUnderTestRecognizesTheTermDigitDotFiveAsEquatingToTheNaturalNumberOf5();
  TheSystemUnderTestRecognizesTheTermDigitDotSixAsEquatingToTheNaturalNumberOf6();
  TheSystemUnderTestRecognizesTheTermDigitDotSevenAsEquatingToTheNaturalNumberOf7();
  TheSystemUnderTestRecognizesTheTermDigitDotEightAsEquatingToTheNaturalNumberOf8();
  TheSystemUnderTestRecognizesTheTermDigitDotNineAsEquatingToTheNaturalNumberOf9();
  //
  TheSystemUnderTestRecognizesTheNumericalEstablishmentOfTheDigitRangeAsStartingWith0AndEndingWith9();
  TheSystemUnderTestRecognizesTheSmallestPossibleValueOfDigitAs0();
  TheSystemUnderTestRecognizesTheLargestPossibleValueOfDigitAs9();
  TheSystemUnderTestRecognizesSymmetricAssignmentCompatibilityBetweenAnObserverOfDigitAndAnObserverOfDigit();
  TheSystemUnderTestRecognizesSymmetricAssignmentCompatibilityBetweenAnObserverOfIntegerAndAnInstanceOfDigit();
  TheSystemUnderTestRecognizesDigitAsAnEntityThatHasTypeIdentity();
end;

class procedure ExecutableSpecification_Digit_Defintion.TheSystemUnderTestRecognizesDigitAsAnEntityThatHasTypeIdentity();
begin
  System.Assert(System.Assigned(Digit.TypeIdentity));
end;

class procedure ExecutableSpecification_Digit_Defintion.TheSystemUnderTestRecognizesSymmetricAssignmentCompatibilityBetweenAnObserverOfDigitAndAnObserverOfDigit;
var
  Actual,
  Observer: Digit;
begin
  Observer := 0;
  Actual := 0;
  System.Assert(0 = Observer);
  System.Assert(0 = Actual);
  System.Assert(Observer = 0);
  System.Assert(Actual = 0);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 1;
  Actual := 1;
  System.Assert(1 = Observer);
  System.Assert(1 = Actual);
  System.Assert(Observer = 1);
  System.Assert(Actual = 1);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 2;
  Actual := 2;
  System.Assert(2 = Observer);
  System.Assert(2 = Actual);
  System.Assert(Observer = 2);
  System.Assert(Actual = 2);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 3;
  Actual := 3;
  System.Assert(3 = Observer);
  System.Assert(3 = Actual);
  System.Assert(Observer = 3);
  System.Assert(Actual = 3);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 4;
  Actual := 4;
  System.Assert(4 = Observer);
  System.Assert(4 = Actual);
  System.Assert(Observer = 4);
  System.Assert(Actual = 4);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 5;
  Actual := 5;
  System.Assert(5 = Observer);
  System.Assert(5 = Actual);
  System.Assert(Observer = 5);
  System.Assert(Actual = 5);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 6;
  Actual := 6;
  System.Assert(6 = Observer);
  System.Assert(6 = Actual);
  System.Assert(Observer = 6);
  System.Assert(Actual = 6);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 7;
  Actual := 7;
  System.Assert(7 = Observer);
  System.Assert(7 = Actual);
  System.Assert(Observer = 7);
  System.Assert(Actual = 7);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 8;
  Actual := 8;
  System.Assert(8 = Observer);
  System.Assert(8 = Actual);
  System.Assert(Observer = 8);
  System.Assert(Actual = 8);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 9;
  Actual := 9;
  System.Assert(9 = Observer);
  System.Assert(9 = Actual);
  System.Assert(Observer = 9);
  System.Assert(Actual = 9);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
end;

class procedure ExecutableSpecification_Digit_Defintion.TheSystemUnderTestRecognizesSymmetricAssignmentCompatibilityBetweenAnObserverOfIntegerAndAnInstanceOfDigit();
var
  Actual: Digit;
  Observer: Integer;
begin
  Observer := 0;
  Actual := 0;
  System.Assert(0 = Observer);
  System.Assert(0 = Actual);
  System.Assert(Observer = 0);
  System.Assert(Actual = 0);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 1;
  Actual := 1;
  System.Assert(1 = Observer);
  System.Assert(1 = Actual);
  System.Assert(Observer = 1);
  System.Assert(Actual = 1);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 2;
  Actual := 2;
  System.Assert(2 = Observer);
  System.Assert(2 = Actual);
  System.Assert(Observer = 2);
  System.Assert(Actual = 2);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 3;
  Actual := 3;
  System.Assert(3 = Observer);
  System.Assert(3 = Actual);
  System.Assert(Observer = 3);
  System.Assert(Actual = 3);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 4;
  Actual := 4;
  System.Assert(4 = Observer);
  System.Assert(4 = Actual);
  System.Assert(Observer = 4);
  System.Assert(Actual = 4);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 5;
  Actual := 5;
  System.Assert(5 = Observer);
  System.Assert(5 = Actual);
  System.Assert(Observer = 5);
  System.Assert(Actual = 5);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 6;
  Actual := 6;
  System.Assert(6 = Observer);
  System.Assert(6 = Actual);
  System.Assert(Observer = 6);
  System.Assert(Actual = 6);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 7;
  Actual := 7;
  System.Assert(7 = Observer);
  System.Assert(7 = Actual);
  System.Assert(Observer = 7);
  System.Assert(Actual = 7);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 8;
  Actual := 8;
  System.Assert(8 = Observer);
  System.Assert(8 = Actual);
  System.Assert(Observer = 8);
  System.Assert(Actual = 8);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
  Observer := 9;
  Actual := 9;
  System.Assert(9 = Observer);
  System.Assert(9 = Actual);
  System.Assert(Observer = 9);
  System.Assert(Actual = 9);
  System.Assert(Observer = Actual);
  System.Assert(Actual = Observer);
end;

class procedure ExecutableSpecification_Digit_Defintion.TheSystemUnderTestRecognizesTheSmallestPossibleValueOfDigitAs0();
begin
  System.Assert(0 = Digit.Min);
  System.Assert(Digit.Min = 0);
  System.Assert(0 = System.Low(Digit.Range));
  System.Assert(System.Low(Digit.Range) = 0);
end;

class procedure ExecutableSpecification_Digit_Defintion.TheSystemUnderTestRecognizesTheTermDigitDotZeroAsEquatingToTheNaturalNumberOf0();
var
  SystemObserver: Integer;
begin
  SystemObserver := 0;
  System.Assert(0 = SystemObserver);
  System.Assert(SystemObserver = 0);
  System.Assert(Digit.Zero = 0);
  System.Assert(0 = Digit.Zero);
end;

class procedure ExecutableSpecification_Digit_Defintion.TheSystemUnderTestRecognizesTheLargestPossibleValueOfDigitAs9;
begin
  System.Assert(9 = Digit.Max);
  System.Assert(Digit.Max = 9);
  System.Assert(9 = System.High(Digit.Range));
  System.Assert(System.High(Digit.Range) = 9);
end;

class procedure ExecutableSpecification_Digit_Defintion.TheSystemUnderTestRecognizesTheNumericalEstablishmentOfTheDigitRangeAsStartingWith0AndEndingWith9;
begin
  System.Assert(0 = System.Low(Digit.Range));
  System.Assert(9 = System.High(Digit.Range));
end;

class procedure ExecutableSpecification_Digit_Defintion.TheSystemUnderTestRecognizesTheTermDigitDotEightAsEquatingToTheNaturalNumberOf8;
var
  SystemObserver: Integer;
begin
  SystemObserver := 8;
  System.Assert(8 = SystemObserver);
  System.Assert(SystemObserver = 8);
  System.Assert(Digit.Eight = 8);
  System.Assert(8 = Digit.Eight);
end;

class procedure ExecutableSpecification_Digit_Defintion.TheSystemUnderTestRecognizesTheTermDigitDotFiveAsEquatingToTheNaturalNumberOf5;
var
  SystemObserver: Integer;
begin
  SystemObserver := 5;
  System.Assert(5 = SystemObserver);
  System.Assert(SystemObserver = 5);
  System.Assert(Digit.Five = 5);
  System.Assert(5 = Digit.Five);
end;

class procedure ExecutableSpecification_Digit_Defintion.TheSystemUnderTestRecognizesTheTermDigitDotFourAsEquatingToTheNaturalNumberOf4;
var
  SystemObserver: Integer;
begin
  SystemObserver := 4;
  System.Assert(4 = SystemObserver);
  System.Assert(SystemObserver = 4);
  System.Assert(Digit.Four = 4);
  System.Assert(4 = Digit.Four);
end;

class procedure ExecutableSpecification_Digit_Defintion.TheSystemUnderTestRecognizesTheTermDigitDotNineAsEquatingToTheNaturalNumberOf9;
var
  SystemObserver: Integer;
begin
  SystemObserver := 9;
  System.Assert(9 = SystemObserver);
  System.Assert(SystemObserver = 9);
  System.Assert(Digit.Nine = 9);
  System.Assert(9 = Digit.Nine);
end;

class procedure ExecutableSpecification_Digit_Defintion.TheSystemUnderTestRecognizesTheTermDigitDotOneAsEquatingToTheNaturalNumberOf1();
var
  SystemObserver: Integer;
begin
  SystemObserver := 1;
  System.Assert(1 = SystemObserver);
  System.Assert(SystemObserver = 1);
  System.Assert(Digit.One = 1);
  System.Assert(1 = Digit.One);
end;

class procedure ExecutableSpecification_Digit_Defintion.TheSystemUnderTestRecognizesTheTermDigitDotSevenAsEquatingToTheNaturalNumberOf7;
var
  SystemObserver: Integer;
begin
  SystemObserver := 7;
  System.Assert(7 = SystemObserver);
  System.Assert(SystemObserver = 7);
  System.Assert(Digit.Seven = 7);
  System.Assert(7 = Digit.Seven);
end;

class procedure ExecutableSpecification_Digit_Defintion.TheSystemUnderTestRecognizesTheTermDigitDotSixAsEquatingToTheNaturalNumberOf6;
var
  SystemObserver: Integer;
begin
  SystemObserver := 6;
  System.Assert(6 = SystemObserver);
  System.Assert(SystemObserver = 6);
  System.Assert(Digit.Six = 6);
  System.Assert(6 = Digit.Six);
end;

class procedure ExecutableSpecification_Digit_Defintion.TheSystemUnderTestRecognizesTheTermDigitDotThreeAsEquatingToTheNaturalNumberOf3;
var
  SystemObserver: Integer;
begin
  SystemObserver := 3;
  System.Assert(3 = SystemObserver);
  System.Assert(SystemObserver = 3);
  System.Assert(Digit.Three = 3);
  System.Assert(3 = Digit.Three);
end;

class procedure ExecutableSpecification_Digit_Defintion.TheSystemUnderTestRecognizesTheTermDigitDotTwoAsEquatingToTheNaturalNumberOf2;
var
  SystemObserver: Integer;
begin
  SystemObserver := 2;
  System.Assert(2 = SystemObserver);
  System.Assert(SystemObserver = 2);
  System.Assert(Digit.Two = 2);
  System.Assert(2 = Digit.Two);
end;

end.
