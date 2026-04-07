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
  PE.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime,
  PE.Delphi.TypeIdentity.Proven.AtCompileTime,
  PE.Tests.Behavioral.Buckets,
  PE.Types;

{$IF IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime and
 IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime}

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
  BucketIn_TypeTests<T> = record {Type ID and symmetric assignment compatibility tests are ignored; should have been handled by compiler flags}
  strict private class function Expected(const AValue: T): Boolean; static; inline;
  strict private class var ExpectedNaturalNumber: UInt64;
  strict private {Language Tests: Property Tests}
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNaturalNumberType(); static; inline;
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheSmartClawType(); static; inline;
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType(); static; inline;
    class procedure All3PropertiesInitializedToDefaultValues(); static; inline;
  strict private {Language Tests: Constructor Tests}
    class procedure ConstructorInitializesTheGrabbyArmPropertyWhenGivenADefaultValue(); static; inline;
    class procedure ConstructorInitializesTheGrabbyArmPropertyWhenGivenANonDefaultValue(); static; inline;
    class procedure ConstructorInitializesTheNamePropertyWhenGivenADefaultValue(); static; inline;
    class procedure ConstructorInitializesTheNamePropertyWhenGivenANonDefaultValue(); static; inline;
    class procedure ConstructorInitializesThePredictionPropertyWhenGivenADefaultValue(); static; inline;
    class procedure ConstructorInitializesThePredictionPropertyWhenGivenANonDefaultValue(); static; inline;
  public {Wrapper}
    class procedure Exercise(); static; inline;
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

{$ENDIF}

implementation

{$IF IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime and
 IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime}

{ BucketIn_TypeTests<T> :: Type Tests }
class procedure BucketIn_TypeTests<T>.All3PropertiesInitializedToDefaultValues();
begin
  var Actual: BucketIn<T>;
  System.Assert(System.Default(NaturalNumber) = Actual.Prediction);
  System.Assert(System.Default(SmartClaw<T>) = Actual.GrabbyArm);
  System.Assert(System.Default(string) = Actual.Name);
end;

class procedure BucketIn_TypeTests<T>.ConstructorInitializesTheGrabbyArmPropertyWhenGivenADefaultValue();
begin
  System.Assert(System.Default(SmartClaw<T>) = BucketIn<T>.Create(System.Default(SmartClaw<T>)).GrabbyArm);
end;

class procedure BucketIn_TypeTests<T>.ConstructorInitializesTheGrabbyArmPropertyWhenGivenANonDefaultValue();
begin
  System.Assert(not (System.Default(SmartClaw<T>) = BucketIn<T>.Create(Expected).GrabbyArm));
end;

class procedure BucketIn_TypeTests<T>.ConstructorInitializesTheNamePropertyWhenGivenADefaultValue();
begin
  System.Assert(System.TypeInfo(string) = TypeTestHarness.BucketIn<T>.NameProperty_SystemDotTypeInfo());
  System.Assert(System.Default(string) = BucketIn<T>.Create(nil, System.Default(string)).Name);
end;

class procedure BucketIn_TypeTests<T>.ConstructorInitializesTheNamePropertyWhenGivenANonDefaultValue();
begin
  System.Assert(System.TypeInfo(string) = TypeTestHarness.BucketIn<T>.NameProperty_SystemDotTypeInfo());
  System.Assert('a' <> System.Default(string));
  System.Assert('a' = BucketIn<T>.Create(nil, 'a').Name);
end;

class procedure BucketIn_TypeTests<T>.ConstructorInitializesThePredictionPropertyWhenGivenADefaultValue();
begin
  System.Assert(System.Default(NaturalNumber) = BucketIn<T>.Create(nil, '', System.Default(NaturalNumber)).Prediction);
end;

class procedure BucketIn_TypeTests<T>.ConstructorInitializesThePredictionPropertyWhenGivenANonDefaultValue();
begin
  System.Assert(System.Default(NaturalNumber) <> BucketIn<T>.Create(nil, '', System.Default(NaturalNumber) + 1).Prediction);
end;

class procedure BucketIn_TypeTests<T>.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheSmartClawType();
begin
  System.Assert(System.TypeInfo(SmartClaw<T>) = TypeTestHarness.BucketIn<T>.GrabbyArmProperty_SystemDotTypeInfo);
  var Expected: SmartClaw<T> := BucketIn<T>.Create(nil).GrabbyArm;
  System.Assert(BucketIn<T>.Create(Expected).GrabbyArm = Expected);
end;

class procedure BucketIn_TypeTests<T>.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType();
begin
  {$IF (System.TypeInfo(string) <> System.TypeInfo(Integer)) and (System.TypeInfo(string) = System.TypeInfo(string))}
  System.Assert(System.TypeInfo(string) = TypeTestHarness.BucketIn<T>.NameProperty_SystemDotTypeInfo());
  var Expected: string;
  var Actual: BucketIn<T>;
  Expected := Actual.Name;
  Actual.Name := Expected;
  {$ELSE}
  Assert(False, 'We do not seem to have compile time type identity established for the native string');
  {$IFEND}
end;

class procedure BucketIn_TypeTests<T>.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNaturalNumberType();
begin
  System.Assert(System.TypeInfo(NaturalNumber) = TypeTestHarness.BucketIn<T>.PredictionProperty_SystemDotTypeInfo());
  var Actual: BucketIn<T>;
  Actual.Prediction := ExpectedNaturalNumber;
  ExpectedNaturalNumber := Actual.Prediction;
end;

class procedure BucketIn_TypeTests<T>.Exercise();
begin
  ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNaturalNumberType();
  ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheSmartClawType();
  ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheNativeStringType();
  All3PropertiesInitializedToDefaultValues();
  ConstructorInitializesTheGrabbyArmPropertyWhenGivenADefaultValue();
  ConstructorInitializesTheGrabbyArmPropertyWhenGivenANonDefaultValue();
  ConstructorInitializesTheNamePropertyWhenGivenADefaultValue();
  ConstructorInitializesTheNamePropertyWhenGivenANonDefaultValue();
  ConstructorInitializesThePredictionPropertyWhenGivenADefaultValue();
  ConstructorInitializesThePredictionPropertyWhenGivenANonDefaultValue();
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

class procedure TypeTests<T>.Exercise();
begin
  BucketIn_TypeTests<T>.Exercise();
  BucketOut_TypeTests.Exercise();
end;
{$IFEND}

end.
