unit user;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tuserform = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  userform: Tuserform;

implementation

{$R *.dfm}

procedure Tuserform.Button1Click(Sender: TObject);
var
  Table1:TTable;
begin
  Table1:=TTable.Create(self);
  Table1.DatabaseName:='ragl';
  Table1.TableName:='operator.db';
  Table1.Open;
  Table1.SetKey;
  Table1.FieldByName('name').AsString:=Edit1.Text;
  if(Table1.GotoKey) and (Table1.FieldByName('password').AsString=Edit2.Text) then
  begin
    username:=Edit1.Text;
    password:=Edit2.Text;
    x1:=Table1.fieldByName('right_1').asboolean;
    x2:=Table1.fieldByName('right_2').asboolean;
    x3:=Table1.fieldByName('right_3').asboolean;
    Table.close;
    Close;
  end
  else
  begin
    Table.close;
    Aplication.MwssageBox('用户名或者密码输入错误','提示信息',mb_ok);
    Edit.Text:='';
    Edit.Text:='';
    Edit1.SetFocus;
end;

end.
