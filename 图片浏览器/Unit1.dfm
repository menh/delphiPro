object Form1: TForm1
  Left = 198
  Top = 215
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
    Height = 441
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 0
    DesignSize = (
      345
      441)
    object DriveComboBox: TDriveComboBox
      Left = 16
      Top = 8
      Width = 145
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      DirList = DirectoryListBox
      TabOrder = 0
    end
    object DirectoryListBox: TDirectoryListBox
      Left = 8
      Top = 32
      Width = 145
      Height = 265
      Anchors = [akLeft, akTop, akRight, akBottom]
      FileList = FileListBox
      ItemHeight = 16
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 345
    Top = 0
    Width = 567
    Height = 441
    Align = alClient
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Panel2'
    TabOrder = 1
    DesignSize = (
      567
      441)
    object Image: TImage
      Left = 1
      Top = 185
      Width = 565
      Height = 255
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
      object FilterComboBox: TFilterComboBox
        Left = 144
        Top = 16
        Width = 145
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        FileList = FileListBox
        Filter = 
          #25152#26377#22270#29255'|*.BMP;*.ICO;*.WMF;*.EMF;*.JPG;*.JPEG|'#20301#22270'|*.BMP|'#22270#26631'|*.ICO|'#22270#20803#25991#20214 +
          '|*.WMF|'#22686#24378#22270#20803#25991#20214'|*.EMF|JPEG'#26684#24335'|*.JPG;*.JPEG'
        TabOrder = 0
      end
      object CheckBoxStretch: TCheckBox
        Left = 336
        Top = 16
        Width = 129
        Height = 17
        Anchors = [akTop, akRight]
        Caption = #33258#21160#32553
        TabOrder = 1
        OnClick = CheckBoxStretchClick
      end
      object ButtonFull: TButton
        Left = 464
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #20840#23631#23519#30475
        TabOrder = 2
        OnClick = ButtonFullClick
      end
    end
    object FileListBox: TFileListBox
      Left = 96
      Top = 56
      Width = 145
      Height = 97
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 1
      OnChange = FileListBoxChange
    end
  end
end
