unit PE.Tests.Types.Foundational.NaturalNumber.TypeAndValueComplete;
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
  ExecutableSpecification_NaturalNumber_Complete = record
  strict private class var NaturalNumber_Default: NaturalNumber;
  public type
    AssignmentCompatibility = record
    strict private const LiteralZeroValue = 0;
    strict private {PE Types}
//      class procedure IsSymmetricallyAssignmentCompatibleWithMonoCharTypeWhileRetainingNaturalNumberAndMonoCharValuesForEveryValueOfMonoChar(); static; inline;
    strict private {Native Types}
      class procedure IsSymmetricallyAssignmentCompatibleWithTheNativeCardinalTypeWhileRetainingCardinalValuesForEveryValueOfNaturalNumberAndCardinal(); static; inline;
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
    strict private {TypeIdentity}
      class procedure TheTypeIdentityPropertyContainsANonNullIdentifierMatchingTheSystemDotInfoRoutinesValue(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    TypeIdentity = record
    strict private
      class procedure HasItsOwnNonNullTypeIdentity(); static; inline;
    strict private
      class procedure HasADistinctTypeIdentityWhenComparedToTheNativeCardinal(); static; inline;
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

implementation

uses
  System.SysUtils;

{ExecutableSpecification_NaturalNumber_Complete}
class constructor ExecutableSpecification_NaturalNumber_Complete.Create;
begin
  NaturalNumber_Default := System.Default(NaturalNumber);
  System.Assert(System.Default(NaturalNumber) = NaturalNumber_Default);
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.Exercise();
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  TheDefaultValueIsZero();
  TypeIdentity.Exercise();
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.TheDefaultValueIsZero;
begin
  System.Assert(0 = NaturalNumber_Default);
end;

{ExecutableSpecification_NaturalNumber_Complete.AssignmentCompatibility}
class procedure ExecutableSpecification_NaturalNumber_Complete.AssignmentCompatibility.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithTheNativeCardinalTypeWhileRetainingCardinalValuesForEveryValueOfNaturalNumberAndCardinal();
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheNativeCardinalTypeWhileRetainingCardinalValuesForEveryValueOfNaturalNumberAndCardinal();
begin
  System.Assert(0 = NaturalNumber.Min);
  System.Assert(4294967295 = NaturalNumber.Max);
  System.Assert(0 = Cardinal.MinValue);
  System.Assert(4294967295 = Cardinal.MaxValue);
  var ActualZeroCardinal: Cardinal := Cardinal.MaxValue;
  var ActualZeroNaturalNumber: NaturalNumber := NaturalNumber.Max;
  System.Assert(not (LiteralZeroValue = ActualZeroCardinal));
  System.Assert(not (LiteralZeroValue = ActualZeroNaturalNumber));
  ActualZeroCardinal := LiteralZeroValue;
  ActualZeroNaturalNumber := LiteralZeroValue;
  System.Assert(LiteralZeroValue = ActualZeroCardinal);
  System.Assert(LiteralZeroValue = ActualZeroNaturalNumber);
  System.Assert(ActualZeroCardinal = ActualZeroNaturalNumber);
  for var Expected: Cardinal := (Cardinal.MinValue + 1) to System.High(Cardinal) do
  begin
    var ActualCardinal: Cardinal := Expected;
    var Actual: NaturalNumber := NaturalNumber_Default;
    System.Assert(not (ActualCardinal = Actual));
    Actual := ActualCardinal;
    System.Assert(ActualCardinal = Actual);
    ActualCardinal := NaturalNumber_Default;
    System.Assert(not (ActualCardinal = Actual));
    ActualCardinal := Actual;
    System.Assert(Expected = ActualCardinal);
    System.Assert(ActualCardinal = Actual);
  end;
end;

{ExecutableSpecification_NaturalNumber_Complete.Boundaries}
class procedure ExecutableSpecification_NaturalNumber_Complete.Boundaries.Exercise();
begin
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs4294967295();
  TheMinPropertyReturnsZeroForADefaultInstance();
  TheMinPropertyReturnsZeroForANonDefaultInstance();
  TheMaxPropertyReturns4294967295ForADefaultInstance();
  TheMaxPropertyReturns4294967295ForANonDefaultInstance();
  TheTypeIdentityPropertyContainsANonNullIdentifierMatchingTheSystemDotInfoRoutinesValue();
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.Boundaries.TheHighestPossibleNumberIs4294967295();
begin
  System.Assert(4294967295 = System.High(NaturalNumber));
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.Boundaries.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber));
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.Boundaries.TheMaxPropertyReturns4294967295ForADefaultInstance();
begin
  System.Assert(4294967295 = System.High(NaturalNumber));
  var Actual: NaturalNumber := NaturalNumber_Default;
  System.Assert(Actual = NaturalNumber_Default);
  System.Assert(4294967295 = Actual.Max);
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.Boundaries.TheMaxPropertyReturns4294967295ForANonDefaultInstance();
begin
  System.Assert(4294967295 = System.High(NaturalNumber));
  var Actual: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (Actual = NaturalNumber_Default));
  System.Assert(4294967295 = Actual.Max);
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.Boundaries.TheMinPropertyReturnsZeroForADefaultInstance();
begin
  System.Assert(0 = System.Low(NaturalNumber));
  var Actual: NaturalNumber := NaturalNumber_Default;
  System.Assert(Actual = NaturalNumber_Default);
  System.Assert(0 = Actual.Min);
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.Boundaries.TheMinPropertyReturnsZeroForANonDefaultInstance();
begin
  System.Assert(0 = System.Low(NaturalNumber));
  var Actual: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (Actual = NaturalNumber_Default));
  System.Assert(0 = Actual.Min);
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.Boundaries.TheTypeIdentityPropertyContainsANonNullIdentifierMatchingTheSystemDotInfoRoutinesValue();
begin
  TypeEquivalenceInquiry<NaturalNumber>.HasANonNullSystemDotTypeInfoValue();
  System.Assert(System.TypeInfo(NaturalNumber) = NaturalNumber.TypeIdentity);
end;

{ExecutableSpecification_NaturalNumber_Complete.TypeIdentity}
class procedure ExecutableSpecification_NaturalNumber_Complete.TypeIdentity.Exercise;
begin
  HasADistinctTypeIdentityWhenComparedToTheNativeCardinal();
  HasItsOwnNonNullTypeIdentity();
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.TypeIdentity.HasADistinctTypeIdentityWhenComparedToTheNativeCardinal();
begin
  TypeEquivalenceInquiry<NaturalNumber>.DoesNotShareTypeIdentityWith<Cardinal>();
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.TypeIdentity.HasItsOwnNonNullTypeIdentity();
begin
  TypeEquivalenceInquiry<NaturalNumber>.HasANonNullSystemDotTypeInfoValue();
end;

end.
