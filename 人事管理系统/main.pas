unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, ToolWin, ComCtrls;

type
  TMain_Form = class(TForm)
    MainMenu1: TMainMenu;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    N1: TMenuItem;
    Print1: TMenuItem;
    PrintSetup1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;

implementation

var
  username,password :string ;
  x1,x2,x3 :boolean;
{$R *.dfm}

procedure TMain_Form.FormCreate(Sender: TObject);
begin
  username:='';
  password:='';
  x1:=false;
  x2:=false;
  x3:=false;
  //checkuserform.ShowModal();
  if username<>'' then
  begin
    if x1=true then
    begin
      n4.Enabled:=true;
      n6.Enabled:=true;
      speedbutton1.Enabled:=true;
      speedbutton3.Enabled:=true;
    end
    else
    begin
      n4.Enabled:=false;
      n6.Enabled:=false;
      speedbutton1.Enabled:=false;
      speedbutton3.Enabled:=false;
    end;
    if x2=ture then
    begin
     n2.Enabled:=true;
     speedbutton4.Enabled:=true;
    end
    else
    begin
      n2.Enabled:=false;
      speedbutton4.Enabled:=false;
    end;
    if x3=true then
    begin
      n3.Enabled:=true;
      speedbutton3.Enabled:=true;
    end
    else
    begin
      n3.Enabled:=false;
      speedbutton5.Enabled:=false;
    end;
  end
  else
    close;
  end;

end;

end.
