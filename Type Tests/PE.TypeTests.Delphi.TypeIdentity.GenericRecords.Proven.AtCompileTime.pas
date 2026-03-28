unit PE.TypeTests.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime;
{Chuck C.T.
Full Declaration of Transparency:
All of the following can only be considered as valid as your compiler and my interpretation of
https://docwiki.embarcadero.com/RADStudio/Florence/en/Type_Compatibility_and_Identity_(Delphi)

If you don't agree with everything you see in this source code unit, then please don't assume that anything has been proven here.
If you find any problems, please let me know and I'll fix them.
}

//All of this would be much simpler if I just knew of a compile-time means of testing for assignment (specifically, assignment of a pointer [if that detail even matters])!

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
  {$IF (System.TypeInfo(A) = System.TypeInfo(A)) and (System.TypeInfo(B) = System.TypeInfo(B)) and (System.TypeInfo(A) = System.TypeInfo(B))}
  SystemDotTypeInfoWillDistinguishBetweenIdenticallyDeclaredRecordTypes_A_And_BAtCompileTime = False;
  //If my assumptions are correct so far, then everything you're reading right now is being ignored by compilation (lol, you know, if it weren't already commented out).
  //If you can agree with everything presented so far, then I think we can agree that the following is true
  {$ELSE}
  SystemDotTypeInfo_WillDistinguish_BetweenIdenticallyDeclaredRecordTypes_AtCompileTime = True;
  {$IFEND}

type
  G<T>=record end;
  {Here is my intent with the above type:
    G<T> = the minimum possible definition to establish any generic record type in Delphi
    If you have a better one, please let me know so that I can fix it!}

  T=ByteBool;  {The "simplest type" I could come up with (I'm claiming "simplest type" based on the following):
                1) from a structural/engineering/"hard science" perspective, everyone knows what a byte is
                2) from a "legal" perspective, we know that ByteBool is a simple type 'cause it's defined as such by the product's own documentation
                3) from an abstraction-based/conceptual perspective, I think it's safe to say that everyone knows that Boolean means

                However...

                Overall, the point I'm trying to make here is that the specific type of T doesn't matter. And if what I think is the "simplest type",
                doesn't match your idea of "simplest type", don't sweat it. Just replace ByteBool with whatever other CLOSED Delphi type (I'm only
                saying closed because I haven't investigated that direction yet) that does feel right to you.
                }
  Y=G<T>;
  Z=G<T>;

const
  {$IF SystemDotTypeInfo_WillDistinguish_BetweenIdenticallyDeclaredRecordTypes_AtCompileTime}
    {$IF (System.TypeInfo(Y) = System.TypeInfo(Y)) and (System.TypeInfo(Z) = System.TypeInfo(Z)) and (System.TypeInfo(Y) = System.TypeInfo(Z))}
    SystemDotTypeInfoWillGenerateIdenticalNonNullTypeInfoForIdenticallyDeclaredGenericsAtCompileTime = True;
    {$ELSE}
    SystemDotTypeInfoWillGenerateIdenticalNonNullTypeInfoForIdenticallyDeclaredGenericsAtCompileTime = False;
    {$IFEND}
  {$IFEND}

const
  IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime =
    SystemDotTypeInfo_WillDistinguish_BetweenIdenticallyDeclaredRecordTypes_AtCompileTime and
      SystemDotTypeInfoWillGenerateIdenticalNonNullTypeInfoForIdenticallyDeclaredGenericsAtCompileTime;

implementation

end.
