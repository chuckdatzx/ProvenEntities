unit PE.Tests.FoundationalTypes;

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
  MonoCharTests = record
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
  NaturalNumberTests = record
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

{AllTests.Exercise}

class procedure AllTests.Exercise();
begin
  MonoCharTests.Exercise();
  NaturalNumberTests.Exercise();
  NaturalNumber32Tests.Exercise();
  NaturalNumber64Tests.Exercise();
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
  IsSymmetricallyAssignmentCompatibleWithCardinalWhileRetainingCardinalValues();
end;

class procedure NaturalNumberTests.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithCardinalWhileRetainingCardinalValues;
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
  IsSymmetricallyAssignmentCompatibleWithUInt64WhileRetainingUInt64Value();
end;

class procedure NaturalNumber64Tests.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithUInt64WhileRetainingUInt64Value;
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

{ MonoCharTests.AssignmentCompatibility }

class procedure MonoCharTests.AssignmentCompatibility.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithTheNativeCharWhileRetainingNativeCharValues();
end;

class procedure MonoCharTests.AssignmentCompatibility.IsSymmetricallyAssignmentCompatibleWithTheNativeCharWhileRetainingNativeCharValues;
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

{ MonoCharTests }

class procedure MonoCharTests.Exercise;
begin
  MonoCharTests.AssignmentCompatibility.Exercise();
  MonoCharTests.Boundaries.Exercise();
  MonoCharTests.Defaults.Exercise();
  MonoCharTests.TypeIdentity.Exercise();
end;

{ MonoCharTests.Boundaries }

class procedure MonoCharTests.Boundaries.Exercise;
begin
  TheLowestPossibleOrdinalValueIsZero();
  TheHighestPossibleOrdinalValueIs65536();
end;

class procedure MonoCharTests.Boundaries.TheHighestPossibleOrdinalValueIs65536;
begin
  System.Assert(System.Ord(65535) = System.Ord(System.High(MonoChar)));
end;

class procedure MonoCharTests.Boundaries.TheLowestPossibleOrdinalValueIsZero;
begin
  System.Assert(System.Ord(NativeUInt(0)) = System.Ord(System.Low(MonoChar)));
end;

{ MonoCharTests.Defaults }

class procedure MonoCharTests.Defaults.Exercise;
begin
  ValueIsZero();
end;

class procedure MonoCharTests.Defaults.ValueIsZero;
begin
  System.Assert(System.Ord(NativeUInt(0)) = System.Ord(System.Default(MonoChar)));
end;

{ MonoCharTests.TypeIdentity }

class procedure MonoCharTests.TypeIdentity.Exercise;
begin
  HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeChar();
end;

class procedure MonoCharTests.TypeIdentity.HasItsOwnTypeIdentityAndIsNotTypeIdenticalToTheNativeChar;
begin
  TypeEquivalenceInquiry<MonoChar>.HasANonNullSystemDotTypeInfoValue();
  TypeEquivalenceInquiry<MonoChar>.DoesNotShareTypeIdentityWith<Char>();
end;

end.
