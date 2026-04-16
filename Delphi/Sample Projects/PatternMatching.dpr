program PatternMatching;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainForm in 'MainForm.pas' {Form2},
  PE.Buckets in '..\..\Source\PE.Buckets.pas',
  PE.Delphi.AssignmentCompatibility in '..\PE.Delphi.AssignmentCompatibility.pas',
  PE.Delphi.TypeIdentity in '..\PE.Delphi.TypeIdentity.pas',
  PE.Types.Composite in '..\..\Source\PE.Types.Composite.pas',
  PE.Types.Foundational in '..\..\Source\PE.Types.Foundational.pas',
  PE.Tests in '..\..\Tests\PE.Tests.pas',
  PE.Tests.TypeCompleteAndValueComplete.ArrayOf in '..\..\Tests\PE.Tests.TypeCompleteAndValueComplete.ArrayOf.pas',
  PE.Actors.Rando in '..\PE.Actors.Rando.pas',
  PE.Tests.Types.Foundational.BigNaturalNumber.TypeAndValueComplete in '..\..\Tests\PE.Tests.Types.Foundational.BigNaturalNumber.TypeAndValueComplete.pas',
  PE.Tests.Types.Foundational.Digit.TypeAndValueComplete in '..\..\Tests\PE.Tests.Types.Foundational.Digit.TypeAndValueComplete.pas',
  PE.Tests.Types.Foundational.MonoChar.TypeAndValueComplete in '..\..\Tests\PE.Tests.Types.Foundational.MonoChar.TypeAndValueComplete.pas',
  PE.Tests.Types.Foundational.NaturalNumber.TypeAndValueComplete in '..\..\Tests\PE.Tests.Types.Foundational.NaturalNumber.TypeAndValueComplete.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
