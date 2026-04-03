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
  ///<summary>Delphi specific entity for establishing facts about TypeUnderTest</summary>
  ///<notes>This should probably be moved to "higher ground" (a Delphi-specific namespace)</notes>
  TypeEquivalenceInquiry<TypeUnderTest> = record
  public
    class procedure DoesNotShareTypeIdentityWith<ThisGuy>(); static; inline;
    class procedure HasANonNullSystemDotTypeInfoValue(); static; inline;
    class procedure SharesTypeIdentityWith<ThisGuy>(); static; inline;
  end;

type
  Array_TypeTests<TypeUnderTest> = record
  public {Domain Tests :: w/respect to intent}
    class procedure IsInitializedToAnEmptyCollectionOfElements(); static; inline;
  public {Language Tests :: Delphi :: TArray<T>}
    class procedure HasANonNullSystemDotTypeInfoValue(); static; inline;
    class procedure IsNotTypeIdenticalWithTArray(); static; inline;
    class procedure IsSymmetricallyAssignmentCompatibleWithTArrayOfT(); static; inline;
  public {Wrapper}
    class procedure Exercise(); static; inline;
  end;

type
  NaturalNumber_TypeTests = record
  public {Domain Tests :: w/respect to intent}
    class procedure TheLowestPossibleValueIsZero(); static; inline;
    class procedure TheHighestPossibleNumberIs4294967295(); static; inline; //4,294,967,295
  public {Language Tests :: Delphi}
    class procedure IsNotTypeIdenticalToCardinal(); static; inline;
    class procedure IsSymmetricallyAssignmentCompatibleWithCardinal(); static; inline;
  public {Wrapper}
    class procedure Exercise(); static; inline;
  end;

  NaturalNumber32_TypeTests = record
  public {Domain :: w/respect to intent}
    class procedure TheLowestPossibleValueIsZero(); static; inline;
    class procedure TheHighestPossibleNumberIs4294967295(); static; inline; //4,294,967,295
  public {Language Tests :: Delphi}
    class procedure IsSymmetricallyAssignmentCompatibleWithCardinal(); static; inline;
    class procedure IsTypeIdenticalToNaturalNumber(); static; inline;
  public {Wrapper}
    class procedure Exercise(); static; inline;
  end;

  NaturalNumber64_TypeTests = record
  public {Domain :: w/respect to intent}
    class procedure TheLowestPossibleValueIsZero(); static; inline;
    class procedure TheHighestPossibleNumberIs18446744073709551615(); static; inline; //Approximately 18.45 quintillion
  public {Language Tests :: Delphi}
    class procedure IsNotTypeIdenticalToUInt64(); static; inline;
    class procedure IsSymmetricallyAssignmentCompatibleWithUInt64(); static; inline;
  public {Wrapper}
    class procedure Exercise(); static; inline;
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
  {1st Gen. Types by 1st Gen. Types}
  NaturalNumber_TypeTests.Exercise();
  NaturalNumber32_TypeTests.Exercise();
  NaturalNumber64_TypeTests.Exercise();
  {2nd Gen. Types by 1st Gen. Types}
  Array_TypeTests<NaturalNumber>.Exercise();
  Array_TypeTests<NaturalNumber32>.Exercise();
  Array_TypeTests<NaturalNumber64>.Exercise();
  SmartClaw_TypeTests<NaturalNumber>.Exercise();
  SmartClaw_TypeTests<NaturalNumber32>.Exercise();
  //SmartClaw_TypeTests<NaturalNumber64>.Exercise();
  { TODO -oChuck -c?sForThoseSeeingInsideTheCompiler :
Uncommenting the above reproducably causes a "F2084 Internal Error: 2252". I have my theories,
but none of those matter. The important part is that the SmartClaw<T> cannot be proven to handle
the NaturalNumber64 type. So, for the time being, anyone using SmartClaw<T> where SmartClaw<NaturalNumber64> is hoping that the code works.
For those of you reading this note, as long as 4.2 billion is a big enough natural number for you, just use SmartClaw<NaturalNumber> until I figure this out.}
end;

class procedure NaturalNumber_TypeTests.Exercise;
begin
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs4294967295();
  IsNotTypeIdenticalToCardinal();
  IsSymmetricallyAssignmentCompatibleWithCardinal();
end;

class procedure NaturalNumber_TypeTests.IsNotTypeIdenticalToCardinal;
begin
  TypeEquivalenceInquiry<NaturalNumber>.DoesNotShareTypeIdentityWith<Cardinal>();
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
begin  //Of course assuming that TypeUnderTest <> ThisGuy
  System.Assert(SystemDotTypeInfoProducesNonNullTypeInfoAtCompileTime);
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

class procedure NaturalNumber32_TypeTests.Exercise;
begin
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs4294967295();
  IsSymmetricallyAssignmentCompatibleWithCardinal();
  IsTypeIdenticalToNaturalNumber();
end;

class procedure NaturalNumber32_TypeTests.IsSymmetricallyAssignmentCompatibleWithCardinal;
begin
  var Expected: Cardinal := 0;
  var Actual: NaturalNumber32 := Expected;
  Expected := Actual;
end;

class procedure NaturalNumber32_TypeTests.IsTypeIdenticalToNaturalNumber;
begin
  TypeEquivalenceInquiry<NaturalNumber32>.SharesTypeIdentityWith<NaturalNumber>();
end;

class procedure NaturalNumber32_TypeTests.TheHighestPossibleNumberIs4294967295;
begin
  System.Assert(4294967295 = System.High(NaturalNumber32));
end;

class procedure NaturalNumber32_TypeTests.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber32));
end;

{ NaturalNumber64_TypeTests }

class procedure NaturalNumber64_TypeTests.Exercise;
begin
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs18446744073709551615();
  IsNotTypeIdenticalToUInt64();
  IsSymmetricallyAssignmentCompatibleWithUInt64();
end;

class procedure NaturalNumber64_TypeTests.IsNotTypeIdenticalToUInt64();
begin
  TypeEquivalenceInquiry<NaturalNumber64>.DoesNotShareTypeIdentityWith<UInt64>();
end;

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

{ Array_TypeTests<TypeUnderTest> }

class procedure Array_TypeTests<TypeUnderTest>.Exercise;
begin
  HasANonNullSystemDotTypeInfoValue();
  IsInitializedToAnEmptyCollectionOfElements();
  IsNotTypeIdenticalWithTArray();
  IsSymmetricallyAssignmentCompatibleWithTArrayOfT();
end;

class procedure Array_TypeTests<TypeUnderTest>.HasANonNullSystemDotTypeInfoValue;
begin
  TypeEquivalenceInquiry<TypeUnderTest>.HasANonNullSystemDotTypeInfoValue();
end;

class procedure Array_TypeTests<TypeUnderTest>.IsInitializedToAnEmptyCollectionOfElements;
begin
{ TODO -oChuck -cMusing : Currently using TArray as a backing for this; not sure what else I actually could use (well, in attempting to make everything happen at compile-time).}
  System.Assert(TArray<TypeUnderTest>.Create() = System.Default(&Array<TypeUnderTest>));
end;

class procedure Array_TypeTests<TypeUnderTest>.IsNotTypeIdenticalWithTArray;
begin
  TypeEquivalenceInquiry<TypeUnderTest>.DoesNotShareTypeIdentityWith<TArray<TypeUnderTest>>();
end;

class procedure Array_TypeTests<TypeUnderTest>.IsSymmetricallyAssignmentCompatibleWithTArrayOfT;
begin
  var Expected: TArray<TypeUnderTest>;
  var Actual: &Array<TypeUnderTest> := Expected;
  Expected := Actual;
end;

end.
