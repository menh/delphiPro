object Form1: TForm1
  Left = 206
  Top = 213
  Width = 928
  Height = 480
  Caption = #22270#29255#27983#35272#22120
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 345
    Height = 442
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 0
    object DriveComboBox1: TDriveComboBox
      Left = 64
      Top = 104
      Width = 145
      Height = 19
      DirList = DirectoryListBox1
      TabOrder = 0
    end
    object DirectoryListBox1: TDirectoryListBox
      Left = 64
      Top = 144
      Width = 145
      Height = 97
      ItemHeight = 16
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 345
    Top = 0
    Width = 567
    Height = 442
    Align = alClient
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Panel2'
    TabOrder = 1
    DesignSize = (
      567
      442)
    object Image1: TImage
      Left = 1
      Top = 185
      Width = 565
      Height = 256
      Align = alClient
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 565
      Height = 184
      Align = alTop
      Caption = 'Panel3'
      TabOrder = 0
      DesignSize = (
        565
        184)
      object FilterComboBox1: TFilterComboBox
        Left = 144
        Top = 16
        Width = 145
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        FileList = FileListBox1
        Filter = 
          #25152#26377#22270#29255'|*.BMP;*.ICO;*.WMF;*.EMF;*.JPG;*.JPEG|'#20301#22270'|*.BMP|'#22270#26631'|*.ICO|'#22270#20803#25991#20214 +
          '|*.WMF|'#22686#24378#22270#20803#25991#20214'|*.EMF|JPEG'#26684#24335'|*.JPG;*.JPEG'
        TabOrder = 0
      end
      object CheckBoxStretch: TCheckBox
        Left = 360
        Top = 8
        Width = 97
        Height = 17
        Anchors = [akTop, akRight]
        Caption = #33258#21160#32553
        TabOrder = 1
      end
      object ButtonFull: TButton
        Left = 464
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #20840#23631#23519#30475
        TabOrder = 2
      end
    end
    object FileListBox1: TFileListBox
      Left = 168
      Top = 56
      Width = 145
      Height = 97
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 1
    end
  end
end
