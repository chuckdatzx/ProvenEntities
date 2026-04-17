unit PE.Tests.Routines;
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

uses
  PE.Actors.Rando,  //In the interface section for inlining
  PE.Routines,
  PE.Types.Foundational,
  System.RTTI;  //In the interface section for inlining

type
  {$REGION 'PE.Routines.DataStream.<Member X>'}
  ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest> = record
  strict private class var TypeUnderTest_Default: TypeUnderTest;
  public type
    Contains = record
    public type
      RoutineStructure = record
      strict private
        class procedure The1stParameterAcceptsAnEmptyArrayOfT(); static; inline;
        class procedure The2ndParameterAcceptsADefaultValueOfT(); static; inline;
        class procedure ReturnsABooleanValue(); static; inline;
      public
        class procedure Exercise(); static; inline;
      end;
      MatchingElementsAreNoticed = record
      strict private
        class procedure ReturnsTrueWhenGivenASingleElementOfDefaultTAndDefaultValueOfT(); static; inline;
        class procedure ReturnsTrueWhenGivenASingleElementOfNonDefaultTAndMatchingElementOfNonDefaultT(); static; inline;
      strict private
        class procedure ReturnsTrueWhenGivenMultipleIdenticalElementsOfDefaultTAndADefaultValueOfT(); static; inline;
        class procedure ReturnsTrueWhenGivenMultipleIdenticalElementsOfNonDefaultTAndTheSameNonDefaultValueOfT(); static; inline;
      public
        class procedure Exercise(); static; inline;
      end;
      MissingElementsAreNotNoticed = record
      strict private
        class procedure ReturnsFalseWhenGivenAnEmptyArrayAndADefaultValueOfT(); static; inline;
        class procedure ReturnsFalseWhenGivenAnEmptyArrayAndANonDefaultValueOfT(); static; inline;
      strict private
        class procedure ReturnsFalseWhenGivenASingleElementOfDefaultTAndANonDefaultValueOfT(); static; inline;
        class procedure ReturnsFalseWhenGivenASingleElementOfNonDefaultTAndADefaultValueOfT(); static; inline;
      strict private
        class procedure ReturnsFalseWhenGivenMultipleIdenticalElementsOfDefaultTAndANonDefaultValueOfT(); static; inline;
        class procedure ReturnsFalseWhenGivenMultipleIdenticalElementsOfNonDefaultTAndADefaultValueOfT(); static; inline;
        class procedure ReturnsFalseWhenGivenMultipleVariedElementsOfNonDefaultTAndADefaultValueOfT(); static; inline;
        class procedure ReturnsFalseWhenGivenMultipleVariedElementsOfNonDefaultTAndANonMatchingNonDefaultValueOfT(); static; inline;
      public
        class procedure Exercise(); static; inline;
      end;
    public
      class procedure Exercise(); static; inline;
    end;
  public type
    UniqueElements = record
    public type
      //Order of elements in the result is currently intentionally ignored (don't yet have a reason to care)
      RoutineStructure = record
      strict private
        class procedure TheOnlyParameterAcceptsAnEmptyArrayOfT(); static; inline;
        class procedure ReturnsAnArrayOfT(); static; inline;
      public
        class procedure Exercise(); static; inline;
      end;
      RepeatedElementsAreFilteredOut = record
      strict private
        class procedure Returns1DefaultElementWhenGiven1DefaultElement(); static; inline;
        class procedure Returns1DefaultElementWhenGiven3DefaultElements(); static; inline;
        class procedure Returns1NonDefaultElementWhenGiven1NonDefaultElement(); static; inline;
        class procedure Returns1NonDefaultElementWhenGiven3OfTheSameNonDefaultElements(); static; inline;
        class procedure Returns3UniqueNonDefaultElementsWhenGivenTheSame3UniqueNonDefaultElements(); static; inline;
        class procedure Returns3UniqueNonDefaultElementsAnd1DefaultElementWhenGivenTheSame3UniqueNonDefaultElementsAmongstNonDefaultElements(); static; inline;
      public
        class procedure Exercise(); static; inline;
      end;
    public
      class procedure Exercise(); static; inline;
    end;
  public
    class constructor Create();
  public
    class procedure Exercise(); static; inline;
  end;
{$ENDREGION}

  ExecutableSpecification_DataStreamRoutine_UniqueElements_ValueComplete<TypeUnderTest: record> = record
  strict private class var FullDigitArray: ArrayOf<Digit>;
  strict private {DataStream = Empty; Value = Each value of TypeUnderTest, one value at a time}
    class procedure ReturnsTrueWhenGivenADefaultElementAmongstTheEntireScopeOfValues(); static; inline;
    class procedure ReturnsTrueWhenGivenANonDefaultElementAmongstTheEntireScopeOfValues_ForEveryPossibleNonDefaultValue(); static; inline;
  strict private {DataStream = Full array of possible values; Value = Each value of TypeUnderTest, one value at a time}
//    class procedure ReturnsTrueWhenGivenADefaultElementAmongstTheEntireScopeOfValues(); static; inline;
//    class procedure ReturnsTrueWhenGivenANonDefaultElementAmongstTheEntireScopeOfValues_ForEveryPossibleNonDefaultValue(); static; inline;
  public
    class constructor Create();
  public
    class procedure Exercise(); static; inline;
  end;

implementation

uses
  System.TypInfo;

{$REGION 'PE.Routines.DataStream.<Member X>'}
{ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>}
class constructor ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Create;
begin
  TypeUnderTest_Default := System.Default(TypeUnderTest);
  System.Assert(TypeUnderTest_Default = System.Default(TypeUnderTest));
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Exercise;
begin
  Contains.Exercise();
  UniqueElements.Exercise();
end;

{ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains}
class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.Exercise;
begin
  MatchingElementsAreNoticed.Exercise();
  MissingElementsAreNotNoticed.Exercise();
  RoutineStructure.Exercise();
end;

{ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.RoutineStructure}
class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.RoutineStructure.Exercise;
begin
  The1stParameterAcceptsAnEmptyArrayOfT();
  The2ndParameterAcceptsADefaultValueOfT();
  ReturnsABooleanValue();
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.RoutineStructure.ReturnsABooleanValue;
begin
  var Dummy1: ArrayOf<TypeUnderTest> := []; var Dummy2: TypeUnderTest := TypeUnderTest_Default;
  var Expected: Boolean := DataStream.Contains<TypeUnderTest>(Dummy1, Dummy2);
  System.Assert(not (Expected));
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.RoutineStructure.The1stParameterAcceptsAnEmptyArrayOfT;
begin
  var Expected: ArrayOf<TypeUnderTest> := []; var Dummy: TypeUnderTest := TypeUnderTest_Default;
  DataStream.Contains<TypeUnderTest>(Expected, Dummy);
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.RoutineStructure.The2ndParameterAcceptsADefaultValueOfT;
begin
  var Dummy: ArrayOf<TypeUnderTest> := []; var Expected: TypeUnderTest := TypeUnderTest_Default;
  DataStream.Contains<TypeUnderTest>(Dummy, Expected);
end;

{ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.MissingElementsAreNotNoticed}
class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.MissingElementsAreNotNoticed.Exercise;
begin
  ReturnsFalseWhenGivenAnEmptyArrayAndADefaultValueOfT();
  ReturnsFalseWhenGivenAnEmptyArrayAndANonDefaultValueOfT();
  ReturnsFalseWhenGivenASingleElementOfDefaultTAndANonDefaultValueOfT();
  ReturnsFalseWhenGivenASingleElementOfNonDefaultTAndADefaultValueOfT();
  ReturnsFalseWhenGivenMultipleIdenticalElementsOfDefaultTAndANonDefaultValueOfT();
  ReturnsFalseWhenGivenMultipleIdenticalElementsOfNonDefaultTAndADefaultValueOfT();
  ReturnsFalseWhenGivenMultipleVariedElementsOfNonDefaultTAndADefaultValueOfT();
  ReturnsFalseWhenGivenMultipleVariedElementsOfNonDefaultTAndANonMatchingNonDefaultValueOfT();
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.MissingElementsAreNotNoticed.ReturnsFalseWhenGivenAnEmptyArrayAndADefaultValueOfT;
begin
  var Actual1: ArrayOf<TypeUnderTest> := []; var Actual2: TypeUnderTest := TypeUnderTest_Default;
  System.Assert(0 = System.Length(Actual1));
  System.Assert(TypeUnderTest_Default = Actual2);
  System.Assert(not (DataStream.Contains<TypeUnderTest>(Actual1, Actual2)));
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.MissingElementsAreNotNoticed.ReturnsFalseWhenGivenAnEmptyArrayAndANonDefaultValueOfT;
begin
  var Actual1: ArrayOf<TypeUnderTest> := []; var Actual2: TypeUnderTest := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>();
  System.Assert(0 = System.Length(Actual1));
  System.Assert(not (TypeUnderTest_Default = Actual2));
  System.Assert(not (DataStream.Contains<TypeUnderTest>(Actual1, Actual2)));
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.MissingElementsAreNotNoticed.ReturnsFalseWhenGivenASingleElementOfDefaultTAndANonDefaultValueOfT;
begin
  var Actual: TypeUnderTest := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>();
  System.Assert(not (TypeUnderTest_Default = Actual));
  System.Assert(not (DataStream.Contains<TypeUnderTest>([TypeUnderTest_Default], Actual)));
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.MissingElementsAreNotNoticed.ReturnsFalseWhenGivenASingleElementOfNonDefaultTAndADefaultValueOfT;
begin
  var Actual: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(1 = System.Length(Actual));
  System.Assert(not (TypeUnderTest_Default = Actual[System.Low(Actual)]));
  System.Assert(not (DataStream.Contains<TypeUnderTest>(Actual, TypeUnderTest_Default)));
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.MissingElementsAreNotNoticed.ReturnsFalseWhenGivenMultipleIdenticalElementsOfDefaultTAndANonDefaultValueOfT;
begin
  var Actual: TypeUnderTest := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>();
  System.Assert(not (TypeUnderTest_Default = Actual));
  System.Assert(not (DataStream.Contains<TypeUnderTest>([TypeUnderTest_Default, TypeUnderTest_Default, TypeUnderTest_Default], Actual)));
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.MissingElementsAreNotNoticed.ReturnsFalseWhenGivenMultipleIdenticalElementsOfNonDefaultTAndADefaultValueOfT;
begin
  var Actual: TypeUnderTest := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>();
  System.Assert(not (TypeUnderTest_Default = Actual));
  System.Assert(not (DataStream.Contains<TypeUnderTest>([Actual, Actual, Actual], TypeUnderTest_Default)));
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.MissingElementsAreNotNoticed.ReturnsFalseWhenGivenMultipleVariedElementsOfNonDefaultTAndADefaultValueOfT;
begin
  var Actuals: ArrayOf<TypeUnderTest> := Rando_TheUntrustworthy.DistinctNonDefaultValues<TypeUnderTest>(3);
  System.Assert(3 = System.Length(Actuals));
  var Actual1: TypeUnderTest := Actuals[System.Low(Actuals)];
  var Actual2: TypeUnderTest := Actuals[System.Low(Actuals) + 1];
  var Actual3: TypeUnderTest := Actuals[System.Low(Actuals) + 2];
  System.Assert(not (TypeUnderTest_Default = Actual1));
  System.Assert(not (TypeUnderTest_Default = Actual2));
  System.Assert(not (TypeUnderTest_Default = Actual3));
  System.Assert(not (Actual1 = Actual2));
  System.Assert(not (Actual1 = Actual3));
  System.Assert(not (Actual2 = Actual3));
  System.Assert(not (DataStream.Contains<TypeUnderTest>([Actual1, Actual2, Actual3], TypeUnderTest_Default)));
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.MissingElementsAreNotNoticed.ReturnsFalseWhenGivenMultipleVariedElementsOfNonDefaultTAndANonMatchingNonDefaultValueOfT;
begin
  var Actuals: ArrayOf<TypeUnderTest> := Rando_TheUntrustworthy.DistinctNonDefaultValues<TypeUnderTest>(4);
  System.Assert(4 = System.Length(Actuals));
  var Actual1: TypeUnderTest := Actuals[System.Low(Actuals)];
  var Actual2: TypeUnderTest := Actuals[System.Low(Actuals) + 1];
  var Actual3: TypeUnderTest := Actuals[System.Low(Actuals) + 2];
  var Actual4: TypeUnderTest := Actuals[System.Low(Actuals) + 3];
  System.Assert(not (TypeUnderTest_Default = Actual1));
  System.Assert(not (TypeUnderTest_Default = Actual2));
  System.Assert(not (TypeUnderTest_Default = Actual3));
  System.Assert(not (TypeUnderTest_Default = Actual4));
  System.Assert(not (Actual1 = Actual2));
  System.Assert(not (Actual1 = Actual3));
  System.Assert(not (Actual1 = Actual4));
  System.Assert(not (Actual2 = Actual3));
  System.Assert(not (Actual2 = Actual4));
  System.Assert(not (Actual3 = Actual4));
  System.Assert(not (DataStream.Contains<TypeUnderTest>([Actual1, Actual2, Actual3], Actual4)));
end;

{ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.MatchingElementsAreNoticed}
class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.MatchingElementsAreNoticed.Exercise;
begin
  ReturnsTrueWhenGivenASingleElementOfDefaultTAndDefaultValueOfT();
  ReturnsTrueWhenGivenASingleElementOfNonDefaultTAndMatchingElementOfNonDefaultT();
  ReturnsTrueWhenGivenMultipleIdenticalElementsOfDefaultTAndADefaultValueOfT();
  ReturnsTrueWhenGivenMultipleIdenticalElementsOfNonDefaultTAndTheSameNonDefaultValueOfT();
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.MatchingElementsAreNoticed.ReturnsTrueWhenGivenASingleElementOfDefaultTAndDefaultValueOfT;
begin
  System.Assert(DataStream.Contains<TypeUnderTest>([TypeUnderTest_Default], TypeUnderTest_Default));
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.MatchingElementsAreNoticed.ReturnsTrueWhenGivenASingleElementOfNonDefaultTAndMatchingElementOfNonDefaultT;
begin
  var Actual: TypeUnderTest := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>();
  System.Assert(not (Actual = TypeUnderTest_Default));
  System.Assert(DataStream.Contains<TypeUnderTest>([Actual], Actual));
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.MatchingElementsAreNoticed.ReturnsTrueWhenGivenMultipleIdenticalElementsOfDefaultTAndADefaultValueOfT;
begin
  System.Assert(DataStream.Contains<TypeUnderTest>([TypeUnderTest_Default, TypeUnderTest_Default, TypeUnderTest_Default], TypeUnderTest_Default));
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.Contains.MatchingElementsAreNoticed.ReturnsTrueWhenGivenMultipleIdenticalElementsOfNonDefaultTAndTheSameNonDefaultValueOfT;
begin
  var Actual: TypeUnderTest := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>();
  System.Assert(not (TypeUnderTest_Default = Actual));
  System.Assert(DataStream.Contains<TypeUnderTest>([Actual, Actual, Actual], Actual));
end;

{ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.UniqueElements}
class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.UniqueElements.Exercise;
begin
  RoutineStructure.Exercise();
  RepeatedElementsAreFilteredOut.Exercise();
end;

{ExecutableSpecification_DataStreamRoutines_TypeComplete.UniqueElements<TypeUnderTest>.RoutineStructure}
class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.UniqueElements.RoutineStructure.Exercise;
begin
  TheOnlyParameterAcceptsAnEmptyArrayOfT();
  ReturnsAnArrayOfT();
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.UniqueElements.RoutineStructure.ReturnsAnArrayOfT;
begin
  var Dummy: ArrayOf<TypeUnderTest>;
  var Expected: ArrayOf<TypeUnderTest> := DataStream.UniqueElements<TypeUnderTest>(Dummy);
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.UniqueElements.RoutineStructure.TheOnlyParameterAcceptsAnEmptyArrayOfT;
begin
  var Dummy: ArrayOf<TypeUnderTest>; var Expected: ArrayOf<TypeUnderTest>;
  Expected := DataStream.UniqueElements<TypeUnderTest>(Dummy);
  System.Assert(0 = System.Length(Expected));
end;

{ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.UniqueElements.RepeatedElementsAreFilteredOut}
class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.UniqueElements.RepeatedElementsAreFilteredOut.Exercise;
begin
  Returns1DefaultElementWhenGiven1DefaultElement();
  Returns1DefaultElementWhenGiven3DefaultElements();
  Returns1NonDefaultElementWhenGiven1NonDefaultElement();
  Returns1NonDefaultElementWhenGiven3OfTheSameNonDefaultElements();
  Returns3UniqueNonDefaultElementsWhenGivenTheSame3UniqueNonDefaultElements();
  Returns3UniqueNonDefaultElementsAnd1DefaultElementWhenGivenTheSame3UniqueNonDefaultElementsAmongstNonDefaultElements();
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.UniqueElements.RepeatedElementsAreFilteredOut.Returns1DefaultElementWhenGiven1DefaultElement;
begin
  var Actual: ArrayOf<TypeUnderTest> := DataStream.UniqueElements<TypeUnderTest>([TypeUnderTest_Default]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(TypeUnderTest_Default = Actual[0]);
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.UniqueElements.RepeatedElementsAreFilteredOut.Returns1DefaultElementWhenGiven3DefaultElements;
begin
  var Actual: ArrayOf<TypeUnderTest> := DataStream.UniqueElements<TypeUnderTest>([TypeUnderTest_Default, TypeUnderTest_Default, TypeUnderTest_Default]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(TypeUnderTest_Default = Actual[0]);
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.UniqueElements.RepeatedElementsAreFilteredOut.Returns1NonDefaultElementWhenGiven1NonDefaultElement;
begin
  var Actual: ArrayOf<TypeUnderTest> := DataStream.UniqueElements<TypeUnderTest>([Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(not (TypeUnderTest_Default = Actual[0]));
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.UniqueElements.RepeatedElementsAreFilteredOut.Returns1NonDefaultElementWhenGiven3OfTheSameNonDefaultElements;
begin
  var DataElement: TypeUnderTest := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>();
  var Actual: ArrayOf<TypeUnderTest> := DataStream.UniqueElements<TypeUnderTest>([DataElement, DataElement, DataElement]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(not (TypeUnderTest_Default = Actual[0]));
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.UniqueElements.RepeatedElementsAreFilteredOut.Returns3UniqueNonDefaultElementsAnd1DefaultElementWhenGivenTheSame3UniqueNonDefaultElementsAmongstNonDefaultElements;
begin
  var Expected: ArrayOf<TypeUnderTest> := [TypeUnderTest_Default, Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(4 = System.Length(Expected));
  System.Assert(Expected[System.Low(Expected)] <> Expected[System.Low(Expected) + 1]);
  System.Assert(Expected[System.Low(Expected)] <> Expected[System.Low(Expected) + 2]);
  System.Assert(Expected[System.Low(Expected)] <> Expected[System.Low(Expected) + 3]);
  System.Assert(Expected[System.Low(Expected) + 1] <> Expected[System.Low(Expected) + 2]);
  System.Assert(Expected[System.Low(Expected) + 1] <> Expected[System.Low(Expected) + 3]);
  System.Assert(Expected[System.Low(Expected) + 2] <> Expected[System.Low(Expected) + 3]);
  var Data: ArrayOf<TypeUnderTest> := [Expected[System.Low(Expected)], TypeUnderTest_Default, Expected[System.Low(Expected) + 1], TypeUnderTest_Default, Expected[System.Low(Expected) + 2], TypeUnderTest_Default, Expected[System.Low(Expected) + 3]];
  var Actual: ArrayOf<TypeUnderTest> := DataStream.UniqueElements<TypeUnderTest>( Expected);
  System.Assert(4 = System.Length(Actual));
  System.Assert(Expected[System.Low(Expected)] = Actual[System.Low(Actual)]);
  System.Assert(Expected[System.Low(Expected) + 1] = Actual[System.Low(Actual) + 1]);
  System.Assert(Expected[System.Low(Expected) + 2] = Actual[System.Low(Actual) + 2]);
  System.Assert(Expected[System.Low(Expected) + 3] = Actual[System.Low(Actual) + 3]);
end;

class procedure ExecutableSpecification_DataStreamRoutines_TypeComplete<TypeUnderTest>.UniqueElements.RepeatedElementsAreFilteredOut.Returns3UniqueNonDefaultElementsWhenGivenTheSame3UniqueNonDefaultElements;
begin
  var Expected: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(3 = System.Length(Expected));
  System.Assert(Expected[System.Low(Expected)] <> Expected[System.Low(Expected) + 1]);
  System.Assert(Expected[System.Low(Expected)] <> Expected[System.Low(Expected) + 2]);
  System.Assert(Expected[System.Low(Expected) + 1] <> Expected[System.Low(Expected) + 2]);
  var Actual: ArrayOf<TypeUnderTest> := DataStream.UniqueElements<TypeUnderTest>(Expected);
  System.Assert(3 = System.Length(Actual));
  System.Assert(Expected[System.Low(Expected)] = Actual[System.Low(Actual)]);
  System.Assert(Expected[System.Low(Expected) + 1] = Actual[System.Low(Actual) + 1]);
  System.Assert(Expected[System.Low(Expected) + 2] = Actual[System.Low(Actual) + 2]);
end;
{$ENDREGION}

{ ExecutableSpecification_DataStreamRoutine_UniqueElements_ValueComplete<TypeUnderTest> }

class constructor ExecutableSpecification_DataStreamRoutine_UniqueElements_ValueComplete<TypeUnderTest>.Create;
begin
  FullDigitArray := [0,1,2,3,4,5,6,7,8,9];
  System.Assert(10 = System.Length(FullDigitArray));
  System.Assert(0 = FullDigitArray[0]);
  System.Assert(1 = FullDigitArray[1]);
  System.Assert(2 = FullDigitArray[2]);
  System.Assert(3 = FullDigitArray[3]);
  System.Assert(4 = FullDigitArray[4]);
  System.Assert(5 = FullDigitArray[5]);
  System.Assert(6 = FullDigitArray[6]);
  System.Assert(7 = FullDigitArray[7]);
  System.Assert(8 = FullDigitArray[8]);
  System.Assert(9 = FullDigitArray[9]);
end;

class procedure ExecutableSpecification_DataStreamRoutine_UniqueElements_ValueComplete<TypeUnderTest>.Exercise;
begin
  ReturnsTrueWhenGivenANonDefaultElementAmongstTheEntireScopeOfValues_ForEveryPossibleNonDefaultValue();
end;

class procedure ExecutableSpecification_DataStreamRoutine_UniqueElements_ValueComplete<TypeUnderTest>.ReturnsTrueWhenGivenADefaultElementAmongstTheEntireScopeOfValues;
begin
  System.Assert(DataStream.Contains<Digit>(FullDigitArray, System.Default(Digit)));
end;

class procedure ExecutableSpecification_DataStreamRoutine_UniqueElements_ValueComplete<TypeUnderTest>.ReturnsTrueWhenGivenANonDefaultElementAmongstTheEntireScopeOfValues_ForEveryPossibleNonDefaultValue();
begin
  if (Digit.TypeIdentity = System.TypeInfo(TypeUnderTest)) then
  begin
    System.Assert(0 = System.Default(Digit));
    System.Assert(0 = Digit.Min);
    for var EachDigit: Digit := (Digit.Min + 1) to Digit.Max do
      System.Assert(DataStream.Contains<Digit>(FullDigitArray, EachDigit));
  end
  else
    if (MonoChar.TypeIdentity = System.TypeInfo(MonoChar)) then
    begin
//      System.Assert(0 = Ord(System.Default(MonoChar)));
//      System.Assert(0 = MonoChar.Min);
//      var FullMonoCharArray: ArrayOf<MonoChar> := [];
//      for var EachMonoChar: MonoChar := MonoChar.Min to MonoChar.Max do
//      begin
//        FullMonoCharArray := FullMonoCharArray + [EachMonoChar];
//        System.Assert(EachMonoChar = FullMonoCharArray[System.High(FullMonoCharArray)]);
//      end;
//      for var EachMonoChar: MonoChar := MonoChar.Min to MonoChar.Max do
//        System.Assert(DataStream.Contains<MonoChar>(FullMonoCharArray, EachMonoChar));
    end;
end;

end.
