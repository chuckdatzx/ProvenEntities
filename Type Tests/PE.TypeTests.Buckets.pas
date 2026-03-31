unit PE.TypeTests.Buckets;
{Chuck C.T.
Full Declaration of Transparency:
You should only consider this code proven insofar as you agree with everything presented
(and by "everything presented", I mean from the scope of the compiler all the way through to
your custom code based on whatever I've presented here).}
interface

uses
  {Assertions}
  PE.TypeTests.Delphi.AssignmentCompatibility.GenericRecords.Proven.AtCompileTime,
  PE.TypeTests.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime,
  PE.TypeTests.Delphi.TypeIdentity.Proven.AtCompileTime,
  {PE}
  PE.DomainTests.Buckets,
  {Domain Under Test}
  PE.Buckets;

{$IF IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime and
 IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime}

{If ANY of the following is compiling, compile-time checks should have established the following are true:
  - Identically defined generic records are type identical according to System.TypeInfo() at compile-time
  - Identically defined generic records are symmetrically assignment compatible at compile-time

If said compile-time checks are True, and then considering the tests below,
I am claiming the all types and routines of the PE.Buckets.pas domain are proven for any compilable generic type T.
}

type
  SUT_TYPES<T> = record
  public type
    Actual = record
    type
      BucketIn_Closed = BucketIn<T>;
      E_BucketTally = BucketTally;
      GrabbyArmBrains_Closed = GrabbyArmBrains<T>;
      BucketNameType = string;
    end;
  public
    class var ActualBucketTally: Actual.E_BucketTally;
    class var ActualGrabbyArmBrains: Actual.GrabbyArmBrains_Closed;
    class var ActualBucketNameType: Actual.BucketNameType;
  public
    class var ExpectedBucketTally: Actual.E_BucketTally;
    class var ExpectedGrabbyArmBrains: Actual.GrabbyArmBrains_Closed;
    class var ExpectedBucketIn: BucketIn<T>;
    class var ExpectedBucketOut: BucketOut;
  public
    class var ExpectedCardinal: Cardinal;
  public
    class function ExerciseBucketDomain(): Boolean; static; inline;
  end;

type
  BucketIn_TypeTests<T> = record {Type ID and symmetric assignment compatibility tests are ignored; should have been handled by compiler flags}
  strict private
    class function Expected(const AValue: T): Boolean; static; inline;
  private {Domain Boundaries}
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheBucketTallyType(); static; inline;
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType(); static; inline;
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheGrabbyArmBrainsType(); static; inline;
    class procedure All3PropertiesInitializedToDefaultValues(); static; inline;
  private {Constructor Tests}
    class procedure ConstructorInitializesTheGrabbyArmPropertyWhenGivenADefaultValue(); static; inline;
    class procedure ConstructorInitializesTheGrabbyArmPropertyWhenGivenANonDefaultValue(); static; inline;
    class procedure ConstructorInitializesTheNamePropertyWhenGivenADefaultValue(); static; inline;
    class procedure ConstructorInitializesTheNamePropertyWhenGivenANonDefaultValue(); static; inline;
    class procedure ConstructorInitializesThePredictionPropertyWhenGivenADefaultValue(); static; inline;
    class procedure ConstructorInitializesThePredictionPropertyWhenGivenANonDefaultValue(); static; inline;
  end;

  BucketOut_TypeTests = record
  strict private class var Default: BucketOut;
  private {Domain Boundaries}
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheBucketTallyType(); static; inline;
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType(); static; inline;
  private {Domain Boundaries}
    class procedure ComparisonOperatorReturnsFalseWhenEitherBucketOutHasANonDefaultCountPropertyValue(); static; inline;
    class procedure ComparisonOperatorReturnsFalseWhenEitherBucketOutHasANonDefaultNamePropertyValue(); static; inline;
    class procedure ComparisonOperatorReturnsTrueWhenBothInstancesAreSystemDotDefaultValues(); static; inline;
    class procedure ComparisonOperatorReturnsTrueWhenBothInstancesAreEqualBecauseAllPropertyValuesAreIdentical(); static; inline;
    { TODO -oChuck -cToDo : Now that I've taken over the equality operator, a new property pokes a hole in the existing testing surface area}
  end;

  BucketTally_TypeTests = record
  private {Domain Boundaries}
    class procedure DefaultValueIsZero(); static; inline;
    class procedure MinimumValueIsZero(); static; inline;
    class procedure MaximumValueIs4294967295(); static; inline; //4,294,967,295
  private {Type Identity/Symmetric Assignment Compatibility}
    class procedure IsTypeIdenticalToCardinal(); static; inline;
    class procedure SharesSymmetricAssignmentCompatibilityWithCardinal(); static; inline;
  end;

  GrabbyArmBrains_TypeTests<T> = record
  private {Domain Boundaries}
    class procedure IsAssigmentCompatibleWithAnAnonymousMethodComprisedOfASingleImmutableValueOfTAndReturningABooleanType(); static; inline;
    class procedure IsSymmetricallyAssigmentCompatibleWithAProceduralTypeHavingASingleImmutableValueOfTAndReturningABooleanType(); static; inline;
  private {Type Identity/Symmetric Assignment Compatibility}
    class procedure TheProvidedTIsTypeIdenticalToTheSUT_Type(); static; inline;
    class procedure ReturnsTrueWhenComprisedSolelyOfSourceCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT(); static; inline; { TODO -oChuck -cToDo : Requires runtime (and I really don't want to have to knock the grabby arm type down to a procedural type only)}
  end;

{$ENDIF}

implementation

{$IF IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime and
 IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime}

{ BucketIn_TypeTests<T> :: Type Tests }
class procedure BucketIn_TypeTests<T>.All3PropertiesInitializedToDefaultValues();
begin
  var Actual: BucketIn<T>;
  Assert(System.Default(BucketTally) = Actual.Prediction);
  Assert(System.Default(GrabbyArmBrains<T>) = Actual.GrabbyArm);
  Assert(System.Default(string) = Actual.Name);
end;

class procedure BucketIn_TypeTests<T>.ConstructorInitializesTheGrabbyArmPropertyWhenGivenADefaultValue();
begin
  System.Assert(System.Default(GrabbyArmBrains<T>) = BucketIn<T>.Create(System.Default(GrabbyArmBrains<T>)).GrabbyArm);
end;

class procedure BucketIn_TypeTests<T>.ConstructorInitializesTheGrabbyArmPropertyWhenGivenANonDefaultValue();
begin
  System.Assert(not (System.Default(GrabbyArmBrains<T>) = BucketIn<T>.Create(Expected).GrabbyArm));
end;

class procedure BucketIn_TypeTests<T>.ConstructorInitializesTheNamePropertyWhenGivenADefaultValue();
begin
  Assert(System.Default(SUT_TYPES<T>.Actual.BucketNameType) = BucketIn<T>.Create(nil, System.Default(SUT_TYPES<T>.Actual.BucketNameType)).Name);
end;

class procedure BucketIn_TypeTests<T>.ConstructorInitializesTheNamePropertyWhenGivenANonDefaultValue();
begin
  Assert('a' <> System.Default(SUT_TYPES<T>.Actual.BucketNameType));
  Assert('a' = BucketIn<T>.Create(nil, 'a').Name);
end;

class procedure BucketIn_TypeTests<T>.ConstructorInitializesThePredictionPropertyWhenGivenADefaultValue();
begin
  System.Assert(System.Default(BucketTally) = BucketIn<T>.Create(nil, '', System.Default(BucketTally)).Prediction);
end;

class procedure BucketIn_TypeTests<T>.ConstructorInitializesThePredictionPropertyWhenGivenANonDefaultValue();
begin
  System.Assert(System.Default(BucketTally) <> BucketIn<T>.Create(nil, '', System.Default(BucketTally) + 1).Prediction);
end;

class procedure BucketIn_TypeTests<T>.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheGrabbyArmBrainsType();
begin
  Assert(System.TypeInfo(BucketTally) = System.TypeInfo(SUT_TYPES<T>.Actual.E_BucketTally));
  SUT_TYPES<T>.ExpectedBucketIn.GrabbyArm := SUT_TYPES<T>.ActualGrabbyArmBrains;
  SUT_TYPES<T>.ActualGrabbyArmBrains := SUT_TYPES<T>.ExpectedBucketIn.GrabbyArm;
end;

class procedure BucketIn_TypeTests<T>.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType();
begin
  {$IF (System.TypeInfo(string) <> System.TypeInfo(Integer)) and (System.TypeInfo(string) = System.TypeInfo(string))}
  Assert(System.TypeInfo(string) = System.TypeInfo(SUT_TYPES<T>.Actual.BucketNameType));
  SUT_TYPES<T>.ExpectedBucketIn.Name := SUT_TYPES<T>.ActualBucketNameType;
  SUT_TYPES<T>.ActualBucketNameType := SUT_TYPES<T>.ExpectedBucketIn.Name;
  {$ELSE}
  Assert(False, 'We do not seem to have compile time type identity established for the native string');
  {$IFEND}
end;

class procedure BucketIn_TypeTests<T>.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheBucketTallyType();
begin
  Assert(System.TypeInfo(BucketTally) = System.TypeInfo(SUT_TYPES<T>.Actual.E_BucketTally));
  SUT_TYPES<T>.ExpectedBucketIn.Prediction := SUT_TYPES<T>.ActualBucketTally;
  SUT_TYPES<T>.ActualBucketTally := SUT_TYPES<T>.ExpectedBucketIn.Prediction;
end;

class function BucketIn_TypeTests<T>.Expected(const AValue: T): Boolean;
begin Result := False; end;

{ BucketOut_TypeTests :: Type Tests }

class procedure BucketOut_TypeTests.ComparisonOperatorReturnsFalseWhenEitherBucketOutHasANonDefaultNamePropertyValue();
begin
  var NonDefault := Default;
  NonDefault.Name := 'a';  //Safe to make this assumption (for now; at least)
  Assert(not (System.Default(BucketOut) = NonDefault));
end;

class procedure BucketOut_TypeTests.ComparisonOperatorReturnsFalseWhenEitherBucketOutHasANonDefaultCountPropertyValue();
begin
  var NonDefault := Default;
  NonDefault.Count := 1;  //Safe to make this assumption (for now; at least)
  Assert(not (System.Default(BucketOut) = NonDefault));
end;

class procedure BucketOut_TypeTests.ComparisonOperatorReturnsTrueWhenBothInstancesAreSystemDotDefaultValues();
begin
  Assert(System.Default(BucketOut) = System.Default(BucketOut));
end;

class procedure BucketOut_TypeTests.ComparisonOperatorReturnsTrueWhenBothInstancesAreEqualBecauseAllPropertyValuesAreIdentical();
begin
  var NonDefault1 := Default;
  var NonDefault2 := Default;
  NonDefault1.Count := 1;  //Safe to make this assumption (for now; at least)
  NonDefault2.Count := 1;  //Safe to make this assumption (for now; at least)
  NonDefault1.Name := 'a';  //Safe to make this assumption (for now; at least)
  NonDefault2.Name := 'a';  //Safe to make this assumption (for now; at least)
  Assert(not (System.Default(BucketOut) = NonDefault1));
  Assert(not (System.Default(BucketOut) = NonDefault2));
  Assert(NonDefault1 = NonDefault2);
end;

class procedure BucketOut_TypeTests.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheBucketTallyType();
begin
  Assert(System.TypeInfo(BucketTally) = System.TypeInfo(SUT_TYPES<T>.Actual.E_BucketTally));
  SUT_TYPES<T>.ExpectedBucketOut.Count := SUT_TYPES<T>.ActualBucketTally;
  SUT_TYPES<T>.ActualBucketTally := SUT_TYPES<T>.ExpectedBucketOut.Count;
end;

{ TODO -oChuck -cMental Note : You haven't yet considered what can/can't be done w/include files. Furthermore, you haven't even braoched the concept of a pre-compiler. }

class procedure BucketOut_TypeTests.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType();
begin
  {$IF (System.TypeInfo(string) <> System.TypeInfo(Integer)) and (System.TypeInfo(string) = System.TypeInfo(string))}
  Assert(System.TypeInfo(string) = System.TypeInfo(SUT_TYPES<T>.Actual.BucketNameType));
  SUT_TYPES<T>.ExpectedBucketOut.Name := SUT_TYPES<T>.ActualBucketNameType;
  SUT_TYPES<T>.ActualBucketNameType := SUT_TYPES<T>.ExpectedBucketOut.Name;
  {$ELSE}
  Assert(False, 'We do not seem to have compile time type identity established for the native string');
  {$IFEND}
end;

{ BucketTally_TypeTests :: Tests }
class procedure BucketTally_TypeTests.DefaultValueIsZero();
begin
  Assert(0 = System.Default(SUT_TYPES<T>.Actual.E_BucketTally));
end;

class procedure BucketTally_TypeTests.IsTypeIdenticalToCardinal();
begin
  Assert(System.TypeInfo(Cardinal) = System.TypeInfo(SUT_TYPES<T>.Actual.E_BucketTally));
end;

class procedure BucketTally_TypeTests.MaximumValueIs4294967295();
begin
  Assert(High(Cardinal) = High(SUT_TYPES<T>.Actual.E_BucketTally));
end;

class procedure BucketTally_TypeTests.MinimumValueIsZero();
begin
  Assert(Low(Cardinal) = Low(SUT_TYPES<T>.Actual.E_BucketTally));
end;

class procedure BucketTally_TypeTests.SharesSymmetricAssignmentCompatibilityWithCardinal();
begin
  SUT_TYPES<T>.ActualBucketTally := SUT_TYPES<T>.ExpectedCardinal;
  SUT_TYPES<T>.ExpectedCardinal := SUT_TYPES<T>.ActualBucketTally;
end;

{ GrabbyArmBrains_TypeTests :: Type Tests }
class procedure GrabbyArmBrains_TypeTests<T>.TheProvidedTIsTypeIdenticalToTheSUT_Type();
begin
  System.Assert(System.TypeInfo(GrabbyArmBrains<T>) = System.TypeInfo(SUT_TYPES<T>.Actual.GrabbyArmBrains_Closed));
end;

class procedure GrabbyArmBrains_TypeTests<T>.IsSymmetricallyAssigmentCompatibleWithAProceduralTypeHavingASingleImmutableValueOfTAndReturningABooleanType();
begin
  SUT_TYPES<T>.ExpectedGrabbyArmBrains := SUT_TYPES<T>.ActualGrabbyArmBrains;
  SUT_TYPES<T>.ActualGrabbyArmBrains := SUT_TYPES<T>.ExpectedGrabbyArmBrains;
end;

class procedure GrabbyArmBrains_TypeTests<T>.IsAssigmentCompatibleWithAnAnonymousMethodComprisedOfASingleImmutableValueOfTAndReturningABooleanType();
{ TODO -oChuck -cToDo : Is it even possible to take an anonymous method, given that it will be an interface instance at runtime, and prove out its usage at compile-time? }
begin
  SUT_TYPES<T>.ExpectedGrabbyArmBrains := function (const AValue: T): Boolean begin Result := False end;
  SUT_TYPES<T>.ActualGrabbyArmBrains := function (const AValue: T): Boolean begin Result := False end;
end;

class procedure GrabbyArmBrains_TypeTests<T>.ReturnsTrueWhenComprisedSolelyOfSourceCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT();
begin
  SUT_TYPES<T>.ActualGrabbyArmBrains := function (const AValue: T): Boolean begin Result := (AValue = System.Default(T)) end;
  Assert(SUT_TYPES<T>.ActualGrabbyArmBrains(Default(T)));
end;

class function SUT_TYPES<T>.ExerciseBucketDomain(): Boolean;
begin
  BucketTally_TypeTests.DefaultValueIsZero();
  BucketTally_TypeTests.MinimumValueIsZero();
  BucketTally_TypeTests.MaximumValueIs4294967295();
  BucketTally_TypeTests.IsTypeIdenticalToCardinal();
  BucketTally_TypeTests.SharesSymmetricAssignmentCompatibilityWithCardinal();
  BucketIn_TypeTests<T>.ConstructorInitializesTheGrabbyArmPropertyWhenGivenADefaultValue();
  BucketIn_TypeTests<T>.ConstructorInitializesTheGrabbyArmPropertyWhenGivenANonDefaultValue();
  BucketIn_TypeTests<T>.ConstructorInitializesTheNamePropertyWhenGivenADefaultValue();
  BucketIn_TypeTests<T>.ConstructorInitializesTheNamePropertyWhenGivenANonDefaultValue();
  BucketIn_TypeTests<T>.ConstructorInitializesThePredictionPropertyWhenGivenADefaultValue();
  BucketIn_TypeTests<T>.ConstructorInitializesThePredictionPropertyWhenGivenANonDefaultValue();
  BucketIn_TypeTests<T>.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheBucketTallyType();
  BucketIn_TypeTests<T>.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType();
  BucketIn_TypeTests<T>.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheGrabbyArmBrainsType();
  BucketIn_TypeTests<T>.All3PropertiesInitializedToDefaultValues();
  BucketOut_TypeTests.ComparisonOperatorReturnsFalseWhenEitherBucketOutHasANonDefaultCountPropertyValue();
  BucketOut_TypeTests.ComparisonOperatorReturnsFalseWhenEitherBucketOutHasANonDefaultNamePropertyValue();
  BucketOut_TypeTests.ComparisonOperatorReturnsTrueWhenBothInstancesAreSystemDotDefaultValues();
  BucketOut_TypeTests.ComparisonOperatorReturnsTrueWhenBothInstancesAreEqualBecauseAllPropertyValuesAreIdentical();
  BucketOut_TypeTests.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheBucketTallyType();
  BucketOut_TypeTests.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType();
  GrabbyArmBrains_TypeTests<T>.TheProvidedTIsTypeIdenticalToTheSUT_Type();
  GrabbyArmBrains_TypeTests<T>.IsAssigmentCompatibleWithAnAnonymousMethodComprisedOfASingleImmutableValueOfTAndReturningABooleanType();
  GrabbyArmBrains_TypeTests<T>.IsSymmetricallyAssigmentCompatibleWithAProceduralTypeHavingASingleImmutableValueOfTAndReturningABooleanType();
  GrabbyArmBrains_TypeTests<T>.ReturnsTrueWhenComprisedSolelyOfSourceCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT();
  PE.DomainTests.Buckets.DomainTests<T>.Exercise();
  Result := True;
end;

{$IFEND}

end.
