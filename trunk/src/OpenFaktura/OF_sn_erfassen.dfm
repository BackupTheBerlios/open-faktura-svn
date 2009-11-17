object SNErfassenForm: TSNErfassenForm
  Left = 357
  Top = 215
  Width = 442
  Height = 254
  HelpContext = 100150
  Caption = 'Seriennummern erfassen'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 179
    Width = 434
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    OnResize = Panel1Resize
    object SNAdd: TEdit
      Left = 2
      Top = 3
      Width = 159
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      OnChange = SNAddChange
      OnKeyPress = SNAddKeyPress
    end
    object SNAddBtn: TButton
      Left = 168
      Top = 3
      Width = 75
      Height = 24
      Caption = 'Hinzuf'#252'gen'
      TabOrder = 1
      OnClick = SNAddBtnClick
    end
    object CloseBtn: TBitBtn
      Left = 344
      Top = 3
      Width = 83
      Height = 24
      TabOrder = 2
      Kind = bkOK
    end
    object SNDelBtn: TBitBtn
      Left = 248
      Top = 3
      Width = 87
      Height = 24
      Caption = 'Entfernen'
      TabOrder = 3
      OnClick = SNDelBtnClick
    end
  end
  object Sb1: TStatusBar
    Left = 0
    Top = 208
    Width = 434
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 434
    Height = 179
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 2
    object SNGrid: TOFDBGrid
      Left = 3
      Top = 56
      Width = 428
      Height = 120
      Align = alClient
      DataSource = MakeEKReForm.SNDS
      DefaultDrawing = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 24
      TitleRowHeight = 24
      RowColor1 = 12255087
      RowColor2 = clWindow
      ShowTitleEllipsis = True
      DefaultRowHeight = 17
      EditColor = clBlack
      Columns = <
        item
          Expanded = False
          FieldName = 'SERNUMMER'
          ReadOnly = True
          Title.Caption = 'Seriennummer'
          Width = 454
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 3
      Top = 3
      Width = 428
      Height = 53
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 3
        Top = 2
        Width = 47
        Height = 13
        Caption = 'Artikelnr. :'
      end
      object Label2: TLabel
        Left = 3
        Top = 18
        Width = 39
        Height = 13
        Caption = 'Match : '
      end
      object ArtNr: TLabel
        Left = 55
        Top = 2
        Width = 119
        Height = 13
        AutoSize = False
        Caption = 'ArtNr'
      end
      object ArtMatch: TLabel
        Left = 55
        Top = 18
        Width = 119
        Height = 13
        AutoSize = False
        Caption = 'ArtMatch'
      end
      object ArtBez: TLabel
        Left = 184
        Top = 2
        Width = 233
        Height = 39
        AutoSize = False
        Caption = 'ArtBez'
        WordWrap = True
      end
    end
  end
end
