object Form1: TForm1
  Left = 72
  Top = 218
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 160
    Top = 0
    Width = 361
    Height = 433
  end
  object PaintBox2: TPaintBox
    Left = 520
    Top = 0
    Width = 385
    Height = 433
    OnClick = PaintBox2Click
  end
  object Button1: TButton
    Left = 80
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
end
