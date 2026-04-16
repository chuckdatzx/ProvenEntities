unit PE.Buckets;
{$ASSERTIONS ON}
{$BOOLEVAL OFF}
{$DEFINITIONINFO ON}
{$DENYPACKAGEUNIT ON}
{$EXTENDEDSYNTAX ON}
{$HIGHCHARUNICODE ON}
{$HINTS ON}
{$IMPLICITBUILD OFF}
{$IMPORTEDDATA OFF}
{$IOCHECKS ON}
{$LOCALSYMBOLS ON}
{$OPTIMIZATION ON}
{$POINTERMATH OFF}
{$RANGECHECKS ON}
{$REFERENCEINFO ON}
{$SCOPEDENUMS ON}
{$STACKFRAMES OFF}
{$WARNINGS ON}
{$WRITEABLECONST OFF}
interface

uses
  {PE}
  PE.Delphi.AssignmentCompatibility,
  PE.Delphi.TypeIdentity,
  PE.Types.Composite,
  PE.Types.Foundational;

{$IF (not DelphiTypeIdentityEstablishedAtCompileTime) or (not IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime)}
   {$MESSAGE FATAL 'Unable to continue without compile-time proof established.'}
{$ENDIF}

type
  ///<summary>Simple input container for bucket-related operations</summary>
  BucketIn<T> = record
  strict private
    FGrabbyArm: SmartClaw<T>;
    FName: MultiChar;
    FPrediction: NaturalNumber;
    function GetHasGrabbyArm(): Boolean; inline;
    procedure SetName(const Value: MultiChar); inline;
  public
    class constructor Create();
  public
    class operator Equal(const Left, Right: BucketIn<T>): Boolean; static; inline;
  public
    property GrabbyArm: SmartClaw<T> read FGrabbyArm write FGrabbyArm;
    property Name: MultiChar read FName write SetName;
    property Prediction: NaturalNumber read FPrediction write FPrediction;
  public
    property HasGrabbyArm: Boolean read GetHasGrabbyArm;
  public
    constructor Create(const GrabbyArm: SmartClaw<T>; const Name: MultiChar; const Prediction: NaturalNumber = System.Default(NaturalNumber)); overload;
    constructor Create(const GrabbyArm: SmartClaw<T>; const Name: ArrayOf<MonoChar> = []; const Prediction: NaturalNumber = System.Default(NaturalNumber)); overload;
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
    constructor Create(const Name: MultiChar; const Count: NaturalNumber = System.Default(NaturalNumber)); overload;
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

constructor BucketIn<T>.Create(const GrabbyArm: SmartClaw<T>; const Name: ArrayOf<MonoChar>; const Prediction: NaturalNumber);
begin
  Create(GrabbyArm, MultiChar.Create(Name), Prediction);
end;

class operator BucketIn<T>.Equal(const Left, Right: BucketIn<T>): Boolean;
begin
  Result := (@Left = @Right);
  if (not Result) then
    Result := (Left.GrabbyArm = Right.GrabbyArm) and (Left.Name = Right.Name) and (Left.Prediction = Right.Prediction);
end;

function BucketIn<T>.GetHasGrabbyArm: Boolean;
begin
  Result := System.Assigned(FGrabbyArm);
end;

procedure BucketIn<T>.SetName(const Value: MultiChar);
begin
  FName := Value;
end;

{BucketOut}
constructor BucketOut.Create(const Name: MultiChar; const Count: NaturalNumber);
begin
  FCount := Count;
  FName := Name;
end;

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
begin
  Result := [];
  for var Each: BucketIn<T> in Buckets do
    Result := Result + [BucketOut.Create(Each.Name)];
  for var I: NativeInt := Low(DataStream) to High(DataStream) do
    for var J: NativeInt := Low(Buckets) to High(Buckets) do
      if Buckets[J].HasGrabbyArm then
        if Buckets[J].GrabbyArm(DataStream[I]) then
          Result[J].Count := Result[J].Count + 1;
end;

begin
  //Assignment Compatibility :: BucketIn by Foundational Types
  System.Assert(GenericRecordsOf<BucketIn<MonoChar>>.AreSymmetricallyAssignmentCompatible());
  System.Assert(GenericRecordsOf<BucketIn<BigNaturalNumber>>.AreSymmetricallyAssignmentCompatible());
  System.Assert(GenericRecordsOf<BucketIn<NaturalNumber>>.AreSymmetricallyAssignmentCompatible());
end.
