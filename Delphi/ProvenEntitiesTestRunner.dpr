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
  PE.Delphi.AssignmentCompatibility in 'PE.Delphi.AssignmentCompatibility.pas',
  PE.Delphi.TypeIdentity in 'PE.Delphi.TypeIdentity.pas',
  PE.Tests.BoundedTypes.Digit in '..\Tests\PE.Tests.BoundedTypes.Digit.pas',
  PE.Types in '..\Source\PE.Types.pas';

begin
  Randomize();
  {
  All you need to do to prove things out at runtime is to execute the binary produced by this project file.
  You're likely only going to get 1 of 2 results when running from the command line:
  1) Complete Failure: (Likely brought to you by everyone's favorite bug to track down!) Runtime error <X> at address <Y>, or
  2) Complete Passing: After running the binary, you see "Starting Tests...Tests Complete" (eventually)
  }
  ExitCode := MaxInt;
  System.WriteLn('Starting Tests...');
  ExecutableSpecification_Digit_Definition.Exercise();
  System.WriteLn('Tests Complete...');
  System.Writeln('Press any key to close the application');
  ReadLn;

  Exit;
end.
