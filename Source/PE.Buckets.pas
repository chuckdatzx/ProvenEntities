unit PE.Buckets;
{Chuck C.T.
Full Declaration of Transparency:
You should only consider the code under test proven insofar as you agree with everything presented
(and by "everything presented", I mean from the scope of the compiler all the way through to
your custom code based on entities from this unit).

I'm truly not trying to scare anyone off. I'm perfectly comfortable calling the following proven;
and I have researched from the compiler to my code. I'm simply recommending that you do the same
and not just assume, without pause, that it is unbreakable.}
interface

uses
  {PE Assertions}
  PE.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime,
  PE.Delphi.AssignmentCompatibility.GenericRecords.Proven.AtCompileTime,
  {PE System}
  PE.Types;

{$IF (not IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime) or
 (not IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime)}
   {$MESSAGE FATAL 'Unable to continue without compile-time assertions established.'}
{$ENDIF}

type
  ///<summary>Simple input container for bucket-related operations</summary>
  BucketIn<T> = record
  strict private
    FGrabbyArm: SmartClaw<T>;
    FName: string;
    FPrediction: NaturalNumber;
  public
    class operator Equal(const Left, Right: BucketIn<T>): Boolean; static; inline;
  public
    property GrabbyArm: SmartClaw<T> read FGrabbyArm write FGrabbyArm;
    property Name: string read FName write FName;
    property Prediction: NaturalNumber read FPrediction write FPrediction;
  public
    constructor Create(const GrabbyArm: SmartClaw<T>; const Name: string = System.Default(string); const Prediction: NaturalNumber = System.Default(NaturalNumber));
  end;

  ///<summary>Contains results of operations performed on a BucketIn{T} instance</summary>
  BucketOut = record
  strict private
    FCount: NaturalNumber;
    FName: string;
  public
    class operator Equal(const A: BucketOut; const B: BucketOut): Boolean; static; inline;
  public
    property Count: NaturalNumber read FCount write FCount;
    property Name: string read FName write FName;
  end;

  Routines = record
  public
    ///<summary>Iterates each element of the provided data stream while giving each bucket a chance to determine inclusion (using whatever you put into place for the "grabby arm")</summary>
    class function Categorize<T>(const DataStream: ArrayOf<T>; const Buckets: ArrayOf<BucketIn<T>>): ArrayOf<BucketOut>; static; inline;
  end;

implementation

{ BucketIn<T> }

constructor BucketIn<T>.Create(const GrabbyArm: SmartClaw<T>; const Name: string; const Prediction: NaturalNumber);
begin
  FGrabbyArm := GrabbyArm;
  FName := Name;
  FPrediction := Prediction;
end;

class operator BucketIn<T>.Equal(const Left, Right: BucketIn<T>): Boolean;
begin
  Result := (@Left = @Right);
  if (not Result) then
    Result := (Left.GrabbyArm = Right.GrabbyArm) and (Left.Name = Right.Name) and (Left.Prediction = Right.Prediction);
end;

{ BucketOut }

class operator BucketOut.Equal(const A: BucketOut; const B: BucketOut): Boolean;
begin
  Result := (@A = @B);
  if (not Result) then
    Result := (A.Count = B.Count) and (A.Name = B.Name);
end;

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
