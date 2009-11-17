object SetupForm: TSetupForm
  Left = 351
  Top = 128
  BorderStyle = bsDialog
  Caption = 'CAO-Einstellungen'
  ClientHeight = 403
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 384
    Width = 627
    Height = 19
    Panels = <>
  end
  object NavPan: TPanel
    Left = 0
    Top = 353
    Width = 627
    Height = 31
    Align = alBottom
    BevelOuter = bvLowered
    BorderWidth = 2
    TabOrder = 1
    object ShopSaveBtn: TSpeedButton
      Left = 272
      Top = 3
      Width = 105
      Height = 25
      Caption = 'Speichern'
      Flat = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888000088877777777777777778000088000000000000000778000080BF
        B0FFFFFFF0BFB078000080FBF0F00FFFF0FBF078000080BFB0F77FFFF0BFB078
        000080FBF0FFFFFFF0FBF078000080BFBF0000000FBFB078000080FBFBFBFBFB
        FBFBF078000080BFBFBFBFBFBFBFB078000080FBFBFBFBFBFBFBF078000080BF
        BFBFBFBFBFBFB078000080FBF000000000FBF078000080BF0FFFFFFFF0BFB078
        000080FB0FCCCCCCF0FBF078000080BF0FFFFFFFF0BFB078000080FB0FCCCCCC
        F0F0F078000080BF0FFFFFFFF0BFB08800008800000000000000088800008888
        88888888888888880000}
      OnClick = ShopSaveBtnClick
    end
    object PreisCalcBtn: TSpeedButton
      Left = 480
      Top = 3
      Width = 144
      Height = 25
      Caption = 'Preise neu berechnen'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000000000000070777777777777707078078078078070707F07F07F07
        F07070777777777777707078078078078070707F07F07F07F070707777777777
        777070700000000077707070FFFFFFF077707070000000007770707777777777
        7770770000000000000777777777777777777777777777777777}
      OnClick = PreisCalcBtnClick
    end
    object ExportSetupBtn: TSpeedButton
      Left = 360
      Top = 3
      Width = 129
      Height = 25
      Caption = 'Export-Einstellungen'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777788888888888877700000000000087770FFFFFFFFF
        F087770F44444FEEF087770F4FFF4FFFF087770F4FFF4F66F087770F44444FEE
        F087770FFFFFFFFFF087770FEEEEFEFFF0877704444444444087770000000000
        0077777777777777777777777777777777777777777777777777}
      OnClick = ExportSetupBtnClick
    end
    object Nav1: TDBNavigator
      Left = 3
      Top = 3
      Width = 264
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alLeft
      Flat = True
      TabOrder = 0
    end
  end
  object PC1: TPageControl
    Left = 0
    Top = 0
    Width = 627
    Height = 353
    ActivePage = AllgTS
    Align = alClient
    HotTrack = True
    TabOrder = 2
    OnChange = PC1Change
    OnChanging = PC1Changing
    object AllgTS: TTabSheet
      Tag = 10
      Caption = 'Allgemein'
      ImageIndex = 9
      object Label41: TLabel
        Left = 5
        Top = 14
        Width = 47
        Height = 13
        Caption = 'W'#228'hrung:'
      end
      object Label4: TLabel
        Left = 275
        Top = 190
        Width = 117
        Height = 13
        Caption = 'Text f'#252'r "Zahlbar sofort":'
      end
      object Label73: TLabel
        Left = 276
        Top = 220
        Width = 30
        Height = 13
        Caption = 'Land :'
      end
      object LeitwaehrungEdit: TEdit
        Left = 96
        Top = 11
        Width = 65
        Height = 21
        TabOrder = 0
      end
      object Edit1: TEdit
        Left = 403
        Top = 186
        Width = 206
        Height = 21
        TabOrder = 4
      end
      object GlobMwstGB: TGroupBox
        Left = 423
        Top = 3
        Width = 186
        Height = 165
        Caption = 'MwSt (in %)'
        TabOrder = 3
        object Label42: TLabel
          Left = 5
          Top = 19
          Width = 45
          Height = 13
          Caption = 'MwSt (0):'
          Enabled = False
        end
        object Label43: TLabel
          Left = 5
          Top = 43
          Width = 45
          Height = 13
          Caption = 'MwSt (1):'
        end
        object Label44: TLabel
          Left = 5
          Top = 67
          Width = 45
          Height = 13
          Caption = 'MwSt (2):'
        end
        object Label45: TLabel
          Left = 5
          Top = 91
          Width = 45
          Height = 13
          Caption = 'MwSt (3):'
        end
        object Label61: TLabel
          Left = 5
          Top = 120
          Width = 40
          Height = 13
          Caption = 'Default :'
        end
        object Label69: TLabel
          Left = 8
          Top = 144
          Width = 169
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Wird f'#252'r neue Artikel werwendet'
        end
        object MWST0_EDIT: TJvCalcEdit
          Left = 80
          Top = 16
          Width = 97
          Height = 21
          DisplayFormat = '0.00 '
          Enabled = False
          FormatOnEditing = True
          MaxValue = 99.000000000000000000
          ShowButton = False
          TabOrder = 0
          ZeroEmpty = False
          DecimalPlacesAlwaysShown = False
          OnExit = MWST0_EDITExit
        end
        object MWST1_EDIT: TJvCalcEdit
          Left = 80
          Top = 40
          Width = 97
          Height = 21
          DisplayFormat = '0.00 '
          FormatOnEditing = True
          MaxValue = 99.000000000000000000
          ShowButton = False
          TabOrder = 1
          ZeroEmpty = False
          DecimalPlacesAlwaysShown = False
          OnExit = MWST0_EDITExit
        end
        object MWST2_EDIT: TJvCalcEdit
          Left = 80
          Top = 64
          Width = 97
          Height = 21
          DisplayFormat = '0.00 '
          FormatOnEditing = True
          MaxValue = 99.000000000000000000
          ShowButton = False
          TabOrder = 2
          ZeroEmpty = False
          DecimalPlacesAlwaysShown = False
          OnExit = MWST0_EDITExit
        end
        object MWST3_EDIT: TJvCalcEdit
          Left = 80
          Top = 88
          Width = 97
          Height = 21
          DisplayFormat = '0.00 '
          FormatOnEditing = True
          MaxValue = 99.000000000000000000
          ShowButton = False
          TabOrder = 3
          ZeroEmpty = False
          DecimalPlacesAlwaysShown = False
          OnExit = MWST0_EDITExit
        end
        object DefMwstCB: TComboBox
          Left = 80
          Top = 116
          Width = 98
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
        end
      end
      object GlobCalcGB: TGroupBox
        Left = 266
        Top = 3
        Width = 143
        Height = 165
        Caption = 'Kalkulation (Multiplikator)'
        TabOrder = 2
        object Label40: TLabel
          Left = 5
          Top = 19
          Width = 20
          Height = 13
          Caption = 'VK1'
        end
        object Label46: TLabel
          Left = 5
          Top = 43
          Width = 20
          Height = 13
          Caption = 'VK2'
        end
        object Label47: TLabel
          Left = 5
          Top = 67
          Width = 20
          Height = 13
          Caption = 'VK3'
        end
        object Label48: TLabel
          Left = 5
          Top = 91
          Width = 20
          Height = 13
          Caption = 'VK4'
        end
        object Label49: TLabel
          Left = 5
          Top = 115
          Width = 20
          Height = 13
          Caption = 'VK5'
        end
        object Label50: TLabel
          Left = 5
          Top = 139
          Width = 30
          Height = 13
          Caption = 'SHOP'
        end
        object VK1_CALC: TJvCalcEdit
          Left = 44
          Top = 16
          Width = 90
          Height = 21
          DecimalPlaces = 5
          DisplayFormat = '0.00000 '
          FormatOnEditing = True
          MaxValue = 99.000000000000000000
          ShowButton = False
          TabOrder = 0
          ZeroEmpty = False
          DecimalPlacesAlwaysShown = False
        end
        object VK2_CALC: TJvCalcEdit
          Left = 44
          Top = 40
          Width = 90
          Height = 21
          DecimalPlaces = 5
          DisplayFormat = '0.00000 '
          FormatOnEditing = True
          MaxValue = 99.000000000000000000
          ShowButton = False
          TabOrder = 1
          ZeroEmpty = False
          DecimalPlacesAlwaysShown = False
        end
        object VK3_CALC: TJvCalcEdit
          Left = 44
          Top = 64
          Width = 90
          Height = 21
          DecimalPlaces = 5
          DisplayFormat = '0.00000 '
          FormatOnEditing = True
          MaxValue = 99.000000000000000000
          ShowButton = False
          TabOrder = 2
          ZeroEmpty = False
          DecimalPlacesAlwaysShown = False
        end
        object VK4_CALC: TJvCalcEdit
          Left = 44
          Top = 88
          Width = 90
          Height = 21
          DecimalPlaces = 5
          DisplayFormat = '0.00000 '
          FormatOnEditing = True
          MaxValue = 99.000000000000000000
          ShowButton = False
          TabOrder = 3
          ZeroEmpty = False
          DecimalPlacesAlwaysShown = False
        end
        object VK5_CALC: TJvCalcEdit
          Left = 44
          Top = 112
          Width = 90
          Height = 21
          DecimalPlaces = 5
          DisplayFormat = '0.00000 '
          FormatOnEditing = True
          MaxValue = 99.000000000000000000
          ShowButton = False
          TabOrder = 4
          ZeroEmpty = False
          DecimalPlacesAlwaysShown = False
        end
        object SVK_CALC: TJvCalcEdit
          Left = 44
          Top = 136
          Width = 90
          Height = 21
          DecimalPlaces = 5
          DisplayFormat = '0.00000 '
          FormatOnEditing = True
          MaxValue = 99.000000000000000000
          ShowButton = False
          TabOrder = 5
          ZeroEmpty = False
          DecimalPlacesAlwaysShown = False
        end
      end
      object UseKFZCB: TCheckBox
        Left = 3
        Top = 38
        Width = 158
        Height = 17
        Alignment = taLeftJustify
        Caption = 'KFZ-Verwaltung '
        TabOrder = 1
      end
      object LandEdi: TVolgaDBEdit
        Left = 404
        Top = 216
        Width = 53
        Height = 21
        ButtonWidth = 18
        DropDownWidth = 206
        DialogStyle = vdsLookup
        LookupDataSet = DM1.LandTab
        LookupProps.LookupKeyField = 'ID'
        LookupProps.ListFieldNames = 'ID;NAME'
        Style = vcsDropDownList
        TabOrder = 5
        OnChange = LandEdiChange
      end
      object LandLangEdi: TEdit
        Left = 463
        Top = 215
        Width = 146
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 6
      end
      object UseBrowserCB: TCheckBox
        Left = 3
        Top = 62
        Width = 158
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Browser '
        TabOrder = 7
      end
    end
    object FirmDat1Tab: TTabSheet
      Tag = 7
      Caption = 'Firmendaten (1)'
      ImageIndex = 6
      object Label9: TLabel
        Left = 5
        Top = 11
        Width = 34
        Height = 13
        Caption = 'Anrede'
      end
      object Label10: TLabel
        Left = 5
        Top = 35
        Width = 37
        Height = 13
        Caption = 'Name 1'
      end
      object Label11: TLabel
        Left = 5
        Top = 59
        Width = 37
        Height = 13
        Caption = 'Name 2'
      end
      object Label12: TLabel
        Left = 5
        Top = 83
        Width = 37
        Height = 13
        Caption = 'Name 3'
      end
      object Label13: TLabel
        Left = 5
        Top = 107
        Width = 31
        Height = 13
        Caption = 'Stra'#223'e'
      end
      object Label14: TLabel
        Left = 5
        Top = 131
        Width = 24
        Height = 13
        Caption = 'Land'
      end
      object Label15: TLabel
        Left = 5
        Top = 155
        Width = 14
        Height = 13
        Caption = 'Ort'
      end
      object Label16: TLabel
        Left = 117
        Top = 131
        Width = 20
        Height = 13
        Caption = 'PLZ'
      end
      object Label17: TLabel
        Left = 5
        Top = 187
        Width = 45
        Height = 13
        Caption = 'Absender'
      end
      object Label19: TLabel
        Left = 253
        Top = 11
        Width = 45
        Height = 13
        Caption = 'Telefon 1'
      end
      object Label20: TLabel
        Left = 253
        Top = 35
        Width = 45
        Height = 13
        Caption = 'Telefon 2'
      end
      object Label21: TLabel
        Left = 253
        Top = 59
        Width = 20
        Height = 13
        Caption = 'FAX'
      end
      object Label22: TLabel
        Left = 253
        Top = 83
        Width = 46
        Height = 13
        Caption = 'Mobilfunk'
      end
      object Label23: TLabel
        Left = 253
        Top = 107
        Width = 25
        Height = 13
        Caption = 'Email'
      end
      object Label24: TLabel
        Left = 253
        Top = 131
        Width = 45
        Height = 13
        Caption = 'Webseite'
      end
      object Label25: TLabel
        Left = 5
        Top = 259
        Width = 34
        Height = 13
        Caption = 'Bank 1'
      end
      object Label26: TLabel
        Left = 413
        Top = 259
        Width = 37
        Height = 13
        Caption = 'Konto 1'
      end
      object Label27: TLabel
        Left = 221
        Top = 259
        Width = 29
        Height = 13
        Caption = 'BLZ 1'
      end
      object Label28: TLabel
        Left = 5
        Top = 283
        Width = 34
        Height = 13
        Caption = 'Bank 2'
      end
      object Label29: TLabel
        Left = 413
        Top = 283
        Width = 37
        Height = 13
        Caption = 'Konto 2'
      end
      object Label30: TLabel
        Left = 221
        Top = 283
        Width = 29
        Height = 13
        Caption = 'BLZ 2'
      end
      object Label31: TLabel
        Left = 0
        Top = 308
        Width = 617
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'Diese Bankdaten werden nur in Formularen verwendet !'
        WordWrap = True
      end
      object Label34: TLabel
        Left = 437
        Top = 13
        Width = 48
        Height = 13
        Caption = 'Steuer-Nr.'
      end
      object Label35: TLabel
        Left = 437
        Top = 35
        Width = 36
        Height = 13
        Caption = 'UST-ID'
      end
      object FirAnrede: TDBEdit
        Left = 56
        Top = 8
        Width = 185
        Height = 21
        DataField = 'ANREDE'
        DataSource = DM1.FirmaDS
        TabOrder = 0
      end
      object FirName1: TDBEdit
        Left = 56
        Top = 32
        Width = 185
        Height = 21
        DataField = 'NAME1'
        DataSource = DM1.FirmaDS
        TabOrder = 1
      end
      object FirName2: TDBEdit
        Left = 56
        Top = 56
        Width = 185
        Height = 21
        DataField = 'NAME2'
        DataSource = DM1.FirmaDS
        TabOrder = 2
      end
      object FirName3: TDBEdit
        Left = 56
        Top = 80
        Width = 185
        Height = 21
        DataField = 'NAME3'
        DataSource = DM1.FirmaDS
        TabOrder = 3
      end
      object FirStrasse: TDBEdit
        Left = 56
        Top = 104
        Width = 185
        Height = 21
        DataField = 'STRASSE'
        DataSource = DM1.FirmaDS
        TabOrder = 4
      end
      object FirLand: TDBEdit
        Left = 56
        Top = 128
        Width = 57
        Height = 21
        DataField = 'LAND'
        DataSource = DM1.FirmaDS
        TabOrder = 5
      end
      object FirPLZ: TDBEdit
        Left = 144
        Top = 128
        Width = 97
        Height = 21
        DataField = 'PLZ'
        DataSource = DM1.FirmaDS
        TabOrder = 6
      end
      object FirOrt: TDBEdit
        Left = 56
        Top = 152
        Width = 185
        Height = 21
        DataField = 'ORT'
        DataSource = DM1.FirmaDS
        TabOrder = 7
      end
      object FirAbsender: TDBEdit
        Left = 56
        Top = 184
        Width = 185
        Height = 21
        DataField = 'ABSENDER'
        DataSource = DM1.FirmaDS
        TabOrder = 8
      end
      object FirTele1: TDBEdit
        Left = 304
        Top = 8
        Width = 128
        Height = 21
        DataField = 'TELEFON1'
        DataSource = DM1.FirmaDS
        TabOrder = 9
      end
      object FirTele2: TDBEdit
        Left = 304
        Top = 32
        Width = 128
        Height = 21
        DataField = 'TELEFON2'
        DataSource = DM1.FirmaDS
        TabOrder = 10
      end
      object FirFax: TDBEdit
        Left = 304
        Top = 56
        Width = 128
        Height = 21
        DataField = 'FAX'
        DataSource = DM1.FirmaDS
        TabOrder = 11
      end
      object FirMobil: TDBEdit
        Left = 304
        Top = 80
        Width = 128
        Height = 21
        DataField = 'MOBILFUNK'
        DataSource = DM1.FirmaDS
        TabOrder = 12
      end
      object FirEMail: TDBEdit
        Left = 304
        Top = 104
        Width = 128
        Height = 21
        DataField = 'EMAIL'
        DataSource = DM1.FirmaDS
        TabOrder = 13
      end
      object FirWebsite: TDBEdit
        Left = 304
        Top = 128
        Width = 128
        Height = 21
        DataField = 'WEBSEITE'
        DataSource = DM1.FirmaDS
        TabOrder = 14
      end
      object FirBank1: TDBEdit
        Left = 56
        Top = 256
        Width = 161
        Height = 21
        DataField = 'BANK1_NAME'
        DataSource = DM1.FirmaDS
        TabOrder = 17
      end
      object FirKto1: TDBEdit
        Left = 456
        Top = 256
        Width = 158
        Height = 21
        DataField = 'BANK1_KONTONR'
        DataSource = DM1.FirmaDS
        TabOrder = 19
      end
      object FirBLZ1: TDBEdit
        Left = 256
        Top = 256
        Width = 145
        Height = 21
        DataField = 'BANK1_BLZ'
        DataSource = DM1.FirmaDS
        TabOrder = 18
      end
      object FirBank2: TDBEdit
        Left = 56
        Top = 280
        Width = 161
        Height = 21
        DataField = 'BANK2_NAME'
        DataSource = DM1.FirmaDS
        TabOrder = 20
      end
      object FirKto2: TDBEdit
        Left = 456
        Top = 280
        Width = 158
        Height = 21
        DataField = 'BANK2_KONTONR'
        DataSource = DM1.FirmaDS
        TabOrder = 22
      end
      object FirBLZ2: TDBEdit
        Left = 256
        Top = 280
        Width = 145
        Height = 21
        DataField = 'BANK2_BLZ'
        DataSource = DM1.FirmaDS
        TabOrder = 21
      end
      object FirSteuerNo: TDBEdit
        Left = 494
        Top = 8
        Width = 113
        Height = 21
        DataField = 'STEUERNUMMER'
        DataSource = DM1.FirmaDS
        TabOrder = 15
      end
      object FirUSRID: TDBEdit
        Left = 494
        Top = 32
        Width = 113
        Height = 21
        DataField = 'UST_ID'
        DataSource = DM1.FirmaDS
        TabOrder = 16
      end
    end
    object FirmDat2Tab: TTabSheet
      Tag = 8
      Caption = 'Firmendaten (2)'
      ImageIndex = 7
      object Label32: TLabel
        Left = 2
        Top = 0
        Width = 213
        Height = 13
        Caption = 'allgemeiner Kopftext f'#252'r Formulare (RTF-Text)'
      end
      object Label33: TLabel
        Left = 2
        Top = 168
        Width = 209
        Height = 13
        Caption = 'allgemeiner Fu'#223'text f'#252'r Formulare (RTF-Text)'
      end
      object DBRichEdit1: TDBRichEdit
        Left = 0
        Top = 16
        Width = 611
        Height = 145
        DataField = 'KOPFTEXT'
        DataSource = DM1.FirmaDS
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
      object DBRichEdit2: TDBRichEdit
        Left = 1
        Top = 184
        Width = 611
        Height = 139
        DataField = 'FUSSTEXT'
        DataSource = DM1.FirmaDS
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
      end
    end
    object NumTab: TTabSheet
      Tag = 1
      Caption = 'Nummernkreise'
      object NumGrid: TOFDBGrid
        Left = 6
        Top = 3
        Width = 606
        Height = 318
        DataSource = NumDS
        DefaultDrawing = False
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
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
        ShowTitleEllipsis = True
        DefaultRowHeight = 18
        EditColor = clBlack
        Columns = <
          item
            Expanded = False
            FieldName = 'NAME'
            ReadOnly = True
            Title.Caption = 'Nummernkreis'
            Width = 231
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUELLE'
            ReadOnly = True
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'MAXLEN'
            Title.Caption = 'max. L'#228'nge'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FORMAT'
            Title.Caption = 'Anzeigeformat'
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NEXT_NUM'
            Title.Caption = 'n'#228'. zu vergebende Nummer'
            Width = 152
            Visible = True
          end>
      end
    end
    object ZahlartTab: TTabSheet
      Tag = 2
      Caption = 'Zahlungsarten'
      ImageIndex = 1
      object Label1: TLabel
        Left = 8
        Top = 262
        Width = 41
        Height = 13
        Caption = 'Langtext'
      end
      object DBGrid1: TOFDBGrid
        Left = 6
        Top = 3
        Width = 606
        Height = 255
        DataSource = ZahlArtDS
        DefaultDrawing = False
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
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
        ShowTitleEllipsis = True
        DefaultRowHeight = 18
        EditColor = clBlack
        Columns = <
          item
            Expanded = False
            FieldName = 'ZAHL_ID'
            ReadOnly = True
            Title.Caption = 'ID'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SKONTO_PROZ'
            Title.Caption = 'Skonto in %'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SKONTO_TAGE'
            Title.Caption = 'Skonto Tage'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NETTO_TAGE'
            Title.Caption = 'Netto Tage'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LANGBEZ'
            Title.Caption = 'Kurztext'
            Width = 340
            Visible = True
          end>
      end
      object DBMemo1: TDBMemo
        Left = 6
        Top = 278
        Width = 606
        Height = 43
        DataField = 'TEXT'
        DataSource = ZahlArtDS
        TabOrder = 1
      end
    end
    object LiefArtTab: TTabSheet
      Tag = 3
      Caption = 'Lieferarten'
      ImageIndex = 2
      object Label2: TLabel
        Left = 8
        Top = 262
        Width = 41
        Height = 13
        Caption = 'Langtext'
      end
      object DBMemo2: TDBMemo
        Left = 6
        Top = 278
        Width = 606
        Height = 43
        DataField = 'TEXT'
        DataSource = LiefArtDS
        TabOrder = 0
      end
      object DBGrid2: TOFDBGrid
        Left = 6
        Top = 3
        Width = 606
        Height = 255
        DataSource = LiefArtDS
        DefaultDrawing = False
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        TabOrder = 1
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
        ShowTitleEllipsis = True
        DefaultRowHeight = 18
        EditColor = clBlack
        Columns = <
          item
            Expanded = False
            FieldName = 'LIEF_ID'
            ReadOnly = True
            Title.Caption = 'ID'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LANGBEZ'
            Title.Caption = 'Kurztext'
            Width = 544
            Visible = True
          end>
      end
    end
    object KunGrTab: TTabSheet
      Tag = 4
      Caption = 'Adressgruppen'
      ImageIndex = 3
      object Label3: TLabel
        Left = 8
        Top = 262
        Width = 143
        Height = 13
        Caption = 'SQL-Statement ohne SELECT'
      end
      object DBGrid3: TOFDBGrid
        Left = 6
        Top = 3
        Width = 606
        Height = 255
        DataSource = KunGrDS
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
        RowColor2 = clWindow
        ShowTitleEllipsis = True
        DefaultRowHeight = 18
        EditColor = clBlack
        Columns = <
          item
            Expanded = False
            FieldName = 'GR'
            Title.Caption = 'ID'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LANGBEZ'
            Title.Caption = 'Beschreibung'
            Width = 544
            Visible = True
          end>
      end
      object DBMemo3: TDBMemo
        Left = 6
        Top = 278
        Width = 605
        Height = 43
        DataField = 'SQL_STATEMENT'
        DataSource = KunGrDS
        TabOrder = 1
      end
    end
    object AdressenTab: TTabSheet
      Tag = 11
      Caption = 'Adressen'
      ImageIndex = 9
      object AddrMerkmalGB: TGroupBox
        Left = 256
        Top = 3
        Width = 356
        Height = 240
        Caption = 'Merkmale'
        TabOrder = 1
        object AddrMerkmalGrid: TOFDBGrid
          Left = 8
          Top = 16
          Width = 338
          Height = 215
          Ctl3D = True
          DataSource = MerkmalDS
          DefaultDrawing = False
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
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
          ShowTitleEllipsis = True
          DefaultRowHeight = 17
          EditColor = clBlack
          Columns = <
            item
              Expanded = False
              FieldName = 'MERKMAL_ID'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Width = 265
              Visible = True
            end>
        end
      end
      object AddrUserFeldGB: TGroupBox
        Left = 5
        Top = 3
        Width = 213
        Height = 240
        Caption = 'Benutzerfelder (noch nicht fertig !)'
        Enabled = False
        TabOrder = 0
        object Label56: TLabel
          Left = 180
          Top = 8
          Width = 24
          Height = 13
          Caption = 'Aktiv'
        end
        object AddrUserFeld1: TEdit
          Left = 8
          Top = 25
          Width = 159
          Height = 21
          TabOrder = 0
        end
        object AddrUserFeld2: TEdit
          Left = 8
          Top = 46
          Width = 159
          Height = 21
          TabOrder = 2
        end
        object AddrUserFeld3: TEdit
          Left = 8
          Top = 67
          Width = 159
          Height = 21
          TabOrder = 4
        end
        object AddrUserFeld4: TEdit
          Left = 8
          Top = 88
          Width = 159
          Height = 21
          TabOrder = 6
        end
        object AddrUserFeld5: TEdit
          Left = 8
          Top = 109
          Width = 159
          Height = 21
          TabOrder = 8
        end
        object AddrUserFeld6: TEdit
          Left = 8
          Top = 130
          Width = 159
          Height = 21
          TabOrder = 10
        end
        object AddrUserFeld7: TEdit
          Left = 8
          Top = 151
          Width = 159
          Height = 21
          TabOrder = 12
        end
        object AddrUserFeld8: TEdit
          Left = 8
          Top = 172
          Width = 159
          Height = 21
          TabOrder = 14
        end
        object AddrUserFeld9: TEdit
          Left = 8
          Top = 193
          Width = 159
          Height = 21
          TabOrder = 16
        end
        object AddrUserFeld10: TEdit
          Left = 8
          Top = 214
          Width = 159
          Height = 21
          TabOrder = 18
        end
        object ADUF1: TCheckBox
          Left = 185
          Top = 25
          Width = 26
          Height = 17
          TabOrder = 1
        end
        object ADUF2: TCheckBox
          Left = 185
          Top = 46
          Width = 26
          Height = 17
          TabOrder = 3
        end
        object ADUF3: TCheckBox
          Left = 185
          Top = 67
          Width = 26
          Height = 17
          TabOrder = 5
        end
        object ADUF4: TCheckBox
          Left = 185
          Top = 88
          Width = 26
          Height = 17
          TabOrder = 7
        end
        object ADUF5: TCheckBox
          Left = 185
          Top = 109
          Width = 26
          Height = 17
          TabOrder = 9
        end
        object ADUF6: TCheckBox
          Left = 185
          Top = 130
          Width = 26
          Height = 17
          TabOrder = 11
        end
        object ADUF7: TCheckBox
          Left = 185
          Top = 151
          Width = 26
          Height = 17
          TabOrder = 13
        end
        object ADUF8: TCheckBox
          Left = 185
          Top = 172
          Width = 26
          Height = 17
          TabOrder = 15
        end
        object ADUF9: TCheckBox
          Left = 185
          Top = 193
          Width = 26
          Height = 17
          TabOrder = 17
        end
        object ADUF10: TCheckBox
          Left = 185
          Top = 214
          Width = 26
          Height = 17
          TabOrder = 19
        end
      end
      object AddrAlgGB: TGroupBox
        Left = 4
        Top = 248
        Width = 609
        Height = 72
        Caption = 'Diverses'
        TabOrder = 2
        object Kunnum1Edi_CB: TCheckBox
          Left = 11
          Top = 16
          Width = 144
          Height = 17
          Caption = 'Kundennummer editierbar'
          TabOrder = 0
        end
      end
    end
    object ArtGrTab: TTabSheet
      Tag = 5
      Caption = 'Warengruppen / Kalkulation'
      ImageIndex = 4
      object Label57: TLabel
        Left = 311
        Top = 12
        Width = 17
        Height = 13
        Caption = 'Nr.:'
      end
      object Label58: TLabel
        Left = 311
        Top = 34
        Width = 68
        Height = 13
        Caption = 'Beschreibung:'
      end
      object Label59: TLabel
        Left = 311
        Top = 140
        Width = 90
        Height = 13
        Caption = 'Default Erl'#246'skonto:'
      end
      object Label60: TLabel
        Left = 311
        Top = 115
        Width = 114
        Height = 13
        Caption = 'Default Aufwandskonto:'
      end
      object Label62: TLabel
        Left = 311
        Top = 56
        Width = 101
        Height = 13
        Caption = #252'berg. Warengruppe:'
      end
      object Label63: TLabel
        Left = 309
        Top = 172
        Width = 116
        Height = 13
        AutoSize = False
        Caption = 'Default MwSt:'
      end
      object Label64: TLabel
        Left = 309
        Top = 211
        Width = 116
        Height = 13
        AutoSize = False
        Caption = 'Kalkulationsfaktor VK1:'
      end
      object Label65: TLabel
        Left = 309
        Top = 235
        Width = 116
        Height = 13
        AutoSize = False
        Caption = 'Kalkulationsfaktor VK2:'
      end
      object Label66: TLabel
        Left = 309
        Top = 259
        Width = 116
        Height = 13
        AutoSize = False
        Caption = 'Kalkulationsfaktor VK3:'
      end
      object Label67: TLabel
        Left = 309
        Top = 283
        Width = 116
        Height = 13
        AutoSize = False
        Caption = 'Kalkulationsfaktor VK4:'
      end
      object Label68: TLabel
        Left = 309
        Top = 307
        Width = 116
        Height = 13
        AutoSize = False
        Caption = 'Kalkulationsfaktor VK5:'
      end
      object DBGrid4: TOFDBGrid
        Left = 6
        Top = 3
        Width = 291
        Height = 318
        DataSource = ArtGrDS
        DefaultDrawing = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete]
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
        ShowTitleEllipsis = True
        DefaultRowHeight = 18
        EditColor = clBlack
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = 'Nr.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Caption = 'Beschreibung'
            Width = 220
            Visible = True
          end>
      end
      object WGNumEdi: TDBEdit
        Left = 430
        Top = 8
        Width = 185
        Height = 21
        DataField = 'ID'
        DataSource = ArtGrDS
        TabOrder = 1
      end
      object WGDescEdi: TDBEdit
        Left = 430
        Top = 30
        Width = 185
        Height = 21
        DataField = 'NAME'
        DataSource = ArtGrDS
        TabOrder = 2
      end
      object WgrDefEKtoEdi: TDBEdit
        Left = 430
        Top = 136
        Width = 185
        Height = 21
        DataField = 'DEF_EKTO'
        DataSource = ArtGrDS
        TabOrder = 6
      end
      object WGTopGRCB: TDBLookupComboBox
        Left = 430
        Top = 52
        Width = 185
        Height = 21
        DataField = 'TOP_ID'
        DataSource = ArtGrDS
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = WgrLo
        TabOrder = 3
      end
      object WgrDefAKtoEdi: TDBEdit
        Left = 430
        Top = 112
        Width = 185
        Height = 21
        DataField = 'DEF_AKTO'
        DataSource = ArtGrDS
        TabOrder = 5
      end
      object WgrDefSteuer: TJvDBComboBox
        Left = 430
        Top = 168
        Width = 185
        Height = 21
        DataField = 'STEUER_CODE'
        DataSource = ArtGrDS
        ItemHeight = 13
        TabOrder = 7
        Values.Strings = (
          '0'
          '1'
          '2'
          '3')
      end
      object NoTopWgrBtn: TBitBtn
        Left = 430
        Top = 77
        Width = 185
        Height = 23
        Caption = 'Keine '#252'bergeordnete Warengruppe'
        TabOrder = 4
        OnClick = NoTopWgrBtnClick
      end
      object WgrClac1Edi: TDBEdit
        Left = 430
        Top = 205
        Width = 185
        Height = 21
        DataField = 'VK1_FAKTOR'
        DataSource = ArtGrDS
        TabOrder = 8
      end
      object WgrClac2Edi: TDBEdit
        Left = 430
        Top = 229
        Width = 185
        Height = 21
        DataField = 'VK2_FAKTOR'
        DataSource = ArtGrDS
        TabOrder = 9
      end
      object WgrClac3Edi: TDBEdit
        Left = 430
        Top = 253
        Width = 185
        Height = 21
        DataField = 'VK3_FAKTOR'
        DataSource = ArtGrDS
        TabOrder = 10
      end
      object WgrClac4Edi: TDBEdit
        Left = 430
        Top = 277
        Width = 185
        Height = 21
        DataField = 'VK4_FAKTOR'
        DataSource = ArtGrDS
        TabOrder = 11
      end
      object WgrClac5Edi: TDBEdit
        Left = 430
        Top = 301
        Width = 185
        Height = 21
        DataField = 'VK5_FAKTOR'
        DataSource = ArtGrDS
        TabOrder = 12
      end
    end
    object ArtikelTab: TTabSheet
      Tag = 12
      Caption = 'Artikel'
      ImageIndex = 10
      object ArtUserFeldGB: TGroupBox
        Left = 5
        Top = 3
        Width = 213
        Height = 240
        Caption = ' Benutzerfelder '
        TabOrder = 0
        object Label100: TLabel
          Left = 180
          Top = 8
          Width = 24
          Height = 13
          Caption = 'Aktiv'
        end
        object ArtUserFeld1: TEdit
          Left = 8
          Top = 25
          Width = 159
          Height = 21
          TabOrder = 0
        end
        object ArtUserFeld2: TEdit
          Left = 8
          Top = 46
          Width = 159
          Height = 21
          TabOrder = 2
        end
        object ArtUserFeld3: TEdit
          Left = 8
          Top = 67
          Width = 159
          Height = 21
          TabOrder = 4
        end
        object ArtUserFeld4: TEdit
          Left = 8
          Top = 88
          Width = 159
          Height = 21
          TabOrder = 6
        end
        object ArtUserFeld5: TEdit
          Left = 8
          Top = 109
          Width = 159
          Height = 21
          TabOrder = 8
        end
        object ArtUserFeld6: TEdit
          Left = 8
          Top = 130
          Width = 159
          Height = 21
          TabOrder = 10
        end
        object ArtUserFeld7: TEdit
          Left = 8
          Top = 151
          Width = 159
          Height = 21
          TabOrder = 12
        end
        object ArtUserFeld8: TEdit
          Left = 8
          Top = 172
          Width = 159
          Height = 21
          TabOrder = 14
        end
        object ArtUserFeld9: TEdit
          Left = 8
          Top = 193
          Width = 159
          Height = 21
          TabOrder = 16
        end
        object ArtUserFeld10: TEdit
          Left = 8
          Top = 214
          Width = 159
          Height = 21
          TabOrder = 18
        end
        object ARUF1: TCheckBox
          Left = 185
          Top = 25
          Width = 26
          Height = 17
          TabOrder = 1
        end
        object ARUF2: TCheckBox
          Left = 185
          Top = 46
          Width = 26
          Height = 17
          TabOrder = 3
        end
        object ARUF3: TCheckBox
          Left = 185
          Top = 67
          Width = 26
          Height = 17
          TabOrder = 5
        end
        object ARUF4: TCheckBox
          Left = 185
          Top = 88
          Width = 26
          Height = 17
          TabOrder = 7
        end
        object ARUF5: TCheckBox
          Left = 185
          Top = 109
          Width = 26
          Height = 17
          TabOrder = 9
        end
        object ARUF6: TCheckBox
          Left = 185
          Top = 130
          Width = 26
          Height = 17
          TabOrder = 11
        end
        object ARUF7: TCheckBox
          Left = 185
          Top = 151
          Width = 26
          Height = 17
          TabOrder = 13
        end
        object ARUF8: TCheckBox
          Left = 185
          Top = 172
          Width = 26
          Height = 17
          TabOrder = 15
        end
        object ARUF9: TCheckBox
          Left = 185
          Top = 193
          Width = 26
          Height = 17
          TabOrder = 17
        end
        object ARUF10: TCheckBox
          Left = 185
          Top = 214
          Width = 26
          Height = 17
          TabOrder = 19
        end
      end
      object ArtMerkmalGB: TGroupBox
        Left = 256
        Top = 3
        Width = 356
        Height = 240
        Caption = 'Merkmale'
        TabOrder = 1
      end
      object GroupBox7: TGroupBox
        Left = 4
        Top = 248
        Width = 609
        Height = 72
        Caption = 'Diverses'
        TabOrder = 2
        object Label70: TLabel
          Left = 13
          Top = 44
          Width = 87
          Height = 13
          Caption = 'Anzahl VK-Preise :'
        end
        object Label71: TLabel
          Left = 390
          Top = 21
          Width = 128
          Height = 13
          Caption = 'Bruttopreis-Rundungswert :'
        end
        object Label72: TLabel
          Left = 390
          Top = 45
          Width = 133
          Height = 13
          Caption = 'max. Brutto-Netto-Differenz :'
        end
        object ArtnumAutoCB: TCheckBox
          Left = 11
          Top = 16
          Width = 310
          Height = 17
          Caption = 'Artikelnummer autom. vergeben (wenn leer beim Speichern)'
          TabOrder = 0
        end
        object AnzPreisCB: TComboBox
          Left = 104
          Top = 39
          Width = 65
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            '2'
            '3'
            '4'
            '5')
        end
        object BRRundWert: TJvSpinEdit
          Left = 528
          Top = 16
          Width = 74
          Height = 21
          CheckOptions = [coCheckOnChange, coCheckOnExit]
          DisplayFormat = ',#0.00'
          Increment = 0.010000000000000000
          MaxValue = 999.000000000000000000
          MinValue = 0.010000000000000000
          ValueType = vtFloat
          Value = 0.010000000000000000
          TabOrder = 2
        end
        object BN_CalcSchranke: TJvSpinEdit
          Left = 528
          Top = 40
          Width = 74
          Height = 21
          CheckOptions = [coCheckOnChange, coCheckOnExit]
          DisplayFormat = ',#0.00'
          Increment = 0.010000000000000000
          MaxValue = 999.000000000000000000
          MinValue = 0.010000000000000000
          ValueType = vtFloat
          Value = 0.010000000000000000
          TabOrder = 3
        end
      end
    end
    object FirKontenTab: TTabSheet
      Tag = 6
      Caption = 'Firmen-Konten'
      ImageIndex = 5
      object Label5: TLabel
        Left = 5
        Top = 12
        Width = 92
        Height = 13
        AutoSize = False
        Caption = 'Kurzbezeichnung'
      end
      object Label6: TLabel
        Left = 5
        Top = 36
        Width = 73
        Height = 13
        AutoSize = False
        Caption = 'Inhaber'
      end
      object Label7: TLabel
        Left = 397
        Top = 12
        Width = 73
        Height = 13
        AutoSize = False
        Caption = 'Konto'
      end
      object Label8: TLabel
        Left = 397
        Top = 36
        Width = 73
        Height = 13
        AutoSize = False
        Caption = 'Bankleitzahl'
      end
      object Label79: TLabel
        Left = 397
        Top = 60
        Width = 73
        Height = 13
        AutoSize = False
        Caption = 'FIBU-Konto'
      end
      object Bevel1: TBevel
        Left = 8
        Top = 95
        Width = 603
        Height = 9
        Shape = bsTopLine
      end
      object Label80: TLabel
        Left = 24
        Top = 89
        Width = 65
        Height = 13
        Caption = ' Konten-Liste '
      end
      object DBEdit1: TDBEdit
        Left = 96
        Top = 8
        Width = 289
        Height = 21
        DataField = 'KURZBEZ'
        DataSource = FirKontenDS
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 96
        Top = 32
        Width = 289
        Height = 21
        DataField = 'INHABER'
        DataSource = FirKontenDS
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 463
        Top = 8
        Width = 146
        Height = 21
        DataField = 'KTONR'
        DataSource = FirKontenDS
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 463
        Top = 32
        Width = 146
        Height = 21
        DataField = 'BLZ'
        DataSource = FirKontenDS
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 463
        Top = 56
        Width = 146
        Height = 21
        DataField = 'FIBU_KTO'
        DataSource = FirKontenDS
        TabOrder = 4
      end
      object FirKtoGrid: TOFDBGrid
        Left = 6
        Top = 112
        Width = 606
        Height = 207
        DataSource = FirKontenDS
        DefaultDrawing = False
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
        TabOrder = 5
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
        ShowTitleEllipsis = True
        DefaultRowHeight = 18
        EditColor = clBlack
        Columns = <
          item
            Expanded = False
            FieldName = 'KURZBEZ'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INHABER'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BLZ'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KTONR'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FIBU_KTO'
            Width = 60
            Visible = True
          end>
      end
    end
    object EMailTab: TTabSheet
      Tag = 13
      Caption = 'EMail / Belege'
      ImageIndex = 11
      object Label74: TLabel
        Left = 5
        Top = 8
        Width = 27
        Height = 13
        Caption = 'Beleg'
      end
      object Label75: TLabel
        Left = 202
        Top = 8
        Width = 91
        Height = 13
        Caption = 'Betreff f'#252'r die eMail'
      end
      object Label76: TLabel
        Left = 202
        Top = 56
        Width = 75
        Height = 13
        Caption = 'Nachrichtentext'
      end
      object BelegLB: TListBox
        Left = 4
        Top = 27
        Width = 173
        Height = 295
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 16
        Items.Strings = (
          'Angebot'
          'Rechnung'
          'Lieferschein'
          'EK-Bestellung'
          'Mahnung'
          'Textverarbeitung')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnClick = BelegLBClick
      end
      object EMailBetreff: TEdit
        Left = 200
        Top = 27
        Width = 414
        Height = 21
        TabOrder = 1
      end
      object eMailBodyMemo: TMemo
        Left = 200
        Top = 72
        Width = 414
        Height = 249
        ScrollBars = ssVertical
        TabOrder = 2
      end
    end
    object PfadTS: TTabSheet
      Tag = 14
      Caption = 'Verzeichnisse'
      ImageIndex = 12
      object Label51: TLabel
        Left = 5
        Top = 12
        Width = 92
        Height = 13
        AutoSize = False
        Caption = 'Datensicherung'
      end
      object Label52: TLabel
        Left = 5
        Top = 36
        Width = 94
        Height = 13
        AutoSize = False
        Caption = 'Temp.'
      end
      object Label53: TLabel
        Left = 5
        Top = 60
        Width = 96
        Height = 13
        AutoSize = False
        Caption = 'DTA'
      end
      object Label54: TLabel
        Left = 5
        Top = 84
        Width = 94
        Height = 13
        AutoSize = False
        Caption = 'Export / PDF'
      end
      object Label55: TLabel
        Left = 5
        Top = 108
        Width = 94
        Height = 13
        AutoSize = False
        Caption = 'Import'
      end
      object BackupDirEdi: TJvDirectoryEdit
        Left = 103
        Top = 8
        Width = 273
        Height = 21
        DialogKind = dkWin32
        TabOrder = 0
      end
      object TempDirEdi: TJvDirectoryEdit
        Left = 103
        Top = 32
        Width = 273
        Height = 21
        DialogKind = dkWin32
        TabOrder = 1
      end
      object DTADirEdi: TJvDirectoryEdit
        Left = 103
        Top = 56
        Width = 273
        Height = 21
        DialogKind = dkWin32
        TabOrder = 2
      end
      object ExportDirEdi: TJvDirectoryEdit
        Left = 103
        Top = 80
        Width = 273
        Height = 21
        DialogKind = dkWin32
        TabOrder = 3
      end
      object ImportDirEdi: TJvDirectoryEdit
        Left = 103
        Top = 104
        Width = 273
        Height = 21
        DialogKind = dkWin32
        TabOrder = 4
      end
    end
    object TabSheet3: TTabSheet
      Tag = 17
      Caption = 'Fibu'
      ImageIndex = 15
      object Label18: TLabel
        Left = 336
        Top = 8
        Width = 29
        Height = 13
        Caption = 'Inland'
      end
      object Label36: TLabel
        Left = 432
        Top = 8
        Width = 15
        Height = 13
        Caption = 'EU'
      end
      object Label37: TLabel
        Left = 528
        Top = 8
        Width = 38
        Height = 13
        Caption = 'Ausland'
      end
      object Label38: TLabel
        Left = 218
        Top = 28
        Width = 106
        Height = 13
        Caption = 'Default-Aufwandkonto'
      end
      object Label39: TLabel
        Left = 218
        Top = 60
        Width = 87
        Height = 13
        Caption = 'Default-Erl'#246'skonto'
      end
      object Label77: TLabel
        Left = 482
        Top = 92
        Width = 29
        Height = 13
        Caption = 'Kasse'
      end
      object Label78: TLabel
        Left = 482
        Top = 124
        Width = 37
        Height = 13
        Caption = 'Scheck'
      end
      object FordLLLab: TLabel
        Left = 218
        Top = 92
        Width = 101
        Height = 13
        Caption = 'Forderungen aus L&&L'
      end
      object VerbLLLab: TLabel
        Left = 218
        Top = 124
        Width = 102
        Height = 13
        Caption = 'Verbindlichk. aus L&&L'
      end
      object Label81: TLabel
        Left = 482
        Top = 156
        Width = 25
        Height = 13
        Caption = 'Bank'
      end
      object AufwKtoIN: TJvCalcEdit
        Left = 336
        Top = 24
        Width = 81
        Height = 21
        ShowButton = False
        TabOrder = 0
        DecimalPlacesAlwaysShown = False
      end
      object AufwKtoEU: TJvCalcEdit
        Left = 432
        Top = 24
        Width = 81
        Height = 21
        ShowButton = False
        TabOrder = 1
        DecimalPlacesAlwaysShown = False
      end
      object AufwKtoAU: TJvCalcEdit
        Left = 528
        Top = 24
        Width = 81
        Height = 21
        ShowButton = False
        TabOrder = 2
        DecimalPlacesAlwaysShown = False
      end
      object ErloesKtoIN: TJvCalcEdit
        Left = 336
        Top = 56
        Width = 81
        Height = 21
        ShowButton = False
        TabOrder = 3
        DecimalPlacesAlwaysShown = False
      end
      object ErloesKtoEU: TJvCalcEdit
        Left = 432
        Top = 56
        Width = 81
        Height = 21
        ShowButton = False
        TabOrder = 4
        DecimalPlacesAlwaysShown = False
      end
      object ErloesKtoAU: TJvCalcEdit
        Left = 528
        Top = 56
        Width = 81
        Height = 21
        ShowButton = False
        TabOrder = 5
        DecimalPlacesAlwaysShown = False
      end
      object FibuModeGB: TRadioGroup
        Left = 8
        Top = 8
        Width = 201
        Height = 65
        Caption = 'Fibu-Modus'
        Items.Strings = (
          'Bilanzbuchhaltung'
          'Einnahmen-'#220'berschussrechnung ')
        TabOrder = 6
        OnClick = FibuModeGBClick
      end
      object KasseKto: TJvCalcEdit
        Left = 528
        Top = 88
        Width = 81
        Height = 21
        ShowButton = False
        TabOrder = 7
        DecimalPlacesAlwaysShown = False
      end
      object ScheckKto: TJvCalcEdit
        Left = 528
        Top = 120
        Width = 81
        Height = 21
        ShowButton = False
        TabOrder = 8
        DecimalPlacesAlwaysShown = False
      end
      object FordLLKto: TJvCalcEdit
        Left = 336
        Top = 88
        Width = 81
        Height = 21
        ShowButton = False
        TabOrder = 9
        DecimalPlacesAlwaysShown = False
      end
      object VerbLLKto: TJvCalcEdit
        Left = 336
        Top = 120
        Width = 81
        Height = 21
        ShowButton = False
        TabOrder = 10
        DecimalPlacesAlwaysShown = False
      end
      object BankKto: TJvCalcEdit
        Left = 528
        Top = 152
        Width = 81
        Height = 21
        ShowButton = False
        TabOrder = 11
        DecimalPlacesAlwaysShown = False
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 80
        Width = 201
        Height = 129
        Caption = 'Anwendung'
        TabOrder = 12
        object TrennzeichenLab: TLabel
          Left = 9
          Top = 103
          Width = 65
          Height = 13
          Caption = 'Trennzeichen'
        end
        object FibuTypCB: TComboBox
          Left = 8
          Top = 18
          Width = 185
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = FibuTypCBChange
          Items.Strings = (
            'Universeller Export (CSV)'
            'IBM-FIBU')
        end
        object FibuDosCB: TCheckBox
          Left = 8
          Top = 48
          Width = 185
          Height = 17
          Caption = 'DOS-Anwendung'
          TabOrder = 1
        end
        object FibuExportFNCB: TCheckBox
          Left = 8
          Top = 64
          Width = 97
          Height = 17
          Caption = 'incl. Feldnamen'
          TabOrder = 2
        end
        object FibuExportHKCB: TCheckBox
          Left = 8
          Top = 80
          Width = 179
          Height = 17
          Caption = 'Text in Hochkommas'
          TabOrder = 3
        end
        object TrennzeichenCB: TComboBox
          Left = 96
          Top = 98
          Width = 97
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
          Items.Strings = (
            ';'
            ','
            'TAB')
        end
      end
    end
    object TabSheet1: TTabSheet
      Tag = 15
      Caption = 'Erl'#246'sgruppen'
      ImageIndex = 13
      object ErloesGrGrid: TOFDBGrid
        Left = 6
        Top = 3
        Width = 606
        Height = 318
        DataSource = FibuErloesKtoDS
        DefaultDrawing = False
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
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
        ShowTitleEllipsis = True
        DefaultRowHeight = 17
        EditColor = clBlack
        Columns = <
          item
            Expanded = False
            FieldName = 'ERLOESGRUPPE'
            Title.Caption = 'Erl'#246'sgruppe'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KTO_INLAND'
            Title.Caption = 'Inland'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KTO_EU'
            Title.Caption = 'EU'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KTO_AUSLAND'
            Title.Caption = 'Ausland'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BESCHREIBUNG'
            Title.Caption = 'Beschreibung'
            Width = 300
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Tag = 16
      Caption = 'Aufwandsgr.'
      ImageIndex = 14
      object AufwGrGrid: TOFDBGrid
        Left = 6
        Top = 3
        Width = 606
        Height = 318
        DataSource = FibuAufwKtoDS
        DefaultDrawing = False
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
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
        ShowTitleEllipsis = True
        DefaultRowHeight = 17
        EditColor = clBlack
        Columns = <
          item
            Expanded = False
            FieldName = 'AUFWANDSGRUPPE'
            Title.Caption = 'Aufwandsgruppe'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KTO_INLAND'
            Title.Caption = 'Inland'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KTO_EU'
            Title.Caption = 'EU'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KTO_AUSLAND'
            Title.Caption = 'Ausland'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BESCHREIBUNG'
            Title.Caption = 'Beschreibung'
            Width = 300
            Visible = True
          end>
      end
    end
    object KFZGruppenTS: TTabSheet
      Tag = 18
      Caption = 'KFZ Gruppen'
      ImageIndex = 16
      object DBGrid5: TOFDBGrid
        Left = 6
        Top = 3
        Width = 606
        Height = 318
        DataSource = KFZGrDS
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
        RowColor2 = clWindow
        ShowTitleEllipsis = True
        DefaultRowHeight = 18
        EditColor = clBlack
        Columns = <
          item
            Expanded = False
            FieldName = 'GR'
            Title.Caption = 'ID'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LANGBEZ'
            Title.Caption = 'Beschreibung'
            Width = 544
            Visible = True
          end>
      end
    end
  end
  object NumDS: TDataSource
    Left = 92
    Top = 280
  end
  object ZahlArtDS: TDataSource
    Left = 148
    Top = 232
  end
  object LiefArtDS: TDataSource
    OnDataChange = LiefArtDSDataChange
    Left = 36
    Top = 232
  end
  object KunGrDS: TDataSource
    Left = 92
    Top = 232
  end
  object ArtGrDS: TDataSource
    OnDataChange = ArtGrDSDataChange
    Left = 36
    Top = 280
  end
  object FirKontenDS: TDataSource
    Left = 148
    Top = 280
  end
  object MerkmalTab: TZQuery
    Connection = DM1.DB1
    BeforeDelete = MerkmalTabBeforeDelete
    SQL.Strings = (
      'select * from ADRESSEN_MERK'
      'order by MERKMAL_ID ASC')
    Params = <>
    Left = 148
    Top = 325
    object MerkmalTabMERKMAL_ID: TIntegerField
      DisplayLabel = 'Nr.'
      DisplayWidth = 4
      FieldName = 'MERKMAL_ID'
      DisplayFormat = '0000'
      EditFormat = '0'
    end
    object MerkmalTabNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 50
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
  end
  object MerkmalDS: TDataSource
    DataSet = MerkmalTab
    Left = 212
    Top = 325
  end
  object WgrLoTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select ID, NAME from WARENGRUPPEN'
      'where ID !=:ID'
      'order by NAME')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '-1'
      end>
    Left = 36
    Top = 322
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '-1'
      end>
  end
  object WgrLo: TDataSource
    DataSet = WgrLoTab
    Left = 92
    Top = 322
  end
  object FibuErloesKtoTab: TZQuery
    Connection = DM1.DB1
    BeforePost = FibuErloesKtoTabBeforePost
    SQL.Strings = (
      'select '
      'MAINKEY, '
      'NAME as ERLOESGRUPPE, '
      'VAL_INT as KTO_INLAND, '
      'VAL_INT2 as KTO_EU, '
      'VAL_INT3 as KTO_AUSLAND,'
      'VAL_CHAR as BESCHREIBUNG'
      'from REGISTERY'
      'where MAINKEY='#39'MAIN\\FIBU\\ERLOESGRUPPEN'#39)
    Params = <>
    Left = 212
    Top = 234
  end
  object FibuErloesKtoDS: TDataSource
    DataSet = FibuErloesKtoTab
    Left = 284
    Top = 234
  end
  object FibuAufwKtoTab: TZQuery
    Connection = DM1.DB1
    BeforePost = FibuAufwKtoTabBeforePost
    SQL.Strings = (
      'select '
      'MAINKEY, '
      'NAME as AUFWANDSGRUPPE, '
      'VAL_INT as KTO_INLAND, '
      'VAL_INT2 as KTO_EU, '
      'VAL_INT3 as KTO_AUSLAND,'
      'VAL_CHAR as BESCHREIBUNG'
      'from REGISTERY'
      'where MAINKEY='#39'MAIN\\FIBU\\AUFWANDSGRUPPEN'#39)
    Params = <>
    Left = 212
    Top = 282
  end
  object FibuAufwKtoDS: TDataSource
    DataSet = FibuAufwKtoTab
    Left = 284
    Top = 282
  end
  object KFZGrDS: TDataSource
    Left = 348
    Top = 240
  end
end
