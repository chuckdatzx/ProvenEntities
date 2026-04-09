unit PE.Delphi.TypeIdentity;
{Chuck C.T.
Full Declaration of Transparency:
You should only consider the code under test proven insofar as you agree with everything presented
(and by "everything presented", I mean from the scope of the compiler all the way through to
your custom code based on entities from this unit).

I'm truly not trying to scare anyone off. I'm perfectly comfortable calling the following proven;
and I have researched from the compiler to my code. I'm simply recommending that you do the same
and not just assume, without pause, that it is unbreakable.}
interface

type
  AnyTypeWhichWillNotProduceTypeInfo=set of 1..2;
  {At the time of writing this, I am assuming that the compiler CAN stop compilation if it determines that the System.TypeInfo routine will not
   generate type info for type T. In order to verify that assertion, I'll need some crowd participation, so to speak.
   TLDR: Uncomment the line below and visually verify that it makes the IDE/compiler unhappy. Once you've verified that, add back the "//" you just removed.}
  //{$IF (System.TypeInfo(AnyTypeWhichWillNotProduceTypeInfo) = System.TypeInfo(AnyTypeWhichWillNotProduceTypeInfo))} {$IFEND}

type
  A=record end;
  B=record end;
  {Give the above types A and B, I am making the following assumptions:
   1) A and B are records
   2) A and B are valid types according to your context (IDE, IDE/compiler, etc.)
   3) A and B are declared in the same type block
   4) A and B, though not identically named, do have identical type definitions (i.e. the stuff on the right side of the '=')
   5) Neither A nor B can be minimized, because if we were to do so, compilation wouldn't be possible
  }
const
  {$IF (System.TypeInfo(A) = System.TypeInfo(A)) and (System.TypeInfo(B) = System.TypeInfo(B)) and (System.TypeInfo(A) <> System.TypeInfo(B))}
  //If my assumptions are correct so far, then everything you're reading right now is being ignored by compilation (lol, you know, if it weren't already commented out).
  //If you can agree with everything presented so far, then I think we can agree that the following is true
  SystemDotTypeInfoProducesNonNullTypeInfoAtCompileTime = True;
  SystemDotTypeInfoWillDistinguishBetweenIdenticallyDeclaredTraditionalRecordTypesAtCompileTime = True;
  {$ELSE}
  SystemDotTypeInfoProducesNonNullTypeInfoAtCompileTime = False;
  SystemDotTypeInfoWillDistinguishBetweenIdenticallyDeclaredTraditionalRecordTypesAtCompileTime = False;
  {$IFEND}

{$IF SystemDotTypeInfoProducesNonNullTypeInfoAtCompileTime and SystemDotTypeInfoWillDistinguishBetweenIdenticallyDeclaredTraditionalRecordTypesAtCompileTime}
type
  ///<summary>Delphi specific entity for establishing facts about TypeUnderTest</summary>
  TypeEquivalenceInquiry<TypeUnderTest> = record
  public
    class procedure DoesNotShareTypeIdentityWith<ThisGuy>(); static; inline;
    class procedure HasANonNullSystemDotTypeInfoValue(); static; inline;
    class procedure SharesTypeIdentityWith<ThisGuy>(); static; inline;
  end;
{$IFEND}

{$IF SystemDotTypeInfoProducesNonNullTypeInfoAtCompileTime and
  SystemDotTypeInfoWillDistinguishBetweenIdenticallyDeclaredTraditionalRecordTypesAtCompileTime}
type
  G<T>=record end;
  {Here is my intent with the above type:
    G<T> = the minimum possible definition to establish any generic record type in Delphi
    If you have a better one, please let me know so that I can fix it!}

  T=ByteBool;  {The "simplest type" I could come up with (I'm claiming "simplest type" based on the following):
                1) from a structural/engineering/"hard science" perspective, everyone knows what a byte is
                2) from a "legal" perspective, we know that ByteBool is a simple type 'cause it's defined as such by the product's own documentation
                3) from an abstraction-based/conceptual perspective, I think it's safe to say that everyone knows what Boolean means

                However...

                Overall, the point I'm trying to make here is that the specific type of T doesn't matter. And if what I think is the "simplest type",
                doesn't match your idea of "simplest type", don't sweat it. Just replace ByteBool with whatever other CLOSED Delphi type (I'm only
                saying closed because I haven't investigated that direction yet) that does feel right to you.
                }
  Y=G<T>;
  Z=G<T>;
{$IFEND}

const
  {$IF System.TypeInfo(Y) = System.TypeInfo(Z))}
  IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime = True;
  {$ELSE}
  IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime = False;
  {$IFEND}


implementation

{$IF SystemDotTypeInfoProducesNonNullTypeInfoAtCompileTime and SystemDotTypeInfoWillDistinguishBetweenIdenticallyDeclaredTraditionalRecordTypesAtCompileTime}
{TypeEquivalenceInquiry<TypeUnderTest>}
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
{$IFEND}

end.
