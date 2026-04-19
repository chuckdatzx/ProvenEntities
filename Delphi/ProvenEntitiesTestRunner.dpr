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
  PE.Tests.BoundedTypes.Digit in '..\Tests\PE.Tests.BoundedTypes.Digit.pas',
  PE.Tests.BoundedTypes.MonoChar in '..\Tests\PE.Tests.BoundedTypes.MonoChar.pas',
  PE.Tests.BoundedTypes.NaturalNumber in '..\Tests\PE.Tests.BoundedTypes.NaturalNumber.pas',
  PE.Tests.BoundlessRoutines.DataStream.UniqueElements in '..\Tests\PE.Tests.BoundlessRoutines.DataStream.UniqueElements.pas',
  PE.Tests.BoundlessTypes.ArrayOf in '..\Tests\PE.Tests.BoundlessTypes.ArrayOf.pas',
  PE.Tests.Routines in '..\Tests\PE.Tests.Routines.pas',
  PE.Tests.Routines.Buckets in '..\Tests\PE.Tests.Routines.Buckets.pas',
  PE.Tests.Types.Buckets in '..\Tests\PE.Tests.Types.Buckets.pas',
  PE.Tests.Types.Composite in '..\Tests\PE.Tests.Types.Composite.pas',
  PE.Types in '..\Source\PE.Types.pas',
  PE.Types.Composite in '..\Source\PE.Types.Composite.pas',
  System.Classes,
  System.SysUtils,
  System.TimeSpan,
  System.Threading;

type
  //Replace T with any compilable type; or add your own tests below.
  T = Cardinal;

begin
  var Start: Integer := System.SysUtils.DateTimeToTimeStamp(System.SysUtils.Now()).Time;
  Randomize();
  {
  All you need to do to prove things out at runtime is to execute the binary produced by this project file.
  You're likely only going to get 1 of 2 results when running from the command line:
  1) Complete Failure: (Likely brought to you by everyone's favorite bug to track down!) Runtime error <X> at address <Y>, or
  2) Complete Passing: After running the binary, you see "Tests Started...Tests Completed" (eventually)
  }
  System.Assert(ExecuteTypeAndValueCompleteProof);
  System.Write('Tests Started...');
  var Tasks: ArrayOf<ITask> := PE.Tests.TheExecutioner.ExecuteTypeAndValueCompleteProof();
  PE.Tests.Routines.Buckets.ExecutableSpeficiation_CategorizeRoutine<T>.Exercise();
  PE.Tests.Types.Buckets.AllTests<T>.Exercise();
  PE.Tests.Types.Composite.AllTests.Exercise();
  PE.Examples.Delphi.CategorizingWithBuckets.Exercise.AllTests();
  for var I: NativeUInt := System.Low(Tasks) to System.High(Tasks) do
  begin
    System.Assert(Tasks[I].Status = TTaskStatus.Created);
    Tasks[I] := Tasks[I].Start;
  end;
  var AllTasksAccountedFor: Boolean;
  repeat
    AllTasksAccountedFor := True;
    for var EachTask: ITask in Tasks do
    begin
      System.Assert(System.Assigned(EachTask));
      System.Assert(not (EachTask.Status in [TTaskStatus.Canceled, TTaskStatus.Exception]));
      AllTasksAccountedFor := AllTasksAccountedFor and (EachTask.Status = TTaskStatus.Completed);
      if (not AllTasksAccountedFor) then
        Break;
      { TODO -oChuck -cToDo : Need to add a mechanism for handling/surfacing exceptions in threads }
    end;
    YieldProcessor();
  until AllTasksAccountedFor;
  var Stop: Integer := System.SysUtils.DateTimeToTimeStamp(System.SysUtils.Now()).Time;
  var DurationInMinutes: Double := (Abs(Abs(Stop) - Abs(Start)) / 60000);
  System.Writeln('Tests Completed in :: ' + DurationInMinutes.ToString() + ' minutes');
  System.Writeln('Press Enter to close the application');
  ReadLn;
  ExitCode := 0;
  Exit;
end.
