unit PE.Tests.BoundlessRoutines.DataStream.UniqueElements;
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
If the assumptions (listed in the PE.Tests unit) are True, then the PE.Routines.DataStreams.UniqueElements<T> routine is "proven" to Strength(X) for both now and in any future execution scenarios,
where "Strength(X)" is defined in the PE.Tests unit.
}
{
Domain Notes (DataStream.UniqueElements<T> works for all natural numbers; where "all natural numbers" = 0..∞):
  Assumption: It will never be possible to "fully test" the DataStreams.UniqueElements<T> routine (since it's generic and all, and "fully test" would have to include value complete testing)
  Assumption: It is possible to fully test DataStreams.UniqueElements<T> if, and only if, said T is bounded

First, let's test out the entire domain of PE.Types.Digit against our DataStreams.UniqueElements<T> routine (successfull completion of the ExecutableSpecification_DataStreams_UniqueElements_ZeroThroughInfinity_ValueCompleteTests.Exercise() routine).

Assuming that has been verified:

Now we can say that our DataStreams.UniqueElements<T> behaves as you might expect given its name, or maybe "works as intended", or "it is true to its word", and so on. Regardless, I believe we've established a fact:
- For all possible unique combinations of type Digit, and for all possible values of Digit, input = output

So if the Datastreams.UniqueElements<T> is both sound and complete w/respect to the type of Digit, why wouldn't it also be sound and complete for any expansion in the realm of all natural numbers?

Theory: Any type that is either a bounded subset or a bounded superset, with respect to the Digit type, only needs the following verification:
  - Understood by the compilation context as having the following:
    -from the point of entry of DataStream.UniqueElements<T>() until the point of exit of DataStream.UniqueElements<T>()
      -if T is understood by the compiler as a bounded ordinal type within the natural number realm
        - then if we can establish just 1 case where T must have been understood by DataStream.UniqueElements<T>() as "being in the realm of natural numbers", then we've proved out all of T with 1 said test

}

uses
  PE.Actors.Rando,
  PE.Delphi.TypeIdentity,
  PE.Routines,  //In the interface section for inlining
  PE.Types,  //In the interface section for inlining
  {Delphi}
  System.RTTI,  //In the interface section for inlining
  System.TypInfo;

type
  ExecutableSpecification_DataStreams_UniqueElements_Digit_ValueCompleteTests = record
  strict private
    class procedure ForAll3Million628Thousand800PossibleCombinations_TheSameUniqueValuesProvidedAreAlwaysTheSameUniqueValuesReturned(); static; inline;
  public
    class procedure Exercise(); static; inline;
  end;

  ExecutableSpecification_DataStreams_UniqueElements_TypeCompleteOrdinal<OrdinalUnderTest: record> = record
  strict private class var OrdinalUnderTest_Default: OrdinalUnderTest;
  strict private class var OrdinalUnderTest_TypeIdentity: PTypeInfo;
  strict private
    class procedure FirstAndOnlyParameterAcceptsAnArrayOfTypeUnderTestWithBothDefaultAndNonDefaultValues_ReturningTheProvidedElementsInIdenticalOrderGiven(); static; inline;
  public
    class constructor Create();
  public
    class procedure Exercise(); static; inline;
  end;

implementation

{ExecutableSpecification_DataStreams_UniqueElements_Digit_ValueCompleteTests}
class procedure ExecutableSpecification_DataStreams_UniqueElements_Digit_ValueCompleteTests.Exercise;
begin
  ForAll3Million628Thousand800PossibleCombinations_TheSameUniqueValuesProvidedAreAlwaysTheSameUniqueValuesReturned();
end;

class procedure ExecutableSpecification_DataStreams_UniqueElements_Digit_ValueCompleteTests.ForAll3Million628Thousand800PossibleCombinations_TheSameUniqueValuesProvidedAreAlwaysTheSameUniqueValuesReturned;
begin
  var TestCount: NaturalNumber := 0;
  System.Assert(0 = TestCount);
  var Actual: ArrayOf<Digit>;
  for var ExpectedDigit1: Digit := 0 to Digit.Max do
    for var ExpectedDigit2: Digit := 1 to Digit.Max do
      for var ExpectedDigit3: Digit := 2 to Digit.Max do
        for var ExpectedDigit4: Digit := 3 to Digit.Max do
          for var ExpectedDigit5: Digit := 4 to Digit.Max do
            for var ExpectedDigit6: Digit := 5 to Digit.Max do
              for var ExpectedDigit7: Digit := 6 to Digit.Max do
                for var ExpectedDigit8: Digit := 7 to Digit.Max do
                  for var ExpectedDigit9: Digit := 8 to Digit.Max do
                  begin
                    var Expected: ArrayOf<Digit> := [ExpectedDigit1];
                    System.Assert(1 = System.Length(Expected));
                    if (ExpectedDigit1 <> ExpectedDigit2) then
                      Expected := Expected + [ExpectedDigit2];
                    if (ExpectedDigit1 <> ExpectedDigit3) and (ExpectedDigit2 <> ExpectedDigit3) then
                      Expected := Expected + [ExpectedDigit3];
                    if (ExpectedDigit1 <> ExpectedDigit4) and (ExpectedDigit2 <> ExpectedDigit4) and (ExpectedDigit3 <> ExpectedDigit4) then
                      Expected := Expected + [ExpectedDigit4];
                    if (ExpectedDigit1 <> ExpectedDigit5) and (ExpectedDigit2 <> ExpectedDigit5) and (ExpectedDigit3 <> ExpectedDigit5) and (ExpectedDigit4 <> ExpectedDigit5) then
                      Expected := Expected + [ExpectedDigit5];
                    if (ExpectedDigit1 <> ExpectedDigit6) and (ExpectedDigit2 <> ExpectedDigit6) and (ExpectedDigit3 <> ExpectedDigit6) and
                       (ExpectedDigit4 <> ExpectedDigit6) and (ExpectedDigit5 <> ExpectedDigit6) then
                      Expected := Expected + [ExpectedDigit6];
                    if (ExpectedDigit1 <> ExpectedDigit7) and (ExpectedDigit2 <> ExpectedDigit7) and (ExpectedDigit3 <> ExpectedDigit7) and
                       (ExpectedDigit4 <> ExpectedDigit7) and (ExpectedDigit5 <> ExpectedDigit7) and (ExpectedDigit6 <> ExpectedDigit7) then
                      Expected := Expected + [ExpectedDigit7];
                    if (ExpectedDigit1 <> ExpectedDigit8) and (ExpectedDigit2 <> ExpectedDigit8) and (ExpectedDigit3 <> ExpectedDigit8) and
                       (ExpectedDigit4 <> ExpectedDigit8) and (ExpectedDigit5 <> ExpectedDigit8) and (ExpectedDigit6 <> ExpectedDigit8) and
                       (ExpectedDigit7 <> ExpectedDigit8) then
                      Expected := Expected + [ExpectedDigit8];
                    if (ExpectedDigit1 <> ExpectedDigit9) and (ExpectedDigit2 <> ExpectedDigit9) and (ExpectedDigit3 <> ExpectedDigit9) and
                       (ExpectedDigit4 <> ExpectedDigit9) and (ExpectedDigit5 <> ExpectedDigit9) and (ExpectedDigit6 <> ExpectedDigit9) and
                       (ExpectedDigit7 <> ExpectedDigit9) and (ExpectedDigit8 <> ExpectedDigit9) then
                      Expected := Expected + [ExpectedDigit9];
                    //Test against expected
                    Actual := [];
                    System.Assert(System.Length(Expected) > 0);
                    System.Assert(not (System.Length(Expected) = System.Length(Actual)));
                    Actual := DataStream.UniqueElements<Digit>(Expected);
                    System.Assert(System.Length(Expected) = System.Length(Actual));
                    for var I: Digit := System.Low(Expected) to System.High(Expected) do
                      System.Assert(Expected[I] = Actual[I]);
                    TestCount := TestCount + 1;
                  end;
  System.Assert(3628800 = TestCount);
end;

{ ExecutableSpecification_DataStreams_UniqueElements_TypeCompleteOrdinal<OrdinalUnderTest> }

class constructor ExecutableSpecification_DataStreams_UniqueElements_TypeCompleteOrdinal<OrdinalUnderTest>.Create();
begin
  //Validating Assumptions
  TypeEquivalenceInquiry<OrdinalUnderTest>.HasANonNullSystemDotTypeInfoValue();
  System.Assert(not (Digit.TypeIdentity = System.TypeInfo(OrdinalUnderTest)), 'The Digit type has already been type complete and value complete tested');
  //Initialization/validation
  OrdinalUnderTest_Default := System.Default(OrdinalUnderTest);
  System.Assert(System.Default(OrdinalUnderTest) = OrdinalUnderTest_Default);
  OrdinalUnderTest_TypeIdentity := System.TypeInfo(OrdinalUnderTest);
  System.Assert(System.TypeInfo(OrdinalUnderTest) = OrdinalUnderTest_TypeIdentity);
  //
  var KnownTypes: Boolean := ((OrdinalUnderTest_TypeIdentity = MonoChar.TypeIdentity) or (OrdinalUnderTest_TypeIdentity = NaturalNumber.TypeIdentity));
  if (not KnownTypes) then
  begin
    var AValue := TValue.From<OrdinalUnderTest>(OrdinalUnderTest_Default);
    System.Assert(AValue.IsOrdinal(), 'This battery of tests only handles ordinal cases for DataStream.UniqueElements<T>');
    System.Assert(System.Assigned(AValue.TypeData), 'TypeData is not assigned');
    System.Assert(AValue.TypeData.OrdType in [otSByte, otUByte, otSWord, otUWord, otSLong, otULong]);
    System.Assert(AValue.TypeData.MinValue >= 0);
    System.Assert(AValue.TypeData.MaxValue > 0);
  end;
end;

class procedure ExecutableSpecification_DataStreams_UniqueElements_TypeCompleteOrdinal<OrdinalUnderTest>.Exercise();
begin
  FirstAndOnlyParameterAcceptsAnArrayOfTypeUnderTestWithBothDefaultAndNonDefaultValues_ReturningTheProvidedElementsInIdenticalOrderGiven();
end;

class procedure ExecutableSpecification_DataStreams_UniqueElements_TypeCompleteOrdinal<OrdinalUnderTest>.FirstAndOnlyParameterAcceptsAnArrayOfTypeUnderTestWithBothDefaultAndNonDefaultValues_ReturningTheProvidedElementsInIdenticalOrderGiven;
begin
  //Ordering 1
  var Expected: ArrayOf<OrdinalUnderTest> := [OrdinalUnderTest_Default, Rando_TheUntrustworthy.NonDefaultValue<OrdinalUnderTest>()];
  System.Assert(2 = System.Length(Expected));
  System.Assert(OrdinalUnderTest_Default = Expected[System.Low(Expected)]);
  System.Assert(not (OrdinalUnderTest_Default = Expected[System.Low(Expected) + 1]));
  var Actual: ArrayOf<OrdinalUnderTest> := [];
  System.Assert(not (System.Length(Expected) = System.Length(Actual)));
  Actual := DataStream.UniqueElements<OrdinalUnderTest>(Expected);
  System.Assert(System.Length(Expected) = System.Length(Actual));
  System.Assert(Expected[System.Low(Expected)] = Actual[System.Low(Actual)]);
  System.Assert(Expected[System.Low(Expected) + 1] = Actual[System.Low(Actual) + 1]);
  //Ordering 2
  Expected := [Rando_TheUntrustworthy.NonDefaultValue<OrdinalUnderTest>(), OrdinalUnderTest_Default];
  System.Assert(2 = System.Length(Expected));
  System.Assert(not (OrdinalUnderTest_Default = Expected[System.Low(Expected)]));
  System.Assert(OrdinalUnderTest_Default = Expected[System.Low(Expected) + 1]);
  Actual := [];
  System.Assert(not (System.Length(Expected) = System.Length(Actual)));
  Actual := DataStream.UniqueElements<OrdinalUnderTest>(Expected);
  System.Assert(System.Length(Expected) = System.Length(Actual));
  System.Assert(Expected[System.Low(Expected)] = Actual[System.Low(Actual)]);
  System.Assert(Expected[System.Low(Expected) + 1] = Actual[System.Low(Actual) + 1]);
end;

end.
