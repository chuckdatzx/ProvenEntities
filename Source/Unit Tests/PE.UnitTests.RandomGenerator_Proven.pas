unit PE.UnitTests.RandomGenerator_Proven;

interface

{$REGION 'Random Generator Construction/Test Coverage'}
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

  Original Intent: An extensible random generator for use in unit tests
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
  System.SysUtils,
  {DUnitX}
  DUnitX.TestFramework,
  {Proven Entities}
  PE.UnitTests.RandomGenerator.TDD.Templates;

type
  ///<summary>For usage in tests with a context of "I just need an established data type alias, I don't care what the actual data type is."</summary>
  ///<remarks>Any test using this data type should assume that it could change at any time.</remarks>
  DEFAULT_SUT_TYPE = NativeInt;
  ///<summary>For usage in tests where you need a data type that should never generate type info.</summary>
  ///<remarks>Since I have yet to find a way to determine this at compile-time, there is an accompanying run-time test to verify that this type does not have type info.</remarks>
  SUT_ASSUMED_TYPE_WITHOUT_TYPE_INFO = set of 1..100;

type
  {$REGION 'Internal Validation (Sealed)'}
  [TestFixture]
  _Internal_TypeWithoutTypeInfoConstantValidation = class sealed
  public
    ///<summary>Proves that the associated constant does not have type info</summary>
    [Test]procedure SaidTypeDoesIndeedNOTHaveTypeInfo();
  end;
  {$ENDREGION}

  {$REGION 'Exception Tests (Sealed)'}
  [TestFixture]
  ///<summary>Collection of tests intended to prove that the custom exception is usable/reliable</summary>
  RNG_ExceptionTests = class sealed
  public
    ///<summary>Simple verification showing that said class can be instanced.</summary>
    [Test]procedure CanInstance();
    ///<summary>Since we will be raising exceptions, and all exceptions must descend from the Exception class, we prove our class descends from Exception.</summary>
    [Test]procedure IsADescendentOfException();
  end;
  {$ENDREGION}

  {$REGION 'Initialization Tests (Sealed)'}
  [TestFixture][Setup]
  ///<summary>Collection of tests intended to verify the initializated state of the random generator</summary>
  RNG_IntializationTests = class sealed
  public
    ///<summary>Verifies that the list of registered types is empty</summary>
    ///<remarks>Ideally, this test is the 1st thing to touch the random generator symbol; otherwise it's not much of a test. Presumably I understand DUnitX's "Setup" attribute and it does just that</remarks>
    [Test]procedure TheRegisteredTypesListIsInitializedToEmpty();
  end;
  {$ENDREGION}

  {$REGION 'Singleton Tests (Sealed))'}
  [TestFixture]
  ///<summary>Verifies that the default SUT type passes the singleton test template</summary>
  ///<remarks>The individual tests are assumed to be present through parent classes</remarks>
  RNG_Default_SUT_Type_SingletonTests = class sealed(RNG_SingletonTests_Template<DEFAULT_SUT_TYPE>) end;
  {$ENDREGION}

  {$REGION 'Registration Member Tests (Sealed)'}
  [TestFixture]
  ///<summary>Contains tests that have merit but cannot be easily incorporated (or do not make sense to) into a TDD template</summary>
  RNG_RegistrationMemberTests = class sealed
  public
    [Test]procedure RaisesAnExceptionAndAbortsRegistrationWhenGivenATypeWhichIsAssumedToNotHaveTypeInfo();
  end;

  [TestFixture]
  ///<summary>Verifies that the default SUT type passes the registration member test template</summary>
  ///<remarks>The individual tests are assumed to be present through parent classes</remarks>
  RNG_Default_SUT_Type_RegistrationMemberTests = class sealed(RNG_RegistrationMemberTests_Template<DEFAULT_SUT_TYPE>) end;
  {$ENDREGION}

  {$REGION 'Unregistration Member Tests (Sealed)'}
  [TestFixture]
  ///<summary>Contains tests that have merit but cannot be easily incorporated (or do not make sense to) into a TDD template</summary>
  RNG_UnregisterMemberTests = class sealed
  public
    ///<summary>Proves that 1) the unregister routine requires types with type info, and 2)such an exception makes no impact on the registration state</summary>
    [Test]procedure RaisesAnExceptionAndRegistrationRemainsUnchangedWhenGivenATypeWhichIsAssumedToNotHaveTypeInfo();
  end;

  [TestFixture]
  ///<summary>Verifies that the default SUT type passes the unregistration member test template</summary>
  ///<remarks>The individual tests are assumed to be present through parent classes</remarks>
  RNG_Default_SUT_Type_UnregisterMemberTests = class sealed(RNG_UnregisterMemberTests_Template<DEFAULT_SUT_TYPE>) end;
  {$ENDREGION}

  {$REGION 'Generation Member Tests (Sealed)'}
  [TestFixture]
  ///<summary>Contains tests that have merit but cannot be easily incorporated (or do not make sense to) into a TDD template</summary>
  RNG_GenerationMemberTests = class sealed
  public
    ///<summary>Verifies that the generation routine raises an exception when the data type does not have type info</summary>
    [Test]procedure RaisesAnExceptionWhenGivenATypeWhichIsAssumedToNotHaveTypeInfo();
  end;

  [TestFixture]
  ///<summary>Verifies that the default SUT type passes the generation member test template</summary>
  ///<remarks>The individual tests are assumed to be present through parent classes</remarks>
  RNG_Default_SUT_Type_GenerationMemberTests = class sealed(RNG_GenerationMemberTests_Template<DEFAULT_SUT_TYPE>) end;
  {$ENDREGION}

  {$REGION 'Full Process Tests (Sealed)'}
  [TestFixture]
  ///<summary>Contains tests that have merit but cannot be easily incorporated (or do not make sense to) into a TDD template</summary>
  RNG_ProcessTests = class sealed
  public
    ///<summary>Verifies that the same random generation routine can serve for multiple data types</summary>
    [Test]procedure CanRegisterAndGenerateAndUnregisterUsingTheSameRoutineForMultipleDataTypes_NotNecissarilyRecommendedButIsPossible();
  public
    ///<summary>Proves that the random generator can retain the registration of 10 data types, generate values for all 10 data types,
    ///and unregister all 10 data types</summary>
    [Test]procedure CanRegisterAndGenerateValuesForAndUnregister10DistinctTypesAtOnce();
  end;
  {$ENDREGION}

  {$REGION 'Full Process Tests (Standard Delphi Data Types) (Sealed)'}
  [TestFixture]
  ///<summary>Members exercise the commom usage pattern of register, generate values for, then unregister; in the context of the named type</summary>
  RNG_StandardDelphiTypes_Ordinal_Boolean = class sealed
  public
    [Test]procedure Boolean_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure ByteBool_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure LongBool_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure WordBool_CanRegisterAndGenerateValuesAndUnregister();
  end;

  [TestFixture]
  ///<summary>Members exercise the commom usage pattern of register, generate values for, then unregister; in the context of the named type</summary>
  RNG_StandardDelphiTypes_Ordinal_Character = class sealed
  public
    [Test]procedure AnsiChar_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure Char_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure UCS2Char_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure UCS4Char_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure WideChar_CanRegisterAndGenerateValuesAndUnregister();
  end;

  [TestFixture]
  ///<summary>Members exercise the commom usage pattern of register, generate values for, then unregister; in the context of the named type</summary>
  RNG_StandardDelphiTypes_Ordinal_EnumeratedType = class sealed
  public
    [Test]procedure CanRegisterAndUnregisterAnEnumeratedDataTypeWhenSaidDataTypeIsPreviouslyUnRegistered();
  end;

  [TestFixture]
  ///<summary>Members exercise the commom usage pattern of register, generate values for, then unregister; in the context of the named type</summary>
  RNG_StandardDelphiTypes_Ordinal_PlatformDependentIntegers = class sealed
  public
    [Test]procedure LongInt_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure LongWord_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure NativeInt_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure NativeUInt_CanRegisterAndGenerateValuesAndUnregister();
  end;

  [TestFixture]
  ///<summary>Members exercise the commom usage pattern of register, generate values for, then unregister; in the context of the named type</summary>
  RNG_StandardDelphiTypes_Ordinal_PlatformIndependentIntegers = class sealed
  public
    [Test]procedure Byte_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure Cardinal_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure FixedInt_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure FixedUInt_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure Integer_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure Int64_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure ShortInt_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure SmallInt_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure UInt64_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure Word_CanRegisterAndGenerateValuesAndUnregister();
  end;

  [TestFixture]
  ///<summary>Members exercise the commom usage pattern of register, generate values for, then unregister; in the context of the named type</summary>
  RNG_StandardDelphiTypes_Ordinal_Subrange = class sealed
  public
    [Test]procedure Subrange_CanRegisterAndGenerateValuesAndUnregister();
  end;

  [TestFixture]
  ///<summary>Members exercise the commom usage pattern of register, generate values for, then unregister; in the context of the named type</summary>
  RNG_StandardDelphiTypes_Real = class sealed
  public
    [Test]procedure Comp_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure Currency_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure Double_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure Extended_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure Real_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure Single_CanRegisterAndGenerateValuesAndUnregister();
  end;

  [TestFixture]
  ///<summary>Members exercise the commom usage pattern of register, generate values for, then unregister; in the context of the named type</summary>
  RNG_StandardDelphiTypes_String = class sealed
  public
    [Test]procedure AnsiString_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure ShortString_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure String_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure UnicodeString_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure WideString_CanRegisterAndGenerateValuesAndUnregister();
  end;

  [TestFixture]
  ///<summary>Members exercise the commom usage pattern of register, generate values for, then unregister; in the context of the named type</summary>
  RNG_StandardDelphiTypes_Structred = class sealed
  public
    [Test]procedure Class_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure ClassReference_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure DynamicArray_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure Interface_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure Pointer_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure ProceduralType_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure Record_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure Set_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure StaticArray_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure TypedPointer_CanRegisterAndGenerateValuesAndUnregister();
    [Test]procedure Variant_CanRegisterAndGenerateValuesAndUnregister();
  end;
  {$ENDREGION}

implementation

uses
  {Delphi}
  System.RTTI,
  System.TypInfo,
  {Proven Entities}
  PE.RandomGenerator;

{ _Internal_TypeWithoutTypeInfoConstantValidation }

procedure _Internal_TypeWithoutTypeInfoConstantValidation.SaidTypeDoesIndeedNOTHaveTypeInfo;
begin
  Assert.IsNull(TValue.From<SUT_ASSUMED_TYPE_WITHOUT_TYPE_INFO>(Default(SUT_ASSUMED_TYPE_WITHOUT_TYPE_INFO)).TypeInfo, 'The "system under test''s assumed type with out type info" constant does indeed have type info');
end;

{ RNG_Exception_Tests }

procedure RNG_ExceptionTests.CanInstance;
var
  Actual: ERNGException;
begin
  //Initialization
  Actual := nil;
  //Test
  Assert.IsNull(Actual, 'Boundary Check - Instance is already assigned');
  Actual := ERNGException.Create('');
  Assert.IsNotNull(Actual, 'Instance is not assigned');
  Actual.Free();
end;

procedure RNG_ExceptionTests.IsADescendentOfException;
begin
  Assert.IsTrue(ERNGException.InheritsFrom(Exception), Format('The "%s" class is not a %s descendent', [ERNGException.ClassName(), Exception.ClassName()]));
end;

{ RNG_GenerationMemberTests }

procedure RNG_GenerationMemberTests.RaisesAnExceptionWhenGivenATypeWhichIsAssumedToNotHaveTypeInfo;
resourcestring
  rs_UnitTests_Exception_RNG_Generation_NoTypeInfo = 'Unable to generate a random value because the provided type does not seem to have type info';
var
  ExceptionMessage: string;
  ExceptionRaised: Boolean;
begin
  //Initialization
  ExceptionMessage := string.Empty;
  ExceptionRaised := False;
  //Test
  Assert.IsFalse(ExceptionRaised, 'Boundary Check - Exception flag is already True');
  Assert.AreNotEqual(rs_UnitTests_Exception_RNG_Generation_NoTypeInfo, ExceptionMessage, 'Boundary Check - Exception messages are already equal');
  try
    RNG.Generate<SUT_ASSUMED_TYPE_WITHOUT_TYPE_INFO>();
  except
    on E: ERNGException do
    begin
      ExceptionMessage := E.Message;
      ExceptionRaised := True;
    end;
  end;
  Assert.IsTrue(ExceptionRaised, 'Exception flag is not True');
  Assert.AreEqual(rs_UnitTests_Exception_RNG_Generation_NoTypeInfo, ExceptionMessage, 'Exception messages are not equal');
end;

{ RNG_IntializationTests }

procedure RNG_IntializationTests.TheRegisteredTypesListIsInitializedToEmpty;
var
  Actual: TArray<PTypeInfo>;
begin
  //Initialization
  SetLength(Actual, Random(10) + 1);
  //Test
  Assert.AreNotEqual<NativeInt>(0, Length(Actual), 'Boundary Check - Values are already equal');
  Actual := RNG.RegisteredTypes();
  Assert.AreEqual<NativeInt>(0, Length(Actual), 'Values are not equal');
end;

{ RNG_RegisterationMemberTests }

procedure RNG_RegistrationMemberTests.RaisesAnExceptionAndAbortsRegistrationWhenGivenATypeWhichIsAssumedToNotHaveTypeInfo;
resourcestring
  rs_UnitTests_Exception_RNG_Registration_NoTypeInfo = 'Unable to register a random generation routine because the provided type does not seem to have type info';
var
  Actual: TArray<PTypeInfo>;
  Expected: TArray<PTypeInfo>;
  ExceptionMessage: string;
  ExceptionRaised: Boolean;
begin
  //Initialization
  ExceptionMessage := string.Empty;
  ExceptionRaised := False;
  Expected := RNG.RegisteredTypes();
  SetLength(Actual, Length(Expected) + 1);
  //Test
  Assert.IsFalse(ExceptionRaised, 'Boundary Check - Exception flag is already True');
  Assert.AreNotEqual(rs_UnitTests_Exception_RNG_Registration_NoTypeInfo, ExceptionMessage, 'Boundary Check - Exception messages are already equal');
  Assert.AreNotEqual(Expected, Actual, 'Boundary Check - Expected and actual registered types are already equal');
  try
    RNG.RegisterRNGRoutine<SUT_ASSUMED_TYPE_WITHOUT_TYPE_INFO>(RNG_Tests_Utility.GenerateDefault<SUT_ASSUMED_TYPE_WITHOUT_TYPE_INFO>);
  except
    on E: ERNGException do
    begin
      ExceptionMessage := E.Message;
      ExceptionRaised := True;
    end;
  end;
  Actual := RNG.RegisteredTypes();
  Assert.IsTrue(ExceptionRaised, 'Exception flag is not True');
  Assert.AreEqual(rs_UnitTests_Exception_RNG_Registration_NoTypeInfo, ExceptionMessage, 'Exception messages are not equal');
  Assert.AreEqual(Expected, Actual, 'Expected and actual registered types are not equal');
end;

{ RNG_ProcessTests }

procedure RNG_ProcessTests.CanRegisterAndGenerateAndUnregisterUsingTheSameRoutineForMultipleDataTypes_NotNecissarilyRecommendedButIsPossible;
type
  SUT_TYPE1 = Integer;
  SUT_TYPE2 = Cardinal;
var
  ActualRoutine: TFunc<SUT_TYPE1>;
begin
  //Initialization
  ActualRoutine := function (): SUT_TYPE1
    begin
      Result := Default(SUT_TYPE1);
    end;
  //Test
  Assert.AreNotEqual(TypeInfo(SUT_TYPE1), TypeInfo(SUT_TYPE2), 'Boundary Check - SUT type 1 and SUT type 2 have the same type info');
  Assert.DoesNotContain<PTypeInfo>(RNG.RegisteredTypes(), TypeInfo(SUT_TYPE1), 'Boundary Check - Random generator has already registered the 1st SUT type');
  Assert.DoesNotContain<PTypeInfo>(RNG.RegisteredTypes(), TypeInfo(SUT_TYPE2), 'Boundary Check - Random generator has already registered the 2nd SUT type');
  Assert.IsTrue(Assigned(ActualRoutine), 'Boundary Check - The 1st RNG routine is not assigned');
  RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<SUT_TYPE1>(ActualRoutine);
  try
    RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<SUT_TYPE2>(TFunc<SUT_TYPE2>(ActualRoutine));
    try
      RNG_Tests_Utility.CanGenerateXValuesFromRegisteredDataType<SUT_TYPE1>(Random(8) + 2);
      RNG_Tests_Utility.CanGenerateXValuesFromRegisteredDataType<SUT_TYPE2>(Random(8) + 2);
    finally
      RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<SUT_TYPE2>();
    end;
  finally
    RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<SUT_TYPE1>();
  end;
end;

procedure RNG_ProcessTests.CanRegisterAndGenerateValuesForAndUnregister10DistinctTypesAtOnce;
type
  SUT_TYPE1 = Char;
  SUT_TYPE2 = Integer;
  SUT_TYPE3 = Byte;
  SUT_TYPE4 = TObject;
  SUT_TYPE5 = Boolean;
  SUT_TYPE6 = TFloatType;
  SUT_TYPE7 = Variant;
  SUT_TYPE8 = Exception;
  SUT_TYPE9 = Double;
  SUT_TYPE10 = PInteger;
var
  ActualTypeInfo: TArray<PTypeInfo>;
begin
  //Initialization
  ActualTypeInfo := [TypeInfo(SUT_TYPE1), TypeInfo(SUT_TYPE2), TypeInfo(SUT_TYPE3), TypeInfo(SUT_TYPE4), TypeInfo(SUT_TYPE5),
    TypeInfo(SUT_TYPE6), TypeInfo(SUT_TYPE7), TypeInfo(SUT_TYPE8), TypeInfo(SUT_TYPE9), TypeInfo(SUT_TYPE10)];
  //Validation
  Assert.AreEqual<NativeInt>(10, Length(ActualTypeInfo), 'Boundary Check - Expected does not contain 10 elements');
  var I, J: Integer;
  for I := Low(ActualTypeInfo) to (High(ActualTypeInfo) - 1) do
  begin
    Assert.IsNotNull(ActualTypeInfo[I], Format('Boundary Check - Expected''s %d element is nil', [I]));
    for J := (I + 1) to High(ActualTypeInfo) do
      Assert.AreNotEqual(ActualTypeInfo[I], ActualTypeInfo[J], 'Boundary Check - Expected has duplicate types');
  end;
  //Test
  Assert.AreEqual<PTypeInfo>([], RNG.RegisteredTypes(), 'Boundary Check - The random generator''s registered type list is not empty on entry');
  RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<SUT_TYPE1>(RNG_Tests_Utility.GenerateDefault<SUT_TYPE1>);
  try
    RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<SUT_TYPE2>(RNG_Tests_Utility.GenerateDefault<SUT_TYPE2>);
    try
      RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<SUT_TYPE3>(RNG_Tests_Utility.GenerateDefault<SUT_TYPE3>);
      try
        RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<SUT_TYPE4>(RNG_Tests_Utility.GenerateDefault<SUT_TYPE4>);
        try
          RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<SUT_TYPE5>(RNG_Tests_Utility.GenerateDefault<SUT_TYPE5>);
          try
            RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<SUT_TYPE6>(RNG_Tests_Utility.GenerateDefault<SUT_TYPE6>);
            try
              RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<SUT_TYPE7>(RNG_Tests_Utility.GenerateDefault<SUT_TYPE7>);
              try
                RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<SUT_TYPE8>(RNG_Tests_Utility.GenerateDefault<SUT_TYPE8>);
                try
                  RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<SUT_TYPE9>(RNG_Tests_Utility.GenerateDefault<SUT_TYPE9>);
                  try
                    RNG_Tests_Utility.CanRegisterDataTypeQWhenSaidDataTypeIsPreviouslyUnregistered<SUT_TYPE10>(RNG_Tests_Utility.GenerateDefault<SUT_TYPE10>);
                    try
                      RNG_Tests_Utility.CanGenerateXValuesFromRegisteredDataType<SUT_TYPE1>(Random(8) + 2);
                      RNG_Tests_Utility.CanGenerateXValuesFromRegisteredDataType<SUT_TYPE2>(Random(8) + 2);
                      RNG_Tests_Utility.CanGenerateXValuesFromRegisteredDataType<SUT_TYPE3>(Random(8) + 2);
                      RNG_Tests_Utility.CanGenerateXValuesFromRegisteredDataType<SUT_TYPE4>(Random(8) + 2);
                      RNG_Tests_Utility.CanGenerateXValuesFromRegisteredDataType<SUT_TYPE5>(Random(8) + 2);
                      RNG_Tests_Utility.CanGenerateXValuesFromRegisteredDataType<SUT_TYPE6>(Random(8) + 2);
                      RNG_Tests_Utility.CanGenerateXValuesFromRegisteredDataType<SUT_TYPE7>(Random(8) + 2);
                      RNG_Tests_Utility.CanGenerateXValuesFromRegisteredDataType<SUT_TYPE8>(Random(8) + 2);
                      RNG_Tests_Utility.CanGenerateXValuesFromRegisteredDataType<SUT_TYPE9>(Random(8) + 2);
                      RNG_Tests_Utility.CanGenerateXValuesFromRegisteredDataType<SUT_TYPE10>(Random(8) + 2);
                    finally
                      RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<SUT_TYPE10>();
                    end;
                  finally
                    RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<SUT_TYPE9>();
                  end;
                finally
                  RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<SUT_TYPE8>();
                end;
              finally
                RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<SUT_TYPE7>();
              end;
            finally
              RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<SUT_TYPE6>();
            end;
          finally
            RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<SUT_TYPE5>();
          end;
        finally
          RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<SUT_TYPE4>();
        end;
      finally
        RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<SUT_TYPE3>();
      end;
    finally
      RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<SUT_TYPE2>();
    end;
  finally
    RNG_Tests_Utility.CanUnRegisterDataTypeQWhenSaidDataTypeIsPreviouslyRegistered<SUT_TYPE1>();
  end;
  Assert.AreEqual<PTypeInfo>([], RNG.RegisteredTypes(), 'Boundary Check - The random generator''s registered type list is not empty on exit');
end;

{ RNG_UnregisterMemberTests }

procedure RNG_UnregisterMemberTests.RaisesAnExceptionAndRegistrationRemainsUnchangedWhenGivenATypeWhichIsAssumedToNotHaveTypeInfo;
resourcestring
  rs_UnitTests_Exception_RNG_Unregistration_NoTypeInfo = 'Unable to unregister a random generation routine because the provided type does not seem to have type info';
var
  Actual: TArray<PTypeInfo>;
  Expected: TArray<PTypeInfo>;
  ExceptionMessage: string;
  ExceptionRaised: Boolean;
begin
  //Initialization
  ExceptionMessage := string.Empty;
  ExceptionRaised := False;
  Expected := RNG.RegisteredTypes();
  SetLength(Actual, Length(Expected) + 1);
  //Test
  Assert.IsFalse(ExceptionRaised, 'Boundary Check - Exception flag is already True');
  Assert.AreNotEqual(rs_UnitTests_Exception_RNG_Unregistration_NoTypeInfo, ExceptionMessage, 'Boundary Check - Exception messages are already equal');
  Assert.AreNotEqual(Expected, Actual, 'Boundary Check - Expected and actual registered types are already equal');
  try
    RNG.UnRegisterRNGRoutine<SUT_ASSUMED_TYPE_WITHOUT_TYPE_INFO>();
  except
    on E: ERNGException do
    begin
      ExceptionMessage := E.Message;
      ExceptionRaised := True;
    end;
  end;
  Actual := RNG.RegisteredTypes();
  Assert.IsTrue(ExceptionRaised, 'Exception flag is not True');
  Assert.AreEqual(rs_UnitTests_Exception_RNG_Unregistration_NoTypeInfo, ExceptionMessage, 'Exception messages are not equal');
  Assert.AreEqual(Expected, Actual, 'Expected and actual registered types are not equal');
end;

{ RNG_StandardDelphiTypes_Ordinal_Boolean }

procedure RNG_StandardDelphiTypes_Ordinal_Boolean.Boolean_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Boolean>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<Boolean>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_Boolean.ByteBool_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<ByteBool>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<ByteBool>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_Boolean.LongBool_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<LongBool>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<LongBool>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_Boolean.WordBool_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<WordBool>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<WordBool>);
end;

{ RNG_StandardDelphiTypes_Ordinal_Character }

procedure RNG_StandardDelphiTypes_Ordinal_Character.AnsiChar_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<AnsiChar>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<AnsiChar>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_Character.Char_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Char>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<Char>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_Character.UCS2Char_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<UCS2Char>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<UCS2Char>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_Character.UCS4Char_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<UCS4Char>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<UCS4Char>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_Character.WideChar_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<WideChar>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<WideChar>);
end;

{ RNG_StandardDelphiTypes_Ordinal_PlatformDependentIntegers }

procedure RNG_StandardDelphiTypes_Ordinal_PlatformDependentIntegers.LongInt_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<LongInt>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<LongInt>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_PlatformDependentIntegers.LongWord_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<LongWord>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<LongWord>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_PlatformDependentIntegers.NativeInt_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<NativeInt>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<NativeInt>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_PlatformDependentIntegers.NativeUInt_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<NativeUInt>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<NativeUInt>);
end;

{ RNG_StandardDelphiTypes_Ordinal_PlatformIndependentIntegers }

procedure RNG_StandardDelphiTypes_Ordinal_PlatformIndependentIntegers.Byte_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Byte>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<Byte>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_PlatformIndependentIntegers.Cardinal_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Cardinal>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<Cardinal>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_PlatformIndependentIntegers.FixedInt_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<FixedInt>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<FixedInt>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_PlatformIndependentIntegers.FixedUInt_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<FixedUInt>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<FixedUInt>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_PlatformIndependentIntegers.Int64_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Int64>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<Int64>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_PlatformIndependentIntegers.Integer_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Integer>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<Integer>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_PlatformIndependentIntegers.ShortInt_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<ShortInt>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<ShortInt>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_PlatformIndependentIntegers.SmallInt_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<SmallInt>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<SmallInt>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_PlatformIndependentIntegers.UInt64_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<UInt64>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<UInt64>);
end;

procedure RNG_StandardDelphiTypes_Ordinal_PlatformIndependentIntegers.Word_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Word>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<Word>);
end;

{ RNG_StandardDelphiTypes_Ordinal_EnumeratedType }

procedure RNG_StandardDelphiTypes_Ordinal_EnumeratedType.CanRegisterAndUnregisterAnEnumeratedDataTypeWhenSaidDataTypeIsPreviouslyUnRegistered;
type
  SampleEnumeratedType = (Item1, Item2, Item3);
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<SampleEnumeratedType>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<SampleEnumeratedType>);
end;

{ RNG_StandardDelphiTypes_Ordinal_Subrange }

procedure RNG_StandardDelphiTypes_Ordinal_Subrange.Subrange_CanRegisterAndGenerateValuesAndUnregister;
type
  SampleSubrange = -42..42;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<SampleSubrange>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<SampleSubrange>);
end;

{ RNG_StandardDelphiTypes_Real }

procedure RNG_StandardDelphiTypes_Real.Comp_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Comp>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<Comp>);
end;

procedure RNG_StandardDelphiTypes_Real.Currency_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Currency>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<Currency>);
end;

procedure RNG_StandardDelphiTypes_Real.Double_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Double>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<Double>);
end;

procedure RNG_StandardDelphiTypes_Real.Extended_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Extended>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<Extended>);
end;

procedure RNG_StandardDelphiTypes_Real.Real_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Real>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<Real>);
end;

procedure RNG_StandardDelphiTypes_Real.Single_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Single>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<Single>);
end;

{ RNG_StandardDelphiTypes_String }

procedure RNG_StandardDelphiTypes_String.AnsiString_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<AnsiString>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<AnsiString>);
end;

procedure RNG_StandardDelphiTypes_String.ShortString_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<ShortString>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<ShortString>);
end;

procedure RNG_StandardDelphiTypes_String.String_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<string>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<string>);
end;

procedure RNG_StandardDelphiTypes_String.UnicodeString_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<UnicodeString>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<UnicodeString>);
end;

procedure RNG_StandardDelphiTypes_String.WideString_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<WideString>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<WideString>);
end;

{ RNG_StandardDelphiTypes_Structred }

procedure RNG_StandardDelphiTypes_Structred.ClassReference_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.TypeQMustBeOfTypeKindX<TClass>([TTypeKind.tkClassRef]);
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<TClass>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<TClass>);
end;

procedure RNG_StandardDelphiTypes_Structred.Class_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<TObject>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<TObject>);
end;

procedure RNG_StandardDelphiTypes_Structred.DynamicArray_CanRegisterAndGenerateValuesAndUnregister;
type
  SomeDynamicArray = array of Byte;
begin
  RNG_Tests_Utility.TypeQMustBeOfTypeKindX<SomeDynamicArray>([TTypeKind.tkDynArray]);
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<SomeDynamicArray>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<SomeDynamicArray>);
end;

procedure RNG_StandardDelphiTypes_Structred.Interface_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<IInterface>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<IInterface>);
end;

procedure RNG_StandardDelphiTypes_Structred.Pointer_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Pointer>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<Pointer>);
end;

procedure RNG_StandardDelphiTypes_Structred.ProceduralType_CanRegisterAndGenerateValuesAndUnregister;
type
  SomeProceduralType = function (Param1: Integer; Param2: string): Boolean;
begin
  RNG_Tests_Utility.TypeQMustBeOfTypeKindX<SomeProceduralType>([TTypeKind.tkProcedure]);
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<SomeProceduralType>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<SomeProceduralType>);
end;

procedure RNG_StandardDelphiTypes_Structred.Record_CanRegisterAndGenerateValuesAndUnregister;
type
  SomeRecord = record
    Field1: string;
    Field2: Integer;
  end;
begin
  RNG_Tests_Utility.TypeQMustBeOfTypeKindX<SomeRecord>([TTypeKind.tkRecord]);
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<SomeRecord>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<SomeRecord>);
end;

procedure RNG_StandardDelphiTypes_Structred.Set_CanRegisterAndGenerateValuesAndUnregister;
type
  SampleSet = set of Byte;
begin
  RNG_Tests_Utility.TypeQMustBeOfTypeKindX<SampleSet>([TTypeKind.tkSet]);
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<SampleSet>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<SampleSet>);
end;

procedure RNG_StandardDelphiTypes_Structred.StaticArray_CanRegisterAndGenerateValuesAndUnregister;
type
  SomeStaticArray = array [1..100] of Byte;
begin
  RNG_Tests_Utility.TypeQMustBeOfTypeKindX<SomeStaticArray>([TTypeKind.tkArray]);
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<SomeStaticArray>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<SomeStaticArray>);
end;

procedure RNG_StandardDelphiTypes_Structred.TypedPointer_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.TypeQMustBeOfTypeKindX<PTypeInfo>([TTypeKind.tkPointer]);
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<PTypeInfo>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<PTypeInfo>);
end;

procedure RNG_StandardDelphiTypes_Structred.Variant_CanRegisterAndGenerateValuesAndUnregister;
begin
  RNG_Tests_Utility.CanRegisterTypeQ_GenerateAndReturnXValuesOfTypeQFromRoutineY_ThenUnregisterTypeQ<Variant>(Random(9) + 2, RNG_Tests_Utility.GenerateDefault<Variant>);
end;

end.


