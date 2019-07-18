unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  sqlStmt:string;
begin
  sqlStmt:='insert into gh (GDDM) values(''11'')' ;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(sqlStmt);
  ADOQuery1.ExecSQL;
  ADOQuery1.Close;
end;

end.
