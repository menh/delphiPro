object Form1: TForm1
  Left = 270
  Top = 159
  Width = 985
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
    Left = 16
    Top = 176
    Width = 60
    Height = 13
    Caption = #38646#28857#32842#22825#23460
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 422
    Width = 969
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 130
      end>
  end
  object SendButton: TButton
    Left = 184
    Top = 344
    Width = 75
    Height = 25
    Caption = #21457#36865
    TabOrder = 1
    OnClick = SendButtonClick
  end
  object InfoMemo: TMemo
    Left = 0
    Top = 0
    Width = 969
    Height = 89
    Align = alTop
    Color = clGreen
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object SendMemo: TMemo
    Left = 8
    Top = 216
    Width = 249
    Height = 89
    TabOrder = 3
    WordWrap = False
  end
  object GroupBox1: TGroupBox
    Left = 472
    Top = 112
    Width = 393
    Height = 273
    Caption = #35774#32622
    TabOrder = 4
    object Label2: TLabel
      Left = 40
      Top = 24
      Width = 60
      Height = 13
      Caption = #26381#21153#22120#22320#22336
    end
    object Label3: TLabel
      Left = 40
      Top = 88
      Width = 60
      Height = 13
      Caption = #26381#21153#22120#31471#21475
    end
    object Label4: TLabel
      Left = 40
      Top = 152
      Width = 48
      Height = 13
      Caption = #26412#22320#31471#21475
    end
    object ServerAddr: TEdit
      Left = 64
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '127.0.0.1'
    end
    object ServerPort: TEdit
      Left = 64
      Top = 112
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '10'
    end
    object Edit3: TEdit
      Left = 64
      Top = 184
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '10'
    end
    object SetButton: TButton
      Left = 248
      Top = 128
      Width = 75
      Height = 25
      Caption = #32842#22825#23460#35774#32622
      TabOrder = 3
      OnClick = SetButtonClick
    end
  end
  object TcpServer1: TTcpServer
    OnAccept = TcpServer1Accept
    Left = 224
    Top = 24
  end
  object TcpClient1: TTcpClient
    OnSend = TcpClient1Send
    Left = 224
    Top = 64
  end
end
