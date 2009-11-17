object JournalEKREForm: TJournalEKREForm
  Left = 536
  Top = 110
  Width = 690
  Height = 564
  Caption = 'Journal Einkauf Rechnung'
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
        Width = 127
        Height = 23
        Align = alLeft
        Caption = '  Einkaufsjournal   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object FilterLab: TLabel
        Left = 127
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
        Left = 476
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
      ButtonWidth = 68
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
      object ViewSumBtn: TToolButton
        Left = 218
        Top = 0
        AutoSize = True
        Caption = 'Summen'
        ImageIndex = 7
        MenuItem = Summen1
        Style = tbsCheck
      end
      object ToolButton2: TToolButton
        Left = 290
        Top = 0
        AutoSize = True
        Caption = 'Suchen'
        ImageIndex = 10
        MenuItem = Suchen1
      end
      object StornoBtn: TToolButton
        Left = 358
        Top = 0
        AutoSize = True
        Caption = 'Storno'
        ImageIndex = 6
        MenuItem = Storno1
      end
      object ZEBtn: TToolButton
        Left = 420
        Top = 0
        AutoSize = True
        Caption = 'Zahlung'
        ImageIndex = 12
        MenuItem = Zahlungseingang1
      end
      object PrintJournalBtn: TToolButton
        Left = 490
        Top = 0
        AutoSize = True
        Caption = 'Journal'
        ImageIndex = 8
        MenuItem = Journaldrucken1
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
        Height = 387
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 0
          Top = 241
          Width = 682
          Height = 7
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          Visible = False
        end
        object ReInfoPC: TPageControl
          Left = 0
          Top = 248
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
                  Width = 322
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
          Height = 241
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
              Expanded = False
              FieldName = 'STADIUM'
              Title.Caption = '  '
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 15
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CalcStad'
              Title.Alignment = taCenter
              Width = 118
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
              FieldName = 'IST_SKONTO'
              Title.Alignment = taRightJustify
              Width = 39
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'IST_ZAHLDAT'
              Title.Alignment = taCenter
              Title.Caption = 'Z-Eingang'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IST_BETRAG'
              Title.Alignment = taRightJustify
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GEGENKONTO'
              Title.Caption = 'G-Konto'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MAHNDATUM'
              Title.Caption = 'Mahndatum'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'MAHNSTUFE'
              Title.Caption = 'MS'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'MAHNKOSTEN'
              Title.Caption = 'Mahnkost.'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROJEKT'
              Width = 119
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORGNUM'
              Title.Caption = 'ER-Nummer'
              Width = 108
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ERST_NAME'
              Visible = False
            end>
        end
      end
      object SumPan: TPanel
        Left = 0
        Top = 387
        Width = 682
        Height = 78
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        Visible = False
        object Label3: TLabel
          Left = 8
          Top = 21
          Width = 26
          Height = 13
          Caption = 'Offen'
        end
        object Label4: TLabel
          Left = 8
          Top = 39
          Width = 85
          Height = 13
          Caption = 'Bezahl mit Skonto'
        end
        object Label5: TLabel
          Left = 8
          Top = 58
          Width = 66
          Height = 13
          Caption = 'Bezahlt Brutto'
        end
        object Label6: TLabel
          Left = 184
          Top = 2
          Width = 26
          Height = 13
          Alignment = taRightJustify
          Caption = 'Netto'
        end
        object Label7: TLabel
          Left = 304
          Top = 2
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'MwSt'
        end
        object Label8: TLabel
          Left = 422
          Top = 2
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Brutto'
        end
        object Label9: TLabel
          Left = 606
          Top = 2
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Gesamt'
        end
        object Label10: TLabel
          Left = 504
          Top = 21
          Width = 26
          Height = 13
          Caption = 'Netto'
        end
        object Label11: TLabel
          Left = 504
          Top = 39
          Width = 27
          Height = 13
          Caption = 'MwSt'
        end
        object Label12: TLabel
          Left = 504
          Top = 58
          Width = 28
          Height = 13
          Caption = 'Brutto'
        end
        object N_OFF_PAN: TPanel
          Left = 104
          Top = 18
          Width = 108
          Height = 18
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 0
        end
        object N_BEZSKONTO_PAN: TPanel
          Left = 104
          Top = 37
          Width = 108
          Height = 18
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 1
        end
        object N_BEZ_PAN: TPanel
          Left = 104
          Top = 56
          Width = 108
          Height = 18
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 2
        end
        object M_BEZ_PAN: TPanel
          Left = 224
          Top = 56
          Width = 108
          Height = 18
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 3
        end
        object M_BEZSKONTO_PAN: TPanel
          Left = 224
          Top = 37
          Width = 108
          Height = 18
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 4
        end
        object M_OFF_PAN: TPanel
          Left = 224
          Top = 18
          Width = 108
          Height = 18
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 5
        end
        object B_BEZ_PAN: TPanel
          Left = 344
          Top = 56
          Width = 108
          Height = 18
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 6
        end
        object B_BEZSKONTO_PAN: TPanel
          Left = 344
          Top = 37
          Width = 108
          Height = 18
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 7
        end
        object B_OFF_PAN: TPanel
          Left = 344
          Top = 18
          Width = 108
          Height = 18
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 8
        end
        object N_SUM_PAN: TPanel
          Left = 536
          Top = 18
          Width = 108
          Height = 18
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 9
        end
        object M_SUM_PAN: TPanel
          Left = 536
          Top = 37
          Width = 108
          Height = 18
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 10
        end
        object B_SUM_PAN: TPanel
          Left = 536
          Top = 56
          Width = 108
          Height = 18
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 11
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
    OFModulID = 3100
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
      'KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,'
      'PROJEKT,ORGNUM,GEGENKONTO,WAEHRUNG, MAHNSTUFE, MAHNDATUM,'
      'LDATUM AS LDATUM_ORG,ADATUM,ATRNUM,VLSNUM,KM_STAND,'
      'IST_SKONTO,IST_BETRAG,IST_ZAHLDAT AS IST_ZAHLDAT_ORG,'
      'MAHNKOSTEN, SOLL_SKONTO, SOLL_STAGE, SOLL_NTAGE,'
      'MWST_1, MWST_2, MWST_3, ERST_NAME, BRUTTO_FLAG'
      'FROM JOURNAL'
      'WHERE RDATUM >=:VON AND RDATUM<=:BIS'
      'AND QUELLE=3'
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
    object JQuerySTADIUM: TIntegerField
      DisplayLabel = 'S'
      FieldName = 'STADIUM'
    end
    object JQueryKUN_NUM: TStringField
      DisplayLabel = 'Kundennr.'
      FieldName = 'KUN_NUM'
    end
    object JQueryKUN_NAME1: TStringField
      FieldName = 'KUN_NAME1'
      Size = 40
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
    object JQueryCalcStad: TStringField
      DisplayLabel = 'Stadium'
      DisplayWidth = 32
      FieldKind = fkCalculated
      FieldName = 'CalcStad'
      Size = 32
      Calculated = True
    end
    object JQueryGEGENKONTO: TIntegerField
      DisplayLabel = 'Gegenkonto'
      FieldName = 'GEGENKONTO'
      DisplayFormat = '0;0;-'
    end
    object JQueryWAEHRUNG: TStringField
      DisplayLabel = 'W'#228'hrung'
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object JQueryLDATUM: TDateField
      DisplayLabel = 'Lie.-Datum'
      FieldKind = fkCalculated
      FieldName = 'LDATUM'
      DisplayFormat = 'dd.mm.yyyy'
      Calculated = True
    end
    object JQueryIST_ZAHLDAT: TDateField
      DisplayLabel = 'Zahlungseingang'
      FieldKind = fkCalculated
      FieldName = 'IST_ZAHLDAT'
      Calculated = True
    end
    object JQueryLDATUM_ORG: TDateField
      FieldName = 'LDATUM_ORG'
    end
    object JQueryKM_STAND: TIntegerField
      DisplayLabel = 'KM-Stand'
      FieldName = 'KM_STAND'
      DisplayFormat = '0;-'
    end
    object JQueryADATUM: TDateField
      DisplayLabel = 'Auftr.Datum'
      FieldName = 'ADATUM'
    end
    object JQueryATRNUM: TIntegerField
      DisplayLabel = 'Auftrag'
      FieldName = 'ATRNUM'
      DisplayFormat = '0;"-"'
    end
    object JQueryPROJEKT: TStringField
      DisplayLabel = 'Projekt'
      FieldName = 'PROJEKT'
      Size = 40
    end
    object JQueryMAHNKOSTEN: TFloatField
      DisplayLabel = 'Mahnkosten'
      FieldName = 'MAHNKOSTEN'
      DisplayFormat = ',##,##0.00'
    end
    object JQueryIST_BETRAG: TFloatField
      DisplayLabel = 'gezahlt'
      FieldName = 'IST_BETRAG'
      DisplayFormat = ',#0.00;-,#0.00; '
    end
    object JQueryIST_SKONTO: TFloatField
      DisplayLabel = 'Skonto'
      FieldName = 'IST_SKONTO'
      DisplayFormat = '0.0 "%"; ; '
    end
    object JQueryIST_ZAHLDAT_ORG: TDateField
      FieldName = 'IST_ZAHLDAT_ORG'
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
    object JQueryVLSNUM: TStringField
      FieldName = 'VLSNUM'
    end
    object JQueryMAHNSTUFE: TIntegerField
      FieldName = 'MAHNSTUFE'
    end
    object JQueryMAHNDATUM: TDateField
      FieldName = 'MAHNDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object JQueryERST_NAME: TStringField
      DisplayLabel = 'erstellt von'
      FieldName = 'ERST_NAME'
    end
    object JQueryKUN_ANREDE: TStringField
      FieldName = 'KUN_ANREDE'
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
    object JQueryBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
  end
  object SumQuery: TZQuery
    Connection = DM1.DB1
    AfterOpen = SumQueryAfterOpen
    SQL.Strings = (
      'SELECT STADIUM, SUM(NSUMME), SUM(MSUMME), SUM(BSUMME), WAEHRUNG'
      'FROM JOURNAL'
      
        'WHERE RDATUM>=:VDAT AND RDATUM <= :BDAT AND QUELLE= :QUELLE and ' +
        'QUELLE_SUB<>2'
      'group by STADIUM, WAEHRUNG')
    Params = <
      item
        DataType = ftDateTime
        Name = 'VDAT'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'BDAT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QUELLE'
        ParamType = ptInput
        Value = '11'
      end>
    Left = 36
    Top = 171
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'VDAT'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'BDAT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QUELLE'
        ParamType = ptInput
        Value = '11'
      end>
    object SumQuerySTADIUM: TIntegerField
      FieldName = 'STADIUM'
    end
    object SumQueryNetto: TFloatField
      DisplayLabel = 'Netto'
      FieldName = 'SUM(NSUMME)'
      DisplayFormat = ',##,##0.00'
    end
    object SumQueryMwSt: TFloatField
      DisplayLabel = 'MwSt'
      FieldName = 'SUM(MSUMME)'
      DisplayFormat = ',##,##0.00'
    end
    object SumQueryBrutto: TFloatField
      DisplayLabel = 'Brutto'
      FieldName = 'SUM(BSUMME)'
      DisplayFormat = ',##,##0.00'
    end
    object SumQueryWAEHRUNG: TStringField
      FieldName = 'WAEHRUNG'
      Size = 5
    end
  end
  object JoArtTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = JoArtTabCalcFields
    SQL.Strings = (
      'select '
      'REC_ID, QUELLE, JOURNAL_ID, ARTIKELTYP, ARTIKEL_ID, ATRNUM, '
      'VRENUM, VLSNUM, POSITION, BEZEICHNUNG, MATCHCODE, '
      'ARTNUM, BARCODE, MENGE, ME_EINHEIT, PR_EINHEIT, EPREIS, '
      'RABATT, STEUER_CODE, GPREIS AS G_PREIS'
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
      DisplayFormat = ',#0.0;-,#0.0; '
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
      DisplayFormat = ',#0.00;-,#0.00; '
    end
    object JoArtTabRABATT: TFloatField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 15
      FieldName = 'RABATT'
      DisplayFormat = ',0.0"%";-,#0.0"%"; '
    end
    object JoArtTabG_PREIS: TFloatField
      DisplayLabel = 'G-Preis'
      DisplayWidth = 12
      FieldName = 'G_PREIS'
      DisplayFormat = ',#0.00;-,#0.00; '
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
      object inRechnungumwandeln1: TMenuItem
        Caption = 'VK-Rechnung erzeugen'
        ImageIndex = 14
        ShortCut = 16466
        OnClick = inRechnungumwandeln1Click
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
      object Zahlungseingang1: TMenuItem
        Caption = 'Zahlung'
        ImageIndex = 12
        ShortCut = 16474
        OnClick = Zahlungseingang1Click
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
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 5
      object Filter1: TMenuItem
        Caption = 'Filter'
        ImageIndex = 10
        object nurbezahlteRechnungen1: TMenuItem
          Tag = 1
          Caption = 'nur bezahlte Rechnungen'
          GroupIndex = 1
          RadioItem = True
          OnClick = MenuFilterClick
        end
        object nurunbezahlteRechnungen1: TMenuItem
          Tag = 2
          Caption = 'nur unbezahlte Rechnungen'
          GroupIndex = 1
          RadioItem = True
          OnClick = MenuFilterClick
        end
        object alleRechnungen1: TMenuItem
          Tag = 3
          Caption = 'alle Rechnungen'
          Checked = True
          GroupIndex = 1
          RadioItem = True
          OnClick = MenuFilterClick
        end
      end
      object N1: TMenuItem
        Caption = '-'
        GroupIndex = 1
      end
      object Positionen1: TMenuItem
        Caption = 'Details'
        GroupIndex = 2
        ImageIndex = 5
        ShortCut = 117
        OnClick = Positionen1Click
      end
      object Summen1: TMenuItem
        Caption = 'Summen'
        GroupIndex = 3
        ImageIndex = 7
        ShortCut = 118
        OnClick = ViewSumBtn1Click
      end
      object N4: TMenuItem
        Caption = '-'
        GroupIndex = 3
      end
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        GroupIndex = 4
        ImageIndex = 13
        ShortCut = 116
        OnClick = Aktualisieren1Click
      end
    end
  end
end
