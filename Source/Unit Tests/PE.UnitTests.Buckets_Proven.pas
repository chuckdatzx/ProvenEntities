unit PE.UnitTests.Buckets_Proven;

interface

{$REGION 'Buckets Construction/Test Coverage'}
{ TODO -oChuck -cTask : This whole comments section needs reviewed. }
{ALL OF THE FOLLOWING SHOULD BE CONSIDERED PROVEN WHEN ALL TESTS IN THIS UNIT ARE RETURNING GREEN:

  Domain Note:
    ** Since the code being tested is constructed with generics, the domain of coverage intrinsically becomes any compilable data type. And, of course,
      it will never be possible to prove that all types will work (the domain is inexhaustable). That being the case, claiming that any of the
      following code is "proven" is VERY arguable. In cases like this where the domain is inexhaustable, the term "proven" represents the following:
        1) A lot of time and thought is invested in the following tests. Enough so that you "should" be able to plug data type <x> into the TDD
           templates and see that your data type will work just fine. However, it is always possible that something was missed or that your
           specific data type introduces something not considered.
        ** If you believe that the following test coverage is insufficient for validating the code under test, please contact the curator(s) of this
           source code. Additional coverage is always welcome!

  Original Intent: A simple means of sorting data into highly customizable buckets
  Public Facing Composition:
    - 1 singleton entity (essentially an organized container for the following routines)
    - 1 routine: for registering a routine for generating values of type T
    - 1 routine: for unregistering the generation of values for type T
    - 1 routine: generates (presumably random) values of type T
    - 1 routine: returns a list of currently regisitered types
    - 1 supporting class: A custom exception class which is raised whenever rule violations occur in the aforementioned routines
  Supported Processes and Associated Rules:
    1) Registration Process (Registration/unregistration of a routine that generates values of type <x>)
        - Registration is unforgiving
          - Type information is required
          - A generation routine is required
          - Unable to register the same data type twice
        - Unregistration is partially forgiving
          - Ignores types that are not registered
          - Raises exceptions when no type information is provided
    2) Generation Process (The repeated generation of values from a previously registered routine)
        - Note that what is proven is the EXECUTION OF a registered routine; tests in this unit WILL NOT validate whether or not your specific routine is working as intended

  Assuming the construction and level of testing are sufficient for your context, the below collection of unit tests could easily be used as a skeleton
  for building a random generator in other programming languages (especially if you use the same public facing composition).

  Delphi Specific Note: A data type cannot be registered with the random generator unless said data type returns a System.TypInfo.TTypeInfo structure from the System.TypeInfo() routine.}
{$ENDREGION}

uses
  {Delphi}
  System.Rtti,
  {DUnitX}
  DUnitX.TestFramework,
  {Proven Entities}
  PE.Buckets;

type
  SUT_DEFAULT_CLOSURE_TYPE = Integer;

type
  {Trying an approach I'm calling "Author Framing" (currently very much in the form of a contract)
   - Maybe consider calling it "partially-executable specification"
   - Maybe an "author contract"}

  [TextFixture]
  ProveTypeEquivalenceBetweenAGenericBucketAndConcreteBucketT<T; Q: PE.Buckets.Buckets.SUTTypeMapping<T>> = class
  public
    [Test]procedure TypeQInheritsFromTheSUTTemplate();
  public {Type Identity Tests}
    [Test]procedure TypeQsBucketInTypeAndTheStandardBucketInTypeShareTheSameTypeIdentity();
    [Test]procedure TypeQsBucketInInclusionRoutineTypeSharesTheSameTypeIdentityAsTheStandardBucketInTypesInclusionRoutinePropertysType();
    [Test]procedure TypeQsBucketInLabelTypeSharesTheSameTypeIdentityAsTheStandardBucketInTypesLabelType();
    [Test]procedure TypeQsBucketInPredictionCountTypeSharesTheSameTypeIdentityAsTheStandardBucketInTypesPredictionCountType();
  public {Assignment Compatibility Tests}
    [Test]procedure CanAssignTypeQsBucketInTypeToTheStandardBucketInTypeAndViceVersa();
    [Test]procedure CanAssignAQDotLabelPropertyToAStandardBucketDotLabelPropertyAndViceVersa();
    [Test]procedure CanAssignAQDotInclusionRoutinePropertyToAStandardBucketDotInclusionRoutinePropertyAndViceVersa();
    [Test]procedure CanAssignAQDotPredictionCountPropertyToAStandardBucketDotPredictionCountPropertyAndViceVersa();
  public {equality operator: are equal when 3 fields (inclusion routine, label, prediction count) are equal}
    [Test]procedure BucketInInstancesAreEqualWhenBothInstancesHaveTheSameDefaultValuesForTheInclusionRoutineAndLabelAndPredictionCountFields();
    [Test]procedure BucketInInstancesAreEqualWhenBothInstancesHaveTheSameNonDefaultValuesForTheInclusionRoutineAndLabelAndPredictionCountFields();
  end;

  [TestFixture]
  Buckets_Proof = class
  type
    [TestFixture]
    InclusionRoutineType<T> = class
    public
      [Test]class procedure IsAssignmentCompatibleWithAnAnonymousMethodDefinedAsAFunctionWithASingleConstantParameterOfTypeAndValueTAndReturningABooleanValue();
      [Test]class procedure IsAssignmentCompatibleWithAProceduralTypeDefinedAsAFunctionWithASingleConstantParameterOfTypeAndValueTAndReturningABooleanValue();
    end;
  end;

  //User supplied
  [TestFixture]
  ProveTypeEqualityWithInteger = class(ProveTypeEquivalenceBetweenAGenericBucketAndConcreteBucketT<Integer, PE.Buckets.Buckets.SUTTypeMapping<Integer>>)
  end;

  [TestFixture]
  BucketIn_Assertions = record
  public //Assertions
    class procedure ABucketInTypeIsARecordWith3KnownFields(); static;
  end;

  BucketOut_Assertions = record
    class procedure ABucketOutTypeIsARecordWith3KnownFields(); static;
  end;

  Terms = class
  type
    InclusionRoutineType = PE.Buckets.Buckets.InclusionRoutine<SUT_DEFAULT_CLOSURE_TYPE>;
    LabelType = PE.Buckets.Buckets.TLabelType;
    PredictionCountType = PE.Buckets.Buckets.TPredictionCount;
    BucketIn = class
    type
      {named,predictive} {named,smart} {predictive,smart}
      IsA = class
      public
        class function FullBucket<Q>(const ABucketIn: PE.Buckets.Buckets.BucketIn<Q>): Boolean; static;
        class function NamedBucket<Q>(const ABucketIn: PE.Buckets.Buckets.BucketIn<Q>): Boolean; static;
        class function PredictiveBucket<Q>(const ABucketIn: PE.Buckets.Buckets.BucketIn<Q>): Boolean; static;
        class function SmartBucket<Q>(const ABucketIn: PE.Buckets.Buckets.BucketIn<Q>): Boolean; static;
      end;
      [TestFixture]
      Tests = class
      type
        [TestFixture]
        TypeTests = class
          [Test]class procedure TheInclusionRoutineFieldIsDefinedUsingTheInclusionRoutineType();
          [Test]class procedure TheDefaultValueForTheInclusionRoutineTypeIsNil();
          [Test]class procedure TheDefaultValueForTheLabelTypeIsAnEmptyString();
          [Test]class procedure TheDefaultValueForThePredictionCountTypeIsZero();
        end;
      public {Primary Definitions}
        [Test]class procedure ADefaultBucketIsIdenticalToThatGeneratedByTheSystemDotDefaultRoutine();
        [Test]class procedure AFullBucketIsABucketThatHasNonDefaultValuesForTheInclusionRoutineAndLabelAndPredictionCount();
        [Test]class procedure ANamedBucketIsABucketThatHasANonDefaultLabelRegardlessOfTheValuesForTheInclusionRoutineOrPredictionCount();
        [Test]class procedure AnUntouchedVariableDeclarationIsIdenticalToADefaultBucket();
        [Test]class procedure APredictiveBucketIsABucketThatHasANonDefaultPredictionCountRegardlessOfTheValuesForTheLabelOrInclusionRoutine();
        [Test]class procedure ASmartBucketIsABucketThatHasAnInclusionRoutineRegardlessOfTheValuesForTheLabelOrPredictionCount();
      public
        [Test]class procedure BucketAIsEqualToBucketBWhenAll3FieldsAreIdentical();
      type
        IfPassing_WeCanSayThat = class
        public {Secondary Definitions}
          [Test]class procedure AFullBucketIsABucketWhereAll3FieldsHaveNonDefaultContent();
        end;
      end;
    public {Executable Terms}
      class function DefaultBucket<Q>(): PE.Buckets.Buckets.BucketIn<Q>; static;
      class function FullBucket<Q>(): PE.Buckets.Buckets.BucketIn<Q>; static;
      class function NamedBucket<Q>: PE.Buckets.Buckets.BucketIn<Q>; static;
      class function PredictiveBucket<Q>: PE.Buckets.Buckets.BucketIn<Q>; static;
      class function SmartBucket<Q>(): PE.Buckets.Buckets.BucketIn<Q>; static;
    end;
    BucketOut = class
    type
      IsA = class
      public
        class function NamedBucket(const ABucketOut: Buckets.BucketOut): Boolean; static;
        class function PredictiveBucket(const ABucketOut: Buckets.BucketOut): Boolean; static;
      end;
      [TestFixture]
      Tests = class
      public
        [Test]class procedure ADefaultBucketIsIdenticalToThatGeneratedByTheSystemDotDefaultRoutine();
        [Test]class procedure ANamedBucketIsABucketThatHasANonDefaultLabelRegardlessOfTheValuesForThePredictionCountOrRecordedCount();
        [Test]class procedure APredictiveBucketIsABucketThatHasANonDefaultPredictionCountRegardlessOfTheValuesForTheLabelOrRecordedCount();
        [Test]class procedure AnUntouchedVariableDeclarationIsIdenticalToADefaultBucket();
        [Test]class procedure BucketAIsEqualToBucketBWhenAll3FieldValuesAreIdentical();
      end;
    public
      class function DefaultBucket(): PE.Buckets.Buckets.BucketOut; static;
    end;
    BucketInAndBucketOut = class
    type
      [TestFixture]
      Tests = class
      public
        [Test]class procedure ABucketOutAndBucketInAreConsideredTheSameIfTheyHaveTheExactSameLabelAndTheExactSamePredictionCountRegardlessOfTheInclusionRoutineOrRecordedCount();
      end;
    public
      class function AreTheSame<Q>(const ABucketIn: PE.Buckets.Buckets.BucketIn<Q>; const ABucketOut: PE.Buckets.Buckets.BucketOut): Boolean;
    end;
  end;

  Buckets_SortMember_ReturnValueBehavior_Tests<T> = class
  strict protected
    procedure ReturnsTheSameBucketsOutInTheSameOrderAsYWhenGivenDataCollectionXAndABucketsInY(const X: TArray<T>; const Y: TArray<Buckets.BucketIn<T>>);
  public {No buckets in = No buckets out}
    [Test]procedure ReturnsZeroBucketsWhenGivenAnEmptyDataCollectionAndZeroBuckets();
    [Test]procedure ReturnsZeroBucketsWhenGivenAPopulatedDataCollectionAndZeroBuckets();
  public {1 bucket in = 1 same bucket out (regardless of the data collection or type of bucket in)}
    [Test]procedure ReturnsOneSameBucketWhenGivenAnEmptyDataCollectionAndASingleDefaultBucket();
    [Test]procedure ReturnsOneSameBucketWhenGivenAnEmptyDataCollectionAndASingleNamedBucket();
    [Test]procedure ReturnsOneSameBucketWhenGivenAnEmptyDataCollectionAndASinglePredictiveBucket();
    [Test]procedure ReturnsOneSameBucketWhenGivenAnEmptyDataCollectionAndASingleSmartBucket();
    [Test]procedure ReturnsOneSameBucketWhenGivenAPopulatedDataCollectionAndASingleDefaultBucket();
    [Test]procedure ReturnsOneSameBucketWhenGivenAPopulatedDataCollectionAndASingleNamedBucket();
    [Test]procedure ReturnsOneSameBucketWhenGivenAPopulatedDataCollectionAndASinglePredictiveBucket();
    [Test]procedure ReturnsOneSameBucketWhenGivenAPopulatedDataCollectionAndASingleSmartBucket();
  public {Multiple buckets in = multiple same buckets out (regardless of the data collection or type of bucket in)}
    [Test]procedure ReturnsXOutBucketsWhenGivenAnEmptyDataCollectionAndXDefaultInBucketsSuchThatTheInBucketsAndOutBucketsAreTheSameAndInTheSameOrder();
  public
    [Test]procedure ReturnsTheSameNonDefaultBucketsOutInTheSameOrderAsIsProvidedByTheNonDefaultBucketsIn();
  end;

  [TestFixture]
  Buckets_SortMember_ReturnValueBehavior_DefaultClosureType_Tests = class (Buckets_SortMember_ReturnValueBehavior_Tests<SUT_DEFAULT_CLOSURE_TYPE>)
  end;

implementation

uses
  {Delphi}
//  System.Generics.Collections,
  System.SysUtils,
  System.TypInfo;

{ Buckets_SortMember_ReturnValueBehavior_BucketIn_Tests<T> }

procedure Buckets_SortMember_ReturnValueBehavior_Tests<T>.ReturnsOneSameBucketWhenGivenAnEmptyDataCollectionAndASingleDefaultBucket;
begin
  ReturnsTheSameBucketsOutInTheSameOrderAsYWhenGivenDataCollectionXAndABucketsInY([], [Terms.BucketIn.DefaultBucket<T>()]);
end;

procedure Buckets_SortMember_ReturnValueBehavior_Tests<T>.ReturnsOneSameBucketWhenGivenAnEmptyDataCollectionAndASingleNamedBucket;
var
  Actual: Buckets.BucketIn<T>;
begin
  //Initialization
  Actual := Buckets.BucketIn<T>.Create(nil, 0, TGUID.NewGuid().ToString());
  //Test
  Assert.IsTrue(Terms.BucketIn.IsA.NamedBucket<T>(Actual), 'Boundary Check - Actual is not a named bucket');
  ReturnsTheSameBucketsOutInTheSameOrderAsYWhenGivenDataCollectionXAndABucketsInY([], [Actual]);
end;

procedure Buckets_SortMember_ReturnValueBehavior_Tests<T>.ReturnsOneSameBucketWhenGivenAnEmptyDataCollectionAndASinglePredictiveBucket;
var
  Actual: Buckets.BucketIn<T>;
begin
  //Initialization
  Actual := Buckets.BucketIn<T>.Create(nil, Random(100) + 1);
  //Test
  Assert.IsTrue(Terms.BucketIn.IsA.PredictiveBucket<T>(Actual), 'Boundary Check - Actual is not a predictive bucket');
  ReturnsTheSameBucketsOutInTheSameOrderAsYWhenGivenDataCollectionXAndABucketsInY([], [Actual]);
end;

procedure Buckets_SortMember_ReturnValueBehavior_Tests<T>.ReturnsOneSameBucketWhenGivenAnEmptyDataCollectionAndASingleSmartBucket;
begin
  ReturnsTheSameBucketsOutInTheSameOrderAsYWhenGivenDataCollectionXAndABucketsInY([], [Terms.BucketIn.SmartBucket<T>()]);
end;

procedure Buckets_SortMember_ReturnValueBehavior_Tests<T>.ReturnsOneSameBucketWhenGivenAPopulatedDataCollectionAndASingleDefaultBucket;
var
  ActualData: TArray<T>;
begin
  //Initialization
  SetLength(ActualData, Random(8) + 2);
  //Test
  Assert.IsFalse(ActualData = TArray<T>.Create(), 'Boundary Check - The actual data collection is empty');
  ReturnsTheSameBucketsOutInTheSameOrderAsYWhenGivenDataCollectionXAndABucketsInY(ActualData, [Terms.BucketIn.DefaultBucket<T>()]);
end;

procedure Buckets_SortMember_ReturnValueBehavior_Tests<T>.ReturnsOneSameBucketWhenGivenAPopulatedDataCollectionAndASingleNamedBucket;
var
  Actual: Buckets.BucketIn<T>;
  ActualData: TArray<T>;
begin
  //Initialization
  Actual := Buckets.BucketIn<T>.Create(nil, 0, TGUID.NewGuid().ToString());
  SetLength(ActualData, Random(8) + 2);
  //Test
  Assert.IsTrue(Terms.BucketIn.IsA.NamedBucket<T>(Actual), 'Boundary Check - Actual is not a named bucket');
  Assert.IsFalse(ActualData = TArray<T>.Create(), 'Boundary Check - The actual data collection is empty');
  ReturnsTheSameBucketsOutInTheSameOrderAsYWhenGivenDataCollectionXAndABucketsInY(ActualData, [Actual]);
end;

procedure Buckets_SortMember_ReturnValueBehavior_Tests<T>.ReturnsOneSameBucketWhenGivenAPopulatedDataCollectionAndASinglePredictiveBucket;
var
  Actual: Buckets.BucketIn<T>;
  ActualData: TArray<T>;
begin
  //Initialization
  Actual := Buckets.BucketIn<T>.Create(nil, Random(100) + 1);
  SetLength(ActualData, Random(8) + 2);
  //Test
  Assert.IsTrue(Terms.BucketIn.IsA.PredictiveBucket<T>(Actual), 'Boundary Check - Actual is not a predictive bucket');
  Assert.IsFalse(ActualData = TArray<T>.Create(), 'Boundary Check - The actual data collection is empty');
  ReturnsTheSameBucketsOutInTheSameOrderAsYWhenGivenDataCollectionXAndABucketsInY(ActualData, [Actual]);
end;

procedure Buckets_SortMember_ReturnValueBehavior_Tests<T>.ReturnsOneSameBucketWhenGivenAPopulatedDataCollectionAndASingleSmartBucket;
var
  ActualData: TArray<T>;
begin
  //Initialization
  SetLength(ActualData, Random(8) + 2);
  //Test
  Assert.IsFalse(ActualData = TArray<T>.Create(), 'Boundary Check - The actual data collection is empty');
  ReturnsTheSameBucketsOutInTheSameOrderAsYWhenGivenDataCollectionXAndABucketsInY(ActualData, [Terms.BucketIn.SmartBucket<T>()]);
end;

procedure Buckets_SortMember_ReturnValueBehavior_Tests<T>.ReturnsTheSameBucketsOutInTheSameOrderAsYWhenGivenDataCollectionXAndABucketsInY(
  const X: TArray<T>; const Y: TArray<Buckets.BucketIn<T>>);
var
  Actual: TArray<Buckets.BucketOut>;
  I: Integer;
begin
  //Initialization
  SetLength(Actual, Length(Y) + 1);
  //Test
  Assert.AreNotEqual<NativeUInt>(Length(Actual), Length(Y), 'Boundary Check - Expected and actual are already the same size');
  Actual := Buckets.SortDataCollectionXIntoCustomBucketsY<T>(X, Y);
  Assert.AreEqual<NativeUInt>(Length(Actual), Length(Y), 'Expected and actual are not the same size');
  for I := Low(Y) to High(Y) do
    Assert.IsTrue(Terms.BucketInAndBucketOut.AreTheSame<T>(Y[I], Actual[I]), 'The in bucket and out bucket are not the same');
end;

procedure Buckets_SortMember_ReturnValueBehavior_Tests<T>.ReturnsTheSameNonDefaultBucketsOutInTheSameOrderAsIsProvidedByTheNonDefaultBucketsIn;
var
  Actual: TArray<Buckets.BucketOut>;
  ActualLabels: TArray<string>;
  Expected: TArray<Buckets.BucketIn<T>>;
  I: NativeInt;
begin
  //Initialization
  Actual := [];
  ActualLabels := [];
  Expected := [];
  for I := 1 to (Random(10) + 1) do
    Expected := Expected + [Buckets.BucketIn<T>.Create(nil, 0, TGUID.NewGuid().ToString())];
  //Test
  Assert.IsTrue(Length(Expected) >= 1, 'Boundary Check - Expected does not have at least 1 element');
  Assert.IsTrue(Length(Expected) <= 10, 'Boundary Check - Expected has more than 10 elements');
  Assert.AreEqual<NativeUInt>(0, Length(ActualLabels), 'Boundary Check - The actual label list is not empty');
  for I := Low(Expected) to High(Expected) do
  begin
    Assert.AreNotEqual<Buckets.BucketIn<T>>(Terms.BucketIn.DefaultBucket<T>(), Expected[I], 'Boundary Check - An expected element is the same as a default bucket in');
    Assert.DoesNotContain(ActualLabels, Expected[I]._Label, 'Boundary Check - Duplicate label detected');
    ActualLabels := ActualLabels + [Expected[I]._Label];
  end;
  Assert.AreEqual<NativeUInt>(Length(Expected), Length(ActualLabels), 'Boundary Check - The expected and actual label list are not the same size');
  Assert.AreEqual<NativeUInt>(0, Length(Actual), 'Boundary Check - Actual is not empty');
  Actual := Buckets.SortDataCollectionXIntoCustomBucketsY<T>([], Expected);
  Assert.AreEqual<NativeUInt>(Length(Expected), Length(Actual), 'Expected and actual are not the same size');
  for I := Low(Expected) to High(Expected) do
  begin
    Assert.AreNotEqual(Terms.BucketOut.DefaultBucket(), Actual[I], 'An actual element is the same as a default bucket out');
    Assert.AreEqual(Expected[I]._Label, Actual[I]._Label, 'Labels are not equal');
  end;
end;

procedure Buckets_SortMember_ReturnValueBehavior_Tests<T>.ReturnsXOutBucketsWhenGivenAnEmptyDataCollectionAndXDefaultInBucketsSuchThatTheInBucketsAndOutBucketsAreTheSameAndInTheSameOrder;
begin

end;

procedure Buckets_SortMember_ReturnValueBehavior_Tests<T>.ReturnsZeroBucketsWhenGivenAnEmptyDataCollectionAndZeroBuckets;
begin
  ReturnsTheSameBucketsOutInTheSameOrderAsYWhenGivenDataCollectionXAndABucketsInY([], []);
end;

procedure Buckets_SortMember_ReturnValueBehavior_Tests<T>.ReturnsZeroBucketsWhenGivenAPopulatedDataCollectionAndZeroBuckets;
var
  ActualData: TArray<T>;
begin
  //Initialization
  SetLength(ActualData, Random(8) + 2);
  //Test
  Assert.IsFalse(ActualData = TArray<T>.Create(), 'Boundary Check - The actual data collection is empty');
  ReturnsTheSameBucketsOutInTheSameOrderAsYWhenGivenDataCollectionXAndABucketsInY(ActualData, []);
end;

{ BucketIn_Assertions }

class procedure BucketIn_Assertions.ABucketInTypeIsARecordWith3KnownFields;
var
  ActualFields: TArray<TRttiField>;
  Actual: TRttiType;
  Expected: TRttiRecordType;
begin
  //Initialization
  Actual := nil;
  ActualFields := [];
  Expected := nil;
  //Test
  Assert.IsNull(Actual, 'Assertion Failed - Actual is already assigned');
  Actual := TRttiContext.Create().GetType(TypeInfo(Buckets.BucketIn<SUT_DEFAULT_CLOSURE_TYPE>));
  Assert.IsNotNull(Actual, 'Assertion Failed - Actual is not assigned');
  Assert.IsNull(Expected, 'Assertion Failed - Actual is already assigned');
  Expected := (Actual as TRttiRecordType);
  Assert.IsNotNull(Expected, 'Assertion Failed - Expected is not assigned');
  Assert.IsTrue(Expected is TRttiRecordType, 'Assertion Failed - Expected should reference an RTTI record type');
  Assert.AreNotEqual<NativeUInt>(3, Length(ActualFields), 'Assertion Failed - The actual field list already has 3 elements');
  ActualFields := Expected.GetFields();
  Assert.AreEqual<NativeUInt>(3, Length(ActualFields), 'Assertion Failed- The actual field list does not have 3 elements');
  Assert.AreEqual<string>('FInclusionRoutine', ActualFields[Low(ActualFields)].Name, 'Assertion Failed- The 1st actual field does not have the expected name');
  Assert.AreEqual<string>('FLabel', ActualFields[Low(ActualFields) + 1].Name, 'Assertion Failed- The 2nd actual field does not have the expected name');
  Assert.AreEqual<string>('FPredictionCount', ActualFields[Low(ActualFields) + 2].Name, 'Assertion Failed- The 3rd actual field does not have the expected name');
end;

{ BucketOut_Assertions }

class procedure BucketOut_Assertions.ABucketOutTypeIsARecordWith3KnownFields;
var
  ActualFieldNames: TArray<TRttiField>;
  ActualFields: TArray<TRttiField>;
  Actual: TRttiType;
  Expected: TRttiRecordType;
begin
  //Initialization
  Actual := nil;
  ActualFields := [];
  Expected := nil;
  //Test
  Assert.IsNull(Actual, 'Assertion Failed - Actual is already assigned');
  Actual := TRttiContext.Create().GetType(TypeInfo(Buckets.BucketOut));
  Assert.IsNotNull(Actual, 'Assertion Failed - Actual is not assigned');
  Assert.IsNull(Expected, 'Assertion Failed - Actual is already assigned');
  Expected := (Actual as TRttiRecordType);
  Assert.IsNotNull(Expected, 'Assertion Failed - Expected is not assigned');
  Assert.IsTrue(Expected is TRttiRecordType, 'Assertion Failed - Expected should reference an RTTI record type');
  Assert.AreNotEqual<NativeUInt>(3, Length(ActualFields), 'Assertion Failed - The actual field list already has 3 elements');
  ActualFields := Expected.GetFields();
  Assert.AreEqual<NativeUInt>(3, Length(ActualFields), 'Assertion Failed- The actual field list does not have 3 elements');
  Assert.AreEqual<string>('FLabel', ActualFields[Low(ActualFields)].Name, 'Assertion Failed- The 1st actual field does not have the expected name');
  Assert.AreEqual<string>('FPredictionCount', ActualFields[Low(ActualFields) + 1].Name, 'Assertion Failed- The 2nd actual field does not have the expected name');
  Assert.AreEqual<string>('FRecordedCount', ActualFields[Low(ActualFields) + 2].Name, 'Assertion Failed- The 3rd actual field does not have the expected name');
end;

{ Terms.BucketIn.Tests }

class procedure Terms.BucketIn.Tests.ADefaultBucketIsIdenticalToThatGeneratedByTheSystemDotDefaultRoutine;
begin
  Assert.AreEqual(Default(Buckets.BucketIn<SUT_DEFAULT_CLOSURE_TYPE>), DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>(), 'Values are not equal');
end;

class procedure Terms.BucketIn.Tests.AFullBucketIsABucketThatHasNonDefaultValuesForTheInclusionRoutineAndLabelAndPredictionCount;
var
  EntityUnderTest: Buckets.BucketIn<SUT_DEFAULT_CLOSURE_TYPE>;
begin
  //Assertions
  BucketIn_Assertions.ABucketInTypeIsARecordWith3KnownFields();
  //Initialization
  EntityUnderTest := Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>();
  //Test 1
//  Assert.IsTrue(Terms.BucketIn.IsA.FullBucket<SUT_DEFAULT_CLOSURE_TYPE>(Terms.BucketIn.FullBucket<SUT_DEFAULT_CLOSURE_TYPE>), 'The full bucket term is not considered a full bucket');
  //Test 2
  Assert.AreEqual<Buckets.BucketIn<SUT_DEFAULT_CLOSURE_TYPE>>(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>(), EntityUnderTest, 'Boundary Check - The Entity under test is not a default bucket');
  Assert.IsFalse(Terms.BucketIn.IsA.FullBucket<SUT_DEFAULT_CLOSURE_TYPE>(EntityUnderTest), 'Boundary Check - The entity under test is already considered a full bucket (a default bucket is the opposite of a full bucket)');
  //Label change
  Assert.AreEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>()._Label, EntityUnderTest._Label, 'Boundary Check - The label is not the default label');
  EntityUnderTest._Label := TGUID.NewGuid().ToString();
  Assert.AreNotEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>()._Label, EntityUnderTest._Label, 'Boundary Check - The label is still the default label');
  Assert.IsFalse(Terms.BucketIn.IsA.FullBucket<SUT_DEFAULT_CLOSURE_TYPE>(EntityUnderTest), 'The entity under test is considered a full bucket (only has a label)');
  //Inclusion routine change
  Assert.AreEqual<Buckets.InclusionRoutine<SUT_DEFAULT_CLOSURE_TYPE>>(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().InclusionRoutine, EntityUnderTest.InclusionRoutine, 'Boundary Check - The inclusion routine is not default inclusion routine');
  EntityUnderTest.InclusionRoutine := function (const AValue: SUT_DEFAULT_CLOSURE_TYPE): Boolean begin Result := False; end;
  Assert.AreNotEqual<Buckets.InclusionRoutine<SUT_DEFAULT_CLOSURE_TYPE>>(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().InclusionRoutine, EntityUnderTest.InclusionRoutine, 'Boundary Check - The inclusion routine is still the default inclusion routine');
  Assert.IsFalse(Terms.BucketIn.IsA.FullBucket<SUT_DEFAULT_CLOSURE_TYPE>(EntityUnderTest), 'The entity under test is considered a full bucket (only has a label and an inclusion routine)');
  //Prediction count change
  Assert.AreEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().PredictionCount, EntityUnderTest.PredictionCount, 'Boundary Check - The prediction count is not the default prediction count');
  EntityUnderTest.PredictionCount := Random(100) + 1;
  Assert.AreNotEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().PredictionCount, EntityUnderTest.PredictionCount, 'Boundary Check - The prediction count is still the default prediction count value');
  Assert.IsTrue(Terms.BucketIn.IsA.FullBucket<SUT_DEFAULT_CLOSURE_TYPE>(EntityUnderTest), 'The entity under test is not considered a full bucket (yet is has non-default values in all 3)');
end;

class procedure Terms.BucketIn.Tests.ANamedBucketIsABucketThatHasANonDefaultLabelRegardlessOfTheValuesForTheInclusionRoutineOrPredictionCount;
var
  EntityUnderTest: Buckets.BucketIn<SUT_DEFAULT_CLOSURE_TYPE>;
begin
  //Assertions
  BucketIn_Assertions.ABucketInTypeIsARecordWith3KnownFields();
  //Initialization
  EntityUnderTest := Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>();
  //Test 1
  Assert.IsTrue(Terms.BucketIn.IsA.NamedBucket<SUT_DEFAULT_CLOSURE_TYPE>(Terms.BucketIn.NamedBucket<SUT_DEFAULT_CLOSURE_TYPE>), 'The named bucket term is not considered a named bucket');
  //Test 2
  Assert.AreEqual<Buckets.BucketIn<SUT_DEFAULT_CLOSURE_TYPE>>(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>(), EntityUnderTest, 'Boundary Check - The Entity under test is not a default bucket');
  Assert.IsFalse(Terms.BucketIn.IsA.NamedBucket<SUT_DEFAULT_CLOSURE_TYPE>(EntityUnderTest), 'Boundary Check - The entity under test is already considered a named bucket');
  //Label change
  Assert.AreEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>()._Label, EntityUnderTest._Label, 'Boundary Check - The label is not the default label');
  EntityUnderTest._Label := TGUID.NewGuid().ToString();
  Assert.AreNotEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>()._Label, EntityUnderTest._Label, 'Boundary Check - The label is still the default label');
  Assert.IsTrue(Terms.BucketIn.IsA.NamedBucket<SUT_DEFAULT_CLOSURE_TYPE>(EntityUnderTest), 'The entity under test is not considered a named bucket (label change)');
  //Inclusion routine change
  Assert.AreEqual<Buckets.InclusionRoutine<SUT_DEFAULT_CLOSURE_TYPE>>(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().InclusionRoutine, EntityUnderTest.InclusionRoutine, 'Boundary Check - The inclusion routine is not default inclusion routine');
  EntityUnderTest.InclusionRoutine := function (const AValue: SUT_DEFAULT_CLOSURE_TYPE): Boolean begin Result := False; end;
  Assert.AreNotEqual<Buckets.InclusionRoutine<SUT_DEFAULT_CLOSURE_TYPE>>(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().InclusionRoutine, EntityUnderTest.InclusionRoutine, 'Boundary Check - The inclusion routine is still the default inclusion routine');
  Assert.IsTrue(Terms.BucketIn.IsA.NamedBucket<SUT_DEFAULT_CLOSURE_TYPE>(EntityUnderTest), 'The entity under test is not considered a named bucket (inclusion routine change)');
  //Prediction count change
  Assert.AreEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().PredictionCount, EntityUnderTest.PredictionCount, 'Boundary Check - The prediction count is not the default prediction count');
  EntityUnderTest.PredictionCount := Random(100) + 1;
  Assert.AreNotEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().PredictionCount, EntityUnderTest.PredictionCount, 'Boundary Check - The prediction count is still the default prediction count value');
  Assert.IsTrue(Terms.BucketIn.IsA.NamedBucket<SUT_DEFAULT_CLOSURE_TYPE>(EntityUnderTest), 'The entity under test is not considered a named bucket (prediction count change)');
end;

class procedure Terms.BucketIn.Tests.AnUntouchedVariableDeclarationIsIdenticalToADefaultBucket;
var
  Actual: PE.Buckets.Buckets.BucketIn<SUT_DEFAULT_CLOSURE_TYPE>;
begin
  Assert.AreEqual(Default(PE.Buckets.Buckets.BucketIn<SUT_DEFAULT_CLOSURE_TYPE>), Actual, 'Values are not equal');
end;

class procedure Terms.BucketIn.Tests.APredictiveBucketIsABucketThatHasANonDefaultPredictionCountRegardlessOfTheValuesForTheLabelOrInclusionRoutine;
var
  EntityUnderTest: Buckets.BucketIn<SUT_DEFAULT_CLOSURE_TYPE>;
begin
  //Assertions
  BucketIn_Assertions.ABucketInTypeIsARecordWith3KnownFields();
  //Initialization
  EntityUnderTest := Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>();
  //Test 1
  Assert.IsTrue(Terms.BucketIn.IsA.PredictiveBucket<SUT_DEFAULT_CLOSURE_TYPE>(Terms.BucketIn.PredictiveBucket<SUT_DEFAULT_CLOSURE_TYPE>), 'The predictive bucket term is not considered a predictive bucket');
  //Test 2
  Assert.AreEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>(), EntityUnderTest, 'Boundary Check - The Entity under test is not the default bucket');
  Assert.IsFalse(Terms.BucketIn.IsA.PredictiveBucket<SUT_DEFAULT_CLOSURE_TYPE>(EntityUnderTest), 'Boundary Check - The entity under test is already considered a predictive bucket');
  //Prediction count
  Assert.AreEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().PredictionCount, EntityUnderTest.PredictionCount, 'Boundary Check - The prediction count is the default prediction count');
  EntityUnderTest.PredictionCount := Random(100) + 1;
  Assert.AreNotEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().PredictionCount, EntityUnderTest.PredictionCount, 'Boundary Check - The prediction count is still the default prediction count');
  Assert.IsTrue(Terms.BucketIn.IsA.PredictiveBucket<SUT_DEFAULT_CLOSURE_TYPE>(EntityUnderTest), 'The entity under test is not considered a predictive bucket');
  //Label
  Assert.AreEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>()._Label, EntityUnderTest._Label, 'Boundary Check - The label is the not default label');
  EntityUnderTest._Label := TGUID.NewGuid().ToString();
  Assert.AreNotEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>()._Label, EntityUnderTest._Label, 'Boundary Check - The label is still default label');
  Assert.IsTrue(Terms.BucketIn.IsA.PredictiveBucket<SUT_DEFAULT_CLOSURE_TYPE>(EntityUnderTest), 'The entity under test is not considered a predictive bucket');
  //Inclusion routine
  Assert.AreEqual<Buckets.InclusionRoutine<SUT_DEFAULT_CLOSURE_TYPE>>(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().InclusionRoutine, EntityUnderTest.InclusionRoutine, 'Boundary Check - The inclusion routine is not the default inclusion routine');
  EntityUnderTest.InclusionRoutine := function (const AValue: SUT_DEFAULT_CLOSURE_TYPE): Boolean begin Result := False; end;
  Assert.AreNotEqual<Buckets.InclusionRoutine<SUT_DEFAULT_CLOSURE_TYPE>>(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().InclusionRoutine, EntityUnderTest.InclusionRoutine, 'Boundary Check - The inclusion routine is still the default inclusion routine');
  Assert.IsTrue(Terms.BucketIn.IsA.PredictiveBucket<SUT_DEFAULT_CLOSURE_TYPE>(EntityUnderTest), 'The entity under test is not considered a predictive bucket');
end;

class procedure Terms.BucketIn.Tests.ASmartBucketIsABucketThatHasAnInclusionRoutineRegardlessOfTheValuesForTheLabelOrPredictionCount;
var
  EntityUnderTest: Buckets.BucketIn<SUT_DEFAULT_CLOSURE_TYPE>;
begin
  //Assertions
  BucketIn_Assertions.ABucketInTypeIsARecordWith3KnownFields();
  //Initialization
  EntityUnderTest := Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>();
  //Test 1
  Assert.IsTrue(Terms.BucketIn.IsA.SmartBucket<SUT_DEFAULT_CLOSURE_TYPE>(Terms.BucketIn.SmartBucket<SUT_DEFAULT_CLOSURE_TYPE>), 'The smart bucket term is not considered a smart bucket');
  //Test 2
  Assert.AreEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>(), EntityUnderTest, 'Boundary Check - The Entity under test is not a default bucket in');
  Assert.IsFalse(Terms.BucketIn.IsA.SmartBucket<SUT_DEFAULT_CLOSURE_TYPE>(EntityUnderTest), 'Boundary Check - The entity under test is already considered a smart bucket');
  Assert.AreEqual<Buckets.InclusionRoutine<SUT_DEFAULT_CLOSURE_TYPE>>(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().InclusionRoutine, EntityUnderTest.InclusionRoutine, 'Boundary Check - The inclusion routine is not the default inclusion routine');
  EntityUnderTest.InclusionRoutine := function (const AValue: SUT_DEFAULT_CLOSURE_TYPE): Boolean begin Result := False; end;
  Assert.AreNotEqual<Buckets.InclusionRoutine<SUT_DEFAULT_CLOSURE_TYPE>>(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().InclusionRoutine, EntityUnderTest.InclusionRoutine, 'Boundary Check - The inclusion routine is still the default inclusion routine');
  Assert.IsTrue(Terms.BucketIn.IsA.SmartBucket<SUT_DEFAULT_CLOSURE_TYPE>(EntityUnderTest), 'The entity under test is not considered a smart bucket (inclusion routine change)');
  Assert.AreEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>()._Label, EntityUnderTest._Label, 'Boundary Check - The label is not the default label');
  EntityUnderTest._Label := TGUID.NewGuid().ToString();
  Assert.AreNotEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>()._Label, EntityUnderTest._Label, 'Boundary Check - The label is still the default label');
  Assert.IsTrue(Terms.BucketIn.IsA.SmartBucket<SUT_DEFAULT_CLOSURE_TYPE>(EntityUnderTest), 'The entity under test is not considered a smart bucket (label change)');
  Assert.AreEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().PredictionCount, EntityUnderTest.PredictionCount, 'Boundary Check - The prediction count is not the default prediction count');
  EntityUnderTest.PredictionCount := Random(100) + 1;
  Assert.AreNotEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().PredictionCount, EntityUnderTest.PredictionCount, 'Boundary Check - The prediction count is still the default prediction count value');
  Assert.IsTrue(Terms.BucketIn.IsA.SmartBucket<SUT_DEFAULT_CLOSURE_TYPE>(EntityUnderTest), 'The entity under test is not considered a smart bucket (prediction count change)');
end;

class procedure Terms.BucketIn.Tests.BucketAIsEqualToBucketBWhenAll3FieldsAreIdentical;
var
  A: PE.Buckets.Buckets.BucketIn<SUT_DEFAULT_CLOSURE_TYPE>;
  B: PE.Buckets.Buckets.BucketIn<SUT_DEFAULT_CLOSURE_TYPE>;
begin
  //Assertions
  BucketIn_Assertions.ABucketInTypeIsARecordWith3KnownFields();
  //Initialization
  A := Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>();
  B := Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>();
  //Test
  Assert.AreEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>(), A, 'Boundary Check - Bucket A is not a default bucket');
  Assert.AreEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>(), B, 'Boundary Check - Bucket B is not a default bucket');
  Assert.AreEqual(A, B, 'Bucket A and B are not equal');

  A._Label := TGUID.NewGuid().ToString();
  Assert.AreNotEqual(A, B, 'Boundary Check - Bucket A and B are equal');
  B._Label := A._Label;
  Assert.AreEqual(A, B, 'Bucket A and B are not equal');

  A.InclusionRoutine := function (const AValue: SUT_DEFAULT_CLOSURE_TYPE): Boolean begin case Random(1) of 0: Result := False; 1: Result := True; else raise Exception.Create('Should not be possible'); end  end;
  Assert.AreNotEqual(A, B, 'Boundary Check - Bucket A and B are equal');
  B.InclusionRoutine := A.InclusionRoutine;
  Assert.AreEqual(A, B, 'Bucket A and B are not equal');

  A.PredictionCount := Random(100) + 1;
  Assert.AreNotEqual(A, B, 'Boundary Check - Bucket A and B are equal');
  B.PredictionCount := A.PredictionCount;
  Assert.AreEqual(A, B, 'Bucket A and B are not equal');
end;

{ Terms.BucketIn }

class function Terms.BucketIn.DefaultBucket<Q>: PE.Buckets.Buckets.BucketIn<Q>;
begin
end;

class function Terms.BucketIn.FullBucket<Q>: PE.Buckets.Buckets.BucketIn<Q>;
begin

end;

class function Terms.BucketIn.NamedBucket<Q>: PE.Buckets.Buckets.BucketIn<Q>;
begin
  Result := DefaultBucket<Q>.Create(nil, 0, TGUID.NewGuid().ToString());
end;

class function Terms.BucketIn.PredictiveBucket<Q>: PE.Buckets.Buckets.BucketIn<Q>;
begin
  Result.PredictionCount := DefaultBucket<Q>.PredictionCount + Random(1000) + 1;
end;

class function Terms.BucketIn.SmartBucket<Q>: PE.Buckets.Buckets.BucketIn<Q>;
begin
  Result := PE.Buckets.Buckets.BucketIn<Q>.Create(function (const Dummy: Q): Boolean begin Result := False; end);
end;

{ Terms.BucketOut }

class function Terms.BucketOut.DefaultBucket: PE.Buckets.Buckets.BucketOut;
begin
  Result := Default(PE.Buckets.Buckets.BucketOut);
end;

{ Terms.BucketOut.Tests }

class procedure Terms.BucketOut.Tests.ADefaultBucketIsIdenticalToThatGeneratedByTheSystemDotDefaultRoutine;
begin
  Assert.AreEqual(Default(PE.Buckets.Buckets.BucketOut), DefaultBucket(), 'Values are not equal');
end;

class procedure Terms.BucketOut.Tests.ANamedBucketIsABucketThatHasANonDefaultLabelRegardlessOfTheValuesForThePredictionCountOrRecordedCount;
var
  EntityUnderTest: Buckets.BucketOut;
begin
  //Assertions
  BucketOut_Assertions.ABucketOutTypeIsARecordWith3KnownFields();
  //Initialization
  EntityUnderTest := Terms.BucketOut.DefaultBucket();
  //Test
  Assert.AreEqual(Terms.BucketOut.DefaultBucket(), EntityUnderTest, 'Boundary Check - The Entity under test is not the default bucket out');
  Assert.IsFalse(Terms.BucketOut.IsA.NamedBucket(EntityUnderTest), 'Boundary Check - The entity under test is already considered a named bucket');
  //Label
  Assert.AreEqual(Terms.BucketOut.DefaultBucket()._Label, EntityUnderTest._Label, 'Boundary Check - The label is the default label');
  EntityUnderTest._Label := TGUID.NewGuid().ToString();
  Assert.AreNotEqual(Terms.BucketOut.DefaultBucket()._Label, EntityUnderTest._Label, 'Boundary Check - The label is still the default label');
  Assert.IsTrue(Terms.BucketOut.IsA.NamedBucket(EntityUnderTest), 'The entity under test is not considered a named bucket (label change)');
  //Prediction count
  Assert.AreEqual(Terms.BucketOut.DefaultBucket().PredictionCount, EntityUnderTest.PredictionCount, 'Boundary Check - The prediction count is the default prediction count');
  EntityUnderTest.PredictionCount := Random(100) + 1;
  Assert.AreNotEqual(Terms.BucketOut.DefaultBucket().PredictionCount, EntityUnderTest.PredictionCount, 'Boundary Check - The prediction count is still the default prediction count');
  Assert.IsTrue(Terms.BucketOut.IsA.NamedBucket(EntityUnderTest), 'The entity under test is not considered a named bucket (prediction count change)');
  //Recorded count
  Assert.AreEqual(Terms.BucketOut.DefaultBucket().RecordedCount, EntityUnderTest.RecordedCount, 'Boundary Check - The recorded count is the default recorded count');
  EntityUnderTest.RecordedCount := Random(100) + 1;
  Assert.AreNotEqual(Terms.BucketOut.DefaultBucket().RecordedCount, EntityUnderTest.RecordedCount, 'Boundary Check - The recorded count is still the default recorded count');
  Assert.IsTrue(Terms.BucketOut.IsA.NamedBucket(EntityUnderTest), 'The entity under test is not considered a named bucket (recorded count change)');
end;

class procedure Terms.BucketOut.Tests.AnUntouchedVariableDeclarationIsIdenticalToADefaultBucket;
var
  Actual: PE.Buckets.Buckets.BucketOut;
begin
  Assert.AreEqual(Default(PE.Buckets.Buckets.BucketOut), Actual, 'Values are not equal');
end;

class procedure Terms.BucketOut.Tests.APredictiveBucketIsABucketThatHasANonDefaultPredictionCountRegardlessOfTheValuesForTheLabelOrRecordedCount;
var
  EntityUnderTest: Buckets.BucketOut;
begin
  //Assertions
  BucketOut_Assertions.ABucketOutTypeIsARecordWith3KnownFields();
  //Initialization
  EntityUnderTest := Terms.BucketOut.DefaultBucket();
  //Test
  Assert.AreEqual(Terms.BucketOut.DefaultBucket(), EntityUnderTest, 'Boundary Check - The Entity under test is not the default bucket out');
  Assert.IsFalse(Terms.BucketOut.IsA.PredictiveBucket(EntityUnderTest), 'Boundary Check - The entity under test is already considered a predictive bucket');
  //Prediction count
  Assert.AreEqual(Terms.BucketOut.DefaultBucket().PredictionCount, EntityUnderTest.PredictionCount, 'Boundary Check - The prediction count is the default prediction count');
  EntityUnderTest.PredictionCount := Random(100) + 1;
  Assert.AreNotEqual(Terms.BucketOut.DefaultBucket().PredictionCount, EntityUnderTest.PredictionCount, 'Boundary Check - The prediction count is still the default prediction count');
  Assert.IsTrue(Terms.BucketOut.IsA.PredictiveBucket(EntityUnderTest), 'The entity under test is not considered a predictive bucket');
  //Label
  Assert.AreEqual(Terms.BucketOut.DefaultBucket()._Label, EntityUnderTest._Label, 'Boundary Check - The label is the not default label');
  EntityUnderTest._Label := TGUID.NewGuid().ToString();
  Assert.AreNotEqual(Terms.BucketOut.DefaultBucket()._Label, EntityUnderTest._Label, 'Boundary Check - The label is still default label');
  Assert.IsTrue(Terms.BucketOut.IsA.PredictiveBucket(EntityUnderTest), 'The entity under test is not considered a predictive bucket');
  //Recorded count
  Assert.AreEqual(Terms.BucketOut.DefaultBucket().RecordedCount, EntityUnderTest.RecordedCount, 'Boundary Check - The recorded count is not the default recorded count');
  EntityUnderTest.RecordedCount := Random(100) + 1;
  Assert.AreNotEqual(Terms.BucketOut.DefaultBucket().RecordedCount, EntityUnderTest.RecordedCount, 'Boundary Check - The recorded count is still the default recorded count');
  Assert.IsTrue(Terms.BucketOut.IsA.PredictiveBucket(EntityUnderTest), 'The entity under test is not considered a predictive bucket');
end;

class procedure Terms.BucketOut.Tests.BucketAIsEqualToBucketBWhenAll3FieldValuesAreIdentical;
var
  A: PE.Buckets.Buckets.BucketOut;
  B: PE.Buckets.Buckets.BucketOut;
begin
  //Assertions
  BucketOut_Assertions.ABucketOutTypeIsARecordWith3KnownFields();
  //Initialization
  A := Terms.BucketOut.DefaultBucket();
  B := Terms.BucketOut.DefaultBucket();
  //Test
  Assert.AreEqual(Terms.BucketOut.DefaultBucket(), A, 'Boundary Check - Bucket A is not a default bucket');
  Assert.AreEqual(Terms.BucketOut.DefaultBucket(), B, 'Boundary Check - Bucket B is not a default bucket');
  Assert.AreEqual(A, B, 'Boundary Check - Bucket A and B are not equal (both default)');
  //Label
  A._Label := TGUID.NewGuid().ToString();
  Assert.AreNotEqual(A, B, 'Boundary Check - Bucket A and B are equal');
  B._Label := A._Label;
  Assert.AreEqual(A, B, 'Bucket A and B are not equal (Same labels)');
  //Prediction count
  A.PredictionCount := Random(100) + 1;
  Assert.AreNotEqual(A, B, 'Boundary Check - Bucket A and B are equal');
  B.PredictionCount := A.PredictionCount;
  Assert.AreEqual(A, B, 'Bucket A and B are not equal (Same prediction counts)');
  //Recorded count
  A.RecordedCount := Random(100) + 1;
  Assert.AreNotEqual(A, B, 'Boundary Check - Bucket A and B are equal');
  B.RecordedCount := A.RecordedCount;
  Assert.AreEqual(A, B, 'Bucket A and B are not equal (Same record counts)');
end;

{ Terms.BucketIn.IsA }

class function Terms.BucketIn.IsA.FullBucket<Q>(const ABucketIn: PE.Buckets.Buckets.BucketIn<Q>): Boolean;
begin
  Result := Assigned(ABucketIn.InclusionRoutine) and (ABucketIn._Label <> '') and (ABucketIn.PredictionCount <> 0);
end;

class function Terms.BucketIn.IsA.NamedBucket<Q>(const ABucketIn: PE.Buckets.Buckets.BucketIn<Q>): Boolean;
begin
  Result := (ABucketIn._Label <> Terms.BucketIn.DefaultBucket<Q>._Label);
end;

class function Terms.BucketIn.IsA.PredictiveBucket<Q>(const ABucketIn: PE.Buckets.Buckets.BucketIn<Q>): Boolean;
begin
  Result := (ABucketIn.PredictionCount <> Terms.BucketIn.DefaultBucket<Q>.PredictionCount);
end;

class function Terms.BucketIn.IsA.SmartBucket<Q>(const ABucketIn: PE.Buckets.Buckets.BucketIn<Q>): Boolean;
begin
  Result := Assigned(ABucketIn.InclusionRoutine);
end;

{ Terms.BucketOut.IsA }

class function Terms.BucketOut.IsA.NamedBucket(const ABucketOut: Buckets.BucketOut): Boolean;
begin
  Result := (ABucketOut._Label <> Terms.BucketOut.DefaultBucket()._Label);
end;

class function Terms.BucketOut.IsA.PredictiveBucket(const ABucketOut: Buckets.BucketOut): Boolean;
begin
  Result := (ABucketOut.PredictionCount <> Terms.BucketOut.DefaultBucket().PredictionCount);
end;

{ Terms.BucketInAndBucketOut.Tests }

class procedure Terms.BucketInAndBucketOut.Tests.ABucketOutAndBucketInAreConsideredTheSameIfTheyHaveTheExactSameLabelAndTheExactSamePredictionCountRegardlessOfTheInclusionRoutineOrRecordedCount;
var
  BucketIn: Buckets.BucketIn<SUT_DEFAULT_CLOSURE_TYPE>;
  BucketOut: Buckets.BucketOut;
begin
  //Assertions
  BucketIn_Assertions.ABucketInTypeIsARecordWith3KnownFields();
  BucketOut_Assertions.ABucketOutTypeIsARecordWith3KnownFields();
  //Initialization
  BucketIn := Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>();
  BucketOut := Terms.BucketOut.DefaultBucket();
  //Test
  Assert.AreEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>(), BucketIn, 'Boundary Check - The bucket in is not the default bucket in');
  Assert.AreEqual(Terms.BucketOut.DefaultBucket(), BucketOut, 'Boundary Check - The bucket out is not the default bucket out');
  Assert.IsTrue(Terms.BucketInAndBucketOut.AreTheSame<SUT_DEFAULT_CLOSURE_TYPE>(BucketIn, BucketOut), 'Bucket in and bucket out are not the same (should both be the same when both are default)');
  //Label
  Assert.AreEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>()._Label, BucketIn._Label, 'Boundary Check - The label is not the default label');
  BucketIn._Label := TGUID.NewGuid().ToString();
  Assert.AreNotEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>()._Label, BucketIn._Label, 'Boundary Check - The label is still the default label');
  Assert.AreNotEqual(BucketIn._Label, BucketOut._Label, 'Boundary Check - The labels are already equal');
  Assert.IsFalse(Terms.BucketInAndBucketOut.AreTheSame<SUT_DEFAULT_CLOSURE_TYPE>(BucketIn, BucketOut), 'Bucket in and bucket out are the same (labels are varied)');
  BucketOut._Label := BucketIn._Label;
  Assert.AreEqual(BucketIn._Label, BucketOut._Label, 'Boundary Check - The labels are not equal');
  Assert.IsTrue(Terms.BucketInAndBucketOut.AreTheSame<SUT_DEFAULT_CLOSURE_TYPE>(BucketIn, BucketOut), 'Bucket in and bucket out are not the same (from default to same labels)');
  //Prediction count
  Assert.AreEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().PredictionCount, BucketIn.PredictionCount, 'Boundary Check - The prediction count is not the default prediction count');
  BucketIn.PredictionCount := Random(100) + 1;
  Assert.AreNotEqual(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().PredictionCount, BucketIn.PredictionCount, 'Boundary Check - The prediction count is still the default prediction count');
  Assert.AreNotEqual(BucketIn.PredictionCount, BucketOut.PredictionCount, 'Boundary Check - The prediction counts are already equal');
  Assert.IsFalse(Terms.BucketInAndBucketOut.AreTheSame<SUT_DEFAULT_CLOSURE_TYPE>(BucketIn, BucketOut), 'Bucket in and bucket out are the same (prediction counts are varied)');
  BucketOut.PredictionCount := BucketIn.PredictionCount;
  Assert.AreEqual(BucketIn.PredictionCount, BucketOut.PredictionCount, 'Boundary Check - The prediction counts are not equal');
  Assert.IsTrue(Terms.BucketInAndBucketOut.AreTheSame<SUT_DEFAULT_CLOSURE_TYPE>(BucketIn, BucketOut), 'Bucket in and bucket out are not the same (from same labels and same prediction counts)');
  //Inclusion routine
  Assert.AreEqual<Buckets.InclusionRoutine<SUT_DEFAULT_CLOSURE_TYPE>>(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().InclusionRoutine, BucketIn.InclusionRoutine, 'Boundary Check - The inclusion routine is not the default inclusion routine');
  BucketIn.InclusionRoutine := function (const X: SUT_DEFAULT_CLOSURE_TYPE): Boolean begin Result := False end;
  Assert.AreNotEqual<Buckets.InclusionRoutine<SUT_DEFAULT_CLOSURE_TYPE>>(Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>().InclusionRoutine, BucketIn.InclusionRoutine, 'Boundary Check - The inclusion routine is still the default inclusion routine');
  Assert.IsTrue(Terms.BucketInAndBucketOut.AreTheSame<SUT_DEFAULT_CLOSURE_TYPE>(BucketIn, BucketOut), 'Bucket in and bucket out are not the same (bucket in has a non-default inclusion routine)');
  //Recorded count
  Assert.AreEqual(Terms.BucketOut.DefaultBucket().RecordedCount, BucketOut.RecordedCount, 'Boundary Check - The recorded count is not the default recorded count');
  BucketOut.RecordedCount := Random(100) + 1;
  Assert.AreNotEqual(Terms.BucketOut.DefaultBucket().RecordedCount, BucketOut.RecordedCount, 'Boundary Check - The recorded count is still the default recorded count');
  Assert.IsTrue(Terms.BucketInAndBucketOut.AreTheSame<SUT_DEFAULT_CLOSURE_TYPE>(BucketIn, BucketOut), 'Bucket in and bucket out are not the same (bucket out has a non-default recorded count)');
end;

{ Terms.BucketInAndBucketOut }

class function Terms.BucketInAndBucketOut.AreTheSame<Q>(const ABucketIn: PE.Buckets.Buckets.BucketIn<Q>;
  const ABucketOut: PE.Buckets.Buckets.BucketOut): Boolean;
begin
  Result := (ABucketIn._Label = ABucketOut._Label) and (ABucketIn.PredictionCount = ABucketOut.PredictionCount);
end;

{ Terms.BucketIn.Tests.IfPassing_WeCanSayThat }

class procedure Terms.BucketIn.Tests.IfPassing_WeCanSayThat.AFullBucketIsABucketWhereAll3FieldsHaveNonDefaultContent;
var
  EntityUnderTest: PE.Buckets.Buckets.BucketIn<SUT_DEFAULT_CLOSURE_TYPE>;
begin
  //Assertions
  BucketIn_Assertions.ABucketInTypeIsARecordWith3KnownFields();
  //Initialization
  EntityUnderTest := Terms.BucketIn.DefaultBucket<SUT_DEFAULT_CLOSURE_TYPE>();
  //Test 1
//  Assert.IsFalse(Terms.BucketIn.IsA<SUT_DEFAULT_CLOSURE_TYPE>(), EntityUnderTest, 'Boundary Check - The entity under test is already a full bucket');

//  Assert.IsFalse(Terms.BucketIn.FullBucket<SUT_DEFAULT_CLOSURE_TYPE>(), EntityUnderTest, 'Boundary Check - The entity under test is already a full bucket');
  //Test 2
//  Assert.IsFalse(Terms.BucketIn.IsA.FullBucket<SUT_DEFAULT_CLOSURE_TYPE>(), EntityUnderTest, 'Boundary Check - The entity under test is already a full bucket');
//  EntityUnderTest := Terms.BucketIn.FullBucket<SUT_DEFAULT_CLOSURE_TYPE>();

end;

{ Terms.BucketIn.Tests.TypeTests }

class procedure Terms.BucketIn.Tests.TypeTests.TheDefaultValueForTheInclusionRoutineTypeIsNil;
begin
  Assert.AreEqual(nil, Default(Terms.InclusionRoutineType), 'Values are not equal');
end;

class procedure Terms.BucketIn.Tests.TypeTests.TheDefaultValueForTheLabelTypeIsAnEmptyString;
begin
  Assert.AreEqual('', Default(Terms.LabelType), 'Values are not equal');
end;

class procedure Terms.BucketIn.Tests.TypeTests.TheDefaultValueForThePredictionCountTypeIsZero;
begin
  Assert.AreEqual(0, Default(Terms.PredictionCountType), 'Values are not equal');
end;

class procedure Terms.BucketIn.Tests.TypeTests.TheInclusionRoutineFieldIsDefinedUsingTheInclusionRoutineType;
var
  Actual: PTypeInfo;
  Expected: PTypeInfo;
begin
  //Initialization
  Actual := nil;
  Expected := TypeInfo(Terms.InclusionRoutineType);
  //Test
  Assert.IsTrue(Assigned(Expected), 'Boundary Check - Expected is not assigned');
  Assert.IsFalse(Assigned(Actual), 'Boundary Check - Actual is already assigned');
  Assert.AreNotEqual(Expected, Actual, 'Boundary Check - Expected and actual are already equal');
  Actual := TypeInfo(PE.Buckets.Buckets.InclusionRoutine<SUT_DEFAULT_CLOSURE_TYPE>);
  Assert.AreEqual(Expected, Actual, 'Expected and actual are not equal');
end;

class procedure Buckets_Proof.InclusionRoutineType<T>.IsAssignmentCompatibleWithAnAnonymousMethodDefinedAsAFunctionWithASingleConstantParameterOfTypeAndValueTAndReturningABooleanValue;
var
  Actual: PE.Buckets.Buckets.SUTTypeMapping<T>.BUCKET_IN_INCLUSION_ROUTINE_TYPE;
begin
  //Initialization
  Actual := nil;
  //Test
  Assert.IsFalse(Assigned(Actual), 'Boundary Check - Actual is already assigned');
  Actual := function (const T: T): Boolean begin Result := False end;
  Assert.IsTrue(Assigned(Actual), 'Actual is not assigned');
end;

class procedure Buckets_Proof.InclusionRoutineType<T>.IsAssignmentCompatibleWithAProceduralTypeDefinedAsAFunctionWithASingleConstantParameterOfTypeAndValueTAndReturningABooleanValue;
type
  ActualType = function (const AValue: T): Boolean;
var
  Actual: Buckets.InclusionRoutineA<T>;
  Expected: Buckets.InclusionRoutine<T>;
begin
  {$IF GetTypeKind(ActualType) = tkProcedure}
  //Test
  Expected := Actual;
  {$ELSE}
    {$MESSAGE FATAL 'The local actual type must be a recognizable procedural type'}
  {$ENDIF}
end;

{ ProveItAll<T, Q> }

procedure ProveTypeEquivalenceBetweenAGenericBucketAndConcreteBucketT<T, Q>.BucketInInstancesAreEqualWhenBothInstancesHaveTheSameDefaultValuesForTheInclusionRoutineAndLabelAndPredictionCountFields;
var
  StandardBucket: PE.Buckets.Buckets.BucketIn<T>;
begin
  //Validation (Showing that the default values for the expected types match the default values for the actual types)
  Assert.AreEqual(Default(PE.Buckets.Buckets.InclusionRoutine<T>), Default(Q.BUCKET_IN_INCLUSION_ROUTINE_TYPE), 'Validation Failure - The default values for the inclusion routine types are not equal');
  Assert.AreEqual(Default(PE.Buckets.Buckets.TLabelType), Default(Q.BUCKET_IN_LABEL_TYPE), 'Validation Failure - The default values for the label types are not equal');
  Assert.AreEqual(Default(PE.Buckets.Buckets.TPredictionCount), Default(Q.BUCKET_IN_PREDICTION_COUNT_TYPE), 'Validation Failure - The default values for the prediction count types are not equal');
  //Initialization
  var QBucket: Q.BUCKET_IN_TYPE;
  //Test
  Assert.IsFalse(Assigned(Default(PE.Buckets.Buckets.InclusionRoutine<T>)), 'Boundary Check - The default value for a bucket''s inclusion routine is not nil');
  Assert.IsFalse(Assigned(StandardBucket.InclusionRoutine), 'Boundary Check - The standard bucket has a non-default inclusion routine');
  Assert.AreEqual(Default(PE.Buckets.Buckets.TLabelType), StandardBucket._Label, 'Boundary Check - The standard bucket has a non-default label');
  Assert.AreEqual(Default(PE.Buckets.Buckets.TPredictionCount), StandardBucket.PredictionCount, 'Boundary Check - The standard bucket has a non-default prediction count');
  Assert.AreEqual<PE.Buckets.Buckets.InclusionRoutine<T>>(StandardBucket.InclusionRoutine, QBucket.InclusionRoutine, 'Boundary Check - The standard and q buckets do not have the same inclusion routine');
  Assert.AreEqual(StandardBucket._Label, QBucket._Label, 'Boundary Check - The standard and q buckets does have the same label');
  Assert.AreEqual(StandardBucket.PredictionCount, QBucket.PredictionCount, 'Boundary Check - The standard and q buckets does have the same prediction count');
  Assert.AreEqual(StandardBucket, QBucket, 'The standard and q buckets are not equal');
end;

procedure ProveTypeEquivalenceBetweenAGenericBucketAndConcreteBucketT<T, Q>.CanAssignTypeQsBucketInTypeToTheStandardBucketInTypeAndViceVersa;
var
  Expected: PE.Buckets.Buckets.BucketIn<T>;
begin
  //Initialization
  var Actual: Q.BUCKET_IN_TYPE;
  //Test
  Expected := Actual;
  Actual := Expected;
  Assert.Pass('Compiling in considered passing for this context');
end;

procedure ProveTypeEquivalenceBetweenAGenericBucketAndConcreteBucketT<T, Q>.BucketInInstancesAreEqualWhenBothInstancesHaveTheSameNonDefaultValuesForTheInclusionRoutineAndLabelAndPredictionCountFields;
var
  StandardBucket: PE.Buckets.Buckets.BucketIn<T>;
begin
  //Validation (Showing that the default values for the expected types match the default values for the actual types)
  Assert.AreEqual(Default(PE.Buckets.Buckets.InclusionRoutine<T>), Default(Q.BUCKET_IN_INCLUSION_ROUTINE_TYPE), 'Validation Failure - The default values for the inclusion routine types are not equal');
  Assert.AreEqual(Default(PE.Buckets.Buckets.TLabelType), Default(Q.BUCKET_IN_LABEL_TYPE), 'Validation Failure - The default values for the label types are not equal');
  Assert.AreEqual(Default(PE.Buckets.Buckets.TPredictionCount), Default(Q.BUCKET_IN_PREDICTION_COUNT_TYPE), 'Validation Failure - The default values for the prediction count types are not equal');
  //Initialization
  var QBucket: Q.BUCKET_IN_TYPE;
  //Test
  Assert.IsFalse(Assigned(Default(PE.Buckets.Buckets.InclusionRoutine<T>)), 'Boundary Check - The default value for a bucket''s inclusion routine is not nil');
  Assert.IsFalse(Assigned(StandardBucket.InclusionRoutine), 'Boundary Check - The standard bucket has a non-default inclusion routine');
  Assert.AreEqual(Default(PE.Buckets.Buckets.TLabelType), StandardBucket._Label, 'Boundary Check - The standard bucket has a non-default label');
  Assert.AreEqual(Default(PE.Buckets.Buckets.TPredictionCount), StandardBucket.PredictionCount, 'Boundary Check - The standard bucket has a non-default prediction count');
  Assert.AreEqual<PE.Buckets.Buckets.InclusionRoutine<T>>(StandardBucket.InclusionRoutine, QBucket.InclusionRoutine, 'Boundary Check - The standard and q buckets do not have the same inclusion routine');
  Assert.AreEqual(StandardBucket._Label, QBucket._Label, 'Boundary Check - The standard and q buckets does have the same label');
  Assert.AreEqual(StandardBucket.PredictionCount, QBucket.PredictionCount, 'Boundary Check - The standard and q buckets does have the same prediction count');
  Assert.AreEqual(StandardBucket, QBucket, 'The standard and q buckets are not equal');
end;

procedure ProveTypeEquivalenceBetweenAGenericBucketAndConcreteBucketT<T, Q>.CanAssignAQDotInclusionRoutinePropertyToAStandardBucketDotInclusionRoutinePropertyAndViceVersa;
var
  StandardBucketIn: PE.Buckets.Buckets.BucketIn<T>;
begin
  var QBucketIn: Q.BUCKET_IN_TYPE;
  StandardBucketIn.InclusionRoutine := QBucketIn.InclusionRoutine;
  QBucketIn.InclusionRoutine := StandardBucketIn.InclusionRoutine;
  Assert.Pass('Compiling in considered passing for this context');
end;

procedure ProveTypeEquivalenceBetweenAGenericBucketAndConcreteBucketT<T, Q>.CanAssignAQDotLabelPropertyToAStandardBucketDotLabelPropertyAndViceVersa;
var
  StandardBucketIn: PE.Buckets.Buckets.BucketIn<T>;
begin
  var QBucketIn: Q.BUCKET_IN_TYPE;
  StandardBucketIn._Label := QBucketIn._Label;
  QBucketIn._Label := StandardBucketIn._Label;
  Assert.Pass('Compiling in considered passing for this context');
end;

procedure ProveTypeEquivalenceBetweenAGenericBucketAndConcreteBucketT<T, Q>.CanAssignAQDotPredictionCountPropertyToAStandardBucketDotPredictionCountPropertyAndViceVersa;
var
  StandardBucketIn: PE.Buckets.Buckets.BucketIn<T>;
begin
  var QBucketIn: Q.BUCKET_IN_TYPE;
  StandardBucketIn.PredictionCount := QBucketIn.PredictionCount;
  QBucketIn.PredictionCount := StandardBucketIn.PredictionCount;
  Assert.Pass('Compiling in considered passing for this context');
end;

procedure ProveTypeEquivalenceBetweenAGenericBucketAndConcreteBucketT<T, Q>.TypeQInheritsFromTheSUTTemplate;
begin
  Assert.InheritsFrom(Q, PE.Buckets.Buckets.SUTTypeMapping<T>, 'Q does not inherit from the SUT template');
end;

procedure ProveTypeEquivalenceBetweenAGenericBucketAndConcreteBucketT<T, Q>.TypeQsBucketInTypeAndTheStandardBucketInTypeShareTheSameTypeIdentity;
var
  Expected: PTypeInfo;
begin
  //Initialization
  Expected := TypeInfo(PE.Buckets.Buckets.BucketIn<T>);
  //Test
  Assert.IsNotNull(Expected, 'Boundary Check - Expected is not assigned');
  Assert.AreEqual<PTypeInfo>(Expected, TypeInfo(PE.Buckets.Buckets.BucketIn<T>), 'Expected does not contain the correct type info');
  Assert.AreEqual<PTypeInfo>(Expected, TypeInfo(Q.BUCKET_IN_TYPE), 'Expected and actual are not equal');
end;

procedure ProveTypeEquivalenceBetweenAGenericBucketAndConcreteBucketT<T, Q>.TypeQsBucketInInclusionRoutineTypeSharesTheSameTypeIdentityAsTheStandardBucketInTypesInclusionRoutinePropertysType;
var
  Expected: PTypeInfo;
begin
  //Initialization
  Expected := TypeInfo(PE.Buckets.Buckets.InclusionRoutine<T>);
  //Test
  Assert.IsNotNull(Expected, 'Boundary Check - Expected is not assigned');
  Assert.AreEqual<PTypeInfo>(Expected, TypeInfo(PE.Buckets.Buckets.InclusionRoutine<T>), 'Expected does not contain the correct type info');
  Assert.AreEqual<PTypeInfo>(Expected, TypeInfo(Q.BUCKET_IN_INCLUSION_ROUTINE_TYPE), 'Expected and actual are not equal');
end;

procedure ProveTypeEquivalenceBetweenAGenericBucketAndConcreteBucketT<T, Q>.TypeQsBucketInLabelTypeSharesTheSameTypeIdentityAsTheStandardBucketInTypesLabelType;
var
  Expected: PTypeInfo;
begin
  //Initialization
  Expected := TypeInfo(PE.Buckets.Buckets.TLabelType);
  //Test
  Assert.IsNotNull(Expected, 'Boundary Check - Expected is not assigned');
  Assert.AreEqual<PTypeInfo>(Expected, TypeInfo(PE.Buckets.Buckets.TLabelType), 'Expected does not contain the correct type info');
  Assert.AreEqual<PTypeInfo>(Expected, TypeInfo(Q.BUCKET_IN_LABEL_TYPE), 'Expected and actual are not equal');
end;

procedure ProveTypeEquivalenceBetweenAGenericBucketAndConcreteBucketT<T, Q>.TypeQsBucketInPredictionCountTypeSharesTheSameTypeIdentityAsTheStandardBucketInTypesPredictionCountType;
var
  Expected: PTypeInfo;
begin
  //Initialization
  Expected := TypeInfo(PE.Buckets.Buckets.TPredictionCount);
  //Test
  Assert.IsNotNull(Expected, 'Boundary Check - Expected is not assigned');
  Assert.AreEqual<PTypeInfo>(Expected, TypeInfo(PE.Buckets.Buckets.TPredictionCount), 'Expected does not contain the correct type info');
  Assert.AreEqual<PTypeInfo>(Expected, TypeInfo(Q.BUCKET_IN_PREDICTION_COUNT_TYPE), 'Expected and actual are not equal');
end;

end.
