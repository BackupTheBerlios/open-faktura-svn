object KassenBuchForm: TKassenBuchForm
  Left = 457
  Top = 239
  Width = 682
  Height = 490
  Caption = 'Kassenbuch'
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
    Width = 674
    Height = 444
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 0
      Top = 418
      Width = 674
      Height = 26
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 96
      Caption = 'ToolBar1'
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = MainForm.ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 0
      Wrapable = False
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 0
        Width = 177
        Height = 22
        DataSource = KasBuchDS
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
        Align = alLeft
        Flat = True
        TabOrder = 0
      end
      object ToolButton2: TToolButton
        Left = 177
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 12
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 185
        Top = 0
        AutoSize = True
        Caption = 'Suchen'
        ImageIndex = 10
        MenuItem = Suchen1
      end
      object ToolButton4: TToolButton
        Left = 253
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 13
        Style = tbsSeparator
      end
      object StornoBtn: TToolButton
        Left = 261
        Top = 0
        AutoSize = True
        Caption = 'Storno'
        ImageIndex = 6
        MenuItem = Storno1
      end
      object ToolButton3: TToolButton
        Left = 323
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 12
        Style = tbsSeparator
      end
      object ManBuchBtn: TToolButton
        Left = 331
        Top = 0
        AutoSize = True
        Caption = 'man. Buchung'
        ImageIndex = 12
        MenuItem = ManuelleBuchung1
      end
      object ToolButton5: TToolButton
        Left = 431
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 12
        Style = tbsSeparator
      end
      object PrintJournalBtn: TToolButton
        Left = 439
        Top = 0
        AutoSize = True
        Caption = 'Kassenbuch'
        ImageIndex = 11
        MenuItem = Kassenbuchdrucken1
      end
    end
    object SumPan: TPanel
      Left = 0
      Top = 394
      Width = 674
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      BorderWidth = 2
      TabOrder = 1
      object Label1: TLabel
        Left = 449
        Top = 2
        Width = 56
        Height = 20
        Align = alRight
        Caption = '  Endsaldo  '
        Layout = tlCenter
      end
      object Label3: TLabel
        Left = 223
        Top = 2
        Width = 59
        Height = 20
        Align = alRight
        Caption = '  Startsaldo  '
        Layout = tlCenter
      end
      object Panel1: TPanel
        Left = 505
        Top = 2
        Width = 167
        Height = 20
        Align = alRight
        BevelOuter = bvLowered
        TabOrder = 0
        object WaehrungLab1: TLabel
          Left = 143
          Top = 1
          Width = 23
          Height = 18
          Align = alRight
          Alignment = taCenter
          AutoSize = False
          Caption = 'DM'
          Layout = tlCenter
        end
        object EndDatum: TLabel
          Left = 1
          Top = 1
          Width = 48
          Height = 18
          Align = alLeft
          Caption = 'Enddatum'
          Layout = tlCenter
        end
        object EndSaldo: TLabel
          Left = 97
          Top = 1
          Width = 46
          Height = 18
          Align = alRight
          Caption = 'EndSaldo'
          Layout = tlCenter
        end
      end
      object Panel2: TPanel
        Left = 282
        Top = 2
        Width = 167
        Height = 20
        Align = alRight
        BevelOuter = bvLowered
        TabOrder = 1
        object WaehrungLab2: TLabel
          Left = 143
          Top = 1
          Width = 23
          Height = 18
          Align = alRight
          Alignment = taCenter
          AutoSize = False
          Caption = 'DM'
          Layout = tlCenter
        end
        object StartSaldo: TLabel
          Left = 94
          Top = 1
          Width = 49
          Height = 18
          Align = alRight
          Caption = 'StartSaldo'
          Layout = tlCenter
        end
        object StartDatum: TLabel
          Left = 1
          Top = 1
          Width = 51
          Height = 18
          Align = alLeft
          Caption = 'Startdatum'
          Layout = tlCenter
        end
      end
    end
    object KasBuchGrid: TOFDBGrid
      Left = 0
      Top = 27
      Width = 674
      Height = 367
      Align = alClient
      BorderStyle = bsNone
      DataSource = KasBuchDS
      DefaultDrawing = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = KasBuchGridKeyDown
      ClearSelection = False
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 24
      TitleRowHeight = 24
      RowColor1 = 12255087
      RowColor2 = clWindow
      ShowTextEllipsis = False
      ShowTitleEllipsis = True
      MultiLineRows = True
      DefaultRowHeight = 32
      LinesPerRow = 2
      EditColor = clWindow
      Columns = <
        item
          Expanded = False
          FieldName = 'BDATUM'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QuelleStr'
          ReadOnly = True
          Title.Caption = 'Quelle'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BELEGNUM'
          ReadOnly = True
          Title.Caption = 'Beleg'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZU_ABGANG'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BTXT'
          Width = 266
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SKONTO'
          ReadOnly = True
          Title.Caption = 'Skonto'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GKONTO'
          ReadOnly = True
          Title.Caption = 'G-Kto'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ERSTELLT'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ERST_NAME'
          Visible = False
        end>
    end
    object TopPan: TPanel
      Left = 0
      Top = 0
      Width = 674
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      TabOrder = 3
      OnResize = TopPanResize
      object Label35: TLabel
        Left = 0
        Top = 0
        Width = 93
        Height = 23
        Align = alLeft
        Caption = '  Kassenbuch'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object DatumAW: TVolgaPeriod
        Left = 533
        Top = -1
        Width = 136
        Height = 25
        Hint = 'mit rechtem Mausklick Zeitraum ausw'#228'hlen ...'
        KindRange = ksMonth
        Year = 2001
        Month = 1
        OnChange = DatumAWChange
        ButtonWidth = 17
        Color = clBtnShadow
        EnablePopup = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
      end
    end
  end
  object KasBuch: TOFZQuery
    Connection = DM1.DB1
    AfterOpen = KasBuchAfterOpen
    OnCalcFields = KasBuchCalcFields
    BeforePost = KasBuchBeforePost
    AfterPost = KasBuchAfterOpen
    AfterDelete = KasBuchAfterOpen
    OFSecurity = DM1.CaoSecurity
    OFModulID = 4010
    OFSubModulID = 0
    UseRecordLock = False
    ShowLockErrors = False
    AutoReleaseLock = False
    Params = <
      item
        DataType = ftDate
        Name = 'VDAT'
        ParamType = ptInput
        Value = 37258d
      end
      item
        DataType = ftDate
        Name = 'BDAT'
        ParamType = ptInput
        Value = 37289d
      end>
    SQL.Strings = (
      'select * from FIBU_KASSE'
      'where BDATUM >=:VDAT and BDATUM <=:BDAT'
      'order by BDATUM')
    Left = 120
    Top = 194
    ParamData = <
      item
        DataType = ftDate
        Name = 'VDAT'
        ParamType = ptInput
        Value = 37258d
      end
      item
        DataType = ftDate
        Name = 'BDAT'
        ParamType = ptInput
        Value = 37289d
      end>
    object KasBuchREC_ID: TIntegerField
      FieldName = 'REC_ID'
      Visible = False
    end
    object KasBuchBDATUM: TDateField
      DisplayLabel = 'Datum'
      DisplayWidth = 15
      FieldName = 'BDATUM'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object KasBuchQUELLE: TIntegerField
      DisplayWidth = 15
      FieldName = 'QUELLE'
      Required = True
    end
    object KasBuchJOURNAL_ID: TIntegerField
      DisplayWidth = 18
      FieldName = 'JOURNAL_ID'
    end
    object KasBuchZU_ABGANG: TFloatField
      DisplayLabel = 'Zu- / Abgang'
      DisplayWidth = 17
      FieldName = 'ZU_ABGANG'
      Required = True
      DisplayFormat = ',###,##0.00;-,###,##0.00;-'
      EditFormat = '0.00'
    end
    object KasBuchBTXT: TMemoField
      DisplayLabel = 'Buchungstext'
      DisplayWidth = 48
      FieldName = 'BTXT'
      BlobType = ftMemo
    end
    object KasBuchBELEGNUM: TStringField
      FieldName = 'BELEGNUM'
    end
    object KasBuchGKONTO: TIntegerField
      FieldName = 'GKONTO'
      DisplayFormat = '0;-;-'
    end
    object KasBuchSKONTO: TFloatField
      FieldName = 'SKONTO'
      DisplayFormat = '0.0%;-0.0%; '
    end
    object KasBuchQuelleStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'QuelleStr'
      Calculated = True
    end
    object KasBuchERSTELLT: TDateField
      DisplayLabel = 'erstellt'
      FieldName = 'ERSTELLT'
      ReadOnly = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object KasBuchERST_NAME: TStringField
      DisplayLabel = 'erstellt von'
      FieldName = 'ERST_NAME'
      ReadOnly = True
    end
    object KasBuchMA_ID: TIntegerField
      FieldName = 'MA_ID'
      Visible = False
    end
  end
  object KasBuchDS: TDataSource
    DataSet = KasBuch
    Left = 192
    Top = 194
  end
  object StartSaldoTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select sum(ZU_ABGANG) as SALDO, min(BDATUM) as DATUM'
      'from FIBU_KASSE'
      'where YEAR(BDATUM)=:JAHR and BDATUM < :VDAT')
    Params = <
      item
        DataType = ftInteger
        Name = 'JAHR'
        ParamType = ptInput
        Value = 2002
      end
      item
        DataType = ftDate
        Name = 'VDAT'
        ParamType = ptInput
        Value = 37258d
      end>
    Left = 120
    Top = 258
    ParamData = <
      item
        DataType = ftInteger
        Name = 'JAHR'
        ParamType = ptInput
        Value = 2002
      end
      item
        DataType = ftDate
        Name = 'VDAT'
        ParamType = ptInput
        Value = 37258d
      end>
    object StartSaldoTabSALDO: TFloatField
      FieldName = 'SALDO'
      DisplayFormat = ',###,##0.00'
    end
    object StartSaldoTabDATUM: TDateField
      FieldName = 'DATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
  end
  object EndSaldoTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select sum(ZU_ABGANG) as SALDO, max(BDATUM) as DATUM'
      'from FIBU_KASSE'
      'where YEAR(BDATUM)=:JAHR and BDATUM <= :BDAT')
    Params = <
      item
        DataType = ftInteger
        Name = 'JAHR'
        ParamType = ptInput
        Value = 2002
      end
      item
        DataType = ftDate
        Name = 'BDAT'
        ParamType = ptInput
        Value = 37258d
      end>
    Left = 192
    Top = 258
    ParamData = <
      item
        DataType = ftInteger
        Name = 'JAHR'
        ParamType = ptInput
        Value = 2002
      end
      item
        DataType = ftDate
        Name = 'BDAT'
        ParamType = ptInput
        Value = 37258d
      end>
    object EndSaldoTabSaldo: TFloatField
      FieldName = 'SALDO'
      DisplayFormat = ',###,##0.00'
    end
    object EndSaldoTabDATUM: TDateField
      FieldName = 'DATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
  end
  object MainMenu1: TJvMainMenu
    Images = MainForm.ImageList1
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 260
    Top = 194
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        ShortCut = 16454
        OnClick = Suchen1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Anfangsbestand1: TMenuItem
        Caption = 'Anfangsbestand'
        Enabled = False
        ImageIndex = 31
        OnClick = Anfangsbestand1Click
      end
      object ManuelleBuchung1: TMenuItem
        Caption = 'man. Buchung'
        ImageIndex = 12
        ShortCut = 16461
        OnClick = ManBuchBtnClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Storno1: TMenuItem
        Caption = 'Storno'
        ImageIndex = 6
        ShortCut = 16430
        OnClick = Storno1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object SichtbareSpalten1: TMenuItem
        Caption = 'Sichtbare Spalten'
        ImageIndex = 15
        OnClick = SichtbareSpalten1Click
      end
      object Layoutspeichern1: TMenuItem
        Caption = 'Layout speichern'
        ImageIndex = 16
        OnClick = Layoutspeichern1Click
      end
    end
    object Sortierung1: TMenuItem
      Caption = '&Sortierung'
      Enabled = False
      GroupIndex = 3
      object Belegnummer1: TMenuItem
        Tag = 1
        Caption = 'Belegnummer'
        Checked = True
        Default = True
        GroupIndex = 5
        RadioItem = True
      end
      object Datum1: TMenuItem
        Tag = 2
        Caption = 'Datum'
        GroupIndex = 5
        RadioItem = True
      end
      object Name1: TMenuItem
        Tag = 3
        Caption = 'Name'
        GroupIndex = 5
        RadioItem = True
      end
      object Stadium1: TMenuItem
        Tag = 4
        Caption = 'Stadium'
        GroupIndex = 5
        RadioItem = True
      end
      object Preis1: TMenuItem
        Tag = 5
        Caption = 'Preis'
        GroupIndex = 5
        RadioItem = True
      end
    end
    object Drucken1: TMenuItem
      Caption = '&Drucken'
      GroupIndex = 4
      object Kassenbuchdrucken1: TMenuItem
        Caption = 'Kassenbuch'
        ImageIndex = 11
        ShortCut = 16464
        OnClick = Kassenbuchdrucken1Click
      end
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 5
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        ImageIndex = 13
        ShortCut = 116
        OnClick = Aktualisieren1Click
      end
    end
  end
  object FindDialog1: TFindDialog
    Options = [frDown, frHideWholeWord, frWholeWord]
    OnFind = FindDialog1Find
    Left = 260
    Top = 257
  end
end
