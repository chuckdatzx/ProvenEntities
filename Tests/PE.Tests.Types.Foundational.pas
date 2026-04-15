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

procedure Exercise(); inline;

implementation

uses
  {PE}
  PE.Types.Foundational.Generics;

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

procedure Exercise();
begin
  ExecutableSpecification_BigNaturalNumber.Exercise();
end;

end.
