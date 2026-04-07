unit PE.TypeTests.Types;
{Chuck C.T.
 The type names and what said types represent may not match what you currently think of as intuition;
 especially if you started from a Pascal/Object Pascal/Delphi background like I did.
}

interface

uses
  {PE}
  PE.Delphi.Rando;

type
  AllTests = record
  public
    class procedure Exercise(); static; inline;
  end;

type
  ///<summary>Delphi specific entity for establishing facts about TypeUnderTest</summary>
  ///<notes>This should probably be moved to "higher ground" (a Delphi-specific namespace)</notes>
  TypeEquivalenceInquiry<TypeUnderTest> = record
  public
    class procedure DoesNotShareTypeIdentityWith<ThisGuy>(); static; inline;
    class procedure HasANonNullSystemDotTypeInfoValue(); static; inline;
    class procedure SharesTypeIdentityWith<ThisGuy>(); static; inline;
  end;

type
  ArrayOf_TypeTests<TypeUnderTest> = record
  public {Domain Tests :: w/respect to intent}
    class procedure IsInitializedToAnEmptyCollectionOfElements(); static; inline;
  public {Language Tests :: Delphi :: TArray<T>}
    class procedure HasANonNullSystemDotTypeInfoValue(); static; inline;
    class procedure IsNotTypeIdenticalWithTArray(); static; inline;
    class procedure IsSymmetricallyAssignmentCompatibleWithTArrayOfT(); static; inline;
  public {Wrapper}
    class procedure Exercise(); static; inline;
  end;

  ArrayOfHelperTests = record
  public type
    UniqueElements = record
    public type
      ResultOrder_UsingNaturalNumber = record
      strict private
        class procedure ReturnsElementsInAscendingOrderWhenGivenElementsInAscendingOrder(); static; inline;
        class procedure ReturnsElementsInDescendingOrderWhenGivenElementsInDescendingOrder(); static; inline;
        class procedure ReturnsElementsInMixedOrderWhenGivenElementsInMixedOrder(); static; inline;
      public
        class procedure Exercise(); static; inline;
      end;
    end;
  public
    class procedure Exercise(); static; inline;
  end;

  ArrayOfHelperTestsG = record
  public type
    ///<summary>Just a type container</summary>
    UniqueElements<TypeUnderTest> = record
      public type
        ///<summary>Locking down the routine's structure in domain terms</summary>
        RoutineStructure = record
        strict private
          class procedure TheOnlyParameterAcceptsAnEmptyArrayOfT(); static; inline;
          class procedure ReturnsAnEmptyArrayOfT(); static; inline;
        public
          class procedure Exercise(); static; inline;
        end;
        RepeatedElementsAreFilteredOut = record
        strict private
          class procedure Returns1DefaultElementWhenGiven1DefaultElement(); static; inline;
          class procedure Returns1DefaultElementWhenGiven3DefaultElements(); static; inline;
          class procedure Returns1NonDefaultElementWhenGiven1NonDefaultElement(); static; inline;
          class procedure Returns1NonDefaultElementWhenGiven3OfTheSameNonDefaultElements(); static; inline;
          class procedure Returns3UniqueNonDefaultElementsWhenGivenTheSame3UniqueNonDefaultElements(); static; inline;
          class procedure Returns3UniqueNonDefaultElementsAnd1DefaultElementWhenGivenTheSame3UniqueNonDefaultElementsAmongstNonDefaultElements(); static; inline;
        public
          class procedure Exercise(); static; inline;
        end;
    public
      class procedure Exercise(); static; inline;
    end;
  end;

type
  NaturalNumber_TypeTests = record
  strict private class var Expected: Cardinal;
  public {Domain Tests :: w/respect to intent}
    class procedure TheLowestPossibleValueIsZero(); static; inline;
    class procedure TheHighestPossibleNumberIs4294967295(); static; inline; //4,294,967,295
  public {Language Tests :: Delphi}
    class procedure IsNotTypeIdenticalToCardinal(); static; inline;
    class procedure IsSymmetricallyAssignmentCompatibleWithCardinal(); static; inline;
  public {Wrapper}
    class procedure Exercise(); static; inline;
  end;

  NaturalNumber32_TypeTests = record
  strict private class var Expected: Cardinal;
  public {Domain :: w/respect to intent}
    class procedure TheLowestPossibleValueIsZero(); static; inline;
    class procedure TheHighestPossibleNumberIs4294967295(); static; inline; //4,294,967,295
  public {Language Tests :: Delphi}
    class procedure IsSymmetricallyAssignmentCompatibleWithCardinal(); static; inline;
    class procedure IsTypeIdenticalToNaturalNumber(); static; inline;
  public {Wrapper}
    class procedure Exercise(); static; inline;
  end;

  NaturalNumber64_TypeTests = record
  strict private class var Expected: UInt64;
  public {Domain :: w/respect to intent}
    class procedure TheLowestPossibleValueIsZero(); static; inline;
    class procedure TheHighestPossibleNumberIs18446744073709551615(); static; inline; //Approximately 18.45 quintillion
  public {Language Tests :: Delphi}
    class procedure IsNotTypeIdenticalToUInt64(); static; inline;
    class procedure IsSymmetricallyAssignmentCompatibleWithUInt64(); static; inline;
  public {Wrapper}
    class procedure Exercise(); static; inline;
  end;

  SmartClaw_TypeTests<T> = record
  strict private class function Expected(const AValue: T): Boolean; static; inline;
  public {Domain Tests :: Capabilites}
    class procedure ReturnsTrueWhenOnlyComprisedOfCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT(); static; inline;
  public {Language Tests :: Delphi :: Capabilites}
    class procedure IsLeftAssigmentCompatibleWithAnAnonymousMethodComprisedOfAFunctionWithASingleImmutableValueOfTAndReturningABooleanType(); static; inline;
    class procedure IsLeftAssigmentCompatibleWithAProceduralMethodComprisedOfTheExpectedRoutinePresentlyLivingInThisTestCollection(); static; inline;
  public {Test Wrapper}
    class procedure Exercise(); static; inline;
  end;

implementation

uses
  {PE}
  PE.ImplicitlyTrusted.Delphi.TypeIdentity.Proven.AtCompileTime,
  PE.Types;

{ Exercise }

class procedure AllTests.Exercise();
begin
  {1st Gen. Types by 1st Gen. Types}
  NaturalNumber_TypeTests.Exercise();
  NaturalNumber32_TypeTests.Exercise();
  NaturalNumber64_TypeTests.Exercise();
  ArrayOf_TypeTests<NaturalNumber>.Exercise();
  ArrayOf_TypeTests<NaturalNumber32>.Exercise();
  ArrayOf_TypeTests<NaturalNumber64>.Exercise();
  {Helpers for helped types}
  ArrayOfHelperTests.Exercise();
  ArrayOfHelperTestsG.UniqueElements<NaturalNumber>.Exercise();
//  ArrayOfHelperTestsG<NaturalNumber32>.Exercise();
//  ArrayOfHelperTestsG<NaturalNumber64>.Exercise();
  {2nd Gen. Types by 1st Gen. Types}
  SmartClaw_TypeTests<NaturalNumber>.Exercise();
  SmartClaw_TypeTests<NaturalNumber32>.Exercise();
  //SmartClaw_TypeTests<NaturalNumber64>.Exercise();
  { TODO -oChuck -c?sForThoseSeeingInsideTheCompiler :
Uncommenting the above reproducably causes a "F2084 Internal Error: 2252". I have my theories,
but none of those matter. The important part is that the SmartClaw<T> cannot be proven to handle
the NaturalNumber64 type. So, for the time being, anyone using SmartClaw<T> where SmartClaw<NaturalNumber64> is hoping that the code works.
For those of you reading this note, as long as 4.2 billion is a big enough natural number for you, just use SmartClaw<NaturalNumber> until I figure this out.}
end;

class procedure NaturalNumber_TypeTests.Exercise;
begin
  Expected := 0;
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs4294967295();
  IsNotTypeIdenticalToCardinal();
  IsSymmetricallyAssignmentCompatibleWithCardinal();
end;

class procedure NaturalNumber_TypeTests.IsNotTypeIdenticalToCardinal;
begin
  TypeEquivalenceInquiry<NaturalNumber>.DoesNotShareTypeIdentityWith<Cardinal>();
end;

class procedure NaturalNumber_TypeTests.IsSymmetricallyAssignmentCompatibleWithCardinal();
begin
  var Actual: NaturalNumber := Expected;
  Expected := Actual;
end;

{ NaturalNumber_TypeTests<TypeUnderTest> }

class procedure NaturalNumber_TypeTests.TheHighestPossibleNumberIs4294967295;
begin
  System.Assert(4294967295 = System.High(NaturalNumber));
end;

class procedure NaturalNumber_TypeTests.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber));
end;

{ TypeEquivalenceInquiry<TypeUnderTest> }

class procedure TypeEquivalenceInquiry<TypeUnderTest>.DoesNotShareTypeIdentityWith<ThisGuy>;
begin  //Of course assuming that TypeUnderTest <> ThisGuy
  System.Assert(SystemDotTypeInfoProducesNonNullTypeInfoAtCompileTime);
  System.Assert(not (System.TypeInfo(TypeUnderTest) = System.TypeInfo(ThisGuy)));
end;

class procedure TypeEquivalenceInquiry<TypeUnderTest>.HasANonNullSystemDotTypeInfoValue;
begin
  System.Assert(SystemDotTypeInfoProducesNonNullTypeInfoAtCompileTime);
  System.Assert(System.Assigned(System.TypeInfo(TypeUnderTest)));
end;

class procedure TypeEquivalenceInquiry<TypeUnderTest>.SharesTypeIdentityWith<ThisGuy>;
begin
  System.Assert(System.TypeInfo(TypeUnderTest) = System.TypeInfo(ThisGuy));
end;

{ NaturalNumber32_TypeTests }

class procedure NaturalNumber32_TypeTests.Exercise;
begin
  Expected := 0;
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs4294967295();
  IsSymmetricallyAssignmentCompatibleWithCardinal();
  IsTypeIdenticalToNaturalNumber();
end;

class procedure NaturalNumber32_TypeTests.IsSymmetricallyAssignmentCompatibleWithCardinal;
begin
  var Actual: NaturalNumber32 := Expected;
  Expected := Actual;
end;

class procedure NaturalNumber32_TypeTests.IsTypeIdenticalToNaturalNumber;
begin
  TypeEquivalenceInquiry<NaturalNumber32>.SharesTypeIdentityWith<NaturalNumber>();
end;

class procedure NaturalNumber32_TypeTests.TheHighestPossibleNumberIs4294967295;
begin
  System.Assert(4294967295 = System.High(NaturalNumber32));
end;

class procedure NaturalNumber32_TypeTests.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber32));
end;

{ NaturalNumber64_TypeTests }

class procedure NaturalNumber64_TypeTests.Exercise;
begin
  Expected := 0;
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs18446744073709551615();
  IsNotTypeIdenticalToUInt64();
  IsSymmetricallyAssignmentCompatibleWithUInt64();
end;

class procedure NaturalNumber64_TypeTests.IsNotTypeIdenticalToUInt64();
begin
  TypeEquivalenceInquiry<NaturalNumber64>.DoesNotShareTypeIdentityWith<UInt64>();
end;

class procedure NaturalNumber64_TypeTests.IsSymmetricallyAssignmentCompatibleWithUInt64;
begin
  var Actual: NaturalNumber64 := Expected;
  Expected := Actual;
end;

class procedure NaturalNumber64_TypeTests.TheHighestPossibleNumberIs18446744073709551615;
begin
  System.Assert(18446744073709551615 = System.High(NaturalNumber64));
end;

class procedure NaturalNumber64_TypeTests.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber64));
end;

{ SmartClaw_TypeTests<T> }

class procedure SmartClaw_TypeTests<T>.Exercise;
begin
  ReturnsTrueWhenOnlyComprisedOfCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT();
  IsLeftAssigmentCompatibleWithAnAnonymousMethodComprisedOfAFunctionWithASingleImmutableValueOfTAndReturningABooleanType();
  IsLeftAssigmentCompatibleWithAProceduralMethodComprisedOfTheExpectedRoutinePresentlyLivingInThisTestCollection();
end;

class function SmartClaw_TypeTests<T>.Expected(const AValue: T): Boolean;
begin Result := False end;

class procedure SmartClaw_TypeTests<T>.IsLeftAssigmentCompatibleWithAnAnonymousMethodComprisedOfAFunctionWithASingleImmutableValueOfTAndReturningABooleanType;
begin
  var Actual: SmartClaw<T> := function (const AValue: T): Boolean begin Result := False end;
end;

class procedure SmartClaw_TypeTests<T>.IsLeftAssigmentCompatibleWithAProceduralMethodComprisedOfTheExpectedRoutinePresentlyLivingInThisTestCollection;
begin
  Assert(not (Expected(System.Default(T))));
  var Actual:SmartClaw<T> := Expected;
end;

class procedure SmartClaw_TypeTests<T>.ReturnsTrueWhenOnlyComprisedOfCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT;
begin
  var Actual: SmartClaw<T> := function (const AValue: T): Boolean begin Result := (AValue = System.Default(T)) end;
  System.Assert(Actual(System.Default(T)));
end;

{ ArrayOf_TypeTests<TypeUnderTest> }

class procedure ArrayOf_TypeTests<TypeUnderTest>.Exercise;
begin
  HasANonNullSystemDotTypeInfoValue();
  IsInitializedToAnEmptyCollectionOfElements();
  IsNotTypeIdenticalWithTArray();
  IsSymmetricallyAssignmentCompatibleWithTArrayOfT();
end;

class procedure ArrayOf_TypeTests<TypeUnderTest>.HasANonNullSystemDotTypeInfoValue;
begin
  TypeEquivalenceInquiry<TypeUnderTest>.HasANonNullSystemDotTypeInfoValue();
end;

class procedure ArrayOf_TypeTests<TypeUnderTest>.IsInitializedToAnEmptyCollectionOfElements;
begin
{ TODO -oChuck -cMusing : Currently using TArray as a backing for this; not sure what else I actually could use (well, in attempting to make everything happen at compile-time).}
  System.Assert(TArray<TypeUnderTest>.Create() = System.Default(ArrayOf<TypeUnderTest>));
end;

class procedure ArrayOf_TypeTests<TypeUnderTest>.IsNotTypeIdenticalWithTArray;
begin
  TypeEquivalenceInquiry<TypeUnderTest>.DoesNotShareTypeIdentityWith<TArray<TypeUnderTest>>();
end;

class procedure ArrayOf_TypeTests<TypeUnderTest>.IsSymmetricallyAssignmentCompatibleWithTArrayOfT;
begin
  var Expected: TArray<TypeUnderTest>;
  var Actual: ArrayOf<TypeUnderTest> := Expected;
  Expected := Actual;
end;

{ ArrayOfHelperTests<TypeUnderTest>.UniqueElements_RoutineStructure_Tests }

class procedure ArrayOfHelperTestsG.UniqueElements<TypeUnderTest>.RoutineStructure.Exercise;
begin
  RoutineStructure.TheOnlyParameterAcceptsAnEmptyArrayOfT();
  RoutineStructure.ReturnsAnEmptyArrayOfT();
end;

class procedure ArrayOfHelperTestsG.UniqueElements<TypeUnderTest>.RoutineStructure.ReturnsAnEmptyArrayOfT;
begin
  var Expected: ArrayOf<TypeUnderTest>;
  ArrayOf.UniqueElements<TypeUnderTest>(Expected);
end;

class procedure ArrayOfHelperTestsG.UniqueElements<TypeUnderTest>.RoutineStructure.TheOnlyParameterAcceptsAnEmptyArrayOfT;
begin
  var Dummy: ArrayOf<TypeUnderTest>; var Expected: ArrayOf<TypeUnderTest>;
  Expected := ArrayOf.UniqueElements<TypeUnderTest>(Dummy);
  System.Assert(0 = System.Length(Expected));
end;

{ ArrayOfHelperTests<TypeUnderTest> }

class procedure ArrayOfHelperTestsG.UniqueElements<TypeUnderTest>.Exercise;
begin
  RoutineStructure.Exercise();
  RepeatedElementsAreFilteredOut.Exercise();
end;

{ ArrayOfHelperTests.UniqueElements.ResultOrder }

class procedure ArrayOfHelperTests.UniqueElements.ResultOrder_UsingNaturalNumber.Exercise;
begin
  ReturnsElementsInAscendingOrderWhenGivenElementsInAscendingOrder();
  ReturnsElementsInDescendingOrderWhenGivenElementsInDescendingOrder();
  ReturnsElementsInMixedOrderWhenGivenElementsInMixedOrder();
end;

class procedure ArrayOfHelperTests.UniqueElements.ResultOrder_UsingNaturalNumber.ReturnsElementsInAscendingOrderWhenGivenElementsInAscendingOrder;
begin
  var Actual: ArrayOf<NaturalNumber> := ArrayOf.UniqueElements<NaturalNumber>([5,10,35,55]);
  System.Assert(4 = System.Length(Actual));
  System.Assert(5 = Actual[System.Low(Actual)]);
  System.Assert(10 = Actual[System.Low(Actual) + 1]);
  System.Assert(35 = Actual[System.Low(Actual) + 2]);
  System.Assert(55 = Actual[System.Low(Actual) + 3]);
end;

class procedure ArrayOfHelperTests.UniqueElements.ResultOrder_UsingNaturalNumber.ReturnsElementsInDescendingOrderWhenGivenElementsInDescendingOrder;
begin
  var Actual: ArrayOf<NaturalNumber> := ArrayOf.UniqueElements<NaturalNumber>([101,42,13]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(101 = Actual[System.Low(Actual)]);
  System.Assert(42 = Actual[System.Low(Actual) + 1]);
  System.Assert(13 = Actual[System.Low(Actual) + 2]);
end;

class procedure ArrayOfHelperTests.UniqueElements.ResultOrder_UsingNaturalNumber.ReturnsElementsInMixedOrderWhenGivenElementsInMixedOrder;
begin
  var Actual: ArrayOf<NaturalNumber> := ArrayOf.UniqueElements<NaturalNumber>([123,350,77]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(123 = Actual[System.Low(Actual)]);
  System.Assert(350 = Actual[System.Low(Actual) + 1]);
  System.Assert(77 = Actual[System.Low(Actual) + 2]);
end;

{ ArrayOfHelperTests }

class procedure ArrayOfHelperTests.Exercise;
begin
  UniqueElements.ResultOrder_UsingNaturalNumber.Exercise();
end;

{ ArrayOfHelperTests<TypeUnderTest>.UniqueElements.RepeatedElementsAreFilteredOut }

class procedure ArrayOfHelperTestsG.UniqueElements<TypeUnderTest>.RepeatedElementsAreFilteredOut.Exercise;
begin
  Returns1DefaultElementWhenGiven1DefaultElement();
  Returns1DefaultElementWhenGiven3DefaultElements();
  Returns1NonDefaultElementWhenGiven1NonDefaultElement();
  Returns1NonDefaultElementWhenGiven3OfTheSameNonDefaultElements();
  Returns3UniqueNonDefaultElementsWhenGivenTheSame3UniqueNonDefaultElements();
  Returns3UniqueNonDefaultElementsAnd1DefaultElementWhenGivenTheSame3UniqueNonDefaultElementsAmongstNonDefaultElements();
end;

class procedure ArrayOfHelperTestsG.UniqueElements<TypeUnderTest>.RepeatedElementsAreFilteredOut.Returns1DefaultElementWhenGiven1DefaultElement;
begin
  var Actual: ArrayOf<TypeUnderTest> := ArrayOf.UniqueElements<TypeUnderTest>([System.Default(TypeUndertest)]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(TypeUnderTest) = Actual[0]);
end;

class procedure ArrayOfHelperTestsG.UniqueElements<TypeUnderTest>.RepeatedElementsAreFilteredOut.Returns1DefaultElementWhenGiven3DefaultElements;
begin
  var Actual: ArrayOf<TypeUnderTest> := ArrayOf.UniqueElements<TypeUnderTest>([System.Default(TypeUndertest), System.Default(TypeUndertest), System.Default(TypeUndertest)]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(TypeUnderTest) = Actual[0]);
end;

class procedure ArrayOfHelperTestsG.UniqueElements<TypeUnderTest>.RepeatedElementsAreFilteredOut.Returns1NonDefaultElementWhenGiven1NonDefaultElement;
begin
  var Actual: ArrayOf<TypeUnderTest> := ArrayOf.UniqueElements<TypeUnderTest>([Rando.NonDefaultValue<TypeUndertest>()]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(TypeUnderTest) <> Actual[0]);
end;

class procedure ArrayOfHelperTestsG.UniqueElements<TypeUnderTest>.RepeatedElementsAreFilteredOut.Returns1NonDefaultElementWhenGiven3OfTheSameNonDefaultElements;
begin
  var DataElement: TypeUnderTest := Rando.NonDefaultValue<TypeUnderTest>();
  var Actual: ArrayOf<TypeUnderTest> := ArrayOf.UniqueElements<TypeUnderTest>([DataElement, DataElement, DataElement]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(TypeUnderTest) <> Actual[0]);
end;

class procedure ArrayOfHelperTestsG.UniqueElements<TypeUnderTest>.RepeatedElementsAreFilteredOut.Returns3UniqueNonDefaultElementsAnd1DefaultElementWhenGivenTheSame3UniqueNonDefaultElementsAmongstNonDefaultElements;
begin
  var Expected: ArrayOf<TypeUnderTest> := [System.Default(TypeUnderTest), Rando.NonDefaultValue<TypeUnderTest>(), Rando.NonDefaultValue<TypeUnderTest>(), Rando.NonDefaultValue<TypeUnderTest>()];
  System.Assert(4 = System.Length(Expected));
  System.Assert(Expected[System.Low(Expected)] <> Expected[System.Low(Expected) + 1]);
  System.Assert(Expected[System.Low(Expected)] <> Expected[System.Low(Expected) + 2]);
  System.Assert(Expected[System.Low(Expected)] <> Expected[System.Low(Expected) + 3]);
  System.Assert(Expected[System.Low(Expected) + 1] <> Expected[System.Low(Expected) + 2]);
  System.Assert(Expected[System.Low(Expected) + 1] <> Expected[System.Low(Expected) + 3]);
  System.Assert(Expected[System.Low(Expected) + 2] <> Expected[System.Low(Expected) + 3]);
  var Data: ArrayOf<TypeUnderTest> := [Expected[System.Low(Expected)], System.Default(TypeUnderTest), Expected[System.Low(Expected) + 1], System.Default(TypeUnderTest), Expected[System.Low(Expected) + 2], System.Default(TypeUnderTest), Expected[System.Low(Expected) + 3]];
  var Actual: ArrayOf<TypeUnderTest> := ArrayOf.UniqueElements<TypeUnderTest>( Expected);
  System.Assert(4 = System.Length(Actual));
  System.Assert(Expected[System.Low(Expected)] = Actual[System.Low(Actual)]);
  System.Assert(Expected[System.Low(Expected) + 1] = Actual[System.Low(Actual) + 1]);
  System.Assert(Expected[System.Low(Expected) + 2] = Actual[System.Low(Actual) + 2]);
  System.Assert(Expected[System.Low(Expected) + 3] = Actual[System.Low(Actual) + 3]);
end;

class procedure ArrayOfHelperTestsG.UniqueElements<TypeUnderTest>.RepeatedElementsAreFilteredOut.Returns3UniqueNonDefaultElementsWhenGivenTheSame3UniqueNonDefaultElements;
begin
  var Expected: ArrayOf<TypeUnderTest> := [Rando.NonDefaultValue<TypeUnderTest>(), Rando.NonDefaultValue<TypeUnderTest>(), Rando.NonDefaultValue<TypeUnderTest>()];
  System.Assert(3 = System.Length(Expected));
  System.Assert(Expected[System.Low(Expected)] <> Expected[System.Low(Expected) + 1]);
  System.Assert(Expected[System.Low(Expected)] <> Expected[System.Low(Expected) + 2]);
  System.Assert(Expected[System.Low(Expected) + 1] <> Expected[System.Low(Expected) + 2]);
  var Actual: ArrayOf<TypeUnderTest> := ArrayOf.UniqueElements<TypeUnderTest>(Expected);
  System.Assert(3 = System.Length(Actual));
  System.Assert(Expected[System.Low(Expected)] = Actual[System.Low(Actual)]);
  System.Assert(Expected[System.Low(Expected) + 1] = Actual[System.Low(Actual) + 1]);
  System.Assert(Expected[System.Low(Expected) + 2] = Actual[System.Low(Actual) + 2]);
end;

end.
