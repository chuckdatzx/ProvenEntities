unit PE.Tests;

{Assumptions:
Assumption 1: The source code in this unit, and any PE referencing units, has not been altered (e.g. is unchanged when compared to "official" repository version <x>)
Assumption 2: Tests invoked from this unit provide "complete type coverage" (See the definitions below regarding "complete type coverage")
Assumption 3: Tests in this unit prove "complete value coverage" (See the definitions below regarding "complete value coverage")
}

{Definitions (all of which require the above Assumptions to be True):
  "complete type coverage" = the following:
    - I mean that all "compiler allowed" boundaries, relating to the existence of type in question T, are discretely covered with executable test cases.
      In other words, where the compiler is concerned, there are not any "loopholes" left to consider. (I'm pretty sure I haven't completed this; I could use help getting there)
  "complete value coverage" = the following:
    - Where T is a bounded type (i.e. has known boundaries), every test case for a "value complete" solution must exercise every possible value for T.
    - Where T is not bounded (i.e. not possible to complete), categories of coverage (framing boundaries) must be established to maximize coverage; and each category must exercise every value of T
      - For an unbounded context, I'm currently considering the best possible outcome to be the one in which everyone unanimously agrees that he/she/they can trust type T due to the coverage present (i.e. it takes a village)
    - I am also implicity arguing that one can achieve "value complete" testing without any explicit type conversions.
      - Since I am implicity arguing that explicit type conversions are not needed, I won't be accepting any counter-proposals that require explict type conversion (including my own code)

  "Strength(X):"
    Proof:        You have built and executed a binary that is its own type and value complete proof
                  - Meaning that for every PE type <x> you use, you have included and executed any provided type complete and value complete tests provided with PE type <x>
                    - More specifically, I also mean that you can and have successfully executed the PE.Tests.Execute.DoExecuteTypeAndValueCompleteProof(); routine from within said end binary
                    - And even more specifically, I mean said routine is executed after Delphi's exception handling becomes available
                    - Yet again more specifically, I mean said routine is executed in a block of code that doesn't trap exceptions, and said exceptions would cause your application to crash if not handled
                    - ... , I mean that your binary will always be running processor architecture <y>, and so on
    Extremely
    Reliable():   Setup 2 "versions" of your end binary:
                  1) The 1st version is, of course, the end product as you would want it (without any "testing luggage", so to speak)
                  2) The 2nd version would also include this unit. Then simply make sure that a call to the PE.Tests.Types.Foundational.Digit.TypeAndValueComplete.Exercise() routine such that it is executed as described above.
    Weak():       You trust that the code under test was tested rigorously by someone that you trust.
    Weakest():    You hope that the code was tested by someone/something at some point (especially since "tested" can mean so many things).

[Chuck C.T. :: 4/14/20206 :: Claiming that the above is both sound and complete constructivist proof]
}

interface

uses
  System.Threading;

{$IFDEF TYPE_AND_VALUE_COMPLETE_PROOF}
const
  ExecuteTypeAndValueCompleteProof = True;

type
  TheExecutioner = record
  public
    class function ExecuteTypeAndValueCompleteProof(): TArray<ITask>; static;
  end;
{$ELSE}
const
  ExecuteTypeAndValueCompleteProof = False;
{$ENDIF}

implementation

uses
  PE.Tests.BoundedTypes.Digit,
  PE.Tests.BoundedTypes.MonoChar,
  PE.Tests.BoundedTypes.NaturalNumber,
  PE.Tests.BoundlessTypes.ArrayOf,
  PE.Tests.BoundlessRoutines.DataStream.Contains,
  PE.Tests.BoundlessRoutines.DataStream.UniqueElements,
  PE.Types,
  PE.Types.Composite,
  System.Classes,
  System.SysUtils;

{$IFDEF TYPE_AND_VALUE_COMPLETE_PROOF}
{TheExecutioner}
class function TheExecutioner.ExecuteTypeAndValueCompleteProof(): TArray<ITask>;
begin
  {$MESSAGE HINT '👍 :: Value and type complete testing battery is staged for execution'}
  {Bounded Types}
  Result := [TTask.Create(procedure begin PE.Tests.BoundedTypes.Digit.Exercise(); end),
    TTask.Create(procedure begin PE.Tests.BoundedTypes.MonoChar.Exercise(); end),
    TTask.Create(procedure begin PE.Tests.BoundedTypes.NaturalNumber.Exercise(); end)];
  {Boundless Types by Bounded Types}
  Result := [TTask.Create(procedure begin PE.Tests.BoundlessTypes.ArrayOf.ExecutableSpecification_ArrayOf_Complete<Digit>.Exercise(); end),
    TTask.Create(procedure begin PE.Tests.BoundlessTypes.ArrayOf.ExecutableSpecification_ArrayOf_Complete<MonoChar>.Exercise(); end),
    TTask.Create(procedure begin PE.Tests.BoundlessTypes.ArrayOf.ExecutableSpecification_ArrayOf_Complete<NaturalNumber>.Exercise(); end)] + Result;
  {DataStream.Contains<T> by Bounded Types (representing the realm of all natural numbers; 0..∞)}
  Result := [TTask.Create(procedure begin PE.Tests.BoundlessRoutines.DataStream.Contains.ExecutableSpecification_DataStreams_Contains_Digit_ValueCompleteTests.Exercise(); end),
    TTask.Create(procedure begin PE.Tests.BoundlessRoutines.DataStream.Contains.ExecutableSpecification_DataStream_Contains_TypeCompleteOrdinal<MonoChar>.Exercise(); end),
    TTask.Create(procedure begin PE.Tests.BoundlessRoutines.DataStream.Contains.ExecutableSpecification_DataStream_Contains_TypeCompleteOrdinal<NaturalNumber>.Exercise(); end)];
  {DataStream.UniqueElements<T> by Bounded Types (representing the realm of all natural numbers; 0..∞)}
  Result := [TTask.Create(procedure begin PE.Tests.BoundlessRoutines.DataStream.UniqueElements.ExecutableSpecification_DataStreams_UniqueElements_Digit_ValueCompleteTests.Exercise(); end),
    TTask.Create(procedure begin PE.Tests.BoundlessRoutines.DataStream.UniqueElements.ExecutableSpecification_DataStreams_UniqueElements_TypeCompleteOrdinal<MonoChar>.Exercise(); end),
    TTask.Create(procedure begin PE.Tests.BoundlessRoutines.DataStream.UniqueElements.ExecutableSpecification_DataStreams_UniqueElements_TypeCompleteOrdinal<NaturalNumber>.Exercise(); end)] + Result;
end;
{$ELSE}
{$MESSAGE WARN '🙈 :: Value and type complete testing battery for the "PE.Types.Foundational" types WILL NOT be executed'}
{$ENDIF}

end.
