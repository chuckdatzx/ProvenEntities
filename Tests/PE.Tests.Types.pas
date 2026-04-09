unit PE.Tests.Types;
{Chuck C.T.
 The type names and what said types represent may not match what you currently think of as intuition;
 especially if you started from a Pascal/Object Pascal/Delphi background like I did.
}

interface

uses
  {PE}
  PE.Delphi.Rando,
  PE.Delphi.TypeIdentity,
  PE.Types;

type
  AllTests = record
  public
    class procedure Exercise(); static; inline;
  end;

{
Sanity saver for myself:
I could prove out many facts about the ArrayOf<T> type and others in this unit.
However, any type that is symmetrically assignment compatible with a native Delphi type
strongly begs the argument of "what else needs to be proven?"(at least in the context of Delphi)
}

type
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

  {$REGION 'NaturalNumber type'}
  NaturalNumberTests = record
  public type
    AssignmentCompatibility = record
    strict private
      class procedure IsSymmetricallyAssignmentCompatibleWithCardinal(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Boundaries = record
    strict private
      class procedure TheLowestPossibleValueIsZero(); static; inline;
      class procedure TheHighestPossibleNumberIs4294967295(); static; inline; //4.2 billion
    public
      class procedure Exercise(); static; inline;
    end;
    Defaults = record
    strict private
      class procedure ValueIsZero(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    TypeIdentity = record
    strict private
      class procedure HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeCardinal(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;
  {$ENDREGION}

  {$REGION 'NaturalNumber32 type'}
  NaturalNumber32Tests = record
  public type
    TypeIdentity = record
    strict private
      class procedure IsTypeIdenticalToTheNaturalNumber(); static; inline;  //I believe this alignment alone allows me to leverage most tests executed against a NaturalNumber type
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;
  {$ENDREGION}

  {$REGION 'NaturalNumber64 type'}
  NaturalNumber64Tests = record
  public type
    AssignmentCompatibility = record
    strict private
      class procedure IsSymmetricallyAssignmentCompatibleWithUInt64(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Boundaries = record
    strict private
      class procedure TheLowestPossibleValueIsZero(); static; inline;
      class procedure TheHighestPossibleNumberIs18446744073709551615(); static; inline; //Approximately 18.45 quintillion
    public
      class procedure Exercise(); static; inline;
    end;
    Defaults = record
      class procedure ValueIsZero(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    TypeIdentity = record
    strict private
      class procedure HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeUInt64(); static; inline;
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

{ Exercise }

class procedure AllTests.Exercise();
begin
  {Foundational Types by Foundational Types}
  NaturalNumberTests.Exercise();
  NaturalNumber32Tests.Exercise();
  NaturalNumber64Tests.Exercise();
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

{ NaturalNumberTests.Defaults }

class procedure NaturalNumberTests.Defaults.Exercise;
begin
  ValueIsZero();
end;

class procedure NaturalNumberTests.Defaults.ValueIsZero;
begin
  System.Assert(0 = System.Default(NaturalNumber));
end;

{ NaturalNumberTests }

class procedure NaturalNumberTests.Exercise;
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  Defaults.Exercise();
  TypeIdentity.Exercise();
end;

{ NaturalNumberTests.Boundaries }

class procedure NaturalNumberTests.Boundaries.Exercise;
begin
  Boundaries.TheLowestPossibleValueIsZero();
  Boundaries.TheHighestPossibleNumberIs4294967295();
end;

class procedure NaturalNumberTests.Boundaries.TheHighestPossibleNumberIs4294967295;
begin
  System.Assert(4294967295 = System.High(NaturalNumber));
end;

class procedure NaturalNumberTests.Boundaries.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber));
end;

{ NaturalNumberTests.TypeIdentity }

class procedure NaturalNumberTests.TypeIdentity.Exercise;
begin
  HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeCardinal();
end;

class procedure NaturalNumberTests.TypeIdentity.HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeCardinal;
begin
  TypeEquivalenceInquiry<NaturalNumber>.HasANonNullSystemDotTypeInfoValue();
  TypeEquivalenceInquiry<NaturalNumber>.DoesNotShareTypeIdentityWith<Cardinal>();
end;

{ NaturalNumberTests.AssignmentCompatibility }

class procedure NaturalNumberTests.AssignmentCompatibility.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithCardinal();
end;

class procedure NaturalNumberTests.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithCardinal;
begin
  var Expected: Cardinal := Rando_TheUntrustworthy.NonDefaultValue<Cardinal>;
  System.Assert(not (System.Default(Cardinal) = Expected));
  var Actual: NaturalNumber := System.Default(NaturalNumber);
  System.Assert(not (Expected = Actual));
  Actual := Expected;
  Expected := System.Default(Cardinal);
  System.Assert(System.Default(Cardinal) = Expected);
  Expected := Actual;
  System.Assert(not (System.Default(Cardinal) = Expected));
end;

{ NaturalNumber32Tests }

class procedure NaturalNumber32Tests.Exercise;
begin
  TypeIdentity.Exercise();
end;

{ NaturalNumber32Tests.TypeIdentity }

class procedure NaturalNumber32Tests.TypeIdentity.Exercise;
begin
  IsTypeIdenticalToTheNaturalNumber();
end;

class procedure NaturalNumber32Tests.TypeIdentity.IsTypeIdenticalToTheNaturalNumber;
begin
  TypeEquivalenceInquiry<NaturalNumber32>.SharesTypeIdentityWith<NaturalNumber>();
end;

{ NaturalNumber64Tests.Boundaries }

class procedure NaturalNumber64Tests.Boundaries.Exercise;
begin
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs18446744073709551615();
end;

class procedure NaturalNumber64Tests.Boundaries.TheHighestPossibleNumberIs18446744073709551615;
begin
  System.Assert(18446744073709551615 = System.High(NaturalNumber64));
end;

class procedure NaturalNumber64Tests.Boundaries.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber64));
end;

{ NaturalNumber64Tests.AssignmentCompatibility }

class procedure NaturalNumber64Tests.AssignmentCompatibility.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithUInt64();
end;

class procedure NaturalNumber64Tests.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithUInt64;
begin
  var Expected: UInt64 := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();  //Using the NaturalNumber64 type causes a F2084 interna Error: C2252; so I'm using NaturalNumber instead
  System.Assert(not (System.Default(UInt64) = Expected));
  var Actual: NaturalNumber64 := System.Default(NaturalNumber64);
  System.Assert(not (Expected = Actual));
  Actual := Expected;
  Expected := System.Default(UInt64);
  System.Assert(System.Default(UInt64) = Expected);
  Expected := Actual;
  System.Assert(not (System.Default(UInt64) = Expected));
end;

{ NaturalNumber64Tests.Defaults }

class procedure NaturalNumber64Tests.Defaults.Exercise;
begin
  ValueIsZero();
end;

class procedure NaturalNumber64Tests.Defaults.ValueIsZero;
begin
  System.Assert(0 = System.Default(NaturalNumber64));
end;

{ NaturalNumber64Tests.TypeIdentity }

class procedure NaturalNumber64Tests.TypeIdentity.Exercise;
begin
  HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeUInt64();
end;

class procedure NaturalNumber64Tests.TypeIdentity.HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeUInt64;
begin
  TypeEquivalenceInquiry<NaturalNumber64>.HasANonNullSystemDotTypeInfoValue();
  TypeEquivalenceInquiry<NaturalNumber64>.DoesNotShareTypeIdentityWith<UInt64>();
end;

{ NaturalNumber64Tests }

class procedure NaturalNumber64Tests.Exercise;
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  Defaults.Exercise();
  TypeIdentity.Exercise();
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
