unit PE.Tests.CompositeTypes;

interface

uses
  {PE}
  PE.Delphi.Rando,  //For inlining
  PE.Types.Composite,
  PE.Types.Foundational;

type
  AllTests = record
  public
    class procedure Exercise(); static; inline;
  end;

  {$REGION 'ArrayOf<T> type'}
  ArrayOfTests<T> = record
  public type
    AssignmentOperator<TypeUnderTest> = record
    strict private
      class procedure IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesElements(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Defaults<TypeUnderTest> = record
    strict private
      class procedure IsInitializedToAnEmptyCollectionOfElements(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    TypeIdentity<TypeUnderTest> = record
    strict private
      class procedure SharesTypeIdentityWithTArray(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;
  {$ENDREGION}

  {$REGION 'MultiChar type'}
  MultiCharTests = record
  public type
    AssignmentOperator = record
    strict private
      class procedure IsSymmetricallyAssignmentCompatibleWithItselfAndPreservesMonoCharContent(); static; inline;
      class procedure IsSymmetricallyAssignmentCompatibleWithTheNativeStringAndPreservesStringContent(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    &Constructor = record
    strict private
      class procedure CanBeInitializedWithANativeStringLiteral(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    EqualityOperator = record
    strict private
      class procedure ReturnsTrueWhenComparingIdenticalInstancesAndTheMonoCharContentIsDefault(); static; inline;
      class procedure ReturnsTrueWhenComparingIdenticalInstancesAndTheMonoCharContentIsNonDefault(); static; inline;
      class procedure ReturnsTrueWhenComparingSeparateInstancesAndAllMonoCharContentIsDefault(); static; inline;
      class procedure ReturnsTrueWhenComparingSeparateInstancesAndAllMonoCharContentIsNonDefault(); static; inline;
    strict private
      class procedure ReturnsFalseWhenComparingSeparateInstancesAndAllMonoCharContentIsNonDefaultAndNotIdentical(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;
  {$ENDREGION}

  {$REGION 'SmartClaw<T> type'}
  SmartClawTypeTests<T> = record
  public type
    AssignmentCompatibility = record
    strict private
      class function ExpectedProceduralType<TypeUnderTest>(const AValue: TypeUnderTest): Boolean; static; inline;
    strict private
      class procedure IsLeftAssigmentCompatibleWithAnAnonymousMethodComprisedOfAFunctionWithASingleImmutableValueOfTAndReturningABooleanType(); static; inline;
      class procedure IsLeftAssigmentCompatibleWithAProceduralMethodComprisedOfAFunctionWithASingleImmutableValueOfTAndReturningABooleanType(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Behaviors = record
      class procedure ReturnsFalseWhenGivenANonDefaultTAndWhenSolelyComprisedOfCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT(); static; inline;
      class procedure ReturnsTrueWhenGivenANonDefaultTAndWhenSolelyComprisedOfCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Defaults = record
      class procedure TheDefaultValueIsNil(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;
  {$ENDREGION}

implementation

uses
  {PE}
  PE.Delphi.TypeIdentity;

{ AllTests }

class procedure AllTests.Exercise;
begin
  ArrayOfTests<NaturalNumber>.Exercise();
  ArrayOfTests<NaturalNumber32>.Exercise();
  {$IFDEF CPU64BITS}
  ArrayOfTests<NaturalNumber64>.Exercise();  //Currently causes (F2084 Internal Error: C2252) in Win32 platform
  {$ELSE}
    {$MESSAGE WARN 'PE.Types.ArrayOf<T> cannot be proven for the NaturalNumber64 type (other NaturalNumber variations are proven)'}
  {$IFEND}
  MultiCharTests.Exercise();
  SmartClawTypeTests<NaturalNumber>.Exercise();
  SmartClawTypeTests<NaturalNumber32>.Exercise();
  {$IFDEF CPU64BITS}
  SmartClawTypeTests<NaturalNumber64>.Exercise();  //Currently causes (F2084 Internal Error: C2252) in Win32 platform
  {$ELSE}
    {$MESSAGE WARN 'PE.Types.SmartClaw<T> cannot be proven for the NaturalNumber64 type (other NaturalNumber variations are proven)'}
  {$IFEND}
end;

{ ArrayOfTests<T>.Defaults<TypeUnderTest> }

class procedure ArrayOfTests<T>.Defaults<TypeUnderTest>.Exercise;
begin
  IsInitializedToAnEmptyCollectionOfElements();
end;

class procedure ArrayOfTests<T>.Defaults<TypeUnderTest>.IsInitializedToAnEmptyCollectionOfElements;
begin
  var Actual: ArrayOf<TypeUnderTest> := System.Default(ArrayOf<TypeUnderTest>);
  System.Assert(0 = System.Length(Actual));
end;

{ ArrayOfTests }

class procedure ArrayOfTests<T>.Exercise;
begin
  AssignmentOperator<T>.Exercise();
  Defaults<T>.Exercise();
  TypeIdentity<T>.Exercise();
end;

{ ArrayOfTests<T>.TypeIdentity<TypeUnderTest> }

class procedure ArrayOfTests<T>.TypeIdentity<TypeUnderTest>.Exercise;
begin
  SharesTypeIdentityWithTArray();
end;

class procedure ArrayOfTests<T>.TypeIdentity<TypeUnderTest>.SharesTypeIdentityWithTArray();
begin
  TypeEquivalenceInquiry<ArrayOf<TypeUnderTest>>.SharesTypeIdentityWith<TArray<TypeUnderTest>>();
end;

{ ArrayOfTests<T>.AssignmentOperator<TypeUnderTest> }

class procedure ArrayOfTests<T>.AssignmentOperator<TypeUnderTest>.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesElements();
end;

class procedure ArrayOfTests<T>.AssignmentOperator<TypeUnderTest>.IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesElements();
begin
  var Expected: ArrayOf<TypeUnderTest> := [System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)];
  System.Assert(3 = System.Length(Expected));
  System.Assert(System.Default(TypeUnderTest) = Expected[System.Low(Expected)]);
  System.Assert(System.Default(TypeUnderTest) = Expected[System.Low(Expected) + 1]);
  System.Assert(System.Default(TypeUnderTest) = Expected[System.Low(Expected) + 2]);
  var Actual: ArrayOf<TypeUnderTest> := [];
  System.Assert(0 = System.Length(Actual));
  Actual := Expected;
  Expected := [];
  System.Assert(0 = System.Length(Expected));
  Expected := Actual;
  System.Assert(3 = System.Length(Expected));
  System.Assert(System.Default(TypeUnderTest) = Expected[System.Low(Expected)]);
  System.Assert(System.Default(TypeUnderTest) = Expected[System.Low(Expected) + 1]);
  System.Assert(System.Default(TypeUnderTest) = Expected[System.Low(Expected) + 2]);
end;

{ SmartClawTypeTests<T>.AssignmentCompatibility }

class procedure SmartClawTypeTests<T>.AssignmentCompatibility.Exercise;
begin
  IsLeftAssigmentCompatibleWithAnAnonymousMethodComprisedOfAFunctionWithASingleImmutableValueOfTAndReturningABooleanType();
  IsLeftAssigmentCompatibleWithAProceduralMethodComprisedOfAFunctionWithASingleImmutableValueOfTAndReturningABooleanType();
end;

class function SmartClawTypeTests<T>.AssignmentCompatibility.ExpectedProceduralType<TypeUnderTest>(const AValue: TypeUnderTest): Boolean; begin Result := False; end;

class procedure SmartClawTypeTests<T>.AssignmentCompatibility.IsLeftAssigmentCompatibleWithAnAnonymousMethodComprisedOfAFunctionWithASingleImmutableValueOfTAndReturningABooleanType;
begin
  var Actual: SmartClaw<T> := System.Default(SmartClaw<T>);
  System.Assert(not System.Assigned(Actual));
  Actual := function (const AValue: T): Boolean begin Result := False end;
  System.Assert(System.Assigned(Actual));
end;

class procedure SmartClawTypeTests<T>.AssignmentCompatibility.IsLeftAssigmentCompatibleWithAProceduralMethodComprisedOfAFunctionWithASingleImmutableValueOfTAndReturningABooleanType;
begin
  var Actual: SmartClaw<T> := System.Default(SmartClaw<T>);
  System.Assert(not System.Assigned(Actual));
  Actual := ExpectedProceduralType<T>;
  System.Assert(System.Assigned(Actual));
end;

{ SmartClawTypeTests<T>.Behaviors }

class procedure SmartClawTypeTests<T>.Behaviors.Exercise;
begin
  ReturnsFalseWhenGivenANonDefaultTAndWhenSolelyComprisedOfCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT();
  ReturnsTrueWhenGivenANonDefaultTAndWhenSolelyComprisedOfCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT();
end;

class procedure SmartClawTypeTests<T>.Behaviors.ReturnsFalseWhenGivenANonDefaultTAndWhenSolelyComprisedOfCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT;
begin
  var ActualValue: T := Rando_TheUntrustworthy.NonDefaultValue<T>();
  System.Assert(not (System.Default(T) = ActualValue));
  var Actual: SmartClaw<T> := function(const AValue: T):Boolean begin Result:=(AValue=System.Default(T))end;
  System.Assert(System.Assigned(Actual));
  System.Assert(not Actual(ActualValue));
end;

class procedure SmartClawTypeTests<T>.Behaviors.ReturnsTrueWhenGivenANonDefaultTAndWhenSolelyComprisedOfCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT;
begin
  var ActualValue: T := System.Default(T);
  System.Assert(System.Default(T) = ActualValue);
  var Actual: SmartClaw<T> := function(const AValue: T):Boolean begin Result:=(AValue=System.Default(T))end;
  System.Assert(System.Assigned(Actual));
  System.Assert(Actual(ActualValue));
end;

{ SmartClawTypeTests<T>.Defaults }

class procedure SmartClawTypeTests<T>.Defaults.Exercise;
begin
  TheDefaultValueIsNil();
end;

class procedure SmartClawTypeTests<T>.Defaults.TheDefaultValueIsNil;
begin
  System.Assert(not System.Assigned(System.Default(SmartClaw<T>)));
end;

{ SmartClawTypeTests<T> }

class procedure SmartClawTypeTests<T>.Exercise;
begin
  AssignmentCompatibility.Exercise();
  Behaviors.Exercise();
  Defaults.Exercise();
end;

{ MultiCharTests.AssignmentOperator }

class procedure MultiCharTests.AssignmentOperator.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithItselfAndPreservesMonoCharContent();
  IsSymmetricallyAssignmentCompatibleWithTheNativeStringAndPreservesStringContent();
end;

class procedure MultiCharTests.AssignmentOperator.IsSymmetricallyAssignmentCompatibleWithItselfAndPreservesMonoCharContent;
begin
  var ExpectedString: string := Rando_TheUntrustworthy.NonDefaultValue<string>();
  System.Assert(not (System.Default(string) = ExpectedString));
  var ActualMultiChar: MultiChar := System.Default(MultiChar);
  System.Assert(System.Default(MultiChar) = ActualMultiChar);
  System.Assert(not (ExpectedString = ActualMultiChar));
  ActualMultiChar := ExpectedString;
  System.Assert(ExpectedString = ActualMultiChar);
  var Actual: MultiChar := System.Default(MultiChar);
  System.Assert(not (Actual = ActualMultiChar));
  Actual := ActualMultiChar;
  System.Assert(ActualMultiChar = Actual);
  System.Assert(Expectedstring = Actual);
end;

class procedure MultiCharTests.AssignmentOperator.IsSymmetricallyAssignmentCompatibleWithTheNativeStringAndPreservesStringContent;
begin
  var Expected: string := Rando_TheUntrustworthy.NonDefaultValue<string>();
  System.Assert(not (System.Default(string) = Expected));
  var Actual: MultiChar := System.Default(MultiChar);
  System.Assert(System.Default(MultiChar) = Actual);
  var ActualString: string := System.Default(string);
  System.Assert(not (Expected = ActualString));
  ActualString := Expected;
  System.Assert(Expected = ActualString);
  System.Assert(not (Expected = Actual));
  Actual := Expected;
  System.Assert(Expected = Actual);
end;

{ MultiCharTests }

class procedure MultiCharTests.Exercise;
begin
  AssignmentOperator.Exercise();
  &Constructor.Exercise();
  EqualityOperator.Exercise();
end;

{ MultiCharTests.Constructor }

class procedure MultiCharTests.&Constructor.CanBeInitializedWithANativeStringLiteral;
const
  Expected = 'This seems unique enough.';
begin
  System.Assert(not (System.Default(string) = Expected));
  var ActualEmpty: MultiChar := System.Default(MultiChar);
  System.Assert(System.Default(MultiChar) = ActualEmpty);
  var Actual: MultiChar := MultiChar.Create(Expected);
  System.Assert(not (System.Default(MultiChar) = Actual));
//  System.Assert(Expected = Actual);
end;

class procedure MultiCharTests.&Constructor.Exercise;
begin
  CanBeInitializedWithANativeStringLiteral();
end;

{ MultiCharTests.EqualityOperator }

class procedure MultiCharTests.EqualityOperator.Exercise;
begin
  ReturnsFalseWhenComparingSeparateInstancesAndAllMonoCharContentIsNonDefaultAndNotIdentical();
  ReturnsTrueWhenComparingIdenticalInstancesAndTheMonoCharContentIsDefault();
  ReturnsTrueWhenComparingIdenticalInstancesAndTheMonoCharContentIsNonDefault();
  ReturnsTrueWhenComparingSeparateInstancesAndAllMonoCharContentIsDefault();
  ReturnsTrueWhenComparingSeparateInstancesAndAllMonoCharContentIsNonDefault();
end;

class procedure MultiCharTests.EqualityOperator.ReturnsFalseWhenComparingSeparateInstancesAndAllMonoCharContentIsNonDefaultAndNotIdentical;
begin
  var Left: MultiChar := MultiChar.Create('i');
  var Right: MultiChar := MultiChar.Create('I');
  System.Assert(not (@Left = @Right));
  System.Assert(not (System.Default(ArrayOf<MonoChar>) = Left.ArrayOfMonoChar));
  System.Assert(not (System.Default(ArrayOf<MonoChar>) = Right.ArrayOfMonoChar));
  var LeftData: ArrayOf<MonoChar> := Left.ArrayOfMonoChar;
  var RightData: ArrayOf<MonoChar> := Right.ArrayOfMonoChar;
  System.Assert(1 = System.Length(LeftData));
  System.Assert(not (LeftData[System.Low(LeftData)] = RightData[System.Low(RightData)]));
  System.Assert(not (Left = Right));
end;

class procedure MultiCharTests.EqualityOperator.ReturnsTrueWhenComparingIdenticalInstancesAndTheMonoCharContentIsDefault;
begin
  var ADefault: MultiChar := System.Default(MultiChar);
  System.Assert(System.Default(MultiChar) = ADefault);
  System.Assert(System.Default(ArrayOf<MonoChar>) = ADefault.ArrayOfMonoChar);
  System.Assert(ADefault = ADefault);
end;

class procedure MultiCharTests.EqualityOperator.ReturnsTrueWhenComparingIdenticalInstancesAndTheMonoCharContentIsNonDefault;
begin
  var AValue: MultiChar := MultiChar.Create('111');
  System.Assert(not (System.Default(MultiChar) = AValue));
  System.Assert(not (System.Default(ArrayOf<MonoChar>) = AValue.ArrayOfMonoChar));
  System.Assert(AValue = AValue);
end;

class procedure MultiCharTests.EqualityOperator.ReturnsTrueWhenComparingSeparateInstancesAndAllMonoCharContentIsDefault;
begin
  var Left: MultiChar := System.Default(MultiChar);
  var Right: MultiChar := System.Default(MultiChar);
  System.Assert(not (@Left = @Right));
  System.Assert(System.Default(ArrayOf<MonoChar>) = Left.ArrayOfMonoChar);
  System.Assert(System.Default(ArrayOf<MonoChar>) = Right.ArrayOfMonoChar);
  System.Assert(Left = Right);
end;

class procedure MultiCharTests.EqualityOperator.ReturnsTrueWhenComparingSeparateInstancesAndAllMonoCharContentIsNonDefault;
begin
  var Left: MultiChar := MultiChar.Create('Instance');
  var Right: MultiChar := MultiChar.Create('Instance');
  System.Assert(not (@Left = @Right));
  System.Assert(not (System.Default(ArrayOf<MonoChar>) = Left.ArrayOfMonoChar));
  System.Assert(not (System.Default(ArrayOf<MonoChar>) = Right.ArrayOfMonoChar));
  var LeftData: ArrayOf<MonoChar> := Left.ArrayOfMonoChar;
  var RightData: ArrayOf<MonoChar> := Right.ArrayOfMonoChar;
  System.Assert(System.Length(LeftData) = System.Length(RightData));
  for var I: NativeInt := System.Low(LeftData) to System.high(LeftData) do
    System.Assert(Left[I] = Right[I]);
  System.Assert(Left = Right);
end;

end.
