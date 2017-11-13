unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  ExtCtrls, FileCtrl;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DriveComboBox: TDriveComboBox;
    DirectoryListBox: TDirectoryListBox;
    Panel3: TPanel;
    FilterComboBox: TFilterComboBox;
    CheckBoxStretch: TCheckBox;
    ButtonFull: TButton;
    FileListBox: TFileListBox;
    Image: TImage;
    procedure FileListBoxChange(Sender: TObject);
    procedure CheckBoxStretchClick(Sender: TObject);
    procedure ButtonFullClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.FileListBoxChange(Sender: TObject);
  var
    FileExt:String;
begin
    FileExt:=UpperCase(ExtractFileExt(FileListBox.FileName));
    if (FileExt='.BMP') or (FileExt='.ICO') or (FileExt='.WMF') or (FileExt='.EMF') or (FileExt='.JPG') or (FileExt='.JPEG') then
    begin
       Image.Picture.LoadFromFile(FileListBox.FileName);
       Self.Caption:='Í¼Æ¬ä¯ÀÀÆ÷'+ExtractFileName(FileListBox.FileName)+Format('(%d*%d)',[Image.Picture.Width,Image.Picture.Height]);
       if FileExt='.ICO' then
         Self.Icon:=Image.Picture.Icon;
    end;
end;
procedure TForm1.CheckBoxStretchClick(Sender: TObject);
begin
  Image.Stretch:=CheckBoxStretch.Checked;
end;

procedure TForm1.ButtonFullClick(Sender: TObject);
var
  FullForm:TForm;
  FullImage:TImage;
  FileExt:String;
begin
  FileExt:=UpperCase(ExtractFileExt(FileListBox.FileName));
   if (FileExt='.BMP') or (FileExt='.ICO') or (FileExt='.WMF') or (FileExt='.EMF') or (FileExt='.JPG') or (FileExt='.JPEG') then
   begin
     FullForm:=TForm.Create(Self);
     FullImage:=TImage.Create(FullForm);
     FullForm.Caption:=Self.Caption;
     FullImage.Parent:=FullForm;
     FullImage.Align:=alClient;
     FullImage.Picture.LoadFromFile(FileListBox.FileName);
     FullForm.WindowState:=wsMaximized;
     FullForm.Visible:=true;
   end;
end;

end.
