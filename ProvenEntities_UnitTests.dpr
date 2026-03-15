program ProvenEntities_UnitTests;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
uses
  {$IFNDEF ANDROID}
  FastMM4,
  DUnitX.MemoryLeakMonitor.FastMM4,
  {$ENDIF }
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  {$ENDIF }
  DUnitX.TestFramework,
  tinkering in 'tinkering.pas',
  PE.RandomGenerator.OrdinalGenerationRoutines in 'Source\PE.RandomGenerator.OrdinalGenerationRoutines.pas',
  PE.RandomGenerator in 'Source\PE.RandomGenerator.pas',
  PE.UnitTests.RandomGenerator_Proven in 'Source\Unit Tests\PE.UnitTests.RandomGenerator_Proven.pas',
  PE.UnitTests.RandomGenerator.OrdinalGenerationRoutines_Proven in 'Source\Unit Tests\PE.UnitTests.RandomGenerator.OrdinalGenerationRoutines_Proven.pas',
  PE.UnitTests.RandomGenerator.TDD.Templates in 'Source\Unit Tests\PE.UnitTests.RandomGenerator.TDD.Templates.pas',
  PE.Buckets in 'Source\PE.Buckets.pas';

{ keep comment here to protect the following conditional from being removed by the IDE when adding a unit }
{$IFNDEF TESTINSIGHT}
var
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger : ITestLogger;
{$ENDIF}
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //When true, Assertions must be made during tests;
    runner.FailsOnNoAsserts := False;

    //tell the runner how we will log things
    //Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      logger := TDUnitXConsoleLogger.Create(TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      runner.AddLogger(logger);
    end;
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
//    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
//    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
//    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}
end.
