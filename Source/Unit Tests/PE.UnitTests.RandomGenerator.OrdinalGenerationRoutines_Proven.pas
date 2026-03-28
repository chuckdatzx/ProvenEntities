unit PE.UnitTests.RandomGenerator.OrdinalGenerationRoutines_Proven;

interface

{$REGION 'Ordinal Routines Test Coverage'}
{ALL OF THE FOLLOWING COULD BE CONSIDERED PROVEN WHEN ALL TESTS IN THIS UNIT ARE RETURNING GREEN:

  The following tests arguably prove that:
    1) All of the ordinal generation routines tested will behave as expected when invoked from the random generator
    2) All of the ordinal generation routines tested are "random enough" for general use
      - I say "random enough for general use" because many of the ordinal routines are proven to use Delphi's System.Random() routine.
        This establishes a "chain of trust", such that if you can trust/use the random distribution of the underlying mechanism, you can
        also trust the tested random generation routines.

** If you believe that the following test coverage is insufficient for validating the code under test, please contact the curator(s) of this
   source code. Additional coverage is always welcome!**}
{$ENDREGION}

uses
  {Delphi}
  System.SysUtils,
  {DUnitX}
  DUnitX.TestFramework,
  {Proven Entities}
  PE.Buckets,
  PE.UnitTests.RandomGenerator.TDD.Templates;

type
  ChiSquareGoodnessOfFit = record
  type
    SignificanceLevel = (sl90, sl95, sl97pt5, sl99, sl99pt9);      
  const
    ///<summary>https://www.itl.nist.gov/div898/handbook/eda/section3/eda3674.htm</summary>
    CriticalValuesBySignificanceLevelAndDegreesOfFreedom: array [Low(SignificanceLevel)..High(SignificanceLevel), 1..10] of Real = (
      (2.706, 4.605, 6.251, 7.779, 9.236, 0.645, 2.017, 3.362, 4.684, 5.987),
      (3.841, 5.991, 7.815, 9.488, 11.070, 12.592, 14.067, 15.507, 16.919, 18.307),
      (5.024, 7.378, 9.348, 11.143, 12.833, 14.449, 16.013, 17.535, 19.023, 20.483),
      (6.635, 9.210, 11.345, 13.277, 15.086, 16.812, 18.475, 20.090, 21.666, 23.209),
      (10.828, 13.816, 16.266, 18.467, 20.515, 22.458, 24.322, 26.125, 27.877, 29.588));
  const
    SampleCeiling = 100000000;  //100,000,000
  type
    OccurrencesRange = 0..SampleCeiling;
    SampleSize = 2..SampleCeiling;
    BucketIn<T> = record
    strict private
      FExpectedOccurrences: OccurrencesRange;
      FInclusionRoutine: TFunc<T, Boolean>;
      FLabel: string;
    public
      property ExpectedOccurrences: OccurrencesRange read FExpectedOccurrences;
      property InclusionRoutine: TFunc<T, Boolean> read FInclusionRoutine;
    public
      constructor Create(const ExpectedOccurrences: OccurrencesRange; const InclusionRoutine: TFunc<T, Boolean>; const ALabel: string = '');
    end;
    BucketOut = record
      ActualOccurrences: OccurrencesRange;
    end;
  public
    class function CategorizeSampleOfSizeXIntoBucketsY<Q>(const RoutineUnderTest: TFunc<Q>; const X: SampleSize; const Y: array of BucketIn<Q>): TArray<BucketOut>; static;
    class procedure CanPassUpperTailTestsYGivenSampleSizeX<Q: record>(const ARoutine: TFunc<Q>; const X: SampleSize; const Y: array of BucketIn<Q>; const ASignificanceLevel: SignificanceLevel = sl95); overload; static;
//    class procedure CanPassUpperTailTestsYGivenSampleSizeX(const X: array of Buckets.BucketOut; const ASignificanceLevel: SignificanceLevel = sl95); overload; static;
  end library {Currently Requires DUnitX's Assert class (i.e. is self-validating)};

  RNG_ExerciseTypeT_Ordinal_Tests<T> = class abstract(RNG_ExerciseTypeT_Tests<T>)
  strict private
    class var FRoutineCounter: NativeUInt;
    class function DummyRandom(): UInt32; static;
  public
    [Test]procedure ChainOfTrust_UsesTheSystemDotRandomDelphiRoutine();
  end;

  RNG_ExerciseTypeT_Ordinal_IncludingNegative_Tests<T> = class abstract(RNG_ExerciseTypeT_Ordinal_Tests<T>)
  public
    [Test]procedure CanGenerateAtLeastOneNegativeNumberInASampleSizeOf20();
  end;

  {$REGION 'Ordinal Types (Sealed)'}

    {$REGION 'Boolean Types (Sealed)'}
    [TestFixture]
    RNG_BooleanGenerationTests = class sealed(RNG_ExerciseTypeT_Tests<Boolean>)
    strict protected
      class function RNGRoutine(): TFunc<Boolean>; override;
    public
      ///<summary>Simple chi-square test to validate a "mostly even" (49%) distribution of True and False</summary>
      [Test]procedure ForASessionOf100000_BothTrueAndFalseAreEncountered49PercentOfTheTime();
    end;
    {$ENDREGION}

    {$REGION 'Platform-Dependent Integer Types'}
    [TestFixture]
    RNG_LongIntGenerationTests = class sealed(RNG_ExerciseTypeT_Ordinal_IncludingNegative_Tests<LongInt>)
    strict protected
      class function RNGRoutine(): TFunc<LongInt>; override;
    end;

    [TestFixture]
    RNG_LongWordGenerationTests = class sealed(RNG_ExerciseTypeT_Ordinal_Tests<LongWord>)
    strict protected
      class function RNGRoutine(): TFunc<LongWord>; override;
    end;

    [TestFixture]
    RNG_NativeIntGenerationTests = class sealed(RNG_ExerciseTypeT_Ordinal_IncludingNegative_Tests<NativeInt>)
    strict protected
      class function RNGRoutine(): TFunc<NativeInt>; override;
    end;

    [TestFixture]
    RNG_NativeUIntGenerationTests = class sealed(RNG_ExerciseTypeT_Ordinal_Tests<NativeUInt>)
    strict protected
      class function RNGRoutine(): TFunc<NativeUInt>; override;
    end;
    {$ENDREGION}

    {$REGION 'Platform-Independent Integer Types'}
      [TestFixture]
      RNG_IntegerGenerationTests = class sealed(RNG_ExerciseTypeT_Ordinal_IncludingNegative_Tests<Integer>)
      strict protected
        class function RNGRoutine(): TFunc<Integer>; override;
      end;

      [TestFixture]
      RNG_Int64GenerationTests = class sealed(RNG_ExerciseTypeT_Ordinal_IncludingNegative_Tests<Int64>)
      strict protected
        class function RNGRoutine(): TFunc<Int64>; override;
      end;
    {$ENDREGION}

  {$ENDREGION}

implementation

uses
  {Delphi}
  System.Generics.Collections,
  System.Math,
  System.Rtti,
  {Proven Entities}
  PE.RandomGenerator,
  PE.RandomGenerator.OrdinalGenerationRoutines;

{ RNG_BooleanGenerationTests }

procedure RNG_BooleanGenerationTests.ForASessionOf100000_BothTrueAndFalseAreEncountered49PercentOfTheTime;
var
  Actual: TArray<Boolean>;
  ActualFalse: NativeInt;
  ActualTrue: NativeInt;
  I: Integer;
begin
  //Initialization
  Actual := [];
  ActualFalse := 0;
  ActualTrue := 0;
  //Test
  Assert.IsTrue(Actual = TArray<Boolean>.Create(), 'Boundary Check - Actual is not empty');
  Actual := RandomGeneratorCanGenerateXElementsOfTypeQByRegisteringRoutineY<Boolean>(100000, RNG_Standard_Generation_Routines.RandomBoolean);
  Assert.AreEqual<NativeInt>(100000, Length(Actual), 'Boundary Check - Actual does not have 100,000 elements');
  Assert.AreEqual<NativeInt>(0, ActualFalse, 'Boundary Check - The actual count of False instances is not zero');
  Assert.AreEqual<NativeInt>(0, ActualTrue, 'Boundary Check - The actual count of True instances is not zero');
  for I := Low(Actual) to High(Actual) do
    if Actual[I] then
      Inc(ActualTrue)
    else
      Inc(ActualFalse);
  Assert.IsTrue(ActualFalse > 49000, 'True count failed');
  Assert.IsTrue(ActualFalse > 49000, 'False count failed');
end;

class function RNG_BooleanGenerationTests.RNGRoutine: TFunc<Boolean>;
begin
  Result := RNG_Standard_Generation_Routines.RandomBoolean;
end;

{ RNG_ExerciseTypeT_Ordinal_Tests<T> }

procedure RNG_ExerciseTypeT_Ordinal_Tests<T>.ChainOfTrust_UsesTheSystemDotRandomDelphiRoutine;
var
  Storage: TRandom32Proc;
begin
  //Initialization
  FRoutineCounter := 0;
  //Test
  Assert.AreEqual<NativeUInt>(0, FRoutineCounter, 'Boundary Check - The routine counter is not zero');
  DummyRandom();
  Assert.AreEqual<NativeUInt>(1, FRoutineCounter, 'Boundary Check - The routine counter is not 1');
  FRoutineCounter := 0;
  Storage := Random32Proc;
  try
    Random32Proc := DummyRandom;
    Assert.IsFalse(FRoutineCounter >= 1, 'Boundary Check - The routine counter is not zero');
    RNGRoutine()();
    Assert.IsTrue(FRoutineCounter >= 1, 'The routine counter is not at least one');
  finally
    Random32Proc := Storage;
  end;
end;

class function RNG_ExerciseTypeT_Ordinal_Tests<T>.DummyRandom: UInt32;
begin
  Result := 42;
  Inc(FRoutineCounter);
end;

{ RNG_ExerciseTypeT_Ordinal_IncludingNegative_Tests<T> }

procedure RNG_ExerciseTypeT_Ordinal_IncludingNegative_Tests<T>.CanGenerateAtLeastOneNegativeNumberInASampleSizeOf20;
const
  SampleSize = 20;
var
  Actual: TArray<T>;
  ActualCount: NativeUInt;
  I: Integer;
begin
  //Validation
  Assert.IsTrue(GetTypeKind(T) in [tkInteger, tkInt64], 'Boundary Check - Type T does not have a testable TTypeKind');
  //Test
  ActualCount := 0;
  Actual := RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<T>(20, RNGRoutine());
  Assert.IsFalse(ActualCount > 0, 'Boundary Check - The actual count is already greater than zero');
  for I := Low(Actual) to High(Actual) do
    if (TValue.From<T>(Actual[I]).AsOrdinal < 0) then
      Inc(ActualCount);
  Assert.IsTrue(ActualCount > 0, 'The actual count is zero');
end;

{ RNG_IntegerGenerationTests }

class function RNG_IntegerGenerationTests.RNGRoutine: TFunc<Integer>;
begin
  Result := RNG_Standard_Generation_Routines.RandomInteger;
end;

{ RNG_NativeIntGenerationTests }

class function RNG_NativeIntGenerationTests.RNGRoutine: TFunc<NativeInt>;
begin
  Result := RNG_Standard_Generation_Routines.RandomNativeInt;
end;

{ RNG_LongIntGenerationTests }

class function RNG_LongIntGenerationTests.RNGRoutine: TFunc<LongInt>;
begin
  Result := RNG_Standard_Generation_Routines.RandomLongInt;
end;

{ RNG_NativeUIntGenerationTests }

class function RNG_NativeUIntGenerationTests.RNGRoutine: TFunc<NativeUInt>;
begin
  Result := RNG_Standard_Generation_Routines.RandomNativeUInt;
end;

{ RNG_LongWordGenerationTests }

class function RNG_LongWordGenerationTests.RNGRoutine: TFunc<LongWord>;
begin
  Result := RNG_Standard_Generation_Routines.RandomLongWord;
end;

{ RNG_Int64GenerationTests }

class function RNG_Int64GenerationTests.RNGRoutine: TFunc<Int64>;
begin
  Result := RNG_Standard_Generation_Routines.RandomInt64;
end;

{ EnumStuff }

(*procedure EnumStuff.Test;
type
  MyEnum = (A, B, C);
var
  Actual: TArray<MyEnum>;
  Sorted: TArray<Buckets.BucketOut>;
  X: TFunc<MyEnum>;
begin
  X := RNG_Standard_Generation_Routines.RandomRoutineFromQAndForQ<MyEnum>();
//  ChiSquareGoodnessOfFit.CanPassUpperTailTestsYGivenSampleSizeX<MyEnum>(X, 100,
//    [ChiSquareGoodnessOfFit.BucketIn<MyEnum>.Create(33, function (Value: MyEnum): Boolean begin Result := (Value = A); end),
//    ChiSquareGoodnessOfFit.BucketIn<MyEnum>.Create(33, function (Value: MyEnum): Boolean begin Result := (Value = B); end),
//    ChiSquareGoodnessOfFit.BucketIn<MyEnum>.Create(33, function (Value: MyEnum): Boolean begin Result := (Value = C); end)]);
  Actual := RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<MyEnum>(10000, X);
  Sorted := Buckets.SortDataCollectionXIntoCustomBucketsY<MyEnum>(Actual,
    [Buckets.BucketIn<MyEnum>.Create(function (const Value: MyEnum): Boolean begin Result := (Value = A); end, 3333),
      Buckets.BucketIn<MyEnum>.Create(function (const Value: MyEnum): Boolean begin Result := (Value = B); end, 3333),
      Buckets.BucketIn<MyEnum>.Create(function (const Value: MyEnum): Boolean begin Result := (Value = C); end, 3333)]);
  ChiSquareGoodnessOfFit.CanPassUpperTailTestsYGivenSampleSizeX(Sorted);
end;*)

{ Buckets.BucketIn<T> }

constructor ChiSquareGoodnessOfFit.BucketIn<T>.Create(const ExpectedOccurrences: OccurrencesRange;  
  const InclusionRoutine: TFunc<T, Boolean>; const ALabel: string = '');
begin
  Assert.IsTrue(Assigned(InclusionRoutine), 'Boundary Check - Unable to create a bucket because the inclusion routine is not assigned');
  FExpectedOccurrences := ExpectedOccurrences;
  FInclusionRoutine := InclusionRoutine;  
  FLabel := ALabel;
end;

{ ChiSquareGoodnesOfFit }

class procedure ChiSquareGoodnessOfFit.CanPassUpperTailTestsYGivenSampleSizeX<Q>(
  const ARoutine: TFunc<Q>; const X: SampleSize; const Y: array of BucketIn<Q>; const ASignificanceLevel: SignificanceLevel);
var
  CategorizedData: TArray<BucketOut>;
  CriticalValue: Double;
  BucketsUnderTest: NativeUInt;
  I: NativeInt;
  XSquared: Double;
begin
  //Initialization
  CategorizedData := [];
  CriticalValue := 0.0;
  XSquared := 0.0;
  BucketsUnderTest := 0;
  for I := Low(Y) to High(Y) do
    if (Y[I].ExpectedOccurrences > 0) then
      Inc(BucketsUnderTest);  
  //Test
  Assert.AreEqual<Double>(0.0, CriticalValue, 'Boundary Check - The critical value is already assigned');
  CriticalValue := CriticalValuesBySignificanceLevelAndDegreesOfFreedom[ASignificanceLevel, BucketsUnderTest];
  Assert.AreNotEqual<Double>(0.0, CriticalValue, 'Boundary Check - The critical value is not assigned');
  
  Assert.IsTrue(BucketsUnderTest >= 1, 'Boundary Check - The number of tested buckets must be at least 1');
  Assert.AreNotEqual<NativeInt>(Length(Y), Length(CategorizedData), 'Boundary Check - Buckets in and buckets out are already equal');
  CategorizedData := CategorizeSampleOfSizeXIntoBucketsY<Q>(ARoutine, X, Y);
  Assert.AreEqual<NativeInt>(Length(Y), Length(CategorizedData), 'Boundary Check - Buckets in and buckets out are not equal');
  for I := Low(Y) to High(Y) do
  begin
    if (Y[I].ExpectedOccurrences = 0) then
      Assert.AreEqual<NativeUInt>(0, CategorizedData[I].ActualOccurrences, 'Boundary Check - Bucket should be empty but is not')
    else
      XSquared := XSquared + (Power(CategorizedData[I].ActualOccurrences - Y[I].ExpectedOccurrences, 2) / Y[I].ExpectedOccurrences);
  end;
  if (XSquared > CriticalValue) then
    Assert.FailFmt('The X squared value (%s) is greater than the critical value (%s)', [XSquared.ToString(), CriticalValue.ToString()]);
end;

(*class procedure ChiSquareGoodnessOfFit.CanPassUpperTailTestsYGivenSampleSizeX(
  const X: array of Buckets.BucketOut;
  const ASignificanceLevel: SignificanceLevel);
var
  CriticalValue: Double;
  BucketsUnderTest: NativeUInt;
  I: NativeInt;
  XSquared: Double;
begin
  //Initialization
  CriticalValue := 0.0;
  XSquared := 0.0;
  BucketsUnderTest := Length(X);
  //Test
  Assert.AreEqual<Double>(0.0, CriticalValue, 'Boundary Check - The critical value is already assigned');
  for I := Low(X) to High(X) do
    Assert.AreNotEqual<NativeUInt>(0, X[I].PredictionCount, 'Boundary Check - Bucket "%s" has an expected count of zero');
  CriticalValue := CriticalValuesBySignificanceLevelAndDegreesOfFreedom[ASignificanceLevel, BucketsUnderTest];
  Assert.AreNotEqual<Double>(0.0, CriticalValue, 'Boundary Check - The critical value is not assigned');

  Assert.IsTrue(BucketsUnderTest >= 1, 'Boundary Check - The number of tested buckets must be at least 1');
  for I := Low(X) to High(X) do
    if (X[I].RecordedCount > 0) then
      XSquared := XSquared + (Power(NativeInt(X[I].RecordedCount) - X[I].PredictionCount, 2) / X[I].PredictionCount);
  if (XSquared > CriticalValue) then
    Assert.FailFmt('The X squared value (%s) is greater than the critical value (%s)', [XSquared.ToString(), CriticalValue.ToString()]);
end;*)

class function ChiSquareGoodnessOfFit.CategorizeSampleOfSizeXIntoBucketsY<Q>(
  const RoutineUnderTest: TFunc<Q>; const X: SampleSize;
  const Y: array of BucketIn<Q>): TArray<BucketOut>;
var
  Actual: TArray<Q>;
  I: NativeInt;
begin
  //Validation
  Assert.IsTrue(Assigned(RoutineUnderTest), 'Boundary Check - The routine under test is not assigned (unable to execute any tests without a routine)');
  Assert.IsTrue(X > 0, 'Boundary Check - X is zero (unable to execute any tests with a sample size of zero)');
  Assert.IsTrue(Length(Y) >= 1, 'Boundary Check - Y does not have at least 1 bucket (unable to execute any tests if no categorization is present)');
  //Initialization
  Result := [];
  Actual := [];
  SetLength(Result, Length(Y));
  //Test
  Assert.AreEqual<NativeInt>(Length(Y), Length(Result), 'Boundary Check - The number of bucket counters does not match the number of declared buckets');
  for I := Low(Result) to High(Result) do
    Assert.AreEqual<NativeUInt>(0, Result[I].ActualOccurrences, 'Boundary Check - A bucket count was not initialized to zero');
  Assert.AreEqual<NativeInt>(0, Length(Actual), 'Boundary Check - Actual already has content');
  Actual := RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Q>(X, RoutineUnderTest);
  Assert.AreEqual<NativeInt>(X, Length(Actual), 'Boundary Check - Actual already has content');
  var J: NativeInt;
  for I := Low(Actual) to High(Actual) do
    for J := Low(Y) to High(Y) do
      if Y[J].InclusionRoutine(Actual[I]) then
        Result[J].ActualOccurrences := Result[J].ActualOccurrences + 1;
end;

initialization
  Randomize();  //Since we are testing for randomness and since we are relying on Delphi's System.Random

end.
