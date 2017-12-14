unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, Menus, StdCtrls;

type
  TForm2 = class(TForm)
    ValueListEditor: TValueListEditor;
    insertButton: TButton;
    Edit1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure insertButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  TValueListEditorAccess = class(TValueListEditor);
var
  Form2: TForm2;

implementation
Uses Unit1;
{$R *.dfm}

 procedure ValueListEditorDrawCell(Sender: TObject; ACol,ARow: Integer);
begin
  TValueListEditorAccess(Sender).OnDrawCell := nil;
  //if (ACol = 0) and (ARow > 0) then
    TValueListEditorAccess(Sender).Canvas.Brush.Color := clred;
end;
procedure TForm2.FormShow(Sender: TObject);
var
  sqlStmt:string;
 // sqlStmt1:string;
  key:string;
  i:integer;
  rows:integer;
  VE:TValueListEditor;
  sTableName:string;
begin
  sTableName:=Form1.TableName.Text;
  Form1.ADOQuery.Close;
  Form1.ADOQuery.SQL.Clear;
  sqlStmt:='SELECT syscolumns.name,systypes.name,syscolumns.isnullable,syscolumns.length '+
           'FROM syscolumns, systypes '+
           'WHERE syscolumns.xusertype = systypes.xusertype '+
           'AND syscolumns.id = object_id('''+sTableName+''')' ;

  Form1.ADOQuery.SQL.Add(sqlStmt);
  Form1.ADOQuery.Open;
 // columns:=Adoquery.FieldCount;
  rows:=Form1.Adoquery.RecordCount;
  for i:=0 to rows-1 do
  begin
    ValueListEditorDrawCell(Sender,0,0);
    key:=Form1.Adoquery.Fields[0].AsString;
    Form2.ValueListEditor.InsertRow(key,'',true);
   // Form2.ValueListEditor.ItemProps[i].PickList.
    Form1.ADOQuery.Next;
  end;
 // sqlStmt:='SELECT name FROM syscolumns '+
 //          'WHERE id=Object_Id(''USER_LOG'') and colid IN(SELECT keyno from sysindexkeys WHERE id=Object_Id(''USER_LOG''))';
  Form1.ADOQuery.Close;
end;
procedure TForm2.insertButtonClick(Sender: TObject);
var
  sSqlStmt1:string;
  sSqlStmt2:string;
  sKey:string;
  sValue:string;
  iValueListEditorRow:integer;
  iIndex:Integer;
  sTableName:string;
begin
  sTableName:=Form1.TableName.Text;
  sSqlStmt1:='INSERT INTO '+sTableName+'(';
  sSqlStmt2:=')VALUES(';
  iValueListEditorRow:=ValueListEditor.RowCount;
  FOR iIndex:=1 To iValueListEditorRow-1 DO
  begin
    sKey:=valuelisteditor.Keys[iIndex];
    sValue:=valuelisteditor.Values[sKey];
    if iIndex <> 1 THEN
    begin
      sSqlStmt1:=sSqlStmt1+',';
      sSqlStmt2:=sSqlStmt2+',';
    end;
    sSqlStmt1:=sSqlStmt1+skey;
    sSqlStmt2:=sSqlStmt2+''''+sValue+'''';
  end;
  sSqlStmt2:= sSqlStmt2+')';
  sSqlStmt1:=sSqlStmt1+sSqlStmt2;
  Form1.ADOQuery.SQL.Clear;
  Form1.ADOQuery.SQL.Add(sSqlStmt1);
  Form1.ADOQuery.ExecSQL;
  Form1.ADOQuery.Close;
  Edit1.Text:=sSqlStmt1;
end;



end.

