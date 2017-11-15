unit pictureTurn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    PaintBox1: TPaintBox;
    PaintBox2: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PaintBox2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
var
  b:TBitmap;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);

begin
  b:=TBitmap.Create;
  b.LoadFromFile('1.bmp');
  PaintBox1.Width:=b.Width;
  PaintBox1.Height:=b.Height;
  PaintBox2.Width:=b.Width;
  PaintBox2.Height:=b.Height;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  PaintBox1.Canvas.Draw(0,0,b);
  b.Canvas.CopyRect(Rect(PaintBox2.Width,PaintBox2.Height,0,0),
  b.Canvas,Rect(0,0,b.Width,b.Height));
  paintBox2.Canvas.CopyRect(Rect(PaintBox2.Width,0,0,PaintBox2.Height),b.Canvas,Rect(0,0,b.Width,b.Height));
end;

procedure TForm1.PaintBox2Click(Sender: TObject);
begin
  b.Canvas.CopyRect(Rect(PaintBox2.width,PaintBox2.Height,0,0),b.Canvas,Rect(0,0,b.Width,b.Height));
  PaintBox2.Canvas.CopyRect(Rect(PaintBox2.width,0,0,PaintBox2.height),b.Canvas,Rect(0,0,b.width,b.height));
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  b.Free;
end;

end.
