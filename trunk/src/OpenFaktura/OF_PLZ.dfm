object PLZForm: TPLZForm
  Left = 435
  Top = 387
  Width = 456
  Height = 289
  Caption = 'Postleitzahlen und Orte'
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
  object PLZPanel: TPanel
    Left = 0
    Top = 0
    Width = 448
    Height = 243
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
      Top = 224
      Width = 448
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
      Top = 198
      Width = 448
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
        DataSource = PLZ_DS
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
        OnKeyPress = SuchbegKeyPress
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
      Width = 448
      Height = 198
      Align = alClient
      DataSource = PLZ_DS
      DefaultDrawing = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = SuchGridDblClick
      OnKeyPress = SuchGridKeyPress
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
          Expanded = False
          FieldName = 'PLZ'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Width = 196
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VORWAHL'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BUNDESLAND'
          Visible = True
        end>
    end
  end
  object PLZ_DS: TDataSource
    DataSet = PLZQuery
    OnDataChange = PLZ_DSDataChange
    Left = 88
    Top = 72
  end
  object PLZQuery: TZQuery
    Connection = DM1.DB1
    OnNewRecord = PLZQueryNewRecord
    SQL.Strings = (
      'SELECT LAND, PLZ ,NAME ,VORWAHL , BUNDESLAND'
      'FROM PLZ'
      'ORDER BY LAND, PLZ, NAME')
    Params = <>
    Left = 152
    Top = 72
    object PLZQueryLAND: TStringField
      DisplayLabel = 'Land'
      FieldName = 'LAND'
      Required = True
      Size = 3
    end
    object PLZQueryPLZ: TStringField
      FieldName = 'PLZ'
      Size = 10
    end
    object PLZQueryNAME: TStringField
      DisplayLabel = 'Ort'
      DisplayWidth = 45
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object PLZQueryVORWAHL: TStringField
      DisplayLabel = 'Vorwahl'
      FieldName = 'VORWAHL'
      Size = 12
    end
    object PLZQueryBUNDESLAND: TStringField
      DisplayLabel = 'Bundesland'
      FieldName = 'BUNDESLAND'
      Size = 3
    end
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = SearchTimerTimer
    Left = 212
    Top = 71
  end
  object MainMenu1: TJvMainMenu
    Images = MainForm.ImageList1
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 264
    Top = 72
    object Neu1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object MnuNew: TMenuItem
        Caption = '&Neu'
        ImageIndex = 17
        ShortCut = 16462
        OnClick = MnuNewClick
      end
      object MnuDele: TMenuItem
        Caption = '&L'#246'schen'
        ImageIndex = 6
        ShortCut = 16430
        OnClick = MnuDeleClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MnuSearch: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        ShortCut = 114
        OnClick = MnuSearchClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object MnuUebernehmen: TMenuItem
        Caption = #220'bernehmen'
        ImageIndex = 22
        OnClick = SuchGridDblClick
      end
    end
    object Sortierung1: TMenuItem
      Caption = '&Sortierung'
      GroupIndex = 3
      object MnuSortPLZ: TMenuItem
        Tag = 1
        Caption = 'PLZ'
        GroupIndex = 1
        RadioItem = True
        OnClick = SortierungClick
      end
      object MnuSortName: TMenuItem
        Tag = 2
        Caption = 'Name'
        GroupIndex = 1
        RadioItem = True
        OnClick = SortierungClick
      end
      object MnuSortVorwahl: TMenuItem
        Tag = 3
        Caption = 'Vorwahl'
        GroupIndex = 1
        RadioItem = True
        OnClick = SortierungClick
      end
    end
  end
end
