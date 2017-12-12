unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, Menus, StdCtrls;

type
  TForm2 = class(TForm)
    ValueListEditor: TValueListEditor;
    insertButton: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
Uses Unit1;
{$R *.dfm}


procedure TForm2.FormShow(Sender: TObject);
var
  sqlStmt:string;
 // sqlStmt1:string;
  columns:integer;
  key:string;
  rows:integer;
  i:integer;
  j:integer;
  VE:TValueListEditor;
begin
  Form1.ADOQuery.Close;
  Form1.ADOQuery.SQL.Clear;
  sqlStmt:='SELECT syscolumns.name,systypes.name,syscolumns.isnullable,syscolumns.length '+
           'FROM syscolumns, systypes '+
           'WHERE syscolumns.xusertype = systypes.xusertype '+
           'AND syscolumns.id = object_id(''USER_LOG'')' ;

  Form1.ADOQuery.SQL.Add(sqlStmt);
  Form1.ADOQuery.Open;
 // columns:=Adoquery.FieldCount;
  rows:=Form1.Adoquery.RecordCount;
  for i:=0 to rows-1 do
  begin
    key:=Form1.Adoquery.Fields[0].AsString;
    Form2.ValueListEditor.InsertRow(key,'',true);
    Form2.ValueListEditor.ItemProps[i].PickList.
    Form1.ADOQuery.Next;
  end;
  sqlStmt:='SELECT name FROM syscolumns '+
           'WHERE id=Object_Id(''USER_LOG'') and colid IN(SELECT keyno from sysindexkeys WHERE id=Object_Id(''USER_LOG''))';
  Form1.ADOQuery.Close;
end;
end.
