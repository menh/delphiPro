object Form1: TForm1
  Left = 266
  Top = 228
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
  object DBGrid1: TDBGrid
    Left = 544
    Top = 88
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 136
    Top = 80
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 'FILE NAME=F:\gitPro\delphiPro\udlConnectDB\adoDB.udl;'
    CursorLocation = clUseServer
    DefaultDatabase = 'MHTest'
    LoginPrompt = False
    Provider = 'F:\gitPro\delphiPro\udlConnectDB\adoDB.udl'
    Left = 192
    Top = 80
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT name FROM [country]')
    Left = 248
    Top = 80
  end
end
