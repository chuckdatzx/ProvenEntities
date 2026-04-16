unit MainForm;

interface

uses
  {Delphi}
  System.Classes,
  System.Rtti,
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Forms,
  FMX.Grid,
  FMX.Grid.Style,
  FMX.Memo,
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Types,
  {PE}
  PE.Types.Composite,
  PE.Types.Foundational;

type
  TForm2 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    Memo1: TMemo;
    Button1: TButton;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  strict private
    FMyRoutine: SmartClaw<MonoChar>;
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses
  {PE}
  PE.Buckets,
  {Delphi}
  System.Character,
  System.Generics.Collections,
  System.SysUtils,
  System.UITypes,
  FMX.Platform;

var ADictionary: TDictionary<MonoChar, NaturalNumber>;

procedure TForm2.Button1Click(Sender: TObject);
var
  ACursor: IFMXCursorService;
begin
  if (not TPlatformServices.Current.SupportsPlatformService(IFMXCursorService, ACursor)) then ACursor := nil;
  if Assigned(ACursor) then
    ACursor.SetCursor(crHourGlass);
  try
    System.Assert(System.Assigned(ADictionary), 'The "private" dictionary is not assigned');
    ADictionary.Clear();
    var AStringsBundle: TArray<string> := Memo1.Lines.ToStringArray();
    var ALongString: string := System.Default(string);
    for var I: NativeInt := System.Low(AStringsBundle) to High(AStringsBundle) do
      ALongString := ALongString + AStringsBundle[I];
    var DataStream: ArrayOf<MonoChar> := MultiChar.Create(ALongString).ArrayOfMonoChar;
    System.Assert(System.Assigned(FMyRoutine), 'The SmartClaw<MonoChar> routine is not assigned');
    Routines.Categorize<MonoChar>(DataStream, [BucketIn<MonoChar>.Create(FMyRoutine)]);
    StringGrid1.ClearColumns();
    for var Each: MonoChar in ADictionary.Keys.ToArray do
    begin
      var AColumn := TStringColumn.Create(StringGrid1);
      AColumn.Header := Each;
      StringGrid1.AddObject(AColumn);
      if (StringGrid1.Model.ColumnCount > 0) then
        StringGrid1.Model.RowCount := StringGrid1.Model.RowCount + 1;
      StringGrid1.Cells[AColumn.Index, 0] := System.SysUtils.UIntToStr(ADictionary[Each]);
    end;
  finally
    if Assigned(ACursor) then ACursor.SetCursor(crDefault);
    ACursor := nil;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FMyRoutine := function (const Value: MonoChar): Boolean
  begin
    Result := False;
    if TCharacter.IsLetter(Value) then
    begin
      System.Assert(System.Assigned(ADictionary), 'The "private" dictionary is not assigned');
      if ADictionary.ContainsKey(Value) then
        ADictionary.Items[Value] := ADictionary.Items[Value] + 1
      else
        ADictionary.Add(Value, 1);
    end;
  end;
end;

initialization
  ADictionary := TDictionary<MonoChar, NaturalNumber>.Create();

finalization
  if System.Assigned(ADictionary) then
  begin
    ADictionary.Free();
    ADictionary := nil;
  end;

end.
