unit PE.TypeTests.Buckets;
{Chuck C.T.
Full Declaration of Transparency:
You should only consider the code under test proven insofar as you agree with everything presented
(and by "everything presented", I mean from the scope of the compiler all the way through to
your custom code based on entities from this unit).

I'm truly not trying to scare anyone off. I'm perfectly comfortable calling the following proven;
and I have researched from the compiler to my code. I'm simply recommending that you do the same
and not just assume, without pause, that it is unbreakable.}
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

type
  ///<summary>Exercises all type tests for this namespace</summary>
  TypeTests<T> = record
  public
    class procedure Exercise(); static; inline;
  end;

type
  BucketIn_TypeTests<T> = record {Type ID and symmetric assignment compatibility tests are ignored; should have been handled by compiler flags}
  strict private
    class function Expected(const AValue: T): Boolean; static; inline;
  private {Property Tests}
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheBucketTallyType(); static; inline;
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheGrabbyArmBrainsType(); static; inline;
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType(); static; inline;
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
  private {Property Tests}
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheBucketTallyType(); static; inline;
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType(); static; inline;
  private {Equality Comparison Operator}
    class procedure EqualityComparisonOperatorReturnsFalseWhenEitherBucketOutHasANonDefaultCountPropertyValue(); static; inline;
    class procedure EqualityComparisonOperatorReturnsFalseWhenEitherBucketOutHasANonDefaultNamePropertyValue(); static; inline;
    class procedure EqualityComparisonOperatorReturnsTrueWhenBothInstancesAreSystemDotDefaultValues(); static; inline;
    class procedure EqualityComparisonOperatorReturnsTrueWhenBothInstancesAreEqualBecauseAllPropertyValuesAreIdentical(); static; inline;
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
  strict private type
    ExpectedProceduralType<Q> = function (const AValue: Q): Boolean;
  private {Domain Boundaries}
    class procedure IsAssigmentCompatibleWithAnAnonymousMethodComprisedOfASingleImmutableValueOfTAndReturningABooleanType(); static; inline;
    class procedure IsLeftAssigmentCompatibleWithAProceduralTypeHavingASingleImmutableValueOfTAndReturningABooleanType(); static; inline;
  private {Capabilities}
    class procedure ReturnsTrueWhenComprisedSolelyOfSourceCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT(); static; inline;
  end;

{$ENDIF}

implementation

{$IF IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime and
 IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime}

{ BucketIn_TypeTests<T> :: Type Tests }
class procedure BucketIn_TypeTests<T>.All3PropertiesInitializedToDefaultValues();
begin
  var Actual: BucketIn<T>;
  System.Assert(System.Default(BucketTally) = Actual.Prediction);
  System.Assert(System.Default(GrabbyArmBrains<T>) = Actual.GrabbyArm);
  System.Assert(System.Default(string) = Actual.Name);
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
  System.Assert(SystemDotTypeInfo.ForNativeStringType() = TypeTestHarness.BucketIn<T>.NameProperty_SystemDotTypeInfo());
  System.Assert(System.Default(string) = BucketIn<T>.Create(nil, System.Default(string)).Name);
end;

class procedure BucketIn_TypeTests<T>.ConstructorInitializesTheNamePropertyWhenGivenANonDefaultValue();
begin
  System.Assert(SystemDotTypeInfo.ForNativeStringType() = TypeTestHarness.BucketIn<T>.NameProperty_SystemDotTypeInfo());
  System.Assert('a' <> System.Default(string));
  System.Assert('a' = BucketIn<T>.Create(nil, 'a').Name);
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
  System.Assert(System.TypeInfo(GrabbyArmBrains<T>) = TypeTestHarness.BucketIn<T>.GrabbyArmProperty_SystemDotTypeInfo);
  var Expected: GrabbyArmBrains<T> := BucketIn<T>.Create(nil).GrabbyArm;
  System.Assert(BucketIn<T>.Create(Expected).GrabbyArm = Expected);
end;

class procedure BucketIn_TypeTests<T>.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType();
begin
  {$IF (System.TypeInfo(string) <> System.TypeInfo(Integer)) and (System.TypeInfo(string) = System.TypeInfo(string))}
  System.Assert(SystemDotTypeInfo.ForNativeStringType() = TypeTestHarness.BucketIn<T>.NameProperty_SystemDotTypeInfo());
  var Expected: string;
  var Actual: BucketIn<T>;
  Expected := Actual.Name;
  Actual.Name := Expected;
  {$ELSE}
  Assert(False, 'We do not seem to have compile time type identity established for the native string');
  {$IFEND}
end;

class procedure BucketIn_TypeTests<T>.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheBucketTallyType();
begin
  System.Assert(System.TypeInfo(BucketTally) = TypeTestHarness.BucketIn<T>.PredictionProperty_SystemDotTypeInfo());
  var Expected: BucketTally := 0;
  var Actual: BucketIn<T>;
  Actual.Prediction := Expected;
  Expected := Actual.Prediction;
end;

class function BucketIn_TypeTests<T>.Expected(const AValue: T): Boolean;
begin Result := False; end;

{ BucketOut_TypeTests :: Type Tests }

class procedure BucketOut_TypeTests.EqualityComparisonOperatorReturnsFalseWhenEitherBucketOutHasANonDefaultNamePropertyValue();
const
  NonDefaultValue = 'a';
begin
  System.Assert(System.Default(string) <> NonDefaultValue);
  var NonDefault := Default;
  NonDefault.Name := NonDefaultValue;
  System.Assert(not (System.Default(BucketOut) = NonDefault));
end;

class procedure BucketOut_TypeTests.EqualityComparisonOperatorReturnsFalseWhenEitherBucketOutHasANonDefaultCountPropertyValue();
begin
  var NonDefault := Default;
  NonDefault.Count := 1;  //Safe to make this assumption (for now; at least)
  System.Assert(not (System.Default(BucketOut) = NonDefault));
end;

class procedure BucketOut_TypeTests.EqualityComparisonOperatorReturnsTrueWhenBothInstancesAreSystemDotDefaultValues();
begin
  System.Assert(System.Default(BucketOut) = System.Default(BucketOut));
end;

class procedure BucketOut_TypeTests.EqualityComparisonOperatorReturnsTrueWhenBothInstancesAreEqualBecauseAllPropertyValuesAreIdentical();
begin
  var NonDefault1 := Default;
  var NonDefault2 := Default;
  NonDefault1.Count := 1;  //Safe to make this assumption (for now; at least)
  NonDefault2.Count := 1;  //Safe to make this assumption (for now; at least)
  NonDefault1.Name := 'a';  //Safe to make this assumption (for now; at least)
  NonDefault2.Name := 'a';  //Safe to make this assumption (for now; at least)
  System.Assert(not (System.Default(BucketOut) = NonDefault1));
  System.Assert(not (System.Default(BucketOut) = NonDefault2));
  System.Assert(NonDefault1 = NonDefault2);
end;

class procedure BucketOut_TypeTests.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheBucketTallyType();
begin
  System.Assert(System.TypeInfo(BucketTally) = TypeTestHarness.BucketOut.CountProperty_SystemDotTypeInfo());
  var Expected: BucketTally := 0;
  var Actual: BucketOut;
  Actual.Count := Expected;
  Expected := Actual.Count;
end;

{ TODO -oChuck -cMental Note : You haven't yet considered what can/can't be done w/include files. Furthermore, you haven't even braoched the concept of a pre-compiler. }

class procedure BucketOut_TypeTests.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType();
begin
  {$IF (System.TypeInfo(string) <> System.TypeInfo(Integer)) and (System.TypeInfo(string) = System.TypeInfo(string))}
  Assert(SystemDotTypeInfo.ForNativeStringType() = TypeTestHarness.BucketIn<T>.NameProperty_SystemDotTypeInfo());
  var Expected: string;
  var Actual: BucketIn<T>;
  Actual.Name := Expected;
  Expected := Actual.Name;
  {$ELSE}
  Assert(False, 'We do not seem to have compile time type identity established for the native string');
  {$IFEND}
end;

{ BucketTally_TypeTests :: Tests }
class procedure BucketTally_TypeTests.DefaultValueIsZero();
begin
  System.Assert(0 = System.Default(BucketTally));
end;

class procedure BucketTally_TypeTests.IsTypeIdenticalToCardinal();
begin
  System.Assert(SystemDotTypeInfo.ForCardinalType() = System.TypeInfo(BucketTally));
end;

class procedure BucketTally_TypeTests.MaximumValueIs4294967295();
begin
  System.Assert(High(Cardinal) = High(BucketTally));
end;

class procedure BucketTally_TypeTests.MinimumValueIsZero();
begin
  System.Assert(Low(Cardinal) = Low(BucketTally));
end;

class procedure BucketTally_TypeTests.SharesSymmetricAssignmentCompatibilityWithCardinal();
begin
  var Expected: Cardinal := 0;
  var Actual: BucketTally := Expected;
  Expected := Actual;
end;

{ GrabbyArmBrains_TypeTests :: Type Tests }

class procedure GrabbyArmBrains_TypeTests<T>.IsLeftAssigmentCompatibleWithAProceduralTypeHavingASingleImmutableValueOfTAndReturningABooleanType();
begin
  var Actual: ExpectedProceduralType<T>;
  var Expected: GrabbyArmBrains<T> := Actual;
end;

class procedure GrabbyArmBrains_TypeTests<T>.IsAssigmentCompatibleWithAnAnonymousMethodComprisedOfASingleImmutableValueOfTAndReturningABooleanType();
begin
  var Expected: GrabbyArmBrains<T> := function (const AValue: T): Boolean begin Result := False end;
end;

class procedure GrabbyArmBrains_TypeTests<T>.ReturnsTrueWhenComprisedSolelyOfSourceCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT();
begin
  var Actual: GrabbyArmBrains<T> := function (const AValue: T): Boolean begin Result := (AValue = System.Default(T)) end;
  Assert(Actual(Default(T)));
end;

class procedure TypeTests<T>.Exercise();
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
  BucketOut_TypeTests.EqualityComparisonOperatorReturnsFalseWhenEitherBucketOutHasANonDefaultCountPropertyValue();
  BucketOut_TypeTests.EqualityComparisonOperatorReturnsFalseWhenEitherBucketOutHasANonDefaultNamePropertyValue();
  BucketOut_TypeTests.EqualityComparisonOperatorReturnsTrueWhenBothInstancesAreSystemDotDefaultValues();
  BucketOut_TypeTests.EqualityComparisonOperatorReturnsTrueWhenBothInstancesAreEqualBecauseAllPropertyValuesAreIdentical();
  BucketOut_TypeTests.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheBucketTallyType();
  BucketOut_TypeTests.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType();
  GrabbyArmBrains_TypeTests<T>.IsAssigmentCompatibleWithAnAnonymousMethodComprisedOfASingleImmutableValueOfTAndReturningABooleanType();
  GrabbyArmBrains_TypeTests<T>.IsLeftAssigmentCompatibleWithAProceduralTypeHavingASingleImmutableValueOfTAndReturningABooleanType();
  GrabbyArmBrains_TypeTests<T>.ReturnsTrueWhenComprisedSolelyOfSourceCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT();
end;

{$IFEND}

end.
