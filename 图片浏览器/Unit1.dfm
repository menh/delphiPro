object Form1: TForm1
  Left = 153
  Top = 228
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
  object Button1: TButton
    Left = 320
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 345
    Height = 441
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 1
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
    Height = 441
    Align = alClient
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Panel2'
    TabOrder = 2
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 565
      Height = 41
      Align = alTop
      Caption = 'Panel3'
      TabOrder = 0
      DesignSize = (
        565
        41)
      object FilterComboBox1: TFilterComboBox
        Left = 144
        Top = 16
        Width = 145
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Filter = 
          #25152#26377#22270#29255'|*.BMP;*.ICO;*.WMF;*.EMF;*.JPG;*.JPEG|'#20301#22270'|*.BMP|'#22270#26631'|*.ICO|'#22270#20803#25991#20214 +
          '|*.WMF|'#22686#24378#22270#20803#25991#20214'|*.EMF|JPEG'#26684#24335'|*.JPG;*.JPEG'
        TabOrder = 0
      end
    end
  end
end
