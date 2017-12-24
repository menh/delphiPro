object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 595
  ClientWidth = 837
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    837
    595)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 32
    Top = 183
    Width = 129
    Height = 25
    Caption = 'Insert Billmodal1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 577
    Height = 169
    Anchors = [akLeft, akTop, akRight, akBottom]
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 1
  end
  object Button2: TButton
    Left = 224
    Top = 183
    Width = 75
    Height = 25
    Caption = #23548#20837
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 582
    Top = 183
    Width = 75
    Height = 25
    Caption = 'Insert EtoC'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 679
    Top = 183
    Width = 90
    Height = 25
    Caption = 'select Provider'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 32
    Top = 214
    Width = 513
    Height = 21
    TabOrder = 5
    Text = 
      'select in_InVerify_M.ProviderName ,set_ProductType.TypeName,roun' +
      'd(avg(run_QualityScoreStd_Score.Score),2) IQ  FROM  in_InVerify_' +
      'M  RIGHT JOIN run_QualityScoreStd_Score on run_QualityScoreStd_S' +
      'core.ScoreKey = in_InVerify_M.VerifyResult   left join set_Produ' +
      'ctData on in_InVerify_M.ProductNo=set_ProductData.ProductNo and ' +
      'in_InVerify_M.ProductName=set_ProductData.ProductName   LEFT JOI' +
      'N set_ProductType on set_ProductData.ProductType=set_ProductType' +
      '.TypeID  where run_QualityScoreStd_Score.QualityKey = '#39'10'#39' and r' +
      'un_QualityScoreStd_Score.ItemKey='#39'2'#39' and in_InVerify_M.VerifyDat' +
      'e > '#39'2014-1-1'#39' and in_InVerify_M.VerifyDate <'#39'2014-2-1'#39'  and in_' +
      'InVerify_M.ProviderName='#39#40300#27888#33184#31896#21137#39'  GROUP BY in_InVerify_M.Provider' +
      'Name,set_ProductType.TypeName '
  end
  object Button5: TButton
    Left = 424
    Top = 183
    Width = 75
    Height = 25
    Caption = #23548#20986
    TabOrder = 6
    OnClick = Button5Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 241
    Width = 793
    Height = 328
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button6: TButton
    Left = 694
    Top = 214
    Width = 75
    Height = 25
    Caption = 'select SPC'
    TabOrder = 8
    OnClick = Button6Click
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=MSDASQL.1;Password=1234;Persist Security Info=True;User' +
      ' ID=root;Extended Properties="Driver=MySQL ODBC 5.1 Driver;SERVE' +
      'R=localhost;UID=root;PWD=1234;DATABASE=bill;PORT=3306";Initial C' +
      'atalog=bill'
    Parameters = <>
    Left = 80
    Top = 72
  end
  object ADOQuery2: TADOQuery
    ConnectionString = 
      'Provider=MSDASQL.1;Password=it12345678;Persist Security Info=Tru' +
      'e;User ID=root;Extended Properties="Driver=MySQL ODBC 5.1 Driver' +
      ';SERVER=192.168.168.239;UID=root;PWD=it12345678;DATABASE=QAMS;PO' +
      'RT=3306"'
    Parameters = <>
    Left = 112
    Top = 40
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 752
    Top = 72
  end
  object ADOScore: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koide1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=SPC2012;Data Source=192.168.169.191'
    CursorType = ctStatic
    Parameters = <>
    Left = 688
    Top = 80
  end
  object ADOSPC: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koide1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=SPC2012;Data Source=192.168.169.191'
    CursorType = ctStatic
    Parameters = <>
    Left = 712
    Top = 312
  end
  object DataSource1: TDataSource
    DataSet = ADOSPC
    Left = 728
    Top = 408
  end
end
