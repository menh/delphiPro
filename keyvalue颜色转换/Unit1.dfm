object Form1: TForm1
  Left = 192
  Top = 131
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 56
    Width = 185
    Height = 49
    Caption = 'Label1'
  end
  object ListView1: TListView
    Left = 48
    Top = 128
    Width = 250
    Height = 150
    Columns = <>
    TabOrder = 0
  end
  object ValueListEditor1: TValueListEditor
    Left = 448
    Top = 80
    Width = 306
    Height = 300
    TabOrder = 1
    OnDrawCell = ValueListEditor1DrawCell
  end
end
