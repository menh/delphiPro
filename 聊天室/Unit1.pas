unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Sockets;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    Label1: TLabel;
    SendButton: TButton;
    InfoMemo: TMemo;
    SendMemo: TMemo;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ServerAddr: TEdit;
    ServerPort: TEdit;
    Edit3: TEdit;
    SetButton: TButton;
    TcpServer1: TTcpServer;
    TcpClient1: TTcpClient;
    procedure FormCreate(Sender: TObject);
    procedure SetButtonClick(Sender: TObject);
    procedure SendButtonClick(Sender: TObject);
    procedure TcpServer1Accept(Sender: TObject;
      ClientSocket: TCustomIpClient);
    procedure TcpClient1Send(Sender: TObject; Buf: PAnsiChar;
      var DataLen: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TClientDataThread=class(TThread)
  private
  public
    ListBuffer:tStringList;
    TargetList:tStrings;
    Procedure SynchAddDataToControl;
    Constructor Create(CreateSuspended:Boolean);
    Procedure Execute;override;
    Procedure Terminate;
    end;
var
  Form1: TForm1;

implementation

{$R *.dfm}
Constructor TclientDataThread.Create(CreateSuspended:Boolean);
begin
  inHerited Create(CreateSuspended);
  FreeOnTerminate:=true;
  ListBuffer:=TStringList.Create;
end;

Procedure TClientDataThread.Terminate;
begin
  ListBuffer.Free;
  inherited;
end;

Procedure  TClientDataThread.Execute;
begin
  Synchronize(SynchAddDataToControl);
end;

Procedure TClientDataThread.SynchAddDataToControl;
begin
  TargetList.AddStrings(ListBuffer);
end;
procedure TForm1.FormCreate(Sender: TObject);
var
  HostName,HostIp:string;
begin
  Hostname:=TcpServer1.LookupHostName('127.0.0.1');
  HostIp:=TcpServer1.LookupHostAddr(HostName);
  StatusBar1.Panels[0].Text:='你的Ip: '+HostIP;
end;

procedure TForm1.SetButtonClick(Sender: TObject);
begin
  TcpServer1.LocalPort:=ServerPort.Text;
  TcpServer1.Active:=true;
  SendMemo.SetFocus;
end;

procedure TForm1.SendButtonClick(Sender: TObject);
var
  i:integer;
begin
  TcpClient1.RemoteHost:=ServerAddr.Text;
  TcpClient1.RemotePort:=ServerPort.Text;
  try
    if TcpClient1.Connect then
      for i:=0 to SendMemo.Lines.Count-1 do
        TcpClient1.Sendln(SendMemo.Lines[i]);
  finally
    TcpClient1.Disconnect;
  end;
  SendMemo.SetFocus;
end;

procedure TForm1.TcpServer1Accept(Sender: TObject;
  ClientSocket: TCustomIpClient);
var
 s:string;
 DataThread: TclientDataThread;
begin
 DataThread:=TclientDataThread.Create(True);
 DataThread.TargetList:=InfoMemo.Lines;
 StatusBar1.Panels[1].Text:='连接到'
                           +ClientSocket.LookupHostName(ClientSocket.RemoteHost)
                           +'('+ClientSocket.RemoteHost+')';
 DataThread.ListBuffer.Add('========begin message ========');
 s:=ClientSocket.Receiveln;
 while s<>'' do
 begin
   DataThread.ListBuffer.Add(s);
   s:=ClientSocket.Receiveln;
 end;
 DataThread.ListBuffer.Add('========end of message ========');
 DataThread.Resume;
end;

procedure TForm1.TcpClient1Send(Sender: TObject; Buf: PAnsiChar;
  var DataLen: Integer);
begin
  StatusBar1.Panels[2].Text:='发送信息' +IntToStr(DataLen)+'个字符';
end;

end.
