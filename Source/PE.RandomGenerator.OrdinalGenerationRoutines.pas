unit PE.RandomGenerator.OrdinalGenerationRoutines;

interface

uses
  {Delphi}
  System.SysUtils;

type
  RNG_Standard_Generation_Routines = record
  strict private
    class function RandomFrom<T>(const Values: array of T): T; static;
  public
    class function RandomRoutineFromQAndForQ<Q: record>(): TFunc<Q>; static;
  {$REGION 'Ordinal Types'}
  public
    class function RandomBoolean(): Boolean; static;
  public {Platform-Independent Integer Types}
    class function RandomCardinal(): Cardinal; static; inline; {A.K.A. Random 32-bit Value}
    class function RandomInteger(): Integer; static;
    class function RandomInt64(): Int64; static;
    class function RandomUInt64(): UInt64; static;
  public {Platform-Dependent Integer Types}
    class function RandomLongInt(): LongInt; static;
    class function RandomLongWord(): LongWord; static;
    class function RandomNativeInt(): NativeInt; static;
    class function RandomNativeUInt(): NativeUInt; static;
  {$ENDREGION}
  end;

implementation

uses
  {Delphi}
  System.Math,
  System.Rtti,
  System.TypInfo;

{ RNG_Standard_Generation_Routines }

class function RNG_Standard_Generation_Routines.RandomBoolean: Boolean;
begin
  Result := RandomFrom<Boolean>([False, True]);
end;

class function RNG_Standard_Generation_Routines.RandomCardinal: Cardinal;
begin
  Assert(Assigned(Random32Proc), 'Unable to continue because the System.Random32Proc variable is not assigned');
  Result := Random32Proc();
end;

class function RNG_Standard_Generation_Routines.RandomFrom<T>(const Values: array of T): T;
var
  RandomIndex: Integer;
  ValuesLength: NativeInt;
begin
  //Initialization
  ValuesLength := Length(Values);
  //Validation
  Assert(ValuesLength > 1, 'Unable to continue because the Values array does not have at least 2 values (impossible to randomize because the same single value is always returned)');
  Assert(ValuesLength <= (MaxInt - 1), 'Unable to continue because the Values array contains 1 too many values (the last item in Values would never be selected)');
  //
  RandomIndex := Random(ValuesLength);
  Assert(RandomIndex >= Low(Values), Format('Unable to continue because the random index (%d) is outside of the lower boundary of the Values array',[RandomIndex]));
  Assert(RandomIndex <= High(Values), Format('Unable to continue because the random index (%d) is outside of the upper boundary of the Values array (%d)',[RandomIndex, High(Values)]));
  Result := Values[RandomIndex];
end;

class function RNG_Standard_Generation_Routines.RandomInt64: Int64;
begin
  Result := Int64(RandomUInt64());
end;

class function RNG_Standard_Generation_Routines.RandomInteger: Integer;
begin
  Result := Integer(RandomCardinal());
end;

class function RNG_Standard_Generation_Routines.RandomLongInt: LongInt;
begin
  {$IF defined(CPUX86) or defined(MSWINDOWS)}
  Result := RandomInteger();
  {$ELSE}
    Result := Default(LongInt);
    {$MESSAGE Warn 'Not implemented'}
  {$ENDIF}
end;

class function RNG_Standard_Generation_Routines.RandomLongWord: LongWord;
begin
  {$IF defined(CPUX86) or defined(MSWINDOWS)}
  Result := RandomCardinal();
  {$ELSE}
    Result := Default(LongWord);
    {$MESSAGE Warn 'Not implemented'}
  {$ENDIF}
end;

class function RNG_Standard_Generation_Routines.RandomNativeInt: NativeInt;
begin
  {$IF defined(CPUX86)}
  Result := RandomInteger();
  {$ELSEIF defined(CPUX64)}
    Result := RandomInt64();
    {$ELSE}
      Result := Default(NativeInt);
      {$MESSAGE Warn 'Not implemented'}
  {$ENDIF}
end;

class function RNG_Standard_Generation_Routines.RandomNativeUInt: NativeUInt;
begin
  {$IF defined(CPUX86)}
  Result := RandomCardinal();
  {$ELSEIF defined(CPUX64)}
  Result := RandomUInt64();
  {$ELSE}
    Result := Default(NativeUInt);
    {$MESSAGE Warn 'Not implemented'}
  {$ENDIF}
end;

class function RNG_Standard_Generation_Routines.RandomRoutineFromQAndForQ<Q>: TFunc<Q>;
var
  AType: TRttiType;
  I: NativeInt;
  MaxValue: Integer;
  MinValue: Integer;
  X: TValue;
  Z: TRttiEnumerationType;
  SomeValue: Q;
begin
  Result := nil;
  X := TValue.From<Q>(Default(Q));
  if (X.Kind = tkEnumeration) then
  begin
    AType := TRTTIContext.Create.GetType(TypeInfo(Q));
    Z := (AType as TRttiEnumerationType);
    MinValue := Z.MinValue;
    MaxValue := Z.MaxValue;
    Result := function (): Q
      var
        RandomValue: Integer;
        TempValue: TValue;
      begin
        RandomValue := RandomRange(MinValue, MaxValue + 1);
        TValue.Make(RandomValue, TypeInfo(Q), TempValue);
        Result := TempValue.AsType<Q>();
      end;
  end;
end;

class function RNG_Standard_Generation_Routines.RandomUInt64: UInt64;
begin
  Result := (UInt64(RandomCardinal()) shl 32) or UInt64(RandomCardinal());
end;

end.
