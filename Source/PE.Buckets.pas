unit PE.Buckets;

interface

uses
  {Delphi}
  System.SysUtils;  //Only required for TArray<T> type; could be removed if I'm willing to live w/signature changes

type
  BucketTally = Cardinal;
  GrabbyArmBrains<T> = reference to function (const AValue: T): Boolean;

type
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
//    constructor Create(const Name: string = '');
    class function Default(): BucketIn<T>; static; inline;
  end;

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
    class function Categorize<T>(const DataStream: TArray<T>; const Buckets: TArray<BucketIn<T>>): TArray<BucketOut>; static; inline;
  end;

implementation

class function BucketIn<T>.Default(): BucketIn<T>;
begin end;

class operator BucketOut.Equal(const A: BucketOut; const B: BucketOut): Boolean;
begin
  Result := (@A = @B);
  if (not Result) then
    Result := (A.Count = B.Count) and (A.Name = B.Name);
end;

class function Routines.Categorize<T>(const DataStream: TArray<T>; const Buckets: TArray<BucketIn<T>>): TArray<BucketOut>;
var
  I: NativeInt;
begin
  Result := nil;
  for I := Low(Buckets) to High(Buckets) do
  begin
    Result := Result + [Default(BucketOut)];
    Result[High(Result)].Name := Buckets[I].Name;
  end;
end;

end.
