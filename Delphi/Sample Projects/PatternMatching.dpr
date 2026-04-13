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
  PE.Types.Foundational.Generics in '..\..\Source\PE.Types.Foundational.Generics.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
