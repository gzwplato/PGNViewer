unit SettingsForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ExtCtrls, StdCtrls, Board;

type

  { TSettingsForm }

  TSettingsForm = class(TForm)
    Board1: TBoard;
    cbBlack: TColorButton;
    cbWhite: TColorButton;
    CheckGroup1: TCheckGroup;
    ColorDialog1: TColorDialog;
    Label1: TLabel;
    Label2: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    tsBoard: TTabSheet;
    TreeView1: TTreeView;
    procedure cbBlackColorChanged(Sender: TObject);
    procedure cbWhiteColorChanged(Sender: TObject);
    procedure CheckGroup1ItemClick(Sender: TObject; Index: integer);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1SelectionChanged(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  SettingsForm1: TSettingsForm;

implementation

{$R *.lfm}

{ TSettingsForm }

procedure TSettingsForm.TreeView1SelectionChanged(Sender: TObject);
begin
  PageControl1.TabIndex := TreeView1.Selected.Index;
end;

procedure TSettingsForm.cbBlackColorChanged(Sender: TObject);
begin
  Board1.BlackSquareColor := cbBlack.ButtonColor;
end;

procedure TSettingsForm.cbWhiteColorChanged(Sender: TObject);
begin
  Board1.WhiteSquareColor := cbWhite.ButtonColor;
end;

procedure TSettingsForm.CheckGroup1ItemClick(Sender: TObject; Index: integer);
begin
  if CheckGroup1.Checked[Index] then
    Board1.Border.Style := Board1.Border.Style + [TBorderStyle((Index + 1) mod 4)]
  else
    Board1.Border.Style := Board1.Border.Style - [TBorderStyle((Index + 1) mod 4)];
end;

procedure TSettingsForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  TreeView1.Selected := TreeView1.Items[0];
  for i := 0 to 3 do
    CheckGroup1.Checked[i] := True;
end;

end.
