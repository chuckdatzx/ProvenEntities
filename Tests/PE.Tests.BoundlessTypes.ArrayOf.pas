unit PE.Tests.BoundlessTypes.ArrayOf;
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

uses
  PE.Actors.Rando,  //In the interface section for inlining
  PE.Delphi.TypeIdentity,
  PE.Routines,  //In the interface section for inlining
  PE.Types,  //In the interface section for inlining
  {Delphi}
  System.RTTI;  //Included here for inlining

{$IF (not PE.Delphi.TypeIdentity.DelphiTypeIdentityEstablishedAtCompileTime)}
   {$MESSAGE FATAL 'Unable to continue without compile-time assertions established.'}
{$ENDIF}

{
Assumption: It will never be possible to perform type complete testing against the ArrayOf<T> because its own existince includes the property of boundlessness (in, and only in, the following forms)
  - The definition of ArrayOf<T> includes the property of boundlessness with respect to T (if T is boundless then ArrayOf<T> must also be boundless; the converse is also True)
  - The definition of ArrayOf<T> includes the property of boundlessness with respect to its own size





Assumption: It is possible to value complete test ArrayOf<T>, where T is bounded, for assignment compatibility
Assumption: Any "type complete testing" of ArrayOf<T> can only be accomplished when T is bounded

It is possible to value complete test ArrayOf<T>, where T is bounded, for assignment compatibility and value preservation

How does one "perform type complete testing" against ArrayOf<T>?

- Assignment Compatiblity: Show that for every possible value of T, ArrayOf<T> holds and preserves a value of T

}


type
  {$REGION 'ArrayOf<T> type'}
  {
  Domain Notes:
    Assumption: It will never be possible to perform type complete testing the ArrayOf<T> (since the definition of ArrayOf<T> includes the property of boundlessness)
    Assumption: It will never be possible to perform value complete testing ArrayOf<T> for all T (since T could be boundless)
    Assumption: It is possible to value complete test ArrayOf<T>, where T is bounded, for type-level properties (e.g. assignment compatibility/value preservation)

  Theory: If the above assumptions are all True, then it seems that the best we can do is as follows:
    - Regarding the type dimension, I don't currently have any sort of criteria I can argue is "solid" framing. For now, I'll have to settle with consistency of framing across types using the following:
      - "Flexing" the size of ArrayOf<T> by performing any value complete testing towards the higher end of what is allowed by computational context <X> (i.e. take as much memory as "safely" allowed)
    - Regarding the value dimension, it is possible to prove out that the ArrayOf<T>, where T is bounded, preserves values for all of T. However, how this is done seems "complicated".


  Potential Coverage Options:
    - All values of T instantiated and contiguously assigned to a single ArrayOf<T>



  Theory being applied to assignment compatibility:
    - Let's figure out some intuivite categories for framing
      - Let's take the type-level problem we're having, array size, and frame it in the following 3 categores: 1)No elements (empty), 2) Single element, 3)Multiple elements (at least 3)
        - We clearly aren't going to be covering all cases, but the above categories inform us to the common type-relative situations we are handling (so we can reshape existing or add more as needed)
    - On the value front, let's split the values we'll be dealing with into the following 2 categories: 1) Default value, 2) Non-default values
      - Splitting the value domain into these 2 categories allows us to always handle the default value situation, while giving us some flexibility regarding how we handle the non-default category ('cause some domains are really big)
      - For a small enough value domain of T, we can quite easily provide value-complete solutions for the type categories above
        - Need to keep in mind that as the domain of T increases, it may increase exponentially
    - So sure, we don't have a full proof (since that doesn't even seem possible). But, what we do have is known categorical slices, where each categorial slice can be (at least in theory) value complete.
  }
  ExecutableSpecification_ArrayOf_Complete<TypeUnderTest: record> = record
  strict private class var Default_ArrayOfTypeUnderTest: ArrayOf<TypeUnderTest>;
  strict private class var Default_TypeUnderTest: TypeUnderTest;
  public type
    AssignmentOperator = record
    strict private {No Elements}
      class procedure IsSymmetricallyAssignmentCompatibleWithItselfWhenNoElementsArePresent(); static; inline;
    strict private {Single Elements (Default)}
      class procedure IsSymmetricallyAssignmentCompatibleWithItselfWhenOnly1DefaultElementIsPresent(); static; inline;
    strict private {Multiple Elements (Default) :: This seems like a good boundary to test, but at the same time it also seems rather silly to run this test and still run the single element default version as well}
      class procedure IsSymmetricallyAssignmentCompatibleWithItselfWhenSeveralDefaultElementsArePresent(); static; inline;
    strict private {Single Elements (Non Default) :: Beyond this place, there may be dragons}
      class procedure IsSymmetricallyAssignmentCompatibleWithItselfWhenOnly1NonDefaultElementIsPresent_ForAllNonDefaultValuesOfT(); static; inline;  //This routine has the potential to run nearly indefinitely
    strict private {Multiple Elements (Non Default) :: Beyond this place, there may likely be dragons}
      class procedure IsSymmetricallyAssignmentCompatibleWithItselfWhenSeveralIdenticalNonDefaultElementsArePresent_ForAllNonDefaultValuesOfT(); static; inline;  //This routine has the potential to run nearly indefinitely
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
    class constructor Create();
  public
    class procedure TheDefaultValueIsAnEmptyCollectionOfElementsOfTypeUnderTest(); static; inline;
  public
    class procedure Exercise(); static; inline;
  end;
  {$ENDREGION}

implementation

{$REGION 'ArrayOf<T> type'}
{ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>}
class constructor ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.Create;
begin
  Default_TypeUnderTest := System.Default(TypeUnderTest);
  System.Assert(System.Default(TypeUnderTest) = Default_TypeUnderTest);
  Default_ArrayOfTypeUnderTest := System.Default(ArrayOf<TypeUnderTest>);
  System.Assert(System.Default(ArrayOf<TypeUnderTest>) = Default_ArrayOfTypeUnderTest);
end;

class procedure ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.Exercise;
begin
  AssignmentOperator.Exercise();
  TheDefaultValueIsAnEmptyCollectionOfElementsOfTypeUnderTest();
  TypeIdentity.Exercise();
end;

class procedure ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.TheDefaultValueIsAnEmptyCollectionOfElementsOfTypeUnderTest;
begin
  var Actual: ArrayOf<TypeUnderTest> := System.Default(ArrayOf<TypeUnderTest>);
  System.Assert(Default_ArrayOfTypeUnderTest = Actual);
  System.Assert(0 = System.Length(Actual));
end;

{ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.AssignmentOperator}
class procedure ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.AssignmentOperator.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithItselfWhenNoElementsArePresent();
  IsSymmetricallyAssignmentCompatibleWithItselfWhenOnly1DefaultElementIsPresent();
  IsSymmetricallyAssignmentCompatibleWithItselfWhenOnly1NonDefaultElementIsPresent_ForAllNonDefaultValuesOfT();
  IsSymmetricallyAssignmentCompatibleWithItselfWhenSeveralDefaultElementsArePresent();
  IsSymmetricallyAssignmentCompatibleWithItselfWhenSeveralIdenticalNonDefaultElementsArePresent_ForAllNonDefaultValuesOfT();
end;

class procedure ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.AssignmentOperator.IsSymmetricallyAssignmentCompatibleWithItselfWhenOnly1NonDefaultElementIsPresent_ForAllNonDefaultValuesOfT();
begin
  if (NaturalNumber.TypeIdentity = System.TypeInfo(TypeUnderTest))then
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
    var OrdinalValidationAndProvider: TValue := TValue.From<TypeUnderTest>(Default_TypeUnderTest);
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
      System.Assert(not (Expected = Default_ArrayOfTypeUnderTest));
      System.Assert(1 = System.Length(Expected));
      var Actual: ArrayOf<TypeUnderTest> := Default_ArrayOfTypeUnderTest;
      System.Assert(System.Default(ArrayOf<TypeUnderTest>) = Actual);
      Actual := Expected;
      System.Assert(not (System.Default(ArrayOf<TypeUnderTest>) = Actual));
      System.Assert(1 = System.Length(Actual));
      System.Assert(ExpectedValue = Actual[System.Low(Actual)]);
    end;
  end;
end;

class procedure ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.AssignmentOperator.IsSymmetricallyAssignmentCompatibleWithItselfWhenOnly1DefaultElementIsPresent;
begin
  var Expected: ArrayOf<TypeUnderTest> := [Default_TypeUnderTest];
  System.Assert(1 = System.Length(Expected));
  System.Assert(Default_TypeUnderTest = Expected[System.Low(Expected)]);
  var Actual: ArrayOf<TypeUnderTest> := [];
  System.Assert(not (System.Length(Expected) = System.Length(Actual)));
  Actual := Expected;
  Expected := Actual;
  System.Assert(System.Length(Expected) = System.Length(Actual));
  System.Assert(1 = System.Length(Expected));
  System.Assert(Default_TypeUnderTest = Expected[System.Low(Expected)]);
  System.Assert(Default_TypeUnderTest = Actual[System.Low(Actual)]);
end;

class procedure ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.AssignmentOperator.IsSymmetricallyAssignmentCompatibleWithItselfWhenSeveralDefaultElementsArePresent;
begin
  var Expected: ArrayOf<TypeUnderTest> := [Default_TypeUnderTest, Default_TypeUnderTest, Default_TypeUnderTest];
  System.Assert(3 = System.Length(Expected));
  System.Assert(Default_TypeUnderTest = Expected[System.Low(Expected)]);
  System.Assert(Default_TypeUnderTest = Expected[System.Low(Expected) + 1]);
  System.Assert(Default_TypeUnderTest = Expected[System.Low(Expected) + 2]);
  var Actual: ArrayOf<TypeUnderTest> := [];
  System.Assert(not (System.Length(Expected) = System.Length(Actual)));
  Actual := Expected;
  Expected := Actual;
  System.Assert(System.Length(Expected) = System.Length(Actual));
  System.Assert(3 = System.Length(Expected));
  System.Assert(Default_TypeUnderTest = Expected[System.Low(Expected)]);
  System.Assert(Default_TypeUnderTest = Expected[System.Low(Expected) + 1]);
  System.Assert(Default_TypeUnderTest = Expected[System.Low(Expected) + 2]);
  System.Assert(Default_TypeUnderTest = Actual[System.Low(Actual)]);
  System.Assert(Default_TypeUnderTest = Actual[System.Low(Actual) + 1]);
  System.Assert(Default_TypeUnderTest = Actual[System.Low(Actual) + 2]);
end;

class procedure ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.AssignmentOperator.IsSymmetricallyAssignmentCompatibleWithItselfWhenSeveralIdenticalNonDefaultElementsArePresent_ForAllNonDefaultValuesOfT;
begin
  if (Digit.TypeIdentity = System.TypeInfo(TypeUnderTest)) then
  begin
    for var Counter: Digit := Digit.Min to Digit.Max do
    begin
      var ExpectedValue: Digit;
      ExpectedValue := Counter;
      var Expected: ArrayOf<Digit> := [ExpectedValue, ExpectedValue, ExpectedValue];
      System.Assert(not (Expected = System.Default(ArrayOf<Digit>)));
      System.Assert(3 = System.Length(Expected));
      System.Assert(ExpectedValue = Expected[System.Low(Expected)]);
      System.Assert(ExpectedValue = Expected[System.Low(Expected) + 1]);
      System.Assert(ExpectedValue = Expected[System.Low(Expected) + 2]);
      var Actual: ArrayOf<Digit> := System.Default(ArrayOf<Digit>);
      System.Assert(System.Default(ArrayOf<Digit>) = Actual);
      System.Assert(not (System.Length(Expected) = System.Length(Actual)));
      Actual := Expected;
      System.Assert(System.Length(Expected) = System.Length(Actual));
      System.Assert(3 = System.Length(Expected));
      System.Assert(ExpectedValue = Expected[System.Low(Expected)]);
      System.Assert(ExpectedValue = Expected[System.Low(Expected) + 1]);
      System.Assert(ExpectedValue = Expected[System.Low(Expected) + 2]);
      System.Assert(ExpectedValue = Actual[System.Low(Actual)]);
      System.Assert(ExpectedValue = Actual[System.Low(Actual) + 1]);
      System.Assert(ExpectedValue = Actual[System.Low(Actual) + 2]);
    end;
  end
  else
    if (MonoChar.TypeIdentity = System.TypeInfo(TypeUnderTest)) then
    begin
      for var Counter: MonoChar := MonoChar.Min to MonoChar.Max do
      begin
        var ExpectedValue: MonoChar;
        ExpectedValue := Counter;
        var Expected: ArrayOf<MonoChar> := [ExpectedValue, ExpectedValue, ExpectedValue];
        System.Assert(not (Expected = System.Default(ArrayOf<MonoChar>)));
        System.Assert(3 = System.Length(Expected));
        System.Assert(ExpectedValue = Expected[System.Low(Expected)]);
        System.Assert(ExpectedValue = Expected[System.Low(Expected) + 1]);
        System.Assert(ExpectedValue = Expected[System.Low(Expected) + 2]);
        var Actual: ArrayOf<MonoChar> := System.Default(ArrayOf<MonoChar>);
        System.Assert(System.Default(ArrayOf<MonoChar>) = Actual);
        System.Assert(not (System.Length(Expected) = System.Length(Actual)));
        Actual := Expected;
        System.Assert(System.Length(Expected) = System.Length(Actual));
        System.Assert(3 = System.Length(Expected));
        System.Assert(ExpectedValue = Expected[System.Low(Expected)]);
        System.Assert(ExpectedValue = Expected[System.Low(Expected) + 1]);
        System.Assert(ExpectedValue = Expected[System.Low(Expected) + 2]);
        System.Assert(ExpectedValue = Actual[System.Low(Actual)]);
        System.Assert(ExpectedValue = Actual[System.Low(Actual) + 1]);
        System.Assert(ExpectedValue = Actual[System.Low(Actual) + 2]);
      end;
    end
    else
      if (NaturalNumber.TypeIdentity = System.TypeInfo(TypeUnderTest))then
      begin
        for var Counter: NaturalNumber := NaturalNumber.Min to NaturalNumber.Max do
        begin
          var ExpectedValue: NaturalNumber;
          ExpectedValue := Counter;
          var Expected: ArrayOf<NaturalNumber> := [ExpectedValue, ExpectedValue, ExpectedValue];
          System.Assert(not (Expected = System.Default(ArrayOf<NaturalNumber>)));
          System.Assert(3 = System.Length(Expected));
          System.Assert(ExpectedValue = Expected[System.Low(Expected)]);
          System.Assert(ExpectedValue = Expected[System.Low(Expected) + 1]);
          System.Assert(ExpectedValue = Expected[System.Low(Expected) + 2]);
          var Actual: ArrayOf<NaturalNumber> := System.Default(ArrayOf<NaturalNumber>);
          System.Assert(System.Default(ArrayOf<NaturalNumber>) = Actual);
          System.Assert(not (System.Length(Expected) = System.Length(Actual)));
          Actual := Expected;
          System.Assert(System.Length(Expected) = System.Length(Actual));
          System.Assert(3 = System.Length(Expected));
          System.Assert(ExpectedValue = Expected[System.Low(Expected)]);
          System.Assert(ExpectedValue = Expected[System.Low(Expected) + 1]);
          System.Assert(ExpectedValue = Expected[System.Low(Expected) + 2]);
          System.Assert(ExpectedValue = Actual[System.Low(Actual)]);
          System.Assert(ExpectedValue = Actual[System.Low(Actual) + 1]);
          System.Assert(ExpectedValue = Actual[System.Low(Actual) + 2]);
        end;
      end
      else
        System.Assert(False, 'Routine not ready for other types');
end;

class procedure ExecutableSpecification_ArrayOf_Complete<TypeUnderTest>.AssignmentOperator.IsSymmetricallyAssignmentCompatibleWithItselfWhenNoElementsArePresent;
begin
  var Expected: ArrayOf<TypeUnderTest> := Default_ArrayOfTypeUnderTest;
  System.Assert(System.Default(ArrayOf<TypeUnderTest>) = Expected);
  var Actual: ArrayOf<TypeUnderTest> := [Default_TypeUnderTest];
  System.Assert(not (Expected = Actual));
  Actual := Expected;
  Expected := Actual;
  System.Assert(Default_ArrayOfTypeUnderTest = Expected);
  System.Assert(Default_ArrayOfTypeUnderTest = Actual);
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
