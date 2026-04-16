unit PE.Tests.TypeCompleteAndValueComplete.ArrayOf;
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
{$RANGECHECKS ON}
{$REFERENCEINFO ON}
{$SCOPEDENUMS ON}
{$STACKFRAMES OFF}
{$WARNINGS ON}
{$WRITEABLECONST OFF}
interface
{
If the assumptions (listed in the PE.Tests unit) are True, then the PE.Types.Foundational.ArrayOf<T> type is "proven" to Strength(X) for both now and in any future execution scenarios,
where "Strength(X)" is defined in the PE.Tests unit.
[Chuck C.T. :: 4/14/20206 :: Claiming that the above is both sound and complete constructivist proof]
}
uses
  PE.Actors.Rando,  //In the interface section for inlining
  PE.Delphi.TypeIdentity,
  PE.Routines,  //In the interface section for inlining
  {Delphi}
  System.RTTI;  //Included here for inlining

{$IF (not PE.Delphi.TypeIdentity.DelphiTypeIdentityEstablishedAtCompileTime)}
   {$MESSAGE FATAL 'Unable to continue without compile-time assertions established.'}
{$ENDIF}

type
  {$REGION 'ArrayOf<T> type'}
  ExecutableSpecification_ArrayOf_Complete<TypeUnderTest: record> = record
  public type
    AssignmentOperator = record
    strict private class function InIsServiceableTypeWeTrust(): Boolean; static; inline;
    strict private
      class procedure IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesASingleElementOfTForAllT(); static; inline;  //This routine could take a very very very long time to complete
      class procedure IsSymmetricallyAssignmentCompatibleWithItself_DemonstratedBy1000IterationsOfCopyingARandomRangeOfMultipleElementsFromOneInstanceToAnotherWhereEachElementHasARandomNonDefaultValueOfT(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Defaults = record
    strict private
      class procedure IsInitializedToAnEmptyCollectionOfElements(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    TypeIdentity = record
    strict private
      class procedure SharesTypeIdentityWithTArray(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;
  {$ENDREGION}

implementation

uses
  PE.Types.Foundational;

{$REGION 'ArrayOf<T> type'}
{ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>}
class procedure ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.Exercise;
begin
  AssignmentOperator.Exercise();
  Defaults.Exercise();
  TypeIdentity.Exercise();
end;

{ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.AssignmentOperator}
class function ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.AssignmentOperator.InIsServiceableTypeWeTrust(): Boolean;
begin
  TypeEquivalenceInquiry<TypeUnderTest>.HasANonNullSystemDotTypeInfoValue();
  Result := (System.TypeInfo(Digit) <> System.TypeInfo(TypeUnderTest)) or
    (System.TypeInfo(MonoChar) <> System.TypeInfo(TypeUnderTest)) or
    (System.TypeInfo(NaturalNumber) <> System.TypeInfo(TypeUnderTest));
end;

class procedure ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.AssignmentOperator.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithItself_DemonstratedBy1000IterationsOfCopyingARandomRangeOfMultipleElementsFromOneInstanceToAnotherWhereEachElementHasARandomNonDefaultValueOfT();
  IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesASingleElementOfTForAllT();
end;

class procedure ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.AssignmentOperator.IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesASingleElementOfTForAllT();
begin
  System.Assert(InIsServiceableTypeWeTrust(), 'Unserviceable type in the EnforceServiceableTypes member');
  if (System.TypeInfo(NaturalNumber) = System.TypeInfo(TypeUnderTest))then
  begin
    for var Counter: NaturalNumber := NaturalNumber.Min to NaturalNumber.Max do
    begin
      var ExpectedValue: NaturalNumber;
      ExpectedValue := Counter;
      var Expected: ArrayOf<NaturalNumber> := [ExpectedValue];
      System.Assert(not (Expected = System.Default(ArrayOf<NaturalNumber>)));
      System.Assert(1 = System.Length(Expected));
      var Actual: ArrayOf<NaturalNumber> := System.Default(ArrayOf<NaturalNumber>);
      System.Assert(System.Default(ArrayOf<NaturalNumber>) = Actual);
      Actual := Expected;
      System.Assert(not (System.Default(ArrayOf<NaturalNumber>) = Actual));
      System.Assert(1 = System.Length(Actual));
      System.Assert(ExpectedValue = Actual[System.Low(Actual)]);
    end;
  end
  else begin
    var OrdinalValidationAndProvider: TValue := TValue.From<TypeUnderTest>(System.Default(TypeUnderTest));
    System.Assert(OrdinalValidationAndProvider.IsOrdinal);
    System.Assert(System.Assigned(OrdinalValidationAndProvider.TypeData));
    System.Assert(not ((System.TypeInfo(TypeUnderTest) = System.TypeInfo(Boolean)) or (OrdinalValidationAndProvider.TypeData.MinValue < 0) or (OrdinalValidationAndProvider.TypeData.MaxValue = -1)));
    var OverallDistance: NativeUInt := (Abs(OrdinalValidationAndProvider.TypeData.MaxValue) - Abs(OrdinalValidationAndProvider.TypeData.MinValue));
    System.Assert(OverallDistance > 0);
    System.Assert(NaturalNumber.Max > OverallDistance);
    for var Counter: NativeInt := OrdinalValidationAndProvider.TypeData.MinValue to OrdinalValidationAndProvider.TypeData.MaxValue do
    begin
      var ExpectedValue: TypeUnderTest;
      var AValue: TValue := TValue.From<NativeInt>(Counter);
      ExpectedValue := TValue.FromOrdinal(System.TypeInfo(TypeUnderTest), Counter).AsType<TypeUnderTest>();
      var Expected: ArrayOf<TypeUnderTest> := [ExpectedValue];
      System.Assert(not (Expected = System.Default(ArrayOf<TypeUnderTest>)));
      System.Assert(1 = System.Length(Expected));
      var Actual: ArrayOf<TypeUnderTest> := System.Default(ArrayOf<TypeUnderTest>);
      System.Assert(System.Default(ArrayOf<TypeUnderTest>) = Actual);
      Actual := Expected;
      System.Assert(not (System.Default(ArrayOf<TypeUnderTest>) = Actual));
      System.Assert(1 = System.Length(Actual));
      System.Assert(ExpectedValue = Actual[System.Low(Actual)]);
    end;
  end;
end;

class procedure ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.AssignmentOperator.IsSymmetricallyAssignmentCompatibleWithItself_DemonstratedBy1000IterationsOfCopyingARandomRangeOfMultipleElementsFromOneInstanceToAnotherWhereEachElementHasARandomNonDefaultValueOfT;
begin
  var Expected: ArrayOf<TypeUnderTest> := [];
  for var Counter: NaturalNumber := 1 to 1000 do
  begin
    var RandomElementCount: NaturalNumber := (Random(3) + 3);
    System.Assert((6 >= RandomElementCount) and (RandomElementCount >= 3));
    Expected := Rando_TheUntrustworthy.DistinctNonDefaultValues<TypeUnderTest>(RandomElementCount);
    System.Assert(System.Length(Expected) >= 3, 'At least 3 random non-default T values are needed');
    System.Assert(System.Length(Expected) = System.Length(DataStream.UniqueElements<TypeUnderTest>(Expected)));
    for var EachExpected: TypeUnderTest in Expected do
      System.Assert(not (System.Default(TypeUnderTest) = EachExpected));
    var Actual: ArrayOf<TypeUnderTest> := [];
    System.Assert(not (System.Length(Expected) = System.Length(Actual)));
    Actual := Expected;
    System.Assert(System.Length(Expected) = System.Length(Actual));
    for var I: NaturalNumber := System.Low(Expected) to System.High(Expected) do
      System.Assert(Expected[I] = Actual[I]);
  end;
end;

{ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.Defaults}
class procedure ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.Defaults.Exercise;
begin
  IsInitializedToAnEmptyCollectionOfElements();
end;

class procedure ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.Defaults.IsInitializedToAnEmptyCollectionOfElements;
begin
  var Actual: ArrayOf<TypeUnderTest> := System.Default(ArrayOf<TypeUnderTest>);
  System.Assert(0 = System.Length(Actual));
end;

{ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.TypeIdentity}
class procedure ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.TypeIdentity.Exercise;
begin
  SharesTypeIdentityWithTArray();
end;

class procedure ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.TypeIdentity.SharesTypeIdentityWithTArray();
begin
  TypeEquivalenceInquiry<ArrayOf<TypeUnderTest>>.SharesTypeIdentityWith<TArray<TypeUnderTest>>();
end;
{$ENDREGION}

end.
