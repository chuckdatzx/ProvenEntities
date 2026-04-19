unit PE.Tests.BoundedTypes.NaturalNumber;
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
{
If the assumptions (listed in the PE.Tests unit) are True, then the PE.Types.Foundational.NaturalNumber type is "proven" to Strength(X) for both now and in any future execution scenarios,
where "Strength(X)" is defined in the PE.Tests unit.
[Chuck C.T. :: 4/14/20206 :: Claiming that the above is both sound and complete constructivist proof]
}

uses
  PE.Actors.Rando,  //In the interface section for inlining
  PE.Delphi.TypeIdentity,  //In the interface section for inlining
  PE.Types;

type
  ExecutableSpecification_NaturalNumber_TypeComplete = record
  strict private class var NaturalNumber_Default: NaturalNumber;
  strict private class var NaturalNumber_First: NaturalNumber;
  strict private class var NaturalNumber_Last: NaturalNumber;
  public type
    Boundaries = record
    strict private
      class procedure TheLowestPossibleValueIsZero(); static; inline;
      class procedure TheHighestPossibleNumberIs4294967295(); static; inline; //4.2 billion
    public
      class procedure Exercise(); static; inline;
    end;
    Properties = record
    strict private {Min property}
      class procedure TheMinPropertyReturnsTheFirstNaturalNumberWhenReferencingSaidPropertyFromADefaultInstance(); static; inline;
      class procedure TheMinPropertyReturnsTheFirstNaturalNumberWhenReferencingSaidPropertyFromANonDefaultInstance(); static; inline;
      class procedure TheMinPropertyReturnsTheFirstNaturalNumberWhenReferencingSaidPropertyFromTheTypeNameDefaultInstance(); static; inline;
    strict private {Max property}
      class procedure TheMaxPropertyReturnsTheLastNaturalNumberWhenReferencingSaidPropertyFromADefaultInstance(); static; inline;
      class procedure TheMaxPropertyReturnsTheLastNaturalNumberWhenReferencingSaidPropertyFromANonDefaultInstance(); static; inline;
      class procedure TheMaxPropertyReturnsTheLastNaturalNumberWhenReferencingSaidPropertyFromTheTypeName(); static; inline;
    strict private {TypeIdentity}
      class procedure TheTypeIdentityPropertyContainsANonNullIdentifierMatchingTheSystemDotInfoRoutinesValue(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class constructor Create();
  public
    class procedure HasADistinctTypeIdentityWhenComparedToTheNativeCardinal(); static; inline;
    class procedure TheDefaultValueIsZero(); static; inline;
  public
    class procedure Exercise(); static; inline;
  end;

  ExecutableSpecification_NaturalNumber_ValueComplete = record
  strict private class var NaturalNumber_Default: NaturalNumber;
  public type
    AssignmentCompatibility = record
    strict private {PE Types}
//      class procedure IsSymmetricallyAssignmentCompatibleWithMonoCharTypeWhileRetainingNaturalNumberAndMonoCharValuesForEveryValueOfMonoChar(); static; inline;
    strict private {Native Types}
      class procedure IsSymmetricallyAssignmentCompatibleWithTheNativeCardinalTypeWhileRetainingCardinalValuesForEveryValueOfCardinal(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class constructor Create();
  public
    class procedure Exercise(); static; inline;
  end;

procedure Exercise(); inline;

implementation

procedure Exercise();
begin
  ExecutableSpecification_NaturalNumber_TypeComplete.Exercise();
  ExecutableSpecification_NaturalNumber_ValueComplete.Exercise();
end;

{ ExecutableSpecification_NaturalNumber_TypeComplete.Boundaries }

class procedure ExecutableSpecification_NaturalNumber_TypeComplete.Boundaries.Exercise;
begin
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs4294967295();
end;

class procedure ExecutableSpecification_NaturalNumber_TypeComplete.Boundaries.TheHighestPossibleNumberIs4294967295;
begin
  System.Assert(4294967295 = System.High(NaturalNumber));
end;

class procedure ExecutableSpecification_NaturalNumber_TypeComplete.Boundaries.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber));
end;

{ ExecutableSpecification_NaturalNumber_TypeComplete.Properties }

class procedure ExecutableSpecification_NaturalNumber_TypeComplete.Properties.Exercise;
begin
  TheMinPropertyReturnsTheFirstNaturalNumberWhenReferencingSaidPropertyFromADefaultInstance();
  TheMinPropertyReturnsTheFirstNaturalNumberWhenReferencingSaidPropertyFromANonDefaultInstance();
  TheMinPropertyReturnsTheFirstNaturalNumberWhenReferencingSaidPropertyFromTheTypeNameDefaultInstance();
  TheMaxPropertyReturnsTheLastNaturalNumberWhenReferencingSaidPropertyFromADefaultInstance();
  TheMaxPropertyReturnsTheLastNaturalNumberWhenReferencingSaidPropertyFromANonDefaultInstance();
  TheMaxPropertyReturnsTheLastNaturalNumberWhenReferencingSaidPropertyFromTheTypeName();
  TheTypeIdentityPropertyContainsANonNullIdentifierMatchingTheSystemDotInfoRoutinesValue();
end;

class procedure ExecutableSpecification_NaturalNumber_TypeComplete.Properties.TheMaxPropertyReturnsTheLastNaturalNumberWhenReferencingSaidPropertyFromADefaultInstance;
begin
  System.Assert(NaturalNumber_Last = NaturalNumber_Default.Max);
end;

class procedure ExecutableSpecification_NaturalNumber_TypeComplete.Properties.TheMaxPropertyReturnsTheLastNaturalNumberWhenReferencingSaidPropertyFromANonDefaultInstance;
begin
  var Actual: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (Actual = NaturalNumber_Default));
  System.Assert(NaturalNumber_Last = Actual.Max);
end;

class procedure ExecutableSpecification_NaturalNumber_TypeComplete.Properties.TheMaxPropertyReturnsTheLastNaturalNumberWhenReferencingSaidPropertyFromTheTypeName;
begin
  System.Assert(NaturalNumber_Last = NaturalNumber.Max);
end;

class procedure ExecutableSpecification_NaturalNumber_TypeComplete.Properties.TheMinPropertyReturnsTheFirstNaturalNumberWhenReferencingSaidPropertyFromADefaultInstance;
begin
  System.Assert(NaturalNumber_First = NaturalNumber_Default.Min);
end;

class procedure ExecutableSpecification_NaturalNumber_TypeComplete.Properties.TheMinPropertyReturnsTheFirstNaturalNumberWhenReferencingSaidPropertyFromANonDefaultInstance;
begin
  var Actual: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (Actual = NaturalNumber_Default));
  System.Assert(NaturalNumber_First = Actual.Min);
end;

class procedure ExecutableSpecification_NaturalNumber_TypeComplete.Properties.TheMinPropertyReturnsTheFirstNaturalNumberWhenReferencingSaidPropertyFromTheTypeNameDefaultInstance;
begin
  System.Assert(NaturalNumber_First = NaturalNumber.Min);
end;

class procedure ExecutableSpecification_NaturalNumber_TypeComplete.Properties.TheTypeIdentityPropertyContainsANonNullIdentifierMatchingTheSystemDotInfoRoutinesValue;
begin
  TypeEquivalenceInquiry<NaturalNumber>.HasANonNullSystemDotTypeInfoValue();
  System.Assert(System.TypeInfo(NaturalNumber) = NaturalNumber.TypeIdentity);
end;

{ ExecutableSpecification_NaturalNumber_TypeComplete }

class constructor ExecutableSpecification_NaturalNumber_TypeComplete.Create;
begin
  NaturalNumber_Default := System.Default(NaturalNumber);
  System.Assert(System.Default(NaturalNumber) = NaturalNumber_Default);
  NaturalNumber_First := System.Low(NaturalNumber);
  System.Assert(System.Low(NaturalNumber) = NaturalNumber_First);
  NaturalNumber_Last := System.High(NaturalNumber);
  System.Assert(System.High(NaturalNumber) = NaturalNumber_Last);
end;

class procedure ExecutableSpecification_NaturalNumber_TypeComplete.Exercise;
begin
  HasADistinctTypeIdentityWhenComparedToTheNativeCardinal();
  TheDefaultValueIsZero();
end;

class procedure ExecutableSpecification_NaturalNumber_TypeComplete.HasADistinctTypeIdentityWhenComparedToTheNativeCardinal();
begin
  TypeEquivalenceInquiry<NaturalNumber>.DoesNotShareTypeIdentityWith<Cardinal>();
end;

class procedure ExecutableSpecification_NaturalNumber_TypeComplete.TheDefaultValueIsZero();
begin
  System.Assert(0 = NaturalNumber_Default);
end;

{ ExecutableSpecification_NaturalNumber_ValueComplete.AssignmentCompatibility }

class procedure ExecutableSpecification_NaturalNumber_ValueComplete.AssignmentCompatibility.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithTheNativeCardinalTypeWhileRetainingCardinalValuesForEveryValueOfCardinal();
end;

class procedure ExecutableSpecification_NaturalNumber_ValueComplete.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheNativeCardinalTypeWhileRetainingCardinalValuesForEveryValueOfCardinal();
begin
  //Validating Assumptions
  System.Assert(NaturalNumber.Min = System.Low(Cardinal));
  System.Assert(NaturalNumber.Max = System.High(Cardinal));
  //Test
  var ActualZeroCardinal: Cardinal := System.High(Cardinal);
  var ActualZeroNaturalNumber: NaturalNumber := System.High(NaturalNumber);
  System.Assert(not (0 = ActualZeroCardinal));
  System.Assert(not (0 = ActualZeroNaturalNumber));
  ActualZeroCardinal := 0;
  ActualZeroNaturalNumber := 0;
  System.Assert(0 = ActualZeroCardinal);
  System.Assert(0 = ActualZeroNaturalNumber);
  System.Assert(ActualZeroCardinal = ActualZeroNaturalNumber);
  for var EachExpected: Cardinal := Succ(System.Low(Cardinal)) to System.High(Cardinal) do
  begin
    var ActualCardinal: Cardinal := EachExpected;
    var Actual: NaturalNumber := NaturalNumber_Default;
    System.Assert(not (ActualCardinal = Actual));
    Actual := ActualCardinal;
    System.Assert(ActualCardinal = Actual);
    ActualCardinal := System.Default(Cardinal);
    System.Assert(not (ActualCardinal = Actual));
    ActualCardinal := Actual;
    System.Assert(EachExpected = ActualCardinal);
    System.Assert(ActualCardinal = Actual);
  end;
end;

{ ExecutableSpecification_NaturalNumber_ValueComplete }

class constructor ExecutableSpecification_NaturalNumber_ValueComplete.Create;
begin
  NaturalNumber_Default := System.Default(NaturalNumber);
  System.Assert(System.Default(NaturalNumber) = NaturalNumber_Default);
end;

class procedure ExecutableSpecification_NaturalNumber_ValueComplete.Exercise;
begin
  AssignmentCompatibility.Exercise();
end;

end.
