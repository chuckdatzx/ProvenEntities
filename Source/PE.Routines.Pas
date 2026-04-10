unit PE.Routines;

interface

uses
  {PE}
  PE.Types.Composite;

type
  DataStream = class sealed
  public
    class function UniqueElements<T>(const ADataStream: ArrayOf<T>): ArrayOf<T>; inline;
  end;

implementation

uses
  {Delphi}
  System.Generics.Collections;

{ DataStream }

class function DataStream.UniqueElements<T>(const ADataStream: ArrayOf<T>): ArrayOf<T>;
begin
  Result := [];
  for var Each: T in ADataStream do
    if (not TArray.Contains<T>(Result, Each)) then
      Result := Result + [Each];
end;

end.
