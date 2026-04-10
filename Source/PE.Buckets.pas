unit PE.Buckets;

interface

uses
  {PE}
  PE.Delphi.AssignmentCompatibility,
  PE.Delphi.TypeIdentity,
  PE.Types.Composite,
  PE.Types.Foundational;

{$IF (not DelphiTypeIdentityEstablishedAtCompileTime)}
   {$MESSAGE FATAL 'Unable to continue without compile-time proof established.'}
{$ENDIF}

{$IF (not IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime)}
   {$MESSAGE FATAL 'Unable to continue without compile-time proof established.'}
{$ENDIF}

type
  ///<summary>Simple input container for bucket-related operations</summary>
  BucketIn<T> = record
  strict private
    FGrabbyArm: SmartClaw<T>;
    FName: MultiChar;
    FPrediction: NaturalNumber;
    procedure SetName(const Value: MultiChar);
  public
    class constructor Create();
  public
    class operator Equal(const Left, Right: BucketIn<T>): Boolean; static; inline;
  public
    property GrabbyArm: SmartClaw<T> read FGrabbyArm write FGrabbyArm;
    property Name: MultiChar read FName write SetName;
    property Prediction: NaturalNumber read FPrediction write FPrediction;
  public
    constructor Create(const GrabbyArm: SmartClaw<T>; const Name: MultiChar; const Prediction: NaturalNumber = System.Default(NaturalNumber));
  end;

  ///<summary>Contains results of operations performed on a BucketIn{T} instance</summary>
  BucketOut = record
  strict private
    FCount: NaturalNumber;
    FName: MultiChar;
    procedure SetName(const Value: MultiChar);
  public
    class operator Equal(const A: BucketOut; const B: BucketOut): Boolean; static; inline;
  public
    property Count: NaturalNumber read FCount write FCount;
    property Name: MultiChar read FName write SetName;
  end;

  Routines = record
  public
    ///<summary>Iterates each element of the provided data stream while giving each bucket a chance to determine inclusion (using whatever code you put into place for the grabby arm)</summary>
    class function Categorize<T>(const DataStream: ArrayOf<T>; const Buckets: ArrayOf<BucketIn<T>>): ArrayOf<BucketOut>; static; inline;
  end;

implementation

{BucketIn<T>}
constructor BucketIn<T>.Create(const GrabbyArm: SmartClaw<T>; const Name: MultiChar; const Prediction: NaturalNumber);
begin
  FGrabbyArm := GrabbyArm;
  FName := Name;
  FPrediction := Prediction;
end;

class constructor BucketIn<T>.Create;
begin
  System.Assert(GenericRecordsOf<T>.AreSymmetricallyAssignmentCompatible());
end;

class operator BucketIn<T>.Equal(const Left, Right: BucketIn<T>): Boolean;
begin
  Result := (@Left = @Right);
  if (not Result) then
    Result := (Left.GrabbyArm = Right.GrabbyArm) and (Left.Name = Right.Name) and (Left.Prediction = Right.Prediction);
end;

procedure BucketIn<T>.SetName(const Value: MultiChar);
begin
  FName := Value;
end;

{BucketOut}
class operator BucketOut.Equal(const A: BucketOut; const B: BucketOut): Boolean;
begin
  Result := (@A = @B);
  if (not Result) then
    Result := (A.Count = B.Count) and (A.Name = B.Name);
end;

procedure BucketOut.SetName(const Value: MultiChar);
begin
  FName := Value;
end;

{Routines}
class function Routines.Categorize<T>(const DataStream: ArrayOf<T>; const Buckets: ArrayOf<BucketIn<T>>): ArrayOf<BucketOut>;
var
  SmartBuckets: ArrayOf<BucketIn<T>>;
begin
  Result := [];
  SmartBuckets := [];
  for var I: NativeInt := Low(Buckets) to High(Buckets) do
  begin
    Result := Result + [Default(BucketOut)];
    Result[High(Result)].Name := Buckets[I].Name;
    if Assigned(Buckets[I].GrabbyArm) then
      SmartBuckets := SmartBuckets + [Buckets[I]];
  end;
  for var I: NativeInt := Low(DataStream) to High(DataStream) do
    for var J: NativeInt := Low(SmartBuckets) to High(SmartBuckets) do
      if SmartBuckets[J].GrabbyArm(DataStream[I]) then
        Result[J].Count := Result[J].Count + 1;
end;

end.
