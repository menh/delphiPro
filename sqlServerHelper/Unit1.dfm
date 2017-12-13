object Form1: TForm1
  Left = 646
  Top = 448
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
    Left = 8
    Top = 256
    Width = 75
    Height = 25
    Caption = #36830#25509#25968#25454#24211
    TabOrder = 0
    OnClick = btConnectDBClick
  end
  object selectButton: TButton
    Left = 8
    Top = 288
    Width = 75
    Height = 25
    Caption = #26597#30475
    TabOrder = 1
    OnClick = selectButtonClick
  end
  object TableName: TEdit
    Left = 168
    Top = 8
    Width = 145
    Height = 21
    TabOrder = 2
    Text = 'USER_LOG'
  end
  object ListView: TListView
    Left = 168
    Top = 40
    Width = 800
    Height = 500
    Checkboxes = True
    Columns = <>
    MultiSelect = True
    RowSelect = True
    TabOrder = 3
  end
  object insertButton: TButton
    Left = 8
    Top = 320
    Width = 75
    Height = 25
    Caption = #25554#20837#25968#25454
    TabOrder = 4
    OnClick = insertButtonClick
  end
  object UpdateButton: TButton
    Left = 24
    Top = 360
    Width = 75
    Height = 25
    Caption = #26356#26032
    TabOrder = 5
    OnClick = UpdateButtonClick
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
