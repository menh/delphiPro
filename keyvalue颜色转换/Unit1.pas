unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, ValEdit;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    ListView1: TListView;
    ValueListEditor1: TValueListEditor;
    procedure FormCreate(Sender: TObject);
    procedure ValueListEditor1DrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  TValueListEditorAccess = class(TValueListEditor);
var
  Form1: TForm1;
var
i: Integer;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  valuelisteditor1.InsertRow('p1','pp1',true);
  valuelisteditor1.InsertRow('p2','pp1',true);
  valuelisteditor1.InsertRow('p3','pp1',true);
end;

procedure TForm1.ValueListEditor1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
   i:=i+1;
   TValueListEditorAccess(Sender).OnDrawCell := nil;
   if TValueListEditorAccess(Sender).Keys[ARow]='p1'  then
    TValueListEditorAccess(Sender).Canvas.Brush.Color := $00C0DCC0;
  if (ACol = 1) and (ARow > 0) then
    TValueListEditorAccess(Sender).Canvas.Font.Color := clRed;
  TValueListEditorAccess(Sender).DrawCell(ACol, ARow, Rect, State);
  TValueListEditorAccess(Sender).OnDrawCell := ValueListEditor1DrawCell;
  //showmessage(inttostr(i));
  //showmessage(TValueListEditorAccess(Sender).Keys[ARow]);
end;

end.
