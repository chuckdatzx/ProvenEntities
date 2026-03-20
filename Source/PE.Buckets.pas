unit PE.Buckets;

interface

type
  Buckets = record
  type
    InclusionRoutineA<T> = function (const AValue: T): Boolean;
    InclusionRoutine<T> = reference to function (const AValue: T): Boolean;
    TLabelType = string;
    TPredictionCount = UInt32;
  type
    BucketIn<T> = record
    strict private
      FInclusionRoutine: InclusionRoutine<T>;
      FLabel: string;
      FPredictionCount: TPredictionCount;
    private
      class operator Initialize(out Dest: BucketIn<T>);
      class operator Equal(const A, B: BucketIn<T>): Boolean;
    public
      property _Label: string read FLabel write FLabel;
      property InclusionRoutine: InclusionRoutine<T> read FInclusionRoutine write FInclusionRoutine;
      property PredictionCount: TPredictionCount read FPredictionCount write FPredictionCount;
    public
      constructor Create(const InclusionRoutine: InclusionRoutine<T>; const PredictionCount: NativeUInt = 0; const ALabel: string = '');
    end;
    BucketOut = record
    private
      FLabel: string;
      FPredictionCount: TPredictionCount;
      FRecordedCount: UInt32;
      class operator Equal(const A, B: BucketOut): Boolean;
    public
      class operator Initialize(out Dest: BucketOut);
    public
      constructor Create(const PredictionCount: NativeUInt; const RecordedCount: NativeUInt = 0; const ALabel: string = '');
      property _Label: string read FLabel write FLabel;
      property PredictionCount: TPredictionCount read FPredictionCount write FPredictionCount;
      property RecordedCount: UInt32 read FRecordedCount write FRecordedCount;
    end;
    //Do not alter any code in the following SUT template class unless you are capable of authoring the associated unit tests in their entirety
    SUTTypeMapping<T> = class
    //Basically declares standards and creates closed types from the generic type T
    type
      BUCKET_IN_LABEL_TYPE = PE.Buckets.Buckets.TLabelType;
      BUCKET_IN_PREDICTION_COUNT_TYPE = PE.Buckets.Buckets.TPredictionCount;
    type
      BUCKET_IN_TYPE = PE.Buckets.Buckets.BucketIn<T>;
      BUCKET_IN_INCLUSION_ROUTINE_TYPE = PE.Buckets.Buckets.InclusionRoutine<T>;
    end;
  public
    class function SortDataCollectionXIntoCustomBucketsY<Q>(const X: array of Q; const Y: TArray<BucketIn<Q>>): TArray<BucketOut>; static;
  end;

implementation

{ Buckets.BucketIn<T> }

constructor Buckets.BucketIn<T>.Create(const InclusionRoutine: InclusionRoutine<T>; const PredictionCount: NativeUInt; const ALabel: string);
begin
  FInclusionRoutine := InclusionRoutine;
  FPredictionCount := PredictionCount;
  FLabel := ALabel;
end;

class operator Buckets.BucketIn<T>.Equal(const A, B: BucketIn<T>): Boolean;
begin
  Result := (A.InclusionRoutine = B.InclusionRoutine) and (A._Label = B._Label) and (A.PredictionCount = B.PredictionCount);
end;

class operator Buckets.BucketIn<T>.Initialize(out Dest: BucketIn<T>);
begin
  Dest.FLabel := '';
  Dest.FInclusionRoutine := nil;
  Dest.FPredictionCount := 0;
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
  if (Length(X) > 0) then
    for I := Low(X) to High(X) do
      for J := Low(Y) to High(Y) do
        if Assigned(Y[J].InclusionRoutine) then
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

class operator Buckets.BucketOut.Equal(const A, B: BucketOut): Boolean;
begin
  Result := (a.FLabel = b.FLabel) and (a.FPredictionCount = b.FPredictionCount) and (a.FRecordedCount = b.FRecordedCount);
end;

class operator Buckets.BucketOut.Initialize(out Dest: BucketOut);
begin
  //Dest.FLabel := '';
  Dest.FPredictionCount := 0;
  Dest.FRecordedCount := 0;
end;

end.
