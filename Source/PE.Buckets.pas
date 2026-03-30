unit PE.Buckets;

interface

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

implementation

end.
