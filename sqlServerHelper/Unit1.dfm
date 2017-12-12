object Form1: TForm1
  Left = 125
  Top = 122
  Width = 928
  Height = 479
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
  object btConnectDB: TButton
    Left = 24
    Top = 8
    Width = 75
    Height = 25
    Caption = #36830#25509#25968#25454#24211
    TabOrder = 0
    OnClick = btConnectDBClick
  end
  object selectButton: TButton
    Left = 24
    Top = 64
    Width = 75
    Height = 25
    Caption = #26597#30475
    TabOrder = 1
    OnClick = selectButtonClick
  end
  object Edit1: TEdit
    Left = 768
    Top = 136
    Width = 145
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
  object ListView: TListView
    Left = 144
    Top = 24
    Width = 545
    Height = 361
    Columns = <>
    TabOrder = 3
  end
  object insertButton: TButton
    Left = 40
    Top = 208
    Width = 75
    Height = 25
    Caption = #25554#20837#25968#25454
    TabOrder = 4
    OnClick = insertButtonClick
  end
  object ADOConnection: TADOConnection
    AfterConnect = ADOConnectionAfterConnect
    Left = 864
    Top = 8
  end
  object ADOQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 848
    Top = 72
  end
end
