unit PE.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime;
{Chuck C.T.
Full Declaration of Transparency:
You should only consider the code under test proven insofar as you agree with everything presented
(and by "everything presented", I mean from the scope of the compiler all the way through to
your custom code based on entities from this unit).

I'm truly not trying to scare anyone off. I'm perfectly comfortable calling the following proven;
and I have researched from the compiler to my code. I'm simply recommending that you do the same
and not just assume, without pause, that it is unbreakable.

All of the following can only be considered as valid as your compiler and my interpretation of
https://docwiki.embarcadero.com/RADStudio/Florence/en/Type_Compatibility_and_Identity_(Delphi)

If you don't agree with everything you see in this source code unit, then please don't assume that anything has been proven here.
If you find any problems, please let me know and I'll fix them.}
interface

uses
  {PE}
  PE.Delphi.TypeIdentity.Proven.AtCompileTime;

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
                3) from an abstraction-based/conceptual perspective, I think it's safe to say that everyone knows that Boolean means

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

end.
