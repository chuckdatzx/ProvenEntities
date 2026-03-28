program ProvenEntities_TypeTests;

{$APPTYPE CONSOLE}
{$STRONGLINKTYPES ON}
uses
  PE.TypeTests.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime in 'PE.TypeTests.Delphi.TypeIdentity.GenericRecords.Proven.AtCompileTime.pas',
  PE.TypeTests.Delphi.AssignmentCompatibility.GenericRecords.Proven.AtCompileTime in 'PE.TypeTests.Delphi.AssignmentCompatibility.GenericRecords.Proven.AtCompileTime.pas',
  PE.TypeTests.Buckets in 'Source\Unit Tests\PE.TypeTests.Buckets.pas',
  PE.Buckets in 'Source\PE.Buckets.pas';

type
  //Replace T with any compilable type.
  //(just make sure to keep it between the first and last "WriteLn" [that way we know no errors could have occurred])
  T = Integer;

begin
  {
  Since Delphi won't have time to setup exception handling, we're only going to get 1 of 2 results when running from the command line:
  1) Complete Failure: (Brought to you by everyone's favorite bug to track down!) Runtime error X at address Y
  2) Complete Passing: Output from the app of "Tests Started...Tests Completed"
  }
  Write('Tests Started...');
  //If you're feeling wild and crazy, add all the types!
  GrabbyArmBrains_TypeTests<T>.Invoke();
  Write('Tests Completed');
end.
