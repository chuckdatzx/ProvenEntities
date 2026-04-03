unit PE.DomainTests.Buckets;
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
  {Assertions}
  PE.Delphi.AssignmentCompatibility.GenericRecords.Proven.AtCompileTime,
  PE.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime,
  {PE}
  PE.TypeTests.Types,
  PE.Buckets;

{$IF IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime and
 IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime}

type
  DomainTests<T> = record
  public
    class procedure Exercise(); static; inline;
  end;

  ///<summary>Locking down the signature of the Categorize<T> routine</summary>
  CategorizeRoutine_SignatureTests<T> = record
  strict private
    class procedure The1stParameterAcceptsAnEmptyArrayOfT(); static; inline;
    class procedure The2ndParameterAcceptsAnEmptyArrayOfBucketInOfT(); static; inline;
    class procedure ReturnsAnEmptyArrayOfBucketOut(); static; inline;
  public
    class procedure Exercise(); static; inline;
  end;

  ///<summary>Iterating circumstances which cause change regarding the number of BucketOut instances returned</summary>
  CategorizeRoutine_ResultCount<T> = record
  strict private {Varying Data Stream; Returning 1 bucket}
    class procedure Returns1BucketOutWhenGivenAnEmptyDataStreamAnd1DefaultBucketInOfT(); static; inline;
    class procedure Returns1BucketOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd1DefaultBucketInOfT(); static; inline;
    class procedure Returns1BucketOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd1DefaultBucketInOfT(); static; inline;
  strict private {Varying Data Stream; Returning multiple buckets}
    class procedure Returns3DefaultBucketsOutWhenGivenAnEmptyDataStreamAnd3DefaultBucketInOfT(); static; inline;
    class procedure Returns3DefaultBucketsOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd3DefaultBucketInOfT(); static; inline;
    class procedure Returns3DefaultBucketsOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd3DefaultBucketInOfT(); static; inline;
  public
    class procedure Exercise(); static; inline;
  end;

  ///<summary>Iterating circumstances which cause change to the BucketOut.Count property</summary>
  CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T> = record
  strict private {Single Bucket :: Count is zero}
    class procedure AllCountsAreZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn(); static; inline;
    class procedure AllCountsAreZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketInWithFocusedGrabbyArm(); static; inline;
    class procedure AllCountsAreZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketIn(); static; inline;
    class procedure AllCountsAreZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndASingleDefaultBucketIn(); static; inline;
  strict private {Single Bucket :: Count is 1}
    class procedure AllCountsAre1WhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketWithFocusedGrabbyArm(); static; inline;
  strict private {Multiple Buckets :: Count is zero}
    class procedure AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsIn(); static; inline;
    class procedure AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsInAllWithIdenticalFocusedGrabbyArms(); static; inline;
    class procedure AllCountsAreZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsIn(); static; inline;
    class procedure AllCountsAreZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsIn(); static; inline;
  strict private {Multiple Buckets :: Count is 1}
    class procedure AllCountsAre1WhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketInsAllWithIdenticalFocusedGrabbyArms(); static; inline;
  strict private {Multiple Buckets :: Count is 3}
    class procedure AllCountsAre3WhenGiven3DefaultElementOfTValuesAsADataStreamAndMultipleDefaultBucketInsAllWithIdenticalFocusedGrabbyArms(); static; inline;
  public
    class procedure Exercise(); static; inline;
  end;

  ///<summary>Iterating circumstances which cause the name property of a BucketIn<T> to pass to the name property of a BucketOut</summary>
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T> = record
  strict private {Empty Data Stream}
    class procedure WhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn(); static; inline;
    class procedure WhenGivenAnEmptyDataStreamAndASingleNonDefaultNameDefaultBucketIn(); static; inline;
    class procedure WhenGivenAnEmptyDataStreamAndMultipleDefaultBucketInElements(); static; inline;
    class procedure WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames(); static; inline;
    class procedure WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames(); static; inline;
  strict private {Multiple Default Data Stream Elements}
    class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleDefaultBucketIn(); static; inline;
    class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleNonDefaultNameDefaultBucketIn(); static; inline;
    class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleDefaultBucketInElements(); static; inline;
    class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames(); static; inline;
    class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames(); static; inline;
  public
    class procedure Exercise(); static; inline;
  end;

  ///<summary>Establishing the expected BucketIn<T> to BucketOut order</summary>
  CategorizeRoutine_BucketsOutArray_ResultOrder<T> = record
  private
    class procedure TheResultingArrayOfBucketOutMatchesTheOrderOfTheArrayOfBucketIn_AccordingToUniqueValuesAcrossNameProperties(); static; inline;
  end;

{$IFEND}

implementation

{$IF IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime and
 IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime}

uses
  {PE}
  PE.Types;

{ CategorizeRoutine_SignatureTests<T> }

class procedure CategorizeRoutine_SignatureTests<T>.Exercise();
begin
  Array_TypeTests<BucketIn<T>>.Exercise(); //Validating dependencies
  Array_TypeTests<BucketOut>.Exercise(); //Validating dependencies
  The1stParameterAcceptsAnEmptyArrayOfT();
  The2ndParameterAcceptsAnEmptyArrayOfBucketInOfT();
  ReturnsAnEmptyArrayOfBucketOut();
end;

class procedure CategorizeRoutine_SignatureTests<T>.ReturnsAnEmptyArrayOfBucketOut();
begin
  System.Assert(ArrayOf<BucketOut>.Create() = Routines.Categorize<T>(ArrayOf<T>.Create(), ArrayOf<BucketIn<T>>.Create()));
end;

class procedure CategorizeRoutine_SignatureTests<T>.The1stParameterAcceptsAnEmptyArrayOfT();
begin
  Routines.Categorize<T>(ArrayOf<T>.Create(), []);
end;

class procedure CategorizeRoutine_SignatureTests<T>.The2ndParameterAcceptsAnEmptyArrayOfBucketInOfT();
begin
  Routines.Categorize<T>([], ArrayOf<BucketIn<T>>.Create());
end;

{ CategorizeRoutine_ResultCount<T> }

class procedure CategorizeRoutine_ResultCount<T>.Exercise();
begin
  Returns1BucketOutWhenGivenAnEmptyDataStreamAnd1DefaultBucketInOfT();
  Returns1BucketOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd1DefaultBucketInOfT();
  Returns1BucketOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd1DefaultBucketInOfT();
  Returns3DefaultBucketsOutWhenGivenAnEmptyDataStreamAnd3DefaultBucketInOfT();
  Returns3DefaultBucketsOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd3DefaultBucketInOfT();
  Returns3DefaultBucketsOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd3DefaultBucketInOfT();
end;

class procedure CategorizeRoutine_ResultCount<T>.Returns1BucketOutWhenGivenAnEmptyDataStreamAnd1DefaultBucketInOfT();
begin
  var Actual: ArrayOf<BucketOut>;
  Actual := Routines.Categorize<T>([], [System.Default(BucketIn<T>)]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(BucketOut) = Actual[Low(Actual)]);
end;

class procedure CategorizeRoutine_ResultCount<T>.Returns1BucketOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd1DefaultBucketInOfT();
begin
  var Actual: ArrayOf<BucketOut>;
  Actual := Routines.Categorize<T>([Default(T)], [System.Default(BucketIn<T>)]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(BucketOut) = Actual[Low(Actual)]);
end;

class procedure CategorizeRoutine_ResultCount<T>.Returns1BucketOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd1DefaultBucketInOfT();
begin
  var Actual: ArrayOf<BucketOut>;
  Actual := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [System.Default(BucketIn<T>)]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(BucketOut) = Actual[Low(Actual)]);
end;

class procedure CategorizeRoutine_ResultCount<T>.Returns3DefaultBucketsOutWhenGivenAnEmptyDataStreamAnd3DefaultBucketInOfT();
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<T>([], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  System.Assert(3 = System.Length(Actual));
end;

class procedure CategorizeRoutine_ResultCount<T>.Returns3DefaultBucketsOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd3DefaultBucketInOfT();
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<T>([Default(T)], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  System.Assert(3 = System.Length(Actual));
end;

class procedure CategorizeRoutine_ResultCount<T>.Returns3DefaultBucketsOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd3DefaultBucketInOfT();
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  System.Assert(3 = System.Length(Actual));
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
  System.Assert(1 = Routines.Categorize<T>([System.Default(T)], [BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = System.Default(T)); end)])[0].Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsIn();
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<T>([], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  System.Assert(3 = System.Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    System.Assert(0 = Each.Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsInAllWithIdenticalFocusedGrabbyArms();
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<T>([],
    [BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = System.Default(T)); end),
     BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = System.Default(T)); end),
     BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = System.Default(T)); end)]);
  System.Assert(3 = System.Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    System.Assert(0 = Each.Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsIn();
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<T>([System.Default(T)], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  System.Assert(3 = System.Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    Assert(0 = Each.Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAreZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsIn();
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  System.Assert(3 = System.Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    System.Assert(0 = Each.Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAre1WhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketInsAllWithIdenticalFocusedGrabbyArms();
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<T>([System.Default(T)],
    [BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = System.Default(T)); end),
     BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = System.Default(T)); end),
     BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = System.Default(T)); end)]);
  System.Assert(3 = System.Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    System.Assert(1 = Each.Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.AllCountsAre3WhenGiven3DefaultElementOfTValuesAsADataStreamAndMultipleDefaultBucketInsAllWithIdenticalFocusedGrabbyArms();
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)],
    [BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = System.Default(T)); end),
     BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = System.Default(T)); end),
     BucketIn<T>.Create(function (const AValue: T): Boolean begin Result := (AValue = System.Default(T)); end)]);
  System.Assert(3 = System.Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    System.Assert(3 = Each.Count);
end;

class procedure CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.Exercise();
begin
  AllCountsAreZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn();
  AllCountsAreZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketInWithFocusedGrabbyArm();
  AllCountsAreZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketIn();
  AllCountsAreZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndASingleDefaultBucketIn();
  AllCountsAre1WhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketWithFocusedGrabbyArm();
  AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsIn();
  AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsInAllWithIdenticalFocusedGrabbyArms();
  AllCountsAreZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsIn();
  AllCountsAreZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsIn();
  AllCountsAre1WhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketInsAllWithIdenticalFocusedGrabbyArms();
  AllCountsAre3WhenGiven3DefaultElementOfTValuesAsADataStreamAndMultipleDefaultBucketInsAllWithIdenticalFocusedGrabbyArms();
end;

{ CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T> }

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.Exercise();
begin
  WhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn();
  WhenGivenAnEmptyDataStreamAndASingleNonDefaultNameDefaultBucketIn();
  WhenGivenAnEmptyDataStreamAndMultipleDefaultBucketInElements();
  WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames();
  WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames();
  WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleDefaultBucketIn();
  WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleNonDefaultNameDefaultBucketIn();
  WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleDefaultBucketInElements();
  WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames();
  WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames();
end;

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
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<T>([], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  System.Assert(3 = System.Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    System.Assert(System.Default(BucketIn<T>).Name = Each.Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<T>([], [BucketIn<T>.Create(nil, 'a'), BucketIn<T>.Create(nil, 'a'), BucketIn<T>.Create(nil, 'a')]);
  System.Assert(3 = System.Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    System.Assert('a' = Each.Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames();
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<T>([], [BucketIn<T>.Create(nil, '1'), BucketIn<T>.Create(nil, '2'), BucketIn<T>.Create(nil, '3')]);
  System.Assert(3 = System.Length(Actual));
  System.Assert('1' = Actual[Low(Actual)].Name);
  System.Assert('2' = Actual[Low(Actual) + 1].Name);
  System.Assert('3' = Actual[Low(Actual) + 2].Name);
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
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  System.Assert(3 = System.Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    System.Assert(System.Default(BucketIn<T>).Name = Each.Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames();
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [BucketIn<T>.Create(nil, 'a'), BucketIn<T>.Create(nil, 'a'), BucketIn<T>.Create(nil, 'a')]);
  System.Assert(3 = System.Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    System.Assert('a' = Each.Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames();
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [BucketIn<T>.Create(nil, '1'), BucketIn<T>.Create(nil, '2'), BucketIn<T>.Create(nil, '3')]);
  System.Assert(3 = System.Length(Actual));
  System.Assert('1' = Actual[Low(Actual)].Name);
  System.Assert('2' = Actual[Low(Actual) + 1].Name);
  System.Assert('3' = Actual[Low(Actual) + 2].Name);
end;

{ CategorizeRoutine_BucketsOutArray_ResultOrder<T> }

class procedure CategorizeRoutine_BucketsOutArray_ResultOrder<T>.TheResultingArrayOfBucketOutMatchesTheOrderOfTheArrayOfBucketIn_AccordingToUniqueValuesAcrossNameProperties();
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [BucketIn<T>.Create(nil, '1'), BucketIn<T>.Create(nil, '2'), BucketIn<T>.Create(nil, '3')]);
  System.Assert(3 = System.Length(Actual));
  System.Assert('1' = Actual[Low(Actual)].Name);
  System.Assert('2' = Actual[Low(Actual) + 1].Name);
  System.Assert('3' = Actual[Low(Actual) + 2].Name);
end;

{ DomainTests<T> }

class procedure DomainTests<T>.Exercise();
begin
  CategorizeRoutine_SignatureTests<T>.Exercise();
  CategorizeRoutine_BucketsOutArray_CountIsDeterminedByTheGrabbyArmAndTheDataStreamValues<T>.Exercise();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.Exercise();
  CategorizeRoutine_ResultCount<T>.Exercise();
  CategorizeRoutine_BucketsOutArray_ResultOrder<T>.TheResultingArrayOfBucketOutMatchesTheOrderOfTheArrayOfBucketIn_AccordingToUniqueValuesAcrossNameProperties();
end;

{$IFEND}

end.
