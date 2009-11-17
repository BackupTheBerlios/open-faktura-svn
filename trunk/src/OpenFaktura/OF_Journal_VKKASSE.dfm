object JournalVKKasseForm: TJournalVKKasseForm
  Left = 349
  Top = 114
  Width = 715
  Height = 600
  Caption = 'Journal Verkauf Kasse'
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
    Width = 707
    Height = 554
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 0
      Top = 528
      Width = 707
      Height = 26
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 100
      Caption = 'ToolBar1'
      DisabledImages = MainForm.ImageList1
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
      object SuchenBtn: TToolButton
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
      object TabAbschlussBtn: TToolButton
        Left = 420
        Top = 0
        AutoSize = True
        Caption = 'Tagesabschlu'#223
        ImageIndex = 12
        MenuItem = Tagesabschlu1
      end
      object PrintJournalBtn: TToolButton
        Left = 524
        Top = 0
        AutoSize = True
        Caption = 'Journal'
        ImageIndex = 8
        MenuItem = Journaldrucken1
      end
      object TagesJournalBtn: TToolButton
        Left = 589
        Top = 0
        AutoSize = True
        Caption = 'Tagesjournal'
        ImageIndex = 8
        MenuItem = Tagesjournal1
      end
    end
    object ArtPan: TPanel
      Left = 0
      Top = 0
      Width = 707
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      TabOrder = 1
      OnResize = ArtPanResize
      object Label35: TLabel
        Left = 0
        Top = 0
        Width = 111
        Height = 23
        Align = alLeft
        Caption = '  Kassenjournal '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object DatumAW: TVolgaPeriod
        Left = 548
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
    object PC1: TPageControl
      Left = 0
      Top = 27
      Width = 707
      Height = 501
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 2
      OnChange = PC1Change
      object TabSheet1: TTabSheet
        Caption = #220'bersicht'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 699
          Height = 473
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object SumPanel: TPanel
            Left = 0
            Top = 450
            Width = 699
            Height = 23
            Align = alBottom
            BevelOuter = bvNone
            BorderWidth = 3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Visible = False
            object Label9: TLabel
              Left = 3
              Top = 3
              Width = 81
              Height = 17
              Align = alLeft
              Alignment = taRightJustify
              Caption = 'Gesamtsumme'
              Layout = tlCenter
            end
            object Label10: TLabel
              Left = 245
              Top = 3
              Width = 36
              Height = 17
              Align = alRight
              Caption = 'Netto '
              Layout = tlCenter
            end
            object Label11: TLabel
              Left = 389
              Top = 3
              Width = 44
              Height = 17
              Align = alRight
              Caption = '  MwSt '
              Layout = tlCenter
            end
            object Label12: TLabel
              Left = 541
              Top = 3
              Width = 47
              Height = 17
              Align = alRight
              Caption = '  Brutto '
              Layout = tlCenter
            end
            object N_SUM_PAN: TPanel
              Left = 281
              Top = 3
              Width = 108
              Height = 17
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvLowered
              Caption = '0,00 DM  '
              TabOrder = 0
            end
            object M_SUM_PAN: TPanel
              Left = 433
              Top = 3
              Width = 108
              Height = 17
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvLowered
              Caption = '0,00 DM  '
              TabOrder = 1
            end
            object B_SUM_PAN: TPanel
              Left = 588
              Top = 3
              Width = 108
              Height = 17
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvLowered
              Caption = '0,00 DM  '
              TabOrder = 2
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 699
            Height = 450
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object JourGrid: TOFDBGrid
              Left = 0
              Top = 0
              Width = 699
              Height = 380
              Align = alClient
              DataSource = JourDS
              DefaultDrawing = False
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
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
                  Alignment = taLeftJustify
                  Expanded = False
                  FieldName = 'RDATUM'
                  Width = 85
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RN_VON'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RN_BIS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ANZAHL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NSUMME'
                  Title.Alignment = taRightJustify
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MSUMME_1'
                  Title.Caption = 'MwSt (1)'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MSUMME_2'
                  Title.Caption = 'MwSt (2)'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MSUMME'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'MwSt (Summe)'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BSUMME'
                  Title.Alignment = taRightJustify
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'WAEHRUNG'
                  Width = 27
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'GEBUCHT'
                  Width = 46
                  Visible = True
                end>
            end
            object Panel3: TPanel
              Left = 0
              Top = 380
              Width = 699
              Height = 70
              Align = alBottom
              BevelOuter = bvNone
              Caption = 'Panel3'
              TabOrder = 1
              object TagSumDetailGrid: TOFDBGrid
                Left = 0
                Top = 0
                Width = 699
                Height = 70
                Align = alClient
                DataSource = TagSumDetailDS
                DefaultDrawing = False
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                TitleButtons = True
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
                    FieldName = 'RDATUM'
                    Width = 82
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RN_VON'
                    Width = 53
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RN_BIS'
                    Width = 49
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ANZAHL'
                    Width = 41
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NSUMME'
                    Width = 61
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MSUMME_1'
                    Width = 57
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MSUMME_2'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MSUMME'
                    Width = 61
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'BSUMME'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'WAEHRUNG'
                    Width = 23
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Zahlart_Kurz'
                    Width = 71
                    Visible = True
                  end>
              end
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Tagesdetails'
        ImageIndex = 1
        object TagBelegeGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 699
          Height = 318
          Align = alClient
          DataSource = TagBelegeDS
          DefaultDrawing = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
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
          ShowTitleEllipsis = True
          DefaultRowHeight = 16
          EditColor = clBlack
          OnApplyCellAttribute = TagBelegeGridApplyCellAttribute
          Columns = <
            item
              Expanded = False
              FieldName = 'RDATUM'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VRENUM'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NSUMME'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MSUMME_1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MSUMME_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MSUMME'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BSUMME'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'WAEHRUNG'
              Width = 22
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Zahlart_Kurz'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ERST_NAME'
              Visible = True
            end>
        end
        object Splitter1: TJvxSplitter
          Left = 0
          Top = 318
          Width = 699
          Height = 5
          ControlFirst = TagBelegeGrid
          ControlSecond = JourPosGrid
          Align = alBottom
          BevelInner = bvLowered
          Visible = False
        end
        object JourPosGrid: TOFDBGrid
          Left = 0
          Top = 323
          Width = 699
          Height = 150
          Align = alBottom
          DataSource = JoArtDS
          DefaultDrawing = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Visible = False
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
          ShowTitleEllipsis = True
          DefaultRowHeight = 16
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
              Visible = False
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
    end
  end
  object JourDS: TDataSource
    DataSet = JQuery
    Left = 113
    Top = 123
  end
  object JQuery: TOFZQuery
    Connection = DM1.DB1
    AfterOpen = JQueryAfterScroll
    AfterScroll = JQueryAfterScroll
    OFSecurity = DM1.CaoSecurity
    OFModulID = 3050
    OFSubModulID = 0
    UseRecordLock = False
    ShowLockErrors = False
    AutoReleaseLock = False
    Params = <
      item
        DataType = ftDate
        Name = 'VON'
        ParamType = ptInput
        Value = 32874d
      end
      item
        DataType = ftDate
        Name = 'BIS'
        ParamType = ptInput
        Value = 37591d
      end>
    SQL.Strings = (
      'SELECT'
      'RDATUM,'
      'MIN(VRENUM) as RN_VON,'
      'MAX(VRENUM) as RN_BIS,'
      'ROUND(COUNT(*),0) as ANZAHL,'
      'SUM(NSUMME) as NSUMME,'
      'SUM(MSUMME_0) as MSUMME_0,'
      'SUM(MSUMME_1) as MSUMME_1,'
      'SUM(MSUMME_2) as MSUMME_2,'
      'SUM(MSUMME_3) as MSUMME_3,'
      'SUM(MSUMME) as MSUMME,'
      'SUM(BSUMME) as BSUMME,'
      'WAEHRUNG,'
      'SUM(UW_NUM)=0 as GEBUCHT'
      'from JOURNAL'
      
        'WHERE RDATUM >=:VON AND RDATUM<=:BIS AND QUELLE_SUB = 2 AND QUEL' +
        'LE=3'
      'Group by RDATUM, WAEHRUNG'
      'ORDER BY RDATUM, WAEHRUNG')
    Left = 68
    Top = 123
    ParamData = <
      item
        DataType = ftDate
        Name = 'VON'
        ParamType = ptInput
        Value = 32874d
      end
      item
        DataType = ftDate
        Name = 'BIS'
        ParamType = ptInput
        Value = 37591d
      end>
    object JQueryRDATUM: TDateField
      Alignment = taRightJustify
      DisplayLabel = 'Datum'
      DisplayWidth = 15
      FieldName = 'RDATUM'
      DisplayFormat = 'ddd, dd.mm.yyyy'
    end
    object JQueryRN_VON: TStringField
      DisplayLabel = 'Beleg von'
      FieldName = 'RN_VON'
    end
    object JQueryRN_BIS: TStringField
      DisplayLabel = 'Beleg bis'
      FieldName = 'RN_BIS'
    end
    object JQueryANZAHL: TFloatField
      DisplayLabel = 'Anzahl'
      FieldName = 'ANZAHL'
      DisplayFormat = '0'
    end
    object JQueryNSUMME: TFloatField
      DisplayLabel = 'Netto'
      FieldName = 'NSUMME'
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
    object JQueryWAEHRUNG: TStringField
      DisplayLabel = 'W'#228'hrung'
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object JQueryGEBUCHT: TLargeintField
      Alignment = taCenter
      DisplayLabel = 'Gebucht'
      DisplayWidth = 1
      FieldName = 'GEBUCHT'
      DisplayFormat = 'Ja; ;Nein'
      MaxValue = 1
    end
  end
  object SumQuery: TZQuery
    Connection = DM1.DB1
    AfterOpen = SumQueryAfterOpen
    SQL.Strings = (
      'SELECT SUM(NSUMME), SUM(MSUMME), SUM(BSUMME), WAEHRUNG'
      'FROM JOURNAL'
      
        'WHERE RDATUM>=:VDAT AND RDATUM <= :BDAT AND QUELLE= :QUELLE and ' +
        'QUELLE_SUB=2'
      'group by WAEHRUNG')
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
    Left = 324
    Top = 442
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
      'REC_ID, JOURNAL_ID, ARTIKELTYP, ARTIKEL_ID, ATRNUM, '
      'VRENUM, VLSNUM, POSITION, BEZEICHNUNG, MATCHCODE, '
      'ARTNUM, BARCODE, MENGE, ME_EINHEIT, PR_EINHEIT, EPREIS, '
      'RABATT, STEUER_CODE,'
      'MENGE * EPREIS * (100-RABATT) / 100 AS G_PREIS'
      'from JOURNALPOS'
      'where JOURNAL_ID=:REC_ID'
      'order by POSITION')
    Params = <
      item
        DataType = ftInteger
        Name = 'REC_ID'
        ParamType = ptUnknown
        Value = 13550
      end>
    DataSource = TagBelegeDS
    Left = 211
    Top = 443
    ParamData = <
      item
        DataType = ftInteger
        Name = 'REC_ID'
        ParamType = ptUnknown
        Value = 13550
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
    object JoArtTabPOSITION: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Pos.'
      DisplayWidth = 6
      FieldName = 'POSITION'
      DisplayFormat = '000'
    end
    object JoArtTabARTNUM: TStringField
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
      DisplayFormat = ',#0.0"%";-,#0.0"%"; '
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
    object JoArtTabVLSNUM: TStringField
      FieldName = 'VLSNUM'
      Required = True
    end
  end
  object JoArtDS: TDataSource
    DataSet = JoArtTab
    Left = 256
    Top = 443
  end
  object MainMenu1: TJvMainMenu
    Images = MainForm.ImageList1
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 580
    Top = 299
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Tagesabschlu1: TMenuItem
        Caption = 'Tagesabschlu'#223
        ImageIndex = 12
        OnClick = Tagesabschlu1Click
      end
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        ShortCut = 16454
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Storno1: TMenuItem
        Caption = 'Storno'
        ImageIndex = 6
        ShortCut = 16473
        OnClick = StornoBtnClick
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
    end
    object Drucken1: TMenuItem
      Caption = '&Drucken'
      GroupIndex = 4
      object Journaldrucken1: TMenuItem
        Caption = 'Journal'
        ImageIndex = 8
        ShortCut = 16452
        OnClick = PrintJournalBtnClick
      end
      object Tagesjournal1: TMenuItem
        Caption = 'Tagesjournal'
        ImageIndex = 8
        ShortCut = 16468
        OnClick = Tagesjournal1Click
      end
      object Rechnungdrucken1: TMenuItem
        Caption = 'Beleg'
        ImageIndex = 11
        ShortCut = 16464
        OnClick = RePrintBtnClick
      end
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 5
      object Positionen1: TMenuItem
        Caption = 'Details'
        ImageIndex = 5
        ShortCut = 117
        OnClick = Positionen1Click
      end
      object Summen1: TMenuItem
        Caption = 'Summen'
        ImageIndex = 7
        ShortCut = 118
        OnClick = Summen1Click
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
  object TagSumDetail: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'SELECT'
      'RDATUM,'
      'MIN(VRENUM) as RN_VON,'
      'MAX(VRENUM) as RN_BIS,'
      'COUNT(*) as ANZAHL,'
      'SUM(NSUMME) as NSUMME,'
      'SUM(MSUMME_0) as MSUMME_0,'
      'SUM(MSUMME_1) as MSUMME_1,'
      'SUM(MSUMME_2) as MSUMME_2,'
      'SUM(MSUMME_3) as MSUMME_3,'
      'SUM(MSUMME) as MSUMME,'
      'SUM(BSUMME) as BSUMME,'
      'WAEHRUNG,'
      'name as Zahlart_Kurz'
      'from JOURNAL, REGISTRY'
      'WHERE RDATUM =:RDATUM AND QUELLE_SUB = 2 AND QUELLE=3 '
      'and zahlart=val_char and mainkey='#39'MAIN\\ZAHLART'#39
      'Group by RDATUM, ZAHLART, WAEHRUNG'
      'ORDER BY RDATUM, ZAHLART, WAEHRUNG')
    Params = <
      item
        DataType = ftDateTime
        Name = 'RDATUM'
        ParamType = ptUnknown
        Value = 37243d
      end>
    DataSource = JourDS
    Left = 32
    Top = 443
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'RDATUM'
        ParamType = ptUnknown
        Value = 37243d
      end>
    object TagSumDetailRDATUM: TDateField
      Alignment = taRightJustify
      DisplayLabel = 'Datum'
      FieldName = 'RDATUM'
      Required = True
      DisplayFormat = 'ddd, dd.mm.yyyy'
    end
    object TagSumDetailANZAHL: TIntegerField
      FieldName = 'ANZAHL'
      ReadOnly = True
    end
    object TagSumDetailNSUMME: TFloatField
      DisplayLabel = 'Netto'
      FieldName = 'NSUMME'
      DisplayFormat = ',#0.00'
    end
    object TagSumDetailMSUMME_0: TFloatField
      FieldName = 'MSUMME_0'
      DisplayFormat = ',#0.00'
    end
    object TagSumDetailMSUMME_1: TFloatField
      DisplayLabel = 'MwSt 7%'
      FieldName = 'MSUMME_1'
      DisplayFormat = ',#0.00'
    end
    object TagSumDetailMSUMME_2: TFloatField
      DisplayLabel = 'MwSt 16%'
      FieldName = 'MSUMME_2'
      DisplayFormat = ',#0.00'
    end
    object TagSumDetailMSUMME_3: TFloatField
      FieldName = 'MSUMME_3'
      DisplayFormat = ',#0.00'
    end
    object TagSumDetailMSUMME: TFloatField
      DisplayLabel = 'MwSt'
      FieldName = 'MSUMME'
      DisplayFormat = ',#0.00'
    end
    object TagSumDetailBSUMME: TFloatField
      DisplayLabel = 'Brutto'
      FieldName = 'BSUMME'
      DisplayFormat = ',#0.00'
    end
    object TagSumDetailWAEHRUNG: TStringField
      DisplayLabel = 'W'#228'hrung'
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object TagSumDetailZahlart_Kurz: TStringField
      DisplayLabel = 'Zahlart'
      FieldName = 'Zahlart_Kurz'
      Required = True
      Size = 100
    end
    object TagSumDetailRN_VON: TStringField
      DisplayLabel = 'Beleg von'
      FieldName = 'RN_VON'
    end
    object TagSumDetailRN_BIS: TStringField
      DisplayLabel = 'Beleg bis'
      FieldName = 'RN_BIS'
    end
  end
  object TagSumDetailDS: TDataSource
    DataSet = TagSumDetail
    Left = 120
    Top = 443
  end
  object TagBelege: TZQuery
    Connection = DM1.DB1
    AfterOpen = TagBelegeAfterOpen
    AfterScroll = TagBelegeAfterOpen
    SQL.Strings = (
      'SELECT'
      'REC_ID, VRENUM, RDATUM,'
      'NSUMME,MSUMME, MSUMME_0, MSUMME_1, MSUMME_2, MSUMME_3, BSUMME,'
      'STADIUM, GEGENKONTO,WAEHRUNG, MWST_1, MWST_2, MWST_3,'
      'NAME as Zahlart_Kurz, ERST_NAME'
      'FROM JOURNAL, REGISTRY'
      'WHERE RDATUM=:RDATUM AND QUELLE_SUB = 2 AND QUELLE=3'
      'and zahlart=val_char and mainkey='#39'MAIN\\ZAHLART'#39
      ''
      'ORDER BY VRENUM')
    Params = <
      item
        DataType = ftDateTime
        Name = 'RDATUM'
        ParamType = ptUnknown
        Value = 37243d
      end>
    DataSource = JourDS
    Left = 216
    Top = 129
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'RDATUM'
        ParamType = ptUnknown
        Value = 37243d
      end>
    object TagBelegeREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object TagBelegeVRENUM: TStringField
      DisplayLabel = 'Beleg'
      FieldName = 'VRENUM'
      Required = True
    end
    object TagBelegeRDATUM: TDateField
      DisplayLabel = 'Datum'
      FieldName = 'RDATUM'
      Required = True
    end
    object TagBelegeNSUMME: TFloatField
      DisplayLabel = 'Netto'
      FieldName = 'NSUMME'
      DisplayFormat = ',#0.00'
    end
    object TagBelegeMSUMME: TFloatField
      DisplayLabel = 'MwSt'
      FieldName = 'MSUMME'
      DisplayFormat = ',#0.00'
    end
    object TagBelegeMSUMME_0: TFloatField
      DisplayLabel = 'MwSt (0)'
      FieldName = 'MSUMME_0'
      DisplayFormat = ',#0.00'
    end
    object TagBelegeMSUMME_1: TFloatField
      DisplayLabel = 'MwSt (1)'
      FieldName = 'MSUMME_1'
      DisplayFormat = ',#0.00'
    end
    object TagBelegeMSUMME_2: TFloatField
      DisplayLabel = 'MwSt (2)'
      FieldName = 'MSUMME_2'
      DisplayFormat = ',#0.00'
    end
    object TagBelegeMSUMME_3: TFloatField
      DisplayLabel = 'MwSt (3)'
      FieldName = 'MSUMME_3'
      DisplayFormat = ',#0.00'
    end
    object TagBelegeBSUMME: TFloatField
      DisplayLabel = 'Brutto'
      FieldName = 'BSUMME'
      DisplayFormat = ',#0.00'
    end
    object TagBelegeSTADIUM: TIntegerField
      DisplayLabel = 'Stadium'
      FieldName = 'STADIUM'
    end
    object TagBelegeGEGENKONTO: TIntegerField
      DisplayLabel = 'Geg.-Konto'
      FieldName = 'GEGENKONTO'
    end
    object TagBelegeWAEHRUNG: TStringField
      DisplayLabel = 'W'#228'hrung'
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object TagBelegeMWST_1: TFloatField
      FieldName = 'MWST_1'
    end
    object TagBelegeMWST_2: TFloatField
      FieldName = 'MWST_2'
    end
    object TagBelegeMWST_3: TFloatField
      FieldName = 'MWST_3'
    end
    object TagBelegeZahlart_Kurz: TStringField
      DisplayLabel = 'Zahlart'
      FieldName = 'Zahlart_Kurz'
      Required = True
      Size = 100
    end
    object TagBelegeERST_NAME: TStringField
      DisplayLabel = 'erstellt von'
      FieldName = 'ERST_NAME'
    end
  end
  object TagBelegeDS: TDataSource
    DataSet = TagBelege
    Left = 296
    Top = 129
  end
  object TagAbschlussQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'SELECT'
      'REC_ID, RDATUM, VRENUM,'
      'NSUMME, MSUMME_0, MSUMME_1, MSUMME_2, MSUMME_3, MSUMME, BSUMME,'
      'WAEHRUNG, uw_num, zahlart'
      'from JOURNAL'
      
        'WHERE RDATUM =:RDATUM AND QUELLE_SUB = 2 AND QUELLE=3 and UW_NUM' +
        '=-1'
      'ORDER BY RDATUM, ZAHLART, WAEHRUNG, length(VRENUM), VRENUM')
    Params = <
      item
        DataType = ftDateTime
        Name = 'RDATUM'
        ParamType = ptUnknown
        Value = 37243d
      end>
    DataSource = JourDS
    Left = 384
    Top = 131
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'RDATUM'
        ParamType = ptUnknown
        Value = 37243d
      end>
    object DateField1: TDateField
      Alignment = taRightJustify
      DisplayLabel = 'Datum'
      DisplayWidth = 17
      FieldName = 'RDATUM'
      Required = True
      DisplayFormat = 'ddd, dd.mm.yyyy'
    end
    object TagAbschlussQueryVRENUM: TStringField
      FieldName = 'VRENUM'
      Required = True
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Netto'
      DisplayWidth = 12
      FieldName = 'NSUMME'
      DisplayFormat = ',#0.00'
    end
    object FloatField2: TFloatField
      DisplayWidth = 12
      FieldName = 'MSUMME_0'
      DisplayFormat = ',#0.00'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'MwSt 7%'
      DisplayWidth = 12
      FieldName = 'MSUMME_1'
      DisplayFormat = ',#0.00'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'MwSt 16%'
      DisplayWidth = 12
      FieldName = 'MSUMME_2'
      DisplayFormat = ',#0.00'
    end
    object FloatField5: TFloatField
      DisplayWidth = 12
      FieldName = 'MSUMME_3'
      DisplayFormat = ',#0.00'
    end
    object FloatField6: TFloatField
      DisplayLabel = 'MwSt'
      DisplayWidth = 12
      FieldName = 'MSUMME'
      DisplayFormat = ',#0.00'
    end
    object TabAbschlussQueryBSumme: TFloatField
      DisplayLabel = 'Brutto'
      DisplayWidth = 12
      FieldName = 'BSUMME'
      DisplayFormat = ',#0.00'
    end
    object TagAbschlussQueryWaehrung: TStringField
      DisplayLabel = 'W'#228'hrung'
      DisplayWidth = 9
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object TagAbschlussQueryuw_num: TIntegerField
      FieldName = 'uw_num'
    end
    object TagAbschlussQueryzahlart: TIntegerField
      FieldName = 'zahlart'
    end
    object TagAbschlussQueryREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
  end
end
