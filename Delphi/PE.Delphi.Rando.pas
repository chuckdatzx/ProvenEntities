unit PE.Delphi.Rando;

interface

uses
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
  public
    class function NonDefaultValue<T>(): T; static; inline;
  end;

implementation

{ Rando }

class function Rando_TheUntrustworthy.NonDefaultValue<T>: T;
begin
  Result := System.Default(T);
  var ATypeInfo: PTypeInfo := System.TypeInfo(T);
  System.Assert(System.Assigned(ATypeInfo), 'Rando cannot continue because the provided type T does not seem to generate type info');
  case System.GetTypeKind(T) of
    tkInteger, tkWideChar:
      begin
        var ATypeData := GetTypeData(ATypeInfo);
        System.Assert(System.Assigned(ATypeData), 'Rando cannot continue because the provided type T does not seem to have type data');
        case ATypeData.OrdType of
          TOrdType.otSByte, TOrdType.otUByte: Result := TValue.FromOrdinal(ATypeInfo, Random(256) + 1).AsType<T>();
          TOrdType.otSWord, TOrdType.otUWord: Result := TValue.FromOrdinal(ATypeInfo, Random(65536) + 1).AsType<T>();
          TOrdType.otSLong, TOrdType.otULong: Result := TValue.FromOrdinal(ATypeInfo, Random(MaxInt) + 1).AsType<T>();
        else
          System.Assert(False, 'Rando does not have a complete enough understanding of the TOrdType')
        end;
      end;
    tkInt64: Result := TValue.From<UInt64>((UInt64(Random32Proc) shl 32) or UInt64(Random32Proc)).AsType<T>();
  else
    System.Assert(False, 'Rando is not prepared for type kinds other than [tkInteger, tkInt64, tkWideChar]');
  end;
  System.Assert(Result <> System.Default(T), 'Rando cannot tell a lie (non-default value = default value)');
end;

end.
