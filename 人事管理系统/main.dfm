object Main_Form: TMain_Form
  Left = 244
  Top = 129
  Width = 617
  Height = 480
  Caption = #20154#20107#31649#29702#31995#32479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormCreate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 601
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 2
      Width = 23
      Height = 22
      Hint = #29992#25143#31649#29702
      ParentShowHint = False
      ShowHint = True
    end
    object SpeedButton2: TSpeedButton
      Left = 23
      Top = 2
      Width = 23
      Height = 22
      Hint = #20462#25913#23494#30721
      ParentShowHint = False
      ShowHint = True
    end
    object SpeedButton3: TSpeedButton
      Left = 46
      Top = 2
      Width = 23
      Height = 22
      Hint = #21021#22987#21270
      ParentShowHint = False
      ShowHint = True
    end
    object SpeedButton4: TSpeedButton
      Left = 69
      Top = 2
      Width = 23
      Height = 22
      Hint = #20154#20107#31649#29702
      ParentShowHint = False
      ShowHint = True
    end
    object SpeedButton5: TSpeedButton
      Left = 92
      Top = 2
      Width = 23
      Height = 22
      Hint = #20449#24687#26597#35810
      ParentShowHint = False
      ShowHint = True
    end
    object SpeedButton6: TSpeedButton
      Left = 115
      Top = 2
      Width = 23
      Height = 22
      Hint = #36864#20986
      ParentShowHint = False
      ShowHint = True
    end
  end
  object MainMenu1: TMainMenu
    Left = 40
    Top = 56
    object File1: TMenuItem
      Caption = '&File'
      object New1: TMenuItem
        Caption = '&New'
      end
      object Open1: TMenuItem
        Caption = '&Open'
      end
      object Save1: TMenuItem
        Caption = '&Save'
      end
      object SaveAs1: TMenuItem
        Caption = 'Save &As'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Print1: TMenuItem
        Caption = '&Print'
      end
      object PrintSetup1: TMenuItem
        Caption = 'Print Set&up'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'E&xit'
      end
    end
  end
end
