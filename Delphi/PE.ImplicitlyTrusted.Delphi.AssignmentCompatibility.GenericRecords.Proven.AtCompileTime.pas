unit PE.ImplicitlyTrusted.Delphi.AssignmentCompatibility.GenericRecords.Proven.AtCompileTime;
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
  PE.ImplicitlyTrusted.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime;

{$IF IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime}
const
  IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime = True;

procedure ProvingThePoint();
{$ELSE}
const
  IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime = False;
{$IFEND}

implementation

{$IF IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime}
procedure ProvingThePoint();
begin
  var X: G<T>;
  var Y: G<T>;
  X := Y;
  Y := X;
end;
{$IFEND}

end.
