object Form1: TForm1
  Left = 177
  Top = 394
  Width = 928
  Height = 480
  Caption = #26816#27979#32852#32593#29366#24577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 696
    Top = 80
    Width = 50
    Height = 50
  end
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 37
    Height = 13
    Caption = #30446#30340'IP:'
  end
  object Edit1: TEdit
    Left = 120
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object PingButton: TButton
    Left = 336
    Top = 24
    Width = 75
    Height = 25
    Caption = 'PING'
    TabOrder = 1
    OnClick = PingButtonClick
  end
  object ListBox1: TListBox
    Left = 96
    Top = 112
    Width = 417
    Height = 97
    ItemHeight = 13
    TabOrder = 2
  end
  object ICMP: TIdIcmpClient
    OnReply = ICMPReply
    Left = 680
    Top = 176
  end
end
