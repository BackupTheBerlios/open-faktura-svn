object ArtikelForm: TArtikelForm
  Left = 323
  Top = 129
  Width = 784
  Height = 637
  Caption = 'Material und Dienstleistungen'
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Scaled = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ArtikelPanel: TPanel
    Left = 0
    Top = 0
    Width = 776
    Height = 572
    Align = alClient
    BevelOuter = bvNone
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    OnResize = ArtikelPanelResize
    object JvxSplitter2: TSplitter
      Left = 142
      Top = 27
      Height = 519
      AutoSnap = False
      Beveled = True
      MinSize = 80
    end
    object Art_PC: TJvPageControl
      Left = 145
      Top = 27
      Width = 631
      Height = 519
      ActivePage = ShopTS
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = Art_PCChange
      ClientBorderWidth = 0
      HideAllTabs = True
      object Allg_TS: TTabSheet
        Tag = 1
        Caption = 'Allgemein'
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 297
          Height = 496
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object SuchGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 297
            Height = 129
            Align = alTop
            Caption = 'Suchbegriffe'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 0
            object Label13: TLabel
              Left = 8
              Top = 104
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Artikel-Typ:'
              FocusControl = match
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label30: TLabel
              Left = 6
              Top = 64
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Ersatz-Nr.:'
              FocusControl = match
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 5
              Top = 44
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Artikel-Nr.:'
              FocusControl = Artikelnr
            end
            object Label11: TLabel
              Left = 5
              Top = 24
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Suchbegriff:'
              FocusControl = match
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 5
              Top = 84
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Barcode/EAN:'
            end
            object ArtikelTyp: TVolgaDBEdit
              Tag = 1
              Left = 79
              Top = 102
              Width = 210
              Height = 19
              AutoDropDown = True
              ButtonWidth = 17
              ComboProps.ComboItems.Strings = (
                'normaler Artikel'
                'Artikel mit St'#252'ckliste'
                'Lohn'
                'Transportkosten'
                'Text / Kommentar')
              ComboProps.ComboValues.Strings = (
                'N'
                'S'
                'L'
                'K'
                'T')
              DataField = 'ARTIKELTYP'
              DataSource = AS_DS
              DialogStyle = vdsCombo
              Style = vcsDropDownList
              TabOrder = 4
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Ersatz_artnr: TDBEdit
              Tag = 1
              Left = 79
              Top = 61
              Width = 210
              Height = 19
              AutoSelect = False
              AutoSize = False
              BiDiMode = bdLeftToRight
              CharCase = ecUpperCase
              DataField = 'ERSATZ_ARTNUM'
              DataSource = AS_DS
              ParentBiDiMode = False
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Artikelnr: TDBEdit
              Tag = 1
              Left = 79
              Top = 41
              Width = 210
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'ARTNUM'
              DataSource = AS_DS
              TabOrder = 1
              OnChange = ArtikelnrChange
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object match: TDBEdit
              Tag = 1
              Left = 79
              Top = 21
              Width = 210
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'MATCHCODE'
              DataSource = AS_DS
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object barcode: TDBEdit
              Tag = 1
              Left = 79
              Top = 81
              Width = 210
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'BARCODE'
              DataSource = AS_DS
              TabOrder = 3
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object ZuwGB: TOFGroupBox
            Left = 0
            Top = 129
            Width = 297
            Height = 130
            Align = alTop
            Caption = 'Zuweisungen'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 1
            object Warengruppe: TLabel
              Left = 5
              Top = 24
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Warengruppe:'
            end
            object Label14: TLabel
              Left = 5
              Top = 45
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Herkunftsland:'
            end
            object Label15: TLabel
              Left = 5
              Top = 65
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Lager-Ort:'
            end
            object HerstellerEdiBtn: TSpeedButton
              Left = 266
              Top = 83
              Width = 23
              Height = 20
              Hint = 'Hersteller '#246'ffnen'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              OnClick = HerstellerEdiBtnClick
            end
            object Label68: TLabel
              Left = 6
              Top = 88
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Hersteller:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label56: TLabel
              Left = 6
              Top = 108
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Herst.-Artnum.:'
              FocusControl = match
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lagerort: TDBEdit
              Tag = 1
              Left = 79
              Top = 63
              Width = 210
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'LAGERORT'
              DataSource = AS_DS
              TabOrder = 4
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Land: TDBEdit
              Left = 79
              Top = 42
              Width = 32
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'HERKUNFTSLAND'
              DataSource = AS_DS
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Land_CB: TDBLookupComboBox
              Tag = 1
              Left = 110
              Top = 42
              Width = 179
              Height = 19
              Cursor = crHandPoint
              DataField = 'HERKUNFTSLAND'
              DataSource = AS_DS
              KeyField = 'ID'
              ListField = 'NAME'
              ListSource = DM1.LandDS
              TabOrder = 3
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Warengr: TDBEdit
              Left = 79
              Top = 21
              Width = 32
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'WARENGRUPPE'
              DataSource = AS_DS
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Warengr_CB: TDBLookupComboBox
              Tag = 1
              Left = 110
              Top = 21
              Width = 179
              Height = 19
              Cursor = crHandPoint
              DataField = 'WARENGRUPPE'
              DataSource = AS_DS
              DropDownRows = 15
              KeyField = 'ID'
              ListField = 'NAME'
              ListSource = DM1.WgrDS
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Hersteller_CB: TDBLookupComboBox
              Left = 79
              Top = 84
              Width = 187
              Height = 19
              Cursor = crHandPoint
              DataField = 'HERSTELLER_ID'
              DataSource = AS_DS
              DropDownRows = 15
              KeyField = 'HERSTELLER_ID'
              ListField = 'HERSTELLER_NAME'
              ListSource = DM1.HerstellerDS
              TabOrder = 5
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object HerstArtnum: TDBEdit
              Tag = 1
              Left = 79
              Top = 105
              Width = 210
              Height = 19
              AutoSelect = False
              AutoSize = False
              BiDiMode = bdLeftToRight
              CharCase = ecUpperCase
              DataField = 'HERST_ARTNUM'
              DataSource = AS_DS
              ParentBiDiMode = False
              TabOrder = 6
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object EinheitenGB: TOFGroupBox
            Left = 0
            Top = 259
            Width = 297
            Height = 151
            Align = alTop
            Caption = 'Einheiten / Konten'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 2
            object Label20: TLabel
              Left = 163
              Top = 24
              Width = 50
              Height = 13
              AutoSize = False
              Caption = 'Aufw.-Kto:'
            end
            object Label21: TLabel
              Left = 163
              Top = 45
              Width = 49
              Height = 13
              AutoSize = False
              Caption = 'Erl'#246's-Kto:'
            end
            object Label29: TLabel
              Left = 5
              Top = 86
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Gewicht (Kg):'
            end
            object Label22: TLabel
              Left = 5
              Top = 45
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Rabattgruppe:'
            end
            object Label19: TLabel
              Left = 5
              Top = 66
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Mwst-Code:'
            end
            object Label17: TLabel
              Left = 5
              Top = 24
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Mengeneinh.:'
            end
            object Label53: TLabel
              Left = 5
              Top = 107
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Dimension:'
            end
            object Label54: TLabel
              Left = 163
              Top = 107
              Width = 51
              Height = 13
              AutoSize = False
              Caption = 'Gr'#246#223'e:'
            end
            object Label55: TLabel
              Left = 163
              Top = 86
              Width = 50
              Height = 13
              AutoSize = False
              Caption = 'L'#228'nge:'
            end
            object Label46: TLabel
              Left = 163
              Top = 66
              Width = 50
              Height = 13
              AutoSize = False
              Caption = 'Inv.-Wert:'
            end
            object Label47: TLabel
              Left = 5
              Top = 130
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Vertr.-Prov.:'
            end
            object Label48: TLabel
              Left = 163
              Top = 129
              Width = 51
              Height = 13
              AutoSize = False
              Caption = 'VPE:'
            end
            object Gewicht: TDBEdit
              Left = 78
              Top = 84
              Width = 80
              Height = 19
              AutoSize = False
              DataField = 'GEWICHT'
              DataSource = AS_DS
              TabOrder = 6
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object E_KTO: TDBEdit
              Tag = 1
              Left = 217
              Top = 42
              Width = 72
              Height = 19
              AutoSize = False
              DataField = 'ERLOES_KTO'
              DataSource = AS_DS
              TabOrder = 4
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object A_KTO: TDBEdit
              Tag = 1
              Left = 217
              Top = 21
              Width = 72
              Height = 19
              AutoSize = False
              DataField = 'AUFW_KTO'
              DataSource = AS_DS
              TabOrder = 3
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Inventur_wert: TDBEdit
              Tag = 1
              Left = 217
              Top = 63
              Width = 72
              Height = 19
              AutoSize = False
              DataField = 'INVENTUR_WERT'
              DataSource = AS_DS
              TabOrder = 5
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object MEinheit: TDBEdit
              Left = 78
              Top = 21
              Width = 80
              Height = 19
              AutoSelect = False
              DataField = 'ME_EINHEIT'
              DataSource = AS_DS
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object MwstCB: TVolgaDBEdit
              Left = 78
              Top = 63
              Width = 80
              Height = 19
              AutoDropDown = True
              ButtonWidth = 17
              ComboProps.ComboItems.Strings = (
                '0=0,0%'
                '1=7,0%'
                '2=16,0%'
                '3=0,0%')
              ComboProps.ComboValues.Strings = (
                '0'
                '1'
                '2'
                '3')
              Ctl3D = False
              DataField = 'STEUER_CODE'
              DataSource = AS_DS
              DialogStyle = vdsCombo
              ParentCtl3D = False
              Style = vcsDropDownList
              TabOrder = 2
              OnChange = MwstCBChange
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object dimension: TDBEdit
              Left = 78
              Top = 105
              Width = 80
              Height = 19
              AutoSize = False
              DataField = 'DIMENSION'
              DataSource = AS_DS
              TabOrder = 7
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Groesse: TDBEdit
              Tag = 1
              Left = 217
              Top = 105
              Width = 72
              Height = 19
              AutoSize = False
              DataField = 'GROESSE'
              DataSource = AS_DS
              TabOrder = 9
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Laenge: TDBEdit
              Tag = 1
              Left = 217
              Top = 84
              Width = 72
              Height = 19
              AutoSize = False
              DataField = 'LAENGE'
              DataSource = AS_DS
              TabOrder = 8
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object RabGrpLoCB: TDBLookupComboBox
              Left = 78
              Top = 42
              Width = 80
              Height = 19
              Cursor = crHandPoint
              Ctl3D = False
              DataField = 'RABGRP_ID'
              DataSource = AS_DS
              DropDownRows = 15
              DropDownWidth = 500
              KeyField = 'RABGRP_ID'
              ListField = 'RABGRP_ID; BESCHREIBUNG; RABATT1; RABATT2; RABATT3'
              ListSource = DM1.RabGrpDS
              ParentCtl3D = False
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object provision: TDBEdit
              Left = 78
              Top = 127
              Width = 80
              Height = 19
              AutoSize = False
              DataField = 'PROVIS_PROZ'
              DataSource = AS_DS
              TabOrder = 10
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object VPE: TDBEdit
              Tag = 1
              Left = 217
              Top = 127
              Width = 72
              Height = 19
              AutoSize = False
              DataField = 'VPE'
              DataSource = AS_DS
              TabOrder = 11
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object BewDatGB: TOFGroupBox
            Left = 0
            Top = 410
            Width = 297
            Height = 86
            Align = alClient
            Caption = 'Menge / Preis'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 3
            object Label23: TLabel
              Left = 5
              Top = 25
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Mind.-Bestand:'
            end
            object Label28: TLabel
              Left = 162
              Top = 25
              Width = 43
              Height = 13
              AutoSize = False
              Caption = 'Bestand:'
            end
            object EKPreisLab: TLabel
              Left = 8
              Top = 67
              Width = 66
              Height = 13
              Caption = 'Einkaufspreis:'
            end
            object ListPreisLab: TLabel
              Left = 8
              Top = 88
              Width = 68
              Height = 13
              Caption = 'Listenpreis (2):'
            end
            object FaktorLab: TLabel
              Left = 162
              Top = 67
              Width = 43
              Height = 13
              AutoSize = False
              Caption = 'Faktor:'
            end
            object BrLiPreisLab: TLabel
              Left = 162
              Top = 88
              Width = 34
              Height = 13
              Caption = 'Brutto :'
            end
            object Label59: TLabel
              Left = 162
              Top = 46
              Width = 43
              Height = 13
              AutoSize = False
              Caption = 'Bestellt:'
            end
            object Label60: TLabel
              Left = 5
              Top = 46
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Bestellvorschl.:'
            end
            object MinMenge: TDBEdit
              Left = 78
              Top = 22
              Width = 80
              Height = 19
              AutoSize = False
              DataField = 'MENGE_MIN'
              DataSource = AS_DS
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Menge: TDBEdit
              Tag = 1
              Left = 206
              Top = 22
              Width = 83
              Height = 19
              AutoSize = False
              DataField = 'MENGE_AKT'
              DataSource = AS_DS
              TabOrder = 1
              OnChange = MengeChange
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object EK_Preis: TDBEdit
              Left = 78
              Top = 64
              Width = 80
              Height = 19
              DataField = 'EK_PREIS'
              DataSource = AS_DS
              TabOrder = 4
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              OnKeyUp = EK_PreisKeyUp
            end
            object ListPreis: TDBEdit
              Left = 78
              Top = 85
              Width = 80
              Height = 19
              DataField = 'VK5'
              DataSource = AS_DS
              TabOrder = 6
              OnEnter = matchEnter
              OnExit = vk1Change
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object GewinnFaktor: TJvCalcEdit
              Tag = 1
              Left = 206
              Top = 64
              Width = 83
              Height = 19
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000" ";-,0.000" "'
              FormatOnEditing = True
              ShowButton = False
              TabOrder = 5
              ZeroEmpty = False
              DecimalPlacesAlwaysShown = False
              OnChange = GewinnFaktorChange
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object BruttoPreis: TDBEdit
              Tag = 1
              Left = 206
              Top = 85
              Width = 83
              Height = 19
              AutoSize = False
              DataSource = AS_DS
              TabOrder = 7
              OnEnter = matchEnter
              OnExit = vk1_bruttoChange
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object MEBestellt: TDBEdit
              Tag = 1
              Left = 206
              Top = 43
              Width = 83
              Height = 19
              AutoSize = False
              DataField = 'MENGE_BESTELLT'
              DataSource = AS_DS
              Enabled = False
              TabOrder = 3
              OnChange = MengeChange
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object ME_Bestvorschlag: TDBEdit
              Left = 78
              Top = 43
              Width = 80
              Height = 19
              AutoSize = False
              DataField = 'MENGE_BVOR'
              DataSource = AS_DS
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
        end
        object Panel5: TPanel
          Left = 297
          Top = 0
          Width = 334
          Height = 496
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object KurztextGB: TOFGroupBox
            Left = 0
            Top = 97
            Width = 334
            Height = 46
            Align = alTop
            Caption = 'Kurztext'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 1
            object kurzname: TDBEdit
              Tag = 1
              Left = 8
              Top = 21
              Width = 318
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'KURZNAME'
              DataSource = AS_DS
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = kurznameExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object KasTextGB: TOFGroupBox
            Left = 0
            Top = 143
            Width = 334
            Height = 46
            Align = alTop
            Caption = 'Kasse'
            Color = 14680063
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            TabOrder = 2
            object kasname: TDBEdit
              Tag = 1
              Left = 8
              Top = 21
              Width = 318
              Height = 19
              AutoSelect = False
              AutoSize = False
              Ctl3D = False
              DataField = 'KAS_NAME'
              DataSource = AS_DS
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = kurznameExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object InfoGB: TOFGroupBox
            Left = 0
            Top = 333
            Width = 334
            Height = 105
            Align = alBottom
            Caption = 'Info'
            Color = 14680063
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            TabOrder = 4
            object InfoMemo: TDBMemo
              Tag = 1
              Left = 8
              Top = 21
              Width = 318
              Height = 76
              Hint = 'Zeilenumbruch mit Strg+Enter'
              Align = alClient
              Ctl3D = False
              DataField = 'INFO'
              DataSource = AS_DS
              ParentCtl3D = False
              ScrollBars = ssVertical
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object LangtextGB: TOFGroupBox
            Left = 0
            Top = 189
            Width = 334
            Height = 144
            Align = alClient
            Caption = 'Langtext'
            Color = 14680063
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            TabOrder = 3
            object LtextMemo: TDBMemo
              Tag = 1
              Left = 8
              Top = 21
              Width = 318
              Height = 115
              Hint = 'Zeilenumbruch mit Strg+Enter, Tab mit Strg+Tab'
              Align = alClient
              Ctl3D = False
              DataField = 'LANGNAME'
              DataSource = AS_DS
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
              WantTabs = True
              OnEnter = matchEnter
              OnExit = LtextMemoExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object SpezialGB: TOFGroupBox
            Left = 0
            Top = 438
            Width = 334
            Height = 58
            Align = alBottom
            Caption = 'Spezial'
            Color = 14680063
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            TabOrder = 5
            object NO_EK: TDBCheckBox
              Left = 114
              Top = 20
              Width = 89
              Height = 17
              Caption = 'EK-Sperre'
              DataField = 'NO_EK_FLAG'
              DataSource = AS_DS
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object NO_VK: TDBCheckBox
              Left = 114
              Top = 36
              Width = 89
              Height = 17
              Caption = 'VK-Sperre'
              DataField = 'NO_VK_FLAG'
              DataSource = AS_DS
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object NO_BEZEICHNUNG: TDBCheckBox
              Left = 204
              Top = 20
              Width = 87
              Height = 17
              Caption = 'Bez. fest'
              Color = 14680063
              DataField = 'NO_BEZEDIT_FLAG'
              DataSource = AS_DS
              ParentColor = False
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object NO_PROV: TDBCheckBox
              Left = 5
              Top = 36
              Width = 110
              Height = 17
              Caption = 'Ohne  Provision'
              DataField = 'NO_PROVISION_FLAG'
              DataSource = AS_DS
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object NO_RABATT: TDBCheckBox
              Left = 5
              Top = 20
              Width = 110
              Height = 17
              Caption = 'Ohne  Rabatt:'
              Ctl3D = False
              DataField = 'NO_RABATT_FLAG'
              DataSource = AS_DS
              ParentCtl3D = False
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object SerNoCB: TDBCheckBox
              Left = 204
              Top = 36
              Width = 87
              Height = 17
              Caption = 'SN-Pflicht'
              Color = 14680063
              DataField = 'SN_FLAG'
              DataSource = AS_DS
              ParentColor = False
              TabOrder = 5
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object MerkmaleCB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 334
            Height = 97
            Align = alTop
            Caption = 'Merkmale'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 0
            object ArtMerkmalLB: TJvCheckListBox
              Tag = 1
              Left = 8
              Top = 21
              Width = 318
              Height = 68
              OnClickCheck = ArtMerkmalLBClickCheck
              Align = alClient
              ItemHeight = 13
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
        end
      end
      object Preis_TS: TTabSheet
        Tag = 2
        Caption = 'Preise'
        ImageIndex = 1
        object ArtPreisPanel: TPanel
          Left = 0
          Top = 88
          Width = 631
          Height = 408
          Align = alClient
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 0
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 3
            Height = 408
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel9: TPanel
            Left = 628
            Top = 0
            Width = 3
            Height = 408
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel11: TPanel
            Left = 3
            Top = 0
            Width = 625
            Height = 408
            Align = alClient
            BevelOuter = bvNone
            Color = 14680063
            TabOrder = 2
            object PreisPC: TJvPageControl
              Left = 0
              Top = 3
              Width = 625
              Height = 405
              ActivePage = KunPreisTS
              Align = alClient
              BiDiMode = bdLeftToRight
              HotTrack = True
              ParentBiDiMode = False
              Style = tsButtons
              TabOrder = 0
              OnChange = PreisPCChange
              OnChanging = PreisPCChanging
              HandleGlobalTab = True
              object PreisStdTS: TTabSheet
                Tag = 1
                Caption = 'Standard'
                object EKPreisGB: TOFGroupBox
                  Left = 0
                  Top = 3
                  Width = 617
                  Height = 48
                  Align = alTop
                  Caption = 'EK-Preise'
                  Color = 14680063
                  Ctl3D = False
                  FrameColor = clBtnFace
                  TitleColor = 14680063
                  ParentColor = False
                  ParentCtl3D = False
                  TabOrder = 0
                  object Label3: TLabel
                    Left = 5
                    Top = 24
                    Width = 60
                    Height = 15
                    AutoSize = False
                    Caption = '&EK-Preis :'
                    FocusControl = ekpreis
                    Layout = tlCenter
                  end
                  object Label4: TLabel
                    Left = 275
                    Top = 24
                    Width = 58
                    Height = 13
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'letzter &EK :'
                    FocusControl = lastekpreis
                    Visible = False
                  end
                  object ekpreis: TDBEdit
                    Left = 79
                    Top = 21
                    Width = 87
                    Height = 19
                    Ctl3D = False
                    DataField = 'EK_PREIS'
                    DataSource = AS_DS
                    ParentCtl3D = False
                    TabOrder = 0
                    OnEnter = matchEnter
                    OnExit = matchExit
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                    OnKeyUp = EK_PreisKeyUp
                  end
                  object lastekpreis: TDBEdit
                    Left = 338
                    Top = 21
                    Width = 95
                    Height = 19
                    DataSource = AS_DS
                    Enabled = False
                    ReadOnly = True
                    TabOrder = 1
                    Visible = False
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                end
                object VKPreisGB: TOFGroupBox
                  Left = 0
                  Top = 51
                  Width = 617
                  Height = 323
                  Align = alClient
                  Caption = 'VK-Preise'
                  Color = 14680063
                  Ctl3D = False
                  FrameColor = clBtnFace
                  TitleColor = 14680063
                  ParentColor = False
                  ParentCtl3D = False
                  TabOrder = 1
                  object vk5lab: TLabel
                    Left = 5
                    Top = 118
                    Width = 60
                    Height = 19
                    AutoSize = False
                    Caption = 'VK-Preis &5:'
                    FocusControl = vk5
                    Layout = tlCenter
                  end
                  object vk4lab: TLabel
                    Left = 5
                    Top = 94
                    Width = 60
                    Height = 19
                    AutoSize = False
                    Caption = 'VK-Preis &4:'
                    FocusControl = vk4
                    Layout = tlCenter
                  end
                  object vk3lab: TLabel
                    Left = 5
                    Top = 70
                    Width = 60
                    Height = 19
                    AutoSize = False
                    Caption = 'VK-Preis &3:'
                    FocusControl = vk3
                    Layout = tlCenter
                  end
                  object Label2: TLabel
                    Left = 5
                    Top = 46
                    Width = 60
                    Height = 19
                    AutoSize = False
                    Caption = 'VK-Preis &2:'
                    FocusControl = vk2
                    Layout = tlCenter
                  end
                  object Label1: TLabel
                    Left = 5
                    Top = 22
                    Width = 60
                    Height = 19
                    AutoSize = False
                    Caption = 'VK-Preis &1:'
                    FocusControl = vk1
                    Layout = tlCenter
                  end
                  object Label35: TLabel
                    Left = 364
                    Top = 1
                    Width = 65
                    Height = 13
                    Caption = 'Netto-Gewinn'
                    Transparent = True
                  end
                  object Label34: TLabel
                    Left = 251
                    Top = 1
                    Width = 83
                    Height = 13
                    Caption = 'Brutto (incl.MwSt)'
                    Transparent = True
                  end
                  object MwStLabel: TLabel
                    Left = 168
                    Top = 1
                    Width = 77
                    Height = 13
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'MwSt'
                    Transparent = True
                  end
                  object Label32: TLabel
                    Left = 135
                    Top = 1
                    Width = 26
                    Height = 13
                    Caption = 'Netto'
                    Transparent = True
                  end
                  object vk5_rgw: TJvCalcEdit
                    Tag = -5
                    Left = 338
                    Top = 117
                    Width = 95
                    Height = 19
                    AutoSize = False
                    DecimalPlaceRound = True
                    FormatOnEditing = True
                    MaxLength = 11
                    MaxValue = 999999.000000000000000000
                    MinValue = -999999.000000000000000000
                    ShowButton = False
                    TabOrder = 19
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    OnChange = vk1_rgwChange
                    OnEnter = matchEnter
                    OnExit = matchExit
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk4_rgw: TJvCalcEdit
                    Tag = -4
                    Left = 338
                    Top = 93
                    Width = 95
                    Height = 19
                    AutoSize = False
                    DecimalPlaceRound = True
                    FormatOnEditing = True
                    MaxLength = 11
                    MaxValue = 999999.000000000000000000
                    MinValue = -999999.000000000000000000
                    ShowButton = False
                    TabOrder = 15
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    OnChange = vk1_rgwChange
                    OnEnter = matchEnter
                    OnExit = matchExit
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk3_rgw: TJvCalcEdit
                    Tag = -3
                    Left = 338
                    Top = 69
                    Width = 95
                    Height = 19
                    AutoSize = False
                    DecimalPlaceRound = True
                    FormatOnEditing = True
                    MaxLength = 11
                    MaxValue = 999999.000000000000000000
                    MinValue = -999999.000000000000000000
                    ShowButton = False
                    TabOrder = 11
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    OnChange = vk1_rgwChange
                    OnEnter = matchEnter
                    OnExit = matchExit
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk2_rgw: TJvCalcEdit
                    Tag = -2
                    Left = 338
                    Top = 45
                    Width = 95
                    Height = 19
                    AutoSize = False
                    DecimalPlaceRound = True
                    FormatOnEditing = True
                    MaxLength = 11
                    MaxValue = 999999.000000000000000000
                    MinValue = -999999.000000000000000000
                    ShowButton = False
                    TabOrder = 7
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    OnChange = vk1_rgwChange
                    OnEnter = matchEnter
                    OnExit = matchExit
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk1_rgw: TJvCalcEdit
                    Tag = -1
                    Left = 338
                    Top = 21
                    Width = 95
                    Height = 19
                    AutoSize = False
                    DecimalPlaceRound = True
                    FormatOnEditing = True
                    MaxLength = 11
                    MaxValue = 999999.000000000000000000
                    MinValue = -999999.000000000000000000
                    ShowButton = False
                    TabOrder = 3
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    OnChange = vk1_rgwChange
                    OnEnter = matchEnter
                    OnExit = matchExit
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk1_brutto: TDBEdit
                    Tag = -1
                    Left = 248
                    Top = 21
                    Width = 87
                    Height = 19
                    AutoSize = False
                    DataField = 'VK1B'
                    DataSource = AS_DS
                    TabOrder = 2
                    OnEnter = matchEnter
                    OnExit = vk1_bruttoChange
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk1_mwst: TJvCalcEdit
                    Tag = -1
                    Left = 168
                    Top = 21
                    Width = 78
                    Height = 19
                    AutoSize = False
                    Enabled = False
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 1
                    Value = 99999.000000000000000000
                    DecimalPlacesAlwaysShown = False
                    OnEnter = matchEnter
                    OnExit = matchExit
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk2_brutto: TDBEdit
                    Tag = -2
                    Left = 248
                    Top = 45
                    Width = 87
                    Height = 19
                    AutoSize = False
                    DataField = 'VK2B'
                    DataSource = AS_DS
                    TabOrder = 6
                    OnEnter = matchEnter
                    OnExit = vk1_bruttoChange
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk3_brutto: TDBEdit
                    Tag = -3
                    Left = 248
                    Top = 69
                    Width = 87
                    Height = 19
                    AutoSize = False
                    DataField = 'VK3B'
                    DataSource = AS_DS
                    TabOrder = 10
                    OnEnter = matchEnter
                    OnExit = vk1_bruttoChange
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk4_brutto: TDBEdit
                    Tag = -4
                    Left = 248
                    Top = 93
                    Width = 87
                    Height = 19
                    AutoSize = False
                    DataField = 'VK4B'
                    DataSource = AS_DS
                    TabOrder = 14
                    OnEnter = matchEnter
                    OnExit = vk1_bruttoChange
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk5_brutto: TDBEdit
                    Tag = -5
                    Left = 248
                    Top = 117
                    Width = 87
                    Height = 19
                    AutoSize = False
                    DataField = 'VK5B'
                    DataSource = AS_DS
                    TabOrder = 18
                    OnEnter = matchEnter
                    OnExit = vk1_bruttoChange
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk5_mwst: TJvCalcEdit
                    Tag = -5
                    Left = 168
                    Top = 117
                    Width = 78
                    Height = 19
                    AutoSize = False
                    Enabled = False
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 17
                    DecimalPlacesAlwaysShown = False
                    OnEnter = matchEnter
                    OnExit = matchExit
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk4_mwst: TJvCalcEdit
                    Tag = -4
                    Left = 168
                    Top = 93
                    Width = 78
                    Height = 19
                    AutoSize = False
                    Enabled = False
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 13
                    DecimalPlacesAlwaysShown = False
                    OnEnter = matchEnter
                    OnExit = matchExit
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk3_mwst: TJvCalcEdit
                    Tag = -3
                    Left = 168
                    Top = 69
                    Width = 78
                    Height = 19
                    AutoSize = False
                    Enabled = False
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 9
                    DecimalPlacesAlwaysShown = False
                    OnEnter = matchEnter
                    OnExit = matchExit
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk2_mwst: TJvCalcEdit
                    Tag = -2
                    Left = 168
                    Top = 45
                    Width = 78
                    Height = 19
                    AutoSize = False
                    Enabled = False
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 5
                    DecimalPlacesAlwaysShown = False
                    OnEnter = matchEnter
                    OnExit = matchExit
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk2: TDBEdit
                    Tag = -2
                    Left = 79
                    Top = 45
                    Width = 87
                    Height = 19
                    DataField = 'VK2'
                    DataSource = AS_DS
                    TabOrder = 4
                    OnEnter = matchEnter
                    OnExit = vk1Change
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk1: TDBEdit
                    Tag = -1
                    Left = 79
                    Top = 21
                    Width = 87
                    Height = 19
                    Ctl3D = False
                    DataField = 'VK1'
                    DataSource = AS_DS
                    ParentCtl3D = False
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    OnEnter = matchEnter
                    OnExit = vk1Change
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk3: TDBEdit
                    Tag = -3
                    Left = 79
                    Top = 69
                    Width = 87
                    Height = 19
                    DataField = 'VK3'
                    DataSource = AS_DS
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 8
                    OnEnter = matchEnter
                    OnExit = vk1Change
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk4: TDBEdit
                    Tag = -4
                    Left = 79
                    Top = 93
                    Width = 87
                    Height = 19
                    DataField = 'VK4'
                    DataSource = AS_DS
                    TabOrder = 12
                    OnEnter = matchEnter
                    OnExit = vk1Change
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                  object vk5: TDBEdit
                    Tag = -5
                    Left = 79
                    Top = 117
                    Width = 87
                    Height = 19
                    DataField = 'VK5'
                    DataSource = AS_DS
                    TabOrder = 16
                    OnEnter = matchEnter
                    OnExit = vk1Change
                    OnKeyDown = matchKeyDown
                    OnKeyPress = matchKeyPress
                  end
                end
                object Panel20: TPanel
                  Left = 0
                  Top = 0
                  Width = 617
                  Height = 3
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 2
                end
              end
              object StaffelpreisTS: TTabSheet
                Tag = 2
                Caption = 'Staffelpreise'
                ImageIndex = 1
                object CaoGroupBox5: TOFGroupBox
                  Left = 0
                  Top = 3
                  Width = 586
                  Height = 398
                  Align = alClient
                  Caption = 'Staffelpreise'
                  Color = 14680063
                  Ctl3D = False
                  FrameColor = clBtnFace
                  TitleColor = 14680063
                  ParentColor = False
                  ParentCtl3D = False
                  TabOrder = 0
                  object PreisGrid: TJvStringGrid
                    Left = 10
                    Top = 25
                    Width = 487
                    Height = 153
                    ColCount = 6
                    Ctl3D = False
                    DefaultColWidth = 80
                    DefaultRowHeight = 18
                    RowCount = 8
                    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goEditing]
                    ParentCtl3D = False
                    ScrollBars = ssNone
                    TabOrder = 0
                    OnGetEditText = PreisGridGetEditText
                    OnKeyPress = PreisGridKeyPress
                    OnSelectCell = PreisGridSelectCell
                    Alignment = taRightJustify
                    FixedFont.Charset = DEFAULT_CHARSET
                    FixedFont.Color = clWindowText
                    FixedFont.Height = -11
                    FixedFont.Name = 'MS Sans Serif'
                    FixedFont.Style = []
                    OnExitCell = PreisGridExitCell
                    OnSetCanvasProperties = PreisGridSetCanvasProperties
                  end
                end
                object Panel10: TPanel
                  Left = 0
                  Top = 0
                  Width = 586
                  Height = 3
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 1
                end
              end
              object KunPreisTS: TTabSheet
                Tag = 3
                Caption = 'Kundenpreise'
                ImageIndex = 2
                object ToolBar4: TToolBar
                  Left = 0
                  Top = 352
                  Width = 617
                  Height = 22
                  Align = alBottom
                  AutoSize = True
                  ButtonWidth = 75
                  Caption = 'ToolBar1'
                  Color = clBtnFace
                  EdgeBorders = []
                  Flat = True
                  Images = MainForm.ImageList1
                  List = True
                  ParentColor = False
                  ShowCaptions = True
                  TabOrder = 0
                  object KunPreisNeuBtn: TToolButton
                    Left = 0
                    Top = 0
                    AutoSize = True
                    Caption = 'Neu'
                    ImageIndex = 31
                    OnClick = NewLiefPreisBtnClick
                  end
                  object ToolButton16: TToolButton
                    Left = 51
                    Top = 0
                    Width = 8
                    Caption = 'ToolButton13'
                    ImageIndex = 21
                    Style = tbsSeparator
                  end
                  object KunPreisDelBtn: TToolButton
                    Left = 59
                    Top = 0
                    AutoSize = True
                    Caption = 'L'#246'schen'
                    ImageIndex = 50
                    OnClick = LiefDelBtnClick
                  end
                  object ToolButton20: TToolButton
                    Left = 131
                    Top = 0
                    Width = 8
                    Caption = 'ToolButton4'
                    ImageIndex = 20
                    Style = tbsSeparator
                  end
                  object KunPreisSaveBtn: TToolButton
                    Left = 139
                    Top = 0
                    AutoSize = True
                    Caption = 'Speichern'
                    ImageIndex = 16
                    OnClick = LiefPreisSaveBtnClick
                  end
                  object ToolButton22: TToolButton
                    Left = 218
                    Top = 0
                    Width = 8
                    Caption = 'ToolButton11'
                    ImageIndex = 20
                    Style = tbsSeparator
                  end
                  object KunPreisAbortBtn: TToolButton
                    Left = 226
                    Top = 0
                    AutoSize = True
                    Caption = 'Abbruch'
                    ImageIndex = 19
                    OnClick = LiefPreisAbortBtnClick
                  end
                end
                object Panel21: TPanel
                  Left = 0
                  Top = 348
                  Width = 617
                  Height = 4
                  Align = alBottom
                  BevelOuter = bvNone
                  Color = 14680063
                  TabOrder = 1
                end
                object ArtKunPreisGrid: TOFDBGrid
                  Left = 0
                  Top = 0
                  Width = 617
                  Height = 348
                  Align = alClient
                  BorderStyle = bsNone
                  DataSource = ArtPreisDS
                  DefaultDrawing = False
                  TabOrder = 2
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
                  RowColor1 = 12255087
                  RowColor2 = clWindow
                  ShowTitleEllipsis = True
                  DefaultRowHeight = 17
                  EditColor = clBlack
                  OnApplyCellAttribute = ArtLiefPreisGridApplyCellAttribute
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'LieferantStr'
                      Title.Caption = 'Kunde'
                      Width = 200
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'BESTNUM'
                      Width = 120
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PREIS'
                      Title.Caption = 'Preis (netto)'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'GEAEND'
                      Width = 70
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'GEAEND_NAME'
                      Visible = True
                    end>
                end
              end
              object LiefPreisTS: TTabSheet
                Tag = 4
                Caption = 'Lieferanten / Preise'
                ImageIndex = 3
                object ArtLiefPreisGrid: TOFDBGrid
                  Left = 0
                  Top = 0
                  Width = 617
                  Height = 348
                  Align = alClient
                  BorderStyle = bsNone
                  DataSource = ArtPreisDS
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
                  RowColor1 = 12255087
                  RowColor2 = clWindow
                  ShowTitleEllipsis = True
                  DefaultRowHeight = 17
                  EditColor = clBlack
                  OnApplyCellAttribute = ArtLiefPreisGridApplyCellAttribute
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'LieferantStr'
                      Width = 200
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'BESTNUM'
                      Width = 120
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PREIS'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'GEAEND'
                      Width = 70
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'GEAEND_NAME'
                      Visible = True
                    end>
                end
                object Panel12: TPanel
                  Left = 0
                  Top = 348
                  Width = 617
                  Height = 4
                  Align = alBottom
                  BevelOuter = bvNone
                  Color = 14680063
                  TabOrder = 1
                end
                object ToolBar3: TToolBar
                  Left = 0
                  Top = 352
                  Width = 617
                  Height = 22
                  Align = alBottom
                  AutoSize = True
                  ButtonWidth = 87
                  Caption = 'ToolBar1'
                  Color = clBtnFace
                  EdgeBorders = []
                  Flat = True
                  Images = MainForm.ImageList1
                  List = True
                  ParentColor = False
                  ShowCaptions = True
                  TabOrder = 2
                  object NewLiefPreisBtn: TToolButton
                    Left = 0
                    Top = 0
                    AutoSize = True
                    Caption = 'Neu'
                    ImageIndex = 31
                    OnClick = NewLiefPreisBtnClick
                  end
                  object ToolButton13: TToolButton
                    Left = 51
                    Top = 0
                    Width = 8
                    Caption = 'ToolButton13'
                    ImageIndex = 21
                    Style = tbsSeparator
                  end
                  object LiefStdBtn: TToolButton
                    Left = 59
                    Top = 0
                    AutoSize = True
                    Caption = 'Als Standard'
                    ImageIndex = 12
                    OnClick = LiefStdBtnClick
                  end
                  object ToolButton7: TToolButton
                    Left = 150
                    Top = 0
                    Width = 8
                    Caption = 'ToolButton9'
                    ImageIndex = 20
                    Style = tbsSeparator
                  end
                  object LiefDelBtn: TToolButton
                    Left = 158
                    Top = 0
                    AutoSize = True
                    Caption = 'L'#246'schen'
                    ImageIndex = 50
                    OnClick = LiefDelBtnClick
                  end
                  object ToolButton4: TToolButton
                    Left = 230
                    Top = 0
                    Width = 8
                    Caption = 'ToolButton4'
                    ImageIndex = 20
                    Style = tbsSeparator
                  end
                  object LiefPreisSaveBtn: TToolButton
                    Left = 238
                    Top = 0
                    AutoSize = True
                    Caption = 'Speichern'
                    ImageIndex = 16
                    OnClick = LiefPreisSaveBtnClick
                  end
                  object ToolButton11: TToolButton
                    Left = 317
                    Top = 0
                    Width = 8
                    Caption = 'ToolButton11'
                    ImageIndex = 20
                    Style = tbsSeparator
                  end
                  object LiefPreisAbortBtn: TToolButton
                    Left = 325
                    Top = 0
                    AutoSize = True
                    Caption = 'Abbruch'
                    ImageIndex = 19
                    OnClick = LiefPreisAbortBtnClick
                  end
                end
              end
            end
            object Panel19: TPanel
              Left = 0
              Top = 0
              Width = 625
              Height = 3
              Align = alTop
              BevelOuter = bvNone
              Color = 14680063
              TabOrder = 1
            end
          end
        end
        object ArtTopPanelPreise: TPanel
          Left = 0
          Top = 0
          Width = 631
          Height = 88
          Align = alTop
          BevelOuter = bvNone
          Caption = 'ArtTopPanelPreise'
          TabOrder = 1
          object ArtKopfGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 631
            Height = 88
            Align = alClient
            Caption = 'Artikel'
            Color = 14680063
            Ctl3D = False
            Enabled = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 0
            object Label5: TLabel
              Left = 5
              Top = 24
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Suchbegriff:'
              FocusControl = DBEdit1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label6: TLabel
              Left = 293
              Top = 24
              Width = 45
              Height = 13
              AutoSize = False
              Caption = 'Kurztext:'
              FocusControl = DBEdit1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 293
              Top = 43
              Width = 45
              Height = 13
              AutoSize = False
              Caption = 'Langtext:'
              FocusControl = DBEdit3
            end
            object Label8: TLabel
              Left = 6
              Top = 66
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Ersatz-Nr.:'
              FocusControl = DBEdit1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label9: TLabel
              Left = 5
              Top = 45
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Artikel-Nr.:'
              FocusControl = DBEdit3
            end
            object DBEdit1: TDBEdit
              Left = 79
              Top = 21
              Width = 206
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'MATCHCODE'
              DataSource = AS_DS
              ReadOnly = True
              TabOrder = 0
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBEdit2: TDBEdit
              Tag = 1
              Left = 339
              Top = 21
              Width = 284
              Height = 19
              AutoSize = False
              DataField = 'KURZNAME'
              DataSource = AS_DS
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBMemo1: TDBMemo
              Tag = 1
              Left = 339
              Top = 42
              Width = 284
              Height = 40
              DataField = 'LANGNAME'
              DataSource = AS_DS
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 2
            end
            object DBEdit3: TDBEdit
              Left = 79
              Top = 42
              Width = 206
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'ARTNUM'
              DataSource = AS_DS
              ReadOnly = True
              TabOrder = 3
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBEdit4: TDBEdit
              Left = 79
              Top = 63
              Width = 206
              Height = 19
              AutoSize = False
              BiDiMode = bdLeftToRight
              CharCase = ecUpperCase
              DataField = 'ERSATZ_ARTNUM'
              DataSource = AS_DS
              ParentBiDiMode = False
              ReadOnly = True
              TabOrder = 4
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
        end
      end
      object ErweitertTS: TTabSheet
        Tag = 3
        Caption = 'Erweitert'
        ImageIndex = 5
        object ErweitertPC: TJvPageControl
          Left = 0
          Top = 93
          Width = 631
          Height = 403
          ActivePage = UserFelderTS
          Align = alClient
          HotTrack = True
          Style = tsButtons
          TabOrder = 0
          OnChange = Art_PCChange
          HandleGlobalTab = True
          ParentColor = False
          Color = 14680063
          object UserFelderTS: TTabSheet
            Tag = 1
            Caption = 'Benutzerfelder'
            ImageIndex = 5
            object Panel17: TPanel
              Left = 0
              Top = 0
              Width = 623
              Height = 3
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
            end
            object gbBenutzerfelder: TOFGroupBox
              Left = 0
              Top = 3
              Width = 623
              Height = 369
              Align = alClient
              Caption = 'Benutzerfelder'
              Color = 14680063
              Ctl3D = True
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentColor = False
              ParentCtl3D = False
              TabOrder = 1
              object UFeld01Lab: TLabel
                Left = 9
                Top = 27
                Width = 77
                Height = 13
                Caption = 'Benutzerfeld 01:'
                FocusControl = Userfeld01
              end
              object UFeld02Lab: TLabel
                Left = 9
                Top = 51
                Width = 77
                Height = 13
                Caption = 'Benutzerfeld 02:'
                FocusControl = Userfeld02
              end
              object UFeld03Lab: TLabel
                Left = 9
                Top = 75
                Width = 77
                Height = 13
                Caption = 'Benutzerfeld 03:'
                FocusControl = Userfeld03
              end
              object UFeld04Lab: TLabel
                Left = 9
                Top = 99
                Width = 77
                Height = 13
                Caption = 'Benutzerfeld 04:'
                FocusControl = Userfeld04
              end
              object UFeld05Lab: TLabel
                Left = 9
                Top = 123
                Width = 77
                Height = 13
                Caption = 'Benutzerfeld 05:'
                FocusControl = Userfeld05
              end
              object UFeld06Lab: TLabel
                Left = 9
                Top = 147
                Width = 77
                Height = 13
                Caption = 'Benutzerfeld 06:'
                FocusControl = Userfeld06
              end
              object UFeld07Lab: TLabel
                Left = 9
                Top = 171
                Width = 77
                Height = 13
                Caption = 'Benutzerfeld 07:'
                FocusControl = Userfeld07
              end
              object UFeld08Lab: TLabel
                Left = 9
                Top = 195
                Width = 77
                Height = 13
                Caption = 'Benutzerfeld 08:'
                FocusControl = Userfeld08
              end
              object UFeld09Lab: TLabel
                Left = 9
                Top = 219
                Width = 77
                Height = 13
                Caption = 'Benutzerfeld 09:'
                FocusControl = Userfeld09
              end
              object UFeld10Lab: TLabel
                Left = 9
                Top = 243
                Width = 77
                Height = 13
                Caption = 'Benutzerfeld 10:'
                FocusControl = Userfeld10
              end
              object Userfeld01: TDBEdit
                Tag = 1
                Left = 96
                Top = 24
                Width = 519
                Height = 19
                Ctl3D = False
                DataField = 'USERFELD_01'
                DataSource = AS_DS
                ParentCtl3D = False
                TabOrder = 0
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object Userfeld02: TDBEdit
                Tag = 1
                Left = 96
                Top = 48
                Width = 519
                Height = 19
                Ctl3D = False
                DataField = 'USERFELD_02'
                DataSource = AS_DS
                ParentCtl3D = False
                TabOrder = 1
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object Userfeld03: TDBEdit
                Tag = 1
                Left = 96
                Top = 72
                Width = 519
                Height = 19
                Ctl3D = False
                DataField = 'USERFELD_03'
                DataSource = AS_DS
                ParentCtl3D = False
                TabOrder = 2
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object Userfeld04: TDBEdit
                Tag = 1
                Left = 96
                Top = 96
                Width = 519
                Height = 19
                Ctl3D = False
                DataField = 'USERFELD_04'
                DataSource = AS_DS
                ParentCtl3D = False
                TabOrder = 3
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object Userfeld05: TDBEdit
                Tag = 1
                Left = 96
                Top = 120
                Width = 519
                Height = 19
                Ctl3D = False
                DataField = 'USERFELD_05'
                DataSource = AS_DS
                ParentCtl3D = False
                TabOrder = 4
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object Userfeld06: TDBEdit
                Tag = 1
                Left = 96
                Top = 144
                Width = 519
                Height = 19
                Ctl3D = False
                DataField = 'USERFELD_06'
                DataSource = AS_DS
                ParentCtl3D = False
                TabOrder = 5
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object Userfeld07: TDBEdit
                Tag = 1
                Left = 96
                Top = 168
                Width = 519
                Height = 19
                Ctl3D = False
                DataField = 'USERFELD_07'
                DataSource = AS_DS
                ParentCtl3D = False
                TabOrder = 6
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object Userfeld08: TDBEdit
                Tag = 1
                Left = 96
                Top = 192
                Width = 519
                Height = 19
                Ctl3D = False
                DataField = 'USERFELD_08'
                DataSource = AS_DS
                ParentCtl3D = False
                TabOrder = 7
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object Userfeld09: TDBEdit
                Tag = 1
                Left = 96
                Top = 216
                Width = 519
                Height = 19
                Ctl3D = False
                DataField = 'USERFELD_09'
                DataSource = AS_DS
                ParentCtl3D = False
                TabOrder = 8
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object Userfeld10: TDBEdit
                Tag = 1
                Left = 96
                Top = 240
                Width = 519
                Height = 19
                Ctl3D = False
                DataField = 'USERFELD_10'
                DataSource = AS_DS
                ParentCtl3D = False
                TabOrder = 9
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
            end
          end
          object SerNoTS: TTabSheet
            Tag = 2
            Caption = 'Seriennummern'
            object gbSNListe: TOFGroupBox
              Left = 0
              Top = 3
              Width = 623
              Height = 246
              Align = alClient
              Caption = 'Liste der Seriennummern'
              Color = 14680063
              Ctl3D = True
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentColor = False
              ParentCtl3D = False
              TabOrder = 0
              object SerNoGrid: TOFDBGrid
                Left = 8
                Top = 21
                Width = 607
                Height = 217
                Align = alClient
                BorderStyle = bsNone
                Ctl3D = True
                DataSource = SerNoDS
                DefaultDrawing = False
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                ParentCtl3D = False
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
                RowColor1 = 12255087
                RowColor2 = clWindow
                ShowTitleEllipsis = True
                DefaultRowHeight = 17
                EditColor = clBlack
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'SERNUMMER'
                    Width = 273
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'STATUS'
                    Width = 70
                    Visible = True
                  end>
              end
            end
            object gbSNDetails: TOFGroupBox
              Left = 0
              Top = 249
              Width = 623
              Height = 70
              Align = alBottom
              Caption = 'Details'
              Color = 14680063
              Ctl3D = True
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentColor = False
              ParentCtl3D = False
              TabOrder = 1
            end
            object gbSNErfassen: TOFGroupBox
              Left = 0
              Top = 319
              Width = 623
              Height = 53
              Align = alBottom
              Caption = 'Erfassen'
              Color = 14680063
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentColor = False
              TabOrder = 2
              object SNEdit: TEdit
                Left = 8
                Top = 24
                Width = 161
                Height = 19
                CharCase = ecUpperCase
                Ctl3D = False
                ParentCtl3D = False
                TabOrder = 0
                OnChange = SNEditChange
              end
              object SNAddBtn: TButton
                Left = 176
                Top = 23
                Width = 97
                Height = 21
                Caption = 'Hinzuf'#252'gen'
                Enabled = False
                TabOrder = 1
                OnClick = SNAddBtnClick
              end
            end
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 623
              Height = 3
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 3
            end
          end
          object StueckListTS: TTabSheet
            Tag = 3
            Caption = 'St'#252'ckliste'
            ImageIndex = 1
            object ToolBar2: TToolBar
              Left = 0
              Top = 346
              Width = 623
              Height = 26
              Align = alBottom
              AutoSize = True
              BorderWidth = 1
              ButtonWidth = 117
              Caption = 'ToolBar99'
              Color = clBtnFace
              EdgeBorders = []
              EdgeInner = esNone
              EdgeOuter = esNone
              Flat = True
              Images = MainForm.ImageList1
              Indent = 3
              List = True
              ParentColor = False
              ShowCaptions = True
              TabOrder = 0
              object DBNavigator2: TDBNavigator
                Left = 3
                Top = 0
                Width = 189
                Height = 22
                DataSource = STListDS
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
                Flat = True
                TabOrder = 0
              end
              object ToolButton8: TToolButton
                Left = 192
                Top = 0
                AutoSize = True
                Caption = 'Artikel &hinzuf'#252'gen'
                ImageIndex = 20
                OnClick = ToolButton8Click
              end
              object STListArtDelBtn: TToolButton
                Left = 307
                Top = 0
                AutoSize = True
                Caption = 'Artikel l'#246'schen'
                ImageIndex = 19
                OnClick = STListArtDelBtnClick
              end
            end
            object gbStuecklstSumme: TOFGroupBox
              Left = 0
              Top = 298
              Width = 623
              Height = 48
              Align = alBottom
              Caption = 'Summe'
              Color = 14680063
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentColor = False
              TabOrder = 1
              object Label49: TLabel
                Left = 8
                Top = 24
                Width = 83
                Height = 13
                Caption = 'EK-Preis gesamt :'
              end
              object STListPreisUebernehmenBtn: TSpeedButton
                Left = 192
                Top = 21
                Width = 145
                Height = 19
                Caption = 'als EK-Preis '#252'bernehmen'
                Flat = True
                Transparent = False
                OnClick = STListPreisUebernehmenBtnClick
              end
              object SetLangTextfromStklBtn: TSpeedButton
                Left = 347
                Top = 21
                Width = 185
                Height = 19
                Caption = 'Details in den Langtext '#252'bernehmen'
                Flat = True
                Transparent = False
                OnClick = SetLangTextfromStklBtnClick
              end
              object STListSumEK: TJvCalcEdit
                Left = 99
                Top = 22
                Width = 84
                Height = 19
                Flat = True
                ParentCtl3D = False
                ShowButton = False
                TabOrder = 0
                Value = 1.000000000000000000
                DecimalPlacesAlwaysShown = False
              end
            end
            object gbStueckliste: TOFGroupBox
              Left = 0
              Top = 3
              Width = 623
              Height = 295
              Align = alClient
              Caption = 'St'#252'ckliste'
              Color = 14680063
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentColor = False
              TabOrder = 2
              object STListGrid: TOFDBGrid
                Left = 8
                Top = 21
                Width = 607
                Height = 266
                Align = alClient
                BorderStyle = bsNone
                Ctl3D = True
                DataSource = STListDS
                DefaultDrawing = False
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
                RowColor1 = 12255087
                RowColor2 = clWindow
                ShowTitleEllipsis = True
                DefaultRowHeight = 17
                EditColor = clBlack
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'MENGE'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ARTNUM'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MATCHCODE'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'BARCODE'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'KURZNAME'
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'EK_PREIS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MENGE_AKT'
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end>
              end
            end
            object Panel16: TPanel
              Left = 0
              Top = 0
              Width = 623
              Height = 3
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 3
            end
          end
          object ArtikelSetTS: TTabSheet
            Tag = 4
            Caption = 'Artikelset'
            ImageIndex = 2
          end
          object ZubehoerTS: TTabSheet
            Tag = 5
            Caption = 'Zubeh'#246'r'
            ImageIndex = 3
            object Panel18: TPanel
              Left = 0
              Top = 0
              Width = 623
              Height = 3
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
            end
            object gbZubehoer: TOFGroupBox
              Left = 0
              Top = 3
              Width = 623
              Height = 369
              Align = alClient
              Caption = 'Zubeh'#246'r'
              Color = 14680063
              Ctl3D = True
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentColor = False
              ParentCtl3D = False
              TabOrder = 1
              object ZubGrid: TOFDBGrid
                Left = 8
                Top = 21
                Width = 607
                Height = 340
                Align = alClient
                BorderStyle = bsNone
                Ctl3D = True
                DataSource = STListDS
                DefaultDrawing = False
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
                RowColor1 = 12255087
                RowColor2 = clWindow
                ShowTitleEllipsis = True
                DefaultRowHeight = 17
                EditColor = clBlack
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ARTNUM'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MATCHCODE'
                    Title.Caption = 'Suchbegriff'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'BARCODE'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'KURZNAME'
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MENGE_AKT'
                    Width = 65
                    Visible = True
                  end>
              end
            end
          end
          object ErsatzteilTS: TTabSheet
            Tag = 6
            Caption = 'Ersatzteile'
            ImageIndex = 4
            object Panel22: TPanel
              Left = 0
              Top = 0
              Width = 623
              Height = 3
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
            end
            object gbErsatzteile: TOFGroupBox
              Left = 0
              Top = 3
              Width = 623
              Height = 369
              Align = alClient
              Caption = 'Ersatzteile'
              Color = 14680063
              Ctl3D = True
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentColor = False
              ParentCtl3D = False
              TabOrder = 1
              object ErsGrid: TOFDBGrid
                Left = 8
                Top = 21
                Width = 607
                Height = 340
                Align = alClient
                BorderStyle = bsNone
                Ctl3D = True
                DataSource = STListDS
                DefaultDrawing = False
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
                RowColor1 = 12255087
                RowColor2 = clWindow
                ShowTitleEllipsis = True
                DefaultRowHeight = 17
                EditColor = clBlack
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ARTNUM'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MATCHCODE'
                    Title.Caption = 'Suchbegriff'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'BARCODE'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'KURZNAME'
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MENGE_AKT'
                    Width = 65
                    Visible = True
                  end>
              end
            end
          end
        end
        object Panel57: TPanel
          Left = 0
          Top = 88
          Width = 631
          Height = 5
          Align = alTop
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 1
        end
        object ArtTopPanelErweitert: TPanel
          Left = 0
          Top = 0
          Width = 631
          Height = 88
          Align = alTop
          BevelOuter = bvNone
          Caption = 'ArtTopPanelErweitert'
          TabOrder = 2
        end
      end
      object ShopTS: TTabSheet
        Tag = 4
        Caption = 'Shop'
        ImageIndex = 6
        object ShopRightPanel: TPanel
          Left = 249
          Top = 0
          Width = 382
          Height = 496
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object ShopBeschrGB: TOFGroupBox
            Left = 0
            Top = 105
            Width = 382
            Height = 214
            Align = alClient
            Caption = 'Artikelbeschreibung:'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 1
            object Label62: TLabel
              Left = 148
              Top = 1
              Width = 76
              Height = 13
              Caption = '(als HTML-Text)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBtnFace
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object DBSynEdit1: TDBSynEdit
              Left = 8
              Top = 21
              Width = 366
              Height = 160
              Cursor = crIBeam
              DataField = 'SHOP_LANGTEXT'
              DataSource = AS_DS
              Align = alClient
              Ctl3D = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentColor = False
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = LtextMemoExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              Gutter.AutoSize = True
              Gutter.Font.Charset = ANSI_CHARSET
              Gutter.Font.Color = clWindowText
              Gutter.Font.Height = -11
              Gutter.Font.Name = 'Arial'
              Gutter.Font.Style = []
              Gutter.LeadingZeros = True
              Gutter.LeftOffset = 0
              Gutter.RightOffset = 5
              Gutter.ShowLineNumbers = True
              Highlighter = SynHTMLSyn1
              Keystrokes = <
                item
                  Command = ecUp
                  ShortCut = 38
                end
                item
                  Command = ecSelUp
                  ShortCut = 8230
                end
                item
                  Command = ecScrollUp
                  ShortCut = 16422
                end
                item
                  Command = ecDown
                  ShortCut = 40
                end
                item
                  Command = ecSelDown
                  ShortCut = 8232
                end
                item
                  Command = ecScrollDown
                  ShortCut = 16424
                end
                item
                  Command = ecLeft
                  ShortCut = 37
                end
                item
                  Command = ecSelLeft
                  ShortCut = 8229
                end
                item
                  Command = ecWordLeft
                  ShortCut = 16421
                end
                item
                  Command = ecSelWordLeft
                  ShortCut = 24613
                end
                item
                  Command = ecRight
                  ShortCut = 39
                end
                item
                  Command = ecSelRight
                  ShortCut = 8231
                end
                item
                  Command = ecWordRight
                  ShortCut = 16423
                end
                item
                  Command = ecSelWordRight
                  ShortCut = 24615
                end
                item
                  Command = ecPageDown
                  ShortCut = 34
                end
                item
                  Command = ecSelPageDown
                  ShortCut = 8226
                end
                item
                  Command = ecPageBottom
                  ShortCut = 16418
                end
                item
                  Command = ecSelPageBottom
                  ShortCut = 24610
                end
                item
                  Command = ecPageUp
                  ShortCut = 33
                end
                item
                  Command = ecSelPageUp
                  ShortCut = 8225
                end
                item
                  Command = ecPageTop
                  ShortCut = 16417
                end
                item
                  Command = ecSelPageTop
                  ShortCut = 24609
                end
                item
                  Command = ecLineStart
                  ShortCut = 36
                end
                item
                  Command = ecSelLineStart
                  ShortCut = 8228
                end
                item
                  Command = ecEditorTop
                  ShortCut = 16420
                end
                item
                  Command = ecSelEditorTop
                  ShortCut = 24612
                end
                item
                  Command = ecLineEnd
                  ShortCut = 35
                end
                item
                  Command = ecSelLineEnd
                  ShortCut = 8227
                end
                item
                  Command = ecEditorBottom
                  ShortCut = 16419
                end
                item
                  Command = ecSelEditorBottom
                  ShortCut = 24611
                end
                item
                  Command = ecToggleMode
                  ShortCut = 45
                end
                item
                  Command = ecCopy
                  ShortCut = 16429
                end
                item
                  Command = ecCut
                  ShortCut = 8238
                end
                item
                  Command = ecPaste
                  ShortCut = 8237
                end
                item
                  Command = ecDeleteChar
                  ShortCut = 46
                end
                item
                  Command = ecDeleteLastChar
                  ShortCut = 8
                end
                item
                  Command = ecDeleteLastChar
                  ShortCut = 8200
                end
                item
                  Command = ecDeleteLastWord
                  ShortCut = 16392
                end
                item
                  Command = ecUndo
                  ShortCut = 32776
                end
                item
                  Command = ecRedo
                  ShortCut = 40968
                end
                item
                  Command = ecLineBreak
                  ShortCut = 13
                end
                item
                  Command = ecLineBreak
                  ShortCut = 8205
                end
                item
                  Command = ecTab
                  ShortCut = 9
                end
                item
                  Command = ecShiftTab
                  ShortCut = 8201
                end
                item
                  Command = ecContextHelp
                  ShortCut = 16496
                end
                item
                  Command = ecSelectAll
                  ShortCut = 16449
                end
                item
                  Command = ecCopy
                  ShortCut = 16451
                end
                item
                  Command = ecPaste
                  ShortCut = 16470
                end
                item
                  Command = ecCut
                  ShortCut = 16472
                end
                item
                  Command = ecBlockIndent
                  ShortCut = 24649
                end
                item
                  Command = ecBlockUnindent
                  ShortCut = 24661
                end
                item
                  Command = ecLineBreak
                  ShortCut = 16461
                end
                item
                  Command = ecInsertLine
                  ShortCut = 16462
                end
                item
                  Command = ecDeleteWord
                  ShortCut = 16468
                end
                item
                  Command = ecDeleteLine
                  ShortCut = 16473
                end
                item
                  Command = ecDeleteEOL
                  ShortCut = 24665
                end
                item
                  Command = ecUndo
                  ShortCut = 16474
                end
                item
                  Command = ecRedo
                  ShortCut = 24666
                end
                item
                  Command = ecGotoMarker0
                  ShortCut = 16432
                end
                item
                  Command = ecGotoMarker1
                  ShortCut = 16433
                end
                item
                  Command = ecGotoMarker2
                  ShortCut = 16434
                end
                item
                  Command = ecGotoMarker3
                  ShortCut = 16435
                end
                item
                  Command = ecGotoMarker4
                  ShortCut = 16436
                end
                item
                  Command = ecGotoMarker5
                  ShortCut = 16437
                end
                item
                  Command = ecGotoMarker6
                  ShortCut = 16438
                end
                item
                  Command = ecGotoMarker7
                  ShortCut = 16439
                end
                item
                  Command = ecGotoMarker8
                  ShortCut = 16440
                end
                item
                  Command = ecGotoMarker9
                  ShortCut = 16441
                end
                item
                  Command = ecSetMarker0
                  ShortCut = 24624
                end
                item
                  Command = ecSetMarker1
                  ShortCut = 24625
                end
                item
                  Command = ecSetMarker2
                  ShortCut = 24626
                end
                item
                  Command = ecSetMarker3
                  ShortCut = 24627
                end
                item
                  Command = ecSetMarker4
                  ShortCut = 24628
                end
                item
                  Command = ecSetMarker5
                  ShortCut = 24629
                end
                item
                  Command = ecSetMarker6
                  ShortCut = 24630
                end
                item
                  Command = ecSetMarker7
                  ShortCut = 24631
                end
                item
                  Command = ecSetMarker8
                  ShortCut = 24632
                end
                item
                  Command = ecSetMarker9
                  ShortCut = 24633
                end
                item
                  Command = ecNormalSelect
                  ShortCut = 24654
                end
                item
                  Command = ecColumnSelect
                  ShortCut = 24643
                end
                item
                  Command = ecLineSelect
                  ShortCut = 24652
                end
                item
                  Command = ecMatchBracket
                  ShortCut = 24642
                end>
              Options = [eoAutoIndent, eoDragDropEditing, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabIndent, eoTabsToSpaces, eoTrimTrailingSpaces]
            end
            object HTMLEditPanel1: TPanel
              Left = 8
              Top = 181
              Width = 366
              Height = 25
              Align = alBottom
              BevelOuter = bvNone
              BevelWidth = 2
              Color = 14680063
              TabOrder = 1
              object HTMLEditBtn1: TBitBtn
                Left = 1
                Top = 3
                Width = 74
                Height = 21
                Caption = 'Editor'
                TabOrder = 0
                OnClick = HTMLEditBtn1Click
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
                  000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
                  00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
                  F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
                  0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
                  FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
                  FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
                  0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
                  00333377737FFFFF773333303300000003333337337777777333}
                NumGlyphs = 2
              end
            end
          end
          object ShopKurztextGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 382
            Height = 105
            Align = alTop
            Caption = 'Kurztext'
            Color = 14680063
            TitleColor = 14680063
            ParentColor = False
            TabOrder = 0
            Visible = False
            object ShopKurztext: TDBSynEdit
              Left = 8
              Top = 21
              Width = 366
              Height = 76
              Cursor = crIBeam
              DataField = 'SHOP_KURZTEXT'
              DataSource = AS_DS
              Align = alClient
              Ctl3D = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentColor = False
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = LtextMemoExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              Gutter.AutoSize = True
              Gutter.Font.Charset = ANSI_CHARSET
              Gutter.Font.Color = clWindowText
              Gutter.Font.Height = -11
              Gutter.Font.Name = 'Arial'
              Gutter.Font.Style = []
              Gutter.LeadingZeros = True
              Gutter.LeftOffset = 0
              Gutter.RightOffset = 5
              Gutter.ShowLineNumbers = True
              Highlighter = SynHTMLSyn1
              Keystrokes = <
                item
                  Command = ecUp
                  ShortCut = 38
                end
                item
                  Command = ecSelUp
                  ShortCut = 8230
                end
                item
                  Command = ecScrollUp
                  ShortCut = 16422
                end
                item
                  Command = ecDown
                  ShortCut = 40
                end
                item
                  Command = ecSelDown
                  ShortCut = 8232
                end
                item
                  Command = ecScrollDown
                  ShortCut = 16424
                end
                item
                  Command = ecLeft
                  ShortCut = 37
                end
                item
                  Command = ecSelLeft
                  ShortCut = 8229
                end
                item
                  Command = ecWordLeft
                  ShortCut = 16421
                end
                item
                  Command = ecSelWordLeft
                  ShortCut = 24613
                end
                item
                  Command = ecRight
                  ShortCut = 39
                end
                item
                  Command = ecSelRight
                  ShortCut = 8231
                end
                item
                  Command = ecWordRight
                  ShortCut = 16423
                end
                item
                  Command = ecSelWordRight
                  ShortCut = 24615
                end
                item
                  Command = ecPageDown
                  ShortCut = 34
                end
                item
                  Command = ecSelPageDown
                  ShortCut = 8226
                end
                item
                  Command = ecPageBottom
                  ShortCut = 16418
                end
                item
                  Command = ecSelPageBottom
                  ShortCut = 24610
                end
                item
                  Command = ecPageUp
                  ShortCut = 33
                end
                item
                  Command = ecSelPageUp
                  ShortCut = 8225
                end
                item
                  Command = ecPageTop
                  ShortCut = 16417
                end
                item
                  Command = ecSelPageTop
                  ShortCut = 24609
                end
                item
                  Command = ecLineStart
                  ShortCut = 36
                end
                item
                  Command = ecSelLineStart
                  ShortCut = 8228
                end
                item
                  Command = ecEditorTop
                  ShortCut = 16420
                end
                item
                  Command = ecSelEditorTop
                  ShortCut = 24612
                end
                item
                  Command = ecLineEnd
                  ShortCut = 35
                end
                item
                  Command = ecSelLineEnd
                  ShortCut = 8227
                end
                item
                  Command = ecEditorBottom
                  ShortCut = 16419
                end
                item
                  Command = ecSelEditorBottom
                  ShortCut = 24611
                end
                item
                  Command = ecToggleMode
                  ShortCut = 45
                end
                item
                  Command = ecCopy
                  ShortCut = 16429
                end
                item
                  Command = ecCut
                  ShortCut = 8238
                end
                item
                  Command = ecPaste
                  ShortCut = 8237
                end
                item
                  Command = ecDeleteChar
                  ShortCut = 46
                end
                item
                  Command = ecDeleteLastChar
                  ShortCut = 8
                end
                item
                  Command = ecDeleteLastChar
                  ShortCut = 8200
                end
                item
                  Command = ecDeleteLastWord
                  ShortCut = 16392
                end
                item
                  Command = ecUndo
                  ShortCut = 32776
                end
                item
                  Command = ecRedo
                  ShortCut = 40968
                end
                item
                  Command = ecLineBreak
                  ShortCut = 13
                end
                item
                  Command = ecLineBreak
                  ShortCut = 8205
                end
                item
                  Command = ecTab
                  ShortCut = 9
                end
                item
                  Command = ecShiftTab
                  ShortCut = 8201
                end
                item
                  Command = ecContextHelp
                  ShortCut = 16496
                end
                item
                  Command = ecSelectAll
                  ShortCut = 16449
                end
                item
                  Command = ecCopy
                  ShortCut = 16451
                end
                item
                  Command = ecPaste
                  ShortCut = 16470
                end
                item
                  Command = ecCut
                  ShortCut = 16472
                end
                item
                  Command = ecBlockIndent
                  ShortCut = 24649
                end
                item
                  Command = ecBlockUnindent
                  ShortCut = 24661
                end
                item
                  Command = ecLineBreak
                  ShortCut = 16461
                end
                item
                  Command = ecInsertLine
                  ShortCut = 16462
                end
                item
                  Command = ecDeleteWord
                  ShortCut = 16468
                end
                item
                  Command = ecDeleteLine
                  ShortCut = 16473
                end
                item
                  Command = ecDeleteEOL
                  ShortCut = 24665
                end
                item
                  Command = ecUndo
                  ShortCut = 16474
                end
                item
                  Command = ecRedo
                  ShortCut = 24666
                end
                item
                  Command = ecGotoMarker0
                  ShortCut = 16432
                end
                item
                  Command = ecGotoMarker1
                  ShortCut = 16433
                end
                item
                  Command = ecGotoMarker2
                  ShortCut = 16434
                end
                item
                  Command = ecGotoMarker3
                  ShortCut = 16435
                end
                item
                  Command = ecGotoMarker4
                  ShortCut = 16436
                end
                item
                  Command = ecGotoMarker5
                  ShortCut = 16437
                end
                item
                  Command = ecGotoMarker6
                  ShortCut = 16438
                end
                item
                  Command = ecGotoMarker7
                  ShortCut = 16439
                end
                item
                  Command = ecGotoMarker8
                  ShortCut = 16440
                end
                item
                  Command = ecGotoMarker9
                  ShortCut = 16441
                end
                item
                  Command = ecSetMarker0
                  ShortCut = 24624
                end
                item
                  Command = ecSetMarker1
                  ShortCut = 24625
                end
                item
                  Command = ecSetMarker2
                  ShortCut = 24626
                end
                item
                  Command = ecSetMarker3
                  ShortCut = 24627
                end
                item
                  Command = ecSetMarker4
                  ShortCut = 24628
                end
                item
                  Command = ecSetMarker5
                  ShortCut = 24629
                end
                item
                  Command = ecSetMarker6
                  ShortCut = 24630
                end
                item
                  Command = ecSetMarker7
                  ShortCut = 24631
                end
                item
                  Command = ecSetMarker8
                  ShortCut = 24632
                end
                item
                  Command = ecSetMarker9
                  ShortCut = 24633
                end
                item
                  Command = ecNormalSelect
                  ShortCut = 24654
                end
                item
                  Command = ecColumnSelect
                  ShortCut = 24643
                end
                item
                  Command = ecLineSelect
                  ShortCut = 24652
                end
                item
                  Command = ecMatchBracket
                  ShortCut = 24642
                end>
              Options = [eoAutoIndent, eoDragDropEditing, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabIndent, eoTabsToSpaces, eoTrimTrailingSpaces]
            end
          end
          object CaoGroupBox1: TOFGroupBox
            Left = 0
            Top = 319
            Width = 382
            Height = 177
            Align = alBottom
            Caption = 'Meta Tag'
            Color = 14680063
            TitleColor = 14680063
            ParentColor = False
            TabOrder = 2
            Visible = False
            object Label10: TLabel
              Left = 5
              Top = 24
              Width = 47
              Height = 13
              Caption = 'Meta Titel'
            end
            object Label18: TLabel
              Left = 5
              Top = 44
              Width = 45
              Height = 13
              Caption = 'Meta Key'
            end
            object Label24: TLabel
              Left = 5
              Top = 66
              Width = 92
              Height = 13
              Caption = 'Meta Beschreibung'
            end
            object MetaTitel: TDBEdit
              Tag = 1
              Left = 79
              Top = 21
              Width = 295
              Height = 19
              DataField = 'SHOP_META_TITEL'
              DataSource = AS_DS
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object MetaKey: TDBEdit
              Tag = 1
              Left = 79
              Top = 41
              Width = 295
              Height = 19
              DataField = 'SHOP_META_KEY'
              DataSource = AS_DS
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object MetaBeschreibung: TDBMemo
              Tag = 1
              Left = 8
              Top = 82
              Width = 366
              Height = 87
              Align = alBottom
              DataField = 'SHOP_META_BESCHR'
              DataSource = AS_DS
              ScrollBars = ssVertical
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
        end
        object ShopLeftPanel: TPanel
          Left = 0
          Top = 0
          Width = 249
          Height = 496
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object ShopAllgGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 249
            Height = 185
            Align = alTop
            Caption = 'Allgemein'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 0
            object ShopImageLab: TLabel
              Left = 6
              Top = 124
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Artikelbild:'
              FocusControl = ShopImgEdi
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object ShopPreisLab: TLabel
              Left = 5
              Top = 84
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Preis (netto):'
            end
            object Label66: TLabel
              Left = 5
              Top = 24
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Shopartikel:'
              FocusControl = ShopArtLB
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label67: TLabel
              Left = 6
              Top = 104
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Herstellerlink:'
              FocusControl = ShopProdUrlEdi
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label61: TLabel
              Left = 5
              Top = 44
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Artikel-Nr.:'
            end
            object Label63: TLabel
              Left = 5
              Top = 64
              Width = 64
              Height = 13
              AutoSize = False
              Caption = 'Artikelname:'
            end
            object ShopImageMedLab: TLabel
              Left = 6
              Top = 144
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Artikelbild (2):'
              FocusControl = DBEdit17
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object ShopImageLargeLab: TLabel
              Left = 6
              Top = 164
              Width = 74
              Height = 13
              AutoSize = False
              Caption = 'Artikelbild (3):'
              FocusControl = DBEdit18
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object ProdImageUploadBtn: TSpeedButton
              Tag = 1
              Left = 218
              Top = 121
              Width = 23
              Height = 19
              Hint = 'Produkt-Bild hochladen'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              OnClick = ProdImageUploadBtnClick
            end
            object ProdImageMedUploadBtn: TSpeedButton
              Tag = 2
              Left = 218
              Top = 141
              Width = 23
              Height = 19
              Hint = 'Produkt-Bild hochladen'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              OnClick = ProdImageUploadBtnClick
            end
            object ProdImageLargeUploadBtn: TSpeedButton
              Tag = 3
              Left = 218
              Top = 161
              Width = 23
              Height = 19
              Hint = 'Produkt-Bild hochladen'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              OnClick = ProdImageUploadBtnClick
            end
            object DBEdit18: TDBEdit
              Left = 79
              Top = 161
              Width = 142
              Height = 19
              AutoSelect = False
              AutoSize = False
              BiDiMode = bdLeftToRight
              DataField = 'SHOP_IMAGE_LARGE'
              DataSource = AS_DS
              ParentBiDiMode = False
              TabOrder = 7
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBEdit17: TDBEdit
              Left = 79
              Top = 141
              Width = 142
              Height = 19
              AutoSelect = False
              AutoSize = False
              BiDiMode = bdLeftToRight
              DataField = 'SHOP_IMAGE_MED'
              DataSource = AS_DS
              ParentBiDiMode = False
              TabOrder = 6
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object ShopImgEdi: TDBEdit
              Left = 79
              Top = 121
              Width = 142
              Height = 19
              AutoSelect = False
              AutoSize = False
              BiDiMode = bdLeftToRight
              DataField = 'SHOP_IMAGE'
              DataSource = AS_DS
              ParentBiDiMode = False
              TabOrder = 5
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object ShopPreisEdi: TDBEdit
              Tag = 1
              Left = 79
              Top = 81
              Width = 162
              Height = 19
              AutoSize = False
              DataField = 'SHOP_PREIS_LISTE'
              DataSource = AS_DS
              TabOrder = 3
              OnEnter = matchEnter
              OnExit = ShopPreisEdiExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object ShopArtLB: TVolgaDBEdit
              Tag = 1
              Left = 79
              Top = 21
              Width = 162
              Height = 19
              AutoDropDown = True
              ButtonWidth = 17
              ClearValue = '-1'
              ComboProps.ComboItems.Strings = (
                'kein Shopartikel'
                'Shopartikel Shop 1')
              ComboProps.ComboValues.Strings = (
                '-1'
                '1')
              DataField = 'SHOP_ID'
              DataSource = AS_DS
              DialogStyle = vdsCombo
              Style = vcsDropDownList
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object ShopProdUrlEdi: TDBEdit
              Tag = 1
              Left = 79
              Top = 101
              Width = 162
              Height = 19
              Hint = 'ohne f'#252'hrendes http://'
              AutoSelect = False
              AutoSize = False
              BiDiMode = bdLeftToRight
              DataField = 'SHOP_DATENBLATT'
              DataSource = AS_DS
              ParentBiDiMode = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object ShopModellEdi: TDBEdit
              Tag = 1
              Left = 79
              Top = 41
              Width = 162
              Height = 19
              AutoSize = False
              DataField = 'ARTNUM'
              DataSource = AS_DS
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object ShopArtName: TDBEdit
              Tag = 1
              Left = 79
              Top = 61
              Width = 162
              Height = 19
              AutoSize = False
              DataField = 'KURZNAME'
              DataSource = AS_DS
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object ShopDivGB: TOFGroupBox
            Left = 0
            Top = 185
            Width = 249
            Height = 64
            Align = alTop
            Caption = 'Diverses'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 1
            object ShopAktivCB: TDBCheckBox
              Left = 5
              Top = 24
              Width = 233
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Aktiv'
              Ctl3D = False
              DataField = 'SHOP_VISIBLE'
              DataSource = AS_DS
              ParentCtl3D = False
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object ShopDelCB: TDBCheckBox
              Left = 5
              Top = 40
              Width = 233
              Height = 17
              Alignment = taLeftJustify
              Caption = 'beim n'#228'chsten Update l'#246'schen'
              DataField = 'SHOP_DEL_FLAG'
              DataSource = AS_DS
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object ShopKatGB: TOFGroupBox
            Left = 0
            Top = 249
            Width = 249
            Height = 247
            Align = alClient
            Caption = 'Kategori(en)'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 2
            object ArtKatGrid: TOFDBGrid
              Tag = 1
              Left = 8
              Top = 21
              Width = 233
              Height = 218
              Hint = 'mit Doppelclick Kat.-Auswahl '#246'ffnen'
              Align = alClient
              BorderStyle = bsNone
              Ctl3D = True
              DataSource = ArtKatDS
              DefaultDrawing = False
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = ArtKatBtnClick
              OnKeyDown = ArtKatGridKeyDown
              OnKeyPress = ArtKatGridKeyPress
              AutoAppend = False
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
                  FieldName = 'ID'
                  Width = 30
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NAME'
                  ReadOnly = True
                  Title.Caption = 'Name'
                  Width = 190
                  Visible = True
                end>
            end
          end
        end
      end
      object Link_TS: TTabSheet
        Tag = 5
        Caption = 'Dateien'
        ImageIndex = 7
        object gbDateiLink: TOFGroupBox
          Left = 0
          Top = 88
          Width = 631
          Height = 408
          Align = alClient
          Caption = 'Datei-Link'#39's'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 0
          object LinkPanel: TPanel
            Tag = 5
            Left = 8
            Top = 21
            Width = 615
            Height = 379
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
          end
        end
        object ArtTopPanelDateien: TPanel
          Left = 0
          Top = 0
          Width = 631
          Height = 88
          Align = alTop
          BevelOuter = bvNone
          Caption = 'ArtTopPanelDateien'
          TabOrder = 1
        end
      end
      object Hist_TS: TTabSheet
        Tag = 6
        Caption = 'Historie'
        object HistSumBar: TStatusBar
          Left = 0
          Top = 477
          Width = 631
          Height = 19
          Panels = <
            item
              Alignment = taRightJustify
              Bevel = pbNone
              Text = 'Einkauf'
              Width = 40
            end
            item
              Alignment = taRightJustify
              Text = '0,00 DM'
              Width = 100
            end
            item
              Alignment = taRightJustify
              Text = '0 St'#252'ck'
              Width = 80
            end
            item
              Alignment = taRightJustify
              Bevel = pbNone
              Text = 'Verkauf'
              Width = 45
            end
            item
              Alignment = taRightJustify
              Text = '0,00 DM'
              Width = 100
            end
            item
              Alignment = taRightJustify
              Text = '0 St'#252'ck'
              Width = 80
            end
            item
              Alignment = taCenter
              Text = 'alles Netto !'
              Width = 50
            end>
          ParentFont = True
          UseSystemFont = False
        end
        object gbVorgang: TOFGroupBox
          Left = 0
          Top = 119
          Width = 631
          Height = 358
          Align = alClient
          Caption = 'Vorg'#228'nge'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 1
          object HistGrid: TOFDBGrid
            Left = 8
            Top = 21
            Width = 615
            Height = 329
            Align = alClient
            BorderStyle = bsNone
            Ctl3D = True
            DataSource = JPosDS
            DefaultDrawing = False
            ParentCtl3D = False
            PopupMenu = JumpMenu
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
            RowColor1 = 12255087
            RowColor2 = clWindow
            ShowTitleEllipsis = True
            DefaultRowHeight = 17
            EditColor = clBlack
            Columns = <
              item
                Expanded = False
                FieldName = 'CalcQuelle'
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RDATUM'
                Width = 61
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VRENUM'
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CALC_KUNDE'
                Title.Caption = 'Kunde / Lieferant'
                Width = 181
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MENGE'
                Width = 47
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EPREIS_STR'
                Width = 69
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RABATT'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GPREIS_STR'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STEUER_PROZ'
                Width = 36
                Visible = True
              end>
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 88
          Width = 631
          Height = 28
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object ToolBar99: TToolBar
            Left = 3
            Top = 0
            Width = 625
            Height = 28
            Align = alClient
            BorderWidth = 1
            ButtonHeight = 19
            Caption = 'ToolBar99'
            Color = 14680063
            EdgeBorders = []
            ParentColor = False
            TabOrder = 0
            Wrapable = False
            object Label27: TLabel
              Left = 0
              Top = 2
              Width = 61
              Height = 19
              Alignment = taRightJustify
              AutoSize = False
              Caption = '&Selektion : '
              Layout = tlCenter
            end
            object HistorySelCB: TComboBox
              Left = 61
              Top = 2
              Width = 181
              Height = 21
              Style = csDropDownList
              Ctl3D = False
              DropDownCount = 10
              ItemHeight = 0
              ParentCtl3D = False
              TabOrder = 1
              OnChange = JahrCBChange
              Items.Strings = (
                'alle Bewegungen'
                'nur Eink'#228'ufe'
                'nur Verk'#228'ufe'
                'Angebote'
                'Lieferscheine'
                'EK-Bestellungen'
                'offene Bestellungen'
                'unfertige Bestellungen'
                'unfertige Rechnungen')
            end
            object ToolButton1: TToolButton
              Left = 242
              Top = 2
              Width = 8
              Caption = 'ToolButton1'
              Style = tbsSeparator
            end
            object Label26: TLabel
              Left = 250
              Top = 2
              Width = 35
              Height = 19
              Alignment = taRightJustify
              AutoSize = False
              Caption = '&Jahr : '
              Layout = tlCenter
            end
            object JahrCB: TComboBox
              Left = 285
              Top = 2
              Width = 65
              Height = 19
              Style = csDropDownList
              Ctl3D = False
              DropDownCount = 13
              ItemHeight = 0
              ParentCtl3D = False
              TabOrder = 0
              OnChange = JahrCBChange
            end
            object ToolButton3: TToolButton
              Left = 350
              Top = 2
              Width = 8
              Caption = 'ToolButton3'
              ImageIndex = 1
              Style = tbsSeparator
            end
            object JumpMenuBtn: TJvSpeedButton
              Left = 358
              Top = 2
              Width = 86
              Height = 19
              Caption = 'Aktionen ...'
              DropDownMenu = JumpMenu
              Flat = True
              Glyph.Data = {
                E6000000424DE60000000000000076000000280000000F0000000E0000000100
                0400000000007000000000000000000000001000000000000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFF0087FFFFFFFFFFFF0B3087FFFFFFFFFFF0BB0087FF
                FFFFFFFF0BB3008FFFFFFFFFF0BBB008FFFFFFFFF00BBB007FFFFFFF00BBB007
                FFF0FFFFF00BBB007FF0FFFFFFF00BB007F0FFFFFFFFF00B0070FFFFFFFFFFF0
                00F0FFFFFFFFFFFFFFF0}
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
          end
          object Panel13: TPanel
            Left = 0
            Top = 0
            Width = 3
            Height = 28
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel14: TPanel
            Left = 628
            Top = 0
            Width = 3
            Height = 28
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
          end
        end
        object Panel15: TPanel
          Left = 0
          Top = 116
          Width = 631
          Height = 3
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
        end
        object ArtTopPanelHistorie: TPanel
          Left = 0
          Top = 0
          Width = 631
          Height = 88
          Align = alTop
          BevelOuter = bvNone
          Caption = 'ArtTopPanelHistorie'
          TabOrder = 4
        end
      end
      object Such_TS: TTabSheet
        Tag = 7
        Caption = 'Liste'
        ImageIndex = 7
        object ArtSuchGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 631
          Height = 496
          Align = alClient
          Ctl3D = True
          DataSource = AS_DS
          DefaultDrawing = False
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines]
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = ArtSuchGridDblClick
          AutoAppend = False
          ShowGlyphs = False
          TitleButtons = True
          OnTitleBtnClick = ArtSuchGridTitleBtnClick
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
          MultiLineRows = True
          DefaultRowHeight = 16
          EditColor = clHighlight
          OnApplyCellAttribute = ArtSuchGridApplyCellAttribute
          Columns = <
            item
              Expanded = False
              FieldName = 'WARENGRUPPE'
              Width = 26
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTIKELTYP'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MATCHCODE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTNUM'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ERSATZ_ARTNUM'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'HERST_ARTNUM'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'BARCODE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'KURZNAME'
              Width = 196
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LN'
              Title.Caption = 'Langtext (max 200 Zeichen)'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'MENGE_AKT'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MENGE_BESTELLT'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ME_EINHEIT'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_EK'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_VK1'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_VK1B'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CALC_VK2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_VK2B'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CALC_VK3'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_VK3B'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CALC_VK4'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_VK4B'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'VK5'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VK5B'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'STEUER_CODE'
              Width = 12
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VPE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PR_EINHEIT'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'LAENGE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'GROESSE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DIMENSION'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'GEWICHT'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'INVENTUR_WERT'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'RABGRP_ID'
              Title.Caption = 'Rab.Gr.'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'HERKUNFTSLAND'
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HERSTELLER_NAME'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LAGERORT'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ERLOES_KTO'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AUFW_KTO'
              Width = 38
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
            end
            item
              Expanded = False
              FieldName = 'GEAEND'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'GEAEND_NAME'
              Visible = False
            end>
        end
      end
    end
    object ArtPan: TPanel
      Left = 0
      Top = 0
      Width = 776
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      object ArtSuchenBtn: TJvSpeedButton
        Tag = 7
        Left = 644
        Top = 0
        Width = 45
        Height = 22
        Caption = 'Liste'
        Flat = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnMouseEnter = ArtAllgemeinBtnMouseEnter
        OnMouseLeave = ArtAllgemeinBtnMouseLeave
        OnClick = ArtAllgemeinBtnClick
      end
      object ArtHistorieBtn: TJvSpeedButton
        Tag = 6
        Left = 589
        Top = 0
        Width = 55
        Height = 22
        Caption = 'Historie'
        Flat = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnMouseEnter = ArtAllgemeinBtnMouseEnter
        OnMouseLeave = ArtAllgemeinBtnMouseLeave
        OnClick = ArtAllgemeinBtnClick
      end
      object ArtPreiseBtn: TJvSpeedButton
        Tag = 2
        Left = 346
        Top = 0
        Width = 51
        Height = 22
        Caption = 'Preise'
        Flat = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnMouseEnter = ArtAllgemeinBtnMouseEnter
        OnMouseLeave = ArtAllgemeinBtnMouseLeave
        OnClick = ArtAllgemeinBtnClick
      end
      object ArtAllgemeinBtn: TJvSpeedButton
        Tag = 1
        Left = 280
        Top = 0
        Width = 63
        Height = 22
        Caption = 'Allgemein'
        Flat = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnMouseEnter = ArtAllgemeinBtnMouseEnter
        OnMouseLeave = ArtAllgemeinBtnMouseLeave
        OnClick = ArtAllgemeinBtnClick
      end
      object ArtHirViewBtn: TJvSpeedButton
        Tag = 1
        Left = 3
        Top = 1
        Width = 86
        Height = 22
        Caption = 'Artikel'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        ParentFont = False
        OnMouseEnter = ArtAllgemeinBtnMouseEnter
        OnMouseLeave = ArtAllgemeinBtnMouseLeave
        OnClick = ArtHirViewBtnClick
      end
      object ArtErweitertBtn: TJvSpeedButton
        Tag = 3
        Left = 399
        Top = 0
        Width = 70
        Height = 22
        Caption = 'Erweitert'
        Flat = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnMouseEnter = ArtAllgemeinBtnMouseEnter
        OnMouseLeave = ArtAllgemeinBtnMouseLeave
        OnClick = ArtAllgemeinBtnClick
      end
      object ArtShopBtn: TJvSpeedButton
        Tag = 4
        Left = 475
        Top = 0
        Width = 46
        Height = 22
        Caption = 'Shop'
        Flat = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnMouseEnter = ArtAllgemeinBtnMouseEnter
        OnMouseLeave = ArtAllgemeinBtnMouseLeave
        OnClick = ArtAllgemeinBtnClick
      end
      object ArtLinkBtn: TJvSpeedButton
        Tag = 5
        Left = 526
        Top = 0
        Width = 58
        Height = 22
        Caption = 'Dateien'
        Flat = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnMouseEnter = ArtAllgemeinBtnMouseEnter
        OnMouseLeave = ArtAllgemeinBtnMouseLeave
        OnClick = ArtAllgemeinBtnClick
      end
    end
    object ArtWgrPan: TPanel
      Left = 0
      Top = 27
      Width = 142
      Height = 519
      Align = alLeft
      BevelOuter = bvNone
      BorderWidth = 2
      TabOrder = 2
      Visible = False
      OnResize = ArtWgrPanResize
      object ArtWgrTV: TTreeView
        Left = 2
        Top = 22
        Width = 138
        Height = 495
        Align = alClient
        BorderStyle = bsNone
        Color = 14680063
        HideSelection = False
        Indent = 19
        ReadOnly = True
        TabOrder = 0
        TabStop = False
        OnChange = ArtWgrTVChange
        OnDblClick = ArtWgrTVDblClick
        OnExit = ArtWgrTVExit
      end
      object Panel1: TPanel
        Left = 2
        Top = 2
        Width = 138
        Height = 20
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Hierarchie'
        Color = 14680063
        TabOrder = 1
        object ArtHirDockBtn: TJvSpeedButton
          Left = 116
          Top = 1
          Width = 22
          Height = 18
          Hint = 'anheften'
          Flat = True
          Glyph.Data = {
            66010000424D66010000000000007600000028000000240000000C0000000100
            040000000000F000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDD0000DDDD0DDDDDDDDDDD0DDDDDDDD0DDDDDDDDDD
            0000DDDD00DDD00DDDDD00DDD00DDD000000DDDD0000DDDD0700070DDDDD0700
            070DDD0077000DDD0000DDDD0B070B0DDDDD0707070DDD07777000DD00000000
            0FBF7F0D00000778780DDD07FB0000DD0000DDDD0BFBBB0DDDDD0787770DDD0F
            B077700D0000DDDD0F000F0DDDDD0800080DDD0BF0BF770D0000DDDD00DDD00D
            DDDD00DDD00DDDD0B0FBF70D0000DDDD0DDDDDDDDDDD0DDDDDDDDDDD00BFB70D
            0000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD0000DD0000DDDDDDDDDDDDDDDDDDDD
            DDDDDDDDDDDDDDDD0000}
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          NumGlyphs = 3
          OnMouseEnter = ArtAllgemeinBtnMouseEnter
          OnMouseLeave = ArtAllgemeinBtnMouseLeave
          OnClick = ArtHirDockBtnClick
        end
      end
    end
    object ArtikelToolbar1: TToolBar
      Left = 0
      Top = 546
      Width = 776
      Height = 26
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 88
      Caption = 'ArtikelToolbar1'
      Ctl3D = True
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = MainForm.ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 3
      Wrapable = False
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 0
        Width = 184
        Height = 22
        DataSource = AS_DS
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
        Flat = True
        Hints.Strings = (
          'Erster Artikel'
          'Vorheriger Artikel'
          'N'#228'chster Artikel'
          'Letzter Artikel'
          'Artikel einf'#252'gen'
          'Artikel l'#246'schen'
          'Artikel bearbeiten'
          #220'bernehmen'
          'Bearbeiten abbrechen'
          'Artikel aktualisieren')
        ParentShowHint = False
        ConfirmDelete = False
        ShowHint = True
        TabOrder = 0
      end
      object Label52: TLabel
        Left = 184
        Top = 0
        Width = 50
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Suchfeld'
        Layout = tlCenter
      end
      object SuchFeldCB: TComboBox
        Left = 234
        Top = 0
        Width = 96
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = SuchFeldCBChange
        Items.Strings = (
          'Text'
          'Suchbegriff'
          'Artikelnummer'
          'Barcode/EAN'
          'Herst.-Artikelnr.'
          'Lief.-Best.-Nr.'
          'Info')
      end
      object Label31: TLabel
        Left = 330
        Top = 0
        Width = 62
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Suchbegriff'
        Layout = tlCenter
      end
      object SuchBeg: TEdit
        Left = 392
        Top = 0
        Width = 93
        Height = 22
        Hint = 
          'Mehrere Suchbegriffe k'#246'nnen Sie durch ein Leerzeichen trennen.'#13#10 +
          'Eine Oder-Verkn'#252'pfte Suche erreicht man mit "Begriff1 or Begriff' +
          '2"'
        AutoSize = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnChange = SuchbegChange
        OnKeyPress = SuchbegKeyPress
      end
      object ToolButton9: TToolButton
        Left = 485
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object AddMengeLab: TLabel
        Left = 493
        Top = 0
        Width = 41
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = '&Menge'
        FocusControl = AddMengeEdi
        Layout = tlCenter
      end
      object AddMengeEdi: TJvSpinEdit
        Left = 534
        Top = 0
        Width = 58
        Height = 22
        ValueType = vtFloat
        TabOrder = 3
      end
      object Label57: TLabel
        Left = 592
        Top = 0
        Width = 4
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Layout = tlCenter
      end
      object UebernahmeBtn1: TToolButton
        Left = 596
        Top = 0
        Hint = 'Artikel '#252'bernehmen mit F12'
        AutoSize = True
        Caption = #220'bernehmen'
        ImageIndex = 22
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = UebernahmeBtn1Click
      end
    end
  end
  object SB1: TStatusBar
    Left = 0
    Top = 572
    Width = 776
    Height = 19
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Panels = <
      item
        Alignment = taCenter
        Text = 'Suchzeit'
        Width = 80
      end
      item
        Alignment = taCenter
        Text = 'Satz 1 von 1'
        Width = 120
      end
      item
        Text = 'Sortierung'
        Width = 140
      end
      item
        Text = 'erstellt'
        Width = 120
      end
      item
        Text = 'geaend'
        Width = 120
      end
      item
        Width = 50
      end>
    UseSystemFont = False
    Visible = False
  end
  object MainMenu1: TJvMainMenu
    Images = MainForm.ImageList1
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 37
    Top = 87
    object MnuDatei: TMenuItem
      Caption = '&Datei'
      GroupIndex = 2
      object MnuViewEK: TMenuItem
        Caption = 'EK-Preise anzeigen'
        Checked = True
        GroupIndex = 200
        ShortCut = 120
        OnClick = MnuViewEKClick
      end
      object N3: TMenuItem
        Caption = '-'
        GroupIndex = 200
      end
      object MnuClose: TMenuItem
        Caption = 'Schlie'#223'en'
        GroupIndex = 200
        ImageIndex = 44
        OnClick = MnuCloseClick
      end
    end
    object MnuEdit: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 3
      object MnuNew: TMenuItem
        Caption = '&Neu'
        GroupIndex = 2
        ImageIndex = 23
        ShortCut = 16462
        OnClick = MnuNewClick
      end
      object MnuCopy: TMenuItem
        Caption = 'Kopieren'
        GroupIndex = 2
        ImageIndex = 14
        ShortCut = 16459
        OnClick = MnuCopyClick
      end
      object MnuDelete: TMenuItem
        Caption = '&L'#246'schen'
        GroupIndex = 2
        ImageIndex = 6
        ShortCut = 16430
        OnClick = MnuDeleteClick
      end
      object N1: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object MnuDiscountGroup: TMenuItem
        Caption = 'Rabattgruppen'
        GroupIndex = 2
        ImageIndex = 30
        ShortCut = 16466
        OnClick = MnuDiscountGroupClick
      end
      object N8: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object MnuSearch: TMenuItem
        Caption = 'Suchen'
        GroupIndex = 2
        ImageIndex = 10
        ShortCut = 114
        OnClick = MnuSearchClick
      end
      object N10: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object MnuVisibleCol: TMenuItem
        Caption = 'Sichtbare Spalten'
        GroupIndex = 2
        ImageIndex = 15
        OnClick = MnuVisibleColClick
      end
      object MnuSaveLayout: TMenuItem
        Caption = 'Layout speichern'
        GroupIndex = 2
        ImageIndex = 16
        OnClick = MnuSaveLayoutClick
      end
      object N2: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object uebernehmen1: TMenuItem
        Caption = #220'bernehmen'
        GroupIndex = 2
        Hint = 'Artikel '#252'bernehmen mit F12'
        ImageIndex = 22
        ShortCut = 123
        Visible = False
        OnClick = UebernahmeBtn1Click
      end
      object bernehmenundSchlieen1: TMenuItem
        Caption = #220'bernehmen und Schlie'#223'en'
        GroupIndex = 2
        ImageIndex = 22
        ShortCut = 32891
        Visible = False
        OnClick = bernehmenundSchlieen1Click
      end
    end
    object MnuSort: TMenuItem
      Caption = '&Sortierung'
      GroupIndex = 4
      object MnuSortMatch: TMenuItem
        Tag = 1
        Caption = 'Suchbegriff'
        Checked = True
        Default = True
        GroupIndex = 3
        RadioItem = True
        OnClick = SortierungClick
      end
      object MnuSortArtNo: TMenuItem
        Tag = 2
        Caption = 'Artikelnummer'
        GroupIndex = 3
        RadioItem = True
        OnClick = SortierungClick
      end
    end
    object MnuPrint: TMenuItem
      Caption = 'Drucken'
      GroupIndex = 5
      object MnuPrintArtikel: TMenuItem
        Caption = 'Artikel'
        ImageIndex = 11
        OnClick = MnuPrintArtikelClick
      end
      object MnuPrintList: TMenuItem
        Caption = 'Artikelliste'
        ImageIndex = 11
        OnClick = MnuPrintListClick
      end
      object MnuPrintPartList: TMenuItem
        Caption = 'Artikel-St'#252'ckliste'
        ImageIndex = 11
        OnClick = MnuPrintPartListClick
      end
      object MnuPrintHistory: TMenuItem
        Caption = 'Artikel-Historie'
        ImageIndex = 11
        Visible = False
        OnClick = MnuPrintHistoryClick
      end
    end
    object MnuView: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 6
      object Allgemein1: TMenuItem
        Tag = 1
        Caption = 'Allgemein'
        Checked = True
        GroupIndex = 4
        RadioItem = True
        ShortCut = 117
        OnClick = ArtAllgemeinBtnClick
      end
      object MengePreise1: TMenuItem
        Tag = 2
        Caption = 'Preise'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32884
        OnClick = ArtAllgemeinBtnClick
      end
      object Erweitert1: TMenuItem
        Tag = 3
        Caption = 'Erweitert'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32886
        OnClick = ArtAllgemeinBtnClick
      end
      object Shop1: TMenuItem
        Tag = 4
        Caption = 'Shop'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32885
        OnClick = ArtAllgemeinBtnClick
      end
      object Dateien1: TMenuItem
        Tag = 5
        Caption = 'Dateien'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32887
        OnClick = ArtAllgemeinBtnClick
      end
      object Historie1: TMenuItem
        Tag = 6
        Caption = 'Historie'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32888
        OnClick = ArtAllgemeinBtnClick
      end
      object Liste1: TMenuItem
        Tag = 7
        Caption = 'Liste'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 118
        OnClick = ArtAllgemeinBtnClick
      end
      object N4: TMenuItem
        Caption = '-'
        GroupIndex = 4
      end
      object Treffer1: TMenuItem
        Caption = 'Treffer'
        GroupIndex = 4
        ImageIndex = 18
        object N101: TMenuItem
          Tag = 10
          Caption = '10 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = alle1Click
        end
        object N501: TMenuItem
          Tag = 50
          Caption = '50 Treffer'
          Checked = True
          Default = True
          GroupIndex = 12
          RadioItem = True
          OnClick = alle1Click
        end
        object N1001: TMenuItem
          Tag = 100
          Caption = '100 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = alle1Click
        end
        object N2001: TMenuItem
          Tag = 200
          Caption = '200 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = alle1Click
        end
        object N5001: TMenuItem
          Tag = 500
          Caption = '500 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = alle1Click
        end
        object alle1: TMenuItem
          Tag = 999999999
          Caption = 'alle Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = alle1Click
        end
      end
      object N6: TMenuItem
        Caption = '-'
        GroupIndex = 200
      end
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        GroupIndex = 200
        ImageIndex = 13
        ShortCut = 116
        OnClick = Aktualisieren1Click
      end
    end
    object MnuExtras: TMenuItem
      Caption = '&Extras'
      GroupIndex = 7
      object ArtikelZusammenfassen1: TMenuItem
        Caption = 'Artikel zusammenfassen'
        ImageIndex = 9
        OnClick = ArtikelZusammenfassen1Click
      end
      object Artikelnummernvergeben1: TMenuItem
        Caption = 'Artikelnummern vergeben'
        ImageIndex = 18
        OnClick = Artikelnummernvergeben1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object MnuImportUpdate: TMenuItem
        Caption = 'Import / Update'
        ImageIndex = 33
        OnClick = MnuImportUpdateClick
      end
      object MnuExportCSV: TMenuItem
        Caption = 'Export '
        GroupIndex = 2
        ImageIndex = 37
        OnClick = MnuExportCSVClick
      end
      object N9: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object MnuDelAllArtikelFromWGR: TMenuItem
        Caption = 'Alle Artikel in der akt. Warengruppe l'#246'schen'
        GroupIndex = 2
        ImageIndex = 1
        Visible = False
        OnClick = MnuDelAllArtikelFromWGRClick
      end
      object N12: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object MnuSearchSerNo: TMenuItem
        Caption = 'Seriennummer suchen'
        GroupIndex = 2
        OnClick = MnuSearchSerNoClick
      end
      object MnuExtSearch: TMenuItem
        Caption = 'Erweiterte Suche'
        GroupIndex = 2
        ImageIndex = 15
        ShortCut = 16471
        OnClick = MnuExtSearchClick
      end
    end
  end
  object AS_DS: TDataSource
    DataSet = ASQuery
    OnDataChange = AS_DSDataChange
    Left = 57
    Top = 135
  end
  object ASQuery: TOFZQuery
    Connection = DM1.DB1
    AfterOpen = ASQueryAfterScroll
    BeforeScroll = ASQueryBeforeScroll
    AfterScroll = ASQueryAfterScroll
    OnCalcFields = ASQueryCalcFields
    BeforeInsert = ASQueryBeforeInsert
    BeforePost = ASQueryBeforePost
    AfterPost = ASQueryAfterScroll
    AfterCancel = ASQueryAfterScroll
    BeforeDelete = ASQueryBeforeDelete
    AfterDelete = ASQueryAfterScroll
    OnPostError = ASQueryPostError
    OnNewRecord = ASQueryNewRecord
    OFModulID = 1020
    OFSubModulID = 0
    UseRecordLock = True
    ShowLockErrors = True
    LockIDField = 'REC_ID'
    AutoReleaseLock = True
    OnLockError = LockError
    Params = <>
    SQL.Strings = (
      'select *, SUBSTRING(LANGNAME,1,200) as LN'
      'from ARTIKEL'
      'LIMIT 0,50')
    Left = 24
    Top = 135
    object ASQueryREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object ASQueryWARENGRUPPE: TIntegerField
      DisplayLabel = 'WG'
      FieldName = 'WARENGRUPPE'
    end
    object ASQueryMATCHCODE: TStringField
      DisplayLabel = 'Suchbegriff'
      DisplayWidth = 20
      FieldName = 'MATCHCODE'
      Size = 200
    end
    object ASQueryARTNUM: TStringField
      DisplayLabel = 'Art.-Nr.'
      FieldName = 'ARTNUM'
    end
    object ASQueryBARCODE: TStringField
      DisplayLabel = 'Barcode'
      FieldName = 'BARCODE'
    end
    object ASQueryKURZNAME: TStringField
      DisplayLabel = 'Kurzname'
      FieldName = 'KURZNAME'
      Size = 80
    end
    object ASQueryLANGNAME: TBlobField
      DisplayLabel = 'Langtext'
      FieldName = 'LANGNAME'
      BlobType = ftMemo
    end
    object ASQueryVK1: TFloatField
      DisplayLabel = 'VK-Preis 1N'
      DisplayWidth = 12
      FieldName = 'VK1'
      DisplayFormat = ',###,##0.00 "DM"'
      EditFormat = '#0.00'
    end
    object ASQueryVK1B: TFloatField
      DisplayLabel = 'VK-Preis 1B'
      FieldName = 'VK1B'
      EditFormat = '#0.00'
    end
    object ASQueryCALC_VK1: TFloatField
      DisplayLabel = 'VK-Preis 1N'
      FieldKind = fkCalculated
      FieldName = 'CALC_VK1'
      DisplayFormat = ',###,##0.00 "DM"'
      Calculated = True
    end
    object ASQueryCALC_VK1B: TFloatField
      DisplayLabel = 'VK-Preis 1B'
      FieldKind = fkCalculated
      FieldName = 'CALC_VK1B'
      Calculated = True
    end
    object ASQueryVK2: TFloatField
      DisplayLabel = 'VK-Preis 2N'
      DisplayWidth = 12
      FieldName = 'VK2'
      DisplayFormat = ',###,##0.00 "DM"'
      EditFormat = '#0.00'
    end
    object ASQueryVK2B: TFloatField
      DisplayLabel = 'VK-Preis 2B'
      FieldName = 'VK2B'
      EditFormat = '#0.00'
    end
    object ASQueryCALC_VK2: TFloatField
      DisplayLabel = 'VK-Preis 2N'
      FieldKind = fkCalculated
      FieldName = 'CALC_VK2'
      DisplayFormat = ',###,##0.00 "DM"'
      Calculated = True
    end
    object ASQueryCALC_VK2B: TFloatField
      DisplayLabel = 'VK-Preis 2B'
      FieldKind = fkCalculated
      FieldName = 'CALC_VK2B'
      Calculated = True
    end
    object ASQueryVK3: TFloatField
      DisplayLabel = 'VK-Preis 3N'
      DisplayWidth = 12
      FieldName = 'VK3'
      DisplayFormat = ',###,##0.00 "DM"'
      EditFormat = '#0.00'
    end
    object ASQueryVK3B: TFloatField
      DisplayLabel = 'VK-Preis 3B'
      FieldName = 'VK3B'
      EditFormat = '#0.00'
    end
    object ASQueryCALC_VK3: TFloatField
      DisplayLabel = 'VK-Preis 3N'
      FieldKind = fkCalculated
      FieldName = 'CALC_VK3'
      DisplayFormat = ',###,##0.00 "DM"'
      Calculated = True
    end
    object ASQueryCALC_VK3B: TFloatField
      DisplayLabel = 'VK-Preis 3B'
      FieldKind = fkCalculated
      FieldName = 'CALC_VK3B'
      Calculated = True
    end
    object ASQueryVK4: TFloatField
      DisplayLabel = 'VK-Preis 4N'
      DisplayWidth = 12
      FieldName = 'VK4'
      DisplayFormat = ',###,##0.00 "DM"'
      EditFormat = '#0.00'
    end
    object ASQueryVK4B: TFloatField
      DisplayLabel = 'VK-Preis 4B'
      FieldName = 'VK4B'
      EditFormat = '#0.00'
    end
    object ASQueryCALC_VK4: TFloatField
      DisplayLabel = 'VK-Preis 4N'
      FieldKind = fkCalculated
      FieldName = 'CALC_VK4'
      DisplayFormat = ',###,##0.00 "DM"'
      Calculated = True
    end
    object ASQueryCALC_VK4B: TFloatField
      DisplayLabel = 'VK-Preis 4B'
      FieldKind = fkCalculated
      FieldName = 'CALC_VK4B'
      Calculated = True
    end
    object ASQueryVK5: TFloatField
      DisplayLabel = 'VK-Preis 5N'
      FieldName = 'VK5'
      DisplayFormat = ',###,##0.00 "DM"'
      EditFormat = '#0.00'
    end
    object ASQueryVK5B: TFloatField
      DisplayLabel = 'VK-Preis 5B'
      FieldName = 'VK5B'
      EditFormat = '#0.00'
    end
    object ASQuerySTEUER_CODE: TIntegerField
      DisplayLabel = 'S'
      FieldName = 'STEUER_CODE'
      MaxValue = 3
    end
    object ASQueryARTIKELTYP: TStringField
      DisplayLabel = 'T'
      FieldName = 'ARTIKELTYP'
      Size = 1
    end
    object ASQueryME_EINHEIT: TStringField
      DisplayLabel = 'ME-Einh.'
      FieldName = 'ME_EINHEIT'
      Size = 10
    end
    object ASQueryERLOES_KTO: TIntegerField
      DisplayLabel = 'E-KTO'
      FieldName = 'ERLOES_KTO'
      DisplayFormat = '0;-;-'
      MaxValue = 999999
      MinValue = -1
    end
    object ASQueryAUFW_KTO: TIntegerField
      DisplayLabel = 'A-KTO'
      FieldName = 'AUFW_KTO'
      DisplayFormat = '0;-;-'
      EditFormat = '0'
      MaxValue = 999999
      MinValue = -1
    end
    object ASQueryMENGE_AKT: TFloatField
      DisplayLabel = 'Menge'
      FieldName = 'MENGE_AKT'
      DisplayFormat = ',#0.00'
      EditFormat = '0'
    end
    object ASQueryERSATZ_ARTNUM: TStringField
      DisplayLabel = 'Ersatz-Art.Nr.'
      FieldName = 'ERSATZ_ARTNUM'
    end
    object ASQueryKAS_NAME: TStringField
      DisplayLabel = 'Kasentext'
      FieldName = 'KAS_NAME'
      Size = 80
    end
    object ASQueryINFO: TBlobField
      DisplayLabel = 'Info'
      FieldName = 'INFO'
    end
    object ASQueryPR_EINHEIT: TFloatField
      DisplayLabel = 'PR-Einh.'
      FieldName = 'PR_EINHEIT'
    end
    object ASQueryLAENGE: TStringField
      DisplayLabel = 'L'#228'nge'
      FieldName = 'LAENGE'
    end
    object ASQueryGROESSE: TStringField
      DisplayLabel = 'Gr'#246#223'e'
      FieldName = 'GROESSE'
    end
    object ASQueryDIMENSION: TStringField
      DisplayLabel = 'Dimension'
      FieldName = 'DIMENSION'
    end
    object ASQueryGEWICHT: TFloatField
      DisplayLabel = 'Gewicht'
      FieldName = 'GEWICHT'
      DisplayFormat = ',#0.000'
      EditFormat = '0.000'
    end
    object ASQueryINVENTUR_WERT: TFloatField
      DisplayLabel = 'I-Wert'
      FieldName = 'INVENTUR_WERT'
      DisplayFormat = ',#0.0 %'
      EditFormat = '0.0'
      MaxValue = 100.000000000000000000
    end
    object ASQueryPROVIS_PROZ: TFloatField
      DisplayLabel = 'Provision %'
      FieldName = 'PROVIS_PROZ'
      DisplayFormat = ',#0.0" %";,#0.0" %";-'
      EditFormat = '0.0'
    end
    object ASQueryEK_PREIS: TFloatField
      DisplayLabel = 'EK-Preis'
      FieldName = 'EK_PREIS'
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object ASQueryCALC_EK: TFloatField
      DisplayLabel = 'EK-Preis'
      FieldKind = fkCalculated
      FieldName = 'CALC_EK'
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
      Calculated = True
    end
    object ASQueryMENGE_START: TFloatField
      FieldName = 'MENGE_START'
    end
    object ASQueryMENGE_MIN: TFloatField
      FieldName = 'MENGE_MIN'
      DisplayFormat = ',#0.00'
      EditFormat = '0'
    end
    object ASQueryMENGE_BESTELLT: TFloatField
      DisplayLabel = 'Menge Best.'
      FieldName = 'MENGE_BESTELLT'
      DisplayFormat = ',#0.00'
    end
    object ASQueryMENGE_BVOR: TFloatField
      DisplayLabel = 'Menge Bestvor.'
      FieldName = 'MENGE_BVOR'
      DisplayFormat = ',#0.00'
      EditFormat = '0'
    end
    object ASQueryHERKUNFTSLAND: TStringField
      DisplayLabel = 'Herk.-Land'
      FieldName = 'HERKUNFTSLAND'
      Size = 2
    end
    object ASQueryHERSTELLER_NAME: TStringField
      DisplayLabel = 'Hersteller'
      FieldKind = fkLookup
      FieldName = 'HERSTELLER_NAME'
      LookupDataSet = DM1.HerstellerTab
      LookupKeyFields = 'HERSTELLER_ID'
      LookupResultField = 'HERSTELLER_NAME'
      KeyFields = 'HERSTELLER_ID'
      Size = 100
      Lookup = True
    end
    object ASQueryHERSTELLER_ID: TIntegerField
      FieldName = 'HERSTELLER_ID'
    end
    object ASQueryLAGERORT: TStringField
      DisplayLabel = 'Lagerort'
      FieldName = 'LAGERORT'
    end
    object ASQueryERSTELLT: TDateField
      DisplayLabel = 'erstellt'
      FieldName = 'ERSTELLT'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object ASQueryERST_NAME: TStringField
      DisplayLabel = 'erstellt von'
      FieldName = 'ERST_NAME'
    end
    object ASQueryGEAEND: TDateField
      DisplayLabel = 'le. '#196'nderung'
      FieldName = 'GEAEND'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object ASQueryGEAEND_NAME: TStringField
      DisplayLabel = 'ge'#228'ndert von'
      FieldName = 'GEAEND_NAME'
    end
    object ASQueryRABGRP_ID: TStringField
      FieldName = 'RABGRP_ID'
      Size = 10
    end
    object ASQueryAUTODEL_FLAG: TBooleanField
      FieldName = 'AUTODEL_FLAG'
      Required = True
    end
    object ASQuerySN_FLAG: TBooleanField
      DisplayLabel = 'SN-Pflicht'
      FieldName = 'SN_FLAG'
      Required = True
    end
    object ASQueryNO_RABATT_FLAG: TBooleanField
      FieldName = 'NO_RABATT_FLAG'
      Required = True
    end
    object ASQueryNO_PROVISION_FLAG: TBooleanField
      FieldName = 'NO_PROVISION_FLAG'
      Required = True
    end
    object ASQueryNO_BEZEDIT_FLAG: TBooleanField
      FieldName = 'NO_BEZEDIT_FLAG'
      Required = True
    end
    object ASQueryNO_EK_FLAG: TBooleanField
      FieldName = 'NO_EK_FLAG'
      Required = True
    end
    object ASQueryNO_VK_FLAG: TBooleanField
      FieldName = 'NO_VK_FLAG'
      Required = True
    end
    object ASQueryALTTEIL_FLAG: TBooleanField
      DisplayLabel = 'Alt-Teil'
      FieldName = 'ALTTEIL_FLAG'
      Required = True
    end
    object ASQuerySHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
    end
    object ASQuerySHOP_LANGTEXT: TMemoField
      DisplayLabel = 'Shop-Langtext'
      FieldName = 'SHOP_LANGTEXT'
      BlobType = ftMemo
    end
    object ASQuerySHOP_IMAGE: TStringField
      DisplayLabel = 'Shop Bild-URL'
      FieldName = 'SHOP_IMAGE'
      Size = 100
    end
    object ASQuerySHOP_IMAGE_MED: TStringField
      FieldName = 'SHOP_IMAGE_MED'
      Size = 100
    end
    object ASQuerySHOP_IMAGE_LARGE: TStringField
      FieldName = 'SHOP_IMAGE_LARGE'
      Size = 100
    end
    object ASQuerySHOP_DATENBLATT: TStringField
      FieldName = 'SHOP_DATENBLATT'
      Size = 100
    end
    object ASQuerySHOP_PREIS_LISTE: TFloatField
      DisplayLabel = 'Shop-Preis'
      FieldName = 'SHOP_PREIS_LISTE'
      DisplayFormat = ',#0.00000000'
    end
    object ASQuerySHOP_CHANGE_DATE: TDateTimeField
      FieldName = 'SHOP_CHANGE_DATE'
    end
    object ASQuerySHOP_CHANGE_FLAG: TIntegerField
      FieldName = 'SHOP_CHANGE_FLAG'
      Required = True
    end
    object ASQuerySHOP_ARTIKEL_ID: TIntegerField
      FieldName = 'SHOP_ARTIKEL_ID'
    end
    object ASQuerySHOP_VISIBLE: TIntegerField
      FieldName = 'SHOP_VISIBLE'
    end
    object ASQuerySHOP_DEL_FLAG: TBooleanField
      FieldName = 'SHOP_DEL_FLAG'
      Required = True
    end
    object ASQueryDEFAULT_LIEF_ID: TIntegerField
      FieldName = 'DEFAULT_LIEF_ID'
    end
    object ASQueryVPE: TIntegerField
      FieldName = 'VPE'
      DisplayFormat = '#0;#0;-'
      EditFormat = '0'
      MaxValue = 999999
    end
    object ASQueryHERST_ARTNUM: TStringField
      DisplayLabel = 'Herst.-Artikelnr.'
      FieldName = 'HERST_ARTNUM'
      Size = 100
    end
    object ASQueryUSERFELD_01: TStringField
      FieldName = 'USERFELD_01'
      Size = 255
    end
    object ASQueryUSERFELD_02: TStringField
      FieldName = 'USERFELD_02'
      Size = 255
    end
    object ASQueryUSERFELD_03: TStringField
      FieldName = 'USERFELD_03'
      Size = 255
    end
    object ASQueryUSERFELD_04: TStringField
      FieldName = 'USERFELD_04'
      Size = 255
    end
    object ASQueryUSERFELD_05: TStringField
      FieldName = 'USERFELD_05'
      Size = 255
    end
    object ASQueryUSERFELD_06: TStringField
      FieldName = 'USERFELD_06'
      Size = 255
    end
    object ASQueryUSERFELD_07: TStringField
      FieldName = 'USERFELD_07'
      Size = 255
    end
    object ASQueryUSERFELD_08: TStringField
      FieldName = 'USERFELD_08'
      Size = 255
    end
    object ASQueryUSERFELD_09: TStringField
      FieldName = 'USERFELD_09'
      Size = 255
    end
    object ASQueryUSERFELD_10: TStringField
      FieldName = 'USERFELD_10'
      Size = 255
    end
    object ASQueryLN: TStringField
      FieldName = 'LN'
      ReadOnly = True
      Size = 200
    end
    object ASQuerySHOP_KURZTEXT: TMemoField
      FieldName = 'SHOP_KURZTEXT'
      BlobType = ftMemo
    end
    object ASQuerySHOP_META_TITEL: TStringField
      FieldName = 'SHOP_META_TITEL'
      Size = 255
    end
    object ASQuerySHOP_META_BESCHR: TMemoField
      FieldName = 'SHOP_META_BESCHR'
      BlobType = ftMemo
    end
    object ASQuerySHOP_META_KEY: TStringField
      FieldName = 'SHOP_META_KEY'
      Size = 255
    end
  end
  object JPosTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = JPosTabCalcFields
    SQL.Strings = (
      'select '
      'JOURNAL_ID, '
      'JOURNALPOS.QUELLE, '
      'ARTIKEL_ID, '
      'JOURNALPOS.VRENUM, '
      'JOURNALPOS.BEZEICHNUNG, '
      'MENGE,'
      'EPREIS, '
      'RABATT, '
      'JOURNAL.REC_ID, JOURNAL.RDATUM, '
      'JOURNAL.KUN_ANREDE,'
      'JOURNAL.KUN_NAME1, '
      'JOURNAL.KUN_NAME2,'
      'JOURNAL.KUN_NAME3,'
      'WAEHRUNG, '
      'MWST_0, MWST_1, MWST_2, MWST_3, STEUER_CODE,'
      'LDATUM, JOURNAL.VLSNUM, JOURNAL.BRUTTO_FLAG'
      'from JOURNALPOS, JOURNAL'
      'where ARTIKEL_ID>0 and JOURNAL.QUELLE in (3,5)'
      'and JOURNALPOS.JOURNAL_ID = JOURNAL.REC_ID'
      'and JOURNAL.STADIUM BETWEEN 20 and 99')
    Params = <>
    Left = 24
    Top = 232
    object JPosTabCalcQuelle: TStringField
      DisplayLabel = 'Quelle'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'CalcQuelle'
      Size = 12
      Calculated = True
    end
    object JPosTabQUELLE: TIntegerField
      FieldName = 'QUELLE'
      Visible = False
    end
    object JPosTabRDATUM: TDateField
      Alignment = taCenter
      DisplayLabel = 'Datum'
      DisplayWidth = 10
      FieldName = 'RDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object JPosTabLDATUM: TDateField
      Alignment = taCenter
      DisplayLabel = 'Datum'
      FieldName = 'LDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object JPosTabVRENUM: TStringField
      DisplayLabel = 'Beleg'
      DisplayWidth = 12
      FieldName = 'VRENUM'
    end
    object JPosTabVLSNUM: TStringField
      DisplayLabel = 'Beleg'
      FieldName = 'VLSNUM'
    end
    object JPosTabMENGE: TFloatField
      DisplayLabel = 'Menge'
      DisplayWidth = 12
      FieldName = 'MENGE'
      DisplayFormat = ',###,##0.00'
    end
    object JPosTabEPREIS: TFloatField
      DisplayLabel = 'E-Preis'
      DisplayWidth = 12
      FieldName = 'EPREIS'
      Visible = False
    end
    object JPosTabEPREIS_STR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'E-Preis'
      FieldKind = fkCalculated
      FieldName = 'EPREIS_STR'
      Calculated = True
    end
    object JPosTabRABATT: TFloatField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 8
      FieldName = 'RABATT'
      DisplayFormat = '0.0 "%";-0.0 "%"; '
    end
    object JPosTabGPREIS_STR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Gesamt'
      FieldKind = fkCalculated
      FieldName = 'GPREIS_STR'
      Calculated = True
    end
    object JPosTabWAEHRUNG: TStringField
      Alignment = taCenter
      DisplayLabel = 'W'
      DisplayWidth = 2
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object JPosTabMWST_0: TFloatField
      FieldName = 'MWST_0'
      Visible = False
    end
    object JPosTabMWST_1: TFloatField
      FieldName = 'MWST_1'
      Visible = False
    end
    object JPosTabMWST_2: TFloatField
      FieldName = 'MWST_2'
      Visible = False
    end
    object JPosTabMWST_3: TFloatField
      FieldName = 'MWST_3'
      Visible = False
    end
    object JPosTabSTEUER_CODE: TIntegerField
      DisplayLabel = 'ST-Code'
      FieldName = 'STEUER_CODE'
    end
    object JPosTabSTEUER_PROZ: TFloatField
      DisplayLabel = 'MwSt'
      FieldKind = fkCalculated
      FieldName = 'STEUER_PROZ'
      DisplayFormat = '0"%";0"%"; '
      Calculated = True
    end
    object JPosTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object JPosTabJOURNAL_ID: TIntegerField
      FieldName = 'JOURNAL_ID'
      Visible = False
    end
    object JPosTabKUN_ANREDE: TStringField
      FieldName = 'KUN_ANREDE'
      Size = 40
    end
    object JPosTabKUN_NAME1: TStringField
      DisplayLabel = 'Kunde / Lieferant'
      DisplayWidth = 30
      FieldName = 'KUN_NAME1'
      Size = 30
    end
    object JPosTabKUN_NAME2: TStringField
      FieldName = 'KUN_NAME2'
      Size = 40
    end
    object JPosTabKUN_NAME3: TStringField
      FieldName = 'KUN_NAME3'
      Size = 40
    end
    object JPosTabCALC_KUNDE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_KUNDE'
      Size = 255
      Calculated = True
    end
  end
  object JPosDS: TDataSource
    DataSet = JPosTab
    Left = 57
    Top = 233
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = SearchTimerTimer
    Left = 5
    Top = 58
  end
  object SerNoTab: TZQuery
    Connection = DM1.DB1
    BeforePost = SerNoTabBeforePost
    SQL.Strings = (
      'select * from ARTIKEL_SERNUM'
      'where ARTIKEL_ID =:ID')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 24
    Top = 263
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object SerNoTabARTIKEL_ID: TIntegerField
      FieldName = 'ARTIKEL_ID'
      Required = True
      Visible = False
    end
    object SerNoTabSERNUMMER: TStringField
      DisplayLabel = 'Seriennummer'
      DisplayWidth = 84
      FieldName = 'SERNUMMER'
      Required = True
      Size = 255
    end
    object SerNoTabSNUM_ID: TIntegerField
      FieldName = 'SNUM_ID'
      Visible = False
    end
    object SerNoTabSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 7
    end
  end
  object SerNoDS: TDataSource
    DataSet = SerNoTab
    Left = 57
    Top = 263
  end
  object STListTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = STListTabAfterOpen
    UpdateObject = ArtKatUpdateSql
    BeforePost = STListTabBeforePost
    AfterPost = STListTabAfterOpen
    AfterDelete = STListTabAfterOpen
    SQL.Strings = (
      
        'select ARS.*,  A.ARTNUM, A.MATCHCODE, A.BARCODE, A.KURZNAME, A.E' +
        'K_PREIS, A.MENGE_AKT'
      'from ARTIKEL_STUECKLIST ARS, ARTIKEL A'
      'where ARS.REC_ID=:ID and A.REC_ID=ARS.ART_ID'
      'and ARTIKEL_ART=:ART')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ART'
        ParamType = ptInput
      end>
    Left = 24
    Top = 201
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ART'
        ParamType = ptInput
      end>
    object STListTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
      Visible = False
    end
    object STListTabART_ID: TIntegerField
      FieldName = 'ART_ID'
      Required = True
      Visible = False
    end
    object STListTabMENGE: TFloatField
      DisplayLabel = 'Menge'
      FieldName = 'MENGE'
      DisplayFormat = '0.00'
    end
    object STListTabERSTELLT: TDateField
      FieldName = 'ERSTELLT'
      Visible = False
    end
    object STListTabERST_NAME: TStringField
      FieldName = 'ERST_NAME'
      Visible = False
    end
    object STListTabGEAEND: TDateField
      FieldName = 'GEAEND'
      Visible = False
    end
    object STListTabGEAEND_NAME: TStringField
      FieldName = 'GEAEND_NAME'
      Visible = False
    end
    object STListTabARTNUM: TStringField
      DisplayLabel = 'Artikelnummer'
      FieldName = 'ARTNUM'
      ReadOnly = True
    end
    object STListTabMATCHCODE: TStringField
      DisplayLabel = 'Matchcode'
      DisplayWidth = 30
      FieldName = 'MATCHCODE'
      Size = 255
    end
    object STListTabBARCODE: TStringField
      DisplayLabel = 'EAN'
      FieldName = 'BARCODE'
    end
    object STListTabKURZNAME: TStringField
      DisplayLabel = 'Artikelbezeichnung'
      FieldName = 'KURZNAME'
      Size = 80
    end
    object STListTabEK_PREIS: TFloatField
      DisplayLabel = 'EK-Preis'
      FieldName = 'EK_PREIS'
      ReadOnly = True
      DisplayFormat = ',#0.00'
    end
    object STListTabMENGE_AKT: TFloatField
      DisplayLabel = 'Lagermenge'
      FieldName = 'MENGE_AKT'
      DisplayFormat = ',#0.00'
    end
    object STListTabARTIKEL_ART: TStringField
      FieldName = 'ARTIKEL_ART'
      Size = 3
    end
  end
  object STListDS: TDataSource
    DataSet = STListTab
    Left = 57
    Top = 201
  end
  object JumpMenu: TPopupMenu
    Images = MainForm.ImageList1
    OnPopup = JumpMenuPopup
    Left = 38
    Top = 58
    object JumpMen1: TMenuItem
      Caption = 'Jump-Men'#252
      Enabled = False
      ImageIndex = 18
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object Rechnungdrucken1: TMenuItem
      Caption = 'Beleg drucken'
      ImageIndex = 11
      OnClick = Rechnungdrucken1Click
    end
    object Belegbearbeiten1: TMenuItem
      Caption = 'Beleg bearbeiten'
      ImageIndex = 40
      OnClick = Belegbearbeiten1Click
    end
    object zumJournal1: TMenuItem
      Caption = 'zum Journal'
      ImageIndex = 42
      OnClick = zumJournal1Click
    end
  end
  object ArtKatDS: TDataSource
    DataSet = ArtKat
    Left = 57
    Top = 330
  end
  object ArtKat: TZQuery
    Connection = DM1.DB1
    UpdateObject = ArtKatUpdateSql
    BeforeEdit = ArtKatBeforeEdit
    BeforePost = ArtKatBeforePost
    AfterPost = ArtKatAfterPost
    AfterCancel = ArtKatAfterPost
    AfterDelete = ArtKatAfterPost
    OnNewRecord = ArtKatNewRecord
    SQL.Strings = (
      'select AK.ID, AK.NAME from ARTIKEL_KAT AK, ARTIKEL_TO_KAT A2K'
      
        'where A2K.KAT_ID=AK.ID and AK.SHOP_ID=:SHOP_ID and A2K.SHOP_ID=:' +
        'SHOP_ID '
      'and A2K.ARTIKEL_ID=:ARTIKEL_ID and A2K.DEL_FLAG='#39'N'#39)
    Params = <
      item
        DataType = ftInteger
        Name = 'SHOP_ID'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'ARTIKEL_ID'
        ParamType = ptInput
      end>
    Left = 24
    Top = 330
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SHOP_ID'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'ARTIKEL_ID'
        ParamType = ptInput
      end>
  end
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 71
    Top = 58
  end
  object SynHTMLSyn1: TSynHTMLSyn
    DefaultFilter = 'HTML Document (*.htm,*.html)|*.htm;*.html'
    AndAttri.Foreground = clBlue
    Left = 24
    Top = 365
  end
  object ArtikelUpdateSql: TZUpdateSQL
    DeleteSQL.Strings = (
      'delete from ARTIKEL where REC_ID=:REC_ID')
    ModifySQL.Strings = (
      '')
    UseSequenceFieldForRefreshSQL = False
    BeforeInsertSQL = ArtikelUpdateSqlBeforeInsertSQL
    BeforeModifySQL = ArtikelUpdateSqlBeforeModifySQL
    Left = 90
    Top = 135
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'LANGNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REC_ID'
        ParamType = ptUnknown
      end>
  end
  object ArtPreisTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = ArtPreisTabAfterScroll
    AfterScroll = ArtPreisTabAfterScroll
    OnCalcFields = ArtPreisTabCalcFields
    BeforePost = ArtPreisTabBeforePost
    AfterPost = ArtPreisTabAfterScroll
    AfterCancel = ArtPreisTabAfterScroll
    AfterDelete = ArtPreisTabAfterScroll
    SQL.Strings = (
      'select * from ARTIKEL_PREIS'
      'where ARTIKEL_ID=:ID and PREIS_TYP=5')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 294
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object ArtPreisTabARTIKEL_ID: TIntegerField
      FieldName = 'ARTIKEL_ID'
      Required = True
      Visible = False
    end
    object ArtPreisTabADRESS_ID: TIntegerField
      FieldName = 'ADRESS_ID'
      Required = True
      Visible = False
    end
    object ArtPreisTabPREIS_TYP: TIntegerField
      FieldName = 'PREIS_TYP'
      Required = True
      Visible = False
    end
    object ArtPreisTabBESTNUM: TStringField
      DisplayLabel = 'Bestellnummer'
      FieldName = 'BESTNUM'
      Size = 50
    end
    object ArtPreisTabPREIS: TFloatField
      DisplayLabel = 'EK-Preis'
      FieldName = 'PREIS'
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object ArtPreisTabLieferantStr: TStringField
      DisplayLabel = 'Lieferant'
      FieldKind = fkCalculated
      FieldName = 'LieferantStr'
      Size = 255
      Calculated = True
    end
    object ArtPreisTabMENGE2: TLargeintField
      FieldName = 'MENGE2'
      Required = True
      DisplayFormat = ',#0'
    end
    object ArtPreisTabPREIS2: TFloatField
      FieldName = 'PREIS2'
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object ArtPreisTabPREIS2_AUTO: TBooleanField
      FieldName = 'PREIS2_AUTO'
    end
    object ArtPreisTabFAKTOR2: TFloatField
      FieldName = 'FAKTOR2'
    end
    object ArtPreisTabMENGE3: TLargeintField
      FieldName = 'MENGE3'
      Required = True
      DisplayFormat = ',#0'
    end
    object ArtPreisTabPREIS3: TFloatField
      FieldName = 'PREIS3'
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object ArtPreisTabPREIS3_AUTO: TBooleanField
      FieldName = 'PREIS3_AUTO'
    end
    object ArtPreisTabFAKTOR3: TFloatField
      FieldName = 'FAKTOR3'
    end
    object ArtPreisTabMENGE4: TLargeintField
      FieldName = 'MENGE4'
      Required = True
      DisplayFormat = ',#0'
    end
    object ArtPreisTabPREIS4: TFloatField
      FieldName = 'PREIS4'
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object ArtPreisTabPREIS4_AUTO: TBooleanField
      FieldName = 'PREIS4_AUTO'
    end
    object ArtPreisTabFAKTOR4: TFloatField
      FieldName = 'FAKTOR4'
    end
    object ArtPreisTabMENGE5: TLargeintField
      FieldName = 'MENGE5'
      Required = True
      DisplayFormat = ',#0'
    end
    object ArtPreisTabPREIS5: TFloatField
      FieldName = 'PREIS5'
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object ArtPreisTabPREIS5_AUTO: TBooleanField
      FieldName = 'PREIS5_AUTO'
    end
    object ArtPreisTabFAKTOR5: TFloatField
      FieldName = 'FAKTOR5'
    end
    object ArtPreisTabVPE: TLargeintField
      FieldName = 'VPE'
    end
    object ArtPreisTabGUELTIG_VON: TDateField
      FieldName = 'GUELTIG_VON'
    end
    object ArtPreisTabGUELTIG_BIS: TDateField
      FieldName = 'GUELTIG_BIS'
    end
    object ArtPreisTabINFO: TMemoField
      FieldName = 'INFO'
      Visible = False
      BlobType = ftMemo
    end
    object ArtPreisTabGEAEND: TDateTimeField
      DisplayLabel = 'le. '#196'nderung'
      FieldName = 'GEAEND'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object ArtPreisTabGEAEND_NAME: TStringField
      DisplayLabel = 'ge'#228'ndert von'
      FieldName = 'GEAEND_NAME'
    end
  end
  object ArtPreisDS: TDataSource
    DataSet = ArtPreisTab
    OnDataChange = ArtPreisDSDataChange
    Left = 57
    Top = 297
  end
  object MerkmalTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      
        '/*select * from ARTIKEL_TO_MERK where ARTIKEL_ID=:ID order by ME' +
        'RKMAL_ID*/'
      
        'select AM.MERKMAL_ID, AM.NAME, IF(ATM.MERKMAL_ID=AM.MERKMAL_ID,1' +
        ',0) as FLAG '
      'from ARTIKEL_MERK AM'
      
        'left outer join ARTIKEL_TO_MERK ATM on ATM.ARTIKEL_ID=:ID and AT' +
        'M.MERKMAL_ID=AM.MERKMAL_ID'
      'order by FLAG DESC, AM.NAME ASC')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 24
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object MerkmalTabMERKMAL_ID: TIntegerField
      FieldName = 'MERKMAL_ID'
      Required = True
    end
    object MerkmalTabFLAG: TLargeintField
      FieldName = 'FLAG'
    end
    object MerkmalTabNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
  object StListUpdSQL: TZUpdateSQL
    DeleteSQL.Strings = (
      'delete from ARTIKEL_STUECKLIST '
      'where REC_ID=:REC_ID and ART_ID=:ART_ID')
    InsertSQL.Strings = (
      'INSERT INTO ARTIKEL_STUECKLIST '
      'SET REC_ID=:REC_ID, ART_ID=:ART_ID, MENGE=:MENGE, '
      'ERSTELLT=now(), ERST_NAME=:ERST_NAME,'
      'ARTIKEL_ART=:ARTIKEL_ART')
    ModifySQL.Strings = (
      'UPDATE ARTIKEL_STUECKLIST '
      'SET ART_ID=:ART_ID, MENGE=:MENGE, '
      'GEAEND=now(), GEAEND_NAME=:GEAEND_NAME,'
      'ARTIKEL_ART=:ARTIKEL_ART'
      'where REC_ID=:REC_ID and ART_ID=:ART_ID')
    UseSequenceFieldForRefreshSQL = False
    Left = 90
    Top = 201
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ART_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MENGE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GEAEND_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ARTIKEL_ART'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ERST_NAME'
        ParamType = ptUnknown
      end>
  end
  object FormStorage1: TJvFormStorage
    AppStorage = MainForm.JvAppIniFileStorage1
    AppStoragePath = '%FORM_NAME%\'
    MinMaxInfo.MinTrackHeight = 680
    MinMaxInfo.MinTrackWidth = 705
    Version = 1000
    StoredValues = <>
    Left = 106
    Top = 60
  end
  object ArtKatUpdateSql: TZUpdateSQL
    DeleteSQL.Strings = (
      'UPDATE ARTIKEL_TO_KAT SET CHANGE_FLAG="Y", DEL_FLAG="Y"'
      'where SHOP_ID=:SHOP_ID and ARTIKEL_ID=:ARTIKEL_ID and KAT_ID=:ID')
    InsertSQL.Strings = (
      'INSERT INTO ARTIKEL_TO_KAT '
      
        'SET SHOP_ID=:SHOP_ID, ARTIKEL_ID=:ARTIKEL_ID, KAT_ID=:ID, CHANGE' +
        '_FLAG='#39'Y'#39)
    ModifySQL.Strings = (
      '')
    UseSequenceFieldForRefreshSQL = False
    Left = 90
    Top = 329
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SHOP_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ARTIKEL_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
end
