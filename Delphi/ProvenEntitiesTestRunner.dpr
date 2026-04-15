program ProvenEntitiesTestRunner;
{$ASSERTIONS ON}
{$BOOLEVAL OFF}
{$DEFINITIONINFO ON}
{$EXTENDEDSYNTAX ON}
{$HIGHCHARUNICODE ON}
{$HINTS ON}
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
  PE.Actors.Rando in 'PE.Actors.Rando.pas',
  PE.Buckets in '..\Source\PE.Buckets.pas',
  PE.Delphi.AssignmentCompatibility in 'PE.Delphi.AssignmentCompatibility.pas',
  PE.Delphi.TypeIdentity in 'PE.Delphi.TypeIdentity.pas',
  PE.Examples.Delphi.CategorizingWithBuckets in '..\Examples\Delphi\PE.Examples.Delphi.CategorizingWithBuckets.pas',
  PE.Routines in '..\Source\PE.Routines.pas',
  PE.Tests in '..\Tests\PE.Tests.pas',
  PE.Tests.Execute in '..\Tests\PE.Tests.Execute.pas',
  PE.Tests.Routines in '..\Tests\PE.Tests.Routines.pas',
  PE.Tests.Routines.Buckets in '..\Tests\PE.Tests.Routines.Buckets.pas',
  PE.Tests.Types.Buckets in '..\Tests\PE.Tests.Types.Buckets.pas',
  PE.Tests.Types.Composite in '..\Tests\PE.Tests.Types.Composite.pas',
  PE.Tests.Types.Foundational.BigNaturalNumber.TypeAndValueComplete in '..\Tests\PE.Tests.Types.Foundational.BigNaturalNumber.TypeAndValueComplete.pas',
  PE.Tests.Types.Foundational.Digit.TypeAndValueComplete in '..\Tests\PE.Tests.Types.Foundational.Digit.TypeAndValueComplete.pas',
  PE.Tests.Types.Foundational.MonoChar.TypeAndValueComplete in '..\Tests\PE.Tests.Types.Foundational.MonoChar.TypeAndValueComplete.pas',
  PE.Tests.Types.Foundational.NaturalNumber.TypeAndValueComplete in '..\Tests\PE.Tests.Types.Foundational.NaturalNumber.TypeAndValueComplete.pas',
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
  System.Assert(ExecuteTypeAndValueCompleteProof, 'This test runner expects to run a type complete and value complete execution every time');
  System.Write('Tests Started...');
  PE.Tests.Execute.DoExecuteTypeAndValueCompleteProof();
  PE.Tests.Routines.AllTests.Exercise();
  PE.Tests.Routines.Buckets.ExecutableSpeficiation_CategorizeRoutine<T>.Exercise();
  PE.Tests.Types.Buckets.AllTests<T>.Exercise();
  PE.Tests.Types.Composite.AllTests.Exercise();
  PE.Examples.Delphi.CategorizingWithBuckets.Exercise.AllTests();
  System.Write('Tests Completed');
end.
