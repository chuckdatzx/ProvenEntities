unit PE.Delphi.TypeIdentity;

interface

type
  AnyTypeWhichWillNotProduceTypeInfo=set of 1..2;
  {Uncomment the line below and visually verify that it makes the IDE/compiler unhappy. Once you've verified that, add back the "//" you just removed.}
  //{$IF (System.TypeInfo(AnyTypeWhichWillNotProduceTypeInfo) = System.TypeInfo(AnyTypeWhichWillNotProduceTypeInfo))} {$IFEND}

type
  A=record end;
  B=record end;

const
  {$IF (System.TypeInfo(A) = System.TypeInfo(A)) and (System.TypeInfo(B) = System.TypeInfo(B)) and (System.TypeInfo(A) <> System.TypeInfo(B))}
  SystemDotTypeInfoProducesNonNullTypeInfoAtCompileTime = True;
  SystemDotTypeInfoWillDistinguishBetweenIdenticallyDeclaredTraditionalRecordTypesAtCompileTime = True;
  {$ELSE}
  SystemDotTypeInfoProducesNonNullTypeInfoAtCompileTime = False;
  SystemDotTypeInfoWillDistinguishBetweenIdenticallyDeclaredTraditionalRecordTypesAtCompileTime = False;
  {$IFEND}

  {$IF SystemDotTypeInfoProducesNonNullTypeInfoAtCompileTime and SystemDotTypeInfoWillDistinguishBetweenIdenticallyDeclaredTraditionalRecordTypesAtCompileTime}
  DelphiTypeIdentityEstablishedAtCompileTime = True;
  {$ELSE}
  DelphiTypeIdentityEstablishedAtCompileTime = False;
  {$ENDIF}

{$IF (not DelphiTypeIdentityEstablishedAtCompileTime)}
   {$MESSAGE FATAL 'Unable to continue without compile-time proof established.'}
{$ENDIF}

type
  ///<summary>Delphi specific entity for establishing facts about TypeUnderTest</summary>
  TypeEquivalenceInquiry<TypeUnderTest> = record
  public
    class procedure DoesNotShareTypeIdentityWith<ThisGuy>(); static; inline;
    class procedure HasANonNullSystemDotTypeInfoValue(); static; inline;
    class procedure SharesTypeIdentityWith<ThisGuy>(); static; inline;
  end;

type
  T=ByteBool;
  G<T>=record end;
  Y=G<T>;
  Z=G<T>;

const
  {$IF System.TypeInfo(Y) = System.TypeInfo(Z))}
  IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime = True;
  {$ELSE}
  IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime = False;
  {$IFEND}


implementation

{TypeEquivalenceInquiry<TypeUnderTest>}
class procedure TypeEquivalenceInquiry<TypeUnderTest>.DoesNotShareTypeIdentityWith<ThisGuy>;
begin
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

end.
