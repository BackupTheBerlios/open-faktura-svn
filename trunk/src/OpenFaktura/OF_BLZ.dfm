object BLZForm: TBLZForm
  Left = 226
  Top = 391
  Width = 471
  Height = 307
  Caption = 'Bankleitzahlen'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object BLZPanel: TPanel
    Left = 0
    Top = 0
    Width = 463
    Height = 261
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object SB: TStatusBar
      Left = 0
      Top = 242
      Width = 463
      Height = 19
      Panels = <
        item
          Width = 100
        end
        item
          Width = 100
        end
        item
          Width = 50
        end>
    end
    object ToolBar1: TToolBar
      Left = 0
      Top = 216
      Width = 463
      Height = 26
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 94
      EdgeBorders = []
      Flat = True
      Images = MainForm.ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 1
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 0
        Width = 180
        Height = 22
        DataSource = BLZ_DS
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
        Flat = True
        TabOrder = 0
      end
      object ToolButton2: TToolButton
        Left = 180
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object Label25: TLabel
        Left = 188
        Top = 0
        Width = 57
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Suchbegr.'
        Layout = tlCenter
      end
      object ToolButton1: TToolButton
        Left = 245
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        Style = tbsSeparator
      end
      object Suchbeg: TEdit
        Left = 253
        Top = 0
        Width = 89
        Height = 22
        TabOrder = 1
        OnChange = SuchbegChange
      end
      object UebernBtn: TToolButton
        Left = 342
        Top = 0
        Caption = #220'ber&nehmen'
        ImageIndex = 22
        Visible = False
        OnClick = SuchGridDblClick
      end
    end
    object SuchGrid: TOFDBGrid
      Left = 0
      Top = 0
      Width = 463
      Height = 216
      Align = alClient
      BiDiMode = bdLeftToRight
      DataSource = BLZ_DS
      DefaultDrawing = False
      ParentBiDiMode = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = SuchGridDblClick
      TitleButtons = True
      OnCheckButton = SuchGridCheckButton
      OnTitleBtnClick = SuchGridTitleBtnClick
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
      DefaultRowHeight = 16
      EditColor = clBlack
      Columns = <
        item
          Expanded = False
          FieldName = 'LAND'
          Width = 30
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'BLZ'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BANK_NAME'
          Width = 317
          Visible = True
        end>
    end
  end
  object BLZ_DS: TDataSource
    DataSet = BLZQuery
    OnDataChange = BLZ_DSDataChange
    Left = 368
    Top = 40
  end
  object BLZQuery: TZQuery
    Connection = DM1.DB1
    OnNewRecord = BLZQueryNewRecord
    SQL.Strings = (
      'SELECT LAND, BLZ ,BANK_NAME'
      'FROM BLZ'
      'ORDER BY BLZ, BANK_NAME')
    Params = <>
    Left = 368
    Top = 88
    object BLZQueryLAND: TStringField
      DisplayLabel = 'Land'
      FieldName = 'LAND'
      Size = 5
    end
    object BLZQueryBLZ: TIntegerField
      FieldName = 'BLZ'
    end
    object BLZQueryBANK_NAME: TStringField
      DisplayLabel = 'Name der Bank'
      DisplayWidth = 40
      FieldName = 'BANK_NAME'
      Size = 255
    end
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = SearchTimerTimer
    Left = 372
    Top = 135
  end
  object MainMenu1: TJvMainMenu
    Images = MainForm.ImageList1
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 376
    Top = 176
    object Neu1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Neu2: TMenuItem
        Caption = '&Neu'
        ShortCut = 16462
        OnClick = Neu2Click
      end
      object Loeschen1: TMenuItem
        Caption = '&L'#246'schen'
        ShortCut = 16430
        OnClick = Loeschen1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ShortCut = 114
        OnClick = Suchen1Click
      end
    end
    object Sortierung1: TMenuItem
      Caption = '&Sortierung'
      GroupIndex = 3
      object BLZ1: TMenuItem
        Tag = 1
        Caption = 'BLZ'
        OnClick = SortierungClick
      end
      object Name1: TMenuItem
        Tag = 2
        Caption = 'Name'
        OnClick = SortierungClick
      end
    end
  end
end
