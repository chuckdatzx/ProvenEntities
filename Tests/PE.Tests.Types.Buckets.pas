unit PE.Tests.Types.Buckets;
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
  {PE}
  PE.Buckets,
  PE.Delphi.AssignmentCompatibility.GenericRecords.Proven.AtCompileTime,
  PE.Delphi.Rando,
  PE.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime,
  PE.Delphi.TypeIdentity.Proven.AtCompileTime,
  PE.Tests.Routines.Buckets,
  PE.Types;

{$IF (not IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime) or
 (not IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime)}
   {$MESSAGE FATAL 'Unable to continue without compile-time assertions established.'}
{$ENDIF}

type
  ///<summary>Exercises all type tests for this namespace</summary>
  TypeTests<T> = record
  public
    class procedure Exercise(); static; inline;
  end;

{ TODO -oChuck -cMusing : Not certain yet if it is needed, but I'm not currently "locking down" BucketIn<T> and BucketOut.
 I say this because it can be argued that additions (e.g. adding a 4th property to a BucketIn<T> type) can cause undesirable side-effects.
 While the above seems true, I can also argue "stop trying to break it". I guess I'll see where I land at a later point.}

type
  BucketInTests = record
  public type
    AssignmentOperator<TypeUnderTest> = record
    public
      class procedure IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesAll3PropertyValues(); static; inline;
    end;
    &Constructor<TypeUnderTest> = record
    public
      class procedure InitializesTheGrabbyArmPropertyWhenGivenADefaultValue(); static; inline;
      class procedure InitializesTheGrabbyArmPropertyWhenGivenANonDefaultValue(); static; inline;
      class procedure InitializesTheNamePropertyWhenGivenADefaultValue(); static; inline;
      class procedure InitializesTheNamePropertyWhenGivenANonDefaultValue(); static; inline;
      class procedure InitializesThePredictionPropertyWhenGivenADefaultValue(); static; inline;
      class procedure InitializesThePredictionPropertyWhenGivenANonDefaultValue(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    EqualityOperator<TypeUnderTest> = record
    strict private
      class procedure ReturnsTrueWhenComparingIdenticalInstancesAndAll3PropertiesHaveDefaultValues(); static; inline;
      class procedure ReturnsTrueWhenComparingIdenticalInstancesAndAll3PropertiesHaveIdenticalNonDefaultValues(); static; inline;
      class procedure ReturnsTrueWhenComparingSeparateInstancesAndAll3PropertiesHaveDefaultValues(); static; inline;
      class procedure ReturnsTrueWhenComparingSeparateInstancesAndAll3PropertiesHaveIdenticalNonDefaultValues(); static; inline;
    strict private
      class procedure ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveTheGrabbyArmHaveIdenticalNonDefaultValues(); static; inline;
      class procedure ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveTheNameHaveIdenticalDefaultValues(); static; inline;
      class procedure ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveThePredictionHaveIdenticalDefaultValues(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Properties<TypeUnderTest> = record
    strict private
      class procedure ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheNativeStringTypeAndInitializedToTheNativeStringDefault(); static; inline;
      class procedure ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeAndInitializedToTheNaturalNumberDefault(); static; inline;
      class procedure ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheSmartClawType(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  end;

  BucketOut_TypeTests = record
  strict private class var Default: BucketOut;
  strict private class var ExpectedNaturalNumber: UInt64;
  strict private {Language Tests: Property Tests}
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNaturalNumberType(); static; inline;
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType(); static; inline;
  strict private {Language Tests: Equality Comparison Operator :: BucketOut = BucketOut}
    class procedure EqualityComparisonOperatorReturnsFalseWhenEitherBucketOutHasANonDefaultCountPropertyValue(); static; inline;
    class procedure EqualityComparisonOperatorReturnsFalseWhenEitherBucketOutHasANonDefaultNamePropertyValue(); static; inline;
    class procedure EqualityComparisonOperatorReturnsTrueWhenBothInstancesAreSystemDotDefaultValues(); static; inline;
    class procedure EqualityComparisonOperatorReturnsTrueWhenBothInstancesAreEqualBecauseAllPropertyValuesAreIdentical(); static; inline;
  public {Wrapper}
    class procedure Exercise(); static; inline;
  end;

implementation

{ BucketInTests.AssignmentOperator<TypeUnderTest> }

class procedure BucketInTests.AssignmentOperator<TypeUnderTest>.IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesAll3PropertyValues;
begin
  var Expected: BucketIn<TypeUnderTest> := BucketIn<TypeUnderTest>.Create(function (const A: TypeUnderTest): Boolean begin Result := False end, 'a', Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>);
  System.Assert(not (System.Default(SmartClaw<TypeUnderTest>) = Expected.GrabbyArm));
  System.Assert(not (System.Default(string) = Expected.Name));
  System.Assert(not (System.Default(NaturalNumber) = Expected.Prediction));
  var Actual: BucketIn<TypeUnderTest>;
  System.Assert(System.Default(SmartClaw<TypeUnderTest>) = Actual.GrabbyArm);
  System.Assert(System.Default(string) = Actual.Name);
  System.Assert(System.Default(NaturalNumber) = Actual.Prediction);
  Actual := Expected;
  Expected := BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>));
  System.Assert(System.Default(SmartClaw<TypeUnderTest>) = Expected.GrabbyArm);
  System.Assert(System.Default(string) = Expected.Name);
  System.Assert(System.Default(NaturalNumber) = Expected.Prediction);
  Expected := Actual;
  System.Assert(not (System.Default(SmartClaw<TypeUnderTest>) = Expected.GrabbyArm));
  System.Assert(not (System.Default(string) = Expected.Name));
  System.Assert(not (System.Default(NaturalNumber) = Expected.Prediction));
end;

{ BucketInTests.Constructor<TypeUnderTest> }

class procedure BucketInTests.&Constructor<TypeUnderTest>.Exercise;
begin
  InitializesTheGrabbyArmPropertyWhenGivenADefaultValue();
  InitializesTheGrabbyArmPropertyWhenGivenANonDefaultValue();
  InitializesTheNamePropertyWhenGivenADefaultValue();
  InitializesTheNamePropertyWhenGivenANonDefaultValue();
  InitializesThePredictionPropertyWhenGivenADefaultValue();
  InitializesThePredictionPropertyWhenGivenANonDefaultValue();
end;

class procedure BucketInTests.&Constructor<TypeUnderTest>.InitializesTheGrabbyArmPropertyWhenGivenADefaultValue;
begin
  System.Assert(System.Default(SmartClaw<TypeUnderTest>) = BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>)).GrabbyArm);
end;

class procedure BucketInTests.&Constructor<TypeUnderTest>.InitializesTheGrabbyArmPropertyWhenGivenANonDefaultValue;
begin
  System.Assert(not (System.Default(SmartClaw<TypeUnderTest>) = BucketIn<TypeUnderTest>.Create(function (const A: TypeUnderTest): Boolean begin Result := False end).GrabbyArm));
end;

class procedure BucketInTests.&Constructor<TypeUnderTest>.InitializesTheNamePropertyWhenGivenADefaultValue;
begin
  System.Assert(System.Default(string) = BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), System.Default(string)).Name);
end;

class procedure BucketInTests.&Constructor<TypeUnderTest>.InitializesTheNamePropertyWhenGivenANonDefaultValue;
const Expected: Char = 'a';
begin
  System.Assert(not (System.Default(string) = Expected));
  System.Assert(Expected = BucketIn<T>.Create(nil, Expected).Name);
end;

class procedure BucketInTests.&Constructor<TypeUnderTest>.InitializesThePredictionPropertyWhenGivenADefaultValue;
begin
  System.Assert(System.Default(NaturalNumber) = BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), System.Default(string), System.Default(NaturalNumber)).Prediction);
end;

class procedure BucketInTests.&Constructor<TypeUnderTest>.InitializesThePredictionPropertyWhenGivenANonDefaultValue;
begin
  var Expected: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (System.Default(NaturalNumber) = Expected));
  System.Assert(Expected = BucketIn<T>.Create(System.Default(SmartClaw<TypeUnderTest>), System.Default(string), Expected).Prediction);
end;

{ BucketInTests.EqualityOperator<TypeUnderTest> }

class procedure BucketInTests.EqualityOperator<TypeUnderTest>.Exercise;
begin
  ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveTheGrabbyArmHaveIdenticalNonDefaultValues();
  ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveTheNameHaveIdenticalDefaultValues();
  ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveThePredictionHaveIdenticalDefaultValues();
  ReturnsTrueWhenComparingIdenticalInstancesAndAll3PropertiesHaveDefaultValues();
  ReturnsTrueWhenComparingIdenticalInstancesAndAll3PropertiesHaveIdenticalNonDefaultValues();
  ReturnsTrueWhenComparingSeparateInstancesAndAll3PropertiesHaveDefaultValues();
  ReturnsTrueWhenComparingSeparateInstancesAndAll3PropertiesHaveIdenticalNonDefaultValues();
end;

class procedure BucketInTests.EqualityOperator<TypeUnderTest>.ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveTheGrabbyArmHaveIdenticalNonDefaultValues;
begin
  var Left: BucketIn<TypeUnderTest> := BucketIn<TypeUnderTest>.Create(function (const A: TypeUnderTest): Boolean begin Result := False end, 'a', Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>());
  var Right: BucketIn<TypeUnderTest> := BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), Left.Name, Left.Prediction);
  System.Assert(not (@Left = @Right));
  System.Assert(not (System.Default(SmartClaw<TypeUnderTest>) = Left.GrabbyArm));
  System.Assert(not (System.Default(string) = Left.Name));
  System.Assert(not (System.Default(NaturalNumber) = Left.Prediction));
  System.Assert(not (Left.GrabbyArm = Right.GrabbyArm));
  System.Assert(Left.Name = Right.Name);
  System.Assert(Left.Prediction = Right.Prediction);
  System.Assert(not (Left = Right));
end;

class procedure BucketInTests.EqualityOperator<TypeUnderTest>.ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveTheNameHaveIdenticalDefaultValues;
begin
  var Left: BucketIn<TypeUnderTest> := BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<T>), 'a');
  var Right: BucketIn<TypeUnderTest>;
  System.Assert(not (@Left = @Right));
  System.Assert((System.Default(SmartClaw<TypeUnderTest>) = Left.GrabbyArm));
  System.Assert(not (System.Default(string) = Left.Name));
  System.Assert(System.Default(NaturalNumber) = Left.Prediction);
  System.Assert(Left.GrabbyArm = Right.GrabbyArm);
  System.Assert(not (Left.Name = Right.Name));
  System.Assert(Left.Prediction = Right.Prediction);
  System.Assert(not (Left = Right));
end;

class procedure BucketInTests.EqualityOperator<TypeUnderTest>.ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveThePredictionHaveIdenticalDefaultValues;
begin
  var Left: BucketIn<TypeUnderTest> := BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<T>), System.Default(string), Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>);
  var Right: BucketIn<TypeUnderTest>;
  System.Assert(not (@Left = @Right));
  System.Assert((System.Default(SmartClaw<TypeUnderTest>) = Left.GrabbyArm));
  System.Assert(System.Default(string) = Left.Name);
  System.Assert(not (System.Default(NaturalNumber) = Left.Prediction));
  System.Assert(Left.GrabbyArm = Right.GrabbyArm);
  System.Assert(Left.Name = Right.Name);
  System.Assert(not (Left.Prediction = Right.Prediction));
  System.Assert(not (Left = Right));
end;

class procedure BucketInTests.EqualityOperator<TypeUnderTest>.ReturnsTrueWhenComparingIdenticalInstancesAndAll3PropertiesHaveDefaultValues;
begin
  var ADefault: BucketIn<TypeUnderTest> := System.Default(BucketIn<TypeUnderTest>);
  System.Assert(System.Default(SmartClaw<TypeUnderTest>) = ADefault.GrabbyArm);
  System.Assert(System.Default(string) = ADefault.Name);
  System.Assert(System.Default(NaturalNumber) = ADefault.Prediction);
  System.Assert(ADefault = ADefault);
end;

class procedure BucketInTests.EqualityOperator<TypeUnderTest>.ReturnsTrueWhenComparingIdenticalInstancesAndAll3PropertiesHaveIdenticalNonDefaultValues;
begin
  var ADefault: BucketIn<TypeUnderTest> := BucketIn<TypeUnderTest>.Create(function (const A: TypeUnderTest): Boolean begin Result := False end, 'a', Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>);
  System.Assert(not (System.Default(SmartClaw<TypeUnderTest>) = ADefault.GrabbyArm));
  System.Assert(not (System.Default(string) = ADefault.Name));
  System.Assert(not (System.Default(NaturalNumber) = ADefault.Prediction));
  System.Assert(ADefault = ADefault);
end;

class procedure BucketInTests.EqualityOperator<TypeUnderTest>.ReturnsTrueWhenComparingSeparateInstancesAndAll3PropertiesHaveDefaultValues;
begin
  var Left: BucketIn<TypeUnderTest> := System.Default(BucketIn<TypeUnderTest>);
  var Right: BucketIn<TypeUnderTest> := System.Default(BucketIn<TypeUnderTest>);
  System.Assert(not (@Left = @Right));
  System.Assert(System.Default(SmartClaw<TypeUnderTest>) = Left.GrabbyArm);
  System.Assert(System.Default(string) = Left.Name);
  System.Assert(System.Default(NaturalNumber) = Left.Prediction);
  System.Assert(Left.GrabbyArm = Right.GrabbyArm);
  System.Assert(Left.Name = Right.Name);
  System.Assert(Left.Prediction = Right.Prediction);
  System.Assert(Left = Right);
end;

class procedure BucketInTests.EqualityOperator<TypeUnderTest>.ReturnsTrueWhenComparingSeparateInstancesAndAll3PropertiesHaveIdenticalNonDefaultValues;
begin
  var Left: BucketIn<TypeUnderTest> := BucketIn<TypeUnderTest>.Create(function (const A: TypeUnderTest): Boolean begin Result := False end, 'a', Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>());
  var Right: BucketIn<TypeUnderTest> := BucketIn<TypeUnderTest>.Create(Left.GrabbyArm, Left.Name, Left.Prediction);
  System.Assert(not (@Left = @Right));
  System.Assert(not (System.Default(SmartClaw<TypeUnderTest>) = Left.GrabbyArm));
  System.Assert(not (System.Default(string) = Left.Name));
  System.Assert(not (System.Default(NaturalNumber) = Left.Prediction));
  System.Assert(Left.GrabbyArm = Right.GrabbyArm);
  System.Assert(Left.Name = Right.Name);
  System.Assert(Left.Prediction = Right.Prediction);
  System.Assert(Left = Right);
end;

{ BucketInTests.Properties<TypeUnderTest> }

class procedure BucketInTests.Properties<TypeUnderTest>.ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheNativeStringTypeAndInitializedToTheNativeStringDefault;
begin
  var Expected: string := '4';;
  var Actual: BucketIn<TypeUnderTest>;
  System.Assert(not (System.Default(string) = Expected));
  System.Assert(System.Default(string) = Actual.Name);
  Actual.Name := Expected;
  Expected := Actual.Name;
  System.Assert(not (System.Default(string) = Expected));
  System.Assert(Expected = Actual.Name);
end;

class procedure BucketInTests.Properties<TypeUnderTest>.ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeAndInitializedToTheNaturalNumberDefault;
begin
  var Expected: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>;
  var Actual: BucketIn<TypeUnderTest>;
  System.Assert(not (System.Default(NaturalNumber) = Expected));
  System.Assert(System.Default(NaturalNumber) = Actual.Prediction);
  Actual.Prediction := Expected;
  Expected := Actual.Prediction;
  System.Assert(not (System.Default(NaturalNumber) = Expected));
  System.Assert(Expected = Actual.Prediction);
end;

class procedure BucketInTests.Properties<TypeUnderTest>.ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheSmartClawType;
begin
  var Expected: SmartClaw<TypeUnderTest> := function (const A: TypeUnderTest): Boolean begin Result := False end;
  var Actual: BucketIn<TypeUnderTest>;
  System.Assert(not (System.Default(SmartClaw<TypeUnderTest>) = Expected));
  System.Assert(System.Default(SmartClaw<TypeUnderTest>) = Actual.GrabbyArm);
  Actual.GrabbyArm := Expected;
  Expected := Actual.GrabbyArm;
  System.Assert(not (System.Default(SmartClaw<TypeUnderTest>) = Expected));
  System.Assert(Expected = Actual.GrabbyArm);
end;

class procedure BucketInTests.Properties<TypeUnderTest>.Exercise;
begin
  ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheNativeStringTypeAndInitializedToTheNativeStringDefault();
  ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeAndInitializedToTheNaturalNumberDefault();
  ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheSmartClawType();
end;

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

class procedure BucketOut_TypeTests.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNaturalNumberType();
begin
  System.Assert(System.TypeInfo(NaturalNumber) = TypeTestHarness.BucketOut.CountProperty_SystemDotTypeInfo());
  var Actual: BucketOut;
  Actual.Count := ExpectedNaturalNumber;
  ExpectedNaturalNumber := Actual.Count;
end;

{ TODO -oChuck -cMental Note : You haven't yet considered what can/can't be done w/include files. Furthermore, you haven't even braoched the concept of a pre-compiler. }

class procedure BucketOut_TypeTests.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType();
begin
  {$IF (System.TypeInfo(string) <> System.TypeInfo(Integer)) and (System.TypeInfo(string) = System.TypeInfo(string))}
  Assert(System.TypeInfo(string) = TypeTestHarness.BucketIn<T>.NameProperty_SystemDotTypeInfo());
  var Expected: string;
  var Actual: BucketIn<T>;
  Actual.Name := Expected;
  Expected := Actual.Name;
  {$ELSE}
  Assert(False, 'We do not seem to have compile time type identity established for the native string');
  {$IFEND}
end;

class procedure BucketOut_TypeTests.Exercise();
begin
  EqualityComparisonOperatorReturnsFalseWhenEitherBucketOutHasANonDefaultCountPropertyValue();
  EqualityComparisonOperatorReturnsFalseWhenEitherBucketOutHasANonDefaultNamePropertyValue();
  EqualityComparisonOperatorReturnsTrueWhenBothInstancesAreSystemDotDefaultValues();
  EqualityComparisonOperatorReturnsTrueWhenBothInstancesAreEqualBecauseAllPropertyValuesAreIdentical();
  ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNaturalNumberType();
  ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType();
end;

{TypeTests<T>}

class procedure TypeTests<T>.Exercise();
begin
  BucketInTests.AssignmentOperator<T>.IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesAll3PropertyValues();
  BucketInTests.&Constructor<T>.Exercise();
  BucketInTests.EqualityOperator<T>.Exercise();
  BucketInTests.Properties<T>.Exercise();
  BucketOut_TypeTests.Exercise();
end;

end.
