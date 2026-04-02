unit PE.TypeTests.Types;
{Chuck C.T.
 The type names and what said types represent may not match what you currently think of as intuition;
 especially if you started from a Pascal/Object Pascal/Delphi background like I did.
}
interface

type
  AllTests = record
  public
    class procedure Exercise(); static; inline;
  end;

type
  ///<summary>Delphi specific entity establishing facts about TypeUnderTest</summary>
  TypeEquivalenceInquiry<TypeUnderTest> = record
  public
    class procedure DoesNotShareTypeIdentityWith<ThisGuy>(); static; inline;
    class procedure HasANonNullSystemDotTypeInfoValue(); static; inline;
    class procedure SharesTypeIdentityWith<ThisGuy>(); static; inline;
  end;

  NaturalNumber_TypeTests = record
  public {Domain/Language Tests}
    class procedure TheLowestPossibleValueIsZero(); static; inline;
    class procedure TheHighestPossibleNumberIs4294967295(); static; inline; //4,294,967,295
  public
    class procedure IsSymmetricallyAssignmentCompatibleWithCardinal(); static; inline;
  end;

  NaturalNumber32_TypeTests = record
  public {Domain/Language Tests}
    class procedure TheLowestPossibleValueIsZero(); static; inline;
    class procedure TheHighestPossibleNumberIs4294967295(); static; inline; //4,294,967,295
  end;

  NaturalNumber64_TypeTests = record
  public {Domain/Language Tests}
    class procedure TheLowestPossibleValueIsZero(); static; inline;
    class procedure TheHighestPossibleNumberIs18446744073709551615(); static; inline; //Approximately 18.45 quintillion
  public
    class procedure IsSymmetricallyAssignmentCompatibleWithUInt64(); static; inline;
  end;

  NaturalNumberArray_TypeTests = record
  public {Language Tests :: Delphi :: Capabilites}
    class procedure SharesTypeIdentityWithTArrayOfNaturalNumber(); static; inline;
    class procedure IsSymmetricallyAssignmentCompatibleWithTArrayOfNaturalNumber(); static; inline;
  end;

  SmartClaw_TypeTests<T> = record
  strict private class function Expected(const AValue: T): Boolean; static; inline;
  public {Domain Tests :: Capabilites}
    class procedure ReturnsTrueWhenOnlyComprisedOfCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT(); static; inline;
  public {Language Tests :: Delphi :: Capabilites}
    class procedure IsLeftAssigmentCompatibleWithAnAnonymousMethodComprisedOfAFunctionWithASingleImmutableValueOfTAndReturningABooleanType(); static; inline;
    class procedure IsLeftAssigmentCompatibleWithAProceduralMethodComprisedOfTheExpectedRoutinePresentlyLivingInThisTestCollection(); static; inline;
  public {Test Wrapper}
    class procedure Exercise(); static; inline;
  end;

implementation

uses
  {PE Assertions}
  PE.Delphi.TypeIdentity.Proven.AtCompileTime,
  {PE SUT}
  PE.Types;

{ Exercise }

class procedure AllTests.Exercise();
begin
  {Domain Tests}
  NaturalNumber_TypeTests.TheLowestPossibleValueIsZero();
  NaturalNumber_TypeTests.TheHighestPossibleNumberIs4294967295();
  NaturalNumber32_TypeTests.TheLowestPossibleValueIsZero();
  NaturalNumber32_TypeTests.TheHighestPossibleNumberIs4294967295();
  NaturalNumber64_TypeTests.TheLowestPossibleValueIsZero();
  NaturalNumber64_TypeTests.TheHighestPossibleNumberIs18446744073709551615();
  SmartClaw_TypeTests<NaturalNumber>.Exercise();
  SmartClaw_TypeTests<NaturalNumber32>.Exercise();
  //SmartClaw_TypeTests<NaturalNumber64>.Exercise();
  { TODO -oChuck -c?sForThoseSeeingInsideTheCompiler :
Uncommenting the above reproducably causes a "F2084 Internal Error: 2252". I have my theories,
but none of those matter. The important part is that the SmartClaw<T> cannot be proven to handle
the NaturalNumber64 type. So, for the time being, anyone using SmartClaw<T> where SmartClaw<NaturalNumber64> is hoping that the code works.}
  {Delphi Tests}
  NaturalNumber_TypeTests.IsSymmetricallyAssignmentCompatibleWithCardinal();
  NaturalNumber64_TypeTests.IsSymmetricallyAssignmentCompatibleWithUInt64();
  TypeEquivalenceInquiry<NaturalNumber>.HasANonNullSystemDotTypeInfoValue();
  TypeEquivalenceInquiry<NaturalNumber>.DoesNotShareTypeIdentityWith<Cardinal>();
  TypeEquivalenceInquiry<NaturalNumber32>.HasANonNullSystemDotTypeInfoValue();
  TypeEquivalenceInquiry<NaturalNumber32>.SharesTypeIdentityWith<NaturalNumber>();
  TypeEquivalenceInquiry<NaturalNumber64>.HasANonNullSystemDotTypeInfoValue();
  TypeEquivalenceInquiry<NaturalNumber64>.DoesNotShareTypeIdentityWith<UInt64>();
end;

class procedure NaturalNumber_TypeTests.IsSymmetricallyAssignmentCompatibleWithCardinal();
begin
  var Expected: Cardinal := 0;
  var Actual: NaturalNumber := Expected;
  Expected := Actual;
end;

{ NaturalNumber_TypeTests<TypeUnderTest> }

class procedure NaturalNumber_TypeTests.TheHighestPossibleNumberIs4294967295;
begin
  System.Assert(4294967295 = System.High(NaturalNumber));
end;

class procedure NaturalNumber_TypeTests.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber));
end;

{ TypeEquivalenceInquiry<TypeUnderTest> }

class procedure TypeEquivalenceInquiry<TypeUnderTest>.DoesNotShareTypeIdentityWith<ThisGuy>;
begin
  System.Assert(not (System.TypeInfo(TypeUnderTest) = System.TypeInfo(ThisGuy)));
end;

class procedure TypeEquivalenceInquiry<TypeUnderTest>.HasANonNullSystemDotTypeInfoValue;
begin
  System.Assert(SystemDotTypeInfoProducesNonNullTypeInfoAtCompileTime);
  System.Assert(System.Assigned(System.TypeInfo(TypeUnderTest)));
end;

class procedure TypeEquivalenceInquiry<TypeUnderTest>.SharesTypeIdentityWith<ThisGuy>;
begin
  System.Assert(System.TypeInfo(TypeUnderTest) = System.TypeInfo(ThisGuy));
end;

{ NaturalNumber32_TypeTests }

class procedure NaturalNumber32_TypeTests.TheHighestPossibleNumberIs4294967295;
begin
  System.Assert(4294967295 = System.High(NaturalNumber32));
end;

class procedure NaturalNumber32_TypeTests.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber32));
end;

{ NaturalNumber64_TypeTests }

class procedure NaturalNumber64_TypeTests.IsSymmetricallyAssignmentCompatibleWithUInt64;
begin
  var Expected: UInt64 := 0;
  var Actual: NaturalNumber64 := Expected;
  Expected := Actual;
end;

class procedure NaturalNumber64_TypeTests.TheHighestPossibleNumberIs18446744073709551615;
begin
  System.Assert(18446744073709551615 = System.High(NaturalNumber64));
end;

class procedure NaturalNumber64_TypeTests.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber64));
end;

{ SmartClaw_TypeTests<T> }

class procedure SmartClaw_TypeTests<T>.Exercise;
begin
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
  var Actual:SmartClaw<T> := Expected;
end;

class procedure SmartClaw_TypeTests<T>.ReturnsTrueWhenOnlyComprisedOfCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT;
begin
  var Actual: SmartClaw<T> := function (const AValue: T): Boolean begin Result := (AValue = System.Default(T)) end;
  Assert(Actual(Default(T)));
end;

{ NaturalNumberArray_TypeTests }

class procedure NaturalNumberArray_TypeTests.IsSymmetricallyAssignmentCompatibleWithTArrayOfNaturalNumber;
begin
  var Expected: TArray<NaturalNumber>;
  var Actual: NaturalNumberArray := Expected;
  Expected := Actual;
end;

class procedure NaturalNumberArray_TypeTests.SharesTypeIdentityWithTArrayOfNaturalNumber;
begin
  TypeEquivalenceInquiry<TArray<NaturalNumber>>.SharesTypeIdentityWith<NaturalNumberArray>();
end;

end.
