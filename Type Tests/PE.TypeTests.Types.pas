unit PE.TypeTests.Types;
{Chuck C.T.
 Keep in mind that pretty much everything from in here is defined from an intuitionistic perspective.
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
  TypeIdentity<TypeUnderTest> = record
  public
    class procedure HasANonNullSystemDotTypeInfoValue(); static; inline;
  end;

  NaturalNumber_TypeTests = record
  public {Domain Tests}
    class procedure TheLowestPossibleValueIsZero(); static; inline;
    class procedure TheHighestPossibleNumberIs4294967295(); static; inline; //4,294,967,295
  public
    class procedure IsNotTypeIdenticialToACardinalTypeButIsSymmetricallyAssignmentCompatible(); static; inline;
  end;

  NaturalNumber32_TypeTests = record
  public {Domain Tests}
    class procedure TheLowestPossibleValueIsZero(); static; inline;
    class procedure TheHighestPossibleNumberIs4294967295(); static; inline; //4,294,967,295
  end;

  NaturalNumber64_TypeTests = record
  public {Domain Tests}
    class procedure TheLowestPossibleValueIsZero(); static; inline;
    class procedure TheHighestPossibleNumberIs18446744073709551615(); static; inline; //Approximately 18.45 quintillion
  public
    class procedure IsNotTypeIdenticialToTheUInt64TypeButIsSymmetricallyAssignmentCompatible(); static; inline;
  end;

implementation

uses
  {PE System}
  PE.TypeTests.Delphi.TypeIdentity.Proven.AtCompileTime,
  {PE SUT}
  PE.Types;

{ Exercise }

class procedure AllTests.Exercise();
begin
  {Domain Tests}
  NaturalNumber_TypeTests.TheLowestPossibleValueIsZero();
  NaturalNumber_TypeTests.TheHighestPossibleNumberIs4294967295();
  NaturalNumber_TypeTests.IsNotTypeIdenticialToACardinalTypeButIsSymmetricallyAssignmentCompatible();
  NaturalNumber32_TypeTests.TheLowestPossibleValueIsZero();
  NaturalNumber32_TypeTests.TheHighestPossibleNumberIs4294967295();
  NaturalNumber64_TypeTests.TheLowestPossibleValueIsZero();
  NaturalNumber64_TypeTests.TheHighestPossibleNumberIs18446744073709551615();
  NaturalNumber64_TypeTests.IsNotTypeIdenticialToTheUInt64TypeButIsSymmetricallyAssignmentCompatible();
  {Delphi Tests}
  TypeIdentity<NaturalNumber>.HasANonNullSystemDotTypeInfoValue();
  TypeIdentity<NaturalNumber32>.HasANonNullSystemDotTypeInfoValue();
  TypeIdentity<NaturalNumber64>.HasANonNullSystemDotTypeInfoValue();
end;

class procedure NaturalNumber_TypeTests.IsNotTypeIdenticialToACardinalTypeButIsSymmetricallyAssignmentCompatible;
begin
  System.Assert(SystemDotTypeInfoProducesNonNullTypeInfoAtCompileTime);
  System.Assert(System.TypeInfo(Cardinal) <> System.TypeInfo(NaturalNumber));
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

{ TypeIdentity<TypeUnderTest> }

class procedure TypeIdentity<TypeUnderTest>.HasANonNullSystemDotTypeInfoValue;
begin
  System.Assert(SystemDotTypeInfoProducesNonNullTypeInfoAtCompileTime);
  System.Assert(System.Assigned(System.TypeInfo(TypeUnderTest)));
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

class procedure NaturalNumber64_TypeTests.IsNotTypeIdenticialToTheUInt64TypeButIsSymmetricallyAssignmentCompatible;
begin
  System.Assert(SystemDotTypeInfoProducesNonNullTypeInfoAtCompileTime);
  System.Assert(System.TypeInfo(UInt64) <> System.TypeInfo(NaturalNumber64));
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

end.
