unit PE.TypeTests.Buckets;
{Chuck C.T.
Full Declaration of Transparency:
You should only consider this code proven insofar as you agree with everything presented
(and yes, by "everything presented", I mean from the scope of the compiler all the way through to
your custom code based on whatever I've presented here).
At this exact point in time, I consider the following to be proof enough for me. But, that is still obviously just my opinion.

Related materials:
- https://en.wikipedia.org/wiki/Parametric_polymorphism


That being said, I've worked reasonably hard to cover everything I could possiblly come up with. The problem
is that I'm just one human; I can only forecast so much. If you have any suggestions for improving the overall
coverage of this domain, please feel free to let me know. It takes a village; and all that.
Fair warning; I very much welcome critique of this code, but I'm likely going to argue from the perspective of:
Just because you CAN break it, that does not necessarily mean that it, in and of itself, is broken. To put it
into other terms, showing that a thing can be misused doesn't necessarily mean said thing is inherently in need
of fixing.

Oh yeah... I almost forgot. If you are well-versed in unit testing, then the following is likely not the "flavor"
of "unit testing" you're used to. Not being sure what to call them, I'm calling them "type tests" for the time being.
Which I hope serves as a reminder that while type tests may "feel" like unit tests, the goal of the these
"unit tests" are to prove out the type itself (so every use of said type(s) will be valid).
}
interface

uses
  {PE Type Tests}
  PE.TypeTests.Delphi.AssignmentCompatibility.GenericRecords.Proven.AtCompileTime,
  PE.TypeTests.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime,
  {Proven Entities}
  PE.Buckets;

{$IF IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime and
 IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime}

{If ANY of the following is compiling, compile-time checks should have established the following are true:
 - Identically defined generic records are type identical according to System.TypeInfo() at compile-time
 - Identically defined generic records are symmetrically assignment compatible at compile-time

If said compile-time checks are True, I am claiming the following types are proven for any compilable generic type T:
 - GrabbyArmBrains<T>
 }

type
  GrabbyArmBrains_TypeTests<T> = class
  strict private type
    SUT_TYPE = GrabbyArmBrains<T>;
  strict private
    class procedure TheProvidedTIsTypeIdenticalToTheSUT_Type();
    class procedure IsAssigmentCompatibleWithAnAnonymousMethodComprisedOfASingleImmutableValueOfTAndReturningABooleanType(); static; inline;
    class procedure IsSymmetricallyAssigmentCompatibleWithAProceduralTypeHavingASingleImmutableValueOfTAndReturningABooleanType(); static; inline;
    class procedure ReturnsTrueWhenComprisedSolelyOfSourceCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT(); static; inline;
  public
    class procedure Invoke();
  end;

{$ENDIF}

implementation

{$IF IdenticallyDefinedGenericRecordsAreTypeIdenticalAccordingToSystemDotTypeInfoAtCompileTime and
 IdenticallyDefinedGenericRecordsAreSymmetricallyAssignmentCompatibleAtCompileTime}

{ GrabbyArmBrains_TypeTests :: Entry Point }
class procedure GrabbyArmBrains_TypeTests<T>.Invoke();
begin
  IsAssigmentCompatibleWithAnAnonymousMethodComprisedOfASingleImmutableValueOfTAndReturningABooleanType();
  IsSymmetricallyAssigmentCompatibleWithAProceduralTypeHavingASingleImmutableValueOfTAndReturningABooleanType();
  ReturnsTrueWhenComprisedSolelyOfSourceCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT();
end;

{ GrabbyArmBrains_TypeTests :: Type Tests }
class procedure GrabbyArmBrains_TypeTests<T>.TheProvidedTIsTypeIdenticalToTheSUT_Type();
begin
  System.Assert(System.TypeInfo(SUT_TYPE) = System.TypeInfo(GrabbyArmBrains<T>));
end;

class procedure GrabbyArmBrains_TypeTests<T>.IsSymmetricallyAssigmentCompatibleWithAProceduralTypeHavingASingleImmutableValueOfTAndReturningABooleanType();
var
  ExpectedVar: GrabbyArmBrains<T>;
  ActualVar: SUT_TYPE;
begin
  ExpectedVar := ActualVar;
  ActualVar := ExpectedVar;
end;

class procedure GrabbyArmBrains_TypeTests<T>.IsAssigmentCompatibleWithAnAnonymousMethodComprisedOfASingleImmutableValueOfTAndReturningABooleanType();
var
  ExpectedVar: GrabbyArmBrains<T>;
begin
  ExpectedVar := function (const AValue: T): Boolean begin Result := False end;
end;

class procedure GrabbyArmBrains_TypeTests<T>.ReturnsTrueWhenComprisedSolelyOfSourceCodeComparingTheProvidedValueOfTAgainstTheDefaultOfT();
var
  ActualValue: Boolean;
  Actual: GrabbyArmBrains<T>;
begin
  ActualValue := False;
  Assert(not ActualValue);
  Actual := function (const AValue: T): Boolean begin Result := (AValue = Default(T)) end;
  Assert(Assigned(Actual));
  Assert(Actual(Default(T)));
end;

{$IFEND}

end.
