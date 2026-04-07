unit PE.Types;
{Chuck C.T.
 The type names and what said types represent may not match what you currently think of as intuition;
 especially if you started from a Pascal/Object Pascal/Delphi background like I did.
}
interface

type {Foundational Types}
  ArrayOf<T> = array of T;
  NaturalNumber = type Cardinal;
  NaturalNumber32 = NaturalNumber;
  NaturalNumber64 = type UInt64;

type
  ArrayOf = class sealed
  public
    class function UniqueElements<T>(const DataStream: ArrayOf<T>): ArrayOf<T>; inline;
  end;

type
  SmartClaw<T> = reference to function (const AValue: T): Boolean;

implementation

uses
  {Delphi}
  System.Generics.Collections;

{ ArrayOf<T> }

class function ArrayOf.UniqueElements<T>(const DataStream: ArrayOf<T>): ArrayOf<T>;
begin
  Result := [];
  for var Each: T in DataStream do
    if (not TArray.Contains<T>(Result, Each)) then
      Result := Result + [Each];
end;

end.
