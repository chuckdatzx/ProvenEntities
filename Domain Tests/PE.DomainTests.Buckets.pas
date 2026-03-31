unit PE.DomainTests.Buckets;

interface

uses
  {PE}
  PE.Buckets;

type
  DomainTests<T> = record
  public
    class procedure Exercise(); static; inline;
  end;

  CategorizeRoutine_SignatureTests<T> = record
  private
    class procedure ReturnsAnEmptyArrayOfBucketOut(); static; inline;
    class procedure TheFirstParameterAcceptsAnEmptyTArrayOfT(); static; inline;
    class procedure TheSecondParameterAcceptsAnEmptyTArrayOfBucketInOfT(); static; inline;
  end;

  CategorizeRoutine_ResultCount<T> = record
  private {Varying Data Stream; Returning 1 bucket}
    class procedure Returns1BucketOutWhenGivenAnEmptyDataStreamAnd1DefaultBucketInOfT(); static; inline;
    class procedure Returns1BucketOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd1DefaultBucketInOfT(); static; inline;
    class procedure Returns1BucketOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd1DefaultBucketInOfT(); static; inline;
  private {Varying Data Stream; Returning multiple buckets}
    class procedure Returns3DefaultBucketsOutWhenGivenAnEmptyDataStreamAnd3DefaultBucketInOfT(); static; inline;
    class procedure Returns3DefaultBucketsOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd3DefaultBucketInOfT(); static; inline;
    class procedure Returns3DefaultBucketsOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd3DefaultBucketInOfT(); static; inline;
  end;

  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T> = record
  private {Empty Data Stream}
    class procedure WhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn(); static; inline;
    class procedure WhenGivenAnEmptyDataStreamAndASingleNonDefaultNameDefaultBucketIn(); static; inline;
    class procedure WhenGivenAnEmptyDataStreamAndMultipleDefaultBucketInElements(); static; inline;
    class procedure WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames(); static; inline;
    class procedure WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames(); static; inline;
  private {Multiple Default Data Stream Elements}
    class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleDefaultBucketIn(); static; inline;
    class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleNonDefaultNameDefaultBucketIn(); static; inline;
    class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleDefaultBucketInElements(); static; inline;
    class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames(); static; inline;
    class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames(); static; inline;
  end;

  CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T> = record
  private {Single Bucket :: Count is zero}
    class procedure AllCountsAreZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn(); static; inline;
    class procedure AllCountsAreZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketInWithFocusedGrabbyArm(); static; inline;
    class procedure AllCountsAreZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketIn(); static; inline;
    class procedure AllCountsAreZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndASingleDefaultBucketIn(); static; inline;
  private {Single Bucket :: Count is 1}
    class procedure AllCountsAre1WhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketWithFocusedGrabbyArm(); static; inline;
  private {Multiple Buckets :: Count is zero}
    class procedure AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsIn(); static; inline;
    class procedure AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsInAllWithIdenticalFocusedGrabbyArms(); static; inline;
    class procedure AllCountsAreZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsIn(); static; inline;
    class procedure AllCountsAreZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsIn(); static; inline;
  private {Multiple Buckets :: Count is 1}
    class procedure AllCountsAre1WhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketInsAllWithIdenticalFocusedGrabbyArms(); static; inline;
  private {Multiple Buckets :: Count is 3}
    class procedure AllCountsAre3WhenGiven3DefaultElementOfTValuesAsADataStreamAndMultipleDefaultBucketInsAllWithIdenticalFocusedGrabbyArms(); static; inline;
  end;

  CategorizeRoutine_BucketsOutArray_ResultOrder<T> = record
  private
    class procedure ResultingArrayOfBucketOutMatchesTheOrderOfTheArrayOfBucketIn(); static; inline;
  end;

implementation

{ CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T> }

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn();
begin
  System.Assert(System.Default(BucketIn<T>).Name = Routines.Categorize<T>([], [System.Default(BucketIn<T>)])[0].Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndASingleNonDefaultNameDefaultBucketIn();
begin
  System.Assert('a' = Routines.Categorize<T>([], [BucketIn<T>.Create(nil, 'a')])[0].Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndMultipleDefaultBucketInElements();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  Assert(3 = Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    Assert(System.Default(BucketIn<T>).Name = Each.Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames;
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([], [BucketIn<T>.Create(nil, 'a'), BucketIn<T>.Create(nil, 'a'), BucketIn<T>.Create(nil, 'a')]);
  Assert(3 = Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    Assert('a' = Each.Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([], [BucketIn<T>.Create(nil, '1'), BucketIn<T>.Create(nil, '2'), BucketIn<T>.Create(nil, '3')]);
  Assert(3 = Length(Actual));
  Assert('1' = Actual[Low(Actual)].Name);
  Assert('2' = Actual[Low(Actual) + 1].Name);
  Assert('3' = Actual[Low(Actual) + 2].Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleDefaultBucketIn();
begin
  System.Assert(System.Default(BucketIn<T>).Name = Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [System.Default(BucketIn<T>)])[0].Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleNonDefaultNameDefaultBucketIn();
begin
  System.Assert('a' = Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [BucketIn<T>.Create(nil, 'a')])[0].Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleDefaultBucketInElements();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  Assert(3 = Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    Assert(System.Default(BucketIn<T>).Name = Each.Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [BucketIn<T>.Create(nil, 'a'), BucketIn<T>.Create(nil, 'a'), BucketIn<T>.Create(nil, 'a')]);
  Assert(3 = Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    Assert('a' = Each.Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [BucketIn<T>.Create(nil, '1'), BucketIn<T>.Create(nil, '2'), BucketIn<T>.Create(nil, '3')]);
  Assert(3 = Length(Actual));
  Assert('1' = Actual[Low(Actual)].Name);
  Assert('2' = Actual[Low(Actual) + 1].Name);
  Assert('3' = Actual[Low(Actual) + 2].Name);
end;

{ CategorizeRoutine_SignatureTests<T> }

class procedure CategorizeRoutine_SignatureTests<T>.ReturnsAnEmptyArrayOfBucketOut();
begin
  Assert(TArray<BucketOut>.Create() = Routines.Categorize<T>(TArray<T>.Create(), TArray<BucketIn<T>>.Create()));
end;

class procedure CategorizeRoutine_SignatureTests<T>.TheFirstParameterAcceptsAnEmptyTArrayOfT();
begin
  Routines.Categorize<T>(TArray<T>.Create(), []);
end;

class procedure CategorizeRoutine_SignatureTests<T>.TheSecondParameterAcceptsAnEmptyTArrayOfBucketInOfT();
begin
  Routines.Categorize<T>([], TArray<BucketIn<T>>.Create());
end;

{ CategorizeRoutine_ResultCount<T> }

class procedure CategorizeRoutine_ResultCount<T>.Returns1BucketOutWhenGivenAnEmptyDataStreamAnd1DefaultBucketInOfT();
begin
  var Actual: TArray<BucketOut>;
  Actual := Routines.Categorize<T>([], [System.Default(BucketIn<T>)]);
  Assert(1 = Length(Actual));
  Assert(System.Default(BucketOut) = Actual[Low(Actual)]);
end;

class procedure CategorizeRoutine_ResultCount<T>.Returns1BucketOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd1DefaultBucketInOfT();
begin
  var Actual: TArray<BucketOut>;
  Actual := Routines.Categorize<T>([Default(T)], [System.Default(BucketIn<T>)]);
  Assert(1 = Length(Actual));
  Assert(System.Default(BucketOut) = Actual[Low(Actual)]);
end;

class procedure CategorizeRoutine_ResultCount<T>.Returns1BucketOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd1DefaultBucketInOfT();
begin
  var Actual: TArray<BucketOut>;
  Actual := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [System.Default(BucketIn<T>)]);
  Assert(1 = Length(Actual));
  Assert(System.Default(BucketOut) = Actual[Low(Actual)]);
end;

class procedure CategorizeRoutine_ResultCount<T>.Returns3DefaultBucketsOutWhenGivenAnEmptyDataStreamAnd3DefaultBucketInOfT();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  Assert(3 = Length(Actual));
end;

class procedure CategorizeRoutine_ResultCount<T>.Returns3DefaultBucketsOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd3DefaultBucketInOfT();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([Default(T)], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  Assert(3 = Length(Actual));
end;

class procedure CategorizeRoutine_ResultCount<T>.Returns3DefaultBucketsOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd3DefaultBucketInOfT();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  Assert(3 = Length(Actual));
end;

{ CategorizeRoutine_BucketsOutArray_ResultOrder<T> }

class procedure CategorizeRoutine_BucketsOutArray_ResultOrder<T>.ResultingArrayOfBucketOutMatchesTheOrderOfTheArrayOfBucketIn();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [BucketIn<T>.Create(nil, '1'), BucketIn<T>.Create(nil, '2'), BucketIn<T>.Create(nil, '3')]);
  Assert(3 = Length(Actual));
  Assert('1' = Actual[Low(Actual)].Name);
  Assert('2' = Actual[Low(Actual) + 1].Name);
  Assert('3' = Actual[Low(Actual) + 2].Name);
end;

{ CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T> }

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn();
begin
  System.Assert(0 = Routines.Categorize<T>([], [System.Default(BucketIn<T>)])[0].Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketInWithFocusedGrabbyArm();
begin
  System.Assert(0 = Routines.Categorize<T>([], [BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := False end)])[0].Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketIn();
begin
  System.Assert(0 = Routines.Categorize<T>([System.Default(T)], [System.Default(BucketIn<T>)])[0].Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndASingleDefaultBucketIn();
begin
  System.Assert(0 = Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [System.Default(BucketIn<T>)])[0].Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAre1WhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketWithFocusedGrabbyArm();
begin
  System.Assert(1 = Routines.Categorize<T>([System.Default(T)], [BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = Default(T)); end)])[0].Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsIn();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  Assert(3 = Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    Assert(0 = Each.Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsInAllWithIdenticalFocusedGrabbyArms();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([],
    [BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = Default(T)); end),
     BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = Default(T)); end),
     BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = Default(T)); end)]);
  Assert(3 = Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    Assert(0 = Each.Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsIn();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([System.Default(T)], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  Assert(3 = Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    Assert(0 = Each.Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsIn();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  Assert(3 = Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    Assert(0 = Each.Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAre1WhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketInsAllWithIdenticalFocusedGrabbyArms();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([System.Default(T)],
    [BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = Default(T)); end),
     BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = Default(T)); end),
     BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = Default(T)); end)]);
  Assert(3 = Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    Assert(1 = Each.Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAre3WhenGiven3DefaultElementOfTValuesAsADataStreamAndMultipleDefaultBucketInsAllWithIdenticalFocusedGrabbyArms();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)],
    [BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = Default(T)); end),
     BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = Default(T)); end),
     BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = Default(T)); end)]);
  Assert(3 = Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    Assert(3 = Each.Count);
end;

class procedure DomainTests<T>.Exercise();
begin
  CategorizeRoutine_SignatureTests<T>.TheFirstParameterAcceptsAnEmptyTArrayOfT();
  CategorizeRoutine_SignatureTests<T>.TheSecondParameterAcceptsAnEmptyTArrayOfBucketInOfT();
  CategorizeRoutine_SignatureTests<T>.ReturnsAnEmptyArrayOfBucketOut();

  CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn();
  CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketInWithFocusedGrabbyArm();
  CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketIn();
  CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndASingleDefaultBucketIn();
  CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAre1WhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketWithFocusedGrabbyArm();
  CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsIn();
  CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsInAllWithIdenticalFocusedGrabbyArms();
  CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsIn();
  CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsIn();
  CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAre1WhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketInsAllWithIdenticalFocusedGrabbyArms();
  CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAre3WhenGiven3DefaultElementOfTValuesAsADataStreamAndMultipleDefaultBucketInsAllWithIdenticalFocusedGrabbyArms();

  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndASingleNonDefaultNameDefaultBucketIn();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndMultipleDefaultBucketInElements();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndMultipleNOnDefaultBucketInElementsAllSharingIdenticalNames();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames();

  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleDefaultBucketIn();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleNonDefaultNameDefaultBucketIn();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleDefaultBucketInElements();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames();

  CategorizeRoutine_ResultCount<T>.Returns1BucketOutWhenGivenAnEmptyDataStreamAnd1DefaultBucketInOfT();
  CategorizeRoutine_ResultCount<T>.Returns1BucketOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd1DefaultBucketInOfT();
  CategorizeRoutine_ResultCount<T>.Returns1BucketOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd1DefaultBucketInOfT();
  CategorizeRoutine_ResultCount<T>.Returns3DefaultBucketsOutWhenGivenAnEmptyDataStreamAnd3DefaultBucketInOfT();
  CategorizeRoutine_ResultCount<T>.Returns3DefaultBucketsOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd3DefaultBucketInOfT();
  CategorizeRoutine_ResultCount<T>.Returns3DefaultBucketsOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd3DefaultBucketInOfT();

  CategorizeRoutine_BucketsOutArray_ResultOrder<T>.ResultingArrayOfBucketOutMatchesTheOrderOfTheArrayOfBucketIn();
end;

end.
