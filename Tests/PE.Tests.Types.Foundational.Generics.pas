unit PE.Tests.Types.Foundational.Generics;

interface

uses
  PE.Delphi.TypeIdentity;

{$IF (not PE.Delphi.TypeIdentity.DelphiTypeIdentityEstablishedAtCompileTime)}
   {$MESSAGE FATAL 'Unable to continue without compile-time assertions established.'}
{$ENDIF}

type
  AllTests = record
  public
    class procedure Exercise(); static; inline;
  end;

  {$REGION 'ArrayOf<T> type'}
  ExecutableSpecification_ArrayOf<TypeUnderTest_Outer> = record
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

implementation

uses
  PE.Types.Foundational,
  PE.Types.Foundational.Generics;

{AllTests}
class procedure AllTests.Exercise;
begin
  {Foundational Generic types by Foundational types}
  ExecutableSpecification_ArrayOf<Digit>.Exercise();
  ExecutableSpecification_ArrayOf<MonoChar>.Exercise();
  ExecutableSpecification_ArrayOf<NaturalNumber>.Exercise();
  {$IFDEF CPU64BITS}
  ExecutableSpecification_ArrayOf<BigNaturalNumber>.Exercise();  //Currently causes (F2084 Internal Error: C2252) in Win32 platform
  {$ELSE}
    {$MESSAGE WARN 'PE.Types.ArrayOf<T> cannot be proven for the BigNaturalNumber type (other NaturalNumber variations are proven)'}
  {$IFEND}
end;

{$REGION 'ArrayOf<T> type'}
{ExecutableSpecification_ArrayOf<TypeUnderTest_Outer>}
class procedure ExecutableSpecification_ArrayOf<TypeUnderTest_Outer>.Exercise;
begin
  AssignmentOperator<TypeUnderTest_Outer>.Exercise();
  Defaults<TypeUnderTest_Outer>.Exercise();
  TypeIdentity<TypeUnderTest_Outer>.Exercise();
end;

{ExecutableSpecification_ArrayOf<TypeUnderTest_Outer>.AssignmentOperator<TypeUnderTest>}
class procedure ExecutableSpecification_ArrayOf<TypeUnderTest_Outer>.AssignmentOperator<TypeUnderTest>.Exercise;
begin
  IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesElements();
end;

class procedure ExecutableSpecification_ArrayOf<TypeUnderTest_Outer>.AssignmentOperator<TypeUnderTest>.IsSymmetricallyAssignmentCompatibleWithItselfAndCopiesElements();
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

{ExecutableSpecification_ArrayOf<TypeUnderTest_Outer>.Defaults<TypeUnderTest>}
class procedure ExecutableSpecification_ArrayOf<TypeUnderTest_Outer>.Defaults<TypeUnderTest>.Exercise;
begin
  IsInitializedToAnEmptyCollectionOfElements();
end;

class procedure ExecutableSpecification_ArrayOf<TypeUnderTest_Outer>.Defaults<TypeUnderTest>.IsInitializedToAnEmptyCollectionOfElements;
begin
  var Actual: ArrayOf<TypeUnderTest> := System.Default(ArrayOf<TypeUnderTest>);
  System.Assert(0 = System.Length(Actual));
end;

{ExecutableSpecification_ArrayOf<TypeUnderTest_Outer>.TypeIdentity<TypeUnderTest>}
class procedure ExecutableSpecification_ArrayOf<TypeUnderTest_Outer>.TypeIdentity<TypeUnderTest>.Exercise;
begin
  SharesTypeIdentityWithTArray();
end;

class procedure ExecutableSpecification_ArrayOf<TypeUnderTest_Outer>.TypeIdentity<TypeUnderTest>.SharesTypeIdentityWithTArray();
begin
  TypeEquivalenceInquiry<ArrayOf<TypeUnderTest>>.SharesTypeIdentityWith<TArray<TypeUnderTest>>();
end;
{$ENDREGION}

end.
