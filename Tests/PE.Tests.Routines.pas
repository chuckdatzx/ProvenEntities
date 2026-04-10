unit PE.Tests.Routines;

interface

uses
  {PE}
  PE.Delphi.Rando,  //For inlining
  PE.Routines,
  PE.Types.Foundational;

type
  AllTests = record
  public
    class procedure Exercise(); static; inline;
  end;

  DataStreamTests = record
  public type
    Contains<TypeUnderTest1> = record
    public type
      RoutineStructure<TypeUnderTest2> = record
      strict private
        class procedure The1stParameterAcceptsAnEmptyArrayOfT(); static; inline;
        class procedure The2ndParameterAcceptsADefaultValueOfT(); static; inline;
        class procedure ReturnsABooleanValue(); static; inline;
      public
        class procedure Exercise(); static; inline;
      end;
      MatchingElementsAreNoticed<TypeUnderTest2> = record
      strict private
        class procedure ReturnsTrueWhenGivenASingleElementOfDefaultTAndDefaultValueOfT(); static; inline;
        class procedure ReturnsTrueWhenGivenASingleElementOfNonDefaultTAndMatchingElementOfNonDefaultT(); static; inline;
      strict private
        class procedure ReturnsTrueWhenGivenMultipleIdenticalElementsOfDefaultTAndADefaultValueOfT(); static; inline;
        class procedure ReturnsTrueWhenGivenMultipleIdenticalElementsOfNonDefaultTAndTheSameNonDefaultValueOfT(); static; inline;
      public
        class procedure Exercise(); static; inline;
      end;
      MissingElementsAreNotNoticed<TypeUnderTest2> = record
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
    UniqueElements<TypeUnderTest1> = record
    public type
      RoutineStructure<TypeUnderTest2> = record
      strict private
        class procedure TheOnlyParameterAcceptsAnEmptyArrayOfT(); static; inline;
        class procedure ReturnsAnArrayOfT(); static; inline;
      public
        class procedure Exercise(); static; inline;
      end;
      ///<summary>Proving out filtering using {x} elements with values of either default or non-default</summary>
      RepeatedElementsAreFilteredOut<TypeUnderTest2> = record
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
  end;

  DataStreamTests_Closed = record
  public type
    UniqueElements = record
    public type
      { TODO -oChuck -cToDo : Prove the following tests out at the type level (currently only proven when closed) }
      ResultOrder_UsingNaturalNumber = record
      strict private
        class procedure ReturnsElementsInAscendingOrderWhenGivenElementsInAscendingOrder; static; inline;
        class procedure ReturnsElementsInDescendingOrderWhenGivenElementsInDescendingOrder(); static; inline;
        class procedure ReturnsElementsInMixedOrderWhenGivenElementsInMixedOrder(); static; inline;
      public
        class procedure Exercise(); static; inline;
      end;
    end;
  public
    class procedure Exercise(); static; inline;
  end;

implementation

uses
  {PE}
  PE.Types.Composite;

{AllTests}
class procedure AllTests.Exercise;
begin
  {Helpers for helped types}
  DataStreamTests_Closed.Exercise();
  DataStreamTests.Contains<NaturalNumber>.Exercise();
  DataStreamTests.UniqueElements<NaturalNumber>.Exercise();
  DataStreamTests.UniqueElements<NaturalNumber32>.Exercise();
  {$IFDEF CPU64BITS}
  DataStreamTests.UniqueElements<NaturalNumber64>.Exercise();
  {$ELSE}
    {$MESSAGE WARN 'PE.Routines.DataStream cannot be proven for the NaturalNumber64 type (other NaturalNumber variations are proven)'}
  {$IFEND}
end;

{DataStreamTests.UniqueElements<TypeUnderTest>}
class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.Exercise;
begin
  RoutineStructure<TypeUnderTest1>.Exercise();
  RepeatedElementsAreFilteredOut<TypeUnderTest1>.Exercise();
end;

{DataStreamTests.UniqueElements<TypeUnderTest1>.RoutineStructure<TypeUnderTest2>}
class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.RoutineStructure<TypeUnderTest2>.Exercise;
begin
  TheOnlyParameterAcceptsAnEmptyArrayOfT();
  ReturnsAnArrayOfT();
end;

class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.RoutineStructure<TypeUnderTest2>.ReturnsAnArrayOfT;
begin
  var Dummy: ArrayOf<TypeUnderTest2>;
  var Expected: ArrayOf<TypeUnderTest2> := DataStream.UniqueElements<TypeUnderTest2>(Dummy);
end;

class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.RoutineStructure<TypeUnderTest2>.TheOnlyParameterAcceptsAnEmptyArrayOfT;
begin
  var Dummy: ArrayOf<TypeUnderTest2>; var Expected: ArrayOf<TypeUnderTest2>;
  Expected := DataStream.UniqueElements<TypeUnderTest2>(Dummy);
  System.Assert(0 = System.Length(Expected));
end;

{DataStreamTests_Closed.UniqueElements.ResultOrder}
class procedure DataStreamTests_Closed.UniqueElements.ResultOrder_UsingNaturalNumber.Exercise;
begin
  ReturnsElementsInAscendingOrderWhenGivenElementsInAscendingOrder();
  ReturnsElementsInDescendingOrderWhenGivenElementsInDescendingOrder();
  ReturnsElementsInMixedOrderWhenGivenElementsInMixedOrder();
end;

class procedure DataStreamTests_Closed.UniqueElements.ResultOrder_UsingNaturalNumber.ReturnsElementsInAscendingOrderWhenGivenElementsInAscendingOrder;
begin
  var Actual: ArrayOf<NaturalNumber> := DataStream.UniqueElements<NaturalNumber>([5,10,35,55]);
  System.Assert(4 = System.Length(Actual));
  System.Assert(5 = Actual[System.Low(Actual)]);
  System.Assert(10 = Actual[System.Low(Actual) + 1]);
  System.Assert(35 = Actual[System.Low(Actual) + 2]);
  System.Assert(55 = Actual[System.Low(Actual) + 3]);
end;

class procedure DataStreamTests_Closed.UniqueElements.ResultOrder_UsingNaturalNumber.ReturnsElementsInDescendingOrderWhenGivenElementsInDescendingOrder;
begin
  var Actual: ArrayOf<NaturalNumber> := DataStream.UniqueElements<NaturalNumber>([101,42,13]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(101 = Actual[System.Low(Actual)]);
  System.Assert(42 = Actual[System.Low(Actual) + 1]);
  System.Assert(13 = Actual[System.Low(Actual) + 2]);
end;

class procedure DataStreamTests_Closed.UniqueElements.ResultOrder_UsingNaturalNumber.ReturnsElementsInMixedOrderWhenGivenElementsInMixedOrder;
begin
  var Actual: ArrayOf<NaturalNumber> := DataStream.UniqueElements<NaturalNumber>([123,350,77]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(123 = Actual[System.Low(Actual)]);
  System.Assert(350 = Actual[System.Low(Actual) + 1]);
  System.Assert(77 = Actual[System.Low(Actual) + 2]);
end;

class procedure DataStreamTests_Closed.Exercise;
begin
  UniqueElements.ResultOrder_UsingNaturalNumber.Exercise();
end;

{DataStreamTests.UniqueElements<TypeUnderTest>.RepeatedElementsAreFilteredOut}
class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.RepeatedElementsAreFilteredOut<TypeUnderTest2>.Exercise;
begin
  Returns1DefaultElementWhenGiven1DefaultElement();
  Returns1DefaultElementWhenGiven3DefaultElements();
  Returns1NonDefaultElementWhenGiven1NonDefaultElement();
  Returns1NonDefaultElementWhenGiven3OfTheSameNonDefaultElements();
  Returns3UniqueNonDefaultElementsWhenGivenTheSame3UniqueNonDefaultElements();
  Returns3UniqueNonDefaultElementsAnd1DefaultElementWhenGivenTheSame3UniqueNonDefaultElementsAmongstNonDefaultElements();
end;

class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.RepeatedElementsAreFilteredOut<TypeUnderTest2>.Returns1DefaultElementWhenGiven1DefaultElement;
begin
  var Actual: ArrayOf<TypeUnderTest2> := DataStream.UniqueElements<TypeUnderTest2>([System.Default(TypeUnderTest2)]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(TypeUnderTest2) = Actual[0]);
end;

class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.RepeatedElementsAreFilteredOut<TypeUnderTest2>.Returns1DefaultElementWhenGiven3DefaultElements;
begin
  var Actual: ArrayOf<TypeUnderTest2> := DataStream.UniqueElements<TypeUnderTest2>([System.Default(TypeUnderTest2), System.Default(TypeUnderTest2), System.Default(TypeUnderTest2)]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(TypeUnderTest2) = Actual[0]);
end;

class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.RepeatedElementsAreFilteredOut<TypeUnderTest2>.Returns1NonDefaultElementWhenGiven1NonDefaultElement;
begin
  var Actual: ArrayOf<TypeUnderTest2> := DataStream.UniqueElements<TypeUnderTest2>([Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>()]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(TypeUnderTest2) <> Actual[0]);
end;

class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.RepeatedElementsAreFilteredOut<TypeUnderTest2>.Returns1NonDefaultElementWhenGiven3OfTheSameNonDefaultElements;
begin
  var DataElement: TypeUnderTest2 := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>();
  var Actual: ArrayOf<TypeUnderTest2> := DataStream.UniqueElements<TypeUnderTest2>([DataElement, DataElement, DataElement]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(TypeUnderTest2) <> Actual[0]);
end;

class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.RepeatedElementsAreFilteredOut<TypeUnderTest2>.Returns3UniqueNonDefaultElementsAnd1DefaultElementWhenGivenTheSame3UniqueNonDefaultElementsAmongstNonDefaultElements;
begin
  var Expected: ArrayOf<TypeUnderTest2> := [System.Default(TypeUnderTest2), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>()];
  System.Assert(4 = System.Length(Expected));
  System.Assert(Expected[System.Low(Expected)] <> Expected[System.Low(Expected) + 1]);
  System.Assert(Expected[System.Low(Expected)] <> Expected[System.Low(Expected) + 2]);
  System.Assert(Expected[System.Low(Expected)] <> Expected[System.Low(Expected) + 3]);
  System.Assert(Expected[System.Low(Expected) + 1] <> Expected[System.Low(Expected) + 2]);
  System.Assert(Expected[System.Low(Expected) + 1] <> Expected[System.Low(Expected) + 3]);
  System.Assert(Expected[System.Low(Expected) + 2] <> Expected[System.Low(Expected) + 3]);
  var Data: ArrayOf<TypeUnderTest2> := [Expected[System.Low(Expected)], System.Default(TypeUnderTest2), Expected[System.Low(Expected) + 1], System.Default(TypeUnderTest2), Expected[System.Low(Expected) + 2], System.Default(TypeUnderTest2), Expected[System.Low(Expected) + 3]];
  var Actual: ArrayOf<TypeUnderTest2> := DataStream.UniqueElements<TypeUnderTest2>( Expected);
  System.Assert(4 = System.Length(Actual));
  System.Assert(Expected[System.Low(Expected)] = Actual[System.Low(Actual)]);
  System.Assert(Expected[System.Low(Expected) + 1] = Actual[System.Low(Actual) + 1]);
  System.Assert(Expected[System.Low(Expected) + 2] = Actual[System.Low(Actual) + 2]);
  System.Assert(Expected[System.Low(Expected) + 3] = Actual[System.Low(Actual) + 3]);
end;

class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.RepeatedElementsAreFilteredOut<TypeUnderTest2>.Returns3UniqueNonDefaultElementsWhenGivenTheSame3UniqueNonDefaultElements;
begin
  var Expected: ArrayOf<TypeUnderTest2> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>()];
  System.Assert(3 = System.Length(Expected));
  System.Assert(Expected[System.Low(Expected)] <> Expected[System.Low(Expected) + 1]);
  System.Assert(Expected[System.Low(Expected)] <> Expected[System.Low(Expected) + 2]);
  System.Assert(Expected[System.Low(Expected) + 1] <> Expected[System.Low(Expected) + 2]);
  var Actual: ArrayOf<TypeUnderTest2> := DataStream.UniqueElements<TypeUnderTest2>(Expected);
  System.Assert(3 = System.Length(Actual));
  System.Assert(Expected[System.Low(Expected)] = Actual[System.Low(Actual)]);
  System.Assert(Expected[System.Low(Expected) + 1] = Actual[System.Low(Actual) + 1]);
  System.Assert(Expected[System.Low(Expected) + 2] = Actual[System.Low(Actual) + 2]);
end;

{DataStreamTests.Contains<TypeUnderTest1>}
class procedure DataStreamTests.Contains<TypeUnderTest1>.Exercise;
begin
  MatchingElementsAreNoticed<TypeUnderTest1>.Exercise();
  MissingElementsAreNotNoticed<TypeUnderTest1>.Exercise();
  RoutineStructure<TypeUnderTest1>.Exercise();
end;

{ DataStreamTests.Contains<TypeUnderTest1>.RoutineStructure<TypeUnderTest2> }

class procedure DataStreamTests.Contains<TypeUnderTest1>.RoutineStructure<TypeUnderTest2>.ReturnsABooleanValue;
begin
  var Dummy1: ArrayOf<TypeUnderTest2> := []; var Dummy2: TypeUnderTest2 := System.Default(TypeUnderTest2);
  var Expected: Boolean := DataStream.Contains<TypeUnderTest2>(Dummy1, Dummy2);
  System.Assert(not (Expected));
end;

class procedure DataStreamTests.Contains<TypeUnderTest1>.RoutineStructure<TypeUnderTest2>.Exercise;
begin
  The1stParameterAcceptsAnEmptyArrayOfT();
  The2ndParameterAcceptsADefaultValueOfT();
  ReturnsABooleanValue();
end;

class procedure DataStreamTests.Contains<TypeUnderTest1>.RoutineStructure<TypeUnderTest2>.The1stParameterAcceptsAnEmptyArrayOfT;
begin
  var Expected: ArrayOf<TypeUnderTest2> := []; var Dummy: TypeUnderTest2 := System.Default(TypeUnderTest2);
  DataStream.Contains<TypeUnderTest2>(Expected, Dummy);
end;

class procedure DataStreamTests.Contains<TypeUnderTest1>.RoutineStructure<TypeUnderTest2>.The2ndParameterAcceptsADefaultValueOfT;
begin
  var Dummy: ArrayOf<TypeUnderTest2> := []; var Expected: TypeUnderTest2 := System.Default(TypeUnderTest2);
  DataStream.Contains<TypeUnderTest2>(Dummy, Expected);
end;

{ DataStreamTests.Contains<TypeUnderTest1>.MissingElementsAreNotNoticed<TypeUnderTest2> }

class procedure DataStreamTests.Contains<TypeUnderTest1>.MissingElementsAreNotNoticed<TypeUnderTest2>.Exercise;
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

class procedure DataStreamTests.Contains<TypeUnderTest1>.MissingElementsAreNotNoticed<TypeUnderTest2>.ReturnsFalseWhenGivenAnEmptyArrayAndADefaultValueOfT;
begin
  var Actual1: ArrayOf<TypeUnderTest2> := []; var Actual2: TypeUnderTest2 := System.Default(TypeUnderTest2);
  System.Assert(0 = System.Length(Actual1));
  System.Assert(System.Default(TypeUnderTest2) = Actual2);
  System.Assert(not (DataStream.Contains<TypeUnderTest2>(Actual1, Actual2)));
end;

class procedure DataStreamTests.Contains<TypeUnderTest1>.MissingElementsAreNotNoticed<TypeUnderTest2>.ReturnsFalseWhenGivenAnEmptyArrayAndANonDefaultValueOfT;
begin
  var Actual1: ArrayOf<TypeUnderTest2> := []; var Actual2: TypeUnderTest2 := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>();
  System.Assert(0 = System.Length(Actual1));
  System.Assert(not (System.Default(TypeUnderTest2) = Actual2));
  System.Assert(not (DataStream.Contains<TypeUnderTest2>(Actual1, Actual2)));
end;

class procedure DataStreamTests.Contains<TypeUnderTest1>.MissingElementsAreNotNoticed<TypeUnderTest2>.ReturnsFalseWhenGivenASingleElementOfDefaultTAndANonDefaultValueOfT;
begin
  var Actual: TypeUnderTest2 := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>();
  System.Assert(not (System.Default(TypeUnderTest2) = Actual));
  System.Assert(not (DataStream.Contains<TypeUnderTest2>([System.Default(TypeUnderTest2)], Actual)));
end;

class procedure DataStreamTests.Contains<TypeUnderTest1>.MissingElementsAreNotNoticed<TypeUnderTest2>.ReturnsFalseWhenGivenASingleElementOfNonDefaultTAndADefaultValueOfT;
begin
  var Actual: ArrayOf<TypeUnderTest2> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>()];
  System.Assert(1 = System.Length(Actual));
  System.Assert(not (System.Default(TypeUnderTest2) = Actual[System.Low(Actual)]));
  System.Assert(not (DataStream.Contains<TypeUnderTest2>(Actual, System.Default(TypeUnderTest2))));
end;

class procedure DataStreamTests.Contains<TypeUnderTest1>.MissingElementsAreNotNoticed<TypeUnderTest2>.ReturnsFalseWhenGivenMultipleIdenticalElementsOfDefaultTAndANonDefaultValueOfT;
begin
  var Actual: TypeUnderTest2 := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>();
  System.Assert(not (System.Default(TypeUnderTest2) = Actual));
  System.Assert(not (DataStream.Contains<TypeUnderTest2>([System.Default(TypeUnderTest2), System.Default(TypeUnderTest2), System.Default(TypeUnderTest2)], Actual)));
end;

class procedure DataStreamTests.Contains<TypeUnderTest1>.MissingElementsAreNotNoticed<TypeUnderTest2>.ReturnsFalseWhenGivenMultipleIdenticalElementsOfNonDefaultTAndADefaultValueOfT;
begin
  var Actual: TypeUnderTest2 := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>();
  System.Assert(not (System.Default(TypeUnderTest2) = Actual));
  System.Assert(not (DataStream.Contains<TypeUnderTest2>([Actual, Actual, Actual], System.Default(TypeUnderTest2))));
end;

class procedure DataStreamTests.Contains<TypeUnderTest1>.MissingElementsAreNotNoticed<TypeUnderTest2>.ReturnsFalseWhenGivenMultipleVariedElementsOfNonDefaultTAndADefaultValueOfT;
begin
  var Actual1: TypeUnderTest2 := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>();
  var Actual2: TypeUnderTest2 := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>();
  var Actual3: TypeUnderTest2 := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>();
  System.Assert(not (System.Default(TypeUnderTest2) = Actual1));
  System.Assert(not (System.Default(TypeUnderTest2) = Actual2));
  System.Assert(not (System.Default(TypeUnderTest2) = Actual3));
  System.Assert(not (Actual1 = Actual2));
  System.Assert(not (Actual1 = Actual3));
  System.Assert(not (Actual2 = Actual3));
  System.Assert(not (DataStream.Contains<TypeUnderTest2>([Actual1, Actual2, Actual3], System.Default(TypeUnderTest2))));
end;

class procedure DataStreamTests.Contains<TypeUnderTest1>.MissingElementsAreNotNoticed<TypeUnderTest2>.ReturnsFalseWhenGivenMultipleVariedElementsOfNonDefaultTAndANonMatchingNonDefaultValueOfT;
begin
  var Actual1: TypeUnderTest2 := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>();
  var Actual2: TypeUnderTest2 := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>();
  var Actual3: TypeUnderTest2 := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>();
  var Actual4: TypeUnderTest2 := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>();
  System.Assert(not (System.Default(TypeUnderTest2) = Actual1));
  System.Assert(not (System.Default(TypeUnderTest2) = Actual2));
  System.Assert(not (System.Default(TypeUnderTest2) = Actual3));
  System.Assert(not (System.Default(TypeUnderTest2) = Actual4));
  System.Assert(not (Actual1 = Actual2));
  System.Assert(not (Actual1 = Actual3));
  System.Assert(not (Actual1 = Actual4));
  System.Assert(not (Actual2 = Actual3));
  System.Assert(not (Actual2 = Actual4));
  System.Assert(not (Actual3 = Actual4));
  System.Assert(not (DataStream.Contains<TypeUnderTest2>([Actual1, Actual2, Actual3], Actual4)));
end;

{ DataStreamTests.Contains<TypeUnderTest1>.MatchingElementsAreNoticed<TypeUnderTest2> }

class procedure DataStreamTests.Contains<TypeUnderTest1>.MatchingElementsAreNoticed<TypeUnderTest2>.Exercise;
begin
  ReturnsTrueWhenGivenASingleElementOfDefaultTAndDefaultValueOfT();
  ReturnsTrueWhenGivenASingleElementOfNonDefaultTAndMatchingElementOfNonDefaultT();
  ReturnsTrueWhenGivenMultipleIdenticalElementsOfDefaultTAndADefaultValueOfT();
  ReturnsTrueWhenGivenMultipleIdenticalElementsOfNonDefaultTAndTheSameNonDefaultValueOfT();
end;

class procedure DataStreamTests.Contains<TypeUnderTest1>.MatchingElementsAreNoticed<TypeUnderTest2>.ReturnsTrueWhenGivenASingleElementOfDefaultTAndDefaultValueOfT;
begin
  System.Assert(DataStream.Contains<TypeUnderTest2>([System.Default(TypeUnderTest2)], System.Default(TypeUnderTest2)));
end;

class procedure DataStreamTests.Contains<TypeUnderTest1>.MatchingElementsAreNoticed<TypeUnderTest2>.ReturnsTrueWhenGivenASingleElementOfNonDefaultTAndMatchingElementOfNonDefaultT;
begin
  var Actual: TypeUnderTest2 := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>();
  System.Assert(not (Actual = System.Default(TypeUnderTest2)));
  System.Assert(DataStream.Contains<TypeUnderTest2>([Actual], Actual));
end;

class procedure DataStreamTests.Contains<TypeUnderTest1>.MatchingElementsAreNoticed<TypeUnderTest2>.ReturnsTrueWhenGivenMultipleIdenticalElementsOfDefaultTAndADefaultValueOfT;
begin
  System.Assert(DataStream.Contains<TypeUnderTest2>([System.Default(TypeUnderTest2), System.Default(TypeUnderTest2), System.Default(TypeUnderTest2)], System.Default(TypeUnderTest2)));
end;

class procedure DataStreamTests.Contains<TypeUnderTest1>.MatchingElementsAreNoticed<TypeUnderTest2>.ReturnsTrueWhenGivenMultipleIdenticalElementsOfNonDefaultTAndTheSameNonDefaultValueOfT;
begin
  var Actual: TypeUnderTest2 := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest2>();
  System.Assert(not (System.Default(TypeUnderTest2) = Actual));
  System.Assert(DataStream.Contains<TypeUnderTest2>([Actual, Actual, Actual], Actual));
end;

end.
