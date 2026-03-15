unit PE.Buckets;

interface

uses
  {Delphi}
  System.SysUtils;

type
  Buckets = record
  type
    BucketIn<T> = record
    strict private
      FPredictionCount: UInt32;
      FInclusionRoutine: TFunc<T, Boolean>;
      FLabel: string;
    public
      property _Label: string read FLabel;
      property PredictionCount: UInt32 read FPredictionCount;
      property InclusionRoutine: TFunc<T, Boolean> read FInclusionRoutine;
    public
      constructor Create(const InclusionRoutine: TFunc<T, Boolean>; const ExpectedCount: NativeUInt = 0; const ALabel: string = '');
    end;
    BucketOut = record
    private
      FPredictionCount: UInt32;
      FLabel: string;
      FRecordedCount: UInt32;
    public
      constructor Create(const PredictionCount: NativeUInt; const RecordedCount: NativeUInt = 0; const ALabel: string = '');
      property _Label: string read FLabel;
      property PredictionCount: UInt32 read FPredictionCount;
      property RecordedCount: UInt32 read FRecordedCount;
    end;
  public
    class function SortDataCollectionXIntoCustomBucketsY<Q>(const X: array of Q; const Y: TArray<BucketIn<Q>>): TArray<BucketOut>; static;
  end;

implementation

{ Buckets.BucketIn<T> }

constructor Buckets.BucketIn<T>.Create(const InclusionRoutine: TFunc<T, Boolean>; const ExpectedCount: NativeUInt; const ALabel: string);
begin
  FInclusionRoutine := InclusionRoutine;
  FPredictionCount := ExpectedCount;
  FLabel := ALabel;
end;

{ Buckets }

class function Buckets.SortDataCollectionXIntoCustomBucketsY<Q>(const X: array of Q; const Y: TArray<BucketIn<Q>>): TArray<BucketOut>;
var
  I: NativeInt;
  J: NativeInt;
begin
  //Initialization
  Result := [];
  for I := Low(Y) to High(Y) do
    Result := Result + [BucketOut.Create(Y[I].PredictionCount, 0, Y[I]._Label)];
  //
  for I := Low(X) to High(X) do
    for J := Low(Y) to High(Y) do
      if Y[J].InclusionRoutine(X[I]) then
        Result[J].FRecordedCount := Result[J].FRecordedCount + 1;
end;

{ Buckets.BucketOut }

constructor Buckets.BucketOut.Create(const PredictionCount: NativeUInt; const RecordedCount: NativeUInt; const ALabel: string);
begin
  FLabel := ALabel;
  FPredictionCount := PredictionCount;
  FRecordedCount := RecordedCount;
end;

end.
