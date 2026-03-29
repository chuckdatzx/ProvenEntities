unit PE.TypeTests.Buckets;
{Related materials:
- https://en.wikipedia.org/wiki/Parametric_polymorphism
}
{Chuck C.T.
Full Declaration of Transparency:
You should only consider this code proven insofar as you agree with everything presented
(and by "everything presented", I mean from the scope of the compiler all the way through to
your custom code based on whatever I've presented here).
At this exact point in time, I consider the following to be proof enough for me. But, that is still obviously just my opinion.

That being said, I've worked reasonably hard to cover everything I could possiblly come up with. The problem
is that I'm just one human; I can only forecast so much. If you have any suggestions for improving the overall
coverage of this domain, please feel free to let me know. It takes a village; and all that.
Fair warning; I very much welcome critique of this code, but I'm likely going to argue from the perspective of:
Just because you CAN break it, that does not necessarily mean that it, in and of itself, is broken. To put it
into other terms, showing that a thing can be misused doesn't necessarily mean said thing is inherently in need
of fixing.

Oh yeah... I almost forgot. If you are well-versed in unit testing, then the following is likely not the flavor
of "unit testing" you're used to. Not being sure what to call them, I'm calling them "type tests" for the time being.
Which I hope serves as a reminder that while type tests may "feel" like unit tests, the goal of the these
unit tests is to prove out the types and domains themselves.
}
interface

uses
  {Assertions}
  PE.TypeTests.Delphi.AssignmentCompatibility.GenericRecords.Proven.AtCompileTime,
  PE.TypeTests.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime,
  PE.TypeTests.Delphi.TypeIdentity.Proven.AtCompileTime,
  {Domain Under Test}
  PE.Buckets;

{$IF IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime and
 IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime}

{If ANY of the following is compiling, compile-time checks should have established the following are true:
  - Identically defined generic records are type identical according to System.TypeInfo() at compile-time
  - Identically defined generic records are symmetrically assignment compatible at compile-time

If said compile-time checks are True, and then considering the tests below,
I am claiming the following types are proven for any compilable generic type T:
  - BucketIn<T>
  - BucketTally
  - GrabbyArmBrains<T>
 }

type
  SUT_TYPES<T> = record
  public type
    Actual = record
    type
      BucketIn_Closed = BucketIn<T>;
      E_BucketTally = BucketTally;
      GrabbyArmBrains_Closed = GrabbyArmBrains<T>;
    end;
  public
    class var ActualBucketTally: Actual.E_BucketTally;
    class var ActualGrabbyArmBrains: Actual.GrabbyArmBrains_Closed;
    class var ActualBucketIn: Actual.BucketIn_Closed;
  public
    class var ExpectedBucketTally: Actual.E_BucketTally;
    class var ExpectedGrabbyArmBrains: Actual.GrabbyArmBrains_Closed;
    class var ExpectedBucketIn: BucketIn<T>;
  public
    class var ExpectedCardinal: Cardinal;
  public
    class function ExerciseBucketDomain(): Boolean; static; inline;
  end;

type
  BucketIn_TypeTests<T> = record {Type ID and symmetric assignment compatibility tests are ignored; should have been handled by compiler flags}
  private {Domain Boundaries}
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheBucketTallyType(); static; inline;
    class procedure ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheGrabbyArmBrainsType(); static; inline;
  end;

  BucketTally_TypeTests = record
  private {Domain Boundaries}
    class procedure DefaultValueIsZero(); static; inline;
    class procedure MinimumValueIsZero(); static; inline;
    class procedure MaximumValueIs4294967295(); static; inline; //4,294,967,295
  private {Type Identity/Symmetric Assignment Compatibility}
    class procedure IsTypeIdenticalToCardinal(); static; inline;
    class procedure SharesSymmetricAssignmentCompatibilityWithCardinal(); static; inline;
  end;

  GrabbyArmBrains_TypeTests<T> = record
  private {Domain Boundaries}
    class procedure IsAssigmentCompatibleWithAnAnonymousMethodComprisedOfASingleImmutableValueOfTAndReturningABooleanType(); static; inline;
    class procedure IsSymmetricallyAssigmentCompatibleWithAProceduralTypeHavingASingleImmutableValueOfTAndReturningABooleanType(); static; inline;
  private {Type Identity/Symmetric Assignment Compatibility}
    class procedure TheProvidedTIsTypeIdenticalToTheSUT_Type(); static; inline;
    class procedure ReturnsTrueWhenComprisedSolelyOfSourceCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT(); static; inline;
  end;

{$ENDIF}

implementation

{$IF IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime and
 IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime}

{ BucketIn_TypeTests<T> :: Type Tests }
class procedure BucketIn_TypeTests<T>.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheGrabbyArmBrainsType();
begin
  Assert(System.TypeInfo(BucketTally) = System.TypeInfo(SUT_TYPES<T>.Actual.E_BucketTally));
  SUT_TYPES<T>.ExpectedBucketIn.GrabbyArm := SUT_TYPES<T>.ActualBucketIn.GrabbyArm;
  SUT_TYPES<T>.ActualBucketIn.GrabbyArm := SUT_TYPES<T>.ExpectedBucketIn.GrabbyArm;
end;

class procedure BucketIn_TypeTests<T>.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheBucketTallyType();
begin
  Assert(System.TypeInfo(BucketTally) = System.TypeInfo(SUT_TYPES<T>.Actual.E_BucketTally));
  SUT_TYPES<T>.ExpectedBucketIn.Prediction := SUT_TYPES<T>.ActualBucketIn.Prediction;
  SUT_TYPES<T>.ActualBucketIn.Prediction := SUT_TYPES<T>.ExpectedBucketIn.Prediction;
end;

{ BucketTally_TypeTests :: Tests }
class procedure BucketTally_TypeTests.DefaultValueIsZero();
begin
  Assert(0 = Default(SUT_TYPES<T>.Actual.E_BucketTally));
end;

class procedure BucketTally_TypeTests.IsTypeIdenticalToCardinal();
begin
  Assert(System.TypeInfo(Cardinal) = System.TypeInfo(SUT_TYPES<T>.Actual.E_BucketTally));
end;

class procedure BucketTally_TypeTests.MaximumValueIs4294967295();
begin
  Assert(High(Cardinal) = High(SUT_TYPES<T>.Actual.E_BucketTally));
end;

class procedure BucketTally_TypeTests.MinimumValueIsZero();
begin
  Assert(Low(Cardinal) = Low(SUT_TYPES<T>.Actual.E_BucketTally));
end;

class procedure BucketTally_TypeTests.SharesSymmetricAssignmentCompatibilityWithCardinal();
begin
  SUT_TYPES<T>.ActualBucketTally := SUT_TYPES<T>.ExpectedCardinal;
  SUT_TYPES<T>.ExpectedCardinal := SUT_TYPES<T>.ActualBucketTally;
end;

{ GrabbyArmBrains_TypeTests :: Type Tests }
class procedure GrabbyArmBrains_TypeTests<T>.TheProvidedTIsTypeIdenticalToTheSUT_Type();
begin
  System.Assert(System.TypeInfo(GrabbyArmBrains<T>) = System.TypeInfo(SUT_TYPES<T>.Actual.GrabbyArmBrains_Closed));
end;

class procedure GrabbyArmBrains_TypeTests<T>.IsSymmetricallyAssigmentCompatibleWithAProceduralTypeHavingASingleImmutableValueOfTAndReturningABooleanType();
begin
  SUT_TYPES<T>.ExpectedGrabbyArmBrains := SUT_TYPES<T>.ActualGrabbyArmBrains;
  SUT_TYPES<T>.ActualGrabbyArmBrains := SUT_TYPES<T>.ExpectedGrabbyArmBrains;
end;

class procedure GrabbyArmBrains_TypeTests<T>.IsAssigmentCompatibleWithAnAnonymousMethodComprisedOfASingleImmutableValueOfTAndReturningABooleanType();
{ TODO -oChuck -cToDo : Is it even possible to take an anonymous method, given that it will be an interface instance at runtime, and prove out its usage at compile-time? }
begin
  SUT_TYPES<T>.ExpectedGrabbyArmBrains := function (const AValue: T): Boolean begin Result := False end;
  SUT_TYPES<T>.ActualGrabbyArmBrains := function (const AValue: T): Boolean begin Result := False end;
end;

class procedure GrabbyArmBrains_TypeTests<T>.ReturnsTrueWhenComprisedSolelyOfSourceCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT();
var
{ TODO -oChuck -cToDo : You can shrink this further. Just need to get to it. }
  ActualValue: Boolean;
  Actual: GrabbyArmBrains<T>;
begin
  ActualValue := False;
  Assert(not ActualValue);
  Actual := function (const AValue: T): Boolean begin Result := (AValue = Default(T)) end;
  Assert(Assigned(Actual));
  Assert(Actual(Default(T)));
end;

class function SUT_TYPES<T>.ExerciseBucketDomain(): Boolean;
begin
  BucketTally_TypeTests.DefaultValueIsZero();
  BucketTally_TypeTests.MinimumValueIsZero();
  BucketTally_TypeTests.MaximumValueIs4294967295();
  BucketTally_TypeTests.IsTypeIdenticalToCardinal();
  BucketTally_TypeTests.SharesSymmetricAssignmentCompatibilityWithCardinal();
  BucketIn_TypeTests<T>.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheBucketTallyType();
  BucketIn_TypeTests<T>.ContainsASinglePropertyWhichIsTypeIdenticalAndSymmetricallyAssignmentCompatibleWithTheGrabbyArmBrainsType();
  GrabbyArmBrains_TypeTests<T>.TheProvidedTIsTypeIdenticalToTheSUT_Type();
  GrabbyArmBrains_TypeTests<T>.IsAssigmentCompatibleWithAnAnonymousMethodComprisedOfASingleImmutableValueOfTAndReturningABooleanType();
  GrabbyArmBrains_TypeTests<T>.IsSymmetricallyAssigmentCompatibleWithAProceduralTypeHavingASingleImmutableValueOfTAndReturningABooleanType();
  GrabbyArmBrains_TypeTests<T>.ReturnsTrueWhenComprisedSolelyOfSourceCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT();
  Result := True;
end;

{$IFEND}

end.
