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
  PE.ImplicitlyTrusted.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime,
  PE.ImplicitlyTrusted.Delphi.AssignmentCompatibility.GenericRecords.Proven.AtCompileTime,
  {PE System}
  PE.Types;

{$IF IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime and
 IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime}

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
  ///<summary>Simple input container for bucket-related operations</summary>
  BucketIn<T> = record
  strict private
    FGrabbyArm: SmartClaw<T>;
    FName: string;
    FPrediction: NaturalNumber;
  public
    property GrabbyArm: SmartClaw<T> read FGrabbyArm write FGrabbyArm;
    property Name: string read FName write FName;
    property Prediction: NaturalNumber read FPrediction write FPrediction;
  public
    constructor Create(const GrabbyArm: SmartClaw<T>; const Name: string = ''; const Prediction: NaturalNumber = Default(NaturalNumber));
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
    ///<summary>Iterates each element of the provided data stream while giving each bucket has a chance to determine inclusion (using whatever you put into place for the "grabby arm")</summary>
    class function Categorize<T>(const DataStream: ArrayOf<T>; const Buckets: ArrayOf<BucketIn<T>>): ArrayOf<BucketOut>; static; inline;
    { TODO -oChuck -cPotential Feature :
An obvious feature upgrade would be to extend the "mouth" of the Categorize<T> routine.
For example, instead of just accepting a data stream of ArrayOf<T>, consider things like a TField instance,
or possible TStream descendants. }
  end;

{$IFEND}

implementation

{$IF IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime and
 IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime}

{ BucketIn<T> }

constructor BucketIn<T>.Create(const GrabbyArm: SmartClaw<T>; const Name: string; const Prediction: NaturalNumber);
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

class function Routines.Categorize<T>(const DataStream: ArrayOf<T>; const Buckets: ArrayOf<BucketIn<T>>): ArrayOf<BucketOut>;
var
  SmartBuckets: ArrayOf<BucketIn<T>>;
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
  Result := System.TypeInfo(SmartClaw<T>);
end;

class function TypeTestHarness.BucketIn<T>.NameProperty_SystemDotTypeInfo: Pointer;
begin
  Result := System.TypeInfo(string);
end;

class function TypeTestHarness.BucketIn<T>.PredictionProperty_SystemDotTypeInfo: Pointer;
begin
  Result := System.TypeInfo(NaturalNumber);
end;

{ TypeTestHarness.BucketOut }

class function TypeTestHarness.BucketOut.CountProperty_SystemDotTypeInfo: Pointer;
begin
  Result := System.TypeInfo(NaturalNumber);
end;

class function TypeTestHarness.BucketOut.NameProperty_SystemDotTypeInfo: Pointer;
begin
  Result := System.TypeInfo(string);
end;

{$IFEND}

end.
