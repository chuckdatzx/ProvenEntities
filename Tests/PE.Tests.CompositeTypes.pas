unit PE.Tests.CompositeTypes;

interface

uses
  {PE}
  PE.Delphi.Rando,  //For inlining
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
  PE.Delphi.TypeIdentity,
  PE.Types.Composite;

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

end.
