unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ImgList, ComCtrls, ExtCtrls, ToolWin,
  StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    WebBrowser1: TWebBrowser;
    backButton: TToolButton;
    forwordButton: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    homeButton: TToolButton;
    Label1: TLabel;
    Edit1: TEdit;
    gotoButton: TBitBtn;
    procedure gotoButtonClick(Sender: TObject);
    procedure WebBrowser1DownloadBegin(Sender: TObject);
    procedure WebBrowser1DownloadComplete(Sender: TObject);
    procedure backButtonClick(Sender: TObject);
    procedure forwordButtonClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure homeButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.gotoButtonClick(Sender: TObject);
begin
  WebBrowser1.Navigate(Edit1.Text);
end;


procedure TForm1.WebBrowser1DownloadBegin(Sender: TObject);
begin
  Form1.Caption:=Edit1.Text+'...';
  StatusBar1.SimpleText:='正在连接地址: '+Edit1.Text;
end;

procedure TForm1.WebBrowser1DownloadComplete(Sender: TObject);
begin
  Form1.Caption:=WebBrowser1.LocationURL;
  StatusBar1.SimpleText:='完成'+WebBrowser1.LocationURL;
end;

procedure TForm1.backButtonClick(Sender: TObject);
begin
  try
    WebBrowser1.GoBack;
  except
    showMessage('已经到达最早的历史纪录');
  exit;
  end;
end;

procedure TForm1.forwordButtonClick(Sender: TObject);
begin
   try
     WebBrowser1.GoForward;
   except
     showMessage('已经达到最新历史纪录');
     exit;
   end;
end;

procedure TForm1.ToolButton4Click(Sender: TObject);
begin
  WebBrowser1.Stop;
end;

procedure TForm1.ToolButton5Click(Sender: TObject);
begin
  WebBrowser1.Refresh;
end;

procedure TForm1.homeButtonClick(Sender: TObject);
begin
  WebBrowser1.GoHome;
  Edit1.Text:='about:blank';
end;

end.
