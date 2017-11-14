unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
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
  x,l:Integer;
  y,a:Double;
begin
   Image1.Picture.Bitmap:=TBitmap.Create;
   Image1.Picture.Bitmap.Width:=Image1.Width;
   Image1.Picture.Bitmap.Height:=Image1.Height;
   l:=Image1.Picture.Width;
   for x:=0 to l do
   begin
     a:=(x/l)*2*Pi;
     y:=cos(a);
     y:=y*(Image1.Picture.Bitmap.Height/2);
     y:=y+(Image1.Picture.Bitmap.Height/2);
     Image1.Picture.Bitmap.Canvas.Brush.Style:=bsSolid;
     Image1.Picture.Bitmap.Canvas.Pixels[Trunc(x),Trunc(y)]:=clred;
   end;
end;

end.
