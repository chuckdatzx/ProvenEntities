program ProvenEntities_TypeTests;

{$APPTYPE CONSOLE}
{$STRONGLINKTYPES ON}
uses
  PE.Buckets in 'Source\PE.Buckets.pas',
  PE.DomainTests.Buckets in 'Domain Tests\PE.DomainTests.Buckets.pas',
  PE.TypeTests.Delphi.AssignmentCompatibility.GenericRecords.Proven.AtCompileTime in 'Type Tests\PE.TypeTests.Delphi.AssignmentCompatibility.GenericRecords.Proven.AtCompileTime.pas',
  PE.TypeTests.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime in 'Type Tests\PE.TypeTests.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime.pas',
  PE.TypeTests.Buckets in 'Type Tests\PE.TypeTests.Buckets.pas',
  PE.TypeTests.Delphi.TypeIdentity.Proven.AtCompileTime in 'Type Tests\PE.TypeTests.Delphi.TypeIdentity.Proven.AtCompileTime.pas';

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
  PE.TypeTests.Buckets.TypeTests<T>.Exercise();
  PE.DomainTests.Buckets.DomainTests<T>.Exercise();
  Write('Tests Completed');
end.
