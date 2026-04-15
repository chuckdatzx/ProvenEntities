unit PE.Tests.Types.Foundational.Digit.TypeAndValueComplete;
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
  PE.Types.Foundational;

type
  ExecutableSpecification_Digit_Complete = record
  public type
    AssignmentCompatibility = record
    strict private {PE Types}
      class procedure IsSymmetricallyAssignmentCompatibleWithTheBigNaturalNumberTypeWhileRetainingBigNaturalNumberValues(); static; inline;
      class procedure IsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeWhileRetainingNaturalNumberValues(); static; inline;
    strict private {Native Delphi Types}
      class procedure IsSymmetricallyAssignmentCompatibleWithTheByteTypeWhileRetainingByteValues(); static; inline;
      class procedure IsSymmetricallyAssignmentCompatibleWithTheIntegerTypeWhileRetainingIntegerValues(); static; inline;
      class procedure IsSymmetricallyAssignmentCompatibleWithTheUInt64TypeWhileRetainingUInt64Values(); static; inline;
      class procedure IsSymmetricallyAssignmentCompatibleWithTheWordTypeWhileRetainingWordValues(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
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
    public
      class procedure Exercise(); static; inline;
    end;
    StaticTransformations = record
    public type
      ///<notes>Sorry; is currently in English only (Agreed; not having this in "all languages" makes it not value complete (unless you're on the "language having" side))</notes>
      ToEnglishMonoChar = record
      strict private const ExpectedEnglishMonoChars: array[System.Low(Digit)..System.High(Digit)] of MonoChar = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
      strict private
        class procedure ReturnsTheExpectedMonoCharCounterpartForEveryValueInDigit(); static; inline;
      public
        class procedure Exercise(); static; inline;
      end;
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
    class procedure TheDefaultValueIsZero(); static; inline;
  public
    class procedure Exercise(); static; inline;
  end;

  procedure Exercise(); inline;

implementation

{ExecutableSpecification_Digit_Complete}
class procedure ExecutableSpecification_Digit_Complete.Exercise;
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  Properties.Exercise();
  TheDefaultValueIsZero();
  StaticTransformations.Exercise();
  TypeIdentity.Exercise();
end;

class procedure ExecutableSpecification_Digit_Complete.TheDefaultValueIsZero;
begin
  System.Assert(0 = System.Default(Digit));
end;

{ExecutableSpecification_Digit_Complete.AssignmentCompatibility}
class procedure ExecutableSpecification_Digit_Complete.AssignmentCompatibility.Exercise;
begin
  {PE Types}
  IsSymmetricallyAssignmentCompatibleWithTheBigNaturalNumberTypeWhileRetainingBigNaturalNumberValues();
  IsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeWhileRetainingNaturalNumberValues();
  {Native Delphi Types}
  IsSymmetricallyAssignmentCompatibleWithTheByteTypeWhileRetainingByteValues();
  IsSymmetricallyAssignmentCompatibleWithTheIntegerTypeWhileRetainingIntegerValues();
  IsSymmetricallyAssignmentCompatibleWithTheUInt64TypeWhileRetainingUInt64Values();
  IsSymmetricallyAssignmentCompatibleWithTheWordTypeWhileRetainingWordValues();
end;

class procedure ExecutableSpecification_Digit_Complete.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheBigNaturalNumberTypeWhileRetainingBigNaturalNumberValues;
begin
  var ADigit: Digit;
  var ABigNaturalNumber: BigNaturalNumber;
  for var I: Digit := Digit.Min to Digit.Max do
  begin
    ADigit := I;
    ABigNaturalNumber := ADigit + 1;
    System.Assert(I = ADigit);
    System.Assert(not (ABigNaturalNumber = ADigit));
    ABigNaturalNumber := ADigit;
    System.Assert(ABigNaturalNumber = ADigit);
    ADigit := ABigNaturalNumber;
    System.Assert(I = ADigit);
  end;
end;

class procedure ExecutableSpecification_Digit_Complete.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheByteTypeWhileRetainingByteValues;
begin
  var ADigit: Digit;
  var AByte: Byte;
  for var I: Digit := Digit.Min to Digit.Max do
  begin
    ADigit := I;
    AByte := ADigit + 1;
    System.Assert(I = ADigit);
    System.Assert(not (AByte = ADigit));
    AByte := ADigit;
    System.Assert(AByte = ADigit);
    ADigit := AByte;
    System.Assert(I = ADigit);
  end;
end;

class procedure ExecutableSpecification_Digit_Complete.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheIntegerTypeWhileRetainingIntegerValues;
begin
  var ADigit: Digit;
  var AnInteger: Integer;
  for var I: Digit := Digit.Min to Digit.Max do
  begin
    ADigit := I;
    AnInteger := ADigit + 1;
    System.Assert(I = ADigit);
    System.Assert(not (AnInteger = ADigit));
    AnInteger := ADigit;
    System.Assert(AnInteger = ADigit);
    ADigit := AnInteger;
    System.Assert(I = ADigit);
  end;
end;

class procedure ExecutableSpecification_Digit_Complete.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeWhileRetainingNaturalNumberValues();
begin
  var ADigit: Digit;
  var ANaturalNumber: NaturalNumber;
  for var I: Digit := Digit.Min to Digit.Max do
  begin
    ADigit := I;
    ANaturalNumber := ADigit + 1;
    System.Assert(I = ADigit);
    System.Assert(not (ANaturalNumber = ADigit));
    ANaturalNumber := ADigit;
    System.Assert(ANaturalNumber = ADigit);
    ADigit := ANaturalNumber;
    System.Assert(I = ADigit);
  end;
end;

class procedure ExecutableSpecification_Digit_Complete.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheUInt64TypeWhileRetainingUInt64Values();
begin
  var ADigit: Digit;
  var AnUInt64: UInt64;
  for var I: Digit := Digit.Min to Digit.Max do
  begin
    ADigit := I;
    AnUInt64 := ADigit + 1;
    System.Assert(I = ADigit);
    System.Assert(not (AnUInt64 = ADigit));
    AnUInt64 := ADigit;
    System.Assert(AnUInt64 = ADigit);
    ADigit := AnUInt64;
    System.Assert(I = ADigit);
  end;
end;

class procedure ExecutableSpecification_Digit_Complete.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheWordTypeWhileRetainingWordValues();
begin
  var ADigit: Digit;
  var WordUp: Word;
  for var I: Digit := Digit.Min to Digit.Max do
  begin
    ADigit := I;
    WordUp := ADigit + 1;
    System.Assert(I = ADigit);
    System.Assert(not (WordUp = ADigit));
    WordUp := ADigit;
    System.Assert(WordUp = ADigit);
    ADigit := WordUp;
    System.Assert(I = ADigit);
  end;
end;

{ExecutableSpecification_Digit_Complete.Boundaries}
class procedure ExecutableSpecification_Digit_Complete.Boundaries.Exercise;
begin
  TheLowestTypeAllowedValueIsZero();
  TheHighestTypeAllowedValueIs9();
end;

class procedure ExecutableSpecification_Digit_Complete.Boundaries.TheLowestTypeAllowedValueIsZero();
begin
  System.Assert(9 = System.High(Digit));
end;

class procedure ExecutableSpecification_Digit_Complete.Boundaries.TheHighestTypeAllowedValueIs9();
begin
  System.Assert(0 = System.Low(Digit));
end;

{ExecutableSpecification_Digit_Complete.Properties}
class procedure ExecutableSpecification_Digit_Complete.Properties.Exercise;
begin
  TheMaxPropertyReturns9ForADefaultInstance();
  TheMaxPropertyReturns9ForANonDefaultInstance();
  TheMinPropertyReturnsZeroForADefaultInstance();
  TheMinPropertyReturnsZeroForANonDefaultInstance();
end;

class procedure ExecutableSpecification_Digit_Complete.Properties.TheMaxPropertyReturns9ForADefaultInstance;
begin
  System.Assert(9 = System.High(Digit));
  var Actual: Digit := System.Default(Digit);
  System.Assert(Actual = System.Default(Digit));
  System.Assert(9 = Actual.Max);
end;

class procedure ExecutableSpecification_Digit_Complete.Properties.TheMaxPropertyReturns9ForANonDefaultInstance;
begin
  System.Assert(9 = System.High(Digit));
  var Actual: Digit := Rando_TheUntrustworthy.NonDefaultValue<Digit>();
  System.Assert(not (Actual = System.Default(Digit)));
  System.Assert(9 = Actual.Max);
end;

class procedure ExecutableSpecification_Digit_Complete.Properties.TheMinPropertyReturnsZeroForADefaultInstance;
begin
  System.Assert(0 = System.Low(Digit));
  var Actual: Digit := System.Default(Digit);
  System.Assert(Actual = System.Default(Digit));
  System.Assert(0 = Actual.Min);
end;

class procedure ExecutableSpecification_Digit_Complete.Properties.TheMinPropertyReturnsZeroForANonDefaultInstance;
begin
  System.Assert(0 = System.Low(Digit));
  var Actual: Digit := Rando_TheUntrustworthy.NonDefaultValue<Digit>();
  System.Assert(not (Actual = System.Default(Digit)));
  System.Assert(0 = Actual.Min);
end;

{ExecutableSpecification_Digit_Complete.TypeIdentity}
class procedure ExecutableSpecification_Digit_Complete.TypeIdentity.Exercise();
begin
  HasItsOwnNonNullTypeIdentity();
end;

class procedure ExecutableSpecification_Digit_Complete.TypeIdentity.HasItsOwnNonNullTypeIdentity();
begin
  TypeEquivalenceInquiry<Digit>.HasANonNullSystemDotTypeInfoValue();
end;

{ExecutableSpecification_Digit_Complete.StaticTransformations.ToEnglishMonoChar}
class procedure ExecutableSpecification_Digit_Complete.StaticTransformations.ToEnglishMonoChar.Exercise();
begin
  ReturnsTheExpectedMonoCharCounterpartForEveryValueInDigit();
end;

class procedure ExecutableSpecification_Digit_Complete.StaticTransformations.ToEnglishMonoChar.ReturnsTheExpectedMonoCharCounterpartForEveryValueInDigit();
begin
  for var I: Digit := Digit.Min to Digit.Max do
    System.Assert(ExpectedEnglishMonoChars[I] = Digit.StaticTransformations.DigitToEnglishMonoCharMap[I]);
end;

{ExecutableSpecification_Digit_Complete.StaticTransformations}
class procedure ExecutableSpecification_Digit_Complete.StaticTransformations.Exercise;
begin
  ToEnglishMonoChar.Exercise()
end;

procedure Exercise();
begin
  ExecutableSpecification_Digit_Complete.Exercise();
end;

end.
