unit PE.UnitTests.RandomGenerator.TDD.Templates;

interface

uses
  {Delphi}
  System.TypInfo,
  System.SysUtils,
  {DUnitX}
  DUnitX.TestFramework  //Needed in the interface section to insure that test cases marked w/the [Test] attribute are included
  ;

type
  {$REGION 'TDD Templates'}
  ///<summary>A collection of reusable unit tests against the random generator from the perspective of a "common" user (i.e. most common operations)</summary>
  ///<remarks>If you choose to do no additional testing for your specific type T, at least include these tests to validate typical usage.</remarks>
  RNG_ExerciseTypeT_Tests<T> = class abstract
  strict protected {Contract: Descendents are required to provide the random generation routine under test}
    ///<summary>Returns the random generation routine under test</summary>
    ///<remarks>Override this member to return the actual random generation routine under test. Doing so allows test cases to be executed against the actual random generation routine.</remarks>
    class function RNGRoutine(): TFunc<T>; virtual; abstract;
  strict protected
    ///<summary>Generates and returns X elements of Q type from the random generator</summary>
    ///<param name="Q">The data type under test</param>
    ///<param name="X">The number of elements to generate</param>
    ///<param name="Y">The routine responsible for random generation</param>
    ///<returns>Returns X elements of type Q; all generated within a reliable and tested context</returns>
    ///<remarks>
    ///<p>Causes a test failure of X is zero (since no tests could be executed).</p>
    ///<p>Is an excellent resource for retrieving and analyzing data streams from the random generator (e.g. Does this random data stream for Integer types include negative and positive values?)</p>
    ///</remarks>
    class function RandomGeneratorCanGenerateXElementsOfTypeQByRegisteringRoutineY<Q>(const X: NativeUInt; const Y: TFunc<Q>): TArray<Q>;
  public {Validating Contractural Expectations from Descendents}
    [Test]procedure TheRandomGenerationRoutineIsProvided();
    [Test]procedure TheTypeUnderTestHasTypeInfo();
  public {Registration Focused}
    [Test]procedure CanRegisterAndUnregisterTheProvidedRandomGenerationRoutineASingleTime();
    [Test]procedure CanRegisterAndUnregisterTheProvidedRandomGenerationRoutineMultipleTimes();
  public {Generation Focused}
    [Test]procedure CanExecuteARegisteredRandomRoutineASingleTime();
    [Test]procedure CanExecuteARegisteredRandomRoutineMultipleTimes();
    [Test]procedure CanExecuteTheRegisteredRandomRoutineASingleTime();
    [Test]procedure CanExecuteTheRegisteredRandomRoutineMultipleTimes();
    [Test]procedure ExceptionsRaisedInARegisteredGenerationRoutineFlowOutward();
  end;

  ///<summary>A collection of reusable unit tests focused on the random generator's generation method</summary>
  ///<remarks>Execute this class's tests against your data type by defining a subclass that closes this generic class
  ///(e.g. <c>[TestFixture]MyClass = RNG_GenerationMemberTests_Template&lt;Char&gt;</c>)</remarks>
  RNG_GenerationMemberTests_Template<T> = class
  public
    [Test]procedure CanGenerateASingleValue();
    [Test]procedure CanGenerateMultipleValues();
    [Test]procedure ExceptionsRaisedFromWithinARegisteredGenerationRoutineFlowOutward();
    [Test]procedure RaisesAnExceptionWhenAttemptingGenerationBeforeRegistration();
  end;

  ///<summary>A collection of reusable unit tests focused on the random generator's register method</summary>
  ///<remarks>Execute this class's tests against your data type by defining a subclass that closes this generic class
  ///(e.g. <c>[TestFixture]MyClass = RNG_RegistrationMemberTests_Template&lt;Char&gt;</c>)</remarks>
  RNG_RegistrationMemberTests_Template<T> = class
  public
    [Test]procedure CanRegister();
    [Test]procedure RaisesAnExceptionAndAbortsRegistrationWhenAttemptingToRegisterAPreviouslyRegisteredDataType();
    [Test]procedure RaisesAnExceptionAndAbortsRegistrationWhenGivenAnEmptyRNGRoutine();
  end;

  ///<summary>A collection of reusable unit tests focused on the random generator behaving as a singleton</summary>
  ///<remarks>Execute this class's tests against your data type by defining a subclass that closes this generic class
  ///(e.g. <c>[TestFixture]MyClass = RNG_SingletonTests_Template&lt;Char&gt;</c>)</remarks>
  RNG_SingletonTests_Template<T> = class
  public
    [Test]procedure RegisteringTypeTWithAnyOneInstanceAllowsGenerationFromAllInstances();
    [Test]procedure RegisteringAndUnregisteringTypeTWithAnyOneInstanceIsReflectedInAllInstances();
  end;

  ///<summary>A collection of reusable unit tests focused on the random generator's unregister method</summary>
  ///<remarks>Execute this class's tests against your data type by defining a subclass that closes this generic class
  ///(e.g. <c>[TestFixture]MyClass = RNG_UnregisterMemberTests_Template&lt;Char&gt;</c>)</remarks>
  RNG_UnregisterMemberTests_Template<T> = class
  public
    [Test]procedure CanUnregisterTypeT();
    [Test]procedure UnregisteringTypeT_WhereTIsNotRegistered_DoesNotRaiseAnExceptionAndDoesNotChangeTheRegistration();
  end;
  {$ENDREGION}

  ///<summary>Collection of highly reusable tools for testing the random generator</summary>
  ///<remarks>Members are often declared with the "inline" specifier (since speed is more important than executable size in unit test runners)</remarks>
  RNG_Tests_Utility = record
  public type
    TFilterRoutine<Q> = reference to function (const PreviouslyAcceptedValues: TArray<Q>; const ValueInQuestion: Q): Boolean;
  public {Misc Routines}
    class function FilterXValuesOfQByYRoutine<Q>(const X: TArray<Q>; const Y: TFilterRoutine<Q>): TArray<Q>; static; inline;
    ///<summary>Generic "Dummy" Routine for Data Type Registration</summary>
    ///<returns>The default value for type Q [<c>System.Default(Q)</c>]</returns>
    class function GenerateDefault<Q>(): Q; static; inline;
    ///<summary>Either returns type info or causes the test under execution to fail</summary>
    class function TypeInfoRequired<Q>(const FailureMessage: string = 'Boundary Check - Type Q does not seem to have type info'): PTypeInfo; static; inline;
    ///<summary>Validates whether or not Q's TTypeKind value is in the provided set</summary>
    class procedure TypeQMustBeOfTypeKindX<Q>(const X: TTypeKinds; const ExceptionMsg: string = 'Boundary Check - Type Q''s TTypeKind in not an allowed type kind'); static; inline;
  public {Surgical Slices (Parts of Processes)}
    ///<summary>Verifies that the random generator can generate X values of data type Q</summary>
    ///<param name="Q">The data type under test</param>
    ///<param name="X">The number of values to generate</param>
    ///<remarks>
    ///<p>The X parameter must be greater than zero.</p>
    ///<p>Fails if data type Q is has not been registered with the random generator.</p>
    ///<p>Will not unregister data type Q from the random generator.</p>
    ///</remarks>
    ///<returns>An array with X elements of Q type</returns>
    class function CanGenerateXValuesFromRegisteredDataType<Q>(const X: NativeUInt): TArray<Q>; static; inline;
    ///<summary>Verifies that the random generator can register type Q</summary>
    ///<param name="Q">The data type under test</param>
    ///<param name="ARoutine">The routine to register for generating values of type Q</param>
    ///<remarks>
    ///<p>Fails if the provided random generation routine is empty.</p>
    ///<p>Fails if data type Q has already been registered with the random generator.</p>
    ///<p>Will not unregister data type Q from the random generator.</p>
    ///</remarks>
    class procedure CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<Q>(const ARoutine: TFunc<Q>); static; inline;
    ///<summary>Verifies that the random generator can unregister type Q</summary>
    ///<param name="Q">The data type under test</param>
    ///<remarks>Fails if data type Q was not already registered with the random generator.</remarks>
    class procedure CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<Q>(); static; inline;
  public {Whole Process}
    ///<summary>Verifies that the random generator can register, generate values for, and unregister type Q</summary>
    ///<param name="Q">The data type under test</param>
    ///<param name="X">The number of values the random generator should generate</param>
    ///<param name="Y">The random generation routine to register</param>
    ///<remarks>
    ///<p>Handles registration and unregistration of type Q.</p>
    ///<p>Fails if data type Q is already registered with the random generator.</p>
    ///</remarks>
    class function CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Q>(const X: NativeUInt; const Y: TFunc<Q>): TArray<Q>; static; inline;
    ///<summary>Verifies that exceptions coming from within the random generation routine are not handled</summary>
    ///<param name="Q">The data type under test</param>
    ///<remarks>
    ///<p>Handles registration and unregistration of type Q.</p>
    ///<p>Fails if data type Q is already registered with the random generator.</p>
    class procedure ExceptionsRaisedFromWithinARegisteredGenerationRoutineForTypeQFlowOutward<Q>(); static; inline;
  end;

  resourcestring {Since these resourcestrings are used in generic members, they must be surfaced in the interface section}
    rsf_UnitTests_Exception_RNG_Generation_UnregisteredType = 'Unable to generate a random value because the "%s" type has not been registered';
    rsf_UnitTests_Exception_RNG_Registration_EmptyRNGRoutine = 'Unable to register a random generation routine for the "%s" type because the provided routine is not assigned';
    rsf_UnitTests_Exception_RNG_Registration_TypeAlreadyRegistered = 'Unable to register a random generation routine because the "%s" type has already been registered';

implementation

uses
  {Delphi}
  System.Generics.Collections,
  {Proven Entities}
  PE.RandomGenerator;

{ RNG_GenerationTests<T> }

procedure RNG_GenerationMemberTests_Template<T>.CanGenerateASingleValue;
begin
  RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<T>(RNG_Tests_Utility.GenerateDefault<T>);
  try
    RNG_Tests_Utility.CanGenerateXValuesFromRegisteredDataType<T>(1);
  finally
    RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<T>();
  end;
end;

procedure RNG_GenerationMemberTests_Template<T>.CanGenerateMultipleValues;
begin
  RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<T>(RNG_Tests_Utility.GenerateDefault<T>);
  try
    RNG_Tests_Utility.CanGenerateXValuesFromRegisteredDataType<T>(Random(8) + 2);
  finally
    RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<T>();
  end;
end;

procedure RNG_GenerationMemberTests_Template<T>.ExceptionsRaisedFromWithinARegisteredGenerationRoutineFlowOutward;
begin
  RNG_Tests_Utility.ExceptionsRaisedFromWithinARegisteredGenerationRoutineForTypeQFlowOutward<T>();
end;

procedure RNG_GenerationMemberTests_Template<T>.RaisesAnExceptionWhenAttemptingGenerationBeforeRegistration;
var
  ActualTypeInfo: PTypeInfo;
  ExceptionMessage: string;
  ExceptionRaised: Boolean;
  ExpectedMessage: string;
begin
  //Validation
  ActualTypeInfo := RNG_Tests_Utility.TypeInfoRequired<T>('Boundary Check - Type "T" has already been registered');
  //Initialization
  ExceptionMessage := string.Empty;
  ExceptionRaised := False;
  ExpectedMessage := Format(rsf_UnitTests_Exception_RNG_Generation_UnregisteredType, [ActualTypeInfo.Name]);
  //Test
  Assert.IsFalse(ExceptionRaised, 'Boundary Check - Exception flag is already True');
  Assert.IsNotEmpty(ExpectedMessage, 'Boundary Check - The expected error message is empty');
  Assert.AreNotEqual(ExpectedMessage, ExceptionMessage, 'Boundary Check - Exception messages are already equal');
  try
    RNG.Generate<T>();
  except
    on E: ERNGException do
    begin
      ExceptionMessage := E.Message;
      ExceptionRaised := True;
    end;
  end;
  Assert.IsTrue(ExceptionRaised, 'Exception flag is not True');
  Assert.AreEqual(ExpectedMessage, ExceptionMessage, 'Exception messages are not equal');
end;

{ RNG_SingletonTests }

procedure RNG_SingletonTests_Template<T>.RegisteringTypeTWithAnyOneInstanceAllowsGenerationFromAllInstances;
var
  Actual: TArray<RNG>;
  ActualCounter: NativeInt;
  ActualRoutine: TFunc<T>;
  ActualTypeInfo: PTypeInfo;
  Dummy: TArray<T>;
  Expected: NativeInt;
  I: NativeInt;
begin
  //Initialization
  Actual := [];
  ActualCounter := 0;
  ActualRoutine := function (): T
    begin
      Inc(ActualCounter);
      Result := Default(T);
    end;
  SetLength(Actual, Random(9) + 2);
  Expected := Length(Actual) + 1;
  //Test
  {Validating that the actual routine increments our actual counter}
  Assert.IsTrue(Assigned(ActualRoutine), 'Boundary Check - The actual routine is not assigned');
  Assert.AreEqual<NativeInt>(0, ActualCounter, 'Boundary Check - The actual counter is not zero');
  ActualRoutine();
  Assert.AreEqual<NativeInt>(1, ActualCounter, 'Boundary Check - The actual counter is not one');
  ActualCounter := 0;
  {Validating the rest of our assumptions}
  ActualTypeInfo := RNG_Tests_Utility.TypeInfoRequired<T>('Boundary Check - Type T does not appear to have type info');
  Assert.AreEqual(Expected, Length(Actual) + 1, 'Boundary Check - Expected is not the length of actual plus one');
  Assert.IsTrue(Length(Actual) >= 2, 'Boundary Check - The random instance count is not at least 2');
  Assert.IsTrue(Length(Actual) <= 10, 'Boundary Check - The random instance count is greater than 10');
  Assert.AreEqual<NativeInt>(0, ActualCounter, 'Boundary Check - The actual counter is not zero');
  Assert.AreNotEqual(Expected, ActualCounter, 'Boundary Check - Expected and actual are already equal');
  Assert.DoesNotContain<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, 'Boundary Check - The default SUT type is already registered');
  {After registering with the "singleton", we can generate values from any instance (all calls are shown to intersect the registered generation routine)}
  RNG.RegisterRNGRoutine<T>(ActualRoutine);
  try
    RNG.Generate<T>();
    Assert.AreEqual<NativeInt>(1, ActualCounter, 'The actual counter is not 1');
    for I := Low(Actual) to High(Actual) do
      Dummy := Dummy + [Actual[I].Generate<T>()];
    Assert.AreEqual(Expected, ActualCounter, 'Expected and actual are not equal');
  finally
    RNG.UnRegisterRNGRoutine<T>();
  end;
  Assert.DoesNotContain<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, 'Boundary Check - The default SUT type is still registered');
end;

procedure RNG_SingletonTests_Template<T>.RegisteringAndUnregisteringTypeTWithAnyOneInstanceIsReflectedInAllInstances;
var
  Actual: TArray<RNG>;
  ActualRoutine: TFunc<T>;
  ActualTypeInfo: PTypeInfo;
  I: NativeInt;
  J: NativeInt;
begin
  //Initialization
  Actual := [];
  ActualRoutine := function (): T
    begin
      Result := Default(T);
    end;
  SetLength(Actual, Random(9) + 2);
  //Test
  ActualTypeInfo := RNG_Tests_Utility.TypeInfoRequired<T>('Boundary Check - The actual type info is not assigned');
  Assert.IsTrue(Length(Actual) >= 2, 'Boundary Check - The random instance count is not at least 2');
  Assert.IsTrue(Length(Actual) <= 10, 'Boundary Check - The random instance count is greater than 10');
  {For each instance's list of registered types, the type under test is not present}
  Assert.DoesNotContain<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, 'Boundary Check - The default SUT type is already registered');
  for I := Low(Actual) to High(Actual) do
    Assert.DoesNotContain<PTypeInfo>(Actual[I].RegisteredTypes(), ActualTypeInfo, 'Boundary Check - The default SUT type is already registered');
  {For each instance's list of registered types, the type under test is present when registered from the "singleton"}
  RNG.RegisterRNGRoutine<T>(ActualRoutine);
  try
    Assert.Contains<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, 'Boundary Check - The default SUT type is not registered');
    for I := Low(Actual) to High(Actual) do
      Assert.Contains<PTypeInfo>(Actual[I].RegisteredTypes(), ActualTypeInfo, 'Boundary Check - The default SUT type is not registered');
  finally
    RNG.UnregisterRNGRoutine<T>();
  end;
  {For each instance's list of registered types, the type under test is present when registered from any "non-singleton" instance}
  for I := Low(Actual) to High(Actual) do
  begin
    {For each instance's list of registered types, the type under test is not present}
    Assert.DoesNotContain<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, 'Boundary Check - The default SUT type is was not unregistered');
    for J := Low(Actual) to High(Actual) do
      Assert.DoesNotContain<PTypeInfo>(Actual[J].RegisteredTypes(), ActualTypeInfo, 'Boundary Check - The default SUT type is already registered');
    {For each instance's list of registered types, the type under test is present when registered from instance "I"}
    Actual[I].RegisterRNGRoutine<T>(ActualRoutine);
    try
      Assert.Contains<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, 'The default SUT type is not registered');
      for J := Low(Actual) to High(Actual) do
        Assert.Contains<PTypeInfo>(Actual[J].RegisteredTypes(), ActualTypeInfo, 'The default SUT type is not registered');
    finally
      Actual[I].UnregisterRNGRoutine<T>();
    end;
    {For each instance's list of registered types, the type under test is not present}
    Assert.DoesNotContain<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, 'Boundary Check - The default SUT type is was not unregistered');
    for J := Low(Actual) to High(Actual) do
      Assert.DoesNotContain<PTypeInfo>(Actual[J].RegisteredTypes(), ActualTypeInfo, 'Boundary Check - The default SUT type is already registered');
  end;
end;

{ RNG_RegistrationMemberTests<T> }

procedure RNG_RegistrationMemberTests_Template<T>.CanRegister;
begin
  RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<T>(RNG_Tests_Utility.GenerateDefault<T>);
  RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<T>();
end;

procedure RNG_RegistrationMemberTests_Template<T>.RaisesAnExceptionAndAbortsRegistrationWhenAttemptingToRegisterAPreviouslyRegisteredDataType;
var
  Actual: TArray<PTypeInfo>;
  ActualTypeInfo: PTypeInfo;
  Expected: TArray<PTypeInfo>;
  ExpectedMessage: string;
  ExceptionMessage: string;
  ExceptionRaised: Boolean;
begin
  //Validation
  ActualTypeInfo := RNG_Tests_Utility.TypeInfoRequired<T>();
  Assert.DoesNotContain<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, 'Boundary Check - Type "T" has already been registered');
  //Setup
  RNG.RegisterRNGRoutine<T>(RNG_Tests_Utility.GenerateDefault<T>);
  try
    //Initialization
    ExceptionMessage := string.Empty;
    ExceptionRaised := False;
    Expected := RNG.RegisteredTypes();
    ExpectedMessage := Format(rsf_UnitTests_Exception_RNG_Registration_TypeAlreadyRegistered, [ActualTypeInfo.Name]);
    SetLength(Actual, Length(Expected) + 1);
    //Test
    Assert.IsNotEmpty(ExpectedMessage, 'Boundary Check - The expected error message is empty');
    Assert.IsFalse(ExceptionRaised, 'Boundary Check - Exception flag is already True');
    Assert.AreNotEqual(ExpectedMessage, ExceptionMessage, 'Boundary Check - Exception messages are already equal');
    Assert.AreNotEqual(Expected, Actual, 'Boundary Check - Expected and actual registered types are already equal');
    try
      RNG.RegisterRNGRoutine<T>(RNG_Tests_Utility.GenerateDefault<T>);
    except
      on E: ERNGException do
      begin
        ExceptionMessage := E.Message;
        ExceptionRaised := True;
      end;
    end;
    Actual := RNG.RegisteredTypes();
    Assert.IsTrue(ExceptionRaised, 'Exception flag is not True');
    Assert.AreEqual(ExpectedMessage, ExceptionMessage, 'Exception messages are not equal');
    Assert.AreEqual(Expected, Actual, 'Expected and actual registered types are not equal');
  finally
    RNG.UnRegisterRNGRoutine<T>();
  end;
  Assert.DoesNotContain<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, 'Boundary Check - The "T" type was not unregistered');
end;

procedure RNG_RegistrationMemberTests_Template<T>.RaisesAnExceptionAndAbortsRegistrationWhenGivenAnEmptyRNGRoutine;
var
  Actual: TArray<PTypeInfo>;
  ActualTypeInfo: PTypeInfo;
  ExceptionMessage: string;
  ExceptionRaised: Boolean;
  Expected: TArray<PTypeInfo>;
  ExpectedMessage: string;
begin
  //Validation
  ActualTypeInfo := RNG_Tests_Utility.TypeInfoRequired<T>();
  //Initialization
  ExceptionMessage := string.Empty;
  ExceptionRaised := False;
  Expected := RNG.RegisteredTypes();
  SetLength(Actual, Length(Expected) + 1);
  ExpectedMessage := Format(rsf_UnitTests_Exception_RNG_Registration_EmptyRNGRoutine, [ActualTypeInfo.Name]);
  //Test
  Assert.DoesNotContain<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, 'Boundary Check - The actual type has already been registered');
  Assert.IsNotEmpty(ExpectedMessage, 'Boundary Check - The expected exception message is empty');
  Assert.IsFalse(ExceptionRaised, 'Boundary Check - Exception flag is already True');
  Assert.AreNotEqual(ExpectedMessage, ExceptionMessage, 'Boundary Check - Exception messages are already equal');
  Assert.AreNotEqual(Expected, Actual, 'Boundary Check - Expected and actual registered types are already equal');
  try
    RNG.RegisterRNGRoutine<T>(nil);
  except
    on E: ERNGException do
    begin
      ExceptionMessage := E.Message;
      ExceptionRaised := True;
    end;
  end;
  Actual := RNG.RegisteredTypes();
  Assert.IsTrue(ExceptionRaised, 'Exception flag is not True');
  Assert.AreEqual(ExpectedMessage, ExceptionMessage, 'Exception messages are not equal');
  Assert.AreEqual(Expected, Actual, 'Expected and actual registered types are not equal');
end;

{ RNG_UnregisterMemberTests<T> }

procedure RNG_UnregisterMemberTests_Template<T>.CanUnregisterTypeT;
begin
  RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<T>(RNG_Tests_Utility.GenerateDefault<T>);
  RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<T>();
end;

procedure RNG_UnregisterMemberTests_Template<T>.UnregisteringTypeT_WhereTIsNotRegistered_DoesNotRaiseAnExceptionAndDoesNotChangeTheRegistration;
var
  Actual: TArray<PTypeInfo>;
  Expected: TArray<PTypeInfo>;
begin
  //Initialization
  Expected := RNG.RegisteredTypes();
  SetLength(Actual, Length(Expected) + 1);
  //Test
  Assert.DoesNotContain<PTypeInfo>(RNG.RegisteredTypes(), RNG_Tests_Utility.TypeInfoRequired<T>(), 'Boundary Check - Type "T" is already registered');
  Assert.AreNotEqual(Expected, Actual, 'Boundary Check - Expected and actual registered types are already equal');
  RNG.UnRegisterRNGRoutine<T>();
  Actual := RNG.RegisteredTypes();
  Assert.AreEqual(Expected, Actual, 'Expected and actual registered types are not equal');
end;

{ RNG_ExerciseTypeT_Tests<T> }

procedure RNG_ExerciseTypeT_Tests<T>.CanExecuteARegisteredRandomRoutineASingleTime;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<T>(1, RNG_Tests_Utility.GenerateDefault<T>);
end;

procedure RNG_ExerciseTypeT_Tests<T>.CanExecuteARegisteredRandomRoutineMultipleTimes;
var
  Actual: NativeUInt;
  ARoutine: TFunc<T>;
  Expected: NativeUInt;
begin
  //Initialization
  Actual := 0;
  ARoutine := function (): T
  begin
    Inc(Actual);
    Result := Default(T);
  end;
  Expected := Random(8) + 2;
  //Test
  Assert.IsTrue(Assigned(ARoutine), 'Boundary Check - RNG Routine is not assigned');
  Assert.IsTrue(Expected >= 2, 'Boundary Check - Expected is not at least 2');
  Assert.IsTrue(Expected <= 10, 'Boundary Check - Expected is greater than 10');
  Assert.AreEqual<NativeUInt>(0, Actual, 'Boundary Check - Actual is not zero');
  ARoutine();
  Assert.AreEqual<NativeUInt>(1, Actual, 'Boundary Check - Actual was not incremented');
  Actual := 0;
  Assert.AreNotEqual(Expected, Actual, 'Boundary Check - Expected and actual are equal');
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<T>(Expected, ARoutine);
  Assert.AreEqual(Expected, Actual, 'Expected and actual are not equal');
end;

procedure RNG_ExerciseTypeT_Tests<T>.CanExecuteTheRegisteredRandomRoutineMultipleTimes;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<T>(Random(8) + 2, RNGRoutine());
end;

procedure RNG_ExerciseTypeT_Tests<T>.CanRegisterAndUnregisterTheProvidedRandomGenerationRoutineASingleTime;
begin
  RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<T>(RNGRoutine());
  RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<T>;
end;

procedure RNG_ExerciseTypeT_Tests<T>.CanRegisterAndUnregisterTheProvidedRandomGenerationRoutineMultipleTimes;
var
  Expected: NativeUInt;
  I: NativeUInt;
begin
  //Initialization
  Expected := Random(8) + 2;
  //Test
  Assert.IsTrue(Expected >= 2, 'Boundary Check - Expected is not at least 2');
  Assert.IsTrue(Expected <= 10, 'Boundary Check - Expected is greater than 10');
  for I := 1 to Expected do
  begin
    RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<T>(RNGRoutine());
    RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<T>;
  end;
end;

procedure RNG_ExerciseTypeT_Tests<T>.ExceptionsRaisedInARegisteredGenerationRoutineFlowOutward;
begin
  RNG_Tests_Utility.ExceptionsRaisedFromWithinARegisteredGenerationRoutineForTypeQFlowOutward<T>;
end;

class function RNG_ExerciseTypeT_Tests<T>.RandomGeneratorCanGenerateXElementsOfTypeQByRegisteringRoutineY<Q>(const X: NativeUInt; const Y: TFunc<Q>): TArray<Q>;
begin
  //Initialization
  Result := [];
  //Test
  Assert.IsTrue(Result = TArray<Q>.Create(), 'Boundary Check - Result is not empty');
  Result := RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Q>(X, Y);
  Assert.AreEqual<NativeUInt>(X, Length(Result), Format('The number of actual distinct values, %d, is less than expected (which is %d)', [Length(Result), X]));
end;

procedure RNG_ExerciseTypeT_Tests<T>.CanExecuteTheRegisteredRandomRoutineASingleTime;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<T>(1, RNGRoutine());
end;

procedure RNG_ExerciseTypeT_Tests<T>.TheRandomGenerationRoutineIsProvided;
var
  Actual: TFunc<T>;
begin
  //Initialization
  Actual := nil;
  //Test
  Assert.IsFalse(Assigned(Actual), 'Boundary Check - Actual is already assigned');
  try
    Actual := RNGRoutine();
  except
    on EAbstractError do
      Assert.Fail('Boundary Check - The RNG registration routine was not provided for testing (implemented by a descendent)');
  end;
  Assert.IsTrue(Assigned(Actual), 'The RNG registration routine was not provided for testing (the overridden member is returning nil)');
end;

procedure RNG_ExerciseTypeT_Tests<T>.TheTypeUnderTestHasTypeInfo;
begin
  Assert.IsNotNull(TypeInfo(T), 'Provided type T does not appear to generate type info')
end;

{ RNG_Tests_Utility }

class function RNG_Tests_Utility.CanGenerateXValuesFromRegisteredDataType<Q>(const X: NativeUInt): TArray<Q>;
var
  ActualTypeInfo: PTypeInfo;
  I: Integer;
begin
  //Validation
  Assert.IsTrue(X > 0, 'Boundary Check - X must be at least 1 (no tests would be run for generating 0 values)');
  //Initialization
  Result := [];
  //Test
  ActualTypeInfo := TypeInfoRequired<Q>();
  Assert.AreEqual<NativeInt>(0, Length(Result), 'Boundary Check - Actual is not empty');
  Assert.Contains<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, Format('Boundary Check - Type "%s" has not been registered', [ActualTypeInfo.Name]));
  Assert.AreNotEqual<NativeInt>(X, Length(Result), 'Boundary Check - Actual already has X elements');
  for I := 1 to X do
    Result := Result + [RNG.Generate<Q>()];
  Assert.AreEqual<NativeInt>(X, Length(Result), 'Actual does not have X elements');
end;

class procedure RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<Q>(const ARoutine: TFunc<Q>);
var
  ActualTypeInfo: PTypeInfo;
begin
  //Test
  ActualTypeInfo := TypeInfoRequired<Q>();
  Assert.DoesNotContain<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, Format('Boundary Check - Type "%s" has already been registered', [ActualTypeInfo.Name]));
  Assert.IsNotNull(@ARoutine, 'Boundary Check - The provided RNG routine is not assigned');
  RNG.RegisterRNGRoutine<Q>(ARoutine);
  Assert.Contains<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, Format('Type "%s" is not registered',[ActualTypeInfo.Name]));
end;

class function RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Q>(const X: NativeUInt; const Y: TFunc<Q>): TArray<Q>;
begin
  //Test
  CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<Q>(Y);
  try
    Result := CanGenerateXValuesFromRegisteredDataType<Q>(X);
  finally
    CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<Q>();
  end;
end;

class procedure RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<Q>;
var
  ActualTypeInfo: PTypeInfo;
begin
  //Test
  ActualTypeInfo := TypeInfoRequired<Q>();
  Assert.Contains<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, Format('Boundary Check - Type "%s" is not registered',[ActualTypeInfo.Name]));
  RNG.UnRegisterRNGRoutine<Q>();
  Assert.DoesNotContain<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, Format('Type "%s" was not unregistered', [ActualTypeInfo.Name]));
end;

class procedure RNG_Tests_Utility.ExceptionsRaisedFromWithinARegisteredGenerationRoutineForTypeQFlowOutward<Q>;
var
  ActualTypeInfo: PTypeInfo;
  ActualRoutine: TFunc<Q>;
  ExceptionRaised: Boolean;
begin
  //Initialization
  ActualRoutine := function (): Q
    begin
      raise Exception.Create(string.Empty);
    end;
  ExceptionRaised := False;
  //Test
  ActualTypeInfo := TypeInfoRequired<Q>();
  Assert.IsTrue(Assigned(ActualRoutine), 'Boundary Check - The actual routine for type "Q" is not assigned');
  Assert.IsFalse(ExceptionRaised, 'Boundary Check - The exception flag is already True (attempting to verify the actual routine)');
  try
    ActualRoutine();
  except
    ExceptionRaised := True;
  end;
  Assert.IsTrue(ExceptionRaised, 'Boundary Check - The exception flag is not True (the actual routine did not raise an exception)');
  ExceptionRaised := False;
  Assert.DoesNotContain<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, 'Boundary Check - Type "Q" has already been registered');
  RNG.RegisterRNGRoutine<Q>(ActualRoutine);
  try
    Assert.IsFalse(ExceptionRaised, 'Boundary Check - Exception flag is already True (attempting to verify the through generation)');
    try
      RNG.Generate<Q>();
    except
      ExceptionRaised := True;
    end;
    Assert.IsTrue(ExceptionRaised, 'Exception flag is not True');
  finally
    RNG.UnRegisterRNGRoutine<Q>();
  end;
  Assert.DoesNotContain<PTypeInfo>(RNG.RegisteredTypes(), ActualTypeInfo, 'Boundary Check - The SUT type was not unregistered');
end;

class function RNG_Tests_Utility.FilterXValuesOfQByYRoutine<Q>(const X: TArray<Q>; const Y: TFilterRoutine<Q>): TArray<Q>;
var
  I: Integer;
begin
  //Validation
  Assert.IsTrue(Assigned(Y), 'Boundary Check - Unable to continue because routine Y is not assigned (unable to filter results without a filter routine)');
  //Initialization
  Result := [];
  //Test
  Assert.IsTrue(Result = TArray<Q>.Create(), 'Boundary Check - Result is not empty');
  for I := Low(X) to High(X) do
    if Y(Result, X[I]) then
      Result := Result + [X[I]];
end;

class function RNG_Tests_Utility.GenerateDefault<Q>: Q;
begin
  Result := Default(Q);
end;

class procedure RNG_Tests_Utility.TypeQMustBeOfTypeKindX<Q>(const X: TTypeKinds; const ExceptionMsg: string);
begin
  Assert.IsTrue(GetTypeKind(Q) in X, ExceptionMsg);
end;

class function RNG_Tests_Utility.TypeInfoRequired<Q>(const FailureMessage: string): PTypeInfo;
begin
  Result := TypeInfo(Q);
  Assert.IsTrue(Assigned(Result), FailureMessage);
end;

end.
