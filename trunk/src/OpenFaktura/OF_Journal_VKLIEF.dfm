object JournalVKLiefForm: TJournalVKLiefForm
  Left = 397
  Top = 358
  Width = 690
  Height = 390
  Caption = 'Journal Verkauf Lieferschein'
  Color = clBtnFace
  DragKind = dkDock
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
  object JournalPanel: TPanel
    Left = 0
    Top = 0
    Width = 682
    Height = 344
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ArtPan: TPanel
      Left = 0
      Top = 0
      Width = 682
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      TabOrder = 0
      OnResize = ArtPanResize
      object Label35: TLabel
        Left = 0
        Top = 0
        Width = 152
        Height = 23
        Align = alLeft
        Caption = '  Lieferscheinjournal   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object FilterLab: TLabel
        Left = 152
        Top = 0
        Width = 3
        Height = 23
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object DatumAW: TVolgaPeriod
        Left = 541
        Top = -1
        Width = 136
        Height = 25
        Hint = 'mit rechtem Mausklick Zeitraum ausw'#228'hlen ...'
        KindRange = ksMonth
        Year = 2001
        Month = 1
        OnChange = JahrCBChange
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
    object ToolBar2: TToolBar
      Left = 0
      Top = 318
      Width = 682
      Height = 26
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 84
      Caption = 'ToolBar1'
      DisabledImages = MainForm.ImageList1
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = MainForm.ImageList1
      List = True
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 1
      Wrapable = False
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 0
        Width = 155
        Height = 22
        DataSource = JourDS
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Flat = True
        TabOrder = 0
      end
      object ViewPosBtn: TToolButton
        Left = 155
        Top = 0
        AutoSize = True
        Caption = 'Details'
        ImageIndex = 5
        MenuItem = Positionen1
        Style = tbsCheck
      end
      object ToolButton2: TToolButton
        Left = 218
        Top = 0
        AutoSize = True
        Caption = 'Suchen'
        ImageIndex = 10
        MenuItem = Suchen1
      end
      object StornoBtn: TToolButton
        Left = 286
        Top = 0
        AutoSize = True
        Caption = 'Storno'
        ImageIndex = 6
        MenuItem = Storno1
      end
      object PrintJournalBtn: TToolButton
        Left = 348
        Top = 0
        AutoSize = True
        Caption = 'Journal'
        ImageIndex = 8
        MenuItem = Journaldrucken1
      end
      object RePrintBtn: TToolButton
        Left = 413
        Top = 0
        AutoSize = True
        Caption = 'Lieferschein'
        ImageIndex = 11
        MenuItem = Lieferscheindrucken1
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 27
      Width = 682
      Height = 291
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object DetailPan: TPanel
        Left = 0
        Top = 0
        Width = 682
        Height = 291
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 0
          Top = 145
          Width = 682
          Height = 7
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          Visible = False
        end
        object ReInfoPC: TPageControl
          Left = 0
          Top = 152
          Width = 682
          Height = 139
          ActivePage = TabSheet1
          Align = alBottom
          MultiLine = True
          TabOrder = 0
          Visible = False
          OnChange = ReInfoPCChange
          object Allgemein: TTabSheet
            Caption = 'Allgemein'
          end
          object TabSheet1: TTabSheet
            Caption = 'Positionen'
            ImageIndex = 2
            object JourPosGrid: TOFDBGrid
              Left = 0
              Top = 0
              Width = 674
              Height = 111
              Align = alClient
              DataSource = JoArtDS
              DefaultDrawing = False
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
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
              RowColor1 = clWindow
              RowColor2 = clWindow
              ShowTextEllipsis = False
              ShowTitleEllipsis = True
              RowSizingAllowed = True
              DefaultRowHeight = 28
              LinesPerRow = 2
              EditColor = clBlack
              Columns = <
                item
                  Expanded = False
                  FieldName = 'POSITION'
                  Width = 27
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ARTIKELTYP'
                  Width = 13
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ARTNUM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BARCODE'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'MATCHCODE'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'BEZEICHNUNG'
                  Title.Caption = 'Artikelbezeichnung'
                  Width = 345
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MENGE'
                  Title.Alignment = taRightJustify
                  Width = 48
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EPREIS'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'E-Preis'
                  Width = 67
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RABATT'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Rabatt'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'G_PREIS'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'G-Preis'
                  Width = 66
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Steuer'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'MwSt'
                  Width = 40
                  Visible = True
                end>
            end
          end
          object DateiTS: TTabSheet
            Caption = 'Dateien'
            ImageIndex = 2
            object DateiPan: TPanel
              Left = 0
              Top = 0
              Width = 674
              Height = 111
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
            end
          end
        end
        object JourGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 682
          Height = 145
          Align = alClient
          DataSource = JourDS
          DefaultDrawing = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = JourGridDrawColumnCell
          TitleButtons = True
          OnTitleBtnClick = JourGridTitleBtnClick
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
              FieldName = 'VLSNUM'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LDATUM'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_NUM'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CALC_NAME'
              Title.Caption = 'Name des Kunden'
              Width = 195
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'WERT_NETTO'
              Title.Alignment = taRightJustify
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KOST_NETTO'
              Title.Alignment = taRightJustify
              Width = 67
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'WAEHRUNG'
              Width = 24
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STADIUM'
              Title.Caption = '  '
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CalcStad'
              Title.Alignment = taCenter
              Width = 128
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VRENUM'
              Title.Caption = 'Re.-Nr.'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RDatum'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Projekt'
              Width = 118
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OrgNum'
              Title.Caption = 'Org.-Num.'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ERST_NAME'
              Visible = False
            end>
        end
      end
    end
  end
  object JourDS: TDataSource
    DataSet = JQuery
    OnDataChange = JourDSDataChange
    Left = 88
    Top = 120
  end
  object JQuery: TOFZQuery
    Connection = DM1.DB1
    AfterOpen = JQueryAfterScroll
    AfterScroll = JQueryAfterScroll
    OnCalcFields = JQueryCalcFields
    OFSecurity = DM1.CaoSecurity
    OFModulID = 3030
    OFSubModulID = 0
    UseRecordLock = False
    ShowLockErrors = False
    AutoReleaseLock = False
    Params = <
      item
        DataType = ftDate
        Name = 'VON'
        ParamType = ptInput
        Value = '1.1.2001'
      end
      item
        DataType = ftDate
        Name = 'BIS'
        ParamType = ptInput
        Value = '1.3.2001'
      end>
    SQL.Strings = (
      'SELECT'
      'REC_ID,ADDR_ID,VLSNUM,LDATUM,'
      'NSUMME,MSUMME,BSUMME,STADIUM,KUN_NUM,'
      'KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,'
      'WAEHRUNG,KOST_NETTO, WERT_NETTO,'
      'RDATUM AS RDATUM_ORG,VRENUM,'
      'SOLL_SKONTO, SOLL_STAGE, SOLL_NTAGE,'
      'MWST_1, MWST_2, MWST_3, Projekt, OrgNum, ERST_NAME, PRINT_FLAG'
      ''
      'FROM JOURNAL'
      ''
      'WHERE LDATUM >=:VON AND LDATUM<=:BIS'
      'AND QUELLE=2'
      ''
      'ORDER BY LDATUM')
    Left = 36
    Top = 120
    ParamData = <
      item
        DataType = ftDate
        Name = 'VON'
        ParamType = ptInput
        Value = '1.1.2001'
      end
      item
        DataType = ftDate
        Name = 'BIS'
        ParamType = ptInput
        Value = '1.3.2001'
      end>
    object JQueryREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object JQueryADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
    end
    object JQueryVLSNUM: TStringField
      DisplayLabel = 'Beleg'
      FieldName = 'VLSNUM'
    end
    object JQueryLDATUM: TDateField
      DisplayLabel = 'Datum'
      FieldName = 'LDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object JQueryNSUMME: TFloatField
      DisplayLabel = 'Netto'
      FieldName = 'NSUMME'
      DisplayFormat = ',##,##0.00'
    end
    object JQueryMSUMME: TFloatField
      DisplayLabel = 'MwSt'
      FieldName = 'MSUMME'
      DisplayFormat = ',##,##0.00'
    end
    object JQueryBSUMME: TFloatField
      DisplayLabel = 'Brutto'
      FieldName = 'BSUMME'
      DisplayFormat = ',##,##0.00'
    end
    object JQuerySTADIUM: TIntegerField
      DisplayLabel = 'S'
      DisplayWidth = 2
      FieldName = 'STADIUM'
    end
    object JQueryKUN_NUM: TStringField
      DisplayLabel = 'Kundennr.'
      FieldName = 'KUN_NUM'
    end
    object JQueryKUN_ANREDE: TStringField
      FieldName = 'KUN_ANREDE'
      Size = 40
    end
    object JQueryKUN_NAME1: TStringField
      DisplayLabel = 'Name des Kunden'
      FieldName = 'KUN_NAME1'
      Size = 40
    end
    object JQueryKUN_NAME2: TStringField
      FieldName = 'KUN_NAME2'
      Size = 40
    end
    object JQueryKUN_NAME3: TStringField
      FieldName = 'KUN_NAME3'
      Size = 40
    end
    object JQueryCALC_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_NAME'
      Size = 250
      Calculated = True
    end
    object JQueryCalcStad: TStringField
      DisplayLabel = 'Stadium'
      FieldKind = fkCalculated
      FieldName = 'CalcStad'
      Size = 30
      Calculated = True
    end
    object JQueryWAEHRUNG: TStringField
      DisplayLabel = 'W'#228'hrung'
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object JQueryMWST_1: TFloatField
      FieldName = 'MWST_1'
    end
    object JQueryMWST_2: TFloatField
      FieldName = 'MWST_2'
    end
    object JQueryMWST_3: TFloatField
      FieldName = 'MWST_3'
    end
    object JQueryVRENUM: TStringField
      DisplayLabel = 'Re.-Nr-'
      FieldName = 'VRENUM'
    end
    object JQueryRDATUM_ORG: TDateField
      FieldName = 'RDATUM_ORG'
    end
    object JQueryRDatum: TStringField
      DisplayLabel = 'Re.-Datum'
      FieldKind = fkCalculated
      FieldName = 'RDatum'
      Size = 15
      Calculated = True
    end
    object JQueryKOST_NETTO: TFloatField
      DisplayLabel = 'T-Kosten'
      FieldName = 'KOST_NETTO'
      DisplayFormat = ',##,##0.00'
    end
    object JQueryWERT_NETTO: TFloatField
      DisplayLabel = 'Warenwert'
      FieldName = 'WERT_NETTO'
      DisplayFormat = ',##,##0.00'
    end
    object JQuerySOLL_SKONTO: TFloatField
      FieldName = 'SOLL_SKONTO'
    end
    object JQuerySOLL_STAGE: TLargeintField
      FieldName = 'SOLL_STAGE'
    end
    object JQuerySOLL_NTAGE: TLargeintField
      FieldName = 'SOLL_NTAGE'
    end
    object JQueryProjekt: TStringField
      FieldName = 'Projekt'
      Size = 80
    end
    object JQueryOrgNum: TStringField
      FieldName = 'OrgNum'
    end
    object JQueryERST_NAME: TStringField
      DisplayLabel = 'erstellt von'
      FieldName = 'ERST_NAME'
    end
    object JQueryPRINT_FLAG: TBooleanField
      FieldName = 'PRINT_FLAG'
      Required = True
    end
  end
  object JoArtTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = JoArtTabCalcFields
    SQL.Strings = (
      'select '
      'REC_ID, JOURNAL_ID, ARTIKELTYP, ARTIKEL_ID, ATRNUM, '
      'VRENUM, VLSNUM, POSITION, BEZEICHNUNG, MATCHCODE, '
      'ARTNUM, BARCODE, MENGE, ME_EINHEIT, PR_EINHEIT, EPREIS, '
      'RABATT, STEUER_CODE,'
      ''
      'MENGE * EPREIS * (100-RABATT) / 100 AS G_PREIS'
      ''
      'from JOURNALPOS'
      'where JOURNAL_ID=:ID'
      'order by POSITION')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 8532
      end>
    Left = 140
    Top = 119
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 8532
      end>
    object JoArtTabREC_ID: TIntegerField
      DisplayWidth = 12
      FieldName = 'REC_ID'
      Visible = False
    end
    object JoArtTabJOURNAL_ID: TIntegerField
      DisplayWidth = 10
      FieldName = 'JOURNAL_ID'
      Visible = False
    end
    object JoArtTabARTIKELTYP: TStringField
      Alignment = taCenter
      DisplayLabel = 'T'
      DisplayWidth = 4
      FieldName = 'ARTIKELTYP'
      Visible = False
      Size = 1
    end
    object JoArtTabARTIKEL_ID: TIntegerField
      DisplayWidth = 10
      FieldName = 'ARTIKEL_ID'
      Visible = False
    end
    object JoArtTabATRNUM: TIntegerField
      DisplayLabel = 'Art.-Nr.'
      DisplayWidth = 10
      FieldName = 'ATRNUM'
      Visible = False
    end
    object JoArtTabVRENUM: TStringField
      DisplayWidth = 10
      FieldName = 'VRENUM'
      Visible = False
    end
    object JoArtTabVLSNUM: TStringField
      DisplayWidth = 10
      FieldName = 'VLSNUM'
      Visible = False
    end
    object JoArtTabPOSITION: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Pos.'
      DisplayWidth = 6
      FieldName = 'POSITION'
      DisplayFormat = '000'
    end
    object JoArtTabARTNUM: TStringField
      DisplayLabel = 'Artikelnummer'
      DisplayWidth = 13
      FieldName = 'ARTNUM'
    end
    object JoArtTabBARCODE: TStringField
      DisplayWidth = 20
      FieldName = 'BARCODE'
      Visible = False
    end
    object JoArtTabBEZEICHNUNG: TMemoField
      DisplayLabel = 'Bezeichnung'
      DisplayWidth = 61
      FieldName = 'BEZEICHNUNG'
      BlobType = ftMemo
    end
    object JoArtTabMENGE: TFloatField
      DisplayLabel = 'Menge'
      DisplayWidth = 10
      FieldName = 'MENGE'
      DisplayFormat = ',###,##0.0;,###,##0.0; '
    end
    object JoArtTabMATCHCODE: TStringField
      DisplayLabel = 'Match'
      DisplayWidth = 20
      FieldName = 'MATCHCODE'
      Visible = False
    end
    object JoArtTabME_EINHEIT: TStringField
      DisplayLabel = 'ME'
      DisplayWidth = 13
      FieldName = 'ME_EINHEIT'
      Visible = False
      Size = 10
    end
    object JoArtTabPR_EINHEIT: TFloatField
      FieldName = 'PR_EINHEIT'
    end
    object JoArtTabEPREIS: TFloatField
      CustomConstraint = ',#0.00'
      FieldName = 'EPREIS'
    end
    object JoArtTabRABATT: TFloatField
      FieldName = 'RABATT'
      DisplayFormat = '#,0.0"%"'
    end
    object JoArtTabSTEUER_CODE: TIntegerField
      FieldName = 'STEUER_CODE'
    end
    object JoArtTabG_PREIS: TFloatField
      CustomConstraint = ',#0.00'
      FieldName = 'G_PREIS'
    end
    object JoArtTabSteuer: TStringField
      FieldKind = fkCalculated
      FieldName = 'Steuer'
      Size = 10
      Calculated = True
    end
  end
  object JoArtDS: TDataSource
    DataSet = JoArtTab
    Left = 196
    Top = 119
  end
  object MainMenu1: TJvMainMenu
    Images = MainForm.ImageList1
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 344
    Top = 120
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        ShortCut = 16454
        OnClick = SuchenBtn1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Kopieren1: TMenuItem
        Caption = 'Kopieren'
        Enabled = False
        ImageIndex = 14
        ShortCut = 16459
        OnClick = Kopieren1Click
      end
      object Storno1: TMenuItem
        Caption = 'Storno'
        ImageIndex = 6
        ShortCut = 16430
        OnClick = StornoBtn1Click
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
      GroupIndex = 3
      object Belegnummer1: TMenuItem
        Tag = 1
        Caption = 'Belegnummer'
        Checked = True
        Default = True
        GroupIndex = 5
        RadioItem = True
        OnClick = Preis1Click
      end
      object Datum1: TMenuItem
        Tag = 2
        Caption = 'Datum'
        GroupIndex = 5
        RadioItem = True
        OnClick = Preis1Click
      end
      object Name1: TMenuItem
        Tag = 3
        Caption = 'Name'
        GroupIndex = 5
        RadioItem = True
        OnClick = Preis1Click
      end
      object Stadium1: TMenuItem
        Tag = 4
        Caption = 'Stadium'
        GroupIndex = 5
        RadioItem = True
        OnClick = Preis1Click
      end
      object Preis1: TMenuItem
        Tag = 5
        Caption = 'Preis'
        GroupIndex = 5
        RadioItem = True
        OnClick = Preis1Click
      end
    end
    object Drucken1: TMenuItem
      Caption = '&Drucken'
      GroupIndex = 4
      object Journaldrucken1: TMenuItem
        Caption = 'Journal'
        ImageIndex = 8
        ShortCut = 16452
        OnClick = PrintJournalBtn1Click
      end
      object Lieferscheindrucken1: TMenuItem
        Caption = 'Lieferschein'
        ImageIndex = 11
        ShortCut = 16464
        OnClick = RePrintBtn1Click
      end
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 5
      object Filter1: TMenuItem
        Caption = 'Filter'
        ImageIndex = 10
        object alleLieferscheine1: TMenuItem
          Caption = 'alle Lieferscheine'
          Checked = True
          GroupIndex = 1
          RadioItem = True
          OnClick = SetFilterClick
        end
        object nurungedruckteLieferschein1: TMenuItem
          Tag = 1
          Caption = 'nur ungedruckte Lieferschein'
          GroupIndex = 1
          RadioItem = True
          OnClick = SetFilterClick
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Positionen1: TMenuItem
        Caption = 'Details'
        ImageIndex = 5
        ShortCut = 117
        OnClick = Positionen1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        ImageIndex = 13
        ShortCut = 116
        OnClick = Aktualisieren1Click
      end
    end
  end
end
