unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,Jpeg;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
begin
  if OpenDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenDialog1.FileName);
    Button2.Enabled:=True;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Jpeg:TJpegImage;
  Bitmap:TBitmap;
  ExtendName:string;
begin
  ExtendName:=ExtractFileExt(OpenDialog1.FileName);
  if ExtendName='.bmp' then
  begin
    Jpeg:=TJPEGImage.Create;
    Jpeg.assign(Image1.Picture.Bitmap);
    SaveDialog1.DefaultExt:='.jpg';
    if SaveDialog1.Execute then
      Jpeg.savetofile(SaveDialog1.FileName);
      Jpeg.Free;
    end
    else
    begin
      Bitmap:=TBitmap.Create;
      Bitmap.assign(Image1.Picture.Graphic);
      SaveDialog1.DefaultExt:='.bmp';
      if saveDialog1.Execute then
        Bitmap.savetofile(SaveDialog1.fileName);
      Bitmap.Free;
    end;
    Button2.Enabled:=False;
end;
end.
