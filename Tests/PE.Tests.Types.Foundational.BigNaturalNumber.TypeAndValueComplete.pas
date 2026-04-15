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
  ExecutableSpecification_BigNaturalNumber_Complete = record
  public type
    AssignmentCompatibility = record
    strict private
      class procedure IsSymmetricallyAssignmentCompatibleWithTheNativeUInt64TypeWhileRetainingBigNaturalNumberAndUInt64ValuesForEveryValueOfBigNaturalNumberAndUInt64(); static; inline;
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
//    Defaults = record
//      class procedure ValueIsZero(); static; inline;
//    public
//      class procedure Exercise(); static; inline;
//    end;
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

{ ExecutableSpecification_BigNaturalNumber_Complete.Boundaries }

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

{ ExecutableSpecification_BigNaturalNumber_Complete }

class procedure ExecutableSpecification_BigNaturalNumber_Complete.Exercise;
begin
  Boundaries.Exercise();
  TypeIdentity.Exercise();
end;

class procedure ExecutableSpecification_BigNaturalNumber_Complete.TheDefaultValueIsZero;
begin
  System.Assert(0 = System.Default(BigNaturalNumber));
end;

{ ExecutableSpecification_BigNaturalNumber_Complete.TypeIdentity }

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

{ ExecutableSpecification_BigNaturalNumber_Complete.AssignmentCompatibility }

class procedure ExecutableSpecification_BigNaturalNumber_Complete.AssignmentCompatibility.Exercise();
begin
  IsSymmetricallyAssignmentCompatibleWithTheNativeUInt64TypeWhileRetainingBigNaturalNumberAndUInt64ValuesForEveryValueOfBigNaturalNumberAndUInt64();
end;

class procedure ExecutableSpecification_BigNaturalNumber_Complete.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheNativeUInt64TypeWhileRetainingBigNaturalNumberAndUInt64ValuesForEveryValueOfBigNaturalNumberAndUInt64();
begin

end;

end.
