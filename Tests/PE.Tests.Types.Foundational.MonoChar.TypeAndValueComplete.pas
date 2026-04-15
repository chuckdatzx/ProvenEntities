unit PE.Tests.Types.Foundational.MonoChar.TypeAndValueComplete;
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
  ExecutableSpecification_MonoChar_Complete = record
  public type
    AssignmentCompatibility = record
    strict private const LiteralCharZeroValue: Char = System.Default(Char);
    strict private const LiteralMonoCharZeroValue: MonoChar = System.Default(MonoChar);
    strict private
      class procedure IsSymmetricallyAssignmentCompatibleWithTheNativeCharTypeWhileRetainingMonoCharAndNativeCharValuesForEveryValueOfMonoCharAndNativeChar(); static; inline;
    strict private class constructor Create();
    public
      class procedure Exercise(); static; inline;
    end;
    Boundaries = record
    strict private
      class procedure TheLowestPossibleOrdinalValueIsZero(); static; inline;
      class procedure TheHighestPossibleOrdinalValueIs65536(); static; inline;
    strict private {Min property}
      class procedure TheMinPropertyReturnsTheFirstMonoCharForADefaultInstance(); static; inline;
      class procedure TheMinPropertyReturnsZeroForANonDefaultInstance(); static; inline;
    strict private {Max property}
      class procedure TheMaxPropertyReturns65535ForADefaultInstance(); static; inline;
      class procedure TheMaxPropertyReturns65535ForANonDefaultInstance(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    TypeIdentity = record
    strict private
      class procedure HasADistinctTypeIdentityWhenComparedToTheNativeCharType(); static; inline;
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

{ExecutableSpecification_MonoChar_Complete}
class procedure ExecutableSpecification_MonoChar_Complete.Exercise();
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  TheDefaultValueIsZero();
  TypeIdentity.Exercise();
end;

class procedure ExecutableSpecification_MonoChar_Complete.TheDefaultValueIsZero();
begin
  System.Assert(0 = Ord(System.Default(MonoChar)));
end;

{ExecutableSpecification_MonoChar_Complete.AssignmentCompatibility}
class constructor ExecutableSpecification_MonoChar_Complete.AssignmentCompatibility.Create;
begin
  System.Assert(0 = Ord(LiteralCharZeroValue));
  System.Assert(0 = Ord(LiteralMonoCharZeroValue));
end;

class procedure ExecutableSpecification_MonoChar_Complete.AssignmentCompatibility.Exercise();
begin
  IsSymmetricallyAssignmentCompatibleWithTheNativeCharTypeWhileRetainingMonoCharAndNativeCharValuesForEveryValueOfMonoCharAndNativeChar();
end;

class procedure ExecutableSpecification_MonoChar_Complete.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheNativeCharTypeWhileRetainingMonoCharAndNativeCharValuesForEveryValueOfMonoCharAndNativeChar();
begin
  System.Assert(0 = Ord(MonoChar.Min));
  System.Assert(65535 = Ord(MonoChar.Max));
  System.Assert(0 = Ord(System.Low(Char)));
  System.Assert(65535 = Ord(System.High(Char)));
  var ActualZeroChar: Char := System.High(Char);
  var ActualZeroMonoChar: MonoChar := System.High(MonoChar);
  System.Assert(not (LiteralCharZeroValue = ActualZeroChar));
  System.Assert(not (LiteralMonoCharZeroValue = ActualZeroMonoChar));
  ActualZeroChar := LiteralCharZeroValue;
  ActualZeroMonoChar := LiteralMonoCharZeroValue;
  System.Assert(LiteralCharZeroValue = ActualZeroChar);
  System.Assert(LiteralMonoCharZeroValue = ActualZeroMonoChar);
  System.Assert(ActualZeroChar = ActualZeroMonoChar);
  for var EachExpected: Char := Char(Ord(MonoChar.Min) + 1) to MonoChar.Max do
  begin
    var ActualChar: Char := EachExpected;
    var Actual: MonoChar := System.Default(MonoChar);
    System.Assert(not (ActualChar = Actual));
    Actual := ActualChar;
    System.Assert(ActualChar = Actual);
    ActualChar := System.Default(Char);
    System.Assert(not (ActualChar = Actual));
    ActualChar := Actual;
    System.Assert(EachExpected = ActualChar);
    System.Assert(ActualChar = Actual);
  end;
end;

{ExecutableSpecification_MonoChar_Complete.Boundaries}
class procedure ExecutableSpecification_MonoChar_Complete.Boundaries.Exercise;
begin
  TheHighestPossibleOrdinalValueIs65536();
  TheLowestPossibleOrdinalValueIsZero();
  TheMinPropertyReturnsTheFirstMonoCharForADefaultInstance();
  TheMinPropertyReturnsZeroForANonDefaultInstance();
  TheMaxPropertyReturns65535ForADefaultInstance();
  TheMaxPropertyReturns65535ForANonDefaultInstance();
end;

class procedure ExecutableSpecification_MonoChar_Complete.Boundaries.TheHighestPossibleOrdinalValueIs65536();
begin
  System.Assert(65535 = System.Ord(System.High(MonoChar)));
end;

class procedure ExecutableSpecification_MonoChar_Complete.Boundaries.TheLowestPossibleOrdinalValueIsZero();
begin
  System.Assert(0 = System.Ord(System.Low(MonoChar)));
end;

class procedure ExecutableSpecification_MonoChar_Complete.Boundaries.TheMaxPropertyReturns65535ForADefaultInstance();
begin
  System.Assert(65535 = Ord(System.High(MonoChar)));
  var Actual: MonoChar := System.Default(MonoChar);
  System.Assert(Actual = System.Default(MonoChar));
  System.Assert(65535 = Ord(Actual.Max));
end;

class procedure ExecutableSpecification_MonoChar_Complete.Boundaries.TheMaxPropertyReturns65535ForANonDefaultInstance();
begin
  System.Assert(65535 = Ord(System.High(MonoChar)));
  var Actual: MonoChar := Rando_TheUntrustworthy.NonDefaultValue<MonoChar>();
  System.Assert(not (Actual = System.Default(MonoChar)));
  System.Assert(65535 = Ord(Actual.Max));
end;

class procedure ExecutableSpecification_MonoChar_Complete.Boundaries.TheMinPropertyReturnsTheFirstMonoCharForADefaultInstance();
begin
  System.Assert(0 = Ord(System.Low(MonoChar)));
  var Actual: MonoChar := System.Default(MonoChar);
  System.Assert(Actual = System.Default(MonoChar));
  System.Assert(0 = Ord(Actual.Min));
end;

class procedure ExecutableSpecification_MonoChar_Complete.Boundaries.TheMinPropertyReturnsZeroForANonDefaultInstance();
begin
  System.Assert(0 = Ord(System.Low(MonoChar)));
  var Actual: MonoChar := Rando_TheUntrustworthy.NonDefaultValue<MonoChar>();
  System.Assert(not (Actual = System.Default(MonoChar)));
  System.Assert(0 = Ord(Actual.Min));
end;

{ExecutableSpecification_MonoChar_Complete.TypeIdentity}
class procedure ExecutableSpecification_MonoChar_Complete.TypeIdentity.Exercise;
begin
  HasADistinctTypeIdentityWhenComparedToTheNativeCharType();
  HasItsOwnNonNullTypeIdentity();
end;

class procedure ExecutableSpecification_MonoChar_Complete.TypeIdentity.HasADistinctTypeIdentityWhenComparedToTheNativeCharType;
begin
  TypeEquivalenceInquiry<MonoChar>.DoesNotShareTypeIdentityWith<Char>();
end;

class procedure ExecutableSpecification_MonoChar_Complete.TypeIdentity.HasItsOwnNonNullTypeIdentity();
begin
  TypeEquivalenceInquiry<MonoChar>.HasANonNullSystemDotTypeInfoValue();
end;

procedure Exercise();
begin
  ExecutableSpecification_MonoChar_Complete.Exercise();
end;

end.
