unit PE.Actors.Rando;
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
  PE.Routines,
  PE.Types,
  {Delphi}
  System.RTTI,
  System.TypInfo;

type
  ///<summary>Rando currently exists to add some variety into the boring world of System.Default()</summary>
  ///<notes>While attempting to prove out behaviors for simple generic algorithms(i.e. simple categorization by value),
  /// I noticed that I couldn't do much at the type level. Well, that is until I was able to draw a distinction
  /// between default and non-default values. That opens up a whole new chapter of what can be tested at the type level.
  /// Later still, I realized "Why stop with default/non-default values when you could generate random ones and go further?"
  /// For now, Rando has an unfortunate title. I should consider adding proof for Rando. But until then, the title stays.</notes>
  Rando_TheUntrustworthy = record
  public type RandoNonDefaultValueRequest = 2..10;
  strict private
    class function SingleNonDefaultValue<T>: T; static; inline;
  public
    class function DistinctNonDefaultValues<T>(const Count: RandoNonDefaultValueRequest): ArrayOf<T>; static; inline;
    class function NonDefaultValue<T>(): T; static; inline;
  end;

implementation

uses
  {PE}
  PE.Types.Composite,
  {Delphi}
  System.SysUtils;

{Rando_TheUntrustworthy}
class function Rando_TheUntrustworthy.NonDefaultValue<T>: T;
begin
  Result := SingleNonDefaultValue<T>();
end;

class function Rando_TheUntrustworthy.DistinctNonDefaultValues<T>(const Count: RandoNonDefaultValueRequest): ArrayOf<T>;
const RetryCeiling = 10;
begin
  { TODO -oChuck -cToDo : Validate that the Count parameter isn't greater than what is possible for T }
  System.Assert(Count > 1, 'Use the NonDefaultValue<T> member for single non-default values');
  System.Assert(Count < 11, 'The NonDefaultValues<T> member is currently limited to 10 random non-default values');
  var BundleAquired: Boolean;
  var Retries: NaturalNumber := 0;
  repeat
    Result := [];
    for var I: NaturalNumber := 1 to Count do
      Result := Result + [NonDefaultValue<T>()];
    BundleAquired := (System.Length(Result) = System.Length(DataStream.UniqueElements<T>(Result)));
    Retries := Retries + 1;
  until BundleAquired or (Retries > RetryCeiling);
  if (not BundleAquired) then
    System.Assert(Retries > RetryCeiling, 'Rando experienced too many retries');
  System.Assert(Ord(Count) = System.Length(Result), Format('The number of expected elements (%d) is not the same as actual (%d)', [Count, System.Length(Result)]));
end;

class function Rando_TheUntrustworthy.SingleNonDefaultValue<T>: T;
begin
  Result := System.Default(T);
  var ATypeInfo: PTypeInfo := System.TypeInfo(T);
  System.Assert(System.Assigned(ATypeInfo), 'Rando cannot continue because the provided type T does not seem to generate type info');
  var ATypeInfoName: TSymbolName := ATypeInfo.Name;
  case System.GetTypeKind(T) of
    tkInteger, tkWideChar:
      begin
        var ATypeData := GetTypeData(ATypeInfo);
        System.Assert(System.Assigned(ATypeData), 'Rando cannot continue because the provided type T does not seem to have type data');
        case ATypeData.OrdType of
          TOrdType.otSByte, TOrdType.otUByte: Result := TValue.FromOrdinal(ATypeInfo, Random(255) + 1).AsType<T>();
          TOrdType.otSWord, TOrdType.otUWord: Result := TValue.FromOrdinal(ATypeInfo, Random(65535) + 1).AsType<T>();
          TOrdType.otSLong, TOrdType.otULong: Result := TValue.FromOrdinal(ATypeInfo, Random(MaxInt) + 1).AsType<T>();
        else
          System.Assert(False, 'Rando does not have a complete enough understanding of the TOrdType')
        end;
      end;
    tkInt64: Result := TValue.From<UInt64>((UInt64(Random32Proc) shl 32) or UInt64(Random32Proc)).AsType<T>();
    tkRecord:
      if (System.TypeInfo(MultiChar) = System.TypeInfo(T)) then
        Result := TValue.From<MultiChar>(MultiChar.Create(TGUID.NewGuid().ToString)).AsType<T>()
      else
        System.Assert(False, 'Rando only understands how to handle MultiChar record types');
    tkUnicodeString: Result := TValue.From<string>(TGUID.NewGuid().ToString).AsType<T>();
  else
    System.Assert(False, 'Rando is not prepared for type kinds other than [tkInteger, tkInt64, rkRecord, tkWideChar, tkUnicodeString]');
  end;
  System.Assert(Result <> System.Default(T), 'Rando cannot tell a lie (non-default value = default value) :: T = ' + ATypeInfoName);
end;

end.
