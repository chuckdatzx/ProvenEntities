unit PE.Tests.Types;
{Chuck C.T.
 The type names and what said types represent may not match what you currently think of as intuition;
 especially if you started from a Pascal/Object Pascal/Delphi background like I did.
}

interface

uses
  {PE}
  PE.Delphi.Rando,
  PE.Delphi.TypeIdentity.Proven.AtCompileTime,
  PE.Types;

type
  AllTests = record
  public
    class procedure Exercise(); static; inline;
  end;

type
  ArrayOfTests<T> = record
  public type
    AssignmentOperator<TypeUnderTest> = record
    public
      class procedure IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesElements(); static; inline;
    end;
    &Initialization<TypeUnderTest> = record
      class procedure IsInitializedToAnEmptyCollectionOfElements(); static; inline;
    end;
    TypeIdentity<TypeUnderTest> = record
    public
      class procedure SharesTypeIdentityWithTArray(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;

type
  NaturalNumber_Tests = record
  public {Intent: Domain // Practicality :: Delphi // Rules: The minimum number is zero; the maximum number is 4,294,967,295; default is zero}
    class procedure TheDefaultValueIsZero(); static; inline;
    class procedure TheLowestPossibleValueIsZero(); static; inline;
    class procedure TheHighestPossibleNumberIs4294967295(); static; inline;
  public {Intent: Domain // Practicality :: Delphi // Rules: While not type identical to Delphi's cardinal, a NaturalNumber is still fully assignment compatible}
    class procedure IsNotTypeIdenticalToCardinal(); static; inline;
    class procedure IsSymmetricallyAssignmentCompatibleWithCardinal(); static; inline;
  public {Intent: Domain // Practicality :: Delphi // Note: Simple wrapper for executing all tests from this container}
    class procedure Exercise(); static; inline;
  end;

  NaturalNumber32_Tests = record
  public {Intent: Domain // Practicality :: Delphi // Rules: The minimum number is zero; the maximum number is 4,294,967,295; default is zero}
    class procedure TheDefaultValueIsZero(); static; inline;
    class procedure TheLowestPossibleValueIsZero(); static; inline;
    class procedure TheHighestPossibleNumberIs4294967295(); static; inline; //4,294,967,295
  public {Intent: Domain // Practicality :: Delphi // Rules: Type identical to NaturalNumber and fully assignment compatible with cardinal}
    class procedure IsSymmetricallyAssignmentCompatibleWithCardinal(); static; inline;
    class procedure IsSymmetricallyAssignmentCompatibleWithNaturalNumber(); static; inline;
    class procedure IsTypeIdenticalToNaturalNumber(); static; inline;
  public {Intent: Domain // Practicality :: Delphi // Note: Simple wrapper for executing all tests from this container}
    class procedure Exercise(); static; inline;
  end;

  NaturalNumber64_Tests = record
  public {Intent: Domain // Practicality :: Delphi // Rules: The minimum number is zero; the maximum number is really f-ing big; default is zero}
    class procedure TheDefaultValueIsZero(); static; inline;
    class procedure TheLowestPossibleValueIsZero(); static; inline;
    class procedure TheHighestPossibleNumberIs18446744073709551615(); static; inline; //Approximately 18.45 quintillion
  public {Intent: Domain // Practicality :: Delphi // Rules: Is not type identical to UInt64 yet is still fully assignment compatible}
    class procedure IsNotTypeIdenticalToUInt64(); static; inline;
    class procedure IsSymmetricallyAssignmentCompatibleWithUInt64(); static; inline;
  public {Intent: Domain // Practicality :: Delphi // Note: Simple wrapper for executing all tests from this container}
    class procedure Exercise(); static; inline;
  end;

  SmartClaw_TypeTests<T> = record
  strict private class function Expected(const AValue: T): Boolean; static; inline;
  public {Intent: Domain // Practicality :: Delphi // Rules: Returns true when comprised of the smalleest possible form of equality comparison to T}
    class procedure TheDefaultValueIsNil(); static; inline;
    class procedure ReturnsTrueWhenOnlyComprisedOfCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT(); static; inline;
  public {Intent: Domain // Practicality :: Delphi // Rules: Is left-assignment compatible with anonymous method <x> of form <y>; Is left-assignment compatible with procedural method <x> of form <y>}
    class procedure IsLeftAssigmentCompatibleWithAnAnonymousMethodComprisedOfAFunctionWithASingleImmutableValueOfTAndReturningABooleanType(); static; inline;
    class procedure IsLeftAssigmentCompatibleWithAProceduralMethodComprisedOfTheExpectedRoutinePresentlyLivingInThisTestCollection(); static; inline;
  public {Intent: Domain // Practicality :: Delphi // Note: Simple wrapper for executing all tests from this container}
    class procedure Exercise(); static; inline;
  end;

implementation

{ Exercise }

class procedure AllTests.Exercise();
begin
  {Foundational Types by Foundational Types}
  NaturalNumber_Tests.Exercise();
  NaturalNumber32_Tests.Exercise();
  NaturalNumber64_Tests.Exercise();
  ArrayOfTests<NaturalNumber>.Exercise();
  ArrayOfTests<NaturalNumber32>.Exercise();
  {$IFDEF CPU64BITS}
  ArrayOfTests<NaturalNumber64>.Exercise();  //Currently causes (F2084 Internal Error: C2252) in Win32 platform
  {$ELSE}
    {$MESSAGE WARN 'PE.Types.ArrayOf<T> cannot be proven for the NaturalNumber64 type (other NaturalNumber variations are proven)'}
  {$IFEND}
  {2nd Gen. Types by 1st Gen. Types}
  SmartClaw_TypeTests<NaturalNumber>.Exercise();
  SmartClaw_TypeTests<NaturalNumber32>.Exercise();
  {$IFDEF CPU64BITS}
  SmartClaw_TypeTests<NaturalNumber64>.Exercise();  //Currently causes (F2084 Internal Error: C2252) in Win32 platform
  {$ELSE}
    {$MESSAGE WARN 'PE.Types.SmartClaw<T> cannot be proven for the NaturalNumber64 type (other NaturalNumber variations are proven)'}
  {$IFEND}
end;

{NaturalNumber_Tests}

class procedure NaturalNumber_Tests.Exercise;
begin
  TheDefaultValueIsZero();
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs4294967295();
  IsNotTypeIdenticalToCardinal();
  IsSymmetricallyAssignmentCompatibleWithCardinal();
end;

class procedure NaturalNumber_Tests.IsNotTypeIdenticalToCardinal;
begin
  TypeEquivalenceInquiry<NaturalNumber>.DoesNotShareTypeIdentityWith<Cardinal>();
end;

class procedure NaturalNumber_Tests.IsSymmetricallyAssignmentCompatibleWithCardinal();
begin
  var Expected: Cardinal := Random(MaxInt) + 1;
  System.Assert(not (System.Default(Cardinal) = Expected));
  var Actual: NaturalNumber := System.Default(NaturalNumber);
  System.Assert(not (Expected = Actual));
  Actual := Expected;
  System.Assert(Expected = Actual);
  Expected := System.Default(Cardinal);
  System.Assert(not (Expected = Actual));
  Expected := Actual;
  System.Assert(Expected = Actual);
end;

class procedure NaturalNumber_Tests.TheDefaultValueIsZero;
begin
  System.Assert(0 = System.Default(NaturalNumber));
end;

class procedure NaturalNumber_Tests.TheHighestPossibleNumberIs4294967295;
begin
  System.Assert(4294967295 = System.High(NaturalNumber));
end;

class procedure NaturalNumber_Tests.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber));
end;

{ NaturalNumber32_Tests }

class procedure NaturalNumber32_Tests.Exercise;
begin
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs4294967295();
  IsSymmetricallyAssignmentCompatibleWithCardinal();
  IsTypeIdenticalToNaturalNumber();
end;

class procedure NaturalNumber32_Tests.IsSymmetricallyAssignmentCompatibleWithCardinal;
begin
  var Expected: Cardinal := Random(MaxInt) + 1;
  System.Assert(not (System.Default(Cardinal) = Expected));
  var Actual: NaturalNumber32 := System.Default(NaturalNumber32);
  System.Assert(System.Default(Cardinal) = Actual);
  Actual := Expected;
  Expected := System.Default(Cardinal);
  System.Assert(System.Default(Cardinal) = Expected);
  Expected := Actual;
  System.Assert(not (System.Default(Cardinal) = Expected));
end;

class procedure NaturalNumber32_Tests.IsSymmetricallyAssignmentCompatibleWithNaturalNumber;
begin
  var Expected: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (System.Default(NaturalNumber) = Expected));
  var Actual: NaturalNumber := System.Default(NaturalNumber);
  System.Assert(System.Default(NaturalNumber) = Actual);
  Actual := Expected;
  Expected := System.Default(NaturalNumber);
  System.Assert(System.Default(NaturalNumber) = Expected);
  Expected := Actual;
  System.Assert(not (System.Default(NaturalNumber) = Expected));
end;

class procedure NaturalNumber32_Tests.IsTypeIdenticalToNaturalNumber;
begin
  TypeEquivalenceInquiry<NaturalNumber32>.SharesTypeIdentityWith<NaturalNumber>();
end;

class procedure NaturalNumber32_Tests.TheDefaultValueIsZero;
begin
  System.Assert(0 = System.Default(NaturalNumber32));
end;

class procedure NaturalNumber32_Tests.TheHighestPossibleNumberIs4294967295;
begin
  System.Assert(4294967295 = System.High(NaturalNumber32));
end;

class procedure NaturalNumber32_Tests.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber32));
end;

{NaturalNumber64_Tests}

class procedure NaturalNumber64_Tests.Exercise;
begin
  TheDefaultValueIsZero();
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs18446744073709551615();
  IsNotTypeIdenticalToUInt64();
  IsSymmetricallyAssignmentCompatibleWithUInt64();
end;

class procedure NaturalNumber64_Tests.IsNotTypeIdenticalToUInt64();
begin
  TypeEquivalenceInquiry<NaturalNumber64>.DoesNotShareTypeIdentityWith<UInt64>();
end;

class procedure NaturalNumber64_Tests.IsSymmetricallyAssignmentCompatibleWithUInt64;
begin
  var Expected: UInt64;
  Expected := System.Default(UInt64) + 1;
  System.Assert(not (System.Default(UInt64) = Expected));
  var Actual: NaturalNumber64 := System.Default(NaturalNumber64);
  System.Assert(System.Default(NaturalNumber64) = Actual);
  Actual := Expected;
  Expected := System.Default(UInt64);
  System.Assert(System.Default(UInt64) = Expected);
  Expected := Actual;
  System.Assert(not (System.Default(UInt64) = Expected));
end;

class procedure NaturalNumber64_Tests.TheDefaultValueIsZero;
begin
  System.Assert(0 = System.Default(NaturalNumber64));
end;

class procedure NaturalNumber64_Tests.TheHighestPossibleNumberIs18446744073709551615;
begin
  System.Assert(18446744073709551615 = System.High(NaturalNumber64));
end;

class procedure NaturalNumber64_Tests.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber64));
end;

{ SmartClaw_TypeTests<T> }

class procedure SmartClaw_TypeTests<T>.Exercise;
begin
  TheDefaultValueIsNil();
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
  var Actual: SmartClaw<T> := function(const AValue: T):Boolean begin Result:=(AValue=System.Default(T))end;
  System.Assert(Actual(System.Default(T)));
end;

class procedure SmartClaw_TypeTests<T>.TheDefaultValueIsNil;
begin
  System.Assert(not System.Assigned(System.Default(SmartClaw<T>)));
end;

{ ArrayOfTests<T>.Initialization<TypeUnderTest> }

class procedure ArrayOfTests<T>.&Initialization<TypeUnderTest>.IsInitializedToAnEmptyCollectionOfElements;
begin
  var Actual: ArrayOf<TypeUnderTest> := System.Default(ArrayOf<TypeUnderTest>);
  System.Assert(0 = System.Length(Actual));
end;

{ ArrayOfTests }

class procedure ArrayOfTests<T>.Exercise;
begin
  AssignmentOperator<T>.IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesElements();
  &Initialization<T>.IsInitializedToAnEmptyCollectionOfElements();
  TypeIdentity<T>.SharesTypeIdentityWithTArray();
end;

{ ArrayOfTests<T>.TypeIdentity<TypeUnderTest> }

class procedure ArrayOfTests<T>.TypeIdentity<TypeUnderTest>.SharesTypeIdentityWithTArray();
begin
  TypeEquivalenceInquiry<ArrayOf<TypeUnderTest>>.SharesTypeIdentityWith<TArray<TypeUnderTest>>();
end;

{ ArrayOfTests<T>.AssignmentOperator<TypeUnderTest> }

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

end.
