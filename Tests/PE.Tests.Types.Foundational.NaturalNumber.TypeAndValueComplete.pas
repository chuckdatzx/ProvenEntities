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
  public type
    AssignmentCompatibility = record
    strict private const LiteralZeroValue = 0;
    strict private {PE Types}
//      class procedure IsSymmetricallyAssignmentCompatibleWithMonoCharTypeWhileRetainingNaturalNumberAndMonoCharValuesForEveryValueOfMonoChar(); static; inline;
      class procedure IsSymmetricallyAssignmentCompatibleWithBigNaturalNumberTypeWhileRetainingNaturalNumberAndBigNaturalNumberValuesForEveryValueOfNaturalNumber(); static; inline;
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
    class procedure TheDefaultValueIsZero(); static; inline;
  public
    class procedure Exercise(); static; inline;
  end;

procedure Exercise(); inline;

implementation

procedure Exercise();
begin
  ExecutableSpecification_NaturalNumber_Complete.Exercise();
end;

{ ExecutableSpecification_NaturalNumber_Complete.Boundaries }

class procedure ExecutableSpecification_NaturalNumber_Complete.Boundaries.Exercise();
begin
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs4294967295();
  TheMinPropertyReturnsZeroForADefaultInstance();
  TheMinPropertyReturnsZeroForANonDefaultInstance();
  TheMaxPropertyReturns4294967295ForADefaultInstance();
  TheMaxPropertyReturns4294967295ForANonDefaultInstance();
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
  var Actual: NaturalNumber := System.Default(NaturalNumber);
  System.Assert(Actual = System.Default(NaturalNumber));
  System.Assert(4294967295 = Actual.Max);
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.Boundaries.TheMaxPropertyReturns4294967295ForANonDefaultInstance();
begin
  System.Assert(4294967295 = System.High(NaturalNumber));
  var Actual: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (Actual = System.Default(NaturalNumber)));
  System.Assert(4294967295 = Actual.Max);
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.Boundaries.TheMinPropertyReturnsZeroForADefaultInstance();
begin
  System.Assert(0 = System.Low(NaturalNumber));
  var Actual: NaturalNumber := System.Default(NaturalNumber);
  System.Assert(Actual = System.Default(NaturalNumber));
  System.Assert(0 = Actual.Min);
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.Boundaries.TheMinPropertyReturnsZeroForANonDefaultInstance();
begin
  System.Assert(0 = System.Low(NaturalNumber));
  var Actual: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (Actual = System.Default(NaturalNumber)));
  System.Assert(0 = Actual.Min);
end;

{ExecutableSpecification_NaturalNumber_Complete}
class procedure ExecutableSpecification_NaturalNumber_Complete.Exercise();
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  TheDefaultValueIsZero();
  TypeIdentity.Exercise();
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.TheDefaultValueIsZero;
begin
  System.Assert(0 = System.Default(NaturalNumber));
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

{ ExecutableSpecification_NaturalNumber_Complete.AssignmentCompatibility }

class procedure ExecutableSpecification_NaturalNumber_Complete.AssignmentCompatibility.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithBigNaturalNumberTypeWhileRetainingNaturalNumberAndBigNaturalNumberValuesForEveryValueOfNaturalNumber();
  IsSymmetricallyAssignmentCompatibleWithTheNativeCardinalTypeWhileRetainingCardinalValuesForEveryValueOfNaturalNumberAndCardinal();
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithBigNaturalNumberTypeWhileRetainingNaturalNumberAndBigNaturalNumberValuesForEveryValueOfNaturalNumber();
begin
  for var Expected: NaturalNumber := (NaturalNumber.Min + 1) to NaturalNumber.Max do
  begin
    var ANaturalNumber: NaturalNumber := System.Default(NaturalNumber);
    var ABigNaturalNumber: BigNaturalNumber := System.Default(BigNaturalNumber);
    System.Assert(not (Expected = ABigNaturalNumber));
    System.Assert(not (Expected = ANaturalNumber));
    ABigNaturalNumber := Expected;
    ANaturalNumber := Expected;
    System.Assert(Expected = ABigNaturalNumber);
    System.Assert(Expected = ANaturalNumber);
    System.Assert(ABigNaturalNumber = ANaturalNumber);
  end;
end;

class procedure ExecutableSpecification_NaturalNumber_Complete.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheNativeCardinalTypeWhileRetainingCardinalValuesForEveryValueOfNaturalNumberAndCardinal();
begin
  System.Assert(0 = NaturalNumber.Min);
  System.Assert(4294967295 = NaturalNumber.Max);
  System.Assert(0 = System.Low(Cardinal));
  System.Assert(4294967295 = System.High(Cardinal));
  var ActualZeroCardinal: Cardinal := System.High(Cardinal);
  var ActualZeroNaturalNumber: NaturalNumber := System.High(NaturalNumber);
  System.Assert(not (LiteralZeroValue = ActualZeroCardinal));
  System.Assert(not (LiteralZeroValue = ActualZeroNaturalNumber));
  ActualZeroCardinal := LiteralZeroValue;
  ActualZeroNaturalNumber := LiteralZeroValue;
  System.Assert(LiteralZeroValue = ActualZeroCardinal);
  System.Assert(LiteralZeroValue = ActualZeroNaturalNumber);
  System.Assert(ActualZeroCardinal = ActualZeroNaturalNumber);
  for var Expected: Cardinal := (System.Low(Cardinal) + 1) to System.High(Cardinal) do
  begin
    var ActualCardinal: Cardinal := Expected;
    var Actual: NaturalNumber := System.Default(NaturalNumber);
    System.Assert(not (ActualCardinal = Actual));
    Actual := ActualCardinal;
    System.Assert(ActualCardinal = Actual);
    ActualCardinal := System.Default(Cardinal);
    System.Assert(not (ActualCardinal = Actual));
    ActualCardinal := Actual;
    System.Assert(Expected = ActualCardinal);
    System.Assert(ActualCardinal = Actual);
  end;
end;

end.
