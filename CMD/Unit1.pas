unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IdBaseComponent, IdComponent, IdRawBase,
  IdRawClient, IdIcmpClient;

type
  TForm1 = class(TForm)
    ICMP: TIdIcmpClient;
    Bevel1: TBevel;
    Label1: TLabel;
    Edit1: TEdit;
    PingButton: TButton;
    ListBox1: TListBox;
    procedure PingButtonClick(Sender: TObject);
    procedure ICMPReply(ASender: TComponent;
      const AReplyStatus: TReplyStatus);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.PingButtonClick(Sender: TObject);
var
  i:integer;
begin
  ICMP.OnReply:=ICMPReply;
  ICMP.ReceiveTimeout:=1000;
  PingButton.Enabled:=False;
  Try
    ICMP.Host:=Edit1.Text;
    for i:=1 to 4 do
    begin
      ICMP.Ping;
      Application.ProcessMessages;
    end;
  finally
    pingButton.Enabled:=true;
  end;
end;

procedure TForm1.ICMPReply(ASender: TComponent;
  const AReplyStatus: TReplyStatus);
var
  sTime:string;
begin
  if(AReplyStatus.MsRoundTripTime=0) then
    sTime:='<1'
  else
    sTime:='=';
    listBox1.Items.Add(Format('%d byte from %s:icmp_seq=%d TTL=%dtime%s%dms',[AReplyStatus.BytesReceived,
      AReplyStatus.FromIpAddress,AReplyStatus.SequenceId,
      AreplyStatus.TimeToLive,sTime,AReplyStatus.MsRoundTripTime]));

end;

end.
