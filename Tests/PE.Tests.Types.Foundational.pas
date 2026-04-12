unit PE.Tests.Types.Foundational;
{Chuck C.T.
 I'm arguing that the following tests provide enough evidence to claim that all types in PE.Types.Foundational unit are proven. And by proven, I mean proven for:
 - usage within any compilable source code from the PE namespace
 - usage within Delphi (at least where PE.Types.Foundational.<type X> has been proven to be compatible with native type Y)
 - for all foundational types for all time; if it compiles and successfully runs now, it will continue to do so (like a powered circuit; barring events like power loss)

 If you don't believe that the PE.Types.Foundational namespace has been proven; that's fair. There are many points in
 my own life where I would have laughed at someone making such a claim and just moved on.
 However, if you truly disagree with me, please take the time show me where I'm wrong. I've put quite a bit of thought into
 the following; it seems unlikley that any given 1 person is going to find a problem at first glance (though I certainly
 could be wrong about that).
}
interface

uses
  PE.Delphi.Rando,
  PE.Delphi.TypeIdentity,
  PE.Types.Foundational;

type
  AllTests = record
  public
    class procedure Exercise(); static; inline;
  end;

type
  {$REGION 'BigNaturalNumber type'}
  ExecutableSpecification_BigNaturalNumber = record
  public type
    AssignmentCompatibility = record
    strict private
      class procedure IsSymmetricallyAssignmentCompatibleWithUInt64WhileRetainingUInt64Value(); static; inline;
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

  {$REGION 'Digit'}
  ExecutableSpecification_Digit = record
  public type
    AssignmentCompatibility = record
    strict private
      class procedure IsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeWhileRetainingNaturalNumberValues_ForAllValuesOfDigit(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Boundaries = record
    strict private
      class procedure TheLowestPossibleValueIsZero(); static; inline;
      class procedure TheHighestPossibleValueIs9(); static; inline;
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
      class procedure HasItsOwnNonNullTypeIdentity(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;
  {$ENDREGION}

  {$REGION 'MonoChar'}
  ExecutableSpecification_MonoChar = record
  public type
    AssignmentCompatibility = record
    strict private
      class procedure IsSymmetricallyAssignmentCompatibleWithTheNativeCharWhileRetainingNativeCharValues(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    Boundaries = record
    strict private
      class procedure TheLowestPossibleOrdinalValueIsZero(); static; inline;
      class procedure TheHighestPossibleOrdinalValueIs65536(); static; inline;
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
      class procedure HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeChar(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;
  {$ENDREGION}

  {$REGION 'NaturalNumber type'}
  ExecutableSpecification_NaturalNumber = record
  public type
    AssignmentCompatibility = record
    strict private
      class procedure IsSymmetricallyAssignmentCompatibleWithCardinalWhileRetainingCardinalValues(); static; inline;
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
    HelperAddedFunctionality = record
    strict private {Min property}
      class procedure TheMinPropertyReturnsZeroForADefaultInstance(); static; inline;
      class procedure TheMinPropertyReturnsZeroForANonDefaultInstance(); static; inline;
    strict private {Max property}
      class procedure TheMaxPropertyReturns4294967295ForADefaultInstance(); static; inline;
      class procedure TheMaxPropertyReturns4294967295ForANonDefaultInstance(); static; inline;
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

implementation

{AllTests}
class procedure AllTests.Exercise();
begin
  ExecutableSpecification_Digit.Exercise();
  ExecutableSpecification_MonoChar.Exercise();
  ExecutableSpecification_BigNaturalNumber.Exercise();
  ExecutableSpecification_NaturalNumber.Exercise();
end;

{$REGION 'BigNaturalNumber'}
{ExecutableSpecification_BigNaturalNumber}
class procedure ExecutableSpecification_BigNaturalNumber.Exercise;
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  Defaults.Exercise();
  TypeIdentity.Exercise();
end;

{ExecutableSpecification_BigNaturalNumber.AssignmentCompatibility}
class procedure ExecutableSpecification_BigNaturalNumber.AssignmentCompatibility.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithUInt64WhileRetainingUInt64Value();
end;

class procedure ExecutableSpecification_BigNaturalNumber.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithUInt64WhileRetainingUInt64Value;
begin
  var Expected: UInt64 := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();  //Using the BigNaturalNumber type causes a F2084 interna Error: C2252; so I'm using NaturalNumber instead
  var ActualUInt64 := Expected;
  System.Assert(not (System.Default(UInt64) = ActualUInt64));
  var ActualNaturalNumber64: BigNaturalNumber := System.Default(BigNaturalNumber);
  System.Assert(not (ActualUInt64 = ActualNaturalNumber64));
  ActualNaturalNumber64 := ActualUInt64;
  System.Assert(ActualUInt64 = ActualNaturalNumber64);
  ActualUInt64 := System.Default(UInt64);
  System.Assert(System.Default(UInt64) = ActualUInt64);
  ActualUInt64 := ActualNaturalNumber64;
  System.Assert(Expected = ActualUInt64);
end;

{ExecutableSpecification_BigNaturalNumber.Boundaries}
class procedure ExecutableSpecification_BigNaturalNumber.Boundaries.Exercise;
begin
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs18446744073709551615();
end;

class procedure ExecutableSpecification_BigNaturalNumber.Boundaries.TheHighestPossibleNumberIs18446744073709551615;
begin
  System.Assert(18446744073709551615 = System.High(BigNaturalNumber));
end;

class procedure ExecutableSpecification_BigNaturalNumber.Boundaries.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(BigNaturalNumber));
end;

{ExecutableSpecification_BigNaturalNumber.Defaults}
class procedure ExecutableSpecification_BigNaturalNumber.Defaults.Exercise;
begin
  ValueIsZero();
end;

class procedure ExecutableSpecification_BigNaturalNumber.Defaults.ValueIsZero;
begin
  System.Assert(0 = System.Default(BigNaturalNumber));
end;

{ExecutableSpecification_BigNaturalNumber.TypeIdentity}
class procedure ExecutableSpecification_BigNaturalNumber.TypeIdentity.Exercise;
begin
  HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeUInt64();
end;

class procedure ExecutableSpecification_BigNaturalNumber.TypeIdentity.HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeUInt64;
begin
  TypeEquivalenceInquiry<BigNaturalNumber>.HasANonNullSystemDotTypeInfoValue();
  TypeEquivalenceInquiry<BigNaturalNumber>.DoesNotShareTypeIdentityWith<UInt64>();
end;
{$ENDREGION}

{$REGION 'Digit'}
{ExecutableSpecification_Digit}
class procedure ExecutableSpecification_Digit.Exercise;
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  Defaults.Exercise();
  TypeIdentity.Exercise();
end;

{ExecutableSpecification_Digit.AssignmentCompatibility.Exercise}
class procedure ExecutableSpecification_Digit.AssignmentCompatibility.Exercise();
begin
  IsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeWhileRetainingNaturalNumberValues_ForAllValuesOfDigit();
end;

class procedure ExecutableSpecification_Digit.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheNaturalNumberTypeWhileRetainingNaturalNumberValues_ForAllValuesOfDigit();
begin
  var ADigit: Digit;
  var ANaturalNumber: NaturalNumber;
  for var I: Digit := System.Low(Digit) to System.High(Digit) do
  begin
    ADigit := I;
    ANaturalNumber := ADigit + 1;
    System.Assert(I = ADigit);
    System.Assert(not (ANaturalNumber = ADigit));
    ANaturalNumber := ADigit;
    System.Assert(ANaturalNumber = ADigit);
    ADigit := ANaturalNumber;
    System.Assert(I = ADigit);
  end;
end;

{ExecutableSpecification_Digit.Boundaries}
class procedure ExecutableSpecification_Digit.Boundaries.Exercise;
begin
  TheLowestPossibleValueIsZero();
  TheHighestPossibleValueIs9();
end;

class procedure ExecutableSpecification_Digit.Boundaries.TheHighestPossibleValueIs9();
begin
  System.Assert(0 = System.Low(Digit));
end;

class procedure ExecutableSpecification_Digit.Boundaries.TheLowestPossibleValueIsZero();
begin
  System.Assert(9 = System.High(Digit));
end;

{ExecutableSpecification_Digit.Defaults}
class procedure ExecutableSpecification_Digit.Defaults.Exercise();
begin
  ValueIsZero();
end;

class procedure ExecutableSpecification_Digit.Defaults.ValueIsZero();
begin
  System.Assert(0 = System.Default(Digit));
end;

{ExecutableSpecification_Digit.TypeIdentity}
class procedure ExecutableSpecification_Digit.TypeIdentity.Exercise();
begin
  HasItsOwnNonNullTypeIdentity();
end;

class procedure ExecutableSpecification_Digit.TypeIdentity.HasItsOwnNonNullTypeIdentity();
begin
  TypeEquivalenceInquiry<Digit>.HasANonNullSystemDotTypeInfoValue();
end;
{$ENDREGION}

{$REGION 'MonoChar'}
{ExecutableSpecification_MonoChar}
class procedure ExecutableSpecification_MonoChar.Exercise;
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  Defaults.Exercise();
  TypeIdentity.Exercise();
end;

{ExecutableSpecification_MonoChar.AssignmentCompatibility}
class procedure ExecutableSpecification_MonoChar.AssignmentCompatibility.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithTheNativeCharWhileRetainingNativeCharValues();
end;

class procedure ExecutableSpecification_MonoChar.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheNativeCharWhileRetainingNativeCharValues;
begin
  var Expected: Char := Rando_TheUntrustworthy.NonDefaultValue<Char>;
  System.Assert(not (System.Default(Char) = Expected));
  var ActualChar := Expected;
  System.Assert(Expected = ActualChar);
  var ActualMonoChar: MonoChar := System.Default(MonoChar);
  System.Assert(not (ActualChar = ActualMonoChar));
  ActualMonoChar := ActualChar;
  System.Assert(ActualChar = ActualMonoChar);
  ActualChar := System.Default(Char);
  System.Assert(not (ActualMonoChar = ActualChar));
  ActualChar := ActualMonoChar;
  System.Assert(Expected = ActualChar);
end;

{ExecutableSpecification_MonoChar.Boundaries}
class procedure ExecutableSpecification_MonoChar.Boundaries.Exercise;
begin
  TheLowestPossibleOrdinalValueIsZero();
  TheHighestPossibleOrdinalValueIs65536();
end;

class procedure ExecutableSpecification_MonoChar.Boundaries.TheHighestPossibleOrdinalValueIs65536;
begin
  System.Assert(System.Ord(65535) = System.Ord(System.High(MonoChar)));
end;

class procedure ExecutableSpecification_MonoChar.Boundaries.TheLowestPossibleOrdinalValueIsZero;
begin
  System.Assert(System.Ord(NativeUInt(0)) = System.Ord(System.Low(MonoChar)));
end;

{ExecutableSpecification_MonoChar.Defaults}
class procedure ExecutableSpecification_MonoChar.Defaults.Exercise;
begin
  ValueIsZero();
end;

class procedure ExecutableSpecification_MonoChar.Defaults.ValueIsZero;
begin
  System.Assert(System.Ord(NativeUInt(0)) = System.Ord(System.Default(MonoChar)));
end;

{ExecutableSpecification_MonoChar.TypeIdentity}
class procedure ExecutableSpecification_MonoChar.TypeIdentity.Exercise;
begin
  HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeChar();
end;

class procedure ExecutableSpecification_MonoChar.TypeIdentity.HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeChar;
begin
  TypeEquivalenceInquiry<MonoChar>.HasANonNullSystemDotTypeInfoValue();
  TypeEquivalenceInquiry<MonoChar>.DoesNotShareTypeIdentityWith<Char>();
end;
{$ENDREGION}

{$REGION 'NaturalNumber'}
{ExecutableSpecification_NaturalNumber}
class procedure ExecutableSpecification_NaturalNumber.Exercise;
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  Defaults.Exercise();
  HelperAddedFunctionality.Exercise();
  TypeIdentity.Exercise();
end;

{ExecutableSpecification_NaturalNumber.AssignmentCompatibility}
class procedure ExecutableSpecification_NaturalNumber.AssignmentCompatibility.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithCardinalWhileRetainingCardinalValues();
end;

class procedure ExecutableSpecification_NaturalNumber.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithCardinalWhileRetainingCardinalValues;
begin
  var Expected: Cardinal := Rando_TheUntrustworthy.NonDefaultValue<Cardinal>;
  System.Assert(not (System.Default(Cardinal) = Expected));
  var ActualCardinal := Expected;
  System.Assert(Expected = ActualCardinal);
  var ActualNaturalNumber: NaturalNumber := System.Default(NaturalNumber);
  System.Assert(not (ActualCardinal = ActualNaturalNumber));
  ActualNaturalNumber := ActualCardinal;
  System.Assert(ActualCardinal = ActualNaturalNumber);
  ActualCardinal := System.Default(Cardinal);
  System.Assert(not (ActualCardinal = ActualNaturalNumber));
  ActualCardinal := ActualNaturalNumber;
  System.Assert(Expected = ActualCardinal);
end;

{ExecutableSpecification_NaturalNumber.Boundaries}
class procedure ExecutableSpecification_NaturalNumber.Boundaries.Exercise;
begin
  Boundaries.TheLowestPossibleValueIsZero();
  Boundaries.TheHighestPossibleNumberIs4294967295();
end;

class procedure ExecutableSpecification_NaturalNumber.Boundaries.TheHighestPossibleNumberIs4294967295;
begin
  System.Assert(4294967295 = System.High(NaturalNumber));
end;

class procedure ExecutableSpecification_NaturalNumber.Boundaries.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber));
end;

{ExecutableSpecification_NaturalNumber.Defaults}
class procedure ExecutableSpecification_NaturalNumber.Defaults.Exercise;
begin
  ValueIsZero();
end;

class procedure ExecutableSpecification_NaturalNumber.Defaults.ValueIsZero;
begin
  System.Assert(0 = System.Default(NaturalNumber));
end;

{ExecutableSpecification_NaturalNumber.HelperAddedFunctionality}
class procedure ExecutableSpecification_NaturalNumber.HelperAddedFunctionality.Exercise;
begin
  TheMaxPropertyReturns4294967295ForADefaultInstance();
  TheMaxPropertyReturns4294967295ForANonDefaultInstance();
  TheMinPropertyReturnsZeroForADefaultInstance();
  TheMinPropertyReturnsZeroForANonDefaultInstance
end;

class procedure ExecutableSpecification_NaturalNumber.HelperAddedFunctionality.TheMaxPropertyReturns4294967295ForADefaultInstance;
begin
  var Value: NaturalNumber := System.Default(NaturalNumber);
  System.Assert(System.Default(NaturalNumber) = Value);
  System.Assert(4294967295 = Value.Max);
end;

class procedure ExecutableSpecification_NaturalNumber.HelperAddedFunctionality.TheMaxPropertyReturns4294967295ForANonDefaultInstance;
begin
  var Value: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (System.Default(NaturalNumber) = Value));
  System.Assert(4294967295 = Value.Max);
end;

class procedure ExecutableSpecification_NaturalNumber.HelperAddedFunctionality.TheMinPropertyReturnsZeroForADefaultInstance;
begin
  var Value: NaturalNumber := System.Default(NaturalNumber);
  System.Assert(System.Default(NaturalNumber) = Value);
  System.Assert(0 = Value.Min);
end;

class procedure ExecutableSpecification_NaturalNumber.HelperAddedFunctionality.TheMinPropertyReturnsZeroForANonDefaultInstance;
begin
  var Value: NaturalNumber := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();
  System.Assert(not (System.Default(NaturalNumber) = Value));
  System.Assert(0 = Value.Min);
end;

{ExecutableSpecification_NaturalNumber.TypeIdentity}
class procedure ExecutableSpecification_NaturalNumber.TypeIdentity.Exercise;
begin
  HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeCardinal();
end;

class procedure ExecutableSpecification_NaturalNumber.TypeIdentity.HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeCardinal;
begin
  TypeEquivalenceInquiry<NaturalNumber>.HasANonNullSystemDotTypeInfoValue();
  TypeEquivalenceInquiry<NaturalNumber>.DoesNotShareTypeIdentityWith<Cardinal>();
end;
{$ENDREGION}

end.
