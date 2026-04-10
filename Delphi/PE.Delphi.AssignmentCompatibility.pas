unit PE.Delphi.AssignmentCompatibility;
{
All of the following can only be considered as valid as your compiler and my interpretation of
https://docwiki.embarcadero.com/RADStudio/Florence/en/Type_Compatibility_and_Identity_(Delphi)

If you find any problems, please let me know and I'll fix them.}
interface

type
  GenericRecordsOf<TypeUnderTest> = record
  public
    class function AreSymmetricallyAssignmentCompatible(): Boolean; static; inline;
  end;

implementation

{GenericRecordsOf<TypeUnderTest>}
class function GenericRecordsOf<TypeUnderTest>.AreSymmetricallyAssignmentCompatible(): Boolean;
begin
  var Left: GenericRecordsOf<TypeUnderTest>;
  var Right: GenericRecordsOf<TypeUnderTest>;
  Left := Right;
  Right := Left;
  Result := True;
end;

end.
