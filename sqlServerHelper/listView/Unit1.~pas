unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, StdCtrls, Mask, Menus, ComCtrls;

type
  TForm1 = class(TForm)
    ValueListEditor1: TValueListEditor;
    ListView1: TListView;
    procedure ValueListEditor1Click(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;var DefaultDraw: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ValueListEditor1Click(Sender: TObject);
var
  list:TListView;
begin

  with listView1 do
  begin
    Columns.Add;
    Columns.Add;
    Columns.Add;
    ViewStyle:=vsreport;
    GridLines:=true;
    columns.items[0].caption:='进程名';
    columns.items[1].caption:='进程ID';
    columns.items[2].caption:='进程文件路径';
    Columns.Items[0].Width:=100;
    Columns.Items[1].Width:=100;
    Columns.Items[2].Width:=150;

  end;

  with listview1.items.add do
  begin
   caption:='1212';
   subitems.add('hh1');
   subitems.add('hh2');
   subitems.add('hh3');
   subitems.add('hh4');
   subitems.add('hh5');
   subitems.add('hh6');
  end;
end;

procedure TForm1.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.Index mod 2 = 0  then
    ListView1.Canvas.Brush.color := clAqua
  else
    ListView1.Canvas.Brush.color := clWhite;
  if cdsSelected in state then
    ListView1.Canvas.Brush.Color := clRed;
end;
end.
