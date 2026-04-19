unit PE.Tests.BoundlessRoutines.DataStream.Contains;
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
{
If the assumptions (listed in the PE.Tests unit) are True, then the PE.Routines.DataStreams.Contains<T> routine is "proven" to Strength(X) for both now and in any future execution scenarios,
where "Strength(X)" is defined in the PE.Tests unit.
}
{
Domain Notes (DataStream.Contains<T> works for all natural numbers; where "all natural numbers" = 0..∞):
  Assumption: It will never be possible to "fully test" the DataStreams.Contains<T> routine (since it's generic and all, and "fully test" would have to include value complete testing)
  Assumption: It is possible to fully test DataStreams.Contains<T> if, and only if, said T is bounded

First, let's test out the entire domain of PE.Types.Digit against our DataStreams.Contains<T> routine (successfull completion of the ExecutableSpecification_DataStreams_Contains_Digit_ValueCompleteTests.Exercise() routine).

Assuming that has been verified:

Now we can say the following about DataStreams.Contains<T>:
- For all possible unique combinations of type Digit, and for all possible values of Digit, input = output

So if the Datastreams.Contains<T> is both sound and complete w/respect to the type of Digit, why wouldn't it also be sound and complete for any expansion in the realm of all natural numbers?

Theory: Any type that is either a bounded subset or a bounded superset, with respect to the Digit type, only needs the following verification:
  - Understood by the compilation context as having the following:
    -from the point of entry of DataStream.Contains<T>() until the point of exit of DataStream.Contains<T>()
      -if T is understood by the compiler as a bounded ordinal type within the natural number realm
        - then if we can establish just 1 case where T must have been understood by DataStream.Contains<T>() as "being in the realm of natural numbers", then we've proved out all of T with 1 said test
}

uses
  PE.Actors.Rando,  //In the interface section for inlining
  PE.Routines,
  PE.Types,
  System.RTTI;  //In the interface section for inlining

type
  ExecutableSpecification_DataStreams_Contains_Digit_ValueCompleteTests = record
  strict private
    class procedure GivenAll3Million628Thousand800PossibleCombinationsForArrayOfDigit_AndGivenEveryValueOfDigit_All36Million288Thousand000TestCasesMatchExpectedForAGeneratedExpected(); static; inline;
  private
    class function GenerateExpected(const ADataStream: ArrayOf<Digit>; const AValue: Digit): Boolean; static; inline;
  public
    class procedure Exercise(); static; inline;
  end;

  ExecutableSpecification_DataStream_Contains_TypeCompleteOrdinal<OrdinalUnderTest: record> = record
  strict private class var OrdinalUnderTest_Default: OrdinalUnderTest;
  strict private class var ArrayOfOrdinalUnderTest_Empty: ArrayOf<OrdinalUnderTest>;
  strict private {Zero Element Data Stream}
    class procedure ReturnsFalseWhenGivenAnEmptyDataStreamAndADefaultTypeUnderTestValue(); static; inline;
    class procedure ReturnsFalseWhenGivenAnEmptyDataStreamAndANonDefaultTypeUnderTestValue(); static; inline;
  strict private  {Single Element Data Stream}
    class procedure ReturnsFalseWhenGivenADefaultTypeUnderTestValueAsADataStreamAndANonDefaultTypeUnderTestValueForComparison(); static; inline;
    class procedure ReturnsFalseWhenGivenANonDefaultTypeUnderTestValueAsADataStreamAndADefaultTypeUnderTestValueForComparison(); static; inline;
    class procedure ReturnsTrueWhenGivenADefaultTypeUnderTestValueAsADataStreamAndADefaultTypeUnderTestValueForComparison(); static; inline;
    class procedure ReturnsTrueWhenGivenANonDefaultTypeUnderTestValueAsADataStreamAndTheSameNonDefaultTypeUnderTestValueForComparison(); static; inline;
  strict private  {Multiple Element Data Stream}
    class procedure ReturnsFalseWhenGivenMultipleDefaultTypeUnderTestValuesAsADataStreamAndANonDefaultTypeUnderTestValueForComparison(); static; inline;
    class procedure ReturnsFalseWhenGivenMultipleVaryingNonDefaultTypeUnderTestValuesAsADataStreamAndADefaultTypeUnderTestValueForComparison(); static; inline;
    class procedure ReturnsTrueWhenGivenMultipleDefaultTypeUnderTestValuesAsADataStreamAndADefaultTypeUnderTestValueForComparison(); static; inline;
    class procedure ReturnsTrueWhenGivenMultipleVaryingNonDefaultTypeUnderTestValuesAsADataStreamAndEachNonDefaultTypeUnderTestValueForComparison(); static; inline;
  public
    class constructor Create();
  public
    class procedure Exercise(); static; inline;
  end;

implementation

{ExecutableSpecification_DataStreams_Contains_Digit_ValueCompleteTests}
class procedure ExecutableSpecification_DataStreams_Contains_Digit_ValueCompleteTests.Exercise;
begin
  GivenAll3Million628Thousand800PossibleCombinationsForArrayOfDigit_AndGivenEveryValueOfDigit_All36Million288Thousand000TestCasesMatchExpectedForAGeneratedExpected
end;

class function ExecutableSpecification_DataStreams_Contains_Digit_ValueCompleteTests.GenerateExpected(const ADataStream: ArrayOf<Digit>; const AValue: Digit): Boolean;
begin
  System.Assert(10 = System.Length(ADataStream));
  Result := False;
  for var I: NativeInt := System.Low(ADataStream) to System.High(ADataStream) do
    if (ADataStream[I] = AValue) then
      Exit(True);
end;

class procedure ExecutableSpecification_DataStreams_Contains_Digit_ValueCompleteTests.GivenAll3Million628Thousand800PossibleCombinationsForArrayOfDigit_AndGivenEveryValueOfDigit_All36Million288Thousand000TestCasesMatchExpectedForAGeneratedExpected;
begin
  var TestCount: NaturalNumber := 0;
  System.Assert(0 = TestCount);
  for var Digit0: Digit := 0 to Digit.Max do
    for var Digit1: Digit := 1 to Digit.Max do
      for var Digit2: Digit := 2 to Digit.Max do
        for var Digit3: Digit := 3 to Digit.Max do
          for var Digit4: Digit := 4 to Digit.Max do
            for var Digit5: Digit := 5 to Digit.Max do
              for var Digit6: Digit := 6 to Digit.Max do
                for var Digit7: Digit := 7 to Digit.Max do
                  for var Digit8: Digit := 8 to Digit.Max do
                    for var Digit9: Digit := 9 to Digit.Max do
                    begin
                      var ActualDataStream: ArrayOf<Digit> := [Digit0, Digit1, Digit2, Digit3,
                        Digit4, Digit5, Digit6, Digit7, Digit8, Digit9];
                      for var ActualValue: Digit := System.Low(ActualDataStream) to System.High(ActualDataStream) do
                      begin
                        //Generating expected
                        var Expected: Boolean := GenerateExpected(ActualDataStream, ActualValue);
                        //Test
                        var Actual: Boolean := not Expected;
                        System.Assert(not (Expected = Actual));
                        Actual := DataStream.Contains<Digit>(ActualDataStream, ActualValue);
                        System.Assert(Expected = Actual);
                        TestCount := TestCount + 1;
                      end;
                    end;
  System.Assert(36288000 = TestCount);
end;

{ExecutableSpecification_DataStream_Contains_TypeCompleteOrdinal<OrdinalUnderTest>}
class constructor ExecutableSpecification_DataStream_Contains_TypeCompleteOrdinal<OrdinalUnderTest>.Create;
begin
  OrdinalUnderTest_Default := System.Default(OrdinalUnderTest);
  System.Assert(System.Default(OrdinalUnderTest) = OrdinalUnderTest_Default);
  ArrayOfOrdinalUnderTest_Empty := [];
  System.Assert(0 = System.Length(ArrayOfOrdinalUnderTest_Empty));
end;

class procedure ExecutableSpecification_DataStream_Contains_TypeCompleteOrdinal<OrdinalUnderTest>.Exercise;
begin
  ReturnsFalseWhenGivenAnEmptyDataStreamAndADefaultTypeUnderTestValue();
  ReturnsFalseWhenGivenAnEmptyDataStreamAndANonDefaultTypeUnderTestValue();
  ReturnsFalseWhenGivenADefaultTypeUnderTestValueAsADataStreamAndANonDefaultTypeUnderTestValueForComparison();
  ReturnsFalseWhenGivenANonDefaultTypeUnderTestValueAsADataStreamAndADefaultTypeUnderTestValueForComparison();
  ReturnsTrueWhenGivenADefaultTypeUnderTestValueAsADataStreamAndADefaultTypeUnderTestValueForComparison();
  ReturnsTrueWhenGivenANonDefaultTypeUnderTestValueAsADataStreamAndTheSameNonDefaultTypeUnderTestValueForComparison();
  ReturnsFalseWhenGivenMultipleDefaultTypeUnderTestValuesAsADataStreamAndANonDefaultTypeUnderTestValueForComparison();
  ReturnsFalseWhenGivenMultipleVaryingNonDefaultTypeUnderTestValuesAsADataStreamAndADefaultTypeUnderTestValueForComparison();
  ReturnsTrueWhenGivenMultipleDefaultTypeUnderTestValuesAsADataStreamAndADefaultTypeUnderTestValueForComparison();
  ReturnsTrueWhenGivenMultipleVaryingNonDefaultTypeUnderTestValuesAsADataStreamAndEachNonDefaultTypeUnderTestValueForComparison();
end;

class procedure ExecutableSpecification_DataStream_Contains_TypeCompleteOrdinal<OrdinalUnderTest>.ReturnsFalseWhenGivenADefaultTypeUnderTestValueAsADataStreamAndANonDefaultTypeUnderTestValueForComparison;
begin
  var Value: OrdinalUnderTest := Rando_TheUntrustworthy.NonDefaultValue<OrdinalUnderTest>();
  System.Assert(not (Value = OrdinalUnderTest_Default));
  System.Assert(not (DataStream.Contains<OrdinalUnderTest>([OrdinalUnderTest_Default], Value)));
end;

class procedure ExecutableSpecification_DataStream_Contains_TypeCompleteOrdinal<OrdinalUnderTest>.ReturnsFalseWhenGivenAnEmptyDataStreamAndADefaultTypeUnderTestValue;
begin
  System.Assert(not (DataStream.Contains<OrdinalUnderTest>(ArrayOfOrdinalUnderTest_Empty, OrdinalUnderTest_Default)));
end;

class procedure ExecutableSpecification_DataStream_Contains_TypeCompleteOrdinal<OrdinalUnderTest>.ReturnsFalseWhenGivenAnEmptyDataStreamAndANonDefaultTypeUnderTestValue;
begin
  var Value: OrdinalUnderTest := Rando_TheUntrustworthy.NonDefaultValue<OrdinalUnderTest>();
  System.Assert(not (Value = OrdinalUnderTest_Default));
  System.Assert(not (DataStream.Contains<OrdinalUnderTest>(ArrayOfOrdinalUnderTest_Empty, Value)));
end;

class procedure ExecutableSpecification_DataStream_Contains_TypeCompleteOrdinal<OrdinalUnderTest>.ReturnsFalseWhenGivenANonDefaultTypeUnderTestValueAsADataStreamAndADefaultTypeUnderTestValueForComparison;
begin
  var Value: OrdinalUnderTest := Rando_TheUntrustworthy.NonDefaultValue<OrdinalUnderTest>();
  System.Assert(not (Value = OrdinalUnderTest_Default));
  System.Assert(not (DataStream.Contains<OrdinalUnderTest>([Value], OrdinalUnderTest_Default)));
end;

class procedure ExecutableSpecification_DataStream_Contains_TypeCompleteOrdinal<OrdinalUnderTest>.ReturnsFalseWhenGivenMultipleDefaultTypeUnderTestValuesAsADataStreamAndANonDefaultTypeUnderTestValueForComparison;
begin
  var Value: OrdinalUnderTest := Rando_TheUntrustworthy.NonDefaultValue<OrdinalUnderTest>();
  System.Assert(not (Value = OrdinalUnderTest_Default));
  System.Assert(not (DataStream.Contains<OrdinalUnderTest>([OrdinalUnderTest_Default, OrdinalUnderTest_Default, OrdinalUnderTest_Default], Value)));
end;

class procedure ExecutableSpecification_DataStream_Contains_TypeCompleteOrdinal<OrdinalUnderTest>.ReturnsFalseWhenGivenMultipleVaryingNonDefaultTypeUnderTestValuesAsADataStreamAndADefaultTypeUnderTestValueForComparison;
begin
  var Values: ArrayOf<OrdinalUnderTest> := Rando_TheUntrustworthy.DistinctNonDefaultValues<OrdinalUnderTest>(3);
  System.Assert(3 = System.Length(Values));
  System.Assert(not (OrdinalUnderTest_Default = Values[System.Low(Values)]));
  System.Assert(not (OrdinalUnderTest_Default = Values[System.Low(Values) + 1]));
  System.Assert(not (OrdinalUnderTest_Default = Values[System.Low(Values) + 2]));
  System.Assert(not (DataStream.Contains<OrdinalUnderTest>(Values, OrdinalUnderTest_Default)));
end;

class procedure ExecutableSpecification_DataStream_Contains_TypeCompleteOrdinal<OrdinalUnderTest>.ReturnsTrueWhenGivenADefaultTypeUnderTestValueAsADataStreamAndADefaultTypeUnderTestValueForComparison;
begin
  System.Assert(DataStream.Contains<OrdinalUnderTest>([OrdinalUnderTest_Default], OrdinalUnderTest_Default));
end;

class procedure ExecutableSpecification_DataStream_Contains_TypeCompleteOrdinal<OrdinalUnderTest>.ReturnsTrueWhenGivenANonDefaultTypeUnderTestValueAsADataStreamAndTheSameNonDefaultTypeUnderTestValueForComparison;
begin
  var Value: OrdinalUnderTest := Rando_TheUntrustworthy.NonDefaultValue<OrdinalUnderTest>();
  System.Assert(not (Value = OrdinalUnderTest_Default));
  System.Assert(DataStream.Contains<OrdinalUnderTest>([OrdinalUnderTest_Default], OrdinalUnderTest_Default));
end;

class procedure ExecutableSpecification_DataStream_Contains_TypeCompleteOrdinal<OrdinalUnderTest>.ReturnsTrueWhenGivenMultipleDefaultTypeUnderTestValuesAsADataStreamAndADefaultTypeUnderTestValueForComparison;
begin
  System.Assert(DataStream.Contains<OrdinalUnderTest>([OrdinalUnderTest_Default, OrdinalUnderTest_Default, OrdinalUnderTest_Default], OrdinalUnderTest_Default));
end;

class procedure ExecutableSpecification_DataStream_Contains_TypeCompleteOrdinal<OrdinalUnderTest>.ReturnsTrueWhenGivenMultipleVaryingNonDefaultTypeUnderTestValuesAsADataStreamAndEachNonDefaultTypeUnderTestValueForComparison;
begin
  var Values: ArrayOf<OrdinalUnderTest> := Rando_TheUntrustworthy.DistinctNonDefaultValues<OrdinalUnderTest>(3);
  System.Assert(3 = System.Length(Values));
  System.Assert(not (OrdinalUnderTest_Default = Values[System.Low(Values)]));
  System.Assert(not (OrdinalUnderTest_Default = Values[System.Low(Values) + 1]));
  System.Assert(not (OrdinalUnderTest_Default = Values[System.Low(Values) + 2]));
  System.Assert(not (Values[System.Low(Values)] = Values[System.Low(Values) + 1]));
  System.Assert(not (Values[System.Low(Values)] = Values[System.Low(Values) + 2]));
  System.Assert(not (Values[System.Low(Values) + 1] = Values[System.Low(Values) + 2]));
  for var I: NativeInt := System.Low(Values) to System.High(Values) do
    System.Assert(DataStream.Contains<OrdinalUnderTest>(Values, Values[I]));
end;

end.
