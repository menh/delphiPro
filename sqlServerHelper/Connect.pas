unit Connect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TConnectForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ConnectButton: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    SqlServerAddr: TEdit;
    UserName: TEdit;
    Edit4: TEdit;
    Password: TEdit;
    Label6: TLabel;
    DataBaseName: TEdit;
    procedure ConnectButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConnectForm: TConnectForm;

implementation
uses unit1;
{$R *.dfm}

procedure TConnectForm.ConnectButtonClick(Sender: TObject);
var
  sUserId:string;
  sInitialCatalog:string;
  sPassword:string;
  sDataSource:string;
begin
   sUserId:=UserName.Text;
   sInitialCatalog:=DatabaseName.Text;
   sPassword:=Password.Text;
   sDataSource:=SqlServerAddr.Text;
   with Form1.ADOConnection do
    begin
    Connected:=False;
    ConnectionString:='Provider=SQLOLEDB.1;Persist Security Info=False;User ID='+sUserId+';Initial Catalog='+sInitialCatalog+';password ='+sPassword+';Data Source='+sDataSource;
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
  Form1.show;
end;

end.
