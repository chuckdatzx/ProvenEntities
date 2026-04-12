unit PE.Tests.Routines.Buckets;
{Chuck C.T.
 I'm arguing that the following tests provide enough evidence to claim that the PE.Buckets.Routines.Categorize<T> routine has been proven. And by proven, I mean proven for:
 - whatever type T you decide to use where T is both compilable and passes the below battery of tests
 - for all T for all time; if it compiles and successfully runs now, it will continue to do so (like a powered circuit; barring events like power loss)

 If you don't believe that the PE.Buckets.Routines.Categorize<T> has been proven; that's fair. There are many points in
 my own life where I would have laughed at someone making such a claim and just moved on.
 However, if you truly disagree with me, please take the time show me where I'm wrong. I've put quite a bit of thought into
 the following; it seems unlikley that any given 1 person is going to find a problem at first glance (though I certainly
 could be wrong about that).
}
interface

uses
  {PE}
  PE.Buckets,
  PE.Delphi.AssignmentCompatibility,
  PE.Delphi.Rando, //For inlining
  PE.Types.Composite, //For inlining
  PE.Types.Foundational;

{$IF (not IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime)}
   {$MESSAGE FATAL 'Unable to continue without compile-time assertions established.'}
{$ENDIF}

type
  ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest> = record
  public type
    CasesWhichShouldArguablyBeRefactoredIntoTheExecSpec = record
    strict private
      class procedure ABucketInWithoutAGrabbyArmAndBetweenTwoBucketsInWithGrabbyArmsDoesNotInfluenceTheBucketOutCounts(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues = record
    strict private class function DefaultFocusedGrabbyArm(const Value: TypeUnderTest): Boolean; static; inline;
    strict private {All Bucket Out Counts Are Zero = DataStream(Size: varied; Content: default/non-default) by BucketsIn(Length: varied; Content: default save GrabbyArm[varies by "focus"]) by BucketOut(Length: varied; Content: presumably default save Count)}
      class procedure TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketInSaveADefaultFocusedGrabbyArm(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsIn(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsInSaveADefaultFocusedGrabbyArm(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketIn(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsIn(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndASingleDefaultBucketIn(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsIn(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenASingleNonDefaultElementOfTAsADataStreamAndASingleDefaultBucketIn(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenASingleNonDefaultElementOfTAsADataStreamAndASingleDefaultBucketInSaveADefaultFocusedGrabbyArm(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenASingleNonDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsIn(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenASingleNonDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsInSaveADefaultFocusedGrabbyArm(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndASingleDefaultBucketIn(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndASingleDefaultBucketInSaveADefaultFocusedGrabbyArm(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsIn(); static; inline;
      class procedure TheBucketOutCountIsZeroWhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsInSaveADefaultFocusedGrabbyArm(); static; inline;
    strict private {All Bucket Out Counts Are 1 = DataStream(Size: varied; Content: default/non-default) by BucketsIn(Length: varied; Content: default save GrabbyArm[varies by "focus"]) by BucketOut(Length: varied; Content: presumably default save Count)}
      class procedure TheBucketOutCountIs1WhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketSaveADefaultFocusedGrabbyArm(); static; inline;
      class procedure TheBucketOutCountIs1WhenGivenASingleDefaultElementOfTAsADataStreamAndAMultipleDefaultBucketsInSaveADefaultFocusedGrabbyArm(); static; inline;
      class procedure TheBucketOutCountIs1WhenGivenASingleNonDefaultElementOfTAsADataStreamAndASingleDefaultBucketSaveANonDefaultFocusedGrabbyArm(); static; inline;
      class procedure TheBucketOutCountIs1WhenGivenASingleNonDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsInSaveANonDefaultFocusedGrabbyArm(); static; inline;
    strict private {All Bucket Out Counts Are 3 = DataStream(Size: varied; Content: default/non-default) by BucketsIn(Length: varied; Content: default save GrabbyArm[varies by "focus"]) by BucketOut(Length: varied; Content: presumably default save Count)}
      class procedure TheBucketOutCountIs3WhenGivenMultipleDefaultElementsOfTAsADataStreamAndASingleDefaultBucketSaveADefaultFocusedGrabbyArm(); static; inline;
      class procedure TheBucketOutCountIs3WhenGivenMultipleDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsInSaveADefaultFocusedGrabbyArm(); static; inline;
      class procedure TheBucketOutCountIs3WhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndASingleDefaultBucketSaveANonDefaultFocusedGrabbyArm(); static; inline;
      class procedure TheBucketOutCountIs3WhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsInSaveANonDefaultFocusedGrabbyArm(); static; inline;
    public
      class constructor Create();
      class procedure Exercise(); static; inline;
    end;
    ///<notes>The BucketIn<T> to BucketOut ordering is implicitly tested here (is required and expected to fulfill proving the rule)</notes>
    NamePropertyIsCopiedFromBucketInToBucketOut = record
    strict private const NonDefaultMonoChar: MonoChar = 'a';
    strict private const NonDefaultMonoChar2: MonoChar = 'b';
    strict private const NonDefaultMonoChar3: MonoChar = 'c';
    strict private {Name property is always copied = DataStream(Size: Varied[Empty/Multiple]; Content: default/non-default) by BucketsIn(Length: Varied[Single/Multiple]; Content: default save Name[default/non-default]) by BucketOut(Length: Varied[Matching BucketsIn]; Content: presumably default save Name)}
      class procedure WhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn(); static; inline;
      class procedure WhenGivenAnEmptyDataStreamAndASingleNonDefaultNameDefaultBucketIn(); static; inline;
      class procedure WhenGivenAnEmptyDataStreamAndMultipleDefaultBucketInElements(); static; inline;
      class procedure WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames(); static; inline;
      class procedure WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames(); static; inline;
      class procedure WhenGivenMultipleNonDefaultTElementsAsADataStreamAndASingleDefaultBucketIn(); static; inline;
      class procedure WhenGivenMultipleNonDefaultTElementsAsADataStreamAndASingleNonDefaultNameDefaultBucketIn(); static; inline;
      class procedure WhenGivenMultipleNonDefaultTElementsAsADataStreamAndMultipleDefaultBucketInElements(); static; inline;
      class procedure WhenGivenMultipleNonDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames(); static; inline;
      class procedure WhenGivenMultipleNonDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames(); static; inline;
      class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleDefaultBucketIn(); static; inline;
      class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleNonDefaultNameDefaultBucketIn(); static; inline;
      class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleDefaultBucketInElements(); static; inline;
      class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames(); static; inline;
      class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames(); static; inline;
    public
      class constructor Create();
      class procedure Exercise(); static; inline;
    end;
    ///<notes>The BucketIn<T> to BucketOut ordering is implicitly tested here (is required and expected to fulfill proving the rule)</notes>
    NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn = record
    strict private class function NonDefaultSmartClaw(const Value: TypeUnderTest): Boolean; static; inline;
    strict private {Number of BucketOut instances is always the same as BucketIn<T> instance = DataStream(Size: varied; Content: default/non-default) by BucketsIn(Length: varied; Content: default/non-default]) by BucketOut(Length: matches BucketIn<T>; Content: Ignored)}
      class procedure ReturnsZeroBucketsOutWhenGivenAnEmptyDataStreamAndZeroBucketsIn(); static; inline;
      class procedure ReturnsZeroBucketsOutWhenGivenASingleDefaultElementAsADataStreamAndZeroBucketsIn(); static; inline;
      class procedure ReturnsZeroBucketsOutWhenGivenASingleNonDefaultElementAsADataStreamAndZeroBucketsIn(); static; inline;
      class procedure ReturnsZeroBucketsOutWhenGivenMultipleDefaultElementAsADataStreamAndZeroBucketsIn(); static; inline;
      class procedure ReturnsZeroBucketsOutWhenGivenMultipleNonDefaultElementAsADataStreamAndZeroBucketsIn(); static; inline;
    strict private {1 BucketOut}
      class procedure Returns1BucketOutWhenGivenAnEmptyDataStreamAnd1DefaultBucketInOfT(); static; inline;
      class procedure Returns1BucketOutWhenGivenAnEmptyDataStreamAnd1NonDefaultBucketInOfT(); static; inline;
      class procedure Returns1BucketOutWhenGivenASingleDefaultElementAsADataStreamAnd1DefaultBucketInOfT(); static; inline;
      class procedure Returns1BucketOutWhenGivenASingleDefaultElementAsADataStreamAnd1NonDefaultBucketInOfT(); static; inline;
      class procedure Returns1BucketOutWhenGivenASingleNonDefaultElementAsADataStreamAnd1DefaultBucketInOfT(); static; inline;
      class procedure Returns1BucketOutWhenGivenASingleNonDefaultElementAsADataStreamAnd1NonDefaultBucketInOfT(); static; inline;
      class procedure Returns1BucketOutWhenGivenAMultipleDefaultElementsAsADataStreamAnd1DefaultBucketInOfT(); static; inline;
      class procedure Returns1BucketOutWhenGivenAMultipleDefaultElementsAsADataStreamAnd1NonDefaultBucketInOfT(); static; inline;
      class procedure Returns1BucketOutWhenGivenAMultipleNonDefaultElementsAsADataStreamAnd1DefaultBucketInOfT(); static; inline;
      class procedure Returns1BucketOutWhenGivenAMultipleNonDefaultElementsAsADataStreamAnd1NonDefaultBucketInOfT(); static; inline;
    strict private {3 Buckets Out}
      class procedure Returns3BucketsOutWhenGivenAnEmptyDataStreamAnd3DefaultBucketInOfT(); static; inline;
      class procedure Returns3BucketsOutWhenGivenAnEmptyDataStreamAnd3NonDefaultBucketInOfT(); static; inline;
      class procedure Returns3BucketsOutWhenGivenASingleDefaultElementAsADataStreamAnd3DefaultBucketInOfT(); static; inline;
      class procedure Returns3BucketsOutWhenGivenASingleDefaultElementAsADataStreamAnd3NonDefaultBucketInOfT(); static; inline;
      class procedure Returns3BucketsOutWhenGivenASingleNonDefaultElementAsADataStreamAnd3DefaultBucketInOfT(); static; inline;
      class procedure Returns3BucketsOutWhenGivenASingleNonDefaultElementAsADataStreamAnd3NonDefaultBucketInOfT(); static; inline;
      class procedure Returns3BucketsOutWhenGivenAMultipleDefaultElementsAsADataStreamAnd3DefaultBucketInOfT(); static; inline;
      class procedure Returns3BucketsOutWhenGivenAMultipleDefaultElementsAsADataStreamAnd3NonDefaultBucketInOfT(); static; inline;
      class procedure Returns3BucketsOutWhenGivenAMultipleNonDefaultElementsAsADataStreamAnd3DefaultBucketInOfT(); static; inline;
      class procedure Returns3BucketsOutWhenGivenAMultipleNonDefaultElementsAsADataStreamAnd3NonDefaultBucketInOfT(); static; inline;
    public
      class procedure Exercise(); static; inline;
    end;
    OrderOfBucketsOutIsDeterminedByBucketsIn = record  //This container is intentially empty; order is already tested by the above test cases (i.e. implicit in their "Domains")
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

uses
  PE.Delphi.TypeIdentity,
  PE.Types.Foundational.Generics;

{ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>}
class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.Exercise;
begin
  EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.Exercise();
  NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Exercise();
  NamePropertyIsCopiedFromBucketInToBucketOut.Exercise();
  SignatureTests.Exercise();
end;

{ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.CasesWhichShouldArguablyBeRefactoredIntoTheExecSpec}
class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.CasesWhichShouldArguablyBeRefactoredIntoTheExecSpec.Exercise;
begin
  ABucketInWithoutAGrabbyArmAndBetweenTwoBucketsInWithGrabbyArmsDoesNotInfluenceTheBucketOutCounts();
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.CasesWhichShouldArguablyBeRefactoredIntoTheExecSpec.ABucketInWithoutAGrabbyArmAndBetweenTwoBucketsInWithGrabbyArmsDoesNotInfluenceTheBucketOutCounts;
begin
  var Elements: ArrayOf<TypeUnderTest> := [System.Default(TypeUnderTest), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>, System.Default(TypeUnderTest), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>, System.Default(TypeUnderTest)];
  var Actual := Routines.Categorize<TypeUnderTest>(Elements,
    [BucketIn<TypeUnderTest>.Create(function (const AValue: TypeUnderTest): Boolean begin Result := (System.Default(TypeUnderTest) = AValue); end, 'Defaults'),
     BucketIn<TypeUnderTest>.Create(nil, 'Dummy'),
     BucketIn<TypeUnderTest>.Create(function (const AValue: TypeUnderTest): Boolean begin Result := (not (System.Default(TypeUnderTest) = AValue)); end, 'Non-defaults')]);
  System.Assert(3 = System.Length(Actual));
  System.Assert('Defaults' = Actual[System.Low(Actual)].Name);
  System.Assert('Dummy' = Actual[System.Low(Actual) + 1].Name);
  System.Assert('Non-defaults' = Actual[System.Low(Actual) + 2].Name);
  System.Assert(3 = Actual[System.Low(Actual)].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 1].Count);
  System.Assert(2 = Actual[System.Low(Actual) + 2].Count);
end;

{ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn}
class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Exercise;
begin
  ReturnsZeroBucketsOutWhenGivenAnEmptyDataStreamAndZeroBucketsIn();
  ReturnsZeroBucketsOutWhenGivenASingleDefaultElementAsADataStreamAndZeroBucketsIn();
  ReturnsZeroBucketsOutWhenGivenASingleNonDefaultElementAsADataStreamAndZeroBucketsIn();
  ReturnsZeroBucketsOutWhenGivenMultipleDefaultElementAsADataStreamAndZeroBucketsIn();
  ReturnsZeroBucketsOutWhenGivenMultipleNonDefaultElementAsADataStreamAndZeroBucketsIn();
  Returns1BucketOutWhenGivenAnEmptyDataStreamAnd1DefaultBucketInOfT();
  Returns1BucketOutWhenGivenAnEmptyDataStreamAnd1NonDefaultBucketInOfT();
  Returns1BucketOutWhenGivenASingleDefaultElementAsADataStreamAnd1DefaultBucketInOfT();
  Returns1BucketOutWhenGivenASingleDefaultElementAsADataStreamAnd1NonDefaultBucketInOfT();
  Returns1BucketOutWhenGivenASingleNonDefaultElementAsADataStreamAnd1DefaultBucketInOfT();
  Returns1BucketOutWhenGivenASingleNonDefaultElementAsADataStreamAnd1NonDefaultBucketInOfT();
  Returns1BucketOutWhenGivenAMultipleDefaultElementsAsADataStreamAnd1DefaultBucketInOfT();
  Returns1BucketOutWhenGivenAMultipleDefaultElementsAsADataStreamAnd1NonDefaultBucketInOfT();
  Returns1BucketOutWhenGivenAMultipleNonDefaultElementsAsADataStreamAnd1DefaultBucketInOfT();
  Returns1BucketOutWhenGivenAMultipleNonDefaultElementsAsADataStreamAnd1NonDefaultBucketInOfT();
  Returns3BucketsOutWhenGivenAnEmptyDataStreamAnd3DefaultBucketInOfT();
  Returns3BucketsOutWhenGivenAnEmptyDataStreamAnd3NonDefaultBucketInOfT();
  Returns3BucketsOutWhenGivenASingleDefaultElementAsADataStreamAnd3DefaultBucketInOfT();
  Returns3BucketsOutWhenGivenASingleDefaultElementAsADataStreamAnd3NonDefaultBucketInOfT();
  Returns3BucketsOutWhenGivenASingleNonDefaultElementAsADataStreamAnd3DefaultBucketInOfT();
  Returns3BucketsOutWhenGivenASingleNonDefaultElementAsADataStreamAnd3NonDefaultBucketInOfT();
  Returns3BucketsOutWhenGivenAMultipleDefaultElementsAsADataStreamAnd3DefaultBucketInOfT();
  Returns3BucketsOutWhenGivenAMultipleDefaultElementsAsADataStreamAnd3NonDefaultBucketInOfT();
  Returns3BucketsOutWhenGivenAMultipleNonDefaultElementsAsADataStreamAnd3DefaultBucketInOfT();
  Returns3BucketsOutWhenGivenAMultipleNonDefaultElementsAsADataStreamAnd3NonDefaultBucketInOfT();
end;

class function ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.NonDefaultSmartClaw(const Value: TypeUnderTest): Boolean; begin Result := False; end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns1BucketOutWhenGivenAMultipleDefaultElementsAsADataStreamAnd1DefaultBucketInOfT;
begin
  System.Assert(1 = System.Length(Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)], [System.Default(BucketIn<TypeUnderTest>)])));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns1BucketOutWhenGivenAMultipleDefaultElementsAsADataStreamAnd1NonDefaultBucketInOfT;
begin
  var BucketsIn: ArrayOf<BucketIn<TypeUnderTest>> := [BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>)];
  System.Assert(1 = System.Length(BucketsIn));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn)]));
  System.Assert(1 = System.Length(Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)], BucketsIn)));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns1BucketOutWhenGivenAMultipleNonDefaultElementsAsADataStreamAnd1DefaultBucketInOfT;
begin
  var Elements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(3 = System.Length(Elements));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements)]));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements) + 1]));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements) + 2]));
  System.Assert(1 = System.Length(Routines.Categorize<TypeUnderTest>(Elements, [System.Default(BucketIn<TypeUnderTest>)])));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns1BucketOutWhenGivenAMultipleNonDefaultElementsAsADataStreamAnd1NonDefaultBucketInOfT;
begin
  var BucketsIn: ArrayOf<BucketIn<TypeUnderTest>> := [BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>)];
  System.Assert(1 = System.Length(BucketsIn));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn)]));
  var Elements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(3 = System.Length(Elements));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements)]));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements) + 1]));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements) + 2]));
  System.Assert(1 = System.Length(Routines.Categorize<TypeUnderTest>(Elements, BucketsIn)));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns1BucketOutWhenGivenAnEmptyDataStreamAnd1DefaultBucketInOfT;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([], [System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(1 = System.Length(Actual));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns1BucketOutWhenGivenAnEmptyDataStreamAnd1NonDefaultBucketInOfT;
begin
  var BucketsIn: ArrayOf<BucketIn<TypeUnderTest>> := [BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>)];
  System.Assert(1 = System.Length(BucketsIn));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn)]));
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([], BucketsIn);
  System.Assert(1 = System.Length(Actual));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns1BucketOutWhenGivenASingleDefaultElementAsADataStreamAnd1DefaultBucketInOfT;
begin
  System.Assert(1 = System.Length(Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest)], [System.Default(BucketIn<TypeUnderTest>)])));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns1BucketOutWhenGivenASingleDefaultElementAsADataStreamAnd1NonDefaultBucketInOfT;
begin
  var BucketsIn: ArrayOf<BucketIn<TypeUnderTest>> := [BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>)];
  System.Assert(1 = System.Length(BucketsIn));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn)]));
  System.Assert(1 = System.Length(Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest)], BucketsIn)));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns1BucketOutWhenGivenASingleNonDefaultElementAsADataStreamAnd1DefaultBucketInOfT;
begin
  var Elements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(1 = System.Length(Elements));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements)]));
  System.Assert(1 = System.Length(Routines.Categorize<TypeUnderTest>(Elements, [System.Default(BucketIn<TypeUnderTest>)])));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns1BucketOutWhenGivenASingleNonDefaultElementAsADataStreamAnd1NonDefaultBucketInOfT;
begin
  var BucketsIn: ArrayOf<BucketIn<TypeUnderTest>> := [BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>)];
  System.Assert(1 = System.Length(BucketsIn));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn)]));
  var Elements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(1 = System.Length(Elements));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements)]));
  System.Assert(1 = System.Length(Routines.Categorize<TypeUnderTest>(Elements, BucketsIn)));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns3BucketsOutWhenGivenAMultipleDefaultElementsAsADataStreamAnd3DefaultBucketInOfT;
begin
  System.Assert(3 = System.Length(Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)],
    [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)])));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns3BucketsOutWhenGivenAMultipleDefaultElementsAsADataStreamAnd3NonDefaultBucketInOfT;
begin
  var BucketsIn: ArrayOf<BucketIn<TypeUnderTest>> := [BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>),
    BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>),
    BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>)];
  System.Assert(3 = System.Length(BucketsIn));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn)]));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn) + 1]));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn) + 2]));
  System.Assert(3 = System.Length(Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)], BucketsIn)));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns3BucketsOutWhenGivenAMultipleNonDefaultElementsAsADataStreamAnd3DefaultBucketInOfT;
begin
  var Elements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(3 = System.Length(Elements));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements)]));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements) + 1]));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements) + 2]));
  System.Assert(3 = System.Length(Routines.Categorize<TypeUnderTest>(Elements, [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)])));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns3BucketsOutWhenGivenAMultipleNonDefaultElementsAsADataStreamAnd3NonDefaultBucketInOfT;
begin
  var BucketsIn: ArrayOf<BucketIn<TypeUnderTest>> := [BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>),
    BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>),
    BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>)];
  System.Assert(3 = System.Length(BucketsIn));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn)]));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn) + 1]));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn) + 2]));
  var Elements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(3 = System.Length(Elements));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements)]));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements) + 1]));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements) + 2]));
  System.Assert(3 = System.Length(Routines.Categorize<TypeUnderTest>(Elements, BucketsIn)));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns3BucketsOutWhenGivenAnEmptyDataStreamAnd3DefaultBucketInOfT;
begin
  System.Assert(3 = System.Length(Routines.Categorize<TypeUnderTest>([], [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)])));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns3BucketsOutWhenGivenAnEmptyDataStreamAnd3NonDefaultBucketInOfT;
begin
  var BucketsIn: ArrayOf<BucketIn<TypeUnderTest>> := [BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>),
    BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>),
    BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>)];
  System.Assert(3 = System.Length(BucketsIn));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn)]));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn) + 1]));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn) + 2]));
  System.Assert(3 = System.Length(Routines.Categorize<TypeUnderTest>([], BucketsIn)));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns3BucketsOutWhenGivenASingleDefaultElementAsADataStreamAnd3DefaultBucketInOfT;
begin
  System.Assert(3 = System.Length(Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest)], [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)])));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns3BucketsOutWhenGivenASingleDefaultElementAsADataStreamAnd3NonDefaultBucketInOfT;
begin
  var BucketsIn: ArrayOf<BucketIn<TypeUnderTest>> := [BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>),
    BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>),
    BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>)];
  System.Assert(3 = System.Length(BucketsIn));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn)]));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn) + 1]));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn) + 2]));
  System.Assert(3 = System.Length(Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest)], BucketsIn)));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns3BucketsOutWhenGivenASingleNonDefaultElementAsADataStreamAnd3DefaultBucketInOfT;
begin
  var Elements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(1 = System.Length(Elements));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements)]));
  System.Assert(3 = System.Length(Routines.Categorize<TypeUnderTest>(Elements, [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)])));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.Returns3BucketsOutWhenGivenASingleNonDefaultElementAsADataStreamAnd3NonDefaultBucketInOfT;
begin
  var BucketsIn: ArrayOf<BucketIn<TypeUnderTest>> := [BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>),
    BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>),
    BucketIn<TypeUnderTest>.Create(NonDefaultSmartClaw, Rando_TheUntrustworthy.NonDefaultValue<MultiChar>, Rando_TheUntrustworthy.NonDefaultValue<NaturalNumber>)];
  System.Assert(3 = System.Length(BucketsIn));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn)]));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn) + 1]));
  System.Assert(not (System.Default(BucketIn<TypeUnderTest>) = BucketsIn[System.Low(BucketsIn) + 2]));
  var Elements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(1 = System.Length(Elements));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements)]));
  System.Assert(3 = System.Length(Routines.Categorize<TypeUnderTest>(Elements, BucketsIn)));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.ReturnsZeroBucketsOutWhenGivenAnEmptyDataStreamAndZeroBucketsIn;
begin
  System.Assert(0 = System.Length(Routines.Categorize<TypeUnderTest>([], [])));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.ReturnsZeroBucketsOutWhenGivenASingleDefaultElementAsADataStreamAndZeroBucketsIn;
begin
  System.Assert(0 = System.Length(Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest)], [])));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.ReturnsZeroBucketsOutWhenGivenASingleNonDefaultElementAsADataStreamAndZeroBucketsIn;
begin
  var Elements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(1 = System.Length(Elements));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements)]));
  System.Assert(0 = System.Length(Routines.Categorize<TypeUnderTest>(Elements, [])));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.ReturnsZeroBucketsOutWhenGivenMultipleDefaultElementAsADataStreamAndZeroBucketsIn;
begin
  System.Assert(0 = System.Length(Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)], [])));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NumberOfBucketsOutIsDeterminedByTheNumberOfBucketsIn.ReturnsZeroBucketsOutWhenGivenMultipleNonDefaultElementAsADataStreamAndZeroBucketsIn;
begin
  var Elements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(3 = System.Length(Elements));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements)]));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements) + 1]));
  System.Assert(not (System.Default(TypeUnderTest) = Elements[System.Low(Elements) + 2]));
  System.Assert(0 = System.Length(Routines.Categorize<TypeUnderTest>(Elements, [])));
end;

{ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues}
class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIs1WhenGivenASingleDefaultElementOfTAsADataStreamAndAMultipleDefaultBucketsInSaveADefaultFocusedGrabbyArm;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest)],
    [BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm), BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm), BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(1 = Actual[System.Low(Actual)].Count);
  System.Assert(1 = Actual[System.Low(Actual) + 1].Count);
  System.Assert(1 = Actual[System.Low(Actual) + 2].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIs1WhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketSaveADefaultFocusedGrabbyArm();
begin
  System.Assert(1 = Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest)], [BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm)])[0].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIs1WhenGivenASingleNonDefaultElementOfTAsADataStreamAndASingleDefaultBucketSaveANonDefaultFocusedGrabbyArm;
begin
  var Element: TypeUnderTest := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>();
  System.Assert(not (Element = System.Default(TypeUnderTest)));
  System.Assert(1 = Routines.Categorize<TypeUnderTest>([Element], [BucketIn<TypeUnderTest>.Create(function (const Value: TypeUnderTest): Boolean begin Result := (Value = Element) end)])[0].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIs1WhenGivenASingleNonDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsInSaveANonDefaultFocusedGrabbyArm;
begin
  var Element: TypeUnderTest := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>();
  var FocusedArm: SmartClaw<TypeUnderTest> := function (const Value: TypeUnderTest): Boolean begin Result := (Value = Element) end;
  System.Assert(not (Element = System.Default(TypeUnderTest)));
  var Actual := Routines.Categorize<TypeUnderTest>([Element], [BucketIn<TypeUnderTest>.Create(FocusedArm), BucketIn<TypeUnderTest>.Create(FocusedArm), BucketIn<TypeUnderTest>.Create(FocusedArm)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(1 = Actual[System.Low(Actual)].Count);
  System.Assert(1 = Actual[System.Low(Actual) + 1].Count);
  System.Assert(1 = Actual[System.Low(Actual) + 2].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIs3WhenGivenMultipleDefaultElementsOfTAsADataStreamAndASingleDefaultBucketSaveADefaultFocusedGrabbyArm;
begin
  var Actual := Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)], [BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm)]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(3 = Actual[System.Low(Actual)].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIs3WhenGivenMultipleDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsInSaveADefaultFocusedGrabbyArm;
begin
  var Actual := Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)],
    [BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm), BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm), BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(3 = Actual[System.Low(Actual)].Count);
  System.Assert(3 = Actual[System.Low(Actual) + 1].Count);
  System.Assert(3 = Actual[System.Low(Actual) + 2].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIs3WhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsInSaveANonDefaultFocusedGrabbyArm();
begin
  var Element: TypeUnderTest := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>();
  var FocusedArm: SmartClaw<TypeUnderTest> := function (const Value: TypeUnderTest): Boolean begin Result := (Value = Element) end;
  System.Assert(not (Element = System.Default(TypeUnderTest)));
  var Actual := Routines.Categorize<TypeUnderTest>([Element, Element, Element], [BucketIn<TypeUnderTest>.Create(FocusedArm), BucketIn<TypeUnderTest>.Create(FocusedArm), BucketIn<TypeUnderTest>.Create(FocusedArm)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(3 = Actual[System.Low(Actual)].Count);
  System.Assert(3 = Actual[System.Low(Actual) + 1].Count);
  System.Assert(3 = Actual[System.Low(Actual) + 2].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIs3WhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndASingleDefaultBucketSaveANonDefaultFocusedGrabbyArm;
begin
  var Element: TypeUnderTest := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>();
  System.Assert(not (Element = System.Default(TypeUnderTest)));
  var Actual := Routines.Categorize<TypeUnderTest>([Element, Element, Element], [BucketIn<TypeUnderTest>.Create(function (const Value: TypeUnderTest): Boolean begin Result := Value = Element; end)]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(3 = Actual[System.Low(Actual)].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn;
begin
  System.Assert(0 = Routines.Categorize<TypeUnderTest>([], [System.Default(BucketIn<TypeUnderTest>)])[0].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketInSaveADefaultFocusedGrabbyArm;
begin
  System.Assert(0 = Routines.Categorize<TypeUnderTest>([], [BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm)])[0].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsIn;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([], [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(0 = Actual[System.Low(Actual)].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 1].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 2].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsInSaveADefaultFocusedGrabbyArm;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([],
    [BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm), BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm), BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(0 = Actual[System.Low(Actual)].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 1].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 2].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketIn;
begin
  System.Assert(0 = Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest)], [System.Default(BucketIn<TypeUnderTest>)])[0].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsIn;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest)], [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(0 = Actual[System.Low(Actual)].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 1].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 2].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenASingleNonDefaultElementOfTAsADataStreamAndASingleDefaultBucketIn;
begin
  var Element: TypeUnderTest := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>();
  System.Assert(not (Element = System.Default(TypeUnderTest)));
  System.Assert(0 = Routines.Categorize<TypeUnderTest>([Element], [BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>))])[0].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenASingleNonDefaultElementOfTAsADataStreamAndASingleDefaultBucketInSaveADefaultFocusedGrabbyArm;
begin
  var Element: TypeUnderTest := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>();
  System.Assert(not (Element = System.Default(TypeUnderTest)));
  System.Assert(0 = Routines.Categorize<TypeUnderTest>([Element], [BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm)])[0].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenASingleNonDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsIn;
begin
  var Element: TypeUnderTest := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>();
  System.Assert(not (Element = System.Default(TypeUnderTest)));
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([Element],
    [BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>)),
    BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>)),
    BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>))]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(0 = Actual[System.Low(Actual)].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 1].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 2].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenASingleNonDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsInSaveADefaultFocusedGrabbyArm;
begin
  var Element: TypeUnderTest := Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>();
  System.Assert(not (Element = System.Default(TypeUnderTest)));
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([Element],
    [BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm),
    BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm),
    BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(0 = Actual[System.Low(Actual)].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 1].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 2].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndASingleDefaultBucketIn;
begin
  System.Assert(0 = Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)], [System.Default(BucketIn<TypeUnderTest>)])[0].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsIn;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)],
    [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(0 = Actual[System.Low(Actual)].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 1].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 2].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndASingleDefaultBucketIn;
begin
  var Elements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(3 = System.Length(Elements));
  for var Each: TypeUnderTest in Elements do
    System.Assert(not (Each = System.Default(TypeUnderTest)));
  System.Assert(0 = Routines.Categorize<TypeUnderTest>(Elements, [BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>))])[0].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndASingleDefaultBucketInSaveADefaultFocusedGrabbyArm;
begin
  var Elements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(3 = System.Length(Elements));
  for var Each: TypeUnderTest in Elements do
    System.Assert(not (Each = System.Default(TypeUnderTest)));
  System.Assert(0 = Routines.Categorize<TypeUnderTest>(Elements, [BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm)])[0].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsIn;
begin
  var Elements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(3 = System.Length(Elements));
  for var Each: TypeUnderTest in Elements do
    System.Assert(not (Each = System.Default(TypeUnderTest)));
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>(Elements, [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(0 = Actual[System.Low(Actual)].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 1].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 2].Count);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.TheBucketOutCountIsZeroWhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsInSaveADefaultFocusedGrabbyArm;
begin
  var Elements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(3 = System.Length(Elements));
  for var Each: TypeUnderTest in Elements do
    System.Assert(not (Each = System.Default(TypeUnderTest)));
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>(Elements,
    [BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm), BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm), BucketIn<TypeUnderTest>.Create(DefaultFocusedGrabbyArm)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(0 = Actual[System.Low(Actual)].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 1].Count);
  System.Assert(0 = Actual[System.Low(Actual) + 2].Count);
end;

class constructor ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.Create;
begin
  System.Assert(DefaultFocusedGrabbyArm(System.Default(TypeUnderTest)));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.Exercise;
begin
  CasesWhichShouldArguablyBeRefactoredIntoTheExecSpec.Exercise();
  TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn();
  TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndASingleDefaultBucketInSaveADefaultFocusedGrabbyArm();
  TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsIn();
  TheBucketOutCountIsZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketIn();
  TheBucketOutCountIsZeroWhenGivenASingleDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsIn();
  TheBucketOutCountIsZeroWhenGivenAnEmptyDataStreamAndMultipleDefaultBucketsInSaveADefaultFocusedGrabbyArm();
  TheBucketOutCountIsZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndASingleDefaultBucketIn();
  TheBucketOutCountIsZeroWhenGivenMultipleDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsIn();
  TheBucketOutCountIsZeroWhenGivenASingleNonDefaultElementOfTAsADataStreamAndASingleDefaultBucketIn();
  TheBucketOutCountIsZeroWhenGivenASingleNonDefaultElementOfTAsADataStreamAndASingleDefaultBucketInSaveADefaultFocusedGrabbyArm();
  TheBucketOutCountIsZeroWhenGivenASingleNonDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsIn();
  TheBucketOutCountIsZeroWhenGivenASingleNonDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsInSaveADefaultFocusedGrabbyArm();
  TheBucketOutCountIsZeroWhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsIn();
  TheBucketOutCountIsZeroWhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsInSaveADefaultFocusedGrabbyArm();
  TheBucketOutCountIsZeroWhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndASingleDefaultBucketIn();
  TheBucketOutCountIsZeroWhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndASingleDefaultBucketInSaveADefaultFocusedGrabbyArm();
  TheBucketOutCountIs1WhenGivenASingleDefaultElementOfTAsADataStreamAndASingleDefaultBucketSaveADefaultFocusedGrabbyArm();
  TheBucketOutCountIs1WhenGivenASingleDefaultElementOfTAsADataStreamAndAMultipleDefaultBucketsInSaveADefaultFocusedGrabbyArm();
  TheBucketOutCountIs1WhenGivenASingleNonDefaultElementOfTAsADataStreamAndASingleDefaultBucketSaveANonDefaultFocusedGrabbyArm();
  TheBucketOutCountIs1WhenGivenASingleNonDefaultElementOfTAsADataStreamAndMultipleDefaultBucketsInSaveANonDefaultFocusedGrabbyArm();
  TheBucketOutCountIs3WhenGivenMultipleDefaultElementsOfTAsADataStreamAndASingleDefaultBucketSaveADefaultFocusedGrabbyArm();
  TheBucketOutCountIs3WhenGivenMultipleDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsInSaveADefaultFocusedGrabbyArm();
  TheBucketOutCountIs3WhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndASingleDefaultBucketSaveANonDefaultFocusedGrabbyArm();
  TheBucketOutCountIs3WhenGivenMultipleNonDefaultElementsOfTAsADataStreamAndMultipleDefaultBucketsInSaveANonDefaultFocusedGrabbyArm();
end;

class function ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.EachBucketOutCountIsDeterminedByTheAssociatedBucketInGrabbyArmAndTheDataStreamValues.DefaultFocusedGrabbyArm(const Value: TypeUnderTest): Boolean;
begin Result := (Value = System.Default(TypeUnderTest)); end;

{ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut}
class constructor ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.Create;
begin
  System.Assert(not (NonDefaultMonoChar = NonDefaultMonoChar2));
  System.Assert(not (NonDefaultMonoChar = NonDefaultMonoChar3));
  System.Assert(not (NonDefaultMonoChar2 = NonDefaultMonoChar3));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.Exercise;
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
  WhenGivenMultipleNonDefaultTElementsAsADataStreamAndASingleDefaultBucketIn();
  WhenGivenMultipleNonDefaultTElementsAsADataStreamAndASingleNonDefaultNameDefaultBucketIn();
  WhenGivenMultipleNonDefaultTElementsAsADataStreamAndMultipleDefaultBucketInElements();
  WhenGivenMultipleNonDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames();
  WhenGivenMultipleNonDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames();
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn;
begin
  System.Assert(System.Default(BucketIn<TypeUnderTest>).Name = Routines.Categorize<TypeUnderTest>([], [System.Default(BucketIn<TypeUnderTest>)])[0].Name);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenAnEmptyDataStreamAndASingleNonDefaultNameDefaultBucketIn;
begin
  System.Assert(NonDefaultMonoChar = Routines.Categorize<TypeUnderTest>([], [BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar)])[0].Name);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenAnEmptyDataStreamAndMultipleDefaultBucketInElements;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([], [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(3 = System.Length(Actual));
  for var Each: BucketOut in Actual do
    System.Assert(System.Default(BucketIn<TypeUnderTest>).Name = Each.Name);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([], [BucketIn<TypeUnderTest>.Create(nil,  NonDefaultMonoChar), BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar), BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar)]);
  System.Assert(3 = System.Length(Actual));
  for var Each: BucketOut in Actual do
    System.Assert(NonDefaultMonoChar = Each.Name);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>([], [BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar), BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar2), BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar3)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(NonDefaultMonoChar = Actual[Low(Actual)].Name);
  System.Assert(NonDefaultMonoChar2 = Actual[Low(Actual) + 1].Name);
  System.Assert(NonDefaultMonoChar3 = Actual[Low(Actual) + 2].Name);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleDefaultBucketIn;
begin
  System.Assert(System.Default(BucketIn<TypeUnderTest>).Name = Routines.Categorize<TypeUnderTest>(
    [System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)], [System.Default(BucketIn<TypeUnderTest>)])[0].Name);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleNonDefaultNameDefaultBucketIn;
begin
  System.Assert(NonDefaultMonoChar = Routines.Categorize<TypeUnderTest>([System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)], [BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar)])[0].Name);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleDefaultBucketInElements;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>(
    [System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)],
    [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(3 = System.Length(Actual));
  for var Each: BucketOut in Actual do
    System.Assert(System.Default(BucketIn<T>).Name = Each.Name);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>(
    [System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)],
    [BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar), BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar), BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar)]);
  System.Assert(3 = System.Length(Actual));
  for var Each: BucketOut in Actual do
    System.Assert('a' = Each.Name);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames;
begin
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>(
    [System.Default(TypeUnderTest), System.Default(TypeUnderTest), System.Default(TypeUnderTest)],
    [BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar), BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar2), BucketIn<TypeUnderTest>.Create(nil, NonDefaultMonoChar3)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(NonDefaultMonoChar = Actual[Low(Actual)].Name);
  System.Assert(NonDefaultMonoChar2 = Actual[Low(Actual) + 1].Name);
  System.Assert(NonDefaultMonoChar3 = Actual[Low(Actual) + 2].Name);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenMultipleNonDefaultTElementsAsADataStreamAndASingleDefaultBucketIn;
begin
  var NonDefaultElements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(3 = System.Length(NonDefaultElements));
  System.Assert(not (System.Default(TypeUnderTest) = NonDefaultElements[System.Low(NonDefaultElements)]));
  System.Assert(not (System.Default(TypeUnderTest) = NonDefaultElements[System.Low(NonDefaultElements) + 1]));
  System.Assert(not (System.Default(TypeUnderTest) = NonDefaultElements[System.Low(NonDefaultElements) + 2]));
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>(NonDefaultElements, [System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(System.Default(MultiChar) = Actual[System.Low(Actual)].Name);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenMultipleNonDefaultTElementsAsADataStreamAndASingleNonDefaultNameDefaultBucketIn;
begin
  var Expected: MultiChar := Rando_TheUntrustworthy.NonDefaultValue<MultiChar>();
  System.Assert(not (System.Default(MultiChar) = Expected));
  var NonDefaultElements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(3 = System.Length(NonDefaultElements));
  System.Assert(not (System.Default(TypeUnderTest) = NonDefaultElements[System.Low(NonDefaultElements)]));
  System.Assert(not (System.Default(TypeUnderTest) = NonDefaultElements[System.Low(NonDefaultElements) + 1]));
  System.Assert(not (System.Default(TypeUnderTest) = NonDefaultElements[System.Low(NonDefaultElements) + 2]));
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>(NonDefaultElements, [BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), Expected)]);
  System.Assert(1 = System.Length(Actual));
  System.Assert(Expected = Actual[System.Low(Actual)].Name);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenMultipleNonDefaultTElementsAsADataStreamAndMultipleDefaultBucketInElements;
begin
  var NonDefaultElements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(3 = System.Length(NonDefaultElements));
  System.Assert(not (System.Default(TypeUnderTest) = NonDefaultElements[System.Low(NonDefaultElements)]));
  System.Assert(not (System.Default(TypeUnderTest) = NonDefaultElements[System.Low(NonDefaultElements) + 1]));
  System.Assert(not (System.Default(TypeUnderTest) = NonDefaultElements[System.Low(NonDefaultElements) + 2]));
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>(NonDefaultElements, [System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>), System.Default(BucketIn<TypeUnderTest>)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(System.Default(MultiChar) = Actual[System.Low(Actual)].Name);
  System.Assert(System.Default(MultiChar) = Actual[System.Low(Actual) + 1].Name);
  System.Assert(System.Default(MultiChar) = Actual[System.Low(Actual) + 2].Name);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenMultipleNonDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames;
begin
  var Expected: MultiChar := Rando_TheUntrustworthy.NonDefaultValue<MultiChar>();
  System.Assert(not (System.Default(MultiChar) = Expected));
  var NonDefaultElements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(3 = System.Length(NonDefaultElements));
  System.Assert(not (System.Default(TypeUnderTest) = NonDefaultElements[System.Low(NonDefaultElements)]));
  System.Assert(not (System.Default(TypeUnderTest) = NonDefaultElements[System.Low(NonDefaultElements) + 1]));
  System.Assert(not (System.Default(TypeUnderTest) = NonDefaultElements[System.Low(NonDefaultElements) + 2]));
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>(NonDefaultElements,
    [BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), Expected), BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), Expected), BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), Expected)]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(Expected = Actual[System.Low(Actual)].Name);
  System.Assert(Expected = Actual[System.Low(Actual) + 1].Name);
  System.Assert(Expected = Actual[System.Low(Actual) + 2].Name);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.NamePropertyIsCopiedFromBucketInToBucketOut.WhenGivenMultipleNonDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames;
begin
  var Expected: ArrayOf<MultiChar> := [NonDefaultMonoChar, NonDefaultMonoChar2, NonDefaultMonoChar3];
  System.Assert(3 = System.Length(Expected));
  System.Assert(not (System.Default(MultiChar) = Expected[System.Low(Expected)]));
  System.Assert(not (System.Default(MultiChar) = Expected[System.Low(Expected) + 1]));
  System.Assert(not (System.Default(MultiChar) = Expected[System.Low(Expected) + 2]));
  System.Assert(not (Expected[System.Low(Expected)] = Expected[System.Low(Expected) + 1]));
  System.Assert(not (Expected[System.Low(Expected)] = Expected[System.Low(Expected) + 2]));
  System.Assert(not (Expected[System.Low(Expected) + 1] = Expected[System.Low(Expected) + 2]));
  var NonDefaultElements: ArrayOf<TypeUnderTest> := [Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>(), Rando_TheUntrustworthy.NonDefaultValue<TypeUnderTest>()];
  System.Assert(3 = System.Length(NonDefaultElements));
  System.Assert(not (System.Default(TypeUnderTest) = NonDefaultElements[System.Low(NonDefaultElements)]));
  System.Assert(not (System.Default(TypeUnderTest) = NonDefaultElements[System.Low(NonDefaultElements) + 1]));
  System.Assert(not (System.Default(TypeUnderTest) = NonDefaultElements[System.Low(NonDefaultElements) + 2]));
  var Actual: ArrayOf<BucketOut> := Routines.Categorize<TypeUnderTest>(NonDefaultElements,
    [BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), Expected[System.Low(Expected)]),
     BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), Expected[System.Low(Expected) + 1]),
     BucketIn<TypeUnderTest>.Create(System.Default(SmartClaw<TypeUnderTest>), Expected[System.Low(Expected) + 2])]);
  System.Assert(3 = System.Length(Actual));
  System.Assert(Expected[System.Low(Expected)] = Actual[System.Low(Actual)].Name);
  System.Assert(Expected[System.Low(Expected) + 1] = Actual[System.Low(Actual) + 1].Name);
  System.Assert(Expected[System.Low(Expected) + 2] = Actual[System.Low(Actual) + 2].Name);
end;

{ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.SignatureTests}
class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.SignatureTests.Exercise;
begin
  The1stParameterAcceptsAnEmptyArrayOfT();
  The2ndParameterAcceptsAnEmptyArrayOfBucketInOfT();
  ReturnsAnEmptyArrayOfBucketOut();
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.SignatureTests.ReturnsAnEmptyArrayOfBucketOut;
begin
  System.Assert(ArrayOf<BucketOut>.Create() = Routines.Categorize<TypeUnderTest>(ArrayOf<TypeUnderTest>.Create(), ArrayOf<BucketIn<TypeUnderTest>>.Create()));
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.SignatureTests.The1stParameterAcceptsAnEmptyArrayOfT;
begin
  Routines.Categorize<TypeUnderTest>(ArrayOf<TypeUnderTest>.Create(), []);
end;

class procedure ExecutableSpeficiation_CategorizeRoutine<TypeUnderTest>.SignatureTests.The2ndParameterAcceptsAnEmptyArrayOfBucketInOfT;
begin
  Routines.Categorize<TypeUnderTest>([], ArrayOf<BucketIn<TypeUnderTest>>.Create());
end;

end.

