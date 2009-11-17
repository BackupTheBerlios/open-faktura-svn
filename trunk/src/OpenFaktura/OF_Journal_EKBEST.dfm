object JournalEKBestForm: TJournalEKBestForm
  Left = 406
  Top = 247
  Width = 690
  Height = 564
  Caption = 'Journal Einkauf Bestellung'
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
    Height = 518
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
        Width = 190
        Height = 23
        Align = alLeft
        Caption = '  EK-Bestellungen Journal   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object FilterLab: TLabel
        Left = 190
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
        Left = 317
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
      Top = 492
      Width = 682
      Height = 26
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 118
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
      object ToolButton1: TToolButton
        Left = 348
        Top = 0
        AutoSize = True
        Caption = 'In Einkauf wandeln'
        ImageIndex = 14
        MenuItem = InEinkaufwandeln1
      end
      object PrintJournalBtn: TToolButton
        Left = 470
        Top = 0
        AutoSize = True
        Caption = 'Journal'
        ImageIndex = 8
        MenuItem = Journaldrucken1
      end
      object EKBestPrintBtn: TToolButton
        Left = 535
        Top = 0
        AutoSize = True
        Caption = 'Bestellung'
        ImageIndex = 11
        MenuItem = EKBestellungdrucken1
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 27
      Width = 682
      Height = 465
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object DetailPan: TPanel
        Left = 0
        Top = 0
        Width = 682
        Height = 465
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 0
          Top = 319
          Width = 682
          Height = 7
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          Visible = False
        end
        object ReInfoPC: TPageControl
          Left = 0
          Top = 326
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
              DefaultRowHeight = 32
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
                  Width = 280
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
                  FieldName = 'MENGE_EK'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EPREIS'
                  Title.Alignment = taRightJustify
                  Width = 67
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RABATT'
                  Title.Alignment = taRightJustify
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'G_PREIS'
                  Title.Alignment = taRightJustify
                  Width = 66
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Steuer'
                  Title.Alignment = taRightJustify
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
          Height = 319
          Align = alClient
          DataSource = JourDS
          DefaultDrawing = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          PopupMenu = PopupMenu1
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = JourGridDrawColumnCell
          OnKeyDown = JourGridKeyDown
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
          OnApplyCellAttribute = JourGridApplyCellAttribute
          Columns = <
            item
              Expanded = False
              FieldName = 'VRENUM'
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RDATUM'
              Width = 42
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
              Title.Caption = 'Name des Lieferanten'
              Width = 192
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NSUMME'
              Title.Alignment = taRightJustify
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MSUMME_1'
              Title.Caption = 'MwSt 1'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'MSUMME_2'
              Title.Caption = 'MwSt 2'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'MSUMME'
              Title.Alignment = taRightJustify
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BSUMME'
              Title.Alignment = taRightJustify
              Width = 74
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'WAEHRUNG'
              Width = 26
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CalcStad'
              Title.Alignment = taCenter
              Width = 111
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Kondit'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROJEKT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORGNUM'
              Title.Caption = 'Ref.-Nummer'
              Width = 108
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LTERMIN'
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
    OFModulID = 3110
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
      'REC_ID,ADDR_ID,VRENUM,RDATUM,'
      
        'NSUMME,MSUMME_0, MSUMME_1, MSUMME_2, MSUMME_3, MSUMME,BSUMME,STA' +
        'DIUM,KUN_NUM,'
      
        'KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,PROJEKT,ORGNUM,GEGENKON' +
        'TO,WAEHRUNG,'
      'LDATUM AS LTERMIN, ATRNUM as KUNLIEF_ID, '
      'SOLL_SKONTO, SOLL_STAGE, SOLL_NTAGE,'
      'MWST_1, MWST_2, MWST_3, ERST_NAME'
      ''
      'FROM JOURNAL'
      ''
      'WHERE RDATUM >=:VON AND RDATUM<=:BIS'
      'AND QUELLE=3'
      ''
      'ORDER BY RDATUM')
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
    object JQueryVRENUM: TStringField
      DisplayLabel = 'Beleg'
      FieldName = 'VRENUM'
    end
    object JQueryRDATUM: TDateField
      DisplayLabel = 'Datum'
      FieldName = 'RDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object JQueryMWST_1: TFloatField
      FieldName = 'MWST_1'
      DisplayFormat = '0.0%'
    end
    object JQueryMWST_2: TFloatField
      FieldName = 'MWST_2'
      DisplayFormat = '0.0%'
    end
    object JQueryMWST_3: TFloatField
      FieldName = 'MWST_3'
      DisplayFormat = '0.0%'
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
    object JQueryMSUMME_0: TFloatField
      FieldName = 'MSUMME_0'
      DisplayFormat = ',##,##0.00'
    end
    object JQueryMSUMME_1: TFloatField
      FieldName = 'MSUMME_1'
      DisplayFormat = ',##,##0.00'
    end
    object JQueryMSUMME_2: TFloatField
      FieldName = 'MSUMME_2'
      DisplayFormat = ',##,##0.00'
    end
    object JQueryMSUMME_3: TFloatField
      FieldName = 'MSUMME_3'
      DisplayFormat = ',##,##0.00'
    end
    object JQueryBSUMME: TFloatField
      DisplayLabel = 'Brutto'
      FieldName = 'BSUMME'
      DisplayFormat = ',##,##0.00'
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
      Size = 255
      Calculated = True
    end
    object JQueryORGNUM: TStringField
      DisplayLabel = 'Org.-Nummer'
      FieldName = 'ORGNUM'
    end
    object JQueryKondit: TStringField
      DisplayLabel = 'Konditionen'
      FieldKind = fkCalculated
      FieldName = 'Kondit'
      Calculated = True
    end
    object JQueryWAEHRUNG: TStringField
      DisplayLabel = 'W'#228'hrung'
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object JQueryPROJEKT: TStringField
      DisplayLabel = 'Projekt'
      FieldName = 'PROJEKT'
      Size = 40
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
    object JQuerySTADIUM: TIntegerField
      FieldName = 'STADIUM'
    end
    object JQueryLTERMIN: TDateField
      DisplayLabel = 'Lieferdatum'
      FieldName = 'LTERMIN'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object JQueryCalcStad: TStringField
      DisplayLabel = 'Stadium'
      FieldKind = fkCalculated
      FieldName = 'CalcStad'
      Calculated = True
    end
    object JQueryERST_NAME: TStringField
      DisplayLabel = 'erstellt von'
      FieldName = 'ERST_NAME'
    end
  end
  object JoArtTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = JoArtTabCalcFields
    SQL.Strings = (
      'select '
      
        'JP1.REC_ID, JP1.JOURNAL_ID, JP1.ARTIKELTYP, JP1.ARTIKEL_ID, JP1.' +
        'POSITION, JP1.BEZEICHNUNG, JP1.MATCHCODE, '
      
        'JP1.ARTNUM, JP1.BARCODE, JP1.MENGE, JP1.ME_EINHEIT, JP1.PR_EINHE' +
        'IT, JP1.EPREIS, '
      'JP1.RABATT, JP1.STEUER_CODE, SUM(JP2.MENGE) as MENGE_EK,'
      'JP1.MENGE * JP1.EPREIS * (100-JP1.RABATT) / 100 AS G_PREIS'
      'from JOURNALPOS JP1'
      
        'left outer join JOURNALPOS JP2 on JP2.QUELLE_SRC=JP1.REC_ID and ' +
        '(JP2.QUELLE=5 or JP2.QUELLE=15)'
      'where JP1.JOURNAL_ID=:ID '
      'group by JP1.REC_ID'
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
    object JoArtTabMENGE_EK: TFloatField
      DisplayLabel = 'Menge EK'
      FieldName = 'MENGE_EK'
      DisplayFormat = ',#0.00;,#0.00;- '
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
      DisplayLabel = 'PE'
      DisplayWidth = 13
      FieldName = 'PR_EINHEIT'
      Visible = False
    end
    object JoArtTabEPREIS: TFloatField
      DisplayLabel = 'E-Preis'
      DisplayWidth = 15
      FieldName = 'EPREIS'
      DisplayFormat = ',###,##0.00;,###,##0.00; '
    end
    object JoArtTabRABATT: TFloatField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 15
      FieldName = 'RABATT'
      DisplayFormat = ',###,##0.0"%";,###,##0.0"%"; '
    end
    object JoArtTabG_PREIS: TFloatField
      DisplayLabel = 'G-Preis'
      DisplayWidth = 12
      FieldName = 'G_PREIS'
      DisplayFormat = ',###,##0.00;,###,##0.00; '
    end
    object JoArtTabSTEUER_CODE: TIntegerField
      DisplayWidth = 16
      FieldName = 'STEUER_CODE'
      Visible = False
    end
    object JoArtTabSteuer: TStringField
      DisplayWidth = 7
      FieldKind = fkCalculated
      FieldName = 'Steuer'
      Size = 6
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
        ImageIndex = 14
        ShortCut = 16459
        OnClick = Kopieren1Click
      end
      object InEinkaufwandeln1: TMenuItem
        Caption = 'In Einkauf wandeln'
        ImageIndex = 14
        ShortCut = 16466
        OnClick = InEinkaufwandeln1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Storno1: TMenuItem
        Caption = 'Storno'
        ImageIndex = 6
        ShortCut = 16430
        OnClick = StornoBtn1Click
      end
      object N5: TMenuItem
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
      object EKBestellungdrucken1: TMenuItem
        Caption = 'Bestellung'
        ImageIndex = 11
        ShortCut = 16464
        OnClick = EKBestPrintBtn1Click
      end
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 5
      object Filter1: TMenuItem
        Caption = 'Filter'
        ImageIndex = 10
        object AlleBestellungen1: TMenuItem
          Caption = 'alle Bestellungen'
          Checked = True
          GroupIndex = 1
          RadioItem = True
          OnClick = FilterClick
        end
        object nuroffeneBestellungen1: TMenuItem
          Tag = 1
          Caption = 'nur offene Bestellungen'
          GroupIndex = 1
          RadioItem = True
          OnClick = FilterClick
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
  object PopupMenu1: TPopupMenu
    Left = 424
    Top = 123
    object Stadiumndern1: TMenuItem
      Caption = 'Stadium '#228'ndern'
      object offen1: TMenuItem
        Tag = 1
        Caption = 'offen'
        OnClick = vollgeliefert1Click
      end
      object teillieferung1: TMenuItem
        Tag = 2
        Caption = 'Teillieferung'
        OnClick = vollgeliefert1Click
      end
      object vollgeliefert1: TMenuItem
        Tag = 3
        Caption = 'voll geliefert'
        OnClick = vollgeliefert1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object nichtlieferbar1: TMenuItem
        Tag = 4
        Caption = 'nicht lieferbar'
        OnClick = vollgeliefert1Click
      end
    end
  end
end
