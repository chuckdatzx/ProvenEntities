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
  PE.Tests.Types,
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
  BucketInTests<T> = record
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
  public
    class procedure Exercise(); static; inline;
  end;

  BucketOutTests = record
  public type
    AssignmentOperator = record
    public
      class procedure IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesAll2PropertyValues(); static; inline;
    end;
    EqualityOperator = record
    strict private
      class procedure ReturnsTrueWhenComparingIdenticalInstancesAndAll2PropertiesHaveDefaultValues(); static; inline;
      class procedure ReturnsTrueWhenComparingIdenticalInstancesAndAll2PropertiesHaveIdenticalNonDefaultValues(); static; inline;
      class procedure ReturnsTrueWhenComparingSeparateInstancesAndAll2PropertiesHaveDefaultValues(); static; inline;
      class procedure ReturnsTrueWhenComparingSeparateInstancesAndAll2PropertiesHaveIdenticalNonDefaultValues(); static; inline;
    strict private
      class procedure ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveTheCountHaveIdenticalNonDefaultValues(); static; inline;
      class procedure ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveTheNameHaveIdenticalDefaultValues(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Properties = record
    strict private
      class procedure ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheNativeStringTypeAndInitializedToTheNativeStringDefault(); static; inline;
      class procedure ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeAndInitializedToTheNaturalNumberDefault(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;

implementation

{ BucketInTests.AssignmentOperator<TypeUnderTest> }

class procedure BucketInTests<T>.AssignmentOperator<TypeUnderTest>.IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesAll3PropertyValues;
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

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.Exercise;
begin
  InitializesTheGrabbyArmPropertyWhenGivenADefaultValue();
  InitializesTheGrabbyArmPropertyWhenGivenANonDefaultValue();
  InitializesTheNamePropertyWhenGivenADefaultValue();
  InitializesTheNamePropertyWhenGivenANonDefaultValue();
  InitializesThePredictionPropertyWhenGivenADefaultValue();
  InitializesThePredictionPropertyWhenGivenANonDefaultValue();
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.InitializesTheGrabbyArmPropertyWhenGivenADefaultValue;
begin
  System.Assert(System.Default(SmartClaw<TypeUnderTest>) = BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>)).GrabbyArm);
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.InitializesTheGrabbyArmPropertyWhenGivenANonDefaultValue;
begin
  System.Assert(not (System.Default(SmartClaw<TypeUnderTest>) = BucketIn<TypeUnderTest>.Create(function (const A: TypeUnderTest): Boolean begin Result := False end).GrabbyArm));
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.InitializesTheNamePropertyWhenGivenADefaultValue;
begin
  System.Assert(System.Default(string) = BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), System.Default(string)).Name);
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.InitializesTheNamePropertyWhenGivenANonDefaultValue;
const Expected: Char = 'a';
begin
  System.Assert(not (System.Default(string) = Expected));
  System.Assert(Expected = BucketIn<T>.Create(nil, Expected).Name);
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.InitializesThePredictionPropertyWhenGivenADefaultValue;
begin
  System.Assert(System.Default(NaturalNumber) = BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), System.Default(string), System.Default(NaturalNumber)).Prediction);
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.InitializesThePredictionPropertyWhenGivenANonDefaultValue;
begin
  var Expected: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (System.Default(NaturalNumber) = Expected));
  System.Assert(Expected = BucketIn<T>.Create(System.Default(SmartClaw<TypeUnderTest>), System.Default(string), Expected).Prediction);
end;

{ BucketInTests.EqualityOperator<TypeUnderTest> }

class procedure BucketInTests<T>.EqualityOperator<TypeUnderTest>.Exercise;
begin
  ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveTheGrabbyArmHaveIdenticalNonDefaultValues();
  ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveTheNameHaveIdenticalDefaultValues();
  ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveThePredictionHaveIdenticalDefaultValues();
  ReturnsTrueWhenComparingIdenticalInstancesAndAll3PropertiesHaveDefaultValues();
  ReturnsTrueWhenComparingIdenticalInstancesAndAll3PropertiesHaveIdenticalNonDefaultValues();
  ReturnsTrueWhenComparingSeparateInstancesAndAll3PropertiesHaveDefaultValues();
  ReturnsTrueWhenComparingSeparateInstancesAndAll3PropertiesHaveIdenticalNonDefaultValues();
end;

class procedure BucketInTests<T>.EqualityOperator<TypeUnderTest>.ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveTheGrabbyArmHaveIdenticalNonDefaultValues;
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

class procedure BucketInTests<T>.EqualityOperator<TypeUnderTest>.ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveTheNameHaveIdenticalDefaultValues;
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

class procedure BucketInTests<T>.EqualityOperator<TypeUnderTest>.ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveThePredictionHaveIdenticalDefaultValues;
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

class procedure BucketInTests<T>.EqualityOperator<TypeUnderTest>.ReturnsTrueWhenComparingIdenticalInstancesAndAll3PropertiesHaveDefaultValues;
begin
  var ADefault: BucketIn<TypeUnderTest> := System.Default(BucketIn<TypeUnderTest>);
  System.Assert(System.Default(SmartClaw<TypeUnderTest>) = ADefault.GrabbyArm);
  System.Assert(System.Default(string) = ADefault.Name);
  System.Assert(System.Default(NaturalNumber) = ADefault.Prediction);
  System.Assert(ADefault = ADefault);
end;

class procedure BucketInTests<T>.EqualityOperator<TypeUnderTest>.ReturnsTrueWhenComparingIdenticalInstancesAndAll3PropertiesHaveIdenticalNonDefaultValues;
begin
  var ADefault: BucketIn<TypeUnderTest> := BucketIn<TypeUnderTest>.Create(function (const A: TypeUnderTest): Boolean begin Result := False end, 'a', Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>);
  System.Assert(not (System.Default(SmartClaw<TypeUnderTest>) = ADefault.GrabbyArm));
  System.Assert(not (System.Default(string) = ADefault.Name));
  System.Assert(not (System.Default(NaturalNumber) = ADefault.Prediction));
  System.Assert(ADefault = ADefault);
end;

class procedure BucketInTests<T>.EqualityOperator<TypeUnderTest>.ReturnsTrueWhenComparingSeparateInstancesAndAll3PropertiesHaveDefaultValues;
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

class procedure BucketInTests<T>.EqualityOperator<TypeUnderTest>.ReturnsTrueWhenComparingSeparateInstancesAndAll3PropertiesHaveIdenticalNonDefaultValues;
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

{ BucketInTests<T> }

class procedure BucketInTests<T>.Exercise;
begin
  AssignmentOperator<T>.IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesAll3PropertyValues();
  &Constructor<T>.Exercise();
  EqualityOperator<T>.Exercise();
  Properties<T>.Exercise();
end;

{ BucketInTests.Properties<TypeUnderTest> }

class procedure BucketInTests<T>.Properties<TypeUnderTest>.ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheNativeStringTypeAndInitializedToTheNativeStringDefault;
begin
  var Expected: string := '4';
  var Actual: BucketIn<TypeUnderTest>;
  System.Assert(not (System.Default(string) = Expected));
  System.Assert(System.Default(string) = Actual.Name);
  Actual.Name := Expected;
  Expected := Actual.Name;
  System.Assert(not (System.Default(string) = Expected));
  System.Assert(Expected = Actual.Name);
end;

class procedure BucketInTests<T>.Properties<TypeUnderTest>.ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeAndInitializedToTheNaturalNumberDefault;
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

class procedure BucketInTests<T>.Properties<TypeUnderTest>.ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheSmartClawType;
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

class procedure BucketInTests<T>.Properties<TypeUnderTest>.Exercise;
begin
  ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheNativeStringTypeAndInitializedToTheNativeStringDefault();
  ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeAndInitializedToTheNaturalNumberDefault();
  ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheSmartClawType();
end;

{ TODO -oChuck -cMental Note : You haven't yet considered what can/can't be done w/include files. Furthermore, you haven't even braoched the concept of a pre-compiler. }

{ BucketOutTests.Properties }

class procedure BucketOutTests.Properties.ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheNativeStringTypeAndInitializedToTheNativeStringDefault;
begin
  var Expected: string := '42';
  var Actual: BucketOut;
  System.Assert(not (System.Default(string) = Expected));
  System.Assert(System.Default(string) = Actual.Name);
  Actual.Name := Expected;
  Expected := Actual.Name;
  System.Assert(not (System.Default(string) = Expected));
  System.Assert(Expected = Actual.Name);
end;

class procedure BucketOutTests.Properties.ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeAndInitializedToTheNaturalNumberDefault;
begin
  var Expected: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>;
  var Actual: BucketOut;
  System.Assert(not (System.Default(NaturalNumber) = Expected));
  System.Assert(System.Default(NaturalNumber) = Actual.Count);
  Actual.Count := Expected;
  Expected := Actual.Count;
  System.Assert(not (System.Default(NaturalNumber) = Expected));
  System.Assert(Expected = Actual.Count);
end;

class procedure BucketOutTests.Properties.Exercise;
begin
  ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheNativeStringTypeAndInitializedToTheNativeStringDefault();
  ContainsOneWhichIsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeAndInitializedToTheNaturalNumberDefault();
end;

{ BucketOutTests.EqualityOperator }

class procedure BucketOutTests.EqualityOperator.Exercise;
begin
  ReturnsTrueWhenComparingIdenticalInstancesAndAll2PropertiesHaveDefaultValues();
  ReturnsTrueWhenComparingIdenticalInstancesAndAll2PropertiesHaveIdenticalNonDefaultValues();
  ReturnsTrueWhenComparingSeparateInstancesAndAll2PropertiesHaveDefaultValues();
  ReturnsTrueWhenComparingSeparateInstancesAndAll2PropertiesHaveIdenticalNonDefaultValues();
  ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveTheCountHaveIdenticalNonDefaultValues();
  ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveTheNameHaveIdenticalDefaultValues();
end;

class procedure BucketOutTests.EqualityOperator.ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveTheCountHaveIdenticalNonDefaultValues;
begin
  var Left: BucketOut := System.Default(BucketOut);
  Left.Count := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  var Right: BucketOut := System.Default(BucketOut);
  System.Assert(not (@Left = @Right));
  System.Assert(not (System.Default(NaturalNumber) = Left.Count));
  System.Assert(System.Default(string) = Left.Name);
  System.Assert(not (Left.Count = Right.Count));
  System.Assert(Left.Name = Right.Name);
  System.Assert(not (Left = Right));
end;

class procedure BucketOutTests.EqualityOperator.ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveTheNameHaveIdenticalDefaultValues;
begin
  var Left: BucketOut := System.Default(BucketOut);
  Left.Name := 'x';
  var Right: BucketOut := System.Default(BucketOut);
  System.Assert(not (@Left = @Right));
  System.Assert(System.Default(NaturalNumber) = Left.Count);
  System.Assert(not (System.Default(string) = Left.Name));
  System.Assert(Left.Count = Right.Count);
  System.Assert(not (Left.Name = Right.Name));
  System.Assert(not (Left = Right));
end;

class procedure BucketOutTests.EqualityOperator.ReturnsTrueWhenComparingIdenticalInstancesAndAll2PropertiesHaveDefaultValues;
begin
  var ADefault: BucketOut := System.Default(BucketOut);
  System.Assert(System.Default(NaturalNumber) = ADefault.Count);
  System.Assert(System.Default(string) = ADefault.Name);
  System.Assert(ADefault = ADefault);
end;

class procedure BucketOutTests.EqualityOperator.ReturnsTrueWhenComparingIdenticalInstancesAndAll2PropertiesHaveIdenticalNonDefaultValues;
begin
  var ADefault: BucketOut;
  ADefault.Count := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>;
  ADefault.Name := 'a';
  System.Assert(not (System.Default(NaturalNumber) = ADefault.Count));
  System.Assert(not (System.Default(string) = ADefault.Name));
  System.Assert(ADefault = ADefault);
end;

class procedure BucketOutTests.EqualityOperator.ReturnsTrueWhenComparingSeparateInstancesAndAll2PropertiesHaveDefaultValues;
begin
  var Left: BucketOut := System.Default(BucketOut);
  var Right: BucketOut := System.Default(BucketOut);
  System.Assert(not (@Left = @Right));
  System.Assert(System.Default(NaturalNumber) = Left.Count);
  System.Assert(System.Default(string) = Left.Name);
  System.Assert(Left.Count = Right.Count);
  System.Assert(Left.Name = Right.Name);
  System.Assert(Left = Right);
end;

class procedure BucketOutTests.EqualityOperator.ReturnsTrueWhenComparingSeparateInstancesAndAll2PropertiesHaveIdenticalNonDefaultValues;
begin
  var Left: BucketOut;
  Left.Count := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  Left.Name := 'a';
  var Right: BucketOut;
  Right.Count := Left.Count;
  Right.Name := Left.Name;
  System.Assert(not (@Left = @Right));
  System.Assert(not (System.Default(NaturalNumber) = Left.Count));
  System.Assert(not (System.Default(string) = Left.Name));
  System.Assert(Left.Count = Right.Count);
  System.Assert(Left.Name = Right.Name);
  System.Assert(Left = Right);
end;

{ BucketOutTests }

class procedure BucketOutTests.Exercise;
begin
  AssignmentOperator.IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesAll2PropertyValues();
  EqualityOperator.Exercise();
  Properties.Exercise();
end;

{TypeTests<T>}

class procedure TypeTests<T>.Exercise();
begin
//  ArrayOfTests<PE.Buckets.BucketIn<T>>.Exercise(); //Validating dependencies
//  ArrayOfTests<BucketOut>.Exercise(); //Validating dependencies
  BucketInTests<T>.Exercise();
  BucketOutTests.Exercise();
end;

{ BucketOutTests.AssignmentOperator }

class procedure BucketOutTests.AssignmentOperator.IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesAll2PropertyValues;
begin
  var Expected: BucketOut;
  Expected.Count := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>;
  Expected.Name := 'Doggy';
  System.Assert(not (System.Default(NaturalNumber) = Expected.Count));
  System.Assert(not (System.Default(string) = Expected.Name));
  var Actual: BucketOut := System.Default(BucketOut);
  System.Assert(System.Default(NaturalNumber) = Actual.Count);
  System.Assert(System.Default(string) = Actual.Name);
  Actual := Expected;
  Expected.Count := System.Default(NaturalNumber);
  Expected.Name := System.Default(string);
  System.Assert(System.Default(NaturalNumber) = Expected.Count);
  System.Assert(System.Default(string) = Expected.Name);
  Expected := Actual;
  System.Assert(not (System.Default(NaturalNumber) = Expected.Count));
  System.Assert(not (System.Default(string) = Expected.Name));
end;

end.
