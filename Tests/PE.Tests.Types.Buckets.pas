unit PE.Tests.Types.Buckets;
{Chuck C.T.
 I'm arguing that the following tests provide enough evidence to claim that all types in PE.Buckets unit are proven. And by proven, I mean proven for:
 - usage within any compilable source code from the PE namespace
 - usage within Delphi (at least where PE type X has been proven to be compatible with native type Y)
 - for all types for all time; if it compiles and successfully runs now, it will continue to do so (like a powered circuit; barring events like power loss)

 If you don't believe that the types of the PE.buckets namespace have been proven; that's fair. There are many points in
 my own life where I would have laughed at someone making such a claim and just moved on.
 However, if you truly disagree with me, please take the time show me where I'm wrong. I've put quite a bit of thought into
 the following; it seems unlikley that any given 1 person is going to find a problem at first glance (though I certainly
 could be wrong about that).
}
interface

uses
  {PE}
  PE.Buckets,
  PE.Delphi.Rando, //For inlining
  PE.Delphi.TypeIdentity,
  PE.Tests.CompositeTypes,
  PE.Types.Composite, //For inlining
  PE.Types.Foundational;

{$IF (not IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime)}
   {$MESSAGE FATAL 'Unable to continue without compile-time assertions established.'}
{$ENDIF}

type
  TypeTests<T> = record
  public
    class procedure Exercise(); static; inline;
  end;

type
  {$REGION 'BucketIn<T>'}
  BucketInTests<T> = record
  public type
    AssignmentOperator<TypeUnderTest> = record
    public
      class procedure IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesAll3PropertyValues(); static; inline;
    end;
    &Constructor<TypeUnderTest> = record
    public type
      FoundationalTypes = record
      public type
        Signature1 = record
        strict private
          class procedure InitializesTheGrabbyArmPropertyWhenGivenADefaultSmartClawOfTValue(); static; inline;
          class procedure InitializesTheGrabbyArmPropertyWhenGivenANonDefaultSmartClawOfTValue(); static; inline;
          class procedure InitializesTheNamePropertyWhenGivenADefaultMultiCharValue(); static; inline;
          class procedure InitializesTheNamePropertyWhenGivenANonDefaultMultiCharValue(); static; inline;
          class procedure InitializesThePredictionPropertyWhenGivenADefaultNaturalNumberValue(); static; inline;
          class procedure InitializesThePredictionPropertyWhenGivenANonDefaultNaturalNumberValue(); static; inline;
        public
          class procedure Exercise(); static; inline;
        end;
        Signature2 = record
        strict private
          class procedure InitializesTheGrabbyArmPropertyWhenGivenADefaultSmartClawOfTValue(); static; inline;
          class procedure InitializesTheGrabbyArmPropertyWhenGivenANonDefaultSmartClawOfTValue(); static; inline;
          class procedure InitializesTheNamePropertyWhenGivenADefaultArrayOfMonoCharValue(); static; inline;
          class procedure InitializesTheNamePropertyWhenGivenANonDefaultArrayOfMonoCharValue(); static; inline;
          class procedure InitializesThePredictionPropertyWhenGivenADefaultNaturalNumberValue(); static; inline;
          class procedure InitializesThePredictionPropertyWhenGivenANonDefaultNaturalNumberValue(); static; inline;
        public
          class procedure Exercise(); static; inline;
        end;
      public
        class procedure Exercise(); static; inline;
      end;
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
      class procedure TheGrabbyArmPropertyIsSymmetricallyAssignmentCompatibleWithTheSmartClawType(); static; inline;
      class procedure TheNamePropertyIsSymmetricallyAssignmentCompatibleWithTheMultiCharTypeAndInitializedToTheMultiCharDefault(); static; inline;
      class procedure ThePredictionPropertyIsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeAndInitializedToTheNaturalNumberDefault(); static; inline;
    strict private
      class procedure TheHasGrabbyArmPropertyReturnsFalseWhenTheGrabbyArmPropertyIsNotAssigned(); static; inline;
      class procedure TheHasGrabbyArmPropertyReturnsTrueWhenTheGrabbyArmPropertyIsAssigned(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;
  {$ENDREGION}

  {$REGION 'BucketOut'}
  BucketOutTests = record
  public type
    AssignmentOperator = record
    public
      class procedure IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesAll2PropertyValues(); static; inline;
    end;
    &Constructor = record
    public type
      FoundationalTypes = record
      public type
        Signature1 = record
        strict private
          class procedure InitializesTheCountPropertyWhenGivenADefaultNaturalNumberValue(); static; inline;
          class procedure InitializesTheCountPropertyWhenGivenANonDefaultNaturalNumberValue(); static; inline;
          class procedure InitializesTheNamePropertyWhenGivenADefaultMultiCharValue(); static; inline;
          class procedure InitializesTheNamePropertyWhenGivenANonDefaultMultiCharValue(); static; inline;
        public
          class procedure Exercise(); static; inline;
        end;
      end;
    public
      class procedure Exercise(); static; inline;
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
      class procedure TheCountPropertyIsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeAndInitializedToTheNaturalNumberDefault(); static; inline;
      class procedure TheNamePropertyIsSymmetricallyAssignmentCompatibleWithTheMultiCharTypeAndInitializedToTheMultiCharDefault(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;
  {$ENDREGION}

implementation

{$REGION 'BucketIn<T>'}
{BucketInTests<T>}
class procedure BucketInTests<T>.Exercise;
begin
  AssignmentOperator<T>.IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesAll3PropertyValues();
  &Constructor<T>.Exercise();
  EqualityOperator<T>.Exercise();
  Properties<T>.Exercise();
end;

{BucketInTests.AssignmentOperator<TypeUnderTest>}
class procedure BucketInTests<T>.AssignmentOperator<TypeUnderTest>.IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesAll3PropertyValues;
begin
  var Expected: BucketIn<TypeUnderTest> := BucketIn<TypeUnderTest>.Create(function (const A: TypeUnderTest): Boolean begin Result := False end, 'a', Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>);
  System.Assert(not (System.Default(SmartClaw<TypeUnderTest>) = Expected.GrabbyArm));
  System.Assert(not (System.Default(MultiChar) = Expected.Name));
  System.Assert(not (System.Default(NaturalNumber) = Expected.Prediction));
  var Actual: BucketIn<TypeUnderTest>;
  System.Assert(System.Default(SmartClaw<TypeUnderTest>) = Actual.GrabbyArm);
  System.Assert(System.Default(MultiChar) = Actual.Name);
  System.Assert(System.Default(NaturalNumber) = Actual.Prediction);
  Actual := Expected;
  Expected := BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), '');
  System.Assert(System.Default(SmartClaw<TypeUnderTest>) = Expected.GrabbyArm);
  System.Assert(System.Default(MultiChar) = Expected.Name);
  System.Assert(System.Default(NaturalNumber) = Expected.Prediction);
  Expected := Actual;
  System.Assert(not (System.Default(SmartClaw<TypeUnderTest>) = Expected.GrabbyArm));
  System.Assert(not (System.Default(MultiChar) = Expected.Name));
  System.Assert(not (System.Default(NaturalNumber) = Expected.Prediction));
end;

{BucketInTests.Constructor<TypeUnderTest>}
class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.Exercise;
begin
  FoundationalTypes.Exercise();
end;

{BucketInTests<T>.Constructor<TypeUnderTest>.FoundationalTypes}
class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.FoundationalTypes.Exercise;
begin
  Signature1.Exercise();
  Signature2.Exercise();
end;

{BucketInTests<T>.Constructor<TypeUnderTest>.FoundationalTypes.Signature1}
class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.FoundationalTypes.Signature1.Exercise;
begin
  Signature1.InitializesTheGrabbyArmPropertyWhenGivenADefaultSmartClawOfTValue();
  Signature1.InitializesTheGrabbyArmPropertyWhenGivenANonDefaultSmartClawOfTValue();
  Signature1.InitializesTheNamePropertyWhenGivenADefaultMultiCharValue();
  Signature1.InitializesTheNamePropertyWhenGivenANonDefaultMultiCharValue();
  Signature1.InitializesThePredictionPropertyWhenGivenADefaultNaturalNumberValue();
  Signature1.InitializesThePredictionPropertyWhenGivenANonDefaultNaturalNumberValue();
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.FoundationalTypes.Signature1.InitializesTheGrabbyArmPropertyWhenGivenADefaultSmartClawOfTValue;
begin
  System.Assert(System.Default(SmartClaw<TypeUnderTest>) = BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), System.Default(MultiChar), System.Default(NaturalNumber)).GrabbyArm);
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.FoundationalTypes.Signature1.InitializesTheGrabbyArmPropertyWhenGivenANonDefaultSmartClawOfTValue;
begin
  System.Assert(not (System.Default(SmartClaw<TypeUnderTest>) = BucketIn<TypeUnderTest>.Create(function (const A: TypeUnderTest): Boolean begin Result := False end, System.Default(MultiChar), System.Default(NaturalNumber)).GrabbyArm));
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.FoundationalTypes.Signature1.InitializesTheNamePropertyWhenGivenADefaultMultiCharValue;
begin
  System.Assert(System.Default(MultiChar) = BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), System.Default(MultiChar), System.Default(NaturalNumber)).Name);
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.FoundationalTypes.Signature1.InitializesTheNamePropertyWhenGivenANonDefaultMultiCharValue;
const Expected: MonoChar = 'a';
begin
  System.Assert(not (System.Default(MultiChar) = Expected));
  System.Assert(Expected = BucketIn<T>.Create(System.Default(SmartClaw<TypeUnderTest>), Expected, System.Default(NaturalNumber)).Name);
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.FoundationalTypes.Signature1.InitializesThePredictionPropertyWhenGivenADefaultNaturalNumberValue;
begin
  System.Assert(System.Default(NaturalNumber) = BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), System.Default(MultiChar), System.Default(NaturalNumber)).Prediction);
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.FoundationalTypes.Signature1.InitializesThePredictionPropertyWhenGivenANonDefaultNaturalNumberValue;
begin
  var Expected: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (System.Default(NaturalNumber) = Expected));
  System.Assert(Expected = BucketIn<T>.Create(System.Default(SmartClaw<TypeUnderTest>), System.Default(MultiChar), Expected).Prediction);
end;

{BucketInTests<T>.Constructor<TypeUnderTest>.FoundationalTypes.Signature2}
class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.FoundationalTypes.Signature2.Exercise;
begin
  InitializesTheGrabbyArmPropertyWhenGivenADefaultSmartClawOfTValue();
  InitializesTheGrabbyArmPropertyWhenGivenANonDefaultSmartClawOfTValue();
  InitializesTheNamePropertyWhenGivenADefaultArrayOfMonoCharValue();
  InitializesTheNamePropertyWhenGivenANonDefaultArrayOfMonoCharValue();
  InitializesThePredictionPropertyWhenGivenADefaultNaturalNumberValue();
  InitializesThePredictionPropertyWhenGivenANonDefaultNaturalNumberValue();
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.FoundationalTypes.Signature2.InitializesTheGrabbyArmPropertyWhenGivenADefaultSmartClawOfTValue;
begin
  System.Assert(System.Default(SmartClaw<TypeUnderTest>) = BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), System.Default(ArrayOf<MonoChar>), System.Default(NaturalNumber)).GrabbyArm);
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.FoundationalTypes.Signature2.InitializesTheGrabbyArmPropertyWhenGivenANonDefaultSmartClawOfTValue;
begin
  System.Assert(not (System.Default(SmartClaw<TypeUnderTest>) = BucketIn<TypeUnderTest>.Create(function (const A: TypeUnderTest): Boolean begin Result := False end, System.Default(ArrayOf<MonoChar>), System.Default(NaturalNumber)).GrabbyArm));
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.FoundationalTypes.Signature2.InitializesTheNamePropertyWhenGivenADefaultArrayOfMonoCharValue;
begin
  System.Assert(System.Default(MultiChar) = BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), System.Default(ArrayOf<MonoChar>), System.Default(NaturalNumber)).Name);
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.FoundationalTypes.Signature2.InitializesThePredictionPropertyWhenGivenADefaultNaturalNumberValue();
begin
  System.Assert(System.Default(NaturalNumber) = BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), System.Default(ArrayOf<MonoChar>), System.Default(NaturalNumber)).Prediction);
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.FoundationalTypes.Signature2.InitializesTheNamePropertyWhenGivenANonDefaultArrayOfMonoCharValue;
begin
  var Expected: ArrayOf<MonoChar> := Rando_TheUntrustworthy.NonDefaultValue<MultiChar>().ArrayOfMonoChar;
  System.Assert(not (System.Default(ArrayOf<MonoChar>) = Expected));
  System.Assert(Expected = BucketIn<T>.Create(System.Default(SmartClaw<TypeUnderTest>), Expected, System.Default(NaturalNumber)).Name);
end;

class procedure BucketInTests<T>.&Constructor<TypeUnderTest>.FoundationalTypes.Signature2.InitializesThePredictionPropertyWhenGivenANonDefaultNaturalNumberValue;
begin
  var Expected: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (System.Default(NaturalNumber) = Expected));
  System.Assert(Expected = BucketIn<T>.Create(System.Default(SmartClaw<TypeUnderTest>), System.Default(ArrayOf<MonoChar>), Expected).Prediction);
end;

{BucketInTests.EqualityOperator<TypeUnderTest>}
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
  System.Assert(not (System.Default(MultiChar) = Left.Name));
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
  System.Assert(not (System.Default(MultiChar) = Left.Name));
  System.Assert(System.Default(NaturalNumber) = Left.Prediction);
  System.Assert(Left.GrabbyArm = Right.GrabbyArm);
  System.Assert(not (Left.Name = Right.Name));
  System.Assert(Left.Prediction = Right.Prediction);
  System.Assert(not (Left = Right));
end;

class procedure BucketInTests<T>.EqualityOperator<TypeUnderTest>.ReturnsFalseWhenComparingSeparateInstancesAndAllPropertiesSaveThePredictionHaveIdenticalDefaultValues;
begin
  var Left: BucketIn<TypeUnderTest> := BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<T>), System.Default(MultiChar), Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>);
  var Right: BucketIn<TypeUnderTest>;
  System.Assert(not (@Left = @Right));
  System.Assert((System.Default(SmartClaw<TypeUnderTest>) = Left.GrabbyArm));
  System.Assert(System.Default(MultiChar) = Left.Name);
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
  System.Assert(System.Default(MultiChar) = ADefault.Name);
  System.Assert(System.Default(NaturalNumber) = ADefault.Prediction);
  System.Assert(ADefault = ADefault);
end;

class procedure BucketInTests<T>.EqualityOperator<TypeUnderTest>.ReturnsTrueWhenComparingIdenticalInstancesAndAll3PropertiesHaveIdenticalNonDefaultValues;
begin
  var ADefault: BucketIn<TypeUnderTest> := BucketIn<TypeUnderTest>.Create(function (const A: TypeUnderTest): Boolean begin Result := False end, 'a', Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>);
  System.Assert(not (System.Default(SmartClaw<TypeUnderTest>) = ADefault.GrabbyArm));
  System.Assert(not (System.Default(MultiChar) = ADefault.Name));
  System.Assert(not (System.Default(NaturalNumber) = ADefault.Prediction));
  System.Assert(ADefault = ADefault);
end;

class procedure BucketInTests<T>.EqualityOperator<TypeUnderTest>.ReturnsTrueWhenComparingSeparateInstancesAndAll3PropertiesHaveDefaultValues;
begin
  var Left: BucketIn<TypeUnderTest> := System.Default(BucketIn<TypeUnderTest>);
  var Right: BucketIn<TypeUnderTest> := System.Default(BucketIn<TypeUnderTest>);
  System.Assert(not (@Left = @Right));
  System.Assert(System.Default(SmartClaw<TypeUnderTest>) = Left.GrabbyArm);
  System.Assert(System.Default(MultiChar) = Left.Name);
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
  System.Assert(not (System.Default(MultiChar) = Left.Name));
  System.Assert(not (System.Default(NaturalNumber) = Left.Prediction));
  System.Assert(Left.GrabbyArm = Right.GrabbyArm);
  System.Assert(Left.Name = Right.Name);
  System.Assert(Left.Prediction = Right.Prediction);
  System.Assert(Left = Right);
end;

{BucketInTests.Properties<TypeUnderTest>}
class procedure BucketInTests<T>.Properties<TypeUnderTest>.TheGrabbyArmPropertyIsSymmetricallyAssignmentCompatibleWithTheSmartClawType;
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

class procedure BucketInTests<T>.Properties<TypeUnderTest>.TheHasGrabbyArmPropertyReturnsFalseWhenTheGrabbyArmPropertyIsNotAssigned;
begin
  var Actual: BucketIn<TypeUnderTest>;
  System.Assert(not (System.Assigned(Actual.GrabbyArm)));
  System.Assert(not Actual.HasGrabbyArm);
end;

class procedure BucketInTests<T>.Properties<TypeUnderTest>.TheHasGrabbyArmPropertyReturnsTrueWhenTheGrabbyArmPropertyIsAssigned;
begin
  var Actual: BucketIn<TypeUnderTest> := BucketIn<TypeUnderTest>.Create(function (const Value: TypeUnderTest): Boolean begin Result := False; end);
  System.Assert(System.Assigned(Actual.GrabbyArm));
  System.Assert(Actual.HasGrabbyArm);
end;

class procedure BucketInTests<T>.Properties<TypeUnderTest>.TheNamePropertyIsSymmetricallyAssignmentCompatibleWithTheMultiCharTypeAndInitializedToTheMultiCharDefault;
begin
  var Expected: MultiChar := '4';
  var Actual: BucketIn<TypeUnderTest>;
  System.Assert(not (System.Default(MultiChar) = Expected));
  System.Assert(System.Default(MultiChar) = Actual.Name);
  Actual.Name := Expected;
  Expected := Actual.Name;
  System.Assert(not (System.Default(MultiChar) = Expected));
  System.Assert(Expected = Actual.Name);
end;

class procedure BucketInTests<T>.Properties<TypeUnderTest>.ThePredictionPropertyIsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeAndInitializedToTheNaturalNumberDefault;
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

class procedure BucketInTests<T>.Properties<TypeUnderTest>.Exercise;
begin
  TheGrabbyArmPropertyIsSymmetricallyAssignmentCompatibleWithTheSmartClawType();
  TheNamePropertyIsSymmetricallyAssignmentCompatibleWithTheMultiCharTypeAndInitializedToTheMultiCharDefault();
  ThePredictionPropertyIsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeAndInitializedToTheNaturalNumberDefault();
  TheHasGrabbyArmPropertyReturnsFalseWhenTheGrabbyArmPropertyIsNotAssigned();
  TheHasGrabbyArmPropertyReturnsTrueWhenTheGrabbyArmPropertyIsAssigned();
end;
{$ENDREGION}

{$REGION 'BucketOut'}
{BucketOutTests}
class procedure BucketOutTests.Exercise;
begin
  AssignmentOperator.IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesAll2PropertyValues();
  &Constructor.Exercise();
  EqualityOperator.Exercise();
  Properties.Exercise();
end;

{BucketOutTests.AssignmentOperator}
class procedure BucketOutTests.AssignmentOperator.IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesAll2PropertyValues;
begin
  var Expected: BucketOut;
  Expected.Count := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>;
  Expected.Name := 'Doggy';
  System.Assert(not (System.Default(NaturalNumber) = Expected.Count));
  System.Assert(not (System.Default(MultiChar) = Expected.Name));
  var Actual: BucketOut := System.Default(BucketOut);
  System.Assert(System.Default(NaturalNumber) = Actual.Count);
  System.Assert(System.Default(MultiChar) = Actual.Name);
  Actual := Expected;
  Expected.Count := System.Default(NaturalNumber);
  Expected.Name := System.Default(MultiChar);
  System.Assert(System.Default(NaturalNumber) = Expected.Count);
  System.Assert(System.Default(MultiChar) = Expected.Name);
  Expected := Actual;
  System.Assert(not (System.Default(NaturalNumber) = Expected.Count));
  System.Assert(not (System.Default(MultiChar) = Expected.Name));
end;

{BucketOutTests.Constructor.FoundationalTypes.Signature1}
class procedure BucketOutTests.&Constructor.FoundationalTypes.Signature1.Exercise;
begin
  InitializesTheCountPropertyWhenGivenADefaultNaturalNumberValue();
  InitializesTheCountPropertyWhenGivenANonDefaultNaturalNumberValue();
  InitializesTheNamePropertyWhenGivenADefaultMultiCharValue();
  InitializesTheNamePropertyWhenGivenANonDefaultMultiCharValue();
end;

class procedure BucketOutTests.&Constructor.FoundationalTypes.Signature1.InitializesTheCountPropertyWhenGivenADefaultNaturalNumberValue;
begin
  System.Assert(System.Default(NaturalNumber) = BucketOut.Create(System.Default(MultiChar), System.Default(NaturalNumber)).Count);
end;

class procedure BucketOutTests.&Constructor.FoundationalTypes.Signature1.InitializesTheCountPropertyWhenGivenANonDefaultNaturalNumberValue;
begin
  var NonDefaultNaturalNumber: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>;
  System.Assert(not (NonDefaultNaturalNumber = System.Default(NaturalNumber)));
  System.Assert(NonDefaultNaturalNumber = BucketOut.Create(System.Default(MultiChar), NonDefaultNaturalNumber).Count);
end;

class procedure BucketOutTests.&Constructor.FoundationalTypes.Signature1.InitializesTheNamePropertyWhenGivenADefaultMultiCharValue;
begin
  System.Assert(System.Default(MultiChar) = BucketOut.Create(System.Default(MultiChar), System.Default(NaturalNumber)).Name);
end;

class procedure BucketOutTests.&Constructor.FoundationalTypes.Signature1.InitializesTheNamePropertyWhenGivenANonDefaultMultiCharValue;
begin
  var NonDefaultMultiChar: MultiChar := Rando_TheUntrustworthy.NonDefaultValue<MultiChar>;
  System.Assert(not (NonDefaultMultiChar = System.Default(MultiChar)));
  System.Assert(NonDefaultMultiChar = BucketOut.Create(NonDefaultMultiChar, System.Default(NaturalNumber)).Name);
end;

{BucketOutTests.Constructor}
class procedure BucketOutTests.&Constructor.Exercise;
begin
  FoundationalTypes.Signature1.Exercise();
end;

{BucketOutTests.EqualityOperator}
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
  System.Assert(System.Default(MultiChar) = Left.Name);
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
  System.Assert(not (System.Default(MultiChar) = Left.Name));
  System.Assert(Left.Count = Right.Count);
  System.Assert(not (Left.Name = Right.Name));
  System.Assert(not (Left = Right));
end;

class procedure BucketOutTests.EqualityOperator.ReturnsTrueWhenComparingIdenticalInstancesAndAll2PropertiesHaveDefaultValues;
begin
  var ADefault: BucketOut := System.Default(BucketOut);
  System.Assert(System.Default(NaturalNumber) = ADefault.Count);
  System.Assert(System.Default(MultiChar) = ADefault.Name);
  System.Assert(ADefault = ADefault);
end;

class procedure BucketOutTests.EqualityOperator.ReturnsTrueWhenComparingIdenticalInstancesAndAll2PropertiesHaveIdenticalNonDefaultValues;
begin
  var ADefault: BucketOut;
  ADefault.Count := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>;
  ADefault.Name := 'a';
  System.Assert(not (System.Default(NaturalNumber) = ADefault.Count));
  System.Assert(not (System.Default(MultiChar) = ADefault.Name));
  System.Assert(ADefault = ADefault);
end;

class procedure BucketOutTests.EqualityOperator.ReturnsTrueWhenComparingSeparateInstancesAndAll2PropertiesHaveDefaultValues;
begin
  var Left: BucketOut := System.Default(BucketOut);
  var Right: BucketOut := System.Default(BucketOut);
  System.Assert(not (@Left = @Right));
  System.Assert(System.Default(NaturalNumber) = Left.Count);
  System.Assert(System.Default(MultiChar) = Left.Name);
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
  System.Assert(not (System.Default(MultiChar) = Left.Name));
  System.Assert(Left.Count = Right.Count);
  System.Assert(Left.Name = Right.Name);
  System.Assert(Left = Right);
end;

{BucketOutTests.Properties}
class procedure BucketOutTests.Properties.TheCountPropertyIsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeAndInitializedToTheNaturalNumberDefault;
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

class procedure BucketOutTests.Properties.TheNamePropertyIsSymmetricallyAssignmentCompatibleWithTheMultiCharTypeAndInitializedToTheMultiCharDefault;
begin
  var Expected: MultiChar := Rando_TheUntrustworthy.NonDefaultValue<MultiChar>();
  System.Assert(not (System.Default(MultiChar) = Expected));
  var Actual: BucketOut;
  System.Assert(System.Default(MultiChar) = Actual.Name);
  Actual.Name := Expected;
  Expected := Actual.Name;
  System.Assert(not (System.Default(MultiChar) = Expected));
  System.Assert(Expected = Actual.Name);
end;

class procedure BucketOutTests.Properties.Exercise;
begin
  TheNamePropertyIsSymmetricallyAssignmentCompatibleWithTheMultiCharTypeAndInitializedToTheMultiCharDefault();
  TheCountPropertyIsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeAndInitializedToTheNaturalNumberDefault();
end;
{$ENDREGION}

{TypeTests<T>}
class procedure TypeTests<T>.Exercise();
begin
//  ArrayOfTests<BucketIn<T>>.Exercise(); //I would love to include these, but every time I do,
//  ExecutableSpecification_ArrayOf<BucketOut>.Exercise(); //I get an internal error (both Win32/Win64)
  BucketInTests<T>.Exercise();
  BucketOutTests.Exercise();
end;

end.
