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
  end;

  BucketOut = record
  strict private
    FCount: BucketTally;
    FName: string;
  public
    property Count: BucketTally read FCount write FCount;
    property Name: string read FName write FName;
  end;

  Routines = record
  public
    class function Categorize<T>(const DataStream: TArray<T>; const Buckets: TArray<BucketIn<T>>): TArray<BucketOut>; static; inline;
  end;

implementation

class function Routines.Categorize<T>(const DataStream: TArray<T>; const Buckets: TArray<BucketIn<T>>): TArray<BucketOut>;
begin

end;

end.
