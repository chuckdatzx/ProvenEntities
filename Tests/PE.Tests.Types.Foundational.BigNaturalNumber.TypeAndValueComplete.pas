unit PE.Tests.Types.Foundational.BigNaturalNumber.TypeAndValueComplete;
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
  {$DEFINE QUARANTINED_DUE_TO_TIME_COSTS}
  ExecutableSpecification_BigNaturalNumber_Complete = record
  public type
    AssignmentCompatibility = record
    strict private
      {$IFNDEF QUARANTINED_DUE_TO_TIME_COSTS}
      class procedure IsSymmetricallyAssignmentCompatibleWithTheNativeUInt64TypeWhileRetainingBigNaturalNumberAndUInt64ValuesForEveryValueOfBigNaturalNumberAndUInt64(); static; inline;
      {$MESSAGE WARN 'Value complete proof is present for the BigNaturalNumber; it may take some time for the proof to finish'}
      {$ELSE}
        class procedure NOT_VALUE_COMPLETE_TheBigNaturalNumberTypeIsSymmetricallyAssignmentCompatibleWithTheUInt64TypeWhileRetainingBigNaturalNumberAndUInt64Values_ForDefaultValues(); static; inline;
        class procedure NOT_VALUE_COMPLETE_For1000RandomNonDefaultNativeUInt64ValuesIsSymmetricallyAssignmentCompatibleWithTheUInt64TypeWhileRetainingBigNaturalNumberAndUInt64Values(); static; inline;
        {$MESSAGE HINT 'Value complete proof is NOT present for the BigNaturalNumber (because it can be VERY time consuming to prove out 18.2 quadrillion cases); random spot testing is done instead'}
      {$ENDIF}
    public
      class procedure Exercise(); static; inline;
    end;
    Boundaries = record
    strict private
      class procedure TheLowestPossibleValueIsZero(); static; inline;
      class procedure TheHighestPossibleNumberIs18446744073709551615(); static; inline; //Approximately 18.45 quintillion
    strict private {Min property}
      class procedure TheMinPropertyReturnsZeroForADefaultInstance(); static; inline;
      class procedure TheMinPropertyReturnsZeroForANonDefaultInstance(); static; inline;
    strict private {Max property}
      class procedure TheMaxPropertyReturns18446744073709551615ForADefaultInstance(); static; inline;
      class procedure TheMaxPropertyReturns18446744073709551615ForANonDefaultInstance(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    TypeIdentity = record
    strict private
      class procedure HasADistinctTypeIdentityWhenComparedToTheNativeUInt64(); static; inline;
      class procedure HasItsOwnNonNullTypeIdentity(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure TheDefaultValueIsZero(); static; inline;
  public
    class procedure Exercise(); static; inline;
  end;

implementation

{ExecutableSpecification_BigNaturalNumber_Complete}
class procedure ExecutableSpecification_BigNaturalNumber_Complete.Exercise;
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  TypeIdentity.Exercise();
end;

class procedure ExecutableSpecification_BigNaturalNumber_Complete.TheDefaultValueIsZero;
begin
  System.Assert(0 = System.Default(BigNaturalNumber));
end;

{ExecutableSpecification_BigNaturalNumber_Complete.AssignmentCompatibility}
class procedure ExecutableSpecification_BigNaturalNumber_Complete.AssignmentCompatibility.Exercise();
begin
  {$IFNDEF QUARANTINED_DUE_TO_TIME_COSTS}
  IsSymmetricallyAssignmentCompatibleWithTheNativeUInt64TypeWhileRetainingBigNaturalNumberAndUInt64ValuesForEveryValueOfBigNaturalNumberAndUInt64();
  {$ELSE}
  NOT_VALUE_COMPLETE_TheBigNaturalNumberTypeIsSymmetricallyAssignmentCompatibleWithTheUInt64TypeWhileRetainingBigNaturalNumberAndUInt64Values_ForDefaultValues();
  NOT_VALUE_COMPLETE_For1000RandomNonDefaultNativeUInt64ValuesIsSymmetricallyAssignmentCompatibleWithTheUInt64TypeWhileRetainingBigNaturalNumberAndUInt64Values();
  {$ENDIF}
end;

{$IFNDEF QUARANTINED_DUE_TO_TIME_COSTS}
class procedure ExecutableSpecification_BigNaturalNumber_Complete.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheNativeUInt64TypeWhileRetainingBigNaturalNumberAndUInt64ValuesForEveryValueOfBigNaturalNumberAndUInt64();
begin
  System.Assert(BigNaturalNumber.Max = System.High(UInt64));
  System.Assert(BigNaturalNumber.Min = System.Low(UInt64));
  var ABigNaturalNumber: BigNaturalNumber;
  var AnUInt64: UInt64;
  { TODO -oChuck -cToDo : Need to add proving the zero case }
  for var Expected: BigNaturalNumber := (BigNaturalNumber.Min + 1) to BigNaturalNumber.Max do
  begin
    AnUInt64 := Expected;
    ABigNaturalNumber := System.Default(BigNaturalNumber);
    System.Assert(Expected = AnUInt64);
    System.Assert(not (AnUInt64 = ABigNaturalNumber));
    ABigNaturalNumber := AnUInt64;
    System.Assert(ABigNaturalNumber = AnUInt64);
    AnUInt64 := ABigNaturalNumber;
    System.Assert(Expected = AnUInt64);
  end;
end;
{$ELSE}
{$ENDIF}

class procedure ExecutableSpecification_BigNaturalNumber_Complete.AssignmentCompatibility.NOT_VALUE_COMPLETE_For1000RandomNonDefaultNativeUInt64ValuesIsSymmetricallyAssignmentCompatibleWithTheUInt64TypeWhileRetainingBigNaturalNumberAndUInt64Values;
begin
  for var Counter := 1 to 1000 do
  begin
    var Expected := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();  //Currently have to use NaturalNumber because BigNaturalNumber/UInt64 causes "F2084 Internal Error: C2252"
    System.Assert(not (Expected = System.Default(UInt64)));
    var AnUInt64: UInt64 := System.Default(UInt64);
    var ABigNaturalNumber: BigNaturalNumber := System.Default(BigNaturalNumber);
    System.Assert(not (Expected = ABigNaturalNumber));
    System.Assert(not (Expected = AnUInt64));
    AnUInt64 := Expected;
    ABigNaturalNumber := AnUInt64;
    AnUInt64 := ABigNaturalNumber;
    System.Assert(Expected = ABigNaturalNumber);
    System.Assert(Expected = AnUInt64);
    System.Assert(AnUInt64 = ABigNaturalNumber);
  end;
end;

class procedure ExecutableSpecification_BigNaturalNumber_Complete.AssignmentCompatibility.NOT_VALUE_COMPLETE_TheBigNaturalNumberTypeIsSymmetricallyAssignmentCompatibleWithTheUInt64TypeWhileRetainingBigNaturalNumberAndUInt64Values_ForDefaultValues;
begin
  var AnUInt64: UInt64 := System.Default(UInt64);
  var ABigNaturalNumber: BigNaturalNumber := System.Default(BigNaturalNumber);
  System.Assert(0 = ABigNaturalNumber);
  System.Assert(0 = AnUInt64);
  ABigNaturalNumber := AnUInt64;
  AnUInt64 := ABigNaturalNumber;
  System.Assert(AnUInt64 = ABigNaturalNumber);
end;

{ExecutableSpecification_BigNaturalNumber_Complete.Boundaries}
class procedure ExecutableSpecification_BigNaturalNumber_Complete.Boundaries.Exercise;
begin
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs18446744073709551615();
  TheMinPropertyReturnsZeroForADefaultInstance();
  TheMinPropertyReturnsZeroForANonDefaultInstance();
  TheMaxPropertyReturns18446744073709551615ForADefaultInstance();
  TheMaxPropertyReturns18446744073709551615ForANonDefaultInstance();
end;

class procedure ExecutableSpecification_BigNaturalNumber_Complete.Boundaries.TheHighestPossibleNumberIs18446744073709551615();
begin
  System.Assert(18446744073709551615 = System.High(BigNaturalNumber));
end;

class procedure ExecutableSpecification_BigNaturalNumber_Complete.Boundaries.TheLowestPossibleValueIsZero();
begin
  System.Assert(0 = System.Low(BigNaturalNumber));
end;

class procedure ExecutableSpecification_BigNaturalNumber_Complete.Boundaries.TheMaxPropertyReturns18446744073709551615ForADefaultInstance();
begin
  System.Assert(18446744073709551615 = System.High(BigNaturalNumber));
  var Actual: BigNaturalNumber := System.Default(BigNaturalNumber);
  System.Assert(Actual = System.Default(BigNaturalNumber));
  System.Assert(18446744073709551615 = Actual.Max);
end;

class procedure ExecutableSpecification_BigNaturalNumber_Complete.Boundaries.TheMaxPropertyReturns18446744073709551615ForANonDefaultInstance();
begin
  System.Assert(18446744073709551615 = System.High(BigNaturalNumber));
  var Actual: BigNaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (Actual = System.Default(BigNaturalNumber)));
  System.Assert(18446744073709551615 = Actual.Max);
end;

class procedure ExecutableSpecification_BigNaturalNumber_Complete.Boundaries.TheMinPropertyReturnsZeroForADefaultInstance();
begin
  System.Assert(0 = System.Low(BigNaturalNumber));
  var Actual: BigNaturalNumber := System.Default(BigNaturalNumber);
  System.Assert(Actual = System.Default(BigNaturalNumber));
  System.Assert(0 = Actual.Min);
end;

class procedure ExecutableSpecification_BigNaturalNumber_Complete.Boundaries.TheMinPropertyReturnsZeroForANonDefaultInstance();
begin
  System.Assert(0 = System.Low(BigNaturalNumber));
  var Actual: BigNaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (Actual = System.Default(BigNaturalNumber)));
  System.Assert(0 = Actual.Min);
end;

{ExecutableSpecification_BigNaturalNumber_Complete.TypeIdentity}
class procedure ExecutableSpecification_BigNaturalNumber_Complete.TypeIdentity.Exercise;
begin
  HasADistinctTypeIdentityWhenComparedToTheNativeUInt64();
  HasItsOwnNonNullTypeIdentity();
end;

class procedure ExecutableSpecification_BigNaturalNumber_Complete.TypeIdentity.HasADistinctTypeIdentityWhenComparedToTheNativeUInt64();
begin
  TypeEquivalenceInquiry<BigNaturalNumber>.DoesNotShareTypeIdentityWith<UInt64>();
end;

class procedure ExecutableSpecification_BigNaturalNumber_Complete.TypeIdentity.HasItsOwnNonNullTypeIdentity();
begin
  TypeEquivalenceInquiry<NaturalNumber>.HasANonNullSystemDotTypeInfoValue();
end;

end.
