unit PE.Buckets;

interface

uses
  {Delphi}
  System.SysUtils;

{$REGION 'Type Test Harness'}
type
  ///<summary>Essentially here to minimize the distance between tests and SUT</summary>
  ///<remarks>If I come up with a means of retrieving a type definition from a record's property; there's no longer a need for this entity</remarks>
  TypeTestHarness = record
  public type
    BucketIn<T> = record
    public
      class function GrabbyArmProperty_SystemDotTypeInfo(): Pointer; static; inline;
      class function NameProperty_SystemDotTypeInfo(): Pointer; static; inline;
      class function PredictionProperty_SystemDotTypeInfo(): Pointer; static; inline;
    end;
    BucketOut = record
    public
      class function CountProperty_SystemDotTypeInfo(): Pointer; static; inline;
      class function NameProperty_SystemDotTypeInfo(): Pointer; static; inline;
    end;
  end;
{$ENDREGION}

type
  ///<summary>Means of counting for bucket-related operations</summary>
  BucketTally = Cardinal;
  ///<summary>Provides a customizable means for adding "brains" to a BucketIn{T} instance</summary>
  GrabbyArmBrains<T> = reference to function (const AValue: T): Boolean;

type
  ///<summary>Simple input container for bucket-related operations</summary>
  BucketIn<T> = record
  strict private
    FGrabbyArm: GrabbyArmBrains<T>;
    FName: string;
    FPrediction: BucketTally;
  public
    property GrabbyArm: GrabbyArmBrains<T> read FGrabbyArm write FGrabbyArm;
    property Name: string read FName write FName;
    property Prediction: BucketTally read FPrediction write FPrediction;
  public
    constructor Create(const GrabbyArm: GrabbyArmBrains<T>; const Name: string = ''; const Prediction: BucketTally = Default(BucketTally));
  end;

  ///<summary>Contains results of operations performed on a BucketIn{T} instance</summary>
  BucketOut = record
  strict private
    FCount: BucketTally;
    FName: string;
  public
    class operator Equal(const A: BucketOut; const B: BucketOut): Boolean; static; inline;
  public
    property Count: BucketTally read FCount write FCount;
    property Name: string read FName write FName;
  end;

  Routines = record
  public
    ///<summary>Iterates each element of the provided data stream while giving each bucket has a chance to determine inclusion (using whatever you put into place for the "grabby arm")</summary>
    class function Categorize<T>(const DataStream: TArray<T>; const Buckets: TArray<BucketIn<T>>): TArray<BucketOut>; static; inline;
  end;

implementation

{ BucketIn<T> }

constructor BucketIn<T>.Create(const GrabbyArm: GrabbyArmBrains<T>; const Name: string; const Prediction: BucketTally);
begin
  FGrabbyArm := GrabbyArm;
  FName := Name;
  FPrediction := Prediction;
end;

{ BucketOut }

class operator BucketOut.Equal(const A: BucketOut; const B: BucketOut): Boolean;
begin
  Result := (@A = @B);
  if (not Result) then
    Result := (A.Count = B.Count) and (A.Name = B.Name);
end;

class function Routines.Categorize<T>(const DataStream: TArray<T>; const Buckets: TArray<BucketIn<T>>): TArray<BucketOut>;
var
  SmartBuckets: TArray<BucketIn<T>>;
begin
  Result := [];
  SmartBuckets := [];
  var I: NativeInt;
  for I := Low(Buckets) to High(Buckets) do
  begin
    Result := Result + [Default(BucketOut)];
    Result[High(Result)].Name := Buckets[I].Name;
    if Assigned(Buckets[I].GrabbyArm) then
      SmartBuckets := SmartBuckets + [Buckets[I]];
  end;
  var J: NativeInt;
  for I := Low(DataStream) to High(DataStream) do
    for J := Low(SmartBuckets) to High(SmartBuckets) do
      if SmartBuckets[J].GrabbyArm(DataStream[I]) then
        Result[J].Count := Result[J].Count + 1;
end;

{ TypeTestHarness.BucketIn }

class function TypeTestHarness.BucketIn<T>.GrabbyArmProperty_SystemDotTypeInfo: Pointer;
begin
  Result := System.TypeInfo(GrabbyArmBrains<T>);
end;

class function TypeTestHarness.BucketIn<T>.NameProperty_SystemDotTypeInfo: Pointer;
begin
  Result := System.TypeInfo(string);
end;

class function TypeTestHarness.BucketIn<T>.PredictionProperty_SystemDotTypeInfo: Pointer;
begin
  Result := System.TypeInfo(BucketTally);
end;

{ TypeTestHarness.BucketOut }

class function TypeTestHarness.BucketOut.CountProperty_SystemDotTypeInfo: Pointer;
begin
  Result := System.TypeInfo(BucketTally);
end;

class function TypeTestHarness.BucketOut.NameProperty_SystemDotTypeInfo: Pointer;
begin
  Result := System.TypeInfo(string);
end;

end.
