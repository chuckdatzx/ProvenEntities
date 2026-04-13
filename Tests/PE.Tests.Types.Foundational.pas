unit PE.Tests.Types.Foundational;
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
  PE.Actors.Rando,
  PE.Delphi.TypeIdentity,
  PE.Types.Foundational;

type
  AllTests = record
  public
    class procedure Exercise(); static; inline;
  end;

type
  {$REGION 'BigNaturalNumber'}
  ExecutableSpecification_BigNaturalNumber = record
  public type
    AssignmentCompatibility = record
    strict private
      class procedure IsSymmetricallyAssignmentCompatibleWithUInt64WhileRetainingUInt64Value(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Boundaries = record
    strict private
      class procedure TheLowestPossibleValueIsZero(); static; inline;
      class procedure TheHighestPossibleNumberIs18446744073709551615(); static; inline; //Approximately 18.45 quintillion
    public
      class procedure Exercise(); static; inline;
    end;
    Defaults = record
      class procedure ValueIsZero(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    TypeIdentity = record
    strict private
      class procedure HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeUInt64(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;
  {$ENDREGION}

  {$REGION 'Digit'}
  ExecutableSpecification_Digit = record
  public type
    AssignmentCompatibility = record
    strict private
      class procedure IsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeWhileRetainingNaturalNumberValues_ForAllValuesOfDigit(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Boundaries = record
    strict private
      class procedure TheLowestPossibleValueIsZero(); static; inline;
      class procedure TheHighestPossibleValueIs9(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Defaults = record
    strict private
      class procedure ValueIsZero(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    ///<notes>Sorry; is currently in English only</notes>
    Transformations = record
    public type
      ToMonoChar = record
      strict private const ExpectedMonoChars: array[System.Low(Digit)..System.High(Digit)] of Char = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
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
    class procedure Exercise(); static; inline;
  end;
  {$ENDREGION}

  {$REGION 'MonoChar'}
  ExecutableSpecification_MonoChar = record
  public type
    AssignmentCompatibility = record
    strict private
      class procedure IsSymmetricallyAssignmentCompatibleWithTheNativeCharWhileRetainingNativeCharValues(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Boundaries = record
    strict private
      class procedure TheLowestPossibleOrdinalValueIsZero(); static; inline;
      class procedure TheHighestPossibleOrdinalValueIs65536(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Defaults = record
    strict private
      class procedure ValueIsZero(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    TypeIdentity = record
    strict private
      class procedure HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeChar(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;
  {$ENDREGION}

  {$REGION 'NaturalNumber'}
  ExecutableSpecification_NaturalNumber = record
  public type
    AssignmentCompatibility = record
    strict private
      class procedure IsSymmetricallyAssignmentCompatibleWithCardinalWhileRetainingCardinalValues(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Boundaries = record
    strict private
      class procedure TheLowestPossibleValueIsZero(); static; inline;
      class procedure TheHighestPossibleNumberIs4294967295(); static; inline; //4.2 billion
    strict private {Min property}
      class procedure TheMinPropertyReturnsZeroForADefaultInstance(); static; inline;
      class procedure TheMinPropertyReturnsZeroForANonDefaultInstance(); static; inline;
    strict private {Max property}
      class procedure TheMaxPropertyReturns4294967295ForADefaultInstance(); static; inline;
      class procedure TheMaxPropertyReturns4294967295ForANonDefaultInstance(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Defaults = record
    strict private
      class procedure ValueIsZero(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Transformations = record
    public type
      FromAnArrayOfDigit = record
      strict private
        class procedure TransformsDigitArrayCombinationsIntoTheirNaturalNumberCounterparts_ForEveryValueOfNaturalNumber(); static; inline;  //Chonky demand on runtime; but proves all values
      public
        class procedure Exercise(); static; inline;
      end;
    public
      class procedure Exercise(); static; inline;
    end;
    TypeIdentity = record
    strict private
      class procedure HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeCardinal(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;
  {$ENDREGION}

implementation

uses
  PE.Types.Foundational.Generics;

{AllTests}
class procedure AllTests.Exercise();
begin
  ExecutableSpecification_Digit.Exercise();
  ExecutableSpecification_MonoChar.Exercise();
  ExecutableSpecification_BigNaturalNumber.Exercise();
  ExecutableSpecification_NaturalNumber.Exercise();
end;

{$REGION 'BigNaturalNumber'}
{ExecutableSpecification_BigNaturalNumber}
class procedure ExecutableSpecification_BigNaturalNumber.Exercise;
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  Defaults.Exercise();
  TypeIdentity.Exercise();
end;

{ExecutableSpecification_BigNaturalNumber.AssignmentCompatibility}
class procedure ExecutableSpecification_BigNaturalNumber.AssignmentCompatibility.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithUInt64WhileRetainingUInt64Value();
end;

class procedure ExecutableSpecification_BigNaturalNumber.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithUInt64WhileRetainingUInt64Value;
begin
  var Expected: UInt64 := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();  //Using the BigNaturalNumber type causes a F2084 interna Error: C2252; so I'm using NaturalNumber instead
  var ActualUInt64 := Expected;
  System.Assert(not (System.Default(UInt64) = ActualUInt64));
  var ActualNaturalNumber64: BigNaturalNumber := System.Default(BigNaturalNumber);
  System.Assert(not (ActualUInt64 = ActualNaturalNumber64));
  ActualNaturalNumber64 := ActualUInt64;
  System.Assert(ActualUInt64 = ActualNaturalNumber64);
  ActualUInt64 := System.Default(UInt64);
  System.Assert(System.Default(UInt64) = ActualUInt64);
  ActualUInt64 := ActualNaturalNumber64;
  System.Assert(Expected = ActualUInt64);
end;

{ExecutableSpecification_BigNaturalNumber.Boundaries}
class procedure ExecutableSpecification_BigNaturalNumber.Boundaries.Exercise;
begin
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs18446744073709551615();
end;

class procedure ExecutableSpecification_BigNaturalNumber.Boundaries.TheHighestPossibleNumberIs18446744073709551615;
begin
  System.Assert(18446744073709551615 = System.High(BigNaturalNumber));
end;

class procedure ExecutableSpecification_BigNaturalNumber.Boundaries.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(BigNaturalNumber));
end;

{ExecutableSpecification_BigNaturalNumber.Defaults}
class procedure ExecutableSpecification_BigNaturalNumber.Defaults.Exercise;
begin
  ValueIsZero();
end;

class procedure ExecutableSpecification_BigNaturalNumber.Defaults.ValueIsZero;
begin
  System.Assert(0 = System.Default(BigNaturalNumber));
end;

{ExecutableSpecification_BigNaturalNumber.TypeIdentity}
class procedure ExecutableSpecification_BigNaturalNumber.TypeIdentity.Exercise;
begin
  HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeUInt64();
end;

class procedure ExecutableSpecification_BigNaturalNumber.TypeIdentity.HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeUInt64;
begin
  TypeEquivalenceInquiry<BigNaturalNumber>.HasANonNullSystemDotTypeInfoValue();
  TypeEquivalenceInquiry<BigNaturalNumber>.DoesNotShareTypeIdentityWith<UInt64>();
end;
{$ENDREGION}

{$REGION 'Digit'}
{ExecutableSpecification_Digit}
class procedure ExecutableSpecification_Digit.Exercise;
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  Defaults.Exercise();
  Transformations.Exercise();
  TypeIdentity.Exercise();
end;

{ExecutableSpecification_Digit.AssignmentCompatibility.Exercise}
class procedure ExecutableSpecification_Digit.AssignmentCompatibility.Exercise();
begin
  IsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeWhileRetainingNaturalNumberValues_ForAllValuesOfDigit();
end;

class procedure ExecutableSpecification_Digit.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeWhileRetainingNaturalNumberValues_ForAllValuesOfDigit();
begin
  var ADigit: Digit;
  var ANaturalNumber: NaturalNumber;
  for var I: Digit := System.Low(Digit) to System.High(Digit) do
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

{ExecutableSpecification_Digit.Boundaries}
class procedure ExecutableSpecification_Digit.Boundaries.Exercise;
begin
  TheLowestPossibleValueIsZero();
  TheHighestPossibleValueIs9();
end;

class procedure ExecutableSpecification_Digit.Boundaries.TheHighestPossibleValueIs9();
begin
  System.Assert(0 = System.Low(Digit));
end;

class procedure ExecutableSpecification_Digit.Boundaries.TheLowestPossibleValueIsZero();
begin
  System.Assert(9 = System.High(Digit));
end;

{ExecutableSpecification_Digit.Defaults}
class procedure ExecutableSpecification_Digit.Defaults.Exercise();
begin
  ValueIsZero();
end;

class procedure ExecutableSpecification_Digit.Defaults.ValueIsZero();
begin
  System.Assert(0 = System.Default(Digit));
end;

{ExecutableSpecification_Digit.TypeIdentity}
class procedure ExecutableSpecification_Digit.TypeIdentity.Exercise();
begin
  HasItsOwnNonNullTypeIdentity();
end;

class procedure ExecutableSpecification_Digit.TypeIdentity.HasItsOwnNonNullTypeIdentity();
begin
  TypeEquivalenceInquiry<Digit>.HasANonNullSystemDotTypeInfoValue();
end;
{$ENDREGION}

{$REGION 'MonoChar'}
{ExecutableSpecification_MonoChar}
class procedure ExecutableSpecification_MonoChar.Exercise;
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  Defaults.Exercise();
  TypeIdentity.Exercise();
end;

{ExecutableSpecification_MonoChar.AssignmentCompatibility}
class procedure ExecutableSpecification_MonoChar.AssignmentCompatibility.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithTheNativeCharWhileRetainingNativeCharValues();
end;

class procedure ExecutableSpecification_MonoChar.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheNativeCharWhileRetainingNativeCharValues;
begin
  var Expected: Char := Rando_TheUntrustworthy.NonDefaultValue<Char>;
  System.Assert(not (System.Default(Char) = Expected));
  var ActualChar := Expected;
  System.Assert(Expected = ActualChar);
  var ActualMonoChar: MonoChar := System.Default(MonoChar);
  System.Assert(not (ActualChar = ActualMonoChar));
  ActualMonoChar := ActualChar;
  System.Assert(ActualChar = ActualMonoChar);
  ActualChar := System.Default(Char);
  System.Assert(not (ActualMonoChar = ActualChar));
  ActualChar := ActualMonoChar;
  System.Assert(Expected = ActualChar);
end;

{ExecutableSpecification_MonoChar.Boundaries}
class procedure ExecutableSpecification_MonoChar.Boundaries.Exercise;
begin
  TheLowestPossibleOrdinalValueIsZero();
  TheHighestPossibleOrdinalValueIs65536();
end;

class procedure ExecutableSpecification_MonoChar.Boundaries.TheHighestPossibleOrdinalValueIs65536;
begin
  System.Assert(System.Ord(65535) = System.Ord(System.High(MonoChar)));
end;

class procedure ExecutableSpecification_MonoChar.Boundaries.TheLowestPossibleOrdinalValueIsZero;
begin
  System.Assert(System.Ord(NativeUInt(0)) = System.Ord(System.Low(MonoChar)));
end;

{ExecutableSpecification_MonoChar.Defaults}
class procedure ExecutableSpecification_MonoChar.Defaults.Exercise;
begin
  ValueIsZero();
end;

class procedure ExecutableSpecification_MonoChar.Defaults.ValueIsZero;
begin
  System.Assert(System.Ord(NativeUInt(0)) = System.Ord(System.Default(MonoChar)));
end;

{ExecutableSpecification_MonoChar.TypeIdentity}
class procedure ExecutableSpecification_MonoChar.TypeIdentity.Exercise;
begin
  HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeChar();
end;

class procedure ExecutableSpecification_MonoChar.TypeIdentity.HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeChar;
begin
  TypeEquivalenceInquiry<MonoChar>.HasANonNullSystemDotTypeInfoValue();
  TypeEquivalenceInquiry<MonoChar>.DoesNotShareTypeIdentityWith<Char>();
end;
{$ENDREGION}

{$REGION 'NaturalNumber'}
{ExecutableSpecification_NaturalNumber}
class procedure ExecutableSpecification_NaturalNumber.Exercise;
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  Defaults.Exercise();
  Transformations.Exercise();
  TypeIdentity.Exercise();
end;

{ExecutableSpecification_NaturalNumber.AssignmentCompatibility}
class procedure ExecutableSpecification_NaturalNumber.AssignmentCompatibility.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithCardinalWhileRetainingCardinalValues();
end;

class procedure ExecutableSpecification_NaturalNumber.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithCardinalWhileRetainingCardinalValues;
begin
  var Expected: Cardinal := Rando_TheUntrustworthy.NonDefaultValue<Cardinal>;
  System.Assert(not (System.Default(Cardinal) = Expected));
  var ActualCardinal := Expected;
  System.Assert(Expected = ActualCardinal);
  var ActualNaturalNumber: NaturalNumber := System.Default(NaturalNumber);
  System.Assert(not (ActualCardinal = ActualNaturalNumber));
  ActualNaturalNumber := ActualCardinal;
  System.Assert(ActualCardinal = ActualNaturalNumber);
  ActualCardinal := System.Default(Cardinal);
  System.Assert(not (ActualCardinal = ActualNaturalNumber));
  ActualCardinal := ActualNaturalNumber;
  System.Assert(Expected = ActualCardinal);
end;

{ExecutableSpecification_NaturalNumber.Boundaries}
class procedure ExecutableSpecification_NaturalNumber.Boundaries.Exercise;
begin
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs4294967295();
  TheMinPropertyReturnsZeroForADefaultInstance();
  TheMinPropertyReturnsZeroForANonDefaultInstance();
  TheMaxPropertyReturns4294967295ForADefaultInstance();
  TheMaxPropertyReturns4294967295ForANonDefaultInstance();
end;

class procedure ExecutableSpecification_NaturalNumber.Boundaries.TheHighestPossibleNumberIs4294967295;
begin
  System.Assert(4294967295 = System.High(NaturalNumber));
end;

class procedure ExecutableSpecification_NaturalNumber.Boundaries.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber));
end;

{ExecutableSpecification_NaturalNumber.Defaults}
class procedure ExecutableSpecification_NaturalNumber.Defaults.Exercise;
begin
  ValueIsZero();
end;

class procedure ExecutableSpecification_NaturalNumber.Defaults.ValueIsZero;
begin
  System.Assert(0 = System.Default(NaturalNumber));
end;

{ExecutableSpecification_NaturalNumber.Boundaries}
class procedure ExecutableSpecification_NaturalNumber.Boundaries.TheMaxPropertyReturns4294967295ForADefaultInstance;
begin
  var Value: NaturalNumber := System.Default(NaturalNumber);
  System.Assert(System.Default(NaturalNumber) = Value);
  System.Assert(4294967295 = Value.Max);
end;

class procedure ExecutableSpecification_NaturalNumber.Boundaries.TheMaxPropertyReturns4294967295ForANonDefaultInstance;
begin
  var Value: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (System.Default(NaturalNumber) = Value));
  System.Assert(4294967295 = Value.Max);
end;

class procedure ExecutableSpecification_NaturalNumber.Boundaries.TheMinPropertyReturnsZeroForADefaultInstance;
begin
  var Value: NaturalNumber := System.Default(NaturalNumber);
  System.Assert(System.Default(NaturalNumber) = Value);
  System.Assert(0 = Value.Min);
end;

class procedure ExecutableSpecification_NaturalNumber.Boundaries.TheMinPropertyReturnsZeroForANonDefaultInstance;
begin
  var Value: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (System.Default(NaturalNumber) = Value));
  System.Assert(0 = Value.Min);
end;

{ExecutableSpecification_NaturalNumber.TypeIdentity}
class procedure ExecutableSpecification_NaturalNumber.TypeIdentity.Exercise;
begin
  HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeCardinal();
end;

class procedure ExecutableSpecification_NaturalNumber.TypeIdentity.HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeCardinal;
begin
  TypeEquivalenceInquiry<NaturalNumber>.HasANonNullSystemDotTypeInfoValue();
  TypeEquivalenceInquiry<NaturalNumber>.DoesNotShareTypeIdentityWith<Cardinal>();
end;
{$ENDREGION}

{ ExecutableSpecification_Digit.Transformations.ToMonoChar }

class procedure ExecutableSpecification_Digit.Transformations.ToMonoChar.Exercise();
begin
  ReturnsTheExpectedMonoCharCounterpartForEveryValueInDigit();
end;

class procedure ExecutableSpecification_Digit.Transformations.ToMonoChar.ReturnsTheExpectedMonoCharCounterpartForEveryValueInDigit();
begin
  System.Assert(10 = System.Length(ExpectedMonoChars));
  System.Assert('0' = ExpectedMonoChars[0]);
  System.Assert('1' = ExpectedMonoChars[1]);
  System.Assert('2' = ExpectedMonoChars[2]);
  System.Assert('3' = ExpectedMonoChars[3]);
  System.Assert('4' = ExpectedMonoChars[4]);
  System.Assert('5' = ExpectedMonoChars[5]);
  System.Assert('6' = ExpectedMonoChars[6]);
  System.Assert('7' = ExpectedMonoChars[7]);
  System.Assert('8' = ExpectedMonoChars[8]);
  System.Assert('9' = ExpectedMonoChars[9]);
  Digit.ToMonoChar(0);
  for var I: Digit := System.Low(Digit) to System.High(Digit) do
    System.Assert(ExpectedMonoChars[I] = Digit.ToMonoChar(I));
end;

{ ExecutableSpecification_Digit.Transformations }

class procedure ExecutableSpecification_Digit.Transformations.Exercise;
begin
  ToMonoChar.Exercise()
end;

{ ExecutableSpecification_NaturalNumber.Transformations.FromAnArrayOfDigit }

class procedure ExecutableSpecification_NaturalNumber.Transformations.FromAnArrayOfDigit.Exercise();
begin
  TransformsDigitArrayCombinationsIntoTheirNaturalNumberCounterparts_ForEveryValueOfNaturalNumber();
end;

class procedure ExecutableSpecification_NaturalNumber.Transformations.FromAnArrayOfDigit.TransformsDigitArrayCombinationsIntoTheirNaturalNumberCounterparts_ForEveryValueOfNaturalNumber();
begin
  //4294967295
  for var Digit1: Digit := 0 to 4 do
    for var Digit2: Digit := 0 to 2 do
      for var Digit3: Digit := 0 to 9 do
        for var Digit4: Digit := 0 to 4 do
          for var Digit5: Digit := 0 to 9 do
            for var Digit6: Digit := 0 to 6 do
              for var Digit7: Digit := 0 to 7 do
                for var Digit8: Digit := 0 to 2 do
                  for var Digit9: Digit := 0 to 9 do
                    for var Digit10: Digit := 0 to 5 do
                    begin
                      var Expected: NaturalNumber := System.Default(NaturalNumber);
                      Expected := ((Expected * 10) + Digit1);
                      Expected := ((Expected * 10) + Digit2);
                      Expected := ((Expected * 10) + Digit3);
                      Expected := ((Expected * 10) + Digit4);
                      Expected := ((Expected * 10) + Digit5);
                      Expected := ((Expected * 10) + Digit6);
                      Expected := ((Expected * 10) + Digit7);
                      Expected := ((Expected * 10) + Digit8);
                      Expected := ((Expected * 10) + Digit9);
                      Expected := ((Expected * 10) + Digit10);
                      var Data: ArrayOf<Digit> := [Digit1, Digit2, Digit3, Digit4, Digit5, Digit6, Digit7, Digit8, Digit9, Digit10];
                      System.Assert(Expected = NaturalNumber.FromArrayOfDigit(Data));
                    end;
end;

{ ExecutableSpecification_NaturalNumber.Transformations }

class procedure ExecutableSpecification_NaturalNumber.Transformations.Exercise;
begin
  FromAnArrayOfDigit.Exercise();
end;

end.
