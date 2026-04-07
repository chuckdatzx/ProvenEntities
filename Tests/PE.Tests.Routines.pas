unit PE.Tests.Routines;

interface

uses
  {PE}
  PE.Delphi.Rando,
  PE.Routines,
  PE.Types;

type
  AllTests = record
  public
    class procedure Exercise(); static; inline;
  end;

  DataStreamTests = record
  public type
    ///<summary>Just a type container</summary>
    UniqueElements<TypeUnderTest1> = record
      public type
        ///<summary>Locking down the routine's structure in domain terms</summary>
        RoutineStructure<TypeUnderTest2> = record
        strict private
          class procedure TheOnlyParameterAcceptsAnEmptyArrayOfT(); static; inline;
          class procedure ReturnsAnEmptyArrayOfT(); static; inline;
        public
          class procedure Exercise(); static; inline;
        end;
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

  ArrayOfHelperTests = record
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

{ AllTests }

class procedure AllTests.Exercise;
begin
  {Helpers for helped types}
  ArrayOfHelperTests.Exercise();
  DataStreamTests.UniqueElements<NaturalNumber>.Exercise();
  DataStreamTests.UniqueElements<NaturalNumber32>.Exercise();
  //DataStreamTests.UniqueElements<NaturalNumber64>.Exercise();
  { TODO -oChuck -cMusings :
Seems like the same issue I've encountered before (F2084 Internal Error: C2252).
Makes it seem like there's some inherent 32/64 bit issue I haven't yet grasped. }
end;

{ DataStreamTests.UniqueElements<TypeUnderTest>.RoutineStructure }

class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.RoutineStructure<TypeUnderTest2>.Exercise;
begin
  TheOnlyParameterAcceptsAnEmptyArrayOfT();
  ReturnsAnEmptyArrayOfT();
end;

class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.RoutineStructure<TypeUnderTest2>.ReturnsAnEmptyArrayOfT;
begin
  var Expected: ArrayOf<TypeUnderTest2>;
  DataStream.UniqueElements<TypeUnderTest2>(Expected);
end;

class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.RoutineStructure<TypeUnderTest2>.TheOnlyParameterAcceptsAnEmptyArrayOfT;
begin
  var Dummy: ArrayOf<TypeUnderTest2>; var Expected: ArrayOf<TypeUnderTest2>;
  Expected := DataStream.UniqueElements<TypeUnderTest2>(Dummy);
  System.Assert(0 = System.Length(Expected));
end;

{ DataStreamTests.UniqueElements<TypeUnderTest> }

class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.Exercise;
begin
  RoutineStructure<TypeUnderTest1>.Exercise();
  RepeatedElementsAreFilteredOut<TypeUnderTest1>.Exercise();
end;

{ ArrayOfHelperTests.UniqueElements.ResultOrder }

class procedure ArrayOfHelperTests.UniqueElements.ResultOrder_UsingNaturalNumber.Exercise;
begin
  ReturnsElementsInAscendingOrderWhenGivenElementsInAscendingOrder();
  ReturnsElementsInDescendingOrderWhenGivenElementsInDescendingOrder();
  ReturnsElementsInMixedOrderWhenGivenElementsInMixedOrder();
end;

class procedure ArrayOfHelperTests.UniqueElements.ResultOrder_UsingNaturalNumber.ReturnsElementsInAscendingOrderWhenGivenElementsInAscendingOrder;
begin
  var Actual: ArrayOf<NaturalNumber> := DataStream.UniqueElements<NaturalNumber>([5,10,35,55]);
  System.Assert(4 = System.Length(Actual));
  System.Assert(5 = Actual[System.Low(Actual)]);
  System.Assert(10 = Actual[System.Low(Actual) + 1]);
  System.Assert(35 = Actual[System.Low(Actual) + 2]);
  System.Assert(55 = Actual[System.Low(Actual) + 3]);
end;

class procedure ArrayOfHelperTests.UniqueElements.ResultOrder_UsingNaturalNumber.ReturnsElementsInDescendingOrderWhenGivenElementsInDescendingOrder;
begin
  var Actual: ArrayOf<NaturalNumber> := DataStream.UniqueElements<NaturalNumber>([101,42,13]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(101 = Actual[System.Low(Actual)]);
  System.Assert(42 = Actual[System.Low(Actual) + 1]);
  System.Assert(13 = Actual[System.Low(Actual) + 2]);
end;

class procedure ArrayOfHelperTests.UniqueElements.ResultOrder_UsingNaturalNumber.ReturnsElementsInMixedOrderWhenGivenElementsInMixedOrder;
begin
  var Actual: ArrayOf<NaturalNumber> := DataStream.UniqueElements<NaturalNumber>([123,350,77]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(123 = Actual[System.Low(Actual)]);
  System.Assert(350 = Actual[System.Low(Actual) + 1]);
  System.Assert(77 = Actual[System.Low(Actual) + 2]);
end;

{ ArrayOfHelperTests }

class procedure ArrayOfHelperTests.Exercise;
begin
  UniqueElements.ResultOrder_UsingNaturalNumber.Exercise();
end;

{ DataStreamTests.UniqueElements<TypeUnderTest>.RepeatedElementsAreFilteredOut }

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
  var Actual: ArrayOf<TypeUnderTest2> := DataStream.UniqueElements<TypeUnderTest2>([Rando.NonDefaultValue<TypeUnderTest2>()]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(TypeUnderTest2) <> Actual[0]);
end;

class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.RepeatedElementsAreFilteredOut<TypeUnderTest2>.Returns1NonDefaultElementWhenGiven3OfTheSameNonDefaultElements;
begin
  var DataElement: TypeUnderTest2 := Rando.NonDefaultValue<TypeUnderTest2>();
  var Actual: ArrayOf<TypeUnderTest2> := DataStream.UniqueElements<TypeUnderTest2>([DataElement, DataElement, DataElement]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(TypeUnderTest2) <> Actual[0]);
end;

class procedure DataStreamTests.UniqueElements<TypeUnderTest1>.RepeatedElementsAreFilteredOut<TypeUnderTest2>.Returns3UniqueNonDefaultElementsAnd1DefaultElementWhenGivenTheSame3UniqueNonDefaultElementsAmongstNonDefaultElements;
begin
  var Expected: ArrayOf<TypeUnderTest2> := [System.Default(TypeUnderTest2), Rando.NonDefaultValue<TypeUnderTest2>(), Rando.NonDefaultValue<TypeUnderTest2>(), Rando.NonDefaultValue<TypeUnderTest2>()];
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
  var Expected: ArrayOf<TypeUnderTest2> := [Rando.NonDefaultValue<TypeUnderTest2>(), Rando.NonDefaultValue<TypeUnderTest2>(), Rando.NonDefaultValue<TypeUnderTest2>()];
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

end.
