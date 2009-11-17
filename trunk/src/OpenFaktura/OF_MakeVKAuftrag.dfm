object MakeVKAuftragForm: TMakeVKAuftragForm
  Left = 222
  Top = 107
  Width = 696
  Height = 480
  Caption = 'MakeVKAuftragForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object RePanel: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 434
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
  object MainMenu1: TJvMainMenu
    Left = 88
    Top = 88
    object Dummy1: TMenuItem
      Caption = '&Dummy'
      GroupIndex = 3
    end
  end
end
