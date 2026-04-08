unit PE.Delphi.Rando;

interface

uses
  {Delphi}
  System.RTTI,
  System.TypInfo;

type
  Rando = record
  public
    class function NonDefaultValue<T>(): T; static; inline;
  end;

implementation

{ Rando }

class function Rando.NonDefaultValue<T>: T;
begin
  System.Assert(System.GetTypeKind(T) = tkInteger, 'Rando is not prepared for any other type kind than tkInteger');
  var ATypeInfo: PTypeInfo := System.TypeInfo(T);
  System.Assert(System.Assigned(ATypeInfo), 'Rando cannot continue because the provided type T does not seem to generate type info');
  var ATypeData := GetTypeData(ATypeInfo);
  System.Assert(System.Assigned(ATypeData), 'Rando cannot continue because the provided type T does not seem to have type data');
  var AValue := TValue.Empty;
  case ATypeData.OrdType of
    TOrdType.otSByte, TOrdType.otUByte: AValue := TValue.FromOrdinal(ATypeInfo, Random(256) + 1);
    TOrdType.otSWord, TOrdType.otUWord: AValue := TValue.FromOrdinal(ATypeInfo, Random(65536) + 1);
    TOrdType.otSLong, TOrdType.otULong: AValue := TValue.FromOrdinal(ATypeInfo, Random(MaxInt) + 1);
  else
    System.Assert(False, 'Rando does not have a complete enough understanding of the TOrdType')
  end;
  Result := AValue.AsType<T>();
  System.Assert(Result <> System.Default(T), 'Rando cannot return a value (non-default value = default value)');
end;

end.
