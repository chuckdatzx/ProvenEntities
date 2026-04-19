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
{
If the assumptions (listed in the PE.Tests unit) are True, then the PE.Types.Foundational.NaturalNumber type is "proven" to Strength(X) for both now and in any future execution scenarios,
where "Strength(X)" is defined in the PE.Tests unit.
[Chuck C.T. :: 4/14/20206 :: Claiming that the above is both sound and complete constructivist proof]
}
interface

uses
  PE.Actors.Rando,  //In the interface section for inlining
  PE.Delphi.TypeIdentity,  //In the interface section for inlining
  PE.Types;

type
  ExecutableSpecification_Digit_TypeCompleteTests = record
  strict private class var Digit_Default: Digit;
  public type
    Boundaries = record
    strict private
      class procedure TheLowestTypeAllowedValueIsZero(); static; inline;
      class procedure TheHighestTypeAllowedValueIs9(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Properties = record
    strict private {Min}
      class procedure TheMinPropertyReturnsZeroForADefaultInstance(); static; inline;
      class procedure TheMinPropertyReturnsZeroForANonDefaultInstance(); static; inline;
    strict private {Max}
      class procedure TheMaxPropertyReturns9ForADefaultInstance(); static; inline;
      class procedure TheMaxPropertyReturns9ForANonDefaultInstance(); static; inline;
    strict private {MonoCharMap}
      class procedure TheMonoCharMapPropertyProvidesAnArrayOfDigitsSuchThatEachDigitValueReturnsItsMonoCharValue(); static; inline;
    strict private {TypeIdentity}
      class procedure TheTypeIdentityPropertyContainsANonNullIdentifierMatchingTheSystemDotInfoRoutinesValue(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    TypeIdentity = record
    strict private
      class procedure HasItsOwnNonNullTypeIdentity(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class constructor Create();
  public
    class procedure TheDefaultValueIsZero(); static; inline;
  public
    class procedure Exercise(); static; inline;
  end;

  ExecutableSpecification_Digit_ValueCompleteTests = record
  public type
    AssignmentCompatibility = record
    strict private {PE Types}
      class procedure IsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeWhileRetainingNaturalNumberValues(); static; inline;
    strict private {Native Delphi Types}
      class procedure IsSymmetricallyAssignmentCompatibleWithTheByteTypeWhileRetainingByteValues(); static; inline;
      class procedure IsSymmetricallyAssignmentCompatibleWithTheIntegerTypeWhileRetainingIntegerValues(); static; inline;
      class procedure IsSymmetricallyAssignmentCompatibleWithTheUInt64TypeWhileRetainingUInt64Values(); static; inline;
      class procedure IsSymmetricallyAssignmentCompatibleWithTheWordTypeWhileRetainingWordValues(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;

procedure Exercise(); inline;

implementation

procedure Exercise(); inline;
begin
  ExecutableSpecification_Digit_TypeCompleteTests.Exercise();
  ExecutableSpecification_Digit_ValueCompleteTests.Exercise();
end;

{ExecutableSpecification_Digit_TypeCompleteTests}
class constructor ExecutableSpecification_Digit_TypeCompleteTests.Create;
begin
  Digit_Default := System.Default(Digit);
  System.Assert(System.Default(Digit) = Digit_Default);
end;

class procedure ExecutableSpecification_Digit_TypeCompleteTests.Exercise;
begin
  Boundaries.Exercise();
  Properties.Exercise();
  TheDefaultValueIsZero();
  TypeIdentity.Exercise();
end;

class procedure ExecutableSpecification_Digit_TypeCompleteTests.TheDefaultValueIsZero;
begin
  System.Assert(0 = Digit_Default);
end;

{ExecutableSpecification_Digit_TypeCompleteTests.Boundaries}
class procedure ExecutableSpecification_Digit_TypeCompleteTests.Boundaries.Exercise;
begin
  TheLowestTypeAllowedValueIsZero();
  TheHighestTypeAllowedValueIs9();
end;

class procedure ExecutableSpecification_Digit_TypeCompleteTests.Boundaries.TheLowestTypeAllowedValueIsZero();
begin
  System.Assert(9 = System.High(Digit));
end;

class procedure ExecutableSpecification_Digit_TypeCompleteTests.Boundaries.TheHighestTypeAllowedValueIs9();
begin
  System.Assert(0 = System.Low(Digit));
end;

{ExecutableSpecification_Digit_TypeCompleteTests.Properties}
class procedure ExecutableSpecification_Digit_TypeCompleteTests.Properties.Exercise;
begin
  TheMaxPropertyReturns9ForADefaultInstance();
  TheMaxPropertyReturns9ForANonDefaultInstance();
  TheMinPropertyReturnsZeroForADefaultInstance();
  TheMinPropertyReturnsZeroForANonDefaultInstance();
  TheMonoCharMapPropertyProvidesAnArrayOfDigitsSuchThatEachDigitValueReturnsItsMonoCharValue();
  TheTypeIdentityPropertyContainsANonNullIdentifierMatchingTheSystemDotInfoRoutinesValue();
end;

class procedure ExecutableSpecification_Digit_TypeCompleteTests.Properties.TheMonoCharMapPropertyProvidesAnArrayOfDigitsSuchThatEachDigitValueReturnsItsMonoCharValue();
begin
  System.Assert(10 = System.Length(Digit.MonoCharMap));
  System.Assert('0' = Digit.MonoCharMap[0]);
  System.Assert('1' = Digit.MonoCharMap[1]);
  System.Assert('2' = Digit.MonoCharMap[2]);
  System.Assert('3' = Digit.MonoCharMap[3]);
  System.Assert('4' = Digit.MonoCharMap[4]);
  System.Assert('5' = Digit.MonoCharMap[5]);
  System.Assert('6' = Digit.MonoCharMap[6]);
  System.Assert('7' = Digit.MonoCharMap[7]);
  System.Assert('8' = Digit.MonoCharMap[8]);
  System.Assert('9' = Digit.MonoCharMap[9]);
end;

class procedure ExecutableSpecification_Digit_TypeCompleteTests.Properties.TheMaxPropertyReturns9ForADefaultInstance;
begin
  System.Assert(9 = System.High(Digit));
  var Actual: Digit := Digit_Default;
  System.Assert(Actual = Digit_Default);
  System.Assert(9 = Actual.Max);
end;

class procedure ExecutableSpecification_Digit_TypeCompleteTests.Properties.TheMaxPropertyReturns9ForANonDefaultInstance;
begin
  System.Assert(9 = System.High(Digit));
  var Actual: Digit := Rando_TheUntrustworthy.NonDefaultValue<Digit>();
  System.Assert(not (Actual = Digit_Default));
  System.Assert(9 = Actual.Max);
end;

class procedure ExecutableSpecification_Digit_TypeCompleteTests.Properties.TheMinPropertyReturnsZeroForADefaultInstance;
begin
  System.Assert(0 = System.Low(Digit));
  var Actual: Digit := Digit_Default;
  System.Assert(Actual = Digit_Default);
  System.Assert(0 = Actual.Min);
end;

class procedure ExecutableSpecification_Digit_TypeCompleteTests.Properties.TheMinPropertyReturnsZeroForANonDefaultInstance;
begin
  System.Assert(0 = System.Low(Digit));
  var Actual: Digit := Rando_TheUntrustworthy.NonDefaultValue<Digit>();
  System.Assert(not (Actual = Digit_Default));
  System.Assert(0 = Actual.Min);
end;

class procedure ExecutableSpecification_Digit_TypeCompleteTests.Properties.TheTypeIdentityPropertyContainsANonNullIdentifierMatchingTheSystemDotInfoRoutinesValue;
begin
  TypeEquivalenceInquiry<Digit>.HasANonNullSystemDotTypeInfoValue();
  System.Assert(System.TypeInfo(Digit) = Digit.TypeIdentity);
end;

{ExecutableSpecification_Digit_TypeCompleteTests.TypeIdentity}
class procedure ExecutableSpecification_Digit_TypeCompleteTests.TypeIdentity.Exercise();
begin
  HasItsOwnNonNullTypeIdentity();
end;

class procedure ExecutableSpecification_Digit_TypeCompleteTests.TypeIdentity.HasItsOwnNonNullTypeIdentity();
begin
  TypeEquivalenceInquiry<Digit>.HasANonNullSystemDotTypeInfoValue();
end;

{ ExecutableSpecification_Digit_TypeCompleteTests.AssignmentCompatibility }

class procedure ExecutableSpecification_Digit_ValueCompleteTests.AssignmentCompatibility.Exercise;
begin
  {PE Types}
  IsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeWhileRetainingNaturalNumberValues();
  {Native Delphi Types}
  IsSymmetricallyAssignmentCompatibleWithTheByteTypeWhileRetainingByteValues();
  IsSymmetricallyAssignmentCompatibleWithTheIntegerTypeWhileRetainingIntegerValues();
  IsSymmetricallyAssignmentCompatibleWithTheUInt64TypeWhileRetainingUInt64Values();
  IsSymmetricallyAssignmentCompatibleWithTheWordTypeWhileRetainingWordValues();
end;

class procedure ExecutableSpecification_Digit_ValueCompleteTests.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheByteTypeWhileRetainingByteValues;
begin
  //Validating Assumptions
  System.Assert(Digit.Max > Digit.Min);
  //Test
  var ADigit: Digit;
  var AByte: Byte;
  for var Expected: Digit := Digit.Min to Digit.Max do
  begin
    ADigit := Expected;
    AByte := ADigit + 1;
    System.Assert(Expected = ADigit);
    System.Assert(not (Expected = AByte));
    AByte := ADigit;
    System.Assert(ADigit = AByte);
    ADigit := AByte;
    System.Assert(Expected = ADigit);
  end;
end;

class procedure ExecutableSpecification_Digit_ValueCompleteTests.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheIntegerTypeWhileRetainingIntegerValues;
begin
  //Validating Assumptions
  System.Assert(Digit.Max > Digit.Min);
  //Test
  var ADigit: Digit;
  var AnInteger: Integer;
  for var Expected: Digit := Digit.Min to Digit.Max do
  begin
    ADigit := Expected;
    AnInteger := ADigit + 1;
    System.Assert(Expected = ADigit);
    System.Assert(not (Expected = AnInteger));
    AnInteger := ADigit;
    System.Assert(ADigit = AnInteger);
    ADigit := AnInteger;
    System.Assert(Expected = ADigit);
  end;
end;

class procedure ExecutableSpecification_Digit_ValueCompleteTests.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeWhileRetainingNaturalNumberValues;
begin
  //Validating Assumptions
  System.Assert(Digit.Max > Digit.Min);
  //Test
  var ADigit: Digit;
  var ANaturalNumber: NaturalNumber;
  for var Expected: Digit := Digit.Min to Digit.Max do
  begin
    ADigit := Expected;
    ANaturalNumber := ADigit + 1;
    System.Assert(Expected = ADigit);
    System.Assert(not (Expected = ANaturalNumber));
    ANaturalNumber := ADigit;
    System.Assert(ADigit = ANaturalNumber);
    ADigit := ANaturalNumber;
    System.Assert(Expected = ADigit);
  end;
end;

class procedure ExecutableSpecification_Digit_ValueCompleteTests.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheUInt64TypeWhileRetainingUInt64Values;
begin
  //Validating Assumptions
  System.Assert(Digit.Max > Digit.Min);
  //Test
  var ADigit: Digit;
  var AnUInt64: UInt64;
  for var Expected: Digit := Digit.Min to Digit.Max do
  begin
    ADigit := Expected;
    AnUInt64 := ADigit + 1;
    System.Assert(Expected = ADigit);
    System.Assert(not (Expected = AnUInt64));
    AnUInt64 := ADigit;
    System.Assert(ADigit = AnUInt64);
    ADigit := AnUInt64;
    System.Assert(Expected = ADigit);
  end;
end;

class procedure ExecutableSpecification_Digit_ValueCompleteTests.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheWordTypeWhileRetainingWordValues;
begin
  //Validating Assumptions
  System.Assert(Digit.Max > Digit.Min);
  //Test
  var ADigit: Digit;
  var AWord: Word;
  for var Expected: Digit := Digit.Min to Digit.Max do
  begin
    ADigit := Expected;
    AWord := ADigit + 1;
    System.Assert(Expected = ADigit);
    System.Assert(not (Expected = AWord));
    AWord := ADigit;
    System.Assert(ADigit = AWord);
    ADigit := AWord;
    System.Assert(Expected = ADigit);
  end;
end;

{ ExecutableSpecification_Digit_ValueCompleteTests }

class procedure ExecutableSpecification_Digit_ValueCompleteTests.Exercise;
begin
  AssignmentCompatibility.Exercise();
end;

end.
