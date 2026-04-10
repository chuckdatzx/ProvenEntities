unit PE.Types.Composite;

interface

uses
  {PE}
  PE.Types.Foundational;

type
  ArrayOf<T> = array of T;

type
  MultiChar = record
  strict private
    class function SameContent(const Left, Right: ArrayOf<MonoChar>): Boolean; inline; static;
    class function ToMonoCharArray(const AString: string): ArrayOf<MonoChar>; inline; static;
  public
    class operator Equal(const Left, Right: MultiChar): Boolean; static; inline;
    class operator Implicit(const Source: string): MultiChar; static; inline;
  strict private
    FData: ArrayOf<MonoChar>;
    function AsArrayOfMonoChar(): ArrayOf<MonoChar>; inline;
  strict private
    function GetMonoChar(const Index: NativeInt): MonoChar;
  public
    constructor Create(const Content: string);
    property ArrayOfMonoChar: ArrayOf<MonoChar> read AsArrayOfMonoChar;  //Required by others; still needs testing
    property MonoChars[const &Index: NativeInt]: MonoChar read GetMonoChar; default;  //Required by others; still needs testing
  end;

type
  SmartClaw<T> = reference to function (const AValue: T): Boolean;

implementation

{MultiChar}
function MultiChar.AsArrayOfMonoChar: ArrayOf<MonoChar>;
begin
  Result := FData;
end;

constructor MultiChar.Create(const Content: string);
begin
  FData := ToMonoCharArray(Content);
end;

class operator MultiChar.Equal(const Left, Right: MultiChar): Boolean;
begin
  Result := (@Left = @Right);
  if (not Result) then
    Result := SameContent(Left.FData, Right.FData);
end;

function MultiChar.GetMonoChar(const Index: NativeInt): MonoChar;
begin
  Result := FData[Index];
end;

class function MultiChar.SameContent(const Left, Right: ArrayOf<MonoChar>): Boolean;
begin
  Result := (System.Length(Left) = System.Length(Right));
  if Result then
    for var I: NativeInt := System.Low(Left) to System.High(Left) do
      if (Left[I] <> Right[I]) then
        Exit(False);
end;

class operator MultiChar.Implicit(const Source: string): MultiChar;
begin
  Result.FData := ToMonoCharArray(Source);
end;

class function MultiChar.ToMonoCharArray(const AString: string): ArrayOf<MonoChar>;
begin
  Result := [];
  for var Each: Char in AString do
    Result := Result + [Each];
end;

end.
