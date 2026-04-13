unit PE.Routines;
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

uses
  {PE}
  PE.Types.Foundational.Generics;

type
  DataStream = class sealed
  public
    ///<summary>Returns true if any single occurrence of Value T is present in ADataStream</summary>
    class function Contains<T>(const ADataStream: ArrayOf<T>; const Value: T): Boolean; inline; static;
    ///<summary>Returns an array of T where duplicate values in ADataStream are removed</summary>
    class function UniqueElements<T>(const ADataStream: ArrayOf<T>): ArrayOf<T>; inline; static;
  end;

implementation

{ DataStream }

class function DataStream.Contains<T>(const ADataStream: ArrayOf<T>; const Value: T): Boolean;
begin
  Result := False;
  for var Each: T in ADataStream do
    if (Each = Value) then
      Exit(True);
end;

class function DataStream.UniqueElements<T>(const ADataStream: ArrayOf<T>): ArrayOf<T>;
begin
  Result := [];
  for var Each: T in ADataStream do
    if (not Contains<T>(Result, Each)) then
      Result := Result + [Each];
end;

end.
