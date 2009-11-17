object ZahlAusForm: TZahlAusForm
  Left = 385
  Top = 300
  Width = 703
  Height = 495
  Caption = 'Zahlungsausgang Lieferanten (Kreditoren)'
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
  object ZahlungPanel: TPanel
    Left = 0
    Top = 0
    Width = 695
    Height = 449
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ToolBar2: TToolBar
      Left = 0
      Top = 423
      Width = 695
      Height = 26
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 112
      Caption = 'ToolBar2'
      DisabledImages = MainForm.ImageList1
      EdgeBorders = []
      Flat = True
      Images = MainForm.ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 0
      Wrapable = False
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 0
        Width = 135
        Height = 22
        DataSource = OPosDetailDS
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Flat = True
        TabOrder = 0
      end
      object ToolButton1: TToolButton
        Left = 135
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 13
        Style = tbsSeparator
      end
      object ZahleingangBtn: TToolButton
        Left = 143
        Top = 0
        AutoSize = True
        Caption = 'Zahlungsausgang'
        ImageIndex = 12
        MenuItem = Zahlungseingang1
      end
    end
    object OposKunGrid: TOFDBGrid
      Left = 0
      Top = 27
      Width = 695
      Height = 250
      Align = alClient
      DataSource = OPosDS
      DefaultDrawing = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = OposKunGridKeyDown
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
          FieldName = 'kun_num'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CALC_NAME'
          Title.Caption = 'Name des Lieferanten'
          Width = 161
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kun_anrede'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'kun_name1'
          Title.Caption = 'Lieferant Name 1'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'kun_name2'
          Title.Caption = 'Lieferant Name 2'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'kun_name3'
          Title.Caption = 'Lieferant Name 3'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'kun_abteilung'
          Title.Caption = 'Lieferant Abteilung'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'kun_strasse'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kun_land'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'kun_plz'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kun_ort'
          Width = 94
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'anzahl'
          Title.Caption = 'Anz. Rechn.'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'saldo'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'waehrung'
          Width = 22
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'gegenkonto'
          Width = 46
          Visible = True
        end>
    end
    object OPosRechGrid: TOFDBGrid
      Left = 0
      Top = 309
      Width = 695
      Height = 114
      Align = alBottom
      DataSource = OPosDetailDS
      DefaultDrawing = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = OPosRechGridDblClick
      OnKeyDown = OposKunGridKeyDown
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
      OnApplyCellAttribute = OPosRechGridApplyCellAttribute
      Columns = <
        item
          Expanded = False
          FieldName = 'vrenum'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORGNUM'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rdatum'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nsumme'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'msumme_1'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'msumme_2'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'msumme'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bsumme'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'zahlart'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'stadium'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'waehrung'
          Width = 22
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'soll_stage'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'soll_skonto'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'soll_ntage'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ist_anzahlung'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ist_skonto'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ist_zahldat'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ist_betrag'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mahnkosten'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'saldo'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mahnstufe'
          Title.Caption = 'MS'
          Width = 23
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mahndatum'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tage_offen'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'gegenkonto'
          Visible = False
        end>
    end
    object TopPan: TPanel
      Left = 0
      Top = 0
      Width = 695
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
        Width = 310
        Height = 23
        Align = alLeft
        Caption = '  Zahlungsausgang Lieferanten (Kreditoren)   '
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
        KindRange = ksYear
        Year = 2000
        Month = 1
        ButtonWidth = 17
        Color = clBtnShadow
        EnablePopup = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 277
      Width = 695
      Height = 32
      Align = alBottom
      BevelOuter = bvNone
      BorderWidth = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object Label1: TLabel
        Left = 485
        Top = 2
        Width = 75
        Height = 28
        Align = alRight
        Caption = '  '#220'berf'#228'llig : '
        Layout = tlCenter
      end
      object Label2: TLabel
        Left = 303
        Top = 2
        Width = 49
        Height = 28
        Align = alRight
        Caption = 'Summe: '
        Layout = tlCenter
      end
      object SumUeberfaelligPan: TPanel
        Left = 560
        Top = 2
        Width = 133
        Height = 28
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object SumUeberfaelligLab: TLabel
          Left = 55
          Top = 0
          Width = 78
          Height = 28
          Align = alRight
          Alignment = taRightJustify
          Caption = '1.000,55 DM '
          Layout = tlCenter
        end
        object SumUECntLab: TLabel
          Left = 0
          Top = 0
          Width = 19
          Height = 28
          Align = alLeft
          Caption = ' 10'
          Layout = tlCenter
        end
      end
      object SummePan: TPanel
        Left = 352
        Top = 2
        Width = 133
        Height = 28
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object SummeLab: TLabel
          Left = 55
          Top = 0
          Width = 78
          Height = 28
          Align = alRight
          Alignment = taRightJustify
          Caption = '1.000,55 DM '
          Layout = tlCenter
        end
        object SumCntLab: TLabel
          Left = 0
          Top = 0
          Width = 19
          Height = 28
          Align = alLeft
          Caption = ' 10'
          Layout = tlCenter
        end
      end
      object ToolBar3: TToolBar
        Left = 2
        Top = 2
        Width = 281
        Height = 28
        Align = alLeft
        AutoSize = True
        BorderWidth = 1
        ButtonWidth = 71
        Caption = 'ToolBar2'
        DisabledImages = MainForm.ImageList1
        EdgeBorders = []
        Flat = True
        Images = MainForm.ImageList1
        List = True
        ShowCaptions = True
        TabOrder = 2
        Wrapable = False
        object DBNavigator2: TDBNavigator
          Left = 0
          Top = 0
          Width = 135
          Height = 22
          DataSource = OPosDS
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          Flat = True
          TabOrder = 0
        end
        object ToolButton2: TToolButton
          Left = 135
          Top = 0
          AutoSize = True
          Caption = 'Suchen'
          ImageIndex = 10
          MenuItem = Suchen1
        end
        object OposPrintBtn: TToolButton
          Left = 210
          Top = 0
          AutoSize = True
          Caption = 'OPOS'
          ImageIndex = 11
          MenuItem = OPOSdrucken1
        end
      end
    end
  end
  object OPosQuery: TZQuery
    Connection = DM1.DB1
    AfterOpen = OPosQueryAfterOpen
    OnCalcFields = OPosQueryCalcFields
    SQL.Strings = (
      'select '
      ''
      'ADDR_ID, GEGENKONTO,'
      
        'KUN_NUM, KUN_ANREDE, KUN_NAME1, KUN_NAME2, KUN_NAME3, KUN_ABTEIL' +
        'UNG, '
      'KUN_STRASSE, KUN_PLZ, KUN_LAND, KUN_ORT,'
      'format(count(*),0) as ANZAHL,'
      '(sum(BSUMME) - sum(IST_ANZAHLUNG) - sum(IST_BETRAG)) as SALDO,'
      'WAEHRUNG'
      'from JOURNAL'
      
        'where STADIUM BETWEEN 20 and 80 and QUELLE=5 and YEAR(RDATUM)>=2' +
        '000 and BSUMME<>0'
      'group by ADDR_ID, WAEHRUNG'
      'order by KUN_NAME1, KUN_NAME2')
    Params = <>
    Left = 152
    Top = 160
    object OPosQueryaddr_id: TIntegerField
      FieldName = 'addr_id'
      Required = True
    end
    object OPosQuerygegenkonto: TIntegerField
      DisplayLabel = 'G-Konto'
      FieldName = 'gegenkonto'
    end
    object OPosQuerykun_num: TStringField
      DisplayLabel = 'Kundennr.'
      FieldName = 'kun_num'
    end
    object OPosQuerykun_anrede: TStringField
      DisplayLabel = 'Anrede'
      FieldName = 'kun_anrede'
      Size = 40
    end
    object OPosQuerykun_name1: TStringField
      DisplayLabel = 'Name des Kunden'
      FieldName = 'kun_name1'
      Size = 40
    end
    object OPosQuerykun_name2: TStringField
      DisplayLabel = 'Kunde Name 2'
      FieldName = 'kun_name2'
      Size = 40
    end
    object OPosQuerykun_name3: TStringField
      DisplayLabel = 'Kunde Name 3'
      FieldName = 'kun_name3'
      Size = 40
    end
    object OPosQuerykun_abteilung: TStringField
      DisplayLabel = 'Kunde Abteilung'
      FieldName = 'kun_abteilung'
      Size = 40
    end
    object OPosQuerykun_strasse: TStringField
      DisplayLabel = 'Stra'#223'e'
      FieldName = 'kun_strasse'
      Size = 40
    end
    object OPosQuerykun_plz: TStringField
      DisplayLabel = 'PLZ'
      FieldName = 'kun_plz'
      Size = 10
    end
    object OPosQuerykun_land: TStringField
      DisplayLabel = 'Land'
      FieldName = 'kun_land'
      Size = 5
    end
    object OPosQuerykun_ort: TStringField
      DisplayLabel = 'Ort'
      FieldName = 'kun_ort'
      Size = 40
    end
    object OPosQueryanzahl: TStringField
      FieldName = 'anzahl'
      Size = 28
    end
    object OPosQuerysaldo: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'saldo'
      DisplayFormat = ',#0.00'
    end
    object OPosQuerywaehrung: TStringField
      DisplayLabel = 'W'#228'hrung'
      FieldName = 'waehrung'
      Size = 5
    end
    object OPosQueryCALC_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_NAME'
      Size = 255
      Calculated = True
    end
  end
  object OPosDS: TDataSource
    DataSet = OPosQuery
    Left = 216
    Top = 160
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
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        ShortCut = 16454
        OnClick = Suchen1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Zahlungseingang1: TMenuItem
        Caption = 'Zahlungsausgang'
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
      object OPOSdrucken1: TMenuItem
        Caption = 'OPOS'
        ImageIndex = 11
        ShortCut = 16464
        OnClick = OPOSdrucken1Click
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
  object OPosDetailQuery: TZQuery
    Connection = DM1.DB1
    AfterOpen = OPosDetailQueryAfterOpen
    AfterScroll = OPosDetailQueryAfterOpen
    SQL.Strings = (
      'select '
      'REC_ID, QUELLE, VRENUM, RDATUM, ADDR_ID,'
      'NSUMME, MSUMME_0, MSUMME_1, MSUMME_2, MSUMME_3, MSUMME, BSUMME,'
      'ZAHLART, STADIUM, WAEHRUNG, '
      'SOLL_STAGE, SOLL_SKONTO, SOLL_NTAGE, '
      
        'IST_ANZAHLUNG, IST_SKONTO, IST_ZAHLDAT, IST_BETRAG, MAHNKOSTEN, ' +
        'GEGENKONTO,'
      '(BSUMME - IST_ANZAHLUNG - IST_BETRAG) as SALDO,'
      'MAHNSTUFE, MAHNDATUM,'
      'TO_DAYS(CURDATE())-TO_DAYS(RDATUM) as TAGE_OFFEN, ORGNUM'
      'from JOURNAL'
      
        'where STADIUM BETWEEN 20 and 80 and QUELLE=5 and YEAR(RDATUM)>=2' +
        '000 and BSUMME<>0 and '
      'ADDR_ID=:ADDR_ID and WAEHRUNG=:WAEHRUNG'
      'order by RDATUM, VRENUM')
    Params = <
      item
        DataType = ftInteger
        Name = 'ADDR_ID'
        ParamType = ptUnknown
        Value = 16522
      end
      item
        DataType = ftString
        Name = 'Waehrung'
        ParamType = ptUnknown
        Value = #8364
      end>
    DataSource = OPosDS
    Left = 152
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ADDR_ID'
        ParamType = ptUnknown
        Value = 16522
      end
      item
        DataType = ftString
        Name = 'Waehrung'
        ParamType = ptUnknown
        Value = #8364
      end>
    object OPosDetailQueryrec_id: TIntegerField
      FieldName = 'rec_id'
    end
    object IntegerField1: TIntegerField
      FieldName = 'quelle'
      Required = True
    end
    object OPosDetailQueryrdatum: TDateField
      DisplayLabel = 'Datum'
      FieldName = 'rdatum'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object IntegerField2: TStringField
      DisplayLabel = 'Beleg'
      FieldName = 'vrenum'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'addr_id'
      Required = True
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Netto'
      FieldName = 'nsumme'
      DisplayFormat = ',#0.00'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'MwSt 0'
      FieldName = 'msumme_0'
      DisplayFormat = ',#0.00'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'MwSt 1'
      FieldName = 'msumme_1'
      DisplayFormat = ',#0.00'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'MwSt 2'
      FieldName = 'msumme_2'
      DisplayFormat = ',#0.00'
    end
    object FloatField5: TFloatField
      DisplayLabel = 'MwSt 3'
      FieldName = 'msumme_3'
      DisplayFormat = ',#0.00'
    end
    object FloatField6: TFloatField
      DisplayLabel = 'MwSt'
      FieldName = 'msumme'
      DisplayFormat = ',#0.00'
    end
    object OPosDetailQueryBSumme: TFloatField
      DisplayLabel = 'Brutto'
      FieldName = 'bsumme'
      DisplayFormat = ',#0.00'
    end
    object IntegerField4: TIntegerField
      DisplayLabel = 'Zahlart'
      DisplayWidth = 2
      FieldName = 'zahlart'
    end
    object OposDetailQueryStadium: TIntegerField
      DisplayLabel = 'Stadium'
      FieldName = 'stadium'
    end
    object StringField1: TStringField
      DisplayLabel = 'W'#228'hrung'
      FieldName = 'waehrung'
      Size = 5
    end
    object IntegerField6: TLargeintField
      FieldName = 'soll_stage'
    end
    object FloatField8: TFloatField
      FieldName = 'soll_skonto'
    end
    object OPosDetailQuerySoll_NTage: TLargeintField
      FieldName = 'soll_ntage'
    end
    object FloatField9: TFloatField
      DisplayLabel = 'Anzahlung'
      FieldName = 'ist_anzahlung'
      DisplayFormat = ',#0.00'
    end
    object FloatField10: TFloatField
      DisplayLabel = 'Skonto'
      FieldName = 'ist_skonto'
      DisplayFormat = '0.0 %'
    end
    object DateField2: TDateField
      DisplayLabel = 'Z-Eingang'
      FieldName = 'ist_zahldat'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object FloatField11: TFloatField
      DisplayLabel = 'gezahlt'
      FieldName = 'ist_betrag'
      DisplayFormat = ',#0.00;-,#0.00;  '
    end
    object FloatField12: TFloatField
      DisplayLabel = 'Mahnkosten'
      FieldName = 'mahnkosten'
      DisplayFormat = ',#0.00;-,#0.00;  '
    end
    object IntegerField8: TIntegerField
      DisplayLabel = 'G-Konto'
      FieldName = 'gegenkonto'
    end
    object FloatField13: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'saldo'
      DisplayFormat = ',#0.00'
    end
    object OPosDetailQuerymahnstufe: TIntegerField
      DisplayLabel = 'Mahnstufe'
      DisplayWidth = 2
      FieldName = 'mahnstufe'
      DisplayFormat = '0;0; '
    end
    object OPosDetailQuerymahndatum: TDateField
      DisplayLabel = 'le. Mahnung'
      FieldName = 'mahndatum'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object LargeintField1: TLargeintField
      DisplayLabel = 'T.offen'
      DisplayWidth = 3
      FieldName = 'tage_offen'
    end
    object OPosDetailQueryORGNUM: TStringField
      DisplayLabel = 'Org.-Nr.'
      FieldName = 'ORGNUM'
    end
  end
  object OPosDetailDS: TDataSource
    DataSet = OPosDetailQuery
    Left = 216
    Top = 216
  end
  object SumQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select '
      'format(count(*),0) as ANZAHL,'
      'sum(BSUMME) as BSUMME,'
      '(sum(BSUMME) - sum(IST_ANZAHLUNG) - sum(IST_BETRAG)) as SALDO,'
      
        'WAEHRUNG, TO_DAYS(RDATUM)+SOLL_NTAGE-TO_DAYS(CURDATE())<0 as UEB' +
        'ERFAELLIG'
      'from JOURNAL'
      
        'where STADIUM BETWEEN 20 and 80 and QUELLE=5 and YEAR(RDATUM)>=2' +
        '000 and BSUMME<>0'
      'group by WAEHRUNG, UEBERFAELLIG')
    Params = <>
    Left = 464
    Top = 160
    object SumQueryanzahl: TStringField
      FieldName = 'anzahl'
      Size = 28
    end
    object SumQuerybsumme: TFloatField
      FieldName = 'bsumme'
    end
    object SumQuerysaldo: TFloatField
      FieldName = 'saldo'
    end
    object SumQuerywaehrung: TStringField
      FieldName = 'waehrung'
      Size = 5
    end
    object SumQueryueberfaellig: TLargeintField
      FieldName = 'ueberfaellig'
    end
  end
end
