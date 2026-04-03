program ProvenEntities_TypeTests;
{Chuck C.T.
Full Declaration of Transparency:
You should only consider the code under test proven insofar as you agree with everything presented
(and by "everything presented", I mean from the scope of the compiler all the way through to
your custom code based on entities from this unit).

I'm truly not trying to scare anyone off. I'm perfectly comfortable calling the following proven;
and I have researched from the compiler to my code. I'm simply recommending that you do the same
and not just assume, without pause, that it is unbreakable.}

{$APPTYPE CONSOLE}
{$STRONGLINKTYPES ON}
uses
  PE.Buckets in 'Source\PE.Buckets.pas',
  PE.Types in 'Source\PE.Types.pas',
  PE.DomainTests.Buckets in 'Domain Tests\PE.DomainTests.Buckets.pas',
  PE.ImplicitlyTrusted.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime in 'Delphi\PE.ImplicitlyTrusted.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime.pas',
  PE.ImplicitlyTrusted.Delphi.TypeIdentity.Proven.AtCompileTime in 'Delphi\PE.ImplicitlyTrusted.Delphi.TypeIdentity.Proven.AtCompileTime.pas',
  PE.ImplicitlyTrusted.Delphi.AssignmentCompatibility.GenericRecords.Proven.AtCompileTime in 'Delphi\PE.ImplicitlyTrusted.Delphi.AssignmentCompatibility.GenericRecords.Proven.AtCompileTime.pas',
  PE.TypeTests.Buckets in 'Type Tests\PE.TypeTests.Buckets.pas',
  PE.TypeTests.Types in 'Type Tests\PE.TypeTests.Types.pas',
  CategorizingWithBuckets in 'Examples\Delphi\CategorizingWithBuckets.pas';

{ TODO -oChuck -cMusing :
I've noticed that the more I lean on my own definitions, the leaner the end binary becomes.
The problem is that the more I lean on my own definitions, the more I seemingly gain capability.
It seems odd to me that both of those statements feel True at the same time.}

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
  PE.TypeTests.Types.AllTests.Exercise();
  PE.TypeTests.Buckets.TypeTests<T>.Exercise();
  PE.DomainTests.Buckets.DomainTests<T>.Exercise();
  CategorizingWithBuckets.OrganizingNumbers.ByOddsAndEvens();
  System.Write('Tests Completed');
end.
