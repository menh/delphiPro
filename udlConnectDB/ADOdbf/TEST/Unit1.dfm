object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 536
  ClientWidth = 914
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    914
    536)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 24
    Top = 104
    Width = 873
    Height = 424
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = #25171#24320
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 816
    Top = 8
    Width = 75
    Height = 25
    Caption = #26597#35810
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 39
    Width = 705
    Height = 49
    TabOrder = 3
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 136
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 472
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Edit2'
  end
  object OpenDialog1: TOpenDialog
    Filter = #25991#20214'(*.DBF)|*.DBF'
    Left = 736
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 808
    Top = 152
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 824
    Top = 104
  end
end
