object Form1: TForm1
  Left = 79
  Top = 574
  Width = 928
  Height = 480
  Caption = 'Form1'
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
    Left = 216
    Top = 8
    Width = 75
    Height = 25
    Caption = #27983#35272#22270#20687
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 512
    Top = 8
    Width = 75
    Height = 25
    Caption = #26684#24335#36716#25442
    Enabled = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Panel1: TPanel
    Left = 216
    Top = 40
    Width = 377
    Height = 369
    Caption = 'Panel1'
    TabOrder = 2
    object Image1: TImage
      Left = 0
      Top = -8
      Width = 401
      Height = 377
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = #20301#22270#25991#20214'|*.bmp|JPEG'#25991#20214'|*.jpg|'#25991#20214#26684#24335'|*.bmp*.jpg'
    Left = 16
    Top = 16
  end
  object SaveDialog1: TSaveDialog
    Filter = #20301#22270#25991#20214'|*.bmp|JPEG'#25991#20214'|*.jpg'
    Left = 72
    Top = 16
  end
end
