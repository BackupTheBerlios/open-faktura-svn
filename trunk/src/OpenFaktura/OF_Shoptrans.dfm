object ShopTransForm: TShopTransForm
  Left = 392
  Top = 504
  Width = 696
  Height = 480
  Caption = 'Shoptransfer'
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
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 434
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 56
      Top = 40
      Width = 289
      Height = 193
      ActivePage = HerstellerTS
      TabOrder = 0
      object ArtikelTS: TTabSheet
        Caption = 'ArtikelTS'
      end
      object BestellTS: TTabSheet
        Caption = 'BestellTS'
        ImageIndex = 1
      end
      object UpdateTS: TTabSheet
        Caption = 'UpdateTS'
        ImageIndex = 2
      end
      object KatTS: TTabSheet
        Caption = 'KatTS'
        ImageIndex = 3
      end
      object HerstellerTS: TTabSheet
        Caption = 'HerstellerTS'
        ImageIndex = 4
      end
    end
  end
  object MainMenu1: TJvMainMenu
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 88
    Top = 88
    object Dummy1: TMenuItem
      Caption = '&Dummy'
      GroupIndex = 3
    end
  end
end
