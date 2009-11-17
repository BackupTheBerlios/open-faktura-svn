object MahnForm: TMahnForm
  Left = 306
  Top = 183
  Width = 811
  Height = 582
  Caption = 'MahnForm'
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
    Width = 803
    Height = 536
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TopPan: TPanel
      Left = 0
      Top = 0
      Width = 803
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      TabOrder = 0
      object Label35: TLabel
        Left = 0
        Top = 0
        Width = 100
        Height = 23
        Align = alLeft
        Caption = '  Mahnungen   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object MahnErfassenBtn: TJvSpeedButton
        Tag = 1
        Left = 216
        Top = 0
        Width = 75
        Height = 22
        Caption = 'Mahnlauf'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        ParentFont = False
        OnMouseEnter = MahnDruckenBtnMouseEnter
        OnMouseLeave = MahnDruckenBtnMouseLeave
        OnClick = MahnErfassenBtnClick
      end
      object MahnDruckenBtn: TJvSpeedButton
        Tag = 2
        Left = 296
        Top = 0
        Width = 73
        Height = 22
        Caption = 'Drucken'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        ParentFont = False
        OnMouseEnter = MahnDruckenBtnMouseEnter
        OnMouseLeave = MahnDruckenBtnMouseLeave
        OnClick = MahnDruckenBtnClick
      end
      object DatumAW: TVolgaPeriod
        Left = 520
        Top = 0
        Width = 136
        Height = 24
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
    object PC1: TJvPageControl
      Left = 0
      Top = 27
      Width = 803
      Height = 509
      ActivePage = TabSheet1
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 1
      OnChange = PC1Change
      ClientBorderWidth = 0
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        object ToolBar2: TToolBar
          Left = 0
          Top = 456
          Width = 803
          Height = 30
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonWidth = 103
          Caption = 'ToolBar2'
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
            DataSource = MahnDS
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
          object AlleFreigebenBtn: TToolButton
            Left = 143
            Top = 0
            AutoSize = True
            Caption = 'alle Freigeben'
            Enabled = False
            ImageIndex = 18
            MenuItem = Allesmarkieren1
          end
          object KeineFreigebenBtn: TToolButton
            Left = 240
            Top = 0
            AutoSize = True
            Caption = 'keine Freigeben'
            ImageIndex = 19
            MenuItem = keineMarkieren1
          end
          object ToolButton3: TToolButton
            Left = 347
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 13
            Style = tbsSeparator
          end
          object MahnenBtn: TToolButton
            Left = 355
            Top = 0
            AutoSize = True
            Caption = 'Mahnen'
            ImageIndex = 12
            MenuItem = mahnen1
          end
        end
        object MahnGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 803
          Height = 456
          Align = alClient
          Ctl3D = True
          DataSource = MahnDS
          DefaultDrawing = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = MahnGridDblClick
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 24
          TitleRowHeight = 24
          RowColor1 = 14680063
          RowColor2 = clWindow
          ShowTitleEllipsis = True
          DefaultRowHeight = 16
          EditColor = clBlack
          Columns = <
            item
              Expanded = False
              FieldName = 'FREIGABE1_FLAG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vrenum'
              Title.Caption = 'Beleg'
              Width = 51
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'rdatum'
              Title.Caption = 'Datum'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_KUNDE'
              Title.Caption = 'Name des Kunden'
              Width = 167
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nsumme'
              Title.Caption = 'Netto'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'msumme'
              Title.Caption = 'MwSt'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'bsumme'
              Title.Caption = 'Brutto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SOLL_NTAGE'
              Title.Caption = 'Ziel'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAGE_OFFEN'
              Width = 59
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'mahnstufe'
              Title.Caption = 'MS'
              Width = 23
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'mahndatum'
              Title.Caption = 'le. Mahnung'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'new_mahnstufe'
              Title.Caption = 'neue Mahnstufe'
              Width = 87
              Visible = True
            end>
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'TabSheet3'
        ImageIndex = 2
        object MahnPrintGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 803
          Height = 456
          Align = alClient
          DataSource = MahnPrintDS
          DefaultDrawing = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
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
          RowColor1 = 14680063
          RowColor2 = clWindow
          ShowTitleEllipsis = True
          DefaultRowHeight = 16
          EditColor = clBlack
          Columns = <
            item
              Expanded = False
              FieldName = 'vrenum'
              Title.Caption = 'Beleg'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'rdatum'
              Title.Caption = 'Datum'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'kun_num'
              Title.Caption = 'Ku.-Nr.'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_KUNDE'
              Title.Caption = 'Name des Kunden'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'bsumme'
              Title.Caption = 'Brutto'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'mahnkosten'
              Title.Caption = 'Mahnkosten'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'saldo'
              Title.Caption = 'Saldo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'waehrung'
              Title.Caption = 'WA'
              Width = 24
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'stadium'
              Title.Caption = 'Stadium'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'soll_ntage'
              Title.Caption = 'Ziel'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tage_offen'
              Title.Caption = 'Tage offen'
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
              FieldName = 'gegenkonto'
              Title.Caption = 'G-Kto.'
              Width = 38
              Visible = True
            end>
        end
        object MahnPrintToolBar: TToolBar
          Left = 0
          Top = 456
          Width = 803
          Height = 30
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonWidth = 197
          Caption = 'ToolBar2'
          EdgeBorders = []
          Flat = True
          Images = MainForm.ImageList1
          List = True
          ShowCaptions = True
          TabOrder = 1
          Wrapable = False
          object DBNavigator2: TDBNavigator
            Left = 0
            Top = 0
            Width = 135
            Height = 22
            DataSource = MahnPrintDS
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
            TabOrder = 0
          end
          object ToolButton2: TToolButton
            Left = 135
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 13
            Style = tbsSeparator
          end
          object AlleDruckenBtn: TToolButton
            Left = 143
            Top = 0
            AutoSize = True
            Caption = 'alle &drucken'
            ImageIndex = 11
            OnClick = AlleDruckenBtnClick
          end
          object ToolButton5: TToolButton
            Left = 232
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 13
            Style = tbsSeparator
          end
          object DruckenBtn: TToolButton
            Left = 240
            Top = 0
            AutoSize = True
            Caption = 'ausgew'#228'hlte drucken'
            ImageIndex = 11
            OnClick = DruckenBtnClick
          end
          object ToolButton4: TToolButton
            Left = 373
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 12
            Style = tbsSeparator
          end
          object AlsGedrucktMarkierenBtn: TToolButton
            Left = 381
            Top = 0
            AutoSize = True
            Caption = 'ausgew'#228'hlte als gedruckt markieren'
            ImageIndex = 12
            OnClick = AlsGedrucktMarkierenBtnClick
          end
          object ToolButton9: TToolButton
            Left = 582
            Top = 0
            Width = 8
            Caption = 'ToolButton9'
            ImageIndex = 13
            Style = tbsSeparator
          end
          object AlleAlsGedrucktMarkierenBtn: TToolButton
            Left = 590
            Top = 0
            AutoSize = True
            Caption = 'alle als gedruckt markieren'
            Enabled = False
            ImageIndex = 12
            OnClick = AlleAlsGedrucktMarkierenBtnClick
          end
        end
      end
    end
  end
  object MahnTab: TOFZQuery
    Connection = DM1.DB1
    AfterOpen = MahnTabAfterOpen
    AfterScroll = MahnTabAfterScroll
    OnCalcFields = MahnTabCalcFields
    OFSecurity = DM1.CaoSecurity
    OFModulID = 2080
    OFSubModulID = 0
    UseRecordLock = False
    ShowLockErrors = False
    AutoReleaseLock = False
    Params = <
      item
        DataType = ftUnknown
        Name = 'STUFE2_TAGE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STUFE3_TAGE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STUFE4_TAGE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STUFE1_TAGE'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select '
      
        'REC_ID, QUELLE, VRENUM, RDATUM, KUN_ANREDE, KUN_NAME1, KUN_NAME2' +
        ', KUN_NAME3, '
      'BSUMME, SOLL_NTAGE, STADIUM, '
      
        'MAHNSTUFE, MAHNDATUM, MAHNSTUFE+1 as NEW_MAHNSTUFE,  FREIGABE1_F' +
        'LAG, MAHNPRINT,'
      'TO_DAYS(CURDATE())-TO_DAYS(RDATUM) as TAGE_OFFEN'
      'from JOURNAL'
      'where (QUELLE=3) and (RDATUM>'#39'2001-01-01'#39') and (BSUMME !=0) and'
      '('
      '  ('
      
        '    (STADIUM BETWEEN 20 and 29) and  (TO_DAYS(RDATUM)+SOLL_NTAGE' +
        '<TO_DAYS(CURDATE()) )'
      '  )'
      '  or'
      '  ('
      
        '    (STADIUM BETWEEN 30 and 39) and  (TO_DAYS(MAHNDATUM)+:STUFE2' +
        '_TAGE<TO_DAYS(CURDATE()) )'
      '  )'
      '  or'
      '  ('
      
        '    (STADIUM BETWEEN 40 and 49) and  (TO_DAYS(MAHNDATUM)+:STUFE3' +
        '_TAGE<TO_DAYS(CURDATE()) )'
      '  )'
      '  or'
      '  ('
      
        '    (STADIUM BETWEEN 50 and 59) and  (TO_DAYS(MAHNDATUM)+:STUFE4' +
        '_TAGE<TO_DAYS(CURDATE()) )'
      '  )'
      '  or'
      '    ('
      
        '      (STADIUM BETWEEN 70 and 79) and   (RDATUM+SOLL_NTAGE<CURDA' +
        'TE()) and'
      '      ('
      '        (MAHNSTUFE=0) or'
      
        '        ( (MAHNSTUFE>0) and  ( TO_DAYS(MAHNDATUM)+:STUFE1_TAGE <' +
        ' TO_DAYS(CURDATE()) ) )'
      '      )'
      '    )'
      ')'
      'order by RDATUM, VRENUM')
    Left = 96
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'STUFE2_TAGE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STUFE3_TAGE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STUFE4_TAGE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STUFE1_TAGE'
        ParamType = ptUnknown
      end>
    object MahnTabquelle: TIntegerField
      FieldName = 'quelle'
      Required = True
    end
    object MahnTabvrenum: TStringField
      FieldName = 'vrenum'
      Required = True
    end
    object MahnTabrdatum: TDateField
      FieldName = 'rdatum'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object MahnTabkun_name1: TStringField
      FieldName = 'kun_name1'
      Size = 40
    end
    object MahnTabbsumme: TFloatField
      FieldName = 'bsumme'
      DisplayFormat = ',#0.00'
    end
    object MahnTabTAGE_OFFEN: TLargeintField
      DisplayLabel = 'Tage offen'
      FieldName = 'TAGE_OFFEN'
      DisplayFormat = '0 Tage'
    end
    object MahnTabSOLL_NTAGE: TLargeintField
      FieldName = 'SOLL_NTAGE'
      Required = True
      DisplayFormat = '0 Tage'
    end
    object MahnTabstadium: TIntegerField
      FieldName = 'stadium'
    end
    object MahnTabmahnstufe: TIntegerField
      FieldName = 'mahnstufe'
      DisplayFormat = '0;-0; '
    end
    object MahnTabmahndatum: TDateField
      FieldName = 'mahndatum'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object MahnTabnew_mahnstufe: TLargeintField
      FieldName = 'new_mahnstufe'
      DisplayFormat = '0'
    end
    object MahnTabrec_id: TIntegerField
      FieldName = 'rec_id'
    end
    object MahnTabFREIGABE1_Flag: TBooleanField
      Alignment = taRightJustify
      DisplayLabel = 'Mahnen'
      DisplayWidth = 2
      FieldName = 'FREIGABE1_FLAG'
      Required = True
    end
    object MahnTabmahnprint: TIntegerField
      FieldName = 'mahnprint'
    end
    object MahnTabKUN_ANREDE: TStringField
      FieldName = 'KUN_ANREDE'
      Size = 40
    end
    object MahnTabKUN_NAME2: TStringField
      FieldName = 'KUN_NAME2'
      Size = 40
    end
    object MahnTabKUN_NAME3: TStringField
      FieldName = 'KUN_NAME3'
      Size = 40
    end
    object MahnTabCALC_KUNDE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_KUNDE'
      Size = 255
      Calculated = True
    end
  end
  object MahnDS: TDataSource
    DataSet = MahnTab
    Left = 256
    Top = 128
  end
  object MahnPrintDS: TDataSource
    DataSet = MahnPrintTab
    Left = 256
    Top = 176
  end
  object MahnPrintTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = MahnPrintTabAfterOpen
    AfterScroll = MahnPrintTabAfterOpen
    OnCalcFields = MahnPrintTabCalcFields
    BeforeDelete = MahnPrintTabBeforeDelete
    SQL.Strings = (
      'select '
      'REC_ID, QUELLE, VRENUM, RDATUM, ADDR_ID,'
      'NSUMME, MSUMME_0, MSUMME_1, MSUMME_2, MSUMME_3, MSUMME, BSUMME,'
      'ZAHLART, STADIUM, WAEHRUNG, '
      'SOLL_STAGE, SOLL_SKONTO, SOLL_NTAGE, '
      
        'IST_ANZAHLUNG, IST_SKONTO, IST_ZAHLDAT, IST_BETRAG, MAHNKOSTEN, ' +
        'GEGENKONTO,'
      
        'KUN_NUM, KUN_ANREDE, KUN_NAME1, KUN_NAME2, KUN_NAME3, KUN_ABTEIL' +
        'UNG, '
      'KUN_STRASSE, KUN_PLZ, KUN_LAND, KUN_ORT,'
      '(BSUMME - IST_ANZAHLUNG - IST_BETRAG) as SALDO,'
      
        'MAHNSTUFE, TO_DAYS(CURDATE())-TO_DAYS(RDATUM) as TAGE_OFFEN, MAH' +
        'NPRINT'
      'from JOURNAL'
      
        'where STADIUM BETWEEN 30 and 79 and QUELLE=3 and YEAR(RDATUM) > ' +
        '2000 and BSUMME !=0 and MAHNPRINT>0'
      'order by KUN_NAME1, ADDR_ID, RDATUM, VRENUM')
    Params = <>
    Left = 96
    Top = 176
    object MahnPrintTabquelle: TIntegerField
      FieldName = 'quelle'
      Required = True
    end
    object MahnPrintTabvrenum: TStringField
      FieldName = 'vrenum'
      Required = True
    end
    object MahnPrintTabrdatum: TDateField
      FieldName = 'rdatum'
      Required = True
    end
    object MahnPrintTabaddr_id: TIntegerField
      FieldName = 'addr_id'
      Required = True
    end
    object MahnPrintTabbsumme: TFloatField
      FieldName = 'bsumme'
      DisplayFormat = ',#0.00'
    end
    object MahnPrintTabwaehrung: TStringField
      FieldName = 'waehrung'
      Size = 5
    end
    object MahnPrintTabsoll_ntage: TIntegerField
      FieldName = 'soll_ntage'
      DisplayFormat = '0 Tage'
    end
    object MahnPrintTabmahnkosten: TFloatField
      FieldName = 'mahnkosten'
      DisplayFormat = ',#0.00'
    end
    object MahnPrintTabgegenkonto: TIntegerField
      FieldName = 'gegenkonto'
    end
    object MahnPrintTabkun_num: TStringField
      FieldName = 'kun_num'
    end
    object MahnPrintTabkun_name1: TStringField
      FieldName = 'kun_name1'
      Size = 40
    end
    object MahnPrintTabsaldo: TFloatField
      FieldName = 'saldo'
      DisplayFormat = ',#0.00'
    end
    object MahnPrintTabmahnstufe: TIntegerField
      FieldName = 'mahnstufe'
    end
    object MahnPrintTabtage_offen: TLargeintField
      FieldName = 'tage_offen'
      DisplayFormat = '0 Tage'
    end
    object MahnPrintTabrec_id: TIntegerField
      FieldName = 'rec_id'
    end
    object MahnPrintTabmahnprint: TIntegerField
      FieldName = 'mahnprint'
    end
    object MahnPrintTabCALC_KUNDE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_KUNDE'
      Size = 255
      Calculated = True
    end
    object MahnPrintTabKUN_ANREDE: TStringField
      FieldName = 'KUN_ANREDE'
      Size = 40
    end
    object MahnPrintTabKUN_NAME2: TStringField
      FieldName = 'KUN_NAME2'
      Size = 40
    end
    object MahnPrintTabKUN_NAME3: TStringField
      FieldName = 'KUN_NAME3'
      Size = 40
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
    Left = 328
    Top = 128
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        ShortCut = 16454
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Allesmarkieren1: TMenuItem
        Caption = 'alle Freigeben'
        Enabled = False
        ImageIndex = 18
        ShortCut = 16449
        OnClick = Allesmarkieren1Click
      end
      object keineMarkieren1: TMenuItem
        Caption = 'keine Freigeben'
        ImageIndex = 19
        ShortCut = 16459
        OnClick = keineMarkieren1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mahnen1: TMenuItem
        Caption = 'Mahnen'
        ImageIndex = 12
        ShortCut = 16461
        OnClick = mahnen1Click
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
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 5
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        ImageIndex = 13
        ShortCut = 116
      end
    end
  end
  object SumTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = SumTabAfterOpen
    SQL.Strings = (
      'select FREIGABE1_FLAG, COUNT(*) as ANZAHL from JOURNAL '
      
        'where QUELLE=3 and YEAR(RDATUM) > 2000 and  STADIUM BETWEEN 20 a' +
        'nd 79'
      'group BY FREIGABE1_FLAG')
    Params = <>
    Left = 100
    Top = 222
  end
end
