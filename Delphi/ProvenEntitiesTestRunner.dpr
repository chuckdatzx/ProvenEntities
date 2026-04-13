program ProvenEntitiesTestRunner;
{$SCOPEDENUMS ON}
{Chuck C.T.
Full Declaration of Transparency:
You should only consider the code under test proven insofar as you agree with everything presented
(and by "everything presented", I mean from the scope of the compiler all the way through to
your custom code based on entities from this project).

I'm truly not trying to scare anyone off. I'm perfectly comfortable calling the following proven;
and I have researched from the compiler to my code. I'm simply recommending that you do the same
and not just assume, without pause, that it is unbreakable.}

{$APPTYPE CONSOLE}

uses
  PE.Buckets in '..\Source\PE.Buckets.pas',
  PE.Delphi.AssignmentCompatibility in 'Delphi\PE.Delphi.AssignmentCompatibility.pas',
  PE.Delphi.Rando in 'PE.Delphi.Rando.pas',
  PE.Delphi.TypeIdentity in 'Delphi\PE.Delphi.TypeIdentity.pas',
  PE.Examples.Delphi.CategorizingWithBuckets in '..\Examples\Delphi\PE.Examples.Delphi.CategorizingWithBuckets.pas',
  PE.Routines in '..\Source\PE.Routines.pas',
  PE.Tests.Routines in '..\Tests\PE.Tests.Routines.pas',
  PE.Tests.Routines.Buckets in '..\Tests\PE.Tests.Routines.Buckets.pas',
  PE.Tests.Types.Buckets in '..\Tests\PE.Tests.Types.Buckets.pas',
  PE.Tests.Types.Composite in '..\Tests\PE.Tests.Types.Composite.pas',
  PE.Tests.Types.Foundational in '..\Tests\PE.Tests.Types.Foundational.pas',
  PE.Tests.Types.Foundational.Generics in '..\Tests\PE.Tests.Types.Foundational.Generics.pas',
  PE.Types.Composite in '..\Source\PE.Types.Composite.pas',
  PE.Types.Foundational in '..\Source\PE.Types.Foundational.pas',
  PE.Types.Foundational.Generics in '..\Source\PE.Types.Foundational.Generics.pas';

type
  //Replace T with any compilable type; or add your own tests below.
  T = Cardinal;

begin
  {
  All you need to do to prove things out at runtime is to execute the binary produced by this project file.
  You're likely only going to get 1 of 2 results when running from the command line:
  1) Complete Failure: (Likely brought to you by everyone's favorite bug to track down!) Runtime error <X> at address <Y>, or
  2) Complete Passing: After running the binary, you see "Tests Started...Tests Completed"
  }
  System.Write('Tests Started...');
  //If you want to cover more ground, just copy/paste(the line of source code below that tests what you want to cover) and replace T with whatever type.
  //just make sure to keep it between the first and last System.Write (that way you can be sure no errors could have occurred)
  PE.Tests.Routines.AllTests.Exercise();
  PE.Tests.Routines.Buckets.ExecutableSpeficiation_CategorizeRoutine<T>.Exercise();
  PE.Tests.Types.Buckets.AllTests<T>.Exercise();
  PE.Tests.Types.Composite.AllTests.Exercise();
  PE.Tests.Types.Foundational.AllTests.Exercise();
  PE.Examples.Delphi.CategorizingWithBuckets.Exercise.AllTests();
  System.Write('Tests Completed');
end.
