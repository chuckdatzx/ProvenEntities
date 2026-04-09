unit PE.Delphi.AssignmentCompatibility;
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

type
  GenericRecordsOf<TypeUnderTest> = record
  public
    class function AreSymmetricallyAssignmentCompatible(): Boolean; static; inline;
  end;

implementation

{ GenericRecordsOf }

class function GenericRecordsOf<TypeUnderTest>.AreSymmetricallyAssignmentCompatible(): Boolean;
begin
  var Left: GenericRecordsOf<TypeUnderTest>;
  var Right: GenericRecordsOf<TypeUnderTest>;
  Left := Right;
  Right := Left;
  Result := True;
end;

end.
