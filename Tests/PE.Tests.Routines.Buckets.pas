unit PE.Tests.Routines.Buckets;

interface

uses
  {PE}
  PE.Buckets,
  PE.Delphi.AssignmentCompatibility,
  PE.Delphi.TypeIdentity,
  PE.Types.Composite,  //For inlining
  PE.Types.Foundational;

{$IF (not IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime)}
   {$MESSAGE FATAL 'Unable to continue without compile-time assertions established.'}
{$ENDIF}

type
  DomainTests<T> = record
  public
    class procedure Exercise(); static; inline;
  end;

  CategorizeRoutineTests<TypeUnderTest> = record
  public type
    EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues = record
    strict private {Single Bucket :: Count is zero}
      class procedure TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketInWithFocusedGrabbyArm(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketIn(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndASingleDefaultBucketIn(); static; inline;
    strict private {Single Bucket :: Count is 1}
      class procedure TheBucketOutCountIs1WhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketWithFocusedGrabbyArm(); static; inline;
      { TODO -oChuck -cToDo : Increase strength of proof by adding non-default values as well (include multiple non-default buckets where each one is clearly "doing its thing")}
    strict private {Multiple Buckets :: Count is zero}
      class procedure AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsIn(); static; inline;
      class procedure AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsInAllWithIdenticalFocusedGrabbyArms(); static; inline;
      class procedure AllCountsAreZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsIn(); static; inline;
      class procedure AllCountsAreZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsIn(); static; inline;
    strict private {Multiple Buckets :: Count is 1}
      class procedure AllCountsAre1WhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsInAllWithIdenticalFocusedGrabbyArms(); static; inline;
    strict private {Multiple Buckets :: Count is 3}
      class procedure AllCountsAre3WhenGiven3DefaultElementOfTValuesAsADataStreamAndMultipleDefaultBucketsInAllWithIdenticalFocusedGrabbyArms(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    NamePropertyIsCopiedFromBucketInToBucketOut = record
    strict private const NonDefaultMonoChar: MonoChar = 'a';
    strict private const NonDefaultMonoChar2: MonoChar = 'b';
    strict private const NonDefaultMonoChar3: MonoChar = 'c';
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
      class constructor Create();
      class procedure Exercise(); static; inline;
    end;
    NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn = record
    strict private {Varying Data Stream; Returning 1 bucket}
      class procedure Returns1BucketOutWhenGivenAnEmptyDataStreamAnd1DefaultBucketInOfT(); static; inline;
      class procedure Returns1BucketOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd1DefaultBucketInOfT(); static; inline;
      class procedure Returns1BucketOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd1DefaultBucketInOfT(); static; inline;
      { TODO -oChuck -cToDo : Increase strength of proof by adding non-default values as well }
    strict private {Varying Data Stream; Returning multiple buckets}
      class procedure Returns3DefaultBucketsOutWhenGivenAnEmptyDataStreamAnd3DefaultBucketInOfT(); static; inline;
      class procedure Returns3DefaultBucketsOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd3DefaultBucketInOfT(); static; inline;
      class procedure Returns3DefaultBucketsOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd3DefaultBucketInOfT(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    OrderOfBucketsOutIsDeterminedByBucketsIn = record
    strict private
      class procedure TheResultingArrayOfBucketOutMatchesTheOrderOfTheArrayOfBucketIn_AccordingToUniqueValuesAcrossNameProperties(); static; inline;
      { TODO -oChuck -cToDo : This clearly needs additional substance }
    public
      class procedure Exercise(); static; inline;
    end;
    SignatureTests = record
    strict private
      class procedure The1stParameterAcceptsAnEmptyArrayOfT(); static; inline;
      class procedure The2ndParameterAcceptsAnEmptyArrayOfBucketInOfT(); static; inline;
      class procedure ReturnsAnEmptyArrayOfBucketOut(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class procedure Exercise(); static; inline;
  end;

implementation

{DomainTests<T>}
class procedure DomainTests<T>.Exercise();
begin
  CategorizeRoutineTests<T>.Exercise();
end;

{CategorizeRoutineTests<TypeUnderTest>}
class procedure CategorizeRoutineTests<TypeUnderTest>.Exercise;
begin
  EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.Exercise();
  NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Exercise();
  NamePropertyIsCopiedFromBucketInToBucketOut.Exercise();
  OrderOfBucketsOutIsDeterminedByBucketsIn.Exercise();
  SignatureTests.Exercise();
end;

{ CategorizeRoutineTests<TypeUnderTest>.SignatureTests }

class procedure CategorizeRoutineTests<TypeUnderTest>.SignatureTests.Exercise;
begin
  The1stParameterAcceptsAnEmptyArrayOfT();
  The2ndParameterAcceptsAnEmptyArrayOfBucketInOfT();
  ReturnsAnEmptyArrayOfBucketOut();
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.SignatureTests.ReturnsAnEmptyArrayOfBucketOut;
begin
  System.Assert(ArrayOf<BucketOut>.Create() = Routines.Categorize<TypeUnderTest>(ArrayOf<TypeUnderTest>.Create(), ArrayOf<BucketIn<TypeUnderTest>>.Create()));
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.SignatureTests.The1stParameterAcceptsAnEmptyArrayOfT;
begin
  Routines.Categorize<TypeUnderTest>(ArrayOf<TypeUnderTest>.Create(), []);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.SignatureTests.The2ndParameterAcceptsAnEmptyArrayOfBucketInOfT;
begin
  Routines.Categorize<TypeUnderTest>([], ArrayOf<BucketIn<TypeUnderTest>>.Create());
end;

{CategorizeRoutineTests<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn}
class procedure CategorizeRoutineTests<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Exercise;
begin
  Returns1BucketOutWhenGivenAnEmptyDataStreamAnd1DefaultBucketInOfT();
  Returns1BucketOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd1DefaultBucketInOfT();
  Returns1BucketOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd1DefaultBucketInOfT();
  Returns3DefaultBucketsOutWhenGivenAnEmptyDataStreamAnd3DefaultBucketInOfT();
  Returns3DefaultBucketsOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd3DefaultBucketInOfT();
  Returns3DefaultBucketsOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd3DefaultBucketInOfT();
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns1BucketOutWhenGivenAnEmptyDataStreamAnd1DefaultBucketInOfT;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([], [System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(BucketOut) = Actual[System.Low(Actual)]);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns1BucketOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd1DefaultBucketInOfT;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([Default(TypeUnderTest)], [System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(BucketOut) = Actual[System.Low(Actual)]);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns1BucketOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd1DefaultBucketInOfT;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)], [System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(BucketOut) = Actual[System.Low(Actual)]);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns3DefaultBucketsOutWhenGivenAnEmptyDataStreamAnd3DefaultBucketInOfT;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([], [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(System.Default(BucketOut) = Actual[System.Low(Actual)]);
  System.Assert(System.Default(BucketOut) = Actual[System.Low(Actual) + 1]);
  System.Assert(System.Default(BucketOut) = Actual[System.Low(Actual) + 2]);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns3DefaultBucketsOutWhenGivenASingleDefaultElementOfTAsADataStreamAnd3DefaultBucketInOfT;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([Default(TypeUnderTest)], [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(System.Default(BucketOut) = Actual[System.Low(Actual)]);
  System.Assert(System.Default(BucketOut) = Actual[System.Low(Actual) + 1]);
  System.Assert(System.Default(BucketOut) = Actual[System.Low(Actual) + 2]);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns3DefaultBucketsOutWhenGivenMultipleDefaultElementsOfTAsADataStreamAnd3DefaultBucketInOfT;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>(
    [System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)],
    [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(System.Default(BucketOut) = Actual[System.Low(Actual)]);
  System.Assert(System.Default(BucketOut) = Actual[System.Low(Actual) + 1]);
  System.Assert(System.Default(BucketOut) = Actual[System.Low(Actual) + 2]);
end;

{CategorizeRoutineTests<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues}
class procedure CategorizeRoutineTests<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIs1WhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketWithFocusedGrabbyArm;
begin
  System.Assert(1 = Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest)], [BucketIn<TypeUnderTest>.Create(function (const AValue: TypeUnderTest): Boolean begin Result := (AValue = System.Default(TypeUnderTest)); end, '')])[0].Count);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn;
begin
  System.Assert(0 = Routines.Categorize<TypeUnderTest>([], [System.Default(BucketIn<TypeUnderTest>)])[0].Count);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketInWithFocusedGrabbyArm;
begin
  System.Assert(0 = Routines.Categorize<TypeUnderTest>([], [BucketIn<TypeUnderTest>.Create(function (const AValue: TypeUnderTest): Boolean begin Result := (System.Default(TypeUnderTest) = AValue) end, '')])[0].Count);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketIn;
begin
  System.Assert(0 = Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest)], [System.Default(BucketIn<TypeUnderTest>)])[0].Count);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndASingleDefaultBucketIn;
begin
  System.Assert(0 = Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)], [System.Default(BucketIn<TypeUnderTest>)])[0].Count);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.AllCountsAre1WhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsInAllWithIdenticalFocusedGrabbyArms;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest)],
    [BucketIn<TypeUnderTest>.Create(function (const AValue: TypeUnderTest): Boolean begin Result := (AValue = System.Default(TypeUnderTest)); end, ''),
     BucketIn<TypeUnderTest>.Create(function (const AValue: TypeUnderTest): Boolean begin Result := (AValue = System.Default(TypeUnderTest)); end, ''),
     BucketIn<TypeUnderTest>.Create(function (const AValue: TypeUnderTest): Boolean begin Result := (AValue = System.Default(TypeUnderTest)); end, '')]);
  System.Assert(3 = System.Length(Actual));
  for var Each: BucketOut in Actual do
    System.Assert(1 = Each.Count);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.AllCountsAre3WhenGiven3DefaultElementOfTValuesAsADataStreamAndMultipleDefaultBucketsInAllWithIdenticalFocusedGrabbyArms;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)],
    [BucketIn<TypeUnderTest>.Create(function (const AValue: TypeUnderTest): Boolean begin Result := (AValue = System.Default(TypeUnderTest)); end, ''),
     BucketIn<TypeUnderTest>.Create(function (const AValue: TypeUnderTest): Boolean begin Result := (AValue = System.Default(TypeUnderTest)); end, ''),
     BucketIn<TypeUnderTest>.Create(function (const AValue: TypeUnderTest): Boolean begin Result := (AValue = System.Default(TypeUnderTest)); end, '')]);
  System.Assert(3 = System.Length(Actual));
  for var Each: BucketOut in Actual do
    System.Assert(3 = Each.Count);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsIn;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([], [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(3 = System.Length(Actual));
  for var Each: BucketOut in Actual do
    System.Assert(0 = Each.Count);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsInAllWithIdenticalFocusedGrabbyArms;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([],
    [BucketIn<TypeUnderTest>.Create(function (const AValue: TypeUnderTest): Boolean begin Result := (AValue = System.Default(TypeUnderTest)); end, ''),
     BucketIn<TypeUnderTest>.Create(function (const AValue: TypeUnderTest): Boolean begin Result := (AValue = System.Default(TypeUnderTest)); end, ''),
     BucketIn<TypeUnderTest>.Create(function (const AValue: TypeUnderTest): Boolean begin Result := (AValue = System.Default(TypeUnderTest)); end, '')]);
  System.Assert(3 = System.Length(Actual));
  for var Each: BucketOut in Actual do
    System.Assert(0 = Each.Count);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.AllCountsAreZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsIn;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest)], [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(3 = System.Length(Actual));
  for var Each: BucketOut in Actual do
    Assert(0 = Each.Count);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.AllCountsAreZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsIn;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>(
    [System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)],
    [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(3 = System.Length(Actual));
  for var Each: BucketOut in Actual do
    System.Assert(0 = Each.Count);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.Exercise;
begin
  TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn();
  TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketInWithFocusedGrabbyArm();
  TheBucketOutCountIsZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketIn();
  TheBucketOutCountIsZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndASingleDefaultBucketIn();
  TheBucketOutCountIs1WhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketWithFocusedGrabbyArm();

  AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsIn();
  AllCountsAreZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsInAllWithIdenticalFocusedGrabbyArms();
  AllCountsAreZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsIn();
  AllCountsAreZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsIn();

  AllCountsAre1WhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsInAllWithIdenticalFocusedGrabbyArms();
  AllCountsAre3WhenGiven3DefaultElementOfTValuesAsADataStreamAndMultipleDefaultBucketsInAllWithIdenticalFocusedGrabbyArms();
end;

{CategorizeRoutineTests<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut}
class constructor CategorizeRoutineTests<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.Create;
begin
  System.Assert(not (NonDefaultMonoChar = NonDefaultMonoChar2));
  System.Assert(not (NonDefaultMonoChar = NonDefaultMonoChar3));
  System.Assert(not (NonDefaultMonoChar2 = NonDefaultMonoChar3));
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.Exercise;
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

class procedure CategorizeRoutineTests<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn;
begin
  System.Assert(System.Default(BucketIn<TypeUnderTest>).Name = Routines.Categorize<TypeUnderTest>([], [System.Default(BucketIn<TypeUnderTest>)])[0].Name);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenAnEmptyDataStreamAndASingleNonDefaultNameDefaultBucketIn;
begin
  System.Assert(NonDefaultMonoChar = Routines.Categorize<TypeUnderTest>([], [BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar)])[0].Name);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenAnEmptyDataStreamAndMultipleDefaultBucketInElements;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([], [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(3 = System.Length(Actual));
  for var Each: BucketOut in Actual do
    System.Assert(System.Default(BucketIn<TypeUnderTest>).Name = Each.Name);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([], [BucketIn<TypeUnderTest>.Create(nil,  NonDefaultMonoChar), BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar), BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar)]);
  System.Assert(3 = System.Length(Actual));
  for var Each: BucketOut in Actual do
    System.Assert(NonDefaultMonoChar = Each.Name);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([], [BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar), BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar2), BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar3)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(NonDefaultMonoChar = Actual[Low(Actual)].Name);
  System.Assert(NonDefaultMonoChar2 = Actual[Low(Actual) + 1].Name);
  System.Assert(NonDefaultMonoChar3 = Actual[Low(Actual) + 2].Name);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleDefaultBucketIn;
begin
  System.Assert(System.Default(BucketIn<TypeUnderTest>).Name = Routines.Categorize<TypeUnderTest>(
    [System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)], [System.Default(BucketIn<TypeUnderTest>)])[0].Name);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleNonDefaultNameDefaultBucketIn;
begin
  System.Assert(NonDefaultMonoChar = Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)], [BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar)])[0].Name);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleDefaultBucketInElements;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>(
    [System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)],
    [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(3 = System.Length(Actual));
  for var Each: BucketOut in Actual do
    System.Assert(System.Default(BucketIn<T>).Name = Each.Name);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>(
    [System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)],
    [BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar), BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar), BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar)]);
  System.Assert(3 = System.Length(Actual));
  for var Each: BucketOut in Actual do
    System.Assert('a' = Each.Name);
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>(
    [System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)],
    [BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar), BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar2), BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar3)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(NonDefaultMonoChar = Actual[Low(Actual)].Name);
  System.Assert(NonDefaultMonoChar2 = Actual[Low(Actual) + 1].Name);
  System.Assert(NonDefaultMonoChar3 = Actual[Low(Actual) + 2].Name);
end;

{ CategorizeRoutineTests<TypeUnderTest>.OrderOfBucketsOutIsDeterminedByBucketsIn }

class procedure CategorizeRoutineTests<TypeUnderTest>.OrderOfBucketsOutIsDeterminedByBucketsIn.Exercise;
begin
  TheResultingArrayOfBucketOutMatchesTheOrderOfTheArrayOfBucketIn_AccordingToUniqueValuesAcrossNameProperties();
end;

class procedure CategorizeRoutineTests<TypeUnderTest>.OrderOfBucketsOutIsDeterminedByBucketsIn.TheResultingArrayOfBucketOutMatchesTheOrderOfTheArrayOfBucketIn_AccordingToUniqueValuesAcrossNameProperties;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>(
    [System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)],
    [BucketIn<TypeUnderTest>.Create(nil, '1'), BucketIn<TypeUnderTest>.Create(nil, '2'), BucketIn<TypeUnderTest>.Create(nil, '3')]);
  System.Assert(3 = System.Length(Actual));
  System.Assert('1' = Actual[Low(Actual)].Name);
  System.Assert('2' = Actual[Low(Actual) + 1].Name);
  System.Assert('3' = Actual[Low(Actual) + 2].Name);
end;

end.

