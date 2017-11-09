unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  ExtCtrls, FileCtrl;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    Panel3: TPanel;
    FilterComboBox1: TFilterComboBox;
    CheckBoxStretch: TCheckBox;
    ButtonFull: TButton;
    FileListBox1: TFileListBox;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


end.
