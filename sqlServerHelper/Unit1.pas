unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Menus, ComCtrls, Grids;

type
  TForm1 = class(TForm)
    btConnectDB: TButton;
    ADOConnection: TADOConnection;
    ADOQuery: TADOQuery;
    selectButton: TButton;
    TableName: TEdit;
    ListView: TListView;
    insertButton: TButton;
    UpdateButton: TButton;
    procedure ADOConnectionAfterConnect(Sender: TObject);
    procedure selectButtonClick(Sender: TObject);
    procedure insertButtonClick(Sender: TObject);
    procedure btConnectDBClick(Sender: TObject);
    procedure ListViewDblClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Update;

{$R *.dfm}

procedure TForm1.ADOConnectionAfterConnect(Sender: TObject);
begin
   showMessage('Connect');
   Form1.show;
end;

procedure TForm1.selectButtonClick(Sender: TObject);
var
  sqlStmt:string;
  sTableName:string;
 // sqlStmt1:string;
  columns:integer;
  Titem:Tlistitem;
  rows:integer;
  i:integer;
  j:integer;
begin
  sTableName:=TableName.Text;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  sqlStmt:='SELECT syscolumns.name,systypes.name,syscolumns.isnullable,syscolumns.length '+
           'FROM syscolumns, systypes '+
           'WHERE syscolumns.xusertype = systypes.xusertype '+
           'AND syscolumns.id = object_id('''+sTableName+''')' ;

  ADOQuery.SQL.Add(sqlStmt);
  ADOQuery.Open;
 // columns:=Adoquery.FieldCount;
  columns:=Adoquery.RecordCount;
  //Edit1.Text:=Adoquery.Fields[0].AsString;
  Listview.ViewStyle:=vsreport;
  Listview.GridLines:=true;
  ListView.Clear;
  ListView.Columns.add;
  ListView.Columns.Items[0].Caption:='REC';
  for i:=1 To columns do
  begin
    ListView.Columns.add;
    ListView.Columns.Items[i].Caption:=Adoquery.Fields[0].AsString;
    Adoquery.Next;
  end;
  Adoquery.Close;
  ADOQuery.SQL.Clear;
  sqlStmt:='SELECT * FROM '+sTableName;
  ADOQuery.SQL.Add(sqlStmt);
  ADOQuery.Open;
  columns:=ADOQuery.Fields.Count;
  rows:=ADOQuery.RecordCount;
  for i:=0 to rows-1 do
  begin
    Titem:=ListView.Items.Add;
    Titem.Caption:=IntToStr(i);
    for j:=0 to columns-1 do
    begin
      Titem.SubItems.Add(Adoquery.Fields[j].AsString);
     // Titem:=ListView.Items.add;
    end;
    Adoquery.Next;
  end;
  Adoquery.Close;
end;

procedure TForm1.insertButtonClick(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.btConnectDBClick(Sender: TObject);
begin
  with ADOConnection do
  begin
    Connected:=False;
    ConnectionString:='Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initial Catalog=KSMM_OPT;password =123456;Data Source=192.168.50.175';
    try
      ConnectionTimeout:=20;
      CommandTimeout:=30;
      Connected:=True;
    except
      ShowMessage('not connect');
      raise;
      Exit;
    end;
    end;
end;
procedure TForm1.ListViewDblClick(Sender: TObject);
begin
  showMessage('Connect');
end;
procedure TForm1.UpdateButtonClick(Sender: TObject);
begin
  UpdateForm.show;
end;

end.
