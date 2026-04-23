unit PE.Tests.BoundedTypes.MonoChar;
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
  ExecutableSpecification_MonoChar_TypeCompleteTests = record
  strict private class var MonoChar_Default: MonoChar;
  strict private class var MonoChar_First: MonoChar;
  strict private class var MonoChar_Last: MonoChar;
  public type
    Boundaries = record
    strict private
      class procedure TheLowestPossibleOrdinalValueIsZero(); static; inline;
      class procedure TheHighestPossibleOrdinalValueIs65536(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Properties = record
    strict private {Min property}
      class procedure TheMinPropertyReturnsTheFirstMonoCharWhenReferencingSaidPropertyFromADefaultInstance(); static; inline;
      class procedure TheMinPropertyReturnsTheFirstMonoCharWhenReferencingSaidPropertyFromANonDefaultInstance(); static; inline;
      class procedure TheMinPropertyReturnsTheFirstMonoCharWhenReferencingSaidPropertyFromTheTypeName(); static; inline;
    strict private {Max property}
      class procedure TheMaxPropertyReturnsTheLastMonoCharWhenReferencingSaidPropertyFromADefaultInstance(); static; inline;
      class procedure TheMaxPropertyReturnsTheLastMonoCharWhenReferencingSaidPropertyFromANonDefaultInstance(); static; inline;
      class procedure TheMaxPropertyReturnsTheLastMonoCharWhenReferencingSaidPropertyFromTheTypeName(); static; inline;
    strict private {Type Identity}
      class procedure TheTypeIdentityPropertyContainsANonNullIdentifierMatchingTheSystemDotInfoRoutinesValue(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class constructor Create();
  public
    class procedure HasADistinctTypeIdentityWhenComparedToTheNativeCharType(); static; inline;
    class procedure TheDefaultValueIsZero(); static; inline;
  public
    class procedure Exercise(); static; inline;
  end;

  ExecutableSpecification_MonoChar_ValueCompleteTests = record
  strict private const LiteralCharZeroValue: Char = #0;
  strict private const LiteralMonoCharZeroValue: MonoChar = #0;
  strict private class var MonoChar_Default: MonoChar;
  public type
    AssignmentCompatibility = record
    strict private {Native Delphi Types}
      class procedure IsSymmetricallyAssignmentCompatibleWithTheNativeCharTypeWhileRetainingNativeCharValuesForEveryValueOfNativeChar(); static; inline;
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

procedure Exercise(); inline;
begin
  ExecutableSpecification_MonoChar_TypeCompleteTests.Exercise();
  ExecutableSpecification_MonoChar_ValueCompleteTests.Exercise();
end;

{ ExecutableSpecification_MonoChar_TypeCompleteTests.Boundaries }

class procedure ExecutableSpecification_MonoChar_TypeCompleteTests.Boundaries.Exercise;
begin
  TheLowestPossibleOrdinalValueIsZero();
  TheHighestPossibleOrdinalValueIs65536();
end;

class procedure ExecutableSpecification_MonoChar_TypeCompleteTests.Boundaries.TheHighestPossibleOrdinalValueIs65536;
begin
  System.Assert(65535 = System.Ord(System.High(MonoChar)));
end;

class procedure ExecutableSpecification_MonoChar_TypeCompleteTests.Boundaries.TheLowestPossibleOrdinalValueIsZero;
begin
  System.Assert(0 = System.Ord(System.Low(MonoChar)));
end;

{ ExecutableSpecification_MonoChar_TypeCompleteTests }

class constructor ExecutableSpecification_MonoChar_TypeCompleteTests.Create;
begin
  MonoChar_Default := System.Default(MonoChar);
  System.Assert(System.Default(MonoChar) = MonoChar_Default);
  MonoChar_First := System.Low(MonoChar);
  System.Assert(System.Low(MonoChar) = MonoChar_First);
  MonoChar_Last := System.High(MonoChar);
  System.Assert(System.High(MonoChar) = MonoChar_Last);
end;

class procedure ExecutableSpecification_MonoChar_TypeCompleteTests.Exercise;
begin
  Boundaries.Exercise();
  Properties.Exercise();
  HasADistinctTypeIdentityWhenComparedToTheNativeCharType();
  TheDefaultValueIsZero();
end;

class procedure ExecutableSpecification_MonoChar_TypeCompleteTests.HasADistinctTypeIdentityWhenComparedToTheNativeCharType;
begin
  TypeEquivalenceInquiry<MonoChar>.DoesNotShareTypeIdentityWith<Char>();
end;

class procedure ExecutableSpecification_MonoChar_TypeCompleteTests.TheDefaultValueIsZero;
begin
  System.Assert(0 = Ord(MonoChar_Default));
end;

{ ExecutableSpecification_MonoChar_TypeCompleteTests.Properties }

class procedure ExecutableSpecification_MonoChar_TypeCompleteTests.Properties.Exercise;
begin
  TheMinPropertyReturnsTheFirstMonoCharWhenReferencingSaidPropertyFromTheTypeName();
  TheMinPropertyReturnsTheFirstMonoCharWhenReferencingSaidPropertyFromADefaultInstance();
  TheMinPropertyReturnsTheFirstMonoCharWhenReferencingSaidPropertyFromANonDefaultInstance();
  TheMaxPropertyReturnsTheLastMonoCharWhenReferencingSaidPropertyFromTheTypeName();
  TheMaxPropertyReturnsTheLastMonoCharWhenReferencingSaidPropertyFromADefaultInstance();
  TheMaxPropertyReturnsTheLastMonoCharWhenReferencingSaidPropertyFromANonDefaultInstance();
  TheTypeIdentityPropertyContainsANonNullIdentifierMatchingTheSystemDotInfoRoutinesValue()
end;

class procedure ExecutableSpecification_MonoChar_TypeCompleteTests.Properties.TheMaxPropertyReturnsTheLastMonoCharWhenReferencingSaidPropertyFromADefaultInstance;
begin
  System.Assert(MonoChar_Last = MonoChar_Default.Max);
end;

class procedure ExecutableSpecification_MonoChar_TypeCompleteTests.Properties.TheMaxPropertyReturnsTheLastMonoCharWhenReferencingSaidPropertyFromANonDefaultInstance;
begin
  var Actual: MonoChar := Rando_TheUntrustworthy.NonDefaultValue<MonoChar>();
  System.Assert(not (Actual = MonoChar_Default));
  System.Assert(MonoChar_Last = Actual.Max);
end;

class procedure ExecutableSpecification_MonoChar_TypeCompleteTests.Properties.TheMaxPropertyReturnsTheLastMonoCharWhenReferencingSaidPropertyFromTheTypeName;
begin
  System.Assert(MonoChar_Last = MonoChar.Max);
end;

class procedure ExecutableSpecification_MonoChar_TypeCompleteTests.Properties.TheMinPropertyReturnsTheFirstMonoCharWhenReferencingSaidPropertyFromADefaultInstance;
begin
  System.Assert(MonoChar_First = MonoChar_Default.Min);
end;

class procedure ExecutableSpecification_MonoChar_TypeCompleteTests.Properties.TheMinPropertyReturnsTheFirstMonoCharWhenReferencingSaidPropertyFromANonDefaultInstance;
begin
  var Actual: MonoChar := Rando_TheUntrustworthy.NonDefaultValue<MonoChar>();
  System.Assert(not (Actual = MonoChar_Default));
  System.Assert(MonoChar_First = Actual.Min);
end;

class procedure ExecutableSpecification_MonoChar_TypeCompleteTests.Properties.TheMinPropertyReturnsTheFirstMonoCharWhenReferencingSaidPropertyFromTheTypeName;
begin
  System.Assert(MonoChar_First = MonoChar.Min);
end;

class procedure ExecutableSpecification_MonoChar_TypeCompleteTests.Properties.TheTypeIdentityPropertyContainsANonNullIdentifierMatchingTheSystemDotInfoRoutinesValue;
begin
  TypeEquivalenceInquiry<MonoChar>.HasANonNullSystemDotTypeInfoValue();
  System.Assert(System.TypeInfo(MonoChar) = MonoChar.TypeIdentity);
end;

{ ExecutableSpecification_MonoChar_ValueCompleteTests }

class constructor ExecutableSpecification_MonoChar_ValueCompleteTests.Create;
begin
  System.Assert(LiteralCharZeroValue = #0);
  System.Assert(LiteralMonoCharZeroValue = #0);
  MonoChar_Default := System.Default(MonoChar);
  System.Assert(System.Default(MonoChar) = MonoChar_Default);
end;

class procedure ExecutableSpecification_MonoChar_ValueCompleteTests.Exercise;
begin
  AssignmentCompatibility.Exercise();
end;

{ ExecutableSpecification_MonoChar_ValueCompleteTests.AssignmentCompatibility }

class procedure ExecutableSpecification_MonoChar_ValueCompleteTests.AssignmentCompatibility.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithTheNativeCharTypeWhileRetainingNativeCharValuesForEveryValueOfNativeChar();
end;

class procedure ExecutableSpecification_MonoChar_ValueCompleteTests.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheNativeCharTypeWhileRetainingNativeCharValuesForEveryValueOfNativeChar;
begin
  //Validating Assumptions
  System.Assert(MonoChar.Min = System.Low(Char));
  System.Assert(MonoChar.Max = System.High(Char));
  //Test
  var ActualZeroChar: Char := System.High(Char);
  var ActualZeroMonoChar: MonoChar := System.High(MonoChar);
  System.Assert(not (LiteralCharZeroValue = ActualZeroChar));
  System.Assert(not (LiteralMonoCharZeroValue = ActualZeroMonoChar));
  ActualZeroChar := LiteralCharZeroValue;
  ActualZeroMonoChar := LiteralMonoCharZeroValue;
  System.Assert(LiteralCharZeroValue = ActualZeroChar);
  System.Assert(LiteralMonoCharZeroValue = ActualZeroMonoChar);
  System.Assert(ActualZeroChar = ActualZeroMonoChar);
  for var EachExpected: Char := Char(Succ(System.Low(Char))) to System.High(Char) do
  begin
    var ActualChar: Char := EachExpected;
    var Actual: MonoChar := MonoChar_Default;
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

end.
