object ExportFibuForm: TExportFibuForm
  Left = 280
  Top = 193
  Width = 724
  Height = 533
  Caption = 'Export Fibu'
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
    Width = 716
    Height = 487
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TopPan: TPanel
      Left = 0
      Top = 0
      Width = 716
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      TabOrder = 0
      OnResize = TopPanResize
      object Label35: TLabel
        Left = 0
        Top = 0
        Width = 116
        Height = 23
        Align = alLeft
        Caption = '  Export -> Fibu   '
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
        KindRange = ksMonth
        Year = 2000
        Month = 1
        OnChange = DatumAWChange
        ButtonWidth = 17
        Color = clBtnShadow
        EnablePopup = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
      end
    end
    object ToolBar1: TToolBar
      Left = 0
      Top = 461
      Width = 716
      Height = 26
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 80
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Images = MainForm.ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 1
      object Nav1: TDBNavigator
        Left = 0
        Top = 0
        Width = 165
        Height = 22
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Flat = True
        TabOrder = 0
      end
      object ToolButton3: TToolButton
        Left = 165
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 13
        Style = tbsSeparator
      end
      object ExportBtn: TToolButton
        Left = 173
        Top = 0
        AutoSize = True
        Caption = 'Exportieren'
        ImageIndex = 22
        MenuItem = exportieren1
      end
      object SpeichernBtn: TToolButton
        Left = 257
        Top = 0
        AutoSize = True
        Caption = 'Speichern'
        ImageIndex = 12
        MenuItem = Speichern1
      end
    end
    object PC1: TPageControl
      Left = 0
      Top = 27
      Width = 716
      Height = 434
      ActivePage = DebiTS
      Align = alClient
      TabOrder = 2
      OnChange = PC1Change
      object DebiTS: TTabSheet
        Tag = 1
        Caption = 'Debitoren'
        object DebiGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 708
          Height = 406
          Align = alClient
          DataSource = DebiDS
          DefaultDrawing = False
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
          RowColor2 = 14869218
          ShowTitleEllipsis = True
          DefaultRowHeight = 16
          EditColor = clBlack
          Columns = <
            item
              Expanded = False
              FieldName = 'KUNNUM1'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEB_NUM'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANREDE'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME1'
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME2'
              Width = 129
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME3'
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STRASSE'
              Width = 159
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LAND'
              Width = 13
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLZ'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORT'
              Width = 128
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELE1'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FUNK'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANZAHL'
              Width = 26
              Visible = True
            end>
        end
      end
      object KrediTS: TTabSheet
        Tag = 2
        Caption = 'Kreditoren'
        ImageIndex = 2
        object KrediGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 708
          Height = 406
          Align = alClient
          DataSource = KrediDS
          DefaultDrawing = False
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
          RowColor2 = 14869218
          ShowTitleEllipsis = True
          DefaultRowHeight = 16
          EditColor = clBlack
          Columns = <
            item
              Expanded = False
              FieldName = 'KUNNUM2'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KRD_NUM'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANREDE'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME1'
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME2'
              Width = 129
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME3'
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STRASSE'
              Width = 159
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LAND'
              Width = 13
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLZ'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORT'
              Width = 128
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELE1'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FUNK'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANZAHL'
              Width = 26
              Visible = True
            end>
        end
      end
      object EinkaufTS: TTabSheet
        Tag = 3
        Caption = 'Buchungen EK'
        ImageIndex = 1
        object EKGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 708
          Height = 406
          Align = alClient
          DataSource = EKDS
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
          RowColor1 = clWindow
          RowColor2 = 14869218
          ShowTitleEllipsis = True
          DefaultRowHeight = 16
          EditColor = clBlack
          Columns = <
            item
              Expanded = False
              FieldName = 'RDATUM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VRENUM'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORGNUM'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GEGENKONTO'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AUFWANDSKONTO'
              Title.Caption = 'Aufw.-Konto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_NUM'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_ANREDE'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_NAME1'
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_NAME2'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_NAME3'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_STRASSE'
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_LAND'
              Title.Caption = 'Land'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_PLZ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_ORT'
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NSUMME'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MWST_1'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MSUMME_1'
              Title.Caption = 'S MwSt 1'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MWST_2'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MSUMME_2'
              Title.Caption = 'S MwSt 2'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MSUMME'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BSUMME'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'WAEHRUNG'
              Width = 16
              Visible = True
            end>
        end
      end
      object VerkaufTS: TTabSheet
        Tag = 4
        Caption = 'Buchungen VK'
        ImageIndex = 3
        object VKGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 708
          Height = 406
          Align = alClient
          DataSource = VKDS
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
          RowColor1 = clWindow
          RowColor2 = 14869218
          ShowTitleEllipsis = True
          DefaultRowHeight = 16
          EditColor = clBlack
          Columns = <
            item
              Expanded = False
              FieldName = 'RDATUM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VRENUM'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GEGENKONTO'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ERLOESKONTO'
              Title.Caption = 'Erl'#246'skonto'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_NUM'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_ANREDE'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_NAME1'
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_NAME2'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_NAME3'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_STRASSE'
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_LAND'
              Title.Caption = 'Land'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_PLZ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_ORT'
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NSUMME'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MWST_1'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MSUMME_1'
              Title.Caption = 'S MwSt 1'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MWST_2'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MSUMME_2'
              Title.Caption = 'S MwSt 2'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MSUMME'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BSUMME'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'WAEHRUNG'
              Width = 16
              Visible = True
            end>
        end
      end
      object KasseVKTs: TTabSheet
        Tag = 5
        Caption = 'Kasse VK'
        ImageIndex = 4
        object VKKasseGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 708
          Height = 406
          Align = alClient
          DataSource = KasseDS
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
          RowColor1 = clWindow
          RowColor2 = 14869218
          ShowTitleEllipsis = True
          DefaultRowHeight = 16
          EditColor = clBlack
          Columns = <
            item
              Expanded = False
              FieldName = 'rdatum'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VRENUM'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'gegenkonto'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'kun_name1'
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Zahlart_Kurz'
              Title.Caption = 'Zahlart'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nsumme'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'mwst_1'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'msumme_1'
              Title.Caption = 'S MwSt 1'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'mwst_2'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'msumme_2'
              Title.Caption = 'S MwSt 2'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'msumme'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'bsumme'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'waehrung'
              Width = 16
              Visible = True
            end>
        end
      end
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
    Left = 280
    Top = 160
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object exportieren1: TMenuItem
        Caption = 'Exportieren'
        ImageIndex = 22
        ShortCut = 16453
        OnClick = exportieren1Click
      end
      object Speichern1: TMenuItem
        Caption = 'Speichern'
        ImageIndex = 12
        ShortCut = 16467
        OnClick = Speichern1Click
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
      Enabled = False
      GroupIndex = 3
      Visible = False
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
      Enabled = False
      GroupIndex = 4
      Visible = False
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
  object DebiTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      
        'select format(count(*),0) as ANZAHL, ADRESSEN.REC_ID as ID, KUNN' +
        'UM1, NAME1, NAME2, NAME3, ANREDE, STRASSE, LAND, PLZ, ORT, TELE1' +
        ', FUNK, DEB_NUM, STATUS, UST_NUM'
      'from JOURNAL, ADRESSEN'
      
        'where JOURNAL.ADDR_ID=ADRESSEN.REC_ID and JOURNAL.QUELLE=3 and R' +
        'DATUM>=:VON and RDATUM<=:BIS'
      'and ((ADRESSEN.STATUS & 2 != 2)or(ISNULL(STATUS)))'
      'group by ADRESSEN.REC_ID')
    Params = <
      item
        DataType = ftDate
        Name = 'von'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'bis'
        ParamType = ptInput
      end>
    Left = 140
    Top = 107
    ParamData = <
      item
        DataType = ftDate
        Name = 'von'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'bis'
        ParamType = ptInput
      end>
    object DebiTabanzahl: TStringField
      DisplayLabel = 'Anz. Belege'
      FieldName = 'ANZAHL'
    end
    object DebiTabID: TIntegerField
      FieldName = 'ID'
    end
    object DebiTabKUNNUM1: TStringField
      DisplayLabel = 'Kundennr.'
      DisplayWidth = 10
      FieldName = 'KUNNUM1'
    end
    object DebiTabNAME1: TStringField
      DisplayLabel = 'Name 1'
      FieldName = 'NAME1'
      Size = 40
    end
    object DebiTabNAME2: TStringField
      DisplayLabel = 'Name 2'
      FieldName = 'NAME2'
      Size = 40
    end
    object DebiTabNAME3: TStringField
      DisplayLabel = 'Name 3'
      FieldName = 'NAME3'
      Size = 40
    end
    object DebiTabANREDE: TStringField
      DisplayLabel = 'Anrede'
      FieldName = 'ANREDE'
      Size = 40
    end
    object DebiTabSTRASSE: TStringField
      DisplayLabel = 'Stra'#223'e'
      FieldName = 'STRASSE'
      Size = 40
    end
    object DebiTabLAND: TStringField
      DisplayLabel = 'L'
      FieldName = 'LAND'
      Size = 5
    end
    object DebiTabPLZ: TStringField
      FieldName = 'PLZ'
      Size = 10
    end
    object DebiTabORT: TStringField
      DisplayLabel = 'Ort'
      FieldName = 'ORT'
      Size = 40
    end
    object DebiTabTELE1: TStringField
      DisplayLabel = 'Telefon'
      FieldName = 'TELE1'
      Size = 100
    end
    object DebiTabFUNK: TStringField
      DisplayLabel = 'Mobil'
      FieldName = 'FUNK'
      Size = 100
    end
    object DebiTabDEB_NUM: TIntegerField
      DisplayLabel = 'Deb.-Nr.'
      FieldName = 'DEB_NUM'
    end
    object DebiTabSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
    end
  end
  object DebiDS: TDataSource
    DataSet = DebiTab
    Left = 196
    Top = 107
  end
  object KrediDS: TDataSource
    DataSet = KrediTab
    Left = 196
    Top = 171
  end
  object KrediTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      
        'select format(count(*),0) as ANZAHL, ADRESSEN.REC_ID as ID, KUNN' +
        'UM2, NAME1, NAME2, NAME3, ANREDE, STRASSE, LAND, PLZ, ORT, TELE1' +
        ', FUNK, KRD_NUM, STATUS, UST_NUM'
      'from JOURNAL, ADRESSEN'
      
        'where JOURNAL.ADDR_ID=ADRESSEN.REC_ID and JOURNAL.QUELLE=5 and R' +
        'DATUM>=:VON and RDATUM<=:BIS'
      'and ((ADRESSEN.STATUS & 32 != 32)or(ISNULL(STATUS)))'
      'group by ADRESSEN.REC_ID')
    Params = <
      item
        DataType = ftDate
        Name = 'von'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'bis'
        ParamType = ptInput
      end>
    Left = 140
    Top = 171
    ParamData = <
      item
        DataType = ftDate
        Name = 'von'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'bis'
        ParamType = ptInput
      end>
    object KrediTabAnzahl: TStringField
      DisplayLabel = 'Anz. Belege'
      FieldName = 'ANZAHL'
    end
    object KrediTabID: TIntegerField
      FieldName = 'ID'
    end
    object KrediTabKUNNUM2: TStringField
      DisplayLabel = 'Kundennr.'
      FieldName = 'KUNNUM2'
    end
    object KrediTabKRD_NUM: TIntegerField
      DisplayLabel = 'Krd.-Nr.'
      FieldName = 'KRD_NUM'
    end
    object KrediTabName1: TStringField
      DisplayLabel = 'Name 1'
      FieldName = 'NAME1'
      Size = 40
    end
    object KrediTabName2: TStringField
      DisplayLabel = 'Name 2'
      FieldName = 'NAME2'
      Size = 40
    end
    object KrediTabName3: TStringField
      DisplayLabel = 'Name 3'
      FieldName = 'NAME3'
      Size = 40
    end
    object KrediTabAnrede: TStringField
      DisplayLabel = 'Anrede'
      FieldName = 'ANREDE'
      Size = 40
    end
    object KrediTabStrasse: TStringField
      DisplayLabel = 'Stra'#223'e'
      FieldName = 'STRASSE'
      Size = 40
    end
    object KrediTabLand: TStringField
      DisplayLabel = 'L'
      FieldName = 'LAND'
      Size = 5
    end
    object KrediTabPLZ: TStringField
      FieldName = 'PLZ'
      Size = 10
    end
    object KrediTabOrt: TStringField
      DisplayLabel = 'Ort'
      FieldName = 'ORT'
      Size = 40
    end
    object KrediTabTele1: TStringField
      DisplayLabel = 'Telefon'
      FieldName = 'TELE1'
      Size = 100
    end
    object KrediTabFunk: TStringField
      DisplayLabel = 'Mobil'
      FieldName = 'FUNK'
      Size = 100
    end
    object KrediTabStatus: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
    end
  end
  object EKTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = EKTabCalcFields
    SQL.Strings = (
      'select '
      
        'VRENUM, RDATUM, NSUMME, MSUMME_1, MSUMME_2, MSUMME, BSUMME, MWST' +
        '_1, MWST_2, JOURNAL.WAEHRUNG, UPPER(GEGENKONTO) as GEGENKONTO, '
      
        'KUN_NUM, KUN_ANREDE, KUN_NAME1, KUN_NAME2, KUN_NAME3, KUN_STRASS' +
        'E, if (KUN_LAND="D", "DE", KUN_LAND) as KUN_LAND, KUN_PLZ, KUN_O' +
        'RT, ORGNUM, UST_NUM,'
      'SOLL_NTAGE, SOLL_STAGE, SOLL_SKONTO, PROJEKT'
      'from JOURNAL'
      'left outer JOIN ADRESSEN ON ADRESSEN.REC_ID=JOURNAL.ADDR_ID'
      'where QUELLE=5 and RDATUM>=:VON and RDATUM<=:BIS '
      '')
    Params = <
      item
        DataType = ftDate
        Name = 'von'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'bis'
        ParamType = ptInput
      end>
    Left = 140
    Top = 235
    ParamData = <
      item
        DataType = ftDate
        Name = 'von'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'bis'
        ParamType = ptInput
      end>
    object EKTabVRENUM: TStringField
      DisplayLabel = 'Beleg'
      FieldName = 'VRENUM'
      Required = True
    end
    object EKTabrdatum: TDateField
      DisplayLabel = 'Datum'
      FieldName = 'RDATUM'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object EKTabnsumme: TFloatField
      DisplayLabel = 'Netto'
      FieldName = 'NSUMME'
      DisplayFormat = ',#0.00'
    end
    object EKTabmwst_1: TFloatField
      DisplayLabel = 'Mwst 1'
      FieldName = 'MWST_1'
      DisplayFormat = '0.0%'
    end
    object EKTabmsumme_1: TFloatField
      DisplayLabel = 'MwSt 7%'
      FieldName = 'MSUMME_1'
      DisplayFormat = ',#0.00'
    end
    object EKTabmwst_2: TFloatField
      DisplayLabel = 'Mwst 2'
      FieldName = 'MWST_2'
      DisplayFormat = '0.0%'
    end
    object EKTabmsumme_2: TFloatField
      DisplayLabel = 'MwSt 16%'
      FieldName = 'MSUMME_2'
      DisplayFormat = ',#0.00'
    end
    object EKTabmsumme: TFloatField
      DisplayLabel = 'MwSt'
      FieldName = 'MSUMME'
      DisplayFormat = ',#0.00'
    end
    object EKTabbsumme: TFloatField
      DisplayLabel = 'Brutto'
      FieldName = 'BSUMME'
      DisplayFormat = ',#0.00'
    end
    object EKTabwaehrung: TStringField
      DisplayLabel = 'W'#228'hrung'
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object EKTabgegenkonto: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'G.-Kto.'
      FieldName = 'GEGENKONTO'
    end
    object EKTabkun_num: TStringField
      DisplayLabel = 'Kundennr.'
      FieldName = 'KUN_NUM'
    end
    object EKTabkun_anrede: TStringField
      DisplayLabel = 'Anrede'
      FieldName = 'KUN_ANREDE'
      Size = 40
    end
    object EKTabkun_name1: TStringField
      DisplayLabel = 'Name 1'
      FieldName = 'KUN_NAME1'
      Size = 40
    end
    object EKTabkun_name2: TStringField
      DisplayLabel = 'Name 2'
      FieldName = 'KUN_NAME2'
      Size = 40
    end
    object EKTabkun_name3: TStringField
      DisplayLabel = 'Name 3'
      FieldName = 'KUN_NAME3'
      Size = 40
    end
    object EKTabkun_strasse: TStringField
      DisplayLabel = 'Stra'#223'e'
      FieldName = 'KUN_STRASSE'
      Size = 40
    end
    object EKTabkun_land: TStringField
      DisplayLabel = 'L'
      FieldName = 'KUN_LAND'
      Size = 5
    end
    object EKTabkun_plz: TStringField
      DisplayLabel = 'PLZ'
      FieldName = 'KUN_PLZ'
      Size = 10
    end
    object EKTabkun_ort: TStringField
      DisplayLabel = 'Ort'
      FieldName = 'KUN_ORT'
      Size = 40
    end
    object EKTaborgnum: TStringField
      DisplayLabel = 'Org.-Nr.'
      FieldName = 'ORGNUM'
    end
    object EKTabUST_NUM: TStringField
      FieldName = 'UST_NUM'
      Size = 25
    end
    object EKTabSOLL_NTAGE: TLargeintField
      DisplayLabel = 'NETTO_TAGE'
      FieldName = 'SOLL_NTAGE'
    end
    object EKTabSOLL_STAGE: TLargeintField
      DisplayLabel = 'SKONTO_TAGE'
      FieldName = 'SOLL_STAGE'
    end
    object EKTabSOLL_SKONTO: TFloatField
      DisplayLabel = 'SKONTO_PROZ'
      FieldName = 'SOLL_SKONTO'
    end
    object EKTabPROJEKT: TStringField
      FieldName = 'PROJEKT'
      Size = 80
    end
    object EKTabAUFWANDSKONTO: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'AUFWANDSKONTO'
      Calculated = True
    end
  end
  object EKDS: TDataSource
    DataSet = EKTab
    Left = 196
    Top = 235
  end
  object VKTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = VKTabCalcFields
    SQL.Strings = (
      'select '
      
        'VRENUM, RDATUM, NSUMME, MSUMME_1, MSUMME_2, MSUMME, BSUMME, MWST' +
        '_1, MWST_2, JOURNAL.WAEHRUNG, UPPER(GEGENKONTO) as GEGENKONTO, '
      
        'KUN_NUM, KUN_ANREDE, KUN_NAME1, KUN_NAME2, KUN_NAME3, KUN_STRASS' +
        'E, if (KUN_LAND="D", "DE", KUN_LAND) as KUN_LAND, KUN_PLZ, KUN_O' +
        'RT, UST_NUM,'
      'SOLL_NTAGE, SOLL_STAGE, SOLL_SKONTO, PROJEKT'
      'from JOURNAL'
      'left outer JOIN ADRESSEN ON ADRESSEN.REC_ID=JOURNAL.ADDR_ID'
      
        'where QUELLE=3 and RDATUM>=:VON and RDATUM<=:BIS and QUELLE_SUB ' +
        '<> 2')
    Params = <
      item
        DataType = ftDate
        Name = 'von'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'bis'
        ParamType = ptInput
      end>
    Left = 140
    Top = 291
    ParamData = <
      item
        DataType = ftDate
        Name = 'von'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'bis'
        ParamType = ptInput
      end>
    object VKTabVRENUM: TStringField
      DisplayLabel = 'Beleg'
      FieldName = 'VRENUM'
      Required = True
    end
    object VKTabRDATUM: TDateField
      DisplayLabel = 'Datum'
      FieldName = 'RDATUM'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object VKTabNSUMME: TFloatField
      DisplayLabel = 'Netto'
      FieldName = 'NSUMME'
      DisplayFormat = ',#0.00'
    end
    object VKTabMwSt_1: TFloatField
      DisplayLabel = 'Mwst 1'
      FieldName = 'MWST_1'
      DisplayFormat = '0.0%'
    end
    object VKTabMSUMME_1: TFloatField
      DisplayLabel = 'MwSt 7%'
      FieldName = 'MSUMME_1'
      DisplayFormat = ',#0.00'
    end
    object VKTabMwSt_2: TFloatField
      DisplayLabel = 'Mwst 2'
      FieldName = 'MWST_2'
      DisplayFormat = '0.0%'
    end
    object VKTabMSUMME_2: TFloatField
      DisplayLabel = 'MwSt 16%'
      FieldName = 'MSUMME_2'
      DisplayFormat = ',#0.00'
    end
    object VKTabMSUMME: TFloatField
      DisplayLabel = 'MwSt'
      FieldName = 'MSUMME'
      DisplayFormat = ',#0.00'
    end
    object VKTabBSUMME: TFloatField
      DisplayLabel = 'Brutto'
      FieldName = 'BSUMME'
      DisplayFormat = ',#0.00'
    end
    object VKTabWaehrung: TStringField
      DisplayLabel = 'W'#228'hrung'
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object VKTabGegenkonto: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'G.-Kto.'
      FieldName = 'GEGENKONTO'
    end
    object VKTabKUN_NUM: TStringField
      DisplayLabel = 'Kundennr.'
      FieldName = 'KUN_NUM'
    end
    object VKTabKUN_ANREDE: TStringField
      DisplayLabel = 'Anrede'
      FieldName = 'KUN_ANREDE'
      Size = 40
    end
    object VKTabKUN_NAME1: TStringField
      DisplayLabel = 'Name 1'
      FieldName = 'KUN_NAME1'
      Size = 40
    end
    object VKTabKUN_NAME2: TStringField
      DisplayLabel = 'Name 2'
      FieldName = 'KUN_NAME2'
      Size = 40
    end
    object VKTabKUN_NAME3: TStringField
      DisplayLabel = 'Name 3'
      FieldName = 'KUN_NAME3'
      Size = 40
    end
    object VKTabKUN_STRASSE: TStringField
      DisplayLabel = 'Stra'#223'e'
      FieldName = 'KUN_STRASSE'
      Size = 40
    end
    object VKTabKUN_LAND: TStringField
      DisplayLabel = 'L'
      FieldName = 'KUN_LAND'
      Size = 5
    end
    object VKTabKUN_PLZ: TStringField
      DisplayLabel = 'PLZ'
      FieldName = 'KUN_PLZ'
      Size = 10
    end
    object VKTabKUN_ORT: TStringField
      DisplayLabel = 'Ort'
      FieldName = 'KUN_ORT'
      Size = 40
    end
    object VKTabUST_NUM: TStringField
      FieldName = 'UST_NUM'
      Size = 25
    end
    object VKTabSOLL_NTAGE: TLargeintField
      DisplayLabel = 'NETTO_TAGE'
      FieldName = 'SOLL_NTAGE'
    end
    object VKTabSOLL_STAGE: TLargeintField
      DisplayLabel = 'SKONTO_TAGE'
      FieldName = 'SOLL_STAGE'
    end
    object VKTabSOLL_SKONTO: TFloatField
      DisplayLabel = 'SKONTO_PROZ'
      FieldName = 'SOLL_SKONTO'
    end
    object VKTabPROJEKT: TStringField
      FieldName = 'PROJEKT'
      Size = 80
    end
    object VKTabERLOESKONTO: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ERLOESKONTO'
      Calculated = True
    end
  end
  object VKDS: TDataSource
    DataSet = VKTab
    Left = 196
    Top = 291
  end
  object KasseTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = KasseTabCalcFields
    SQL.Strings = (
      'select '
      
        'VRENUM, RDATUM, NSUMME, MSUMME_1, MSUMME_2, MSUMME, BSUMME, MWST' +
        '_1, MWST_2, JOURNAL.WAEHRUNG,'
      'KUN_NAME1, ZAHLART, NAME as Zahlart_Kurz'
      'from JOURNAL, REGISTRY'
      'left outer JOIN ADRESSEN ON ADRESSEN.REC_ID=JOURNAL.ADDR_ID'
      
        'where QUELLE=3 and RDATUM>=:VON and RDATUM<=:BIS and QUELLE_SUB ' +
        '= 2'
      'and zahlart=val_char and mainkey='#39'MAIN\\ZAHLART'#39)
    Params = <
      item
        DataType = ftDate
        Name = 'von'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'bis'
        ParamType = ptInput
      end>
    Left = 140
    Top = 347
    ParamData = <
      item
        DataType = ftDate
        Name = 'von'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'bis'
        ParamType = ptInput
      end>
    object KasseTabVRENUM: TStringField
      DisplayLabel = 'Beleg'
      FieldName = 'VRENUM'
      Required = True
    end
    object KasseTabRDatum: TDateField
      DisplayLabel = 'Datum'
      FieldName = 'rdatum'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object KasseTabNSumme: TFloatField
      DisplayLabel = 'Netto'
      FieldName = 'nsumme'
      DisplayFormat = ',#0.00'
    end
    object KasseTabMwst_1: TFloatField
      DisplayLabel = 'Mwst 1'
      FieldName = 'mwst_1'
      DisplayFormat = '0.0%'
    end
    object KasseTabMSumme_1: TFloatField
      DisplayLabel = 'MwSt 7%'
      FieldName = 'msumme_1'
      DisplayFormat = ',#0.00'
    end
    object KasseTabMwst_2: TFloatField
      DisplayLabel = 'Mwst 2'
      FieldName = 'mwst_2'
      DisplayFormat = '0.0%'
    end
    object KasseTabMSumme_2: TFloatField
      DisplayLabel = 'MwSt 16%'
      FieldName = 'msumme_2'
      DisplayFormat = ',#0.00'
    end
    object KasseTabMSumme: TFloatField
      DisplayLabel = 'MwSt'
      FieldName = 'msumme'
      DisplayFormat = ',#0.00'
    end
    object KasseTabBSumme: TFloatField
      DisplayLabel = 'Brutto'
      FieldName = 'bsumme'
      DisplayFormat = ',#0.00'
    end
    object KasseTabWaehrung: TStringField
      DisplayLabel = 'W'#228'hrung'
      FieldName = 'waehrung'
      Size = 5
    end
    object KasseTabGegenkonto: TIntegerField
      DisplayLabel = 'G.-Kto.'
      FieldKind = fkCalculated
      FieldName = 'gegenkonto'
      Calculated = True
    end
    object KasseTabName1: TStringField
      DisplayLabel = 'Name 1'
      FieldName = 'kun_name1'
      Size = 30
    end
    object KasseTabZAHLART: TIntegerField
      FieldName = 'ZAHLART'
      Required = True
    end
    object KasseTabZahlartStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZahlartStr'
      Size = 10
      Calculated = True
    end
    object KasseTabErloeskonto: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Erloeskonto'
      Calculated = True
    end
    object KasseTabZahlart_Kurz: TStringField
      FieldName = 'Zahlart_Kurz'
      Required = True
      Size = 100
    end
  end
  object KasseDS: TDataSource
    DataSet = KasseTab
    Left = 196
    Top = 347
  end
end
