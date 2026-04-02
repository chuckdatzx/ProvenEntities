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
  {PE}
  PE.Buckets in 'Source\PE.Buckets.pas',
  PE.Types in 'Source\PE.Types.pas',
  {PE Tests}
  PE.DomainTests.Buckets in 'Domain Tests\PE.DomainTests.Buckets.pas',
  PE.TypeTests.Buckets in 'Type Tests\PE.TypeTests.Buckets.pas',
  PE.TypeTests.Types in 'Type Tests\PE.TypeTests.Types.pas',
  {Language Assertions}
  PE.Delphi.AssignmentCompatibility.GenericRecords.Proven.AtCompileTime in 'Delphi\PE.Delphi.AssignmentCompatibility.GenericRecords.Proven.AtCompileTime.pas',
  PE.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime in 'Delphi\PE.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime.pas',
  PE.Delphi.TypeIdentity.Proven.AtCompileTime in 'Delphi\PE.Delphi.TypeIdentity.Proven.AtCompileTime.pas',
  {Examples}
  CategorizingWithBuckets in 'Examples\Delphi\CategorizingWithBuckets.pas';

type
  //Replace T with any compilable type.
  T = Cardinal;

begin
  {
  We're likely only going to get 1 of 2 results when running from the command line:
  1) Complete Failure: (Likely brought to you by everyone's favorite bug to track down!) Runtime error <X> at address <Y>
  2) Complete Passing: Output from the app of "Tests Started...Tests Completed"
  }
  Write('Tests Started...');
  //If you want to cover more ground, just add your own values for T
  //just make sure to keep it between the first and last "WriteLn" (that way we can be sure no errors could have occurred)
  PE.TypeTests.Types.AllTests.Exercise();
  PE.TypeTests.Buckets.TypeTests<T>.Exercise();
  PE.DomainTests.Buckets.DomainTests<T>.Exercise();
  CategorizingWithBuckets.OrganizingNumbers.ByOddsAndEvens();
  Write('Tests Completed');
end.
