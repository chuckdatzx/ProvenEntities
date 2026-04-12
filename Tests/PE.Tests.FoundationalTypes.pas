unit PE.Tests.FoundationalTypes;
{Chuck C.T.
 I'm arguing that the following tests provide enough evidence to claim that all types in PE.Types.Foundational unit are proven. And by proven, I mean proven for:
 - usage within any compilable source code from the PE namespace
 - usage within Delphi (at least where PE type X has been proven to be compatible with native type Y)
 - for all foundational types for all time; if it compiles and successfully runs now, it will continue to do so (like a powered circuit; barring events like power loss)

 If you don't believe that the PE.Types.Foundational namespace has been proven; that's fair. There are many points in
 my own life where I would have laughed at someone making such a claim and just moved on.
 However, if you truly disagree with me, please take the time show me where I'm wrong. I've put quite a bit of thought into
 the following; it seems unlikley that any given 1 person is going to find a problem at first glance (though I certainly
 could be wrong about that).
}
interface

uses
  {PE}
  PE.Delphi.Rando,
  PE.Delphi.TypeIdentity,
  PE.Types.Foundational;

type
  AllTests = record
  public
    class procedure Exercise(); static; inline;
  end;

type
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
  ExecutableSpecification_NaturalNumber32 = record
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
  ExecutableSpecification_NaturalNumber64 = record
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

implementation

{AllTests}
class procedure AllTests.Exercise();
begin
  ExecutableSpecification_MonoChar.Exercise();
  ExecutableSpecification_NaturalNumber.Exercise();
  ExecutableSpecification_NaturalNumber32.Exercise();
  ExecutableSpecification_NaturalNumber64.Exercise();
end;

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

{ExecutableSpecification_NaturalNumber}
class procedure ExecutableSpecification_NaturalNumber.Exercise;
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  Defaults.Exercise();
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

{ExecutableSpecification_NaturalNumber32}
class procedure ExecutableSpecification_NaturalNumber32.Exercise;
begin
  TypeIdentity.Exercise();
end;

{ExecutableSpecification_NaturalNumber32.TypeIdentity}
class procedure ExecutableSpecification_NaturalNumber32.TypeIdentity.Exercise;
begin
  IsTypeIdenticalToTheNaturalNumber();
end;

class procedure ExecutableSpecification_NaturalNumber32.TypeIdentity.IsTypeIdenticalToTheNaturalNumber;
begin
  TypeEquivalenceInquiry<NaturalNumber32>.SharesTypeIdentityWith<NaturalNumber>();
end;

{ExecutableSpecification_NaturalNumber64}
class procedure ExecutableSpecification_NaturalNumber64.Exercise;
begin
  AssignmentCompatibility.Exercise();
  Boundaries.Exercise();
  Defaults.Exercise();
  TypeIdentity.Exercise();
end;

{ExecutableSpecification_NaturalNumber64.AssignmentCompatibility}
class procedure ExecutableSpecification_NaturalNumber64.AssignmentCompatibility.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithUInt64WhileRetainingUInt64Value();
end;

class procedure ExecutableSpecification_NaturalNumber64.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithUInt64WhileRetainingUInt64Value;
begin
  var Expected: UInt64 := Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>();  //Using the NaturalNumber64 type causes a F2084 interna Error: C2252; so I'm using NaturalNumber instead
  var ActualUInt64 := Expected;
  System.Assert(not (System.Default(UInt64) = ActualUInt64));
  var ActualNaturalNumber64: NaturalNumber64 := System.Default(NaturalNumber64);
  System.Assert(not (ActualUInt64 = ActualNaturalNumber64));
  ActualNaturalNumber64 := ActualUInt64;
  System.Assert(ActualUInt64 = ActualNaturalNumber64);
  ActualUInt64 := System.Default(UInt64);
  System.Assert(System.Default(UInt64) = ActualUInt64);
  ActualUInt64 := ActualNaturalNumber64;
  System.Assert(Expected = ActualUInt64);
end;

{ExecutableSpecification_NaturalNumber64.Boundaries}
class procedure ExecutableSpecification_NaturalNumber64.Boundaries.Exercise;
begin
  TheLowestPossibleValueIsZero();
  TheHighestPossibleNumberIs18446744073709551615();
end;

class procedure ExecutableSpecification_NaturalNumber64.Boundaries.TheHighestPossibleNumberIs18446744073709551615;
begin
  System.Assert(18446744073709551615 = System.High(NaturalNumber64));
end;

class procedure ExecutableSpecification_NaturalNumber64.Boundaries.TheLowestPossibleValueIsZero;
begin
  System.Assert(0 = System.Low(NaturalNumber64));
end;

{ExecutableSpecification_NaturalNumber64.Defaults}
class procedure ExecutableSpecification_NaturalNumber64.Defaults.Exercise;
begin
  ValueIsZero();
end;

class procedure ExecutableSpecification_NaturalNumber64.Defaults.ValueIsZero;
begin
  System.Assert(0 = System.Default(NaturalNumber64));
end;

{ExecutableSpecification_NaturalNumber64.TypeIdentity}
class procedure ExecutableSpecification_NaturalNumber64.TypeIdentity.Exercise;
begin
  HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeUInt64();
end;

class procedure ExecutableSpecification_NaturalNumber64.TypeIdentity.HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeUInt64;
begin
  TypeEquivalenceInquiry<NaturalNumber64>.HasANonNullSystemDotTypeInfoValue();
  TypeEquivalenceInquiry<NaturalNumber64>.DoesNotShareTypeIdentityWith<UInt64>();
end;

end.
