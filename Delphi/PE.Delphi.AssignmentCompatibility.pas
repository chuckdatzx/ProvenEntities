unit PE.Delphi.AssignmentCompatibility;
{$ASSERTIONS ON}
{$BOOLEVAL OFF}
{$DEFINITIONINFO ON}
{$DENYPACKAGEUNIT ON}
{$EXTENDEDSYNTAX ON}
{$HIGHCHARUNICODE ON}
{$HINTS ON}
{$IMPLICITBUILD OFF}
{$IMPORTEDDATA OFF}
{$IOCHECKS ON}
{$LOCALSYMBOLS ON}
{$OPTIMIZATION ON}
{$POINTERMATH OFF}
{$RANGECHECKS ON}
{$REFERENCEINFO ON}
{$SCOPEDENUMS ON}
{$STACKFRAMES OFF}
{$WARNINGS ON}
{$WRITEABLECONST OFF}
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
