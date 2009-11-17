object AdressForm: TAdressForm
  Left = 424
  Top = 111
  Width = 688
  Height = 641
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Adressen'
  Color = clBtnFace
  UseDockManager = True
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
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AddrPanel: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 576
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnResize = AddrPanelResize
    object JvxSplitter2: TSplitter
      Left = 143
      Top = 26
      Height = 524
      AutoSnap = False
      Beveled = True
      MinSize = 80
    end
    object ADDR_PC: TJvPageControl
      Left = 146
      Top = 26
      Width = 534
      Height = 524
      ActivePage = Zuweis_TS
      Align = alClient
      RaggedRight = True
      Style = tsFlatButtons
      TabOrder = 3
      OnChange = ADDR_PCChange
      ClientBorderWidth = 0
      HideAllTabs = True
      object Allg_TS: TTabSheet
        Tag = 1
        Caption = 'Allgemein'
        object KunAlgRightPan: TPanel
          Left = 292
          Top = 0
          Width = 242
          Height = 501
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object KommunikationGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 242
            Height = 204
            Align = alTop
            Caption = 'Kommunikation'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 0
            object TelefonLab: TLabel
              Left = 5
              Top = 25
              Width = 52
              Height = 13
              AutoSize = False
              Caption = 'Telefon:'
              FocusControl = tele1
            end
            object Telefon2Lab: TLabel
              Left = 5
              Top = 46
              Width = 52
              Height = 13
              AutoSize = False
              Caption = 'Telefon 2:'
              FocusControl = tele2
            end
            object TelefaxLab: TLabel
              Left = 5
              Top = 67
              Width = 52
              Height = 13
              AutoSize = False
              Caption = 'Telefax:'
              FocusControl = fax
            end
            object MobilfunkLab: TLabel
              Left = 5
              Top = 88
              Width = 52
              Height = 13
              AutoSize = False
              Caption = 'Mobilfunk:'
            end
            object EmailLab: TLabel
              Left = 5
              Top = 114
              Width = 52
              Height = 13
              AutoSize = False
              Caption = 'eMail:'
            end
            object InternetLab: TLabel
              Left = 5
              Top = 157
              Width = 52
              Height = 13
              AutoSize = False
              Caption = 'Internet:'
            end
            object DiversesLab: TLabel
              Left = 5
              Top = 181
              Width = 52
              Height = 13
              AutoSize = False
              Caption = 'Diverses:'
            end
            object EMail2Lab: TLabel
              Left = 5
              Top = 136
              Width = 52
              Height = 13
              AutoSize = False
              Caption = 'eMail 2:'
            end
            object tele1: TJvDBComboEdit
              Tag = 1
              Left = 55
              Top = 21
              Width = 179
              Height = 19
              AutoSelect = False
              ButtonHint = 'anrufen ('#252'ber Tapi)'
              DataField = 'TELE1'
              DataSource = KS_DS
              ImageIndex = 0
              Images = ImageList1
              ButtonWidth = 20
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnButtonClick = tele1ButtonClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object tele2: TJvDBComboEdit
              Tag = 1
              Left = 55
              Top = 43
              Width = 179
              Height = 19
              AutoSelect = False
              ButtonHint = 'anrufen ('#252'ber Tapi)'
              DataField = 'TELE2'
              DataSource = KS_DS
              ImageIndex = 0
              Images = ImageList1
              ButtonWidth = 20
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnButtonClick = tele1ButtonClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object fax: TDBEdit
              Tag = 1
              Left = 55
              Top = 65
              Width = 179
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'FAX'
              DataSource = KS_DS
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object email: TJvDBComboEdit
              Tag = 1
              Left = 55
              Top = 110
              Width = 179
              Height = 19
              AutoSelect = False
              ButtonHint = 'neue EMail mit dieser Adresse erstellen'
              DataField = 'EMAIL'
              DataSource = KS_DS
              ImageIndex = 1
              Images = ImageList1
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnButtonClick = Email1BtnClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object internet: TJvDBComboEdit
              Tag = 1
              Left = 55
              Top = 154
              Width = 179
              Height = 19
              AutoSelect = False
              ButtonHint = 'Internetseite aufrufen'
              DataField = 'INTERNET'
              DataSource = KS_DS
              ImageIndex = 2
              Images = ImageList1
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              OnButtonClick = InternetBtnClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object divers1: TDBEdit
              Tag = 1
              Left = 55
              Top = 178
              Width = 179
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'DIVERSES'
              DataSource = KS_DS
              TabOrder = 7
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object funk: TJvDBComboEdit
              Tag = 1
              Left = 55
              Top = 87
              Width = 179
              Height = 19
              AutoSelect = False
              ButtonHint = 'anrufen ('#252'ber Tapi)'
              DataField = 'FUNK'
              DataSource = KS_DS
              ImageIndex = 0
              Images = ImageList1
              ButtonWidth = 20
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnButtonClick = tele1ButtonClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object email2: TJvDBComboEdit
              Tag = 1
              Left = 55
              Top = 132
              Width = 179
              Height = 19
              AutoSelect = False
              ButtonHint = 'neue EMail mit dieser Adresse erstellen'
              DataField = 'EMAIL2'
              DataSource = KS_DS
              ImageIndex = 1
              Images = ImageList1
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnButtonClick = Email2BtnClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object BriefanredeGB: TOFGroupBox
            Left = 0
            Top = 204
            Width = 242
            Height = 45
            Align = alTop
            Caption = 'Briefanrede'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 1
            object BAnrede: TVolgaDBEdit
              Tag = 1
              Left = 5
              Top = 20
              Width = 229
              Height = 19
              ButtonWidth = 17
              ComboProps.ComboItems.Strings = (
                'Sehr geehrte Damen und Herren,'
                'Sehr geehrte Frau,'
                'Sehr geehrter Herr,')
              Ctl3D = False
              DataField = 'BRIEFANREDE'
              DataSource = KS_DS
              DialogStyle = vdsCombo
              ParentCtl3D = False
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object ZahlBedGB: TOFGroupBox
            Left = 0
            Top = 377
            Width = 242
            Height = 124
            Align = alClient
            Caption = 'Zahlungsbedingungen'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 3
            object Label10: TLabel
              Left = 115
              Top = 58
              Width = 35
              Height = 13
              AutoSize = False
              Caption = 'Netto :'
            end
            object Label41: TLabel
              Left = 5
              Top = 39
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Zahlungsziel:'
            end
            object Label54: TLabel
              Left = 101
              Top = 24
              Width = 49
              Height = 13
              AutoSize = False
              Caption = 'Preisliste:'
            end
            object Label66: TLabel
              Left = 76
              Top = 57
              Width = 35
              Height = 13
              AutoSize = False
              Caption = 'Tage'
            end
            object Label72: TLabel
              Left = 206
              Top = 59
              Width = 29
              Height = 13
              AutoSize = False
              Caption = 'Tage'
            end
            object Label58: TLabel
              Left = 5
              Top = 84
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Kunde-Versand:'
            end
            object Label59: TLabel
              Left = 5
              Top = 104
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Kunde-Zahlart:'
            end
            object ZBNettoTage: TDBEdit
              Left = 151
              Top = 55
              Width = 50
              Height = 19
              Hint = 'Nettoziel Tage'
              DataField = 'BRT_TAGE'
              DataSource = KS_DS
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object ZBSktoTage: TDBEdit
              Left = 46
              Top = 55
              Width = 27
              Height = 19
              Hint = 'Skonto Tage'
              AutoSize = False
              DataField = 'NET_TAGE'
              DataSource = KS_DS
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object ZBSktoProz: TDBEdit
              Left = 6
              Top = 55
              Width = 35
              Height = 19
              Hint = 'Skonto in %'
              DataField = 'NET_SKONTO'
              DataSource = KS_DS
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object PR_EbeneCB: TVolgaDBEdit
              Tag = 1
              Left = 151
              Top = 20
              Width = 83
              Height = 19
              AutoDropDown = True
              ButtonWidth = 17
              DataField = 'PR_EBENE'
              DataSource = KS_DS
              Style = vcsDropDownList
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KunVersand: TDBEdit
              Left = 86
              Top = 80
              Width = 28
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'KUN_LIEFART'
              DataSource = KS_DS
              TabOrder = 4
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KunVersandArtCB: TDBLookupComboBox
              Tag = 1
              Left = 113
              Top = 80
              Width = 121
              Height = 19
              DataField = 'KUN_LIEFART'
              DataSource = KS_DS
              KeyField = 'LIEF_ID'
              ListField = 'LANGBEZ'
              ListSource = DM1.LiefArtDS
              TabOrder = 5
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KunZahlartCB: TDBLookupComboBox
              Tag = 1
              Left = 113
              Top = 101
              Width = 121
              Height = 19
              DataField = 'KUN_ZAHLART'
              DataSource = KS_DS
              KeyField = 'ZAHL_ID'
              ListField = 'LANGBEZ'
              ListSource = DM1.ZahlArtDS
              TabOrder = 7
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KunZahlart: TDBEdit
              Left = 86
              Top = 101
              Width = 28
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'KUN_ZAHLART'
              DataSource = KS_DS
              TabOrder = 6
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object DatumGB: TOFGroupBox
            Left = 0
            Top = 249
            Width = 242
            Height = 128
            Align = alTop
            Caption = 'Daten'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 2
            object Bevel2: TBevel
              Tag = 1
              Left = 7
              Top = 66
              Width = 227
              Height = 2
              Shape = bsTopLine
            end
            object Label30: TLabel
              Left = 5
              Top = 41
              Width = 109
              Height = 13
              AutoSize = False
              Caption = 'Kunde seit:'
            end
            object GebdatToOutlookLabel: TJvLabel
              Left = 5
              Top = 24
              Width = 109
              Height = 13
              Cursor = crHandPoint
              Hint = 'Termin nach Outlook '#252'bernehmen'
              AutoSize = False
              Caption = 'Geburtsdatum:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = GebdatToOutlookLabelClick
              HotTrack = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlue
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = [fsUnderline]
            end
            object ShopPwLab: TLabel
              Left = 5
              Top = 104
              Width = 52
              Height = 13
              AutoSize = False
              Caption = 'Shop-PW:'
              Enabled = False
            end
            object Label11: TLabel
              Left = 17
              Top = 60
              Width = 25
              Height = 13
              Alignment = taCenter
              Caption = 'Shop'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object GebDat: TJvDBDateEdit
              Tag = 1
              Left = 114
              Top = 20
              Width = 120
              Height = 19
              DataField = 'KUN_GEBDATUM'
              DataSource = KS_DS
              AutoSelect = False
              NumGlyphs = 2
              YearDigits = dyFour
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyPress = matchKeyPress
              OnKeyDown = matchKeyDown
            end
            object KunSeit: TJvDBDateEdit
              Tag = 1
              Left = 114
              Top = 40
              Width = 120
              Height = 19
              DataField = 'KUN_SEIT'
              DataSource = KS_DS
              AutoSelect = False
              NumGlyphs = 2
              YearDigits = dyFour
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyPress = matchKeyPress
              OnKeyDown = matchKeyDown
            end
            object ShopPW: TDBEdit
              Tag = 1
              Left = 79
              Top = 99
              Width = 155
              Height = 21
              AutoSelect = False
              AutoSize = False
              DataField = 'SHOP_PASSWORD'
              DataSource = KS_DS
              Enabled = False
              PasswordChar = '*'
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object ShopKundeCB: TCheckBox
              Left = 5
              Top = 76
              Width = 86
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Shop-Kunde'
              TabOrder = 3
              OnClick = ShopKundeCBClick
            end
            object ShopDelCB: TDBCheckBox
              Left = 96
              Top = 76
              Width = 136
              Height = 17
              Alignment = taLeftJustify
              Caption = 'beim n'#228'. Update l'#246'schen'
              DataField = 'SHOP_DEL_FLAG'
              DataSource = KS_DS
              Enabled = False
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
        end
        object KunAlgLeftPan: TPanel
          Left = 0
          Top = 0
          Width = 292
          Height = 501
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object AnschriftGB: TOFGroupBox
            Left = 0
            Top = 204
            Width = 292
            Height = 188
            Align = alTop
            Caption = 'Anschrift'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 2
            object Label43: TLabel
              Left = 5
              Top = 165
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Land/Plz/Postf.:'
            end
            object Label9: TLabel
              Left = 5
              Top = 145
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Land/Plz/Ort:'
            end
            object Label8: TLabel
              Left = 5
              Top = 125
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Strasse:'
              FocusControl = strasse
            end
            object Label7: TLabel
              Left = 5
              Top = 105
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'z.Hd. von:'
              FocusControl = abteilung
            end
            object Name3Label: TLabel
              Left = 5
              Top = 85
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Name 3:'
              FocusControl = name3
            end
            object Name2Label: TLabel
              Left = 5
              Top = 66
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Name 2:'
              FocusControl = name2
            end
            object Name1Label: TJvLabel
              Left = 5
              Top = 46
              Width = 79
              Height = 13
              Cursor = crHandPoint
              Hint = 'Adresse nach Outlook '#252'bergeben'
              AutoSize = False
              Caption = 'Name 1:'
              FocusControl = name1
              OnClick = Name1LabelClick
              HotTrack = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlue
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = [fsUnderline]
            end
            object AnredeLabel: TLabel
              Left = 5
              Top = 25
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Anrede:'
            end
            object name1: TDBEdit
              Tag = 1
              Left = 86
              Top = 42
              Width = 198
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'NAME1'
              DataSource = KS_DS
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object name2: TDBEdit
              Tag = 1
              Left = 86
              Top = 62
              Width = 198
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'NAME2'
              DataSource = KS_DS
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object name3: TDBEdit
              Tag = 1
              Left = 86
              Top = 82
              Width = 198
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'NAME3'
              DataSource = KS_DS
              TabOrder = 3
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object abteilung: TDBEdit
              Tag = 1
              Left = 86
              Top = 102
              Width = 198
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'ABTEILUNG'
              DataSource = KS_DS
              TabOrder = 4
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object strasse: TDBEdit
              Tag = 1
              Left = 86
              Top = 122
              Width = 198
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'STRASSE'
              DataSource = KS_DS
              TabOrder = 5
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Ort: TJvDBComboEdit
              Tag = 2
              Left = 166
              Top = 142
              Width = 118
              Height = 19
              AutoSelect = False
              ButtonHint = 'Ortsverzeichnis aufrufen'
              DataField = 'ORT'
              DataSource = KS_DS
              ImageKind = ikEllipsis
              ButtonWidth = 16
              TabOrder = 8
              OnButtonClick = PLZButtonClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Postfach: TJvDBComboEdit
              Tag = 2
              Left = 166
              Top = 162
              Width = 118
              Height = 19
              AutoSelect = False
              ButtonHint = 'Ortsverzeichnis aufrufen'
              DataField = 'POSTFACH'
              DataSource = KS_DS
              ImageKind = ikEllipsis
              ButtonWidth = 16
              TabOrder = 11
              OnButtonClick = PLZButtonClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object PF_PLZ: TJvDBComboEdit
              Left = 108
              Top = 162
              Width = 57
              Height = 19
              AutoSelect = False
              ButtonHint = 'Postleitzahlenverzeichis aufrufen'
              DataField = 'PF_PLZ'
              DataSource = KS_DS
              ImageKind = ikEllipsis
              ButtonWidth = 16
              TabOrder = 10
              OnButtonClick = PLZButtonClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object PLZ: TJvDBComboEdit
              Left = 108
              Top = 142
              Width = 57
              Height = 19
              AutoSelect = False
              ButtonHint = 'Postleitzahlenverzeichis aufrufen'
              DataField = 'PLZ'
              DataSource = KS_DS
              ImageKind = ikEllipsis
              ButtonWidth = 16
              TabOrder = 7
              OnButtonClick = PLZButtonClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Land: TDBEdit
              Left = 86
              Top = 142
              Width = 20
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'LAND'
              DataSource = KS_DS
              TabOrder = 6
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object PF_Land: TDBEdit
              Left = 86
              Top = 162
              Width = 20
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'LAND'
              DataSource = KS_DS
              ReadOnly = True
              TabOrder = 9
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Anrede: TVolgaDBEdit
              Tag = 1
              Left = 86
              Top = 22
              Width = 198
              Height = 19
              ButtonWidth = 17
              ComboProps.ComboItems.Strings = (
                'B'#252'rgermeister'
                'Doktor'
                'Familie'
                'Firma'
                'Frau'
                'Herr'
                'Pfarrer'
                'Professor')
              DataField = 'ANREDE'
              DataSource = KS_DS
              DialogStyle = vdsCombo
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object MaennlichRG: TRadioButton
              Left = 86
              Top = 23
              Width = 81
              Height = 17
              Caption = 'Herr'
              Checked = True
              TabOrder = 12
              TabStop = True
              OnClick = MaennlichRGClick
            end
            object WeiblichRG: TRadioButton
              Left = 176
              Top = 23
              Width = 81
              Height = 17
              Caption = 'Frau'
              TabOrder = 13
              OnClick = MaennlichRGClick
            end
          end
          object SuchbegrGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 292
            Height = 68
            Align = alTop
            Caption = 'Suchbegriffe'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 0
            object Label24: TLabel
              Left = 5
              Top = 23
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Suchbegriff:'
            end
            object Label25: TLabel
              Left = 5
              Top = 46
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Kunden-Nr.:'
            end
            object Label36: TLabel
              Left = 167
              Top = 46
              Width = 84
              Height = 13
              AutoSize = False
              Caption = 'Ku-Nr. vom Lief. :'
            end
            object KunNum1Edit: TDBEdit
              Left = 86
              Top = 43
              Width = 78
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'KUNNUM1'
              DataSource = KS_DS
              Enabled = False
              ReadOnly = True
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBEdit3: TDBEdit
              Tag = 1
              Left = 251
              Top = 43
              Width = 33
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'KUNNUM2'
              DataSource = KS_DS
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object match: TDBEdit
              Tag = 1
              Left = 86
              Top = 20
              Width = 198
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'MATCHCODE'
              DataSource = KS_DS
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object ZuweisungenGB: TOFGroupBox
            Left = 0
            Top = 68
            Width = 292
            Height = 136
            Align = alTop
            Caption = 'Zuweisungen'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 1
            object Label16: TLabel
              Left = 5
              Top = 44
              Width = 53
              Height = 13
              AutoSize = False
              Caption = 'Selektion:'
              FocusControl = gruppe
            end
            object Label71: TLabel
              Left = 5
              Top = 25
              Width = 53
              Height = 13
              AutoSize = False
              Caption = 'Gruppe:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object MerkmalLab: TLabel
              Left = 5
              Top = 63
              Width = 53
              Height = 13
              AutoSize = False
              Caption = 'Merkmale:'
              FocusControl = gruppe
            end
            object gruppe: TDBEdit
              Tag = 1
              Left = 86
              Top = 41
              Width = 198
              Height = 19
              AutoSelect = False
              DataField = 'GRUPPE'
              DataSource = KS_DS
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KunGR1: TDBLookupComboBox
              Tag = 1
              Left = 86
              Top = 21
              Width = 198
              Height = 19
              DataField = 'KUNDENGRUPPE'
              DataSource = KS_DS
              KeyField = 'GR'
              ListField = 'LANGBEZ'
              ListSource = DM1.KgrDS
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KunMerkmalLB: TJvCheckListBox
              Tag = 1
              Left = 86
              Top = 64
              Width = 198
              Height = 66
              OnClickCheck = KunMerkmalLBClickCheck
              ItemHeight = 13
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object InfoGB: TOFGroupBox
            Left = 0
            Top = 392
            Width = 292
            Height = 109
            Align = alClient
            Caption = 'Info'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 3
            object InfoMemo: TDBMemo
              Left = 8
              Top = 21
              Width = 276
              Height = 80
              Hint = 'Zeilenumbruch mit Strg+Enter'
              Align = alClient
              DataField = 'INFO'
              DataSource = KS_DS
              ScrollBars = ssVertical
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
        end
      end
      object Zuweis_TS: TTabSheet
        Tag = 2
        Caption = 'Erweitert'
        ImageIndex = 2
        object Panel4: TPanel
          Left = 0
          Top = 68
          Width = 534
          Height = 88
          Align = alTop
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 0
          OnResize = Panel4Resize
          object LieferantGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 267
            Height = 88
            Align = alLeft
            Caption = 'Lieferant'
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 0
            DesignSize = (
              267
              88)
            object Label69: TLabel
              Left = 5
              Top = 65
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Lief.-Zahlart:'
            end
            object Label70: TLabel
              Left = 5
              Top = 45
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Lief.-Versand:'
            end
            object Label56: TLabel
              Left = 5
              Top = 24
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Kreditor-Nr.:'
            end
            object LZahlartCB: TDBLookupComboBox
              Tag = 1
              Left = 113
              Top = 62
              Width = 146
              Height = 19
              DataField = 'LIEF_ZAHLART'
              DataSource = KS_DS
              KeyField = 'ZAHL_ID'
              ListField = 'LANGBEZ'
              ListSource = DM1.ZahlArtDS
              TabOrder = 6
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object LZahlart: TDBEdit
              Left = 86
              Top = 62
              Width = 28
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'LIEF_ZAHLART'
              DataSource = KS_DS
              TabOrder = 5
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object LVersand: TDBEdit
              Left = 86
              Top = 41
              Width = 28
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'LIEF_LIEFART'
              DataSource = KS_DS
              TabOrder = 3
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object LVersandCB: TDBLookupComboBox
              Tag = 1
              Left = 113
              Top = 41
              Width = 146
              Height = 19
              DataField = 'LIEF_LIEFART'
              DataSource = KS_DS
              KeyField = 'LIEF_ID'
              ListField = 'LANGBEZ'
              ListSource = DM1.LiefArtDS
              TabOrder = 4
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object LieferExpCB: TCheckBox
              Left = 168
              Top = 21
              Width = 91
              Height = 17
              Alignment = taLeftJustify
              Anchors = [akTop, akRight]
              Caption = 'Lief. exportiert'
              Enabled = False
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object IstLieferCB: TCheckBox
              Left = 168
              Top = 1
              Width = 91
              Height = 14
              Alignment = taLeftJustify
              Anchors = [akTop, akRight]
              Caption = 'ist Lieferant'
              Enabled = False
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object krdnum: TDBEdit
              Left = 86
              Top = 20
              Width = 51
              Height = 19
              DataField = 'KRD_NUM'
              DataSource = KS_DS
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object KundeGB: TOFGroupBox
            Left = 267
            Top = 0
            Width = 267
            Height = 88
            Align = alClient
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Kunde'
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 1
            DesignSize = (
              267
              88)
            object Label32: TLabel
              Left = 5
              Top = 24
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Debitor-Nr.:'
            end
            object Label68: TLabel
              Left = 5
              Top = 45
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Kunde-Versand:'
            end
            object Label67: TLabel
              Left = 5
              Top = 65
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Kunde-Zahlart:'
            end
            object IstKundeCB: TCheckBox
              Left = 161
              Top = 1
              Width = 98
              Height = 14
              Alignment = taLeftJustify
              Anchors = [akTop, akRight]
              Caption = 'ist Kunde'
              Enabled = False
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KundeExpCB: TCheckBox
              Left = 161
              Top = 21
              Width = 98
              Height = 17
              Alignment = taLeftJustify
              Anchors = [akTop, akRight]
              Caption = 'Kunde exportiert '
              Enabled = False
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KVersand: TDBEdit
              Left = 86
              Top = 41
              Width = 28
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'KUN_LIEFART'
              DataSource = KS_DS
              TabOrder = 3
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KVersandCB: TDBLookupComboBox
              Tag = 1
              Left = 113
              Top = 41
              Width = 146
              Height = 19
              DataField = 'KUN_LIEFART'
              DataSource = KS_DS
              KeyField = 'LIEF_ID'
              ListField = 'LANGBEZ'
              ListSource = DM1.LiefArtDS
              TabOrder = 4
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KZahlartCB: TDBLookupComboBox
              Tag = 1
              Left = 113
              Top = 62
              Width = 146
              Height = 19
              DataField = 'KUN_ZAHLART'
              DataSource = KS_DS
              KeyField = 'ZAHL_ID'
              ListField = 'LANGBEZ'
              ListSource = DM1.ZahlArtDS
              TabOrder = 6
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KZahlart: TDBEdit
              Left = 86
              Top = 62
              Width = 28
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'KUN_ZAHLART'
              DataSource = KS_DS
              TabOrder = 5
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object debnum: TDBEdit
              Left = 86
              Top = 20
              Width = 51
              Height = 19
              DataField = 'DEB_NUM'
              DataSource = KS_DS
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 156
          Width = 534
          Height = 177
          Align = alTop
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 1
          object Panel9: TPanel
            Left = 0
            Top = 0
            Width = 267
            Height = 177
            Align = alLeft
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object ZuweisGB: TOFGroupBox
              Left = 0
              Top = 0
              Width = 267
              Height = 177
              Align = alClient
              Caption = 'Zuweisungen'
              Ctl3D = False
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentCtl3D = False
              TabOrder = 0
              object Label38: TLabel
                Left = 5
                Top = 26
                Width = 77
                Height = 13
                AutoSize = False
                Caption = 'W'#228'hrung:'
              end
              object Label33: TLabel
                Left = 5
                Top = 46
                Width = 77
                Height = 13
                AutoSize = False
                Caption = 'Kreditlimit:'
              end
              object Label65: TLabel
                Left = 157
                Top = 46
                Width = 36
                Height = 13
                AutoSize = False
                Caption = 'Rabatt:'
              end
              object Label28: TLabel
                Left = 5
                Top = 67
                Width = 77
                Height = 13
                AutoSize = False
                Caption = 'UmsatzSt.-ID:'
              end
              object Label76: TLabel
                Left = 5
                Top = 112
                Width = 81
                Height = 13
                AutoSize = False
                Caption = 'Sprache:'
              end
              object Label77: TLabel
                Left = 5
                Top = 133
                Width = 81
                Height = 13
                AutoSize = False
                Caption = 'Vertreter:'
              end
              object Label1: TLabel
                Left = 5
                Top = 156
                Width = 81
                Height = 13
                AutoSize = False
                Caption = 'Provision:'
              end
              object klimit: TDBEdit
                Left = 86
                Top = 43
                Width = 67
                Height = 19
                DataField = 'KUN_KRDLIMIT'
                DataSource = KS_DS
                TabOrder = 2
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object globrabatt: TDBEdit
                Tag = 1
                Left = 200
                Top = 43
                Width = 59
                Height = 19
                DataField = 'GRABATT'
                DataSource = KS_DS
                TabOrder = 3
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object BRUTTO_CB: TDBCheckBox
                Left = 5
                Top = 88
                Width = 94
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Brutto-Berechn.'
                DataField = 'BRUTTO_FLAG'
                DataSource = KS_DS
                TabOrder = 5
                ValueChecked = 'Wahr'
                ValueUnchecked = 'Falsch'
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object MWST_FREI_CB: TDBCheckBox
                Tag = 1
                Left = 184
                Top = 87
                Width = 75
                Height = 17
                Alignment = taLeftJustify
                Caption = 'MwSt-Frei'
                DataField = 'MWST_FREI_FLAG'
                DataSource = KS_DS
                TabOrder = 6
                ValueChecked = 'Wahr'
                ValueUnchecked = 'Falsch'
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object UST_ID_EDI: TDBEdit
                Tag = 1
                Left = 86
                Top = 64
                Width = 173
                Height = 19
                DataField = 'UST_NUM'
                DataSource = KS_DS
                TabOrder = 4
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object waehrung: TDBEdit
                Left = 86
                Top = 22
                Width = 28
                Height = 19
                DataField = 'WAEHRUNG'
                DataSource = KS_DS
                Enabled = False
                ReadOnly = True
                TabOrder = 0
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object WaehrungCB: TDBLookupComboBox
                Tag = 1
                Left = 113
                Top = 22
                Width = 146
                Height = 19
                DataField = 'WAEHRUNG'
                DataSource = KS_DS
                Enabled = False
                KeyField = 'WAEHRUNG'
                ListField = 'LANGBEZ'
                ListSource = DM1.WhrungDS
                ReadOnly = True
                TabOrder = 1
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object SpracheEdi: TDBEdit
                Left = 86
                Top = 110
                Width = 28
                Height = 19
                DataField = 'SPRACH_ID'
                DataSource = KS_DS
                ReadOnly = True
                TabOrder = 7
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object SpracheCB: TDBLookupComboBox
                Tag = 1
                Left = 113
                Top = 110
                Width = 146
                Height = 19
                DataField = 'SPRACH_ID'
                DataSource = KS_DS
                KeyField = 'SPRACH_ID'
                ListField = 'NAME'
                ListSource = DM1.SprachDS
                TabOrder = 8
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object VertreterEdi: TDBEdit
                Left = 86
                Top = 130
                Width = 28
                Height = 19
                DataField = 'VERTRETER_ID'
                DataSource = KS_DS
                TabOrder = 9
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object VertreterCB: TDBLookupComboBox
                Tag = 1
                Left = 113
                Top = 130
                Width = 146
                Height = 19
                DataField = 'VERTRETER_ID'
                DataSource = KS_DS
                KeyField = 'VERTRETER_ID'
                ListField = 'NAME;VNAME'
                ListSource = DM1.VertreterDS
                TabOrder = 10
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object VertrProzEdi: TDBEdit
                Left = 86
                Top = 152
                Width = 67
                Height = 19
                DataField = 'PROVIS_PROZ'
                DataSource = KS_DS
                TabOrder = 11
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
            end
          end
          object Panel11: TPanel
            Left = 267
            Top = 0
            Width = 267
            Height = 177
            Align = alClient
            BevelOuter = bvNone
            BiDiMode = bdLeftToRight
            Color = 14680063
            ParentBiDiMode = False
            TabOrder = 1
            object BankGB: TOFGroupBox
              Left = 0
              Top = 0
              Width = 267
              Height = 177
              Align = alClient
              Caption = 'Bankverbindung'
              Color = 14680063
              Ctl3D = False
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentColor = False
              ParentCtl3D = False
              TabOrder = 0
              object Label73: TLabel
                Left = 5
                Top = 45
                Width = 81
                Height = 13
                AutoSize = False
                Caption = 'Konto-Nummer:'
              end
              object Label74: TLabel
                Left = 5
                Top = 66
                Width = 81
                Height = 13
                AutoSize = False
                Caption = 'Bankleitzahl:'
              end
              object Label75: TLabel
                Left = 5
                Top = 87
                Width = 81
                Height = 13
                AutoSize = False
                Caption = 'Name der Bank:'
              end
              object Label78: TLabel
                Left = 5
                Top = 24
                Width = 81
                Height = 13
                AutoSize = False
                Caption = 'Konto-Inhaber:'
              end
              object Label2: TLabel
                Left = 5
                Top = 133
                Width = 81
                Height = 13
                AutoSize = False
                Caption = 'IBAN:'
              end
              object Label18: TLabel
                Left = 5
                Top = 154
                Width = 81
                Height = 13
                AutoSize = False
                Caption = 'SWIFT:'
              end
              object Bevel1: TBevel
                Tag = 1
                Left = 8
                Top = 115
                Width = 251
                Height = 2
                Shape = bsTopLine
              end
              object Label19: TLabel
                Left = 17
                Top = 108
                Width = 131
                Height = 13
                Caption = ' Bankverbindung (Ausland) '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object KontoEdi: TDBEdit
                Tag = 1
                Left = 86
                Top = 42
                Width = 173
                Height = 19
                AutoSelect = False
                DataField = 'KTO'
                DataSource = KS_DS
                TabOrder = 1
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object BlZEdi: TJvDBComboEdit
                Tag = 1
                Left = 86
                Top = 63
                Width = 173
                Height = 19
                AutoSelect = False
                DataField = 'BLZ'
                DataSource = KS_DS
                ImageKind = ikEllipsis
                ButtonWidth = 16
                TabOrder = 2
                OnButtonClick = BlZEdiButtonClick
                OnEnter = matchEnter
                OnExit = BlZEdiExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object BankNameEdi: TDBEdit
                Tag = 1
                Left = 86
                Top = 84
                Width = 173
                Height = 19
                AutoSelect = False
                DataField = 'BANK'
                DataSource = KS_DS
                TabOrder = 3
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object KontoInhEdi: TDBEdit
                Tag = 1
                Left = 86
                Top = 21
                Width = 173
                Height = 19
                AutoSelect = False
                DataField = 'KTO_INHABER'
                DataSource = KS_DS
                TabOrder = 0
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object iban: TDBEdit
                Tag = 1
                Left = 86
                Top = 130
                Width = 173
                Height = 19
                AutoSelect = False
                DataField = 'IBAN'
                DataSource = KS_DS
                TabOrder = 4
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object swift: TDBEdit
                Tag = 1
                Left = 86
                Top = 151
                Width = 173
                Height = 19
                AutoSelect = False
                DataField = 'SWIFT'
                DataSource = KS_DS
                TabOrder = 5
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
            end
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 333
          Width = 534
          Height = 168
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object CaoGroupBox10: TOFGroupBox
            Left = 0
            Top = 0
            Width = 534
            Height = 168
            Align = alClient
            Caption = 'Lieferanschriften'
            Color = 14680063
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            TabOrder = 0
            object KunLiefAddrGrid: TOFDBGrid
              Left = 8
              Top = 21
              Width = 518
              Height = 111
              Align = alClient
              BorderStyle = bsNone
              Ctl3D = True
              DataSource = KunLiefDS
              DefaultDrawing = False
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
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
              OnApplyCellAttribute = KunLiefAddrGridApplyCellAttribute
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ANREDE'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NAME1'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NAME2'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'STRASSE'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LAND'
                  Width = 30
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PLZ'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ORT'
                  Width = 100
                  Visible = True
                end>
            end
            object ToolBar1: TToolBar
              Left = 8
              Top = 138
              Width = 518
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
              TabOrder = 1
              Wrapable = False
              object KunLiefEdiBtn: TToolButton
                Left = 0
                Top = 0
                AutoSize = True
                Caption = 'Bearbeiten'
                ImageIndex = 9
                OnClick = BitBtn1Click
              end
              object ToolButton8: TToolButton
                Left = 82
                Top = 0
                Width = 8
                Caption = 'ToolButton8'
                ImageIndex = 21
                Style = tbsSeparator
              end
              object KunLiefStdBtn: TToolButton
                Left = 90
                Top = 0
                AutoSize = True
                Caption = 'Als Standard'
                ImageIndex = 12
                OnClick = KunLiefStdBtnClick
              end
              object ToolButton9: TToolButton
                Left = 181
                Top = 0
                Width = 8
                Caption = 'ToolButton9'
                ImageIndex = 20
                Style = tbsSeparator
              end
              object KunLiefDelBtn: TToolButton
                Left = 189
                Top = 0
                AutoSize = True
                Caption = 'L'#246'schen'
                ImageIndex = 19
                OnClick = KunLiefDelBtnClick
              end
            end
            object Panel12: TPanel
              Left = 8
              Top = 132
              Width = 518
              Height = 6
              Align = alBottom
              BevelOuter = bvNone
              Color = 14680063
              TabOrder = 2
            end
          end
        end
        object ErwTopPanel: TPanel
          Left = 0
          Top = 0
          Width = 534
          Height = 68
          Align = alTop
          BevelOuter = bvNone
          Caption = 'ErwTopPanel'
          TabOrder = 3
          object AddrTopGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 534
            Height = 68
            Align = alClient
            Caption = 'Suchbegriffe'
            Color = 14680063
            Ctl3D = False
            Enabled = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 0
            object Label55: TLabel
              Left = 5
              Top = 23
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Suchbegriff:'
            end
            object Label63: TLabel
              Left = 5
              Top = 46
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Kunden-Nr.:'
            end
            object Label64: TLabel
              Left = 167
              Top = 46
              Width = 84
              Height = 13
              AutoSize = False
              Caption = 'Ku-Nr. vom Lief. :'
            end
            object DBEdit11: TDBEdit
              Left = 86
              Top = 43
              Width = 78
              Height = 19
              AutoSize = False
              DataField = 'KUNNUM1'
              DataSource = KS_DS
              Enabled = False
              ReadOnly = True
              TabOrder = 1
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBEdit12: TDBEdit
              Left = 251
              Top = 43
              Width = 62
              Height = 19
              AutoSize = False
              DataField = 'KUNNUM2'
              DataSource = KS_DS
              Enabled = False
              ReadOnly = True
              TabOrder = 2
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBEdit13: TDBEdit
              Left = 86
              Top = 20
              Width = 227
              Height = 19
              AutoSize = False
              Ctl3D = False
              DataField = 'MATCHCODE'
              DataSource = KS_DS
              Enabled = False
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 0
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBEdit14: TDBEdit
              Tag = 1
              Left = 322
              Top = 20
              Width = 204
              Height = 19
              AutoSize = False
              DataField = 'CALC_NAME'
              DataSource = KS_DS
              Enabled = False
              ReadOnly = True
              TabOrder = 3
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBEdit15: TDBEdit
              Left = 322
              Top = 43
              Width = 20
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'LAND'
              DataSource = KS_DS
              Enabled = False
              ReadOnly = True
              TabOrder = 4
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBEdit1: TDBEdit
              Left = 346
              Top = 43
              Width = 43
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'PLZ'
              DataSource = KS_DS
              Enabled = False
              ReadOnly = True
              TabOrder = 5
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBEdit7: TDBEdit
              Tag = 1
              Left = 394
              Top = 43
              Width = 132
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'ORT'
              DataSource = KS_DS
              Enabled = False
              ReadOnly = True
              TabOrder = 6
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
        end
      end
      object ASP_TS: TTabSheet
        Tag = 3
        Caption = 'Ansprechpartner'
        ImageIndex = 8
        object Panel5: TPanel
          Left = 0
          Top = 68
          Width = 534
          Height = 220
          Align = alTop
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 0
          object AspAlgGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 280
            Height = 220
            Align = alClient
            Caption = 'Allgemein'
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 0
            object Label46: TLabel
              Left = 6
              Top = 150
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Info:'
            end
            object Label40: TLabel
              Left = 6
              Top = 87
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Name:'
              FocusControl = APName
            end
            object Label39: TLabel
              Left = 6
              Top = 65
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Vorname:'
              FocusControl = APVorname
            end
            object Label23: TLabel
              Left = 6
              Top = 24
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Funktion:'
              FocusControl = APFunktion
            end
            object Label48: TLabel
              Left = 5
              Top = 107
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Strasse:'
              FocusControl = APStrasse
            end
            object Label61: TLabel
              Left = 5
              Top = 127
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Land/Plz/Ort:'
            end
            object Label62: TLabel
              Left = 5
              Top = 44
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Anrede:'
            end
            object APName: TDBEdit
              Tag = 1
              Left = 86
              Top = 83
              Width = 186
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'NAME'
              DataSource = APDS
              TabOrder = 3
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object APVorname: TDBEdit
              Tag = 1
              Left = 86
              Top = 62
              Width = 186
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'VORNAME'
              DataSource = APDS
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object APFunktion: TDBEdit
              Tag = 1
              Left = 86
              Top = 20
              Width = 186
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'FUNKTION'
              DataSource = APDS
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object APInfo: TDBMemo
              Tag = 1
              Left = 86
              Top = 146
              Width = 186
              Height = 67
              Hint = 'Zeilenumbruch mit Strg+Enter'
              DataField = 'INFO'
              DataSource = APDS
              ScrollBars = ssVertical
              TabOrder = 8
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object APStrasse: TDBEdit
              Tag = 1
              Left = 86
              Top = 104
              Width = 186
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'STRASSE'
              DataSource = APDS
              TabOrder = 4
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object APLand: TDBEdit
              Left = 86
              Top = 124
              Width = 20
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'LAND'
              DataSource = APDS
              TabOrder = 5
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object APPLZ: TJvDBComboEdit
              Left = 108
              Top = 124
              Width = 57
              Height = 19
              AutoSelect = False
              ButtonHint = 'Postleitzahlenverzeichis aufrufen'
              DataField = 'PLZ'
              DataSource = APDS
              ImageKind = ikEllipsis
              ButtonWidth = 16
              TabOrder = 6
              OnButtonClick = APPLZButtonClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object APOrt: TJvDBComboEdit
              Tag = 2
              Left = 166
              Top = 124
              Width = 106
              Height = 19
              AutoSelect = False
              ButtonHint = 'Ortsverzeichnis aufrufen'
              DataField = 'ORT'
              DataSource = APDS
              ImageKind = ikEllipsis
              ButtonWidth = 16
              TabOrder = 7
              OnButtonClick = APPLZButtonClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object APAnrede: TVolgaDBEdit
              Tag = 1
              Left = 86
              Top = 41
              Width = 186
              Height = 19
              ButtonWidth = 17
              ComboProps.ComboItems.Strings = (
                'B'#252'rgermeister'
                'Doktor'
                'Familie'
                'Firma'
                'Frau'
                'Herr'
                'Pfarrer'
                'Professor')
              DataField = 'ANREDE'
              DataSource = APDS
              DialogStyle = vdsCombo
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object Panel10: TPanel
            Left = 280
            Top = 0
            Width = 254
            Height = 220
            Align = alRight
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object AspKommGB: TOFGroupBox
              Left = 0
              Top = 0
              Width = 254
              Height = 171
              Align = alClient
              Caption = 'Kommunikation'
              Ctl3D = False
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentCtl3D = False
              TabOrder = 0
              object ASPTelefonLab: TLabel
                Left = 7
                Top = 23
                Width = 78
                Height = 13
                AutoSize = False
                Caption = 'Telefon:'
              end
              object ASPTelPrivLab: TLabel
                Left = 7
                Top = 44
                Width = 78
                Height = 13
                AutoSize = False
                Caption = 'Telefon privat:'
              end
              object ASPFaxLab: TLabel
                Left = 7
                Top = 64
                Width = 79
                Height = 13
                AutoSize = False
                Caption = 'Telefax:'
                FocusControl = APTelefax
              end
              object ASPMobilLab: TLabel
                Left = 7
                Top = 86
                Width = 78
                Height = 13
                AutoSize = False
                Caption = 'Mobilfunk:'
              end
              object ASPEmailLab: TLabel
                Left = 7
                Top = 108
                Width = 78
                Height = 13
                AutoSize = False
                Caption = 'eMail:'
              end
              object ASPGebDatumLab: TJvLabel
                Left = 7
                Top = 149
                Width = 78
                Height = 13
                Hint = 'Termin nach Outlook '#252'bernehmen'
                AutoSize = False
                Caption = 'Geburtsdatum:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                OnClick = ASPGebDatumLabClick
                HotTrack = True
                HotTrackFont.Charset = DEFAULT_CHARSET
                HotTrackFont.Color = clBlue
                HotTrackFont.Height = -11
                HotTrackFont.Name = 'MS Sans Serif'
                HotTrackFont.Style = [fsUnderline]
              end
              object ASPEmail2Lab: TLabel
                Left = 7
                Top = 129
                Width = 78
                Height = 13
                AutoSize = False
                Caption = 'eMail (2):'
              end
              object APTelefax: TDBEdit
                Tag = 1
                Left = 87
                Top = 62
                Width = 159
                Height = 19
                AutoSelect = False
                AutoSize = False
                DataField = 'TELEFAX'
                DataSource = APDS
                TabOrder = 2
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object APemail: TJvDBComboEdit
                Tag = 1
                Left = 88
                Top = 104
                Width = 158
                Height = 19
                AutoSelect = False
                ButtonHint = 'neue EMail mit dieser Adresse erstellen'
                DataField = 'EMAIL'
                DataSource = APDS
                ImageIndex = 1
                Images = ImageList1
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnButtonClick = AsPEMailLabClick
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object APGebDatum: TJvDBDateEdit
                Tag = 1
                Left = 88
                Top = 146
                Width = 158
                Height = 19
                DataField = 'GEBDATUM'
                DataSource = APDS
                AutoSelect = False
                NumGlyphs = 2
                TabOrder = 6
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyPress = matchKeyPress
                OnKeyDown = matchKeyDown
              end
              object APEmail2: TJvDBComboEdit
                Tag = 1
                Left = 88
                Top = 125
                Width = 158
                Height = 19
                AutoSelect = False
                ButtonHint = 'neue EMail mit dieser Adresse erstellen'
                DataField = 'EMAIL2'
                DataSource = APDS
                ImageIndex = 1
                Images = ImageList1
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
                OnButtonClick = AsPEMailLab2Click
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object APTelefon: TJvDBComboEdit
                Tag = 1
                Left = 87
                Top = 20
                Width = 159
                Height = 19
                AutoSelect = False
                ButtonHint = 'anrufen ('#252'ber Tapi)'
                DataField = 'TELEFON'
                DataSource = APDS
                ImageIndex = 0
                Images = ImageList1
                ButtonWidth = 20
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnButtonClick = tele1ButtonClick
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object APTelPriv: TJvDBComboEdit
                Tag = 1
                Left = 87
                Top = 41
                Width = 159
                Height = 19
                AutoSelect = False
                ButtonHint = 'anrufen ('#252'ber Tapi)'
                DataField = 'TELEPRIVAT'
                DataSource = APDS
                ImageIndex = 0
                Images = ImageList1
                ButtonWidth = 20
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnButtonClick = tele1ButtonClick
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object APMobilfunk: TJvDBComboEdit
                Tag = 1
                Left = 87
                Top = 83
                Width = 159
                Height = 19
                AutoSelect = False
                ButtonHint = 'anrufen ('#252'ber Tapi)'
                DataField = 'MOBILFUNK'
                DataSource = APDS
                ImageIndex = 0
                Images = ImageList1
                ButtonWidth = 20
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                OnButtonClick = tele1ButtonClick
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
            end
            object CaoGroupBox9: TOFGroupBox
              Left = 0
              Top = 171
              Width = 254
              Height = 49
              Align = alBottom
              Caption = 'Navigation'
              FrameColor = clBtnFace
              TitleColor = 14680063
              TabOrder = 1
              object DBNavigator1: TDBNavigator
                Left = 8
                Top = 21
                Width = 238
                Height = 20
                DataSource = APDS
                Align = alClient
                Flat = True
                ConfirmDelete = False
                TabOrder = 0
              end
            end
          end
        end
        object CaoGroupBox3: TOFGroupBox
          Left = 0
          Top = 288
          Width = 534
          Height = 213
          Align = alClient
          Caption = 'Liste der Ansprechpartner'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 1
          object ASPGrid: TOFDBGrid
            Left = 8
            Top = 21
            Width = 518
            Height = 184
            Align = alClient
            BorderStyle = bsNone
            DataSource = APDS
            DefaultDrawing = False
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
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
                FieldName = 'FUNKTION'
                Title.Caption = 'Funktion'
                Width = 96
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NAME'
                Title.Caption = 'Name'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VORNAME'
                Title.Caption = 'Vorname'
                Width = 82
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TELEFON'
                Title.Caption = 'Telefon'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TELEFAX'
                Title.Caption = 'FAX'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MOBILFUNK'
                Title.Caption = 'Mobilfunk'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TELEPRIVAT'
                Title.Caption = 'Tel. privat'
                Width = 124
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EMAIL'
                Title.Caption = 'eMail'
                Width = 166
                Visible = True
              end>
          end
        end
        object ASPTopPanel: TPanel
          Left = 0
          Top = 0
          Width = 534
          Height = 68
          Align = alTop
          BevelOuter = bvNone
          Caption = 'ASPTopPanel'
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          TabOrder = 2
        end
      end
      object KFZ_TS: TTabSheet
        Tag = 4
        Caption = 'KFZ'
        ImageIndex = 7
        object CaoGroupBox5: TOFGroupBox
          Left = 0
          Top = 68
          Width = 534
          Height = 433
          Align = alClient
          Caption = 'Kundenfahrzeuge'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 0
          object KFZGrid: TOFDBGrid
            Left = 8
            Top = 21
            Width = 518
            Height = 385
            Align = alClient
            BorderStyle = bsNone
            DataSource = KFZ_DS
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
            RowColor1 = 14680063
            RowColor2 = clWindow
            ShowTitleEllipsis = True
            DefaultRowHeight = 16
            EditColor = clBlack
            Columns = <
              item
                Expanded = False
                FieldName = 'GRUPPE'
                Title.Caption = 'G'
                Width = 14
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'POL_KENNZ'
                Title.Caption = 'Kennzeichen'
                Width = 73
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FGST_NUM'
                Title.Caption = 'FGST-Nr.'
                Width = 136
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TYP'
                Title.Caption = 'Typ'
                Width = 27
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HUBRAUM'
                Title.Caption = 'Hubraum'
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KW'
                Width = 32
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PS'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZULASSUNG'
                Title.Caption = 'Tag d. EZ'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KM_STAND'
                Title.Caption = 'KM-Stand'
                Width = 53
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NAE_TUEV'
                Title.Caption = 'n'#228'. T'#220'V'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NAE_AU'
                Title.Caption = 'n'#228'. AU'
                Width = 70
                Visible = True
              end>
          end
          object StatusBar2: TStatusBar
            Left = 8
            Top = 406
            Width = 518
            Height = 19
            Panels = <
              item
                Width = 50
              end
              item
                Width = 50
              end
              item
                Width = 50
              end
              item
                Width = 50
              end
              item
                Width = 50
              end>
          end
        end
        object KFZTopPanel: TPanel
          Left = 0
          Top = 0
          Width = 534
          Height = 68
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Suchbegriffe'
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          TabOrder = 1
        end
      end
      object Link_TS: TTabSheet
        Tag = 5
        Caption = 'Dateien'
        ImageIndex = 4
        object DateiTopPanel: TPanel
          Left = 0
          Top = 0
          Width = 534
          Height = 68
          Align = alTop
          BevelOuter = bvNone
          Caption = 'DateiTopPanel'
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          TabOrder = 0
        end
        object CaoGroupBox11: TOFGroupBox
          Left = 0
          Top = 68
          Width = 534
          Height = 433
          Align = alClient
          Caption = 'Datei-Link'#39's'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 1
          object LinkPanel: TPanel
            Left = 8
            Top = 21
            Width = 518
            Height = 404
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
          end
        end
      end
      object Hist_TS: TTabSheet
        Tag = 6
        Caption = 'Historie'
        ImageIndex = 6
        object HistSumBar: TStatusBar
          Left = 0
          Top = 482
          Width = 534
          Height = 19
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Panels = <
            item
              Alignment = taRightJustify
              Bevel = pbNone
              Text = 'Offen '
              Width = 38
            end
            item
              Alignment = taRightJustify
              Text = '0,00 DM'
              Width = 100
            end
            item
              Alignment = taRightJustify
              Bevel = pbNone
              Text = 'Bezahlt '
              Width = 55
            end
            item
              Alignment = taRightJustify
              Text = '0,00 DM'
              Width = 100
            end
            item
              Alignment = taRightJustify
              Bevel = pbNone
              Text = 'Gesamt '
              Width = 50
            end
            item
              Alignment = taRightJustify
              Text = '0,00 DM'
              Width = 100
            end
            item
              Width = 50
            end>
          SizeGrip = False
          UseSystemFont = False
        end
        object HistArtikelSB: TStatusBar
          Left = 0
          Top = 463
          Width = 534
          Height = 19
          Panels = <
            item
              Alignment = taRightJustify
              Bevel = pbNone
              Text = 'Summe der Positionen'
              Width = 120
            end
            item
              Alignment = taRightJustify
              Text = '0,00 DM'
              Width = 100
            end
            item
              Alignment = taCenter
              Width = 50
            end>
          Visible = False
        end
        object HistTopPanel: TPanel
          Left = 0
          Top = 0
          Width = 534
          Height = 68
          Align = alTop
          BevelOuter = bvNone
          Caption = 'HistTopPanel'
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          TabOrder = 2
        end
        object CaoGroupBox6: TOFGroupBox
          Left = 0
          Top = 99
          Width = 534
          Height = 364
          Align = alClient
          Caption = 'Liste'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 3
          object JournalGrid: TOFDBGrid
            Left = 8
            Top = 21
            Width = 518
            Height = 211
            Align = alClient
            BorderStyle = bsNone
            DataSource = JourTabDS
            DefaultDrawing = False
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = JumpMenu
            ReadOnly = True
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
            RowColor1 = 14680063
            RowColor2 = clWindow
            ShowTitleEllipsis = True
            RowSizingAllowed = True
            DefaultRowHeight = 17
            EditColor = clBlack
            Columns = <
              item
                Expanded = False
                FieldName = 'CalcEKVK'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VRENUM'
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RDATUM'
                Width = 62
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CALC_KUNDE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'NSUMME'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MSUMME'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BSUMME'
                Width = 84
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WAEHRUNG'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CalcStadium'
                Width = 122
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IST_BETRAG'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ORGNUM'
                Visible = True
              end>
          end
          object JvxSplitter1: TJvxSplitter
            Left = 8
            Top = 232
            Width = 518
            Height = 4
            ControlFirst = JournalGrid
            ControlSecond = JourPosGrid
            Align = alBottom
            BevelInner = bvRaised
            TopLeftLimit = 100
            BottomRightLimit = 100
          end
          object JourPosGrid: TOFDBGrid
            Left = 8
            Top = 236
            Width = 518
            Height = 120
            Align = alBottom
            BorderStyle = bsNone
            DataSource = JPosTabDS
            DefaultDrawing = False
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Visible = False
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 24
            TitleRowHeight = 24
            RowColor1 = 14680063
            RowColor2 = clWindow
            ShowTextEllipsis = False
            ShowTitleEllipsis = True
            RowSizingAllowed = True
            DefaultRowHeight = 30
            LinesPerRow = 2
            EditColor = clBlack
            Columns = <
              item
                Expanded = False
                FieldName = 'ARTIKELTYP'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ARTNUM'
                Width = 101
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BEZEICHNUNG'
                Width = 295
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MENGE'
                Width = 43
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EPREIS'
                Width = 81
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RABATT'
                Width = 41
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STEUER_PROZ'
                Title.Caption = 'MwSt'
                Width = 36
                Visible = True
              end>
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 68
          Width = 534
          Height = 31
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 4
          object Panel13: TPanel
            Left = 0
            Top = 0
            Width = 3
            Height = 28
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel14: TPanel
            Left = 531
            Top = 0
            Width = 3
            Height = 28
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object ToolBar99: TToolBar
            Left = 3
            Top = 0
            Width = 528
            Height = 28
            Align = alClient
            BorderWidth = 1
            ButtonHeight = 19
            Caption = 'ToolBar99'
            Color = 14680063
            EdgeBorders = []
            ParentColor = False
            TabOrder = 2
            Wrapable = False
            object Label4: TLabel
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
              Width = 156
              Height = 21
              Style = csDropDownList
              Ctl3D = False
              DropDownCount = 15
              ItemHeight = 0
              ParentCtl3D = False
              TabOrder = 1
              OnChange = HistorySelCBChange
              Items.Strings = (
                'alle Bewegungen'
                'Rechnungen'
                'offene Rechnungen'
                'unfertige Rechnungen'
                'Lieferscheine'
                'Angebote'
                'Eink'#228'ufe'
                'offene Eink'#228'ufe'
                'EK-Bestellungen'
                'offene EK-Bestellungen'
                'unfertige EK-Bestellungen')
            end
            object ToolButton5: TToolButton
              Left = 217
              Top = 2
              Width = 8
              Caption = 'ToolButton3'
              ImageIndex = 1
              Style = tbsSeparator
            end
            object Label60: TLabel
              Left = 225
              Top = 2
              Width = 35
              Height = 19
              Alignment = taRightJustify
              AutoSize = False
              Caption = '&Jahr : '
              Layout = tlCenter
            end
            object JahrCB: TComboBox
              Left = 260
              Top = 2
              Width = 78
              Height = 19
              Style = csDropDownList
              Ctl3D = False
              DropDownCount = 13
              ItemHeight = 0
              ParentCtl3D = False
              TabOrder = 0
              OnChange = JahrCBClick
            end
            object ToolButton1: TToolButton
              Left = 338
              Top = 2
              Width = 8
              Caption = 'ToolButton1'
              Style = tbsSeparator
            end
            object ArtikelViewBtn: TSpeedButton
              Left = 346
              Top = 2
              Width = 65
              Height = 19
              AllowAllUp = True
              GroupIndex = 101
              Caption = 'Artikel'
              Flat = True
              Transparent = False
              OnClick = JahrCBClick
            end
            object ToolButton2: TToolButton
              Left = 411
              Top = 2
              Width = 8
              Caption = 'ToolButton2'
              ImageIndex = 0
              Style = tbsSeparator
            end
            object JumpMenuBtn: TJvSpeedButton
              Left = 419
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
          object Panel15: TPanel
            Left = 0
            Top = 28
            Width = 534
            Height = 3
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 3
          end
        end
      end
      object Such_TS: TTabSheet
        Tag = 7
        Caption = 'Liste'
        ImageIndex = 7
        object KunSuchGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 534
          Height = 501
          Align = alClient
          DataSource = KS_DS
          DefaultDrawing = False
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = KunSuchGridDblClick
          AutoAppend = False
          TitleButtons = True
          OnTitleBtnClick = KunSuchGridTitleBtnClick
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
              FieldName = 'KUNDENGRUPPE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MATCHCODE'
              Title.Caption = 'Suchbegriff'
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANREDE'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_NAME'
              Width = 218
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABTEILUNG'
              Width = 134
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STRASSE'
              Width = 125
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLZ'
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORT'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUNNUM1'
              ReadOnly = True
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUNNUM2'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELE1'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELE2'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAX'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FUNK'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INTERNET'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DIVERSES'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'GRUPPE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'LAND'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'POSTFACH'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PF_PLZ'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'BRIEFANREDE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'BLZ'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'KTO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'BANK'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'GRABATT'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'KUN_KRDLIMIT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PR_EBENE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DEB_NUM'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KRD_NUM'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_GEBDATUM'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'KUN_SEIT'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ERSTELLT'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ERST_NAME'
              ReadOnly = True
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'GEAEND'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GEAEND_NAME'
              ReadOnly = True
              Visible = False
            end>
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 680
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      TabOrder = 0
      object AddrHirViewBtn: TJvSpeedButton
        Left = 0
        Top = 0
        Width = 90
        Height = 22
        Caption = 'Adressen'
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
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
        OnClick = AddrHirViewBtnClick
      end
      object AllgBtn: TJvSpeedButton
        Tag = 1
        Left = 272
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
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
        OnClick = ListeBtnClick
      end
      object ErwBtn: TJvSpeedButton
        Tag = 2
        Left = 334
        Top = 0
        Width = 60
        Height = 22
        Caption = 'Erweitert'
        Flat = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
        OnClick = ListeBtnClick
      end
      object KFZBtn: TJvSpeedButton
        Tag = 4
        Left = 498
        Top = 0
        Width = 40
        Height = 22
        Caption = 'KFZ'
        Flat = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
        OnClick = ListeBtnClick
      end
      object HistBtn: TJvSpeedButton
        Tag = 6
        Left = 603
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
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
        OnClick = ListeBtnClick
      end
      object ListeBtn: TJvSpeedButton
        Tag = 7
        Left = 660
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
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
        OnClick = ListeBtnClick
      end
      object ASPBtn: TJvSpeedButton
        Tag = 3
        Left = 393
        Top = 0
        Width = 105
        Height = 22
        Caption = 'Ansprechpartner'
        Flat = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
        OnClick = ListeBtnClick
      end
      object LinkBtn: TJvSpeedButton
        Tag = 5
        Left = 544
        Top = 0
        Width = 57
        Height = 22
        Caption = 'Dateien'
        Flat = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
        OnClick = ListeBtnClick
      end
    end
    object KunGRPan: TPanel
      Left = 0
      Top = 26
      Width = 143
      Height = 524
      Align = alLeft
      BevelOuter = bvNone
      BorderWidth = 2
      TabOrder = 1
      Visible = False
      OnResize = KunGRPanResize
      object Button1: TButton
        Left = 16
        Top = 48
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 2
        OnClick = Button1Click
      end
      object KunTV: TTreeView
        Left = 2
        Top = 22
        Width = 139
        Height = 500
        Align = alClient
        BorderStyle = bsNone
        Color = 14680063
        HideSelection = False
        Indent = 19
        ReadOnly = True
        TabOrder = 0
        OnChange = KunTVChange
        OnDblClick = KunTVExit
        OnExit = KunTVExit
        Items.Data = {
          01000000210000000000000000000000FFFFFFFFFFFFFFFF000000000B000000
          08416472657373656E210000000000000000000000FFFFFFFFFFFFFFFF000000
          0000000000084B756E64656E2031210000000000000000000000FFFFFFFFFFFF
          FFFF0000000000000000084B756E64656E2032210000000000000000000000FF
          FFFFFFFFFFFFFF0000000000000000084B756E64656E20332100000000000000
          00000000FFFFFFFFFFFFFFFF0000000000000000084B756E64656E2034210000
          000000000000000000FFFFFFFFFFFFFFFF0000000000000000084B756E64656E
          2035210000000000000000000000FFFFFFFFFFFFFFFF0000000000000000084B
          756E64656E2036210000000000000000000000FFFFFFFFFFFFFFFF0000000000
          000000084B756E64656E2037210000000000000000000000FFFFFFFFFFFFFFFF
          0000000000000000084B756E64656E2038210000000000000000000000FFFFFF
          FFFFFFFFFF0000000000000000084B756E64656E203922000000000000000000
          0000FFFFFFFFFFFFFFFF0000000000000000094B756E64656E20313024000000
          0000000000000000FFFFFFFFFFFFFFFF00000000000000000B4C696566657261
          6E74656E}
      end
      object Panel1: TPanel
        Left = 2
        Top = 2
        Width = 139
        Height = 20
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Hierarchie'
        Color = 14680063
        TabOrder = 1
        object AddrHirDockBtn: TJvSpeedButton
          Left = 115
          Top = 1
          Width = 22
          Height = 18
          Flat = True
          Glyph.Data = {
            A2030000424DA2030000000000004200000028000000240000000C0000000100
            1000030000006003000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
            00001F7C1F7C1F7C000000001F7C1F7C1F7C1F7C1F7C000000001F7C1F7C1F7C
            000000001F7C1F7C1F7C0000000000000000000000001F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C00001042000000000000104200001F7C1F7C1F7C1F7C1F7C0000
            1042000000000000104200001F7C1F7C1F7C0000000010421042000000000000
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000E07F000010420000E07F00001F7C1F7C
            1F7C1F7C1F7C00001042000010420000104200001F7C1F7C1F7C000010421042
            104210420000000000001F7C1F7C00000000000000000000FF7FE07FFF7F1042
            FF7F00001F7C000000000000000000001042104218631042186300001F7C1F7C
            1F7C00001042FF7FE07F00000000000000001F7C1F7C1F7C1F7C1F7C1F7C0000
            E07FFF7FE07FE07FE07F00001F7C1F7C1F7C1F7C1F7C00001042186310421042
            104200001F7C1F7C1F7C0000FF7FE07F0000104210421042000000001F7C1F7C
            1F7C1F7C1F7C0000FF7F000000000000FF7F00001F7C1F7C1F7C1F7C1F7C0000
            1863000000000000186300001F7C1F7C1F7C0000E07FFF7F0000E07FFF7F1042
            104200001F7C1F7C1F7C1F7C1F7C000000001F7C1F7C1F7C000000001F7C1F7C
            1F7C1F7C1F7C000000001F7C1F7C1F7C000000001F7C1F7C1F7C1F7C0000E07F
            0000FF7FE07FFF7F104200001F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C00000000E07FFF7FE07F104200001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          NumGlyphs = 3
          OnMouseEnter = AllgBtnMouseEnter
          OnMouseLeave = AllgBtnMouseLeave
          OnClick = AddrHirDockBtnClick
        end
      end
    end
    object KunToolbar: TToolBar
      Left = 0
      Top = 550
      Width = 680
      Height = 26
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 88
      Caption = 'KunToolbar'
      EdgeBorders = []
      Flat = True
      Images = MainForm.ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 2
      Wrapable = False
      object DBNavigator3: TDBNavigator
        Left = 0
        Top = 0
        Width = 192
        Height = 22
        DataSource = KS_DS
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
        Flat = True
        ParentShowHint = False
        ConfirmDelete = False
        ShowHint = True
        TabOrder = 0
      end
      object Label29: TLabel
        Left = 192
        Top = 0
        Width = 52
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Suchfeld'
        Layout = tlCenter
      end
      object SuchFeldCB: TComboBox
        Left = 244
        Top = 0
        Width = 79
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnChange = SuchFeldCBChange
        Items.Strings = (
          'Name'
          'Suchbegriff'
          'Info'
          'Kundenr.'
          'Ort'
          'Stra'#223'e'
          'Selektion'
          'Ansprechpartner')
      end
      object Label35: TLabel
        Left = 323
        Top = 0
        Width = 64
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Suchbegriff'
        Layout = tlCenter
      end
      object SuchBeg: TEdit
        Left = 387
        Top = 0
        Width = 100
        Height = 22
        Hint = 
          'Mehrere Suchbegriffe k'#246'nnen Sie durch ein Leerzeichen trennen.'#13#10 +
          'Eine Oder-Verkn'#252'pfte Suche erreicht man mit "Begriff1 or Begriff' +
          '2"'
        AutoSize = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnChange = SuchbegChange
        OnKeyPress = SuchBegKeyPress
      end
      object ToolButton6: TToolButton
        Left = 487
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object UebernahmeBtn: TToolButton
        Left = 495
        Top = 0
        AutoSize = True
        Caption = #220'ber&nahme'
        ImageIndex = 22
        MenuItem = uebernehmen1
        Visible = False
        OnClick = UebernahmeBtnClick
      end
    end
  end
  object SB1: TStatusBar
    Left = 0
    Top = 576
    Width = 680
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
    Left = 21
    Top = 42
    object Adresse1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Neu1: TMenuItem
        Caption = '&Neu'
        GroupIndex = 2
        ImageIndex = 23
        ShortCut = 16462
        OnClick = Neu1Click
      end
      object Loeschen1: TMenuItem
        Caption = '&L'#246'schen'
        GroupIndex = 2
        ImageIndex = 6
        ShortCut = 16430
        OnClick = Loeschen1Click
      end
      object N1: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object Vorgangneu1: TMenuItem
        Caption = 'Vorgang neu'
        GroupIndex = 2
        ImageIndex = 23
        object Angebot1: TMenuItem
          Tag = 1
          Caption = 'Angebot'
          ImageIndex = 40
          OnClick = JumpToNewVorgang
        end
        object Rechnung1: TMenuItem
          Tag = 3
          Caption = 'Rechnung'
          ImageIndex = 40
          OnClick = JumpToNewVorgang
        end
        object EKBestellung1: TMenuItem
          Tag = 6
          Caption = 'EK-Bestellung'
          ImageIndex = 40
          OnClick = JumpToNewVorgang
        end
        object EKRechnung1: TMenuItem
          Tag = 5
          Caption = 'EK-Rechnung'
          ImageIndex = 40
          OnClick = JumpToNewVorgang
        end
      end
      object N8: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object Suchen1: TMenuItem
        Caption = '&Suchen'
        GroupIndex = 2
        ImageIndex = 10
        ShortCut = 114
        OnClick = Suchen1Click
      end
      object N2: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object SichtbareSpalten1: TMenuItem
        Caption = 'Sichtbare Spalten'
        GroupIndex = 2
        ImageIndex = 15
        OnClick = SichtbareSpalten1Click
      end
      object Layoutspeichern1: TMenuItem
        Caption = 'Layout speichern'
        GroupIndex = 2
        ImageIndex = 16
        OnClick = Layoutspeichern1Click
      end
      object N7: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object uebernehmen1: TMenuItem
        Caption = #220'ber&nahme'
        GroupIndex = 2
        ImageIndex = 22
        ShortCut = 123
        Visible = False
        OnClick = UebernahmeBtnClick
      end
    end
    object Sortierung1: TMenuItem
      Caption = '&Sortierung'
      GroupIndex = 3
      object Match1: TMenuItem
        Tag = 1
        Caption = '&Suchbegriff'
        GroupIndex = 3
        RadioItem = True
        OnClick = Sort1Click
      end
      object Name11: TMenuItem
        Tag = 2
        Caption = '&Name1'
        Checked = True
        Default = True
        GroupIndex = 3
        RadioItem = True
        OnClick = Sort1Click
      end
      object PLZOrt1: TMenuItem
        Tag = 3
        Caption = '&PLZ / Ort'
        GroupIndex = 3
        RadioItem = True
        OnClick = Sort1Click
      end
      object Kundennummer1: TMenuItem
        Tag = 4
        Caption = '&Kundennummer'
        GroupIndex = 3
        RadioItem = True
        OnClick = Sort1Click
      end
      object LiefNummer1: TMenuItem
        Tag = 5
        Caption = '&Lief.-Nummer'
        GroupIndex = 3
        RadioItem = True
        OnClick = Sort1Click
      end
    end
    object MnuPrint: TMenuItem
      Caption = 'Drucken'
      GroupIndex = 4
      object MnuPrintAdresse: TMenuItem
        Caption = 'Adresse'
        ImageIndex = 11
        OnClick = MnuPrintAdresseClick
      end
      object MnuPrintAdressenListe: TMenuItem
        Caption = 'Adressenliste'
        ImageIndex = 11
        OnClick = MnuPrintAdressenListeClick
      end
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 5
      object Allgemein1: TMenuItem
        Tag = 1
        Caption = 'Allgemein'
        Checked = True
        GroupIndex = 4
        RadioItem = True
        ShortCut = 117
        OnClick = ListeBtnClick
      end
      object Zuweisungen1: TMenuItem
        Tag = 2
        Caption = 'Erweitert'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32884
        OnClick = ListeBtnClick
      end
      object Ansprechpartner1: TMenuItem
        Tag = 3
        Caption = 'Ansprechpartner'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32885
        OnClick = ListeBtnClick
      end
      object Fahrzeuge1: TMenuItem
        Tag = 4
        Caption = 'Fahrzeuge'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32886
        OnClick = ListeBtnClick
      end
      object Dateien1: TMenuItem
        Tag = 5
        Caption = 'Dateien'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32887
        OnClick = ListeBtnClick
      end
      object Historie1: TMenuItem
        Tag = 6
        Caption = 'Historie'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32888
        OnClick = ListeBtnClick
      end
      object Liste1: TMenuItem
        Tag = 7
        Caption = 'Liste'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 118
        OnClick = ListeBtnClick
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
      object N3: TMenuItem
        Caption = '-'
        GroupIndex = 4
      end
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        GroupIndex = 4
        ImageIndex = 13
        ShortCut = 116
        OnClick = Aktualisieren1Click
      end
    end
    object Extras1: TMenuItem
      Caption = '&Extras'
      GroupIndex = 6
      object Adressenzusammenfassen1: TMenuItem
        Caption = 'Adressen zusammenfassen'
        ImageIndex = 9
        OnClick = Adressenzusammenfassen1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Kundennummerzuweisen1: TMenuItem
        Caption = 'Kundennummer zuweisen'
        ImageIndex = 18
        OnClick = Kundennummerzuweisen1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object MnuImport: TMenuItem
        Caption = 'Import/Update'
        ImageIndex = 33
        OnClick = MnuImportClick
      end
      object MnuExport: TMenuItem
        Caption = 'Export'
        GroupIndex = 2
        ImageIndex = 37
        object AdresseinZwischenablage1: TMenuItem
          Caption = 'Adresse in Zwischenablage'
          ImageIndex = 9
          OnClick = AdresseinZwischenablage1Click
        end
        object CSV1: TMenuItem
          Caption = 'Datei'
          ImageIndex = 54
          OnClick = CSV1Click
        end
      end
      object N9: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object ErweiterteSuche1: TMenuItem
        Caption = 'Erweiterte Suche'
        GroupIndex = 2
        ImageIndex = 15
        ShortCut = 16471
        OnClick = ErweiterteSuche1Click
      end
    end
  end
  object KFZ_DS: TDataSource
    DataSet = KFZTab
    Left = 54
    Top = 246
  end
  object KS_DS: TDataSource
    DataSet = KSQuery
    OnDataChange = KS_DSDataChange
    Left = 54
    Top = 90
  end
  object APDS: TDataSource
    DataSet = APTab
    Left = 54
    Top = 215
  end
  object KSQuery: TOFZQuery
    Connection = DM1.DB1
    AfterOpen = KSQueryAfterScroll
    AfterScroll = KSQueryAfterScroll
    OnCalcFields = KSQueryCalcFields
    BeforeInsert = KSQueryBeforeInsert
    BeforePost = AddrTabBeforePost
    AfterPost = KSQueryAfterPost
    AfterCancel = KSQueryAfterScroll
    BeforeDelete = KSQueryBeforeDelete
    AfterDelete = KSQueryAfterScroll
    OnNewRecord = KSQueryNewRecord
    OFSecurity = DM1.CaoSecurity
    OFModulID = 1010
    OFSubModulID = 0
    UseRecordLock = True
    ShowLockErrors = True
    LockIDField = 'REC_ID'
    AutoReleaseLock = True
    OnLockError = LockError
    Params = <>
    SQL.Strings = (
      'select ADRESSEN.*'
      'FROM ADRESSEN, ADRESSEN_ASP'
      'USE INDEX (primary)'
      
        'WHERE UPPER(ADRESSEN_ASP.NAME) LIKE "wohl%" and ADRESSEN.REC_ID ' +
        '= ADRESSEN_ASP.ADDR_ID'
      'ORDER BY MATCHCODE'
      'LIMIT 0,200')
    Options = [doCalcDefaults, doAlwaysDetailResync]
    Left = 21
    Top = 90
    object KSQueryREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object KSQueryKUNDENGRUPPE: TIntegerField
      DisplayLabel = 'KG'
      DisplayWidth = 2
      FieldName = 'KUNDENGRUPPE'
    end
    object KSQueryMATCHCODE: TStringField
      DisplayLabel = 'MATCH'
      DisplayWidth = 10
      FieldName = 'MATCHCODE'
      Size = 200
    end
    object KSQueryANREDE: TStringField
      DisplayLabel = 'Anrede'
      FieldName = 'ANREDE'
      Size = 40
    end
    object KSQueryNAME1: TStringField
      DisplayLabel = 'Name1'
      FieldName = 'NAME1'
      Size = 40
    end
    object KSQueryNAME2: TStringField
      DisplayLabel = 'Name2'
      FieldName = 'NAME2'
      Size = 40
    end
    object KSQueryNAME3: TStringField
      DisplayLabel = 'Name3'
      FieldName = 'NAME3'
      Size = 40
    end
    object KSQueryABTEILUNG: TStringField
      DisplayLabel = 'z.Hd. von'
      FieldName = 'ABTEILUNG'
      Size = 40
    end
    object KSQuerySTRASSE: TStringField
      DisplayLabel = 'Stra'#223'e'
      FieldName = 'STRASSE'
      Size = 40
    end
    object KSQueryPLZ: TStringField
      FieldName = 'PLZ'
      Size = 10
    end
    object KSQueryORT: TStringField
      DisplayLabel = 'Ort'
      FieldName = 'ORT'
      Size = 40
    end
    object KSQueryKUNNUM1: TStringField
      DisplayLabel = 'KuNr.'
      DisplayWidth = 10
      FieldName = 'KUNNUM1'
    end
    object KSQueryKUNNUM2: TStringField
      DisplayLabel = 'Lie.-Nr.'
      FieldName = 'KUNNUM2'
    end
    object KSQueryTELE1: TStringField
      DisplayLabel = 'Telefon1'
      FieldName = 'TELE1'
      Size = 100
    end
    object KSQueryTELE2: TStringField
      DisplayLabel = 'Telefon2'
      FieldName = 'TELE2'
      Size = 100
    end
    object KSQueryFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Size = 100
    end
    object KSQueryFUNK: TStringField
      DisplayLabel = 'Mobil'
      FieldName = 'FUNK'
      Size = 100
    end
    object KSQueryDEB_NUM: TIntegerField
      DisplayLabel = 'D-NUM'
      FieldName = 'DEB_NUM'
      DisplayFormat = '000000; ; '
    end
    object KSQueryKRD_NUM: TIntegerField
      DisplayLabel = 'K-NUM'
      FieldName = 'KRD_NUM'
      DisplayFormat = '000000; ; '
    end
    object KSQueryGRUPPE: TStringField
      DisplayLabel = 'Selektion'
      FieldName = 'GRUPPE'
      Size = 4
    end
    object KSQueryLAND: TStringField
      DisplayLabel = 'Land'
      DisplayWidth = 2
      FieldName = 'LAND'
      Required = True
      Size = 5
    end
    object KSQueryPOSTFACH: TStringField
      DisplayLabel = 'Postfach'
      FieldName = 'POSTFACH'
      Size = 40
    end
    object KSQueryPF_PLZ: TStringField
      DisplayLabel = 'PF-PLZ'
      FieldName = 'PF_PLZ'
      Size = 10
    end
    object KSQueryDEFAULT_LIEFANSCHRIFT_ID: TIntegerField
      FieldName = 'DEFAULT_LIEFANSCHRIFT_ID'
      Required = True
    end
    object KSQueryEMAIL: TStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      Size = 100
    end
    object KSQueryEMAIL2: TStringField
      FieldName = 'EMAIL2'
      Size = 100
    end
    object KSQueryINTERNET: TStringField
      DisplayLabel = 'Homepage'
      FieldName = 'INTERNET'
      Size = 100
    end
    object KSQueryDIVERSES: TStringField
      DisplayLabel = 'Diverses'
      FieldName = 'DIVERSES'
      Size = 100
    end
    object KSQueryBRIEFANREDE: TStringField
      DisplayLabel = 'Br.-Anrede'
      FieldName = 'BRIEFANREDE'
      Size = 100
    end
    object KSQueryKTO_INHABER: TStringField
      FieldName = 'KTO_INHABER'
      Size = 40
    end
    object KSQueryBLZ: TStringField
      DisplayLabel = 'PLZ'
      FieldName = 'BLZ'
      Size = 8
    end
    object KSQueryKTO: TStringField
      DisplayLabel = 'Konto'
      FieldName = 'KTO'
      Size = 10
    end
    object KSQueryBANK: TStringField
      DisplayLabel = 'Name der Bank'
      FieldName = 'BANK'
      Size = 40
    end
    object KSQueryIBAN: TStringField
      FieldName = 'IBAN'
      Size = 100
    end
    object KSQuerySWIFT: TStringField
      FieldName = 'SWIFT'
      Size = 100
    end
    object KSQuerySTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object KSQueryNET_SKONTO: TFloatField
      FieldName = 'NET_SKONTO'
      DisplayFormat = '0.0 %'
      EditFormat = '0.0'
    end
    object KSQueryNET_TAGE: TIntegerField
      FieldName = 'NET_TAGE'
      DisplayFormat = '0'
      EditFormat = '0'
    end
    object KSQueryBRT_TAGE: TIntegerField
      FieldName = 'BRT_TAGE'
      DisplayFormat = '0'
      EditFormat = '0'
    end
    object KSQueryWAEHRUNG: TStringField
      DisplayLabel = 'W'#228'hrung'
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object KSQueryINFO: TBlobField
      FieldName = 'INFO'
      BlobType = ftMemo
    end
    object KSQueryGRABATT: TFloatField
      DisplayLabel = 'Rab.'
      FieldName = 'GRABATT'
      DisplayFormat = '0.0%'
      EditFormat = '0.0'
    end
    object KSQueryKUN_KRDLIMIT: TFloatField
      DisplayLabel = 'Kreditlim.'
      FieldName = 'KUN_KRDLIMIT'
    end
    object KSQueryERSTELLT: TDateField
      DisplayLabel = 'erstellt'
      FieldName = 'ERSTELLT'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object KSQueryERST_NAME: TStringField
      DisplayLabel = 'erstellt von'
      FieldName = 'ERST_NAME'
    end
    object KSQueryGEAEND: TDateField
      DisplayLabel = 'le. '#196'nderung'
      FieldName = 'GEAEND'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object KSQueryGEAEND_NAME: TStringField
      DisplayLabel = 'ge'#228'ndert von'
      FieldName = 'GEAEND_NAME'
    end
    object KSQueryKUN_LIEFART: TIntegerField
      FieldName = 'KUN_LIEFART'
      DisplayFormat = '00;-;00'
      EditFormat = '#0'
    end
    object KSQueryKUN_ZAHLART: TIntegerField
      FieldName = 'KUN_ZAHLART'
      DisplayFormat = '00;-;00'
      EditFormat = '#0'
    end
    object KSQueryLIEF_LIEFART: TIntegerField
      FieldName = 'LIEF_LIEFART'
      DisplayFormat = '00;-;00'
      EditFormat = '#0'
    end
    object KSQueryLIEF_ZAHLART: TIntegerField
      FieldName = 'LIEF_ZAHLART'
      DisplayFormat = '00;-;00'
      EditFormat = '#0'
    end
    object KSQueryPR_EBENE: TIntegerField
      DisplayLabel = 'PE'
      FieldName = 'PR_EBENE'
      MaxValue = 5
      MinValue = 1
    end
    object KSQueryKUN_GEBDATUM: TDateField
      DisplayLabel = 'Gebdat.'
      FieldName = 'KUN_GEBDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object KSQueryKUN_SEIT: TDateField
      DisplayLabel = 'Kunde seit'
      FieldName = 'KUN_SEIT'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object KSQueryBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object KSQueryMWST_FREI_FLAG: TBooleanField
      FieldName = 'MWST_FREI_FLAG'
      Required = True
    end
    object KSQueryUST_NUM: TStringField
      FieldName = 'UST_NUM'
      Size = 25
    end
    object KSQuerySPRACH_ID: TIntegerField
      FieldName = 'SPRACH_ID'
      DisplayFormat = '0;-;-'
    end
    object KSQueryVERTRETER_ID: TLargeintField
      FieldName = 'VERTRETER_ID'
      DisplayFormat = '0;-;-'
    end
    object KSQueryPROVIS_PROZ: TFloatField
      DisplayLabel = 'Provision'
      DisplayWidth = 5
      FieldName = 'PROVIS_PROZ'
      Required = True
      DisplayFormat = '0.00" %"'
      EditFormat = '0.00'
    end
    object KSQuerySHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
    end
    object KSQuerySHOP_PASSWORD: TStringField
      FieldName = 'SHOP_PASSWORD'
    end
    object KSQuerySHOP_KUNDE_ID: TIntegerField
      FieldName = 'SHOP_KUNDE_ID'
      Required = True
    end
    object KSQuerySHOP_CHANGE_FLAG: TIntegerField
      FieldName = 'SHOP_CHANGE_FLAG'
      Required = True
    end
    object KSQuerySHOP_DEL_FLAG: TBooleanField
      FieldName = 'SHOP_DEL_FLAG'
      Required = True
    end
    object KSQueryGESCHLECHT: TStringField
      FieldName = 'GESCHLECHT'
      Size = 1
    end
    object KSQueryLIEF_TKOSTEN: TFloatField
      FieldName = 'LIEF_TKOSTEN'
    end
    object KSQueryLIEF_MBWERT: TFloatField
      FieldName = 'LIEF_MBWERT'
    end
    object KSQueryENTFERNUNG: TLargeintField
      FieldName = 'ENTFERNUNG'
    end
    object KSQueryUSERFELD_01: TStringField
      FieldName = 'USERFELD_01'
      Size = 255
    end
    object KSQueryUSERFELD_02: TStringField
      FieldName = 'USERFELD_02'
      Size = 255
    end
    object KSQueryUSERFELD_03: TStringField
      FieldName = 'USERFELD_03'
      Size = 255
    end
    object KSQueryUSERFELD_04: TStringField
      FieldName = 'USERFELD_04'
      Size = 255
    end
    object KSQueryUSERFELD_05: TStringField
      FieldName = 'USERFELD_05'
      Size = 255
    end
    object KSQueryUSERFELD_06: TStringField
      FieldName = 'USERFELD_06'
      Size = 255
    end
    object KSQueryUSERFELD_07: TStringField
      FieldName = 'USERFELD_07'
      Size = 255
    end
    object KSQueryUSERFELD_08: TStringField
      FieldName = 'USERFELD_08'
      Size = 255
    end
    object KSQueryUSERFELD_09: TStringField
      FieldName = 'USERFELD_09'
      Size = 255
    end
    object KSQueryUSERFELD_10: TStringField
      FieldName = 'USERFELD_10'
      Size = 255
    end
    object KSQueryCALC_NAME: TStringField
      DisplayLabel = 'Name'
      FieldKind = fkCalculated
      FieldName = 'CALC_NAME'
      Size = 255
      Calculated = True
    end
    object KSQueryKUN_PRLISTE: TBooleanField
      FieldName = 'KUN_PRLISTE'
      Required = True
    end
    object KSQueryKUN_LIEFSPERRE: TBooleanField
      FieldName = 'KUN_LIEFSPERRE'
      Required = True
    end
    object KSQueryLIEF_PRLISTE: TBooleanField
      FieldName = 'LIEF_PRLISTE'
      Required = True
    end
  end
  object KFZTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      
        'select KFZ_ID, ADDR_ID, FGST_NUM, POL_KENNZ, TYP_ID, TYP, GRUPPE' +
        ',  '
      'KW, PS, KM_STAND, HUBRAUM, ZULASSUNG, HERSTELLUNG, KAUFDATUM, '
      'LE_BESUCH, NAE_TUEV, NAE_AU'
      'FROM KFZ'
      'where ADDR_ID =:ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 21
    Top = 246
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object KFZTabKFZ_ID: TIntegerField
      FieldName = 'KFZ_ID'
    end
    object KFZTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
    end
    object KFZTabFGST_NUM: TStringField
      FieldName = 'FGST_NUM'
    end
    object KFZTabPOL_KENNZ: TStringField
      FieldName = 'POL_KENNZ'
      Size = 10
    end
    object KFZTabTYP_ID: TIntegerField
      FieldName = 'TYP_ID'
    end
    object KFZTabTYP: TStringField
      FieldName = 'TYP'
      Size = 10
    end
    object KFZTabGRUPPE: TIntegerField
      FieldName = 'GRUPPE'
    end
    object KFZTabKW: TIntegerField
      FieldName = 'KW'
    end
    object KFZTabPS: TIntegerField
      FieldName = 'PS'
    end
    object KFZTabKM_STAND: TIntegerField
      FieldName = 'KM_STAND'
    end
    object KFZTabHUBRAUM: TIntegerField
      FieldName = 'HUBRAUM'
    end
    object KFZTabZULASSUNG: TDateField
      DefaultExpression = 'dd.mm.yyy'
      FieldName = 'ZULASSUNG'
    end
    object KFZTabHERSTELLUNG: TDateField
      FieldName = 'HERSTELLUNG'
      DisplayFormat = 'dd.yyyy'
    end
    object KFZTabKAUFDATUM: TDateField
      FieldName = 'KAUFDATUM'
    end
    object KFZTabLE_BESUCH: TDateField
      FieldName = 'LE_BESUCH'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object KFZTabNAE_TUEV: TDateField
      FieldName = 'NAE_TUEV'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object KFZTabNAE_AU: TDateField
      FieldName = 'NAE_AU'
      DisplayFormat = 'dd.mm.yyyy'
    end
  end
  object APTab: TZQuery
    Connection = DM1.DB1
    BeforeInsert = APTabBeforeEdit
    BeforeEdit = APTabBeforeEdit
    BeforePost = APTabBeforePost
    AfterPost = KSQueryAfterPost
    BeforeDelete = APTabBeforeDelete
    OnNewRecord = APTabNewRecord
    SQL.Strings = (
      'select * from ADRESSEN_ASP'
      'where ADDR_ID=:ID')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 21
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object JourTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = JourTabAfterOpen
    AfterScroll = JourTabAfterOpen
    OnCalcFields = JourTabCalcFields
    SQL.Strings = (
      
        'select REC_ID, QUELLE, VRENUM, VLSNUM, RDATUM, LDATUM, KUN_NAME1' +
        ', KUN_NAME2, KUN_NAME3, KUN_ANREDE,'
      'ADDR_ID, KFZ_ID, KM_STAND, NSUMME, MSUMME, BSUMME, '
      'IST_BETRAG, STADIUM, PROJEKT, ORGNUM, WAEHRUNG,'
      'MWST_0, MWST_1, MWST_2, MWST_3'
      'from JOURNAL where ADDR_ID=118'
      '')
    Params = <>
    Left = 21
    Top = 120
    object JourTabCalcEKVK: TStringField
      DisplayLabel = 'Quelle'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'CalcEKVK'
      Size = 12
      Calculated = True
    end
    object JourTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
      Visible = False
    end
    object JourTabQUELLE: TIntegerField
      FieldName = 'QUELLE'
      Visible = False
    end
    object JourTabVRENUM: TStringField
      Alignment = taCenter
      DisplayLabel = 'Beleg-Nr.'
      DisplayWidth = 10
      FieldName = 'VRENUM'
    end
    object JourTabVLSNUM: TStringField
      DisplayLabel = 'Beleg-Nr.'
      FieldName = 'VLSNUM'
    end
    object JourTabRDATUM: TDateField
      Alignment = taCenter
      DisplayLabel = 'Datum'
      DisplayWidth = 12
      FieldName = 'RDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object JourTabLDATUM: TDateField
      DisplayLabel = 'Datum'
      DisplayWidth = 12
      FieldName = 'LDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object JourTabCALC_KUNDE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_KUNDE'
      Size = 255
      Calculated = True
    end
    object JourTabKUN_ANREDE: TStringField
      FieldName = 'KUN_ANREDE'
      Size = 40
    end
    object JourTabKUN_NAME1: TStringField
      DisplayLabel = 'Kunde'
      DisplayWidth = 36
      FieldName = 'KUN_NAME1'
      Size = 30
    end
    object JourTabKUN_NAME2: TStringField
      FieldName = 'KUN_NAME2'
      Size = 40
    end
    object JourTabKUN_NAME3: TStringField
      FieldName = 'KUN_NAME3'
      Size = 40
    end
    object JourTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Visible = False
    end
    object JourTabKFZ_ID: TIntegerField
      FieldName = 'KFZ_ID'
      Visible = False
    end
    object JourTabKM_STAND: TIntegerField
      FieldName = 'KM_STAND'
      Visible = False
    end
    object JourTabNSUMME: TFloatField
      DisplayLabel = 'Netto'
      DisplayWidth = 12
      FieldName = 'NSUMME'
      DisplayFormat = ',###,##0.00 '
    end
    object JourTabMSUMME: TFloatField
      DisplayLabel = 'MwSt'
      DisplayWidth = 12
      FieldName = 'MSUMME'
      DisplayFormat = ',###,##0.00 '
    end
    object JourTabBSUMME: TFloatField
      DisplayLabel = 'Brutto'
      DisplayWidth = 12
      FieldName = 'BSUMME'
      DisplayFormat = ',###,##0.00 '
    end
    object JourTabIST_BETRAG: TFloatField
      DisplayLabel = 'gezahlt'
      DisplayWidth = 14
      FieldName = 'IST_BETRAG'
      DisplayFormat = ',###,##0.00 '
    end
    object JourTabSTADIUM: TIntegerField
      DisplayWidth = 12
      FieldName = 'STADIUM'
    end
    object JourTabPROJEKT: TStringField
      DisplayWidth = 48
      FieldName = 'PROJEKT'
      Size = 40
    end
    object JourTabORGNUM: TStringField
      DisplayLabel = 'Org.-Nummer'
      DisplayWidth = 24
      FieldName = 'ORGNUM'
    end
    object JourTabWAEHRUNG: TStringField
      Alignment = taCenter
      DisplayLabel = 'W'
      DisplayWidth = 1
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object JourTabCalcStadium: TStringField
      DisplayLabel = 'Stadium'
      DisplayWidth = 120
      FieldKind = fkCalculated
      FieldName = 'CalcStadium'
      Size = 100
      Calculated = True
    end
    object JourTabMWST_0: TFloatField
      FieldName = 'MWST_0'
    end
    object JourTabMWST_1: TFloatField
      FieldName = 'MWST_1'
    end
    object JourTabMWST_2: TFloatField
      FieldName = 'MWST_2'
    end
    object JourTabMWST_3: TFloatField
      FieldName = 'MWST_3'
    end
  end
  object JPosTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = JPosTabCalcFields
    SQL.Strings = (
      'select JOURNAL_ID, QUELLE, ARTIKEL_ID, ADDR_ID, VRENUM, '
      'BEZEICHNUNG, MATCHCODE, ARTNUM, BARCODE, MENGE,'
      'EPREIS, RABATT, STEUER_CODE, ARTIKELTYP'
      'from JOURNALPOS'
      'where JOURNAL_ID = 1000'
      'order by POSITION, ARTIKELTYP')
    Params = <>
    Left = 21
    Top = 153
    object JPosTabJOURNAL_ID: TIntegerField
      FieldName = 'JOURNAL_ID'
      Visible = False
    end
    object JPosTabQUELLE: TIntegerField
      FieldName = 'QUELLE'
      Visible = False
    end
    object JPosTabARTIKEL_ID: TIntegerField
      FieldName = 'ARTIKEL_ID'
      Visible = False
    end
    object JPosTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Visible = False
    end
    object JPosTabVRENUM: TStringField
      DisplayLabel = 'Beleg'
      FieldName = 'VRENUM'
      Visible = False
    end
    object JPosTabMATCHCODE: TStringField
      DisplayLabel = 'MATCH'
      DisplayWidth = 24
      FieldName = 'MATCHCODE'
      Visible = False
    end
    object JPosTabBARCODE: TStringField
      DisplayLabel = 'Barcode'
      DisplayWidth = 24
      FieldName = 'BARCODE'
      Visible = False
    end
    object JPosTabARTNUM: TStringField
      DisplayLabel = 'Art.-Nr.'
      DisplayWidth = 20
      FieldName = 'ARTNUM'
    end
    object JPosTabMENGE: TFloatField
      DisplayLabel = 'Menge'
      DisplayWidth = 8
      FieldName = 'MENGE'
      DisplayFormat = ',###,##0.0;-,###,##0.0; '
    end
    object JPosTabEPREIS: TFloatField
      DisplayLabel = 'E-Preis'
      DisplayWidth = 15
      FieldName = 'EPREIS'
      DisplayFormat = ',###,##0.00 "DM";-,###,##0.00 "DM"; '
    end
    object JPosTabRABATT: TFloatField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 7
      FieldName = 'RABATT'
      DisplayFormat = '0.0 "%";0.0 "%"; '
    end
    object JPosTabSTEUER_PROZ: TFloatField
      FieldKind = fkCalculated
      FieldName = 'STEUER_PROZ'
      DisplayFormat = '0"%";0"%"; '
      Calculated = True
    end
    object JPosTabBEZEICHNUNG: TMemoField
      FieldName = 'BEZEICHNUNG'
      BlobType = ftMemo
    end
    object JPosTabSTEUER_CODE: TIntegerField
      FieldName = 'STEUER_CODE'
    end
    object JPosTabARTIKELTYP: TStringField
      DisplayLabel = 'AT'
      FieldName = 'ARTIKELTYP'
      Size = 1
    end
  end
  object JourTabDS: TDataSource
    DataSet = JourTab
    OnDataChange = JourTabDSDataChange
    Left = 54
    Top = 120
  end
  object SumQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select STADIUM, SUM(NSUMME), SUM(MSUMME), SUM(BSUMME), WAEHRUNG'
      'from JOURNAL'
      'where ADDR_ID=118 and YEAR(RDATUM) BETWEEN 2000 and 2001'
      'group by STADIUM, WAEHRUNG')
    Params = <>
    Left = 21
    Top = 279
  end
  object JPosTabDS: TDataSource
    DataSet = JPosTab
    Left = 54
    Top = 153
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = SearchTimerTimer
    Left = 21
    Top = 372
  end
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 96
    Top = 42
  end
  object KunLiefTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = KunLiefTabAfterScroll
    AfterScroll = KunLiefTabAfterScroll
    AfterPost = KunLiefTabAfterScroll
    AfterDelete = KunLiefTabAfterScroll
    SQL.Strings = (
      'select * from ADRESSEN_LIEF'
      'where ADDR_ID=:ADDR_ID'
      'order by NAME1, STRASSE, PLZ, ORT')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ADDR_ID'
        ParamType = ptUnknown
      end>
    Left = 21
    Top = 309
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ADDR_ID'
        ParamType = ptUnknown
      end>
    object KunLiefTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object KunLiefTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
    end
    object KunLiefTabANREDE: TStringField
      DisplayLabel = 'Anrede'
      FieldName = 'ANREDE'
      Size = 40
    end
    object KunLiefTabNAME1: TStringField
      DisplayLabel = 'Name 1'
      FieldName = 'NAME1'
      Required = True
      Size = 40
    end
    object KunLiefTabNAME2: TStringField
      DisplayLabel = 'Name 2'
      FieldName = 'NAME2'
      Size = 40
    end
    object KunLiefTabABTEILUNG: TStringField
      DisplayLabel = 'Abteilung'
      FieldName = 'ABTEILUNG'
      Size = 40
    end
    object KunLiefTabSTRASSE: TStringField
      DisplayLabel = 'Stra'#223'e'
      FieldName = 'STRASSE'
      Required = True
      Size = 40
    end
    object KunLiefTabLAND: TStringField
      DisplayLabel = 'Land'
      FieldName = 'LAND'
      Size = 5
    end
    object KunLiefTabPLZ: TStringField
      FieldName = 'PLZ'
      Required = True
      Size = 10
    end
    object KunLiefTabORT: TStringField
      DisplayLabel = 'Ort'
      FieldName = 'ORT'
      Required = True
      Size = 40
    end
    object KunLiefTabINFO: TMemoField
      FieldName = 'INFO'
      BlobType = ftMemo
    end
    object KunLiefTabNAME3: TStringField
      FieldName = 'NAME3'
      Size = 40
    end
  end
  object KunLiefDS: TDataSource
    DataSet = KunLiefTab
    Left = 54
    Top = 309
  end
  object MerkmalTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      
        'select AM.MERKMAL_ID, AM.NAME, IF(ATM.MERKMAL_ID=AM.MERKMAL_ID,1' +
        ',0) as FLAG '
      'from ADRESSEN_MERK AM'
      
        'left outer join ADRESSEN_TO_MERK ATM on ATM.ADDR_ID=:ID and ATM.' +
        'MERKMAL_ID=AM.MERKMAL_ID'
      'order by FLAG DESC, AM.NAME ASC')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 21
    Top = 186
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
  object AddrUpdSQL: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM ADRESSEN WHERE REC_ID=:REC_ID')
    InsertSQL.Strings = (
      'INSERT INTO ADRESSEN')
    ModifySQL.Strings = (
      'UPDATE ADRESSEN WHERE REC_ID=:REC_ID')
    UseSequenceFieldForRefreshSQL = True
    BeforeInsertSQL = AddrUpdSQLBeforeInsertSQL
    BeforeModifySQL = AddrUpdSQLBeforeModifySQL
    Left = 87
    Top = 90
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'REC_ID'
        ParamType = ptUnknown
      end>
  end
  object JumpMenu: TPopupMenu
    Images = MainForm.ImageList1
    OnPopup = JumpMenuPopup
    Left = 57
    Top = 42
    object JumpMen1: TMenuItem
      Caption = 'Jump-Men'#252
      Enabled = False
      ImageIndex = 18
    end
    object MenuItem1: TMenuItem
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
  object FormStorage1: TJvFormStorage
    AppStorage = MainForm.JvAppIniFileStorage1
    AppStoragePath = '%FORM_NAME%\'
    MinMaxInfo.MinTrackHeight = 575
    MinMaxInfo.MinTrackWidth = 618
    Version = 1000
    StoredValues = <>
    Left = 21
    Top = 402
  end
  object VpCaoEventEditDialog1: TVpOFEventEditDialog
    Version = 'v1.03'
    DataStore = CAO_DS
    TimeFormat = tf24Hour
    Options = []
    Placement.Position = mpCenter
    Placement.Top = 10
    Placement.Left = 10
    Placement.Height = 413
    Placement.Width = 702
    HelpContext = 0
    Left = 54
    Top = 339
  end
  object CAO_DS: TVpOFDataStore
    AutoConnect = False
    AutoCreate = False
    CategoryColorMap.Category0.Color = clWhite
    CategoryColorMap.Category0.Description = 'Keine'
    CategoryColorMap.Category1.Color = clRed
    CategoryColorMap.Category1.Description = 'Wichtig'
    CategoryColorMap.Category2.Color = clBlue
    CategoryColorMap.Category2.Description = 'Gesch'#228'ftlich'
    CategoryColorMap.Category3.Color = clLime
    CategoryColorMap.Category3.Description = 'Privat'
    CategoryColorMap.Category4.Color = clFuchsia
    CategoryColorMap.Category4.Description = 'Urlaub'
    CategoryColorMap.Category5.Color = clOlive
    CategoryColorMap.Category5.Description = 'Teilnahme erforderlich'
    CategoryColorMap.Category6.Color = clAqua
    CategoryColorMap.Category6.Description = 'Anreise einplanen'
    CategoryColorMap.Category7.Color = clYellow
    CategoryColorMap.Category7.Description = 'Vorbereitung notwendig'
    CategoryColorMap.Category8.Color = clPurple
    CategoryColorMap.Category8.Description = 'Geburtstag'
    CategoryColorMap.Category9.Color = clTeal
    CategoryColorMap.Category9.Description = 'Telefonanruf'
    EnableEventTimer = True
    PlayEventSounds = True
    DayBuffer = 31
    ResourceID = 0
    EventsTabName = 'PIM_TERMINE'
    ContactsTabName = 'PIM_KONTAKTE'
    TasksTabName = 'PIM_AUFGABEN'
    OnLoadResources = CAO_DSLoadResources
    Left = 21
    Top = 339
  end
  object ImageList1: TImageList
    Left = 21
    Top = 435
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000FF00000080000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080800000FFFF0000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000FF000000800000008000000080000000FF00000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000FFFF0000FFFF0000FFFF0000808000008080000080800000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000080000000FF00
      0000800000000080800000808000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFFFF00C0C0C0008080000080800000808000008080
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BF000000BF000000BF000000BF000000BF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000080000000FF0000008000
      0000FF000000008080000080800080000000FF00000080000000FF0000008000
      0000008080000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080800000FFFF0000FFFF0000FFFF
      0000FFFFFF00FFFFFF00C0C0C000FFFF0000C0C0C00080800000808000008080
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000080000000FF000000FF00
      0000FF0000000080800000808000008080008000000080000000800000008000
      0000008080000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080800000FFFF0000FFFFFF00FFFF
      FF00C0C0C0008080000080800000C0C0C000FFFF0000C0C0C000808000000000
      0000FFFF0000C0C0C00080800000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BF000000BF000000BF000000BF000000BF000000BF00
      0000FFFFFF00FFFFFF00FFFFFF0000000000FF000000FF000000FF000000FF00
      0000FF000000008080000080800000808000FF000000FF000000FF0000008000
      0000FF0000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080800000FFFF0000C0C0
      C00080800000C0C0C0008080000080800000C0C0C000FFFF0000C0C0C0000000
      0000FFFFFF00FFFF000080800000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080000000FF000000FF0000000080
      800000808000008080000080800000808000FF000000FF000000FF0000008000
      00008000000080000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080800000FFFF
      0000C0C0C00080800000C0C0C00080800000C0C0C000FFFF0000C0C0C000C0C0
      C000FFFF0000C0C0C00080800000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000BF000000BF00FFFFFF0000000000FF00000080000000008080000080
      800000808000008080000080800000808000FF00000000808000FF0000008000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000FFFF0000C0C0C000C0C0C000FFFF0000FFFF0000FFFFFF00000000000000
      0000C0C0C000FFFF0000C0C0C000808000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000BF000000BF00FFFFFF000000000080000000FF000000FF0000000080
      800000808000008080000080800000808000008080000080800000808000FF00
      000080000000FF00000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      000080800000FFFFFF00FFFF0000FFFFFF00000000008080800000000000FFFF
      FF00FFFF0000C0C0C00080800000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FF000000FF000000FF0000000080
      800000808000FF000000FF00000080000000008080000080800000808000FF00
      0000FF00000080000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808000000000
      00008080000000000000C0C0C000000000008080800080808000FFFF0000FFFF
      0000C0C0C0008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF00000000808000008080000080800000808000008080000080
      800080000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080800000C0C0
      C000FFFF0000808080008080800000000000FFFF0000FFFF0000C0C0C0008080
      0000808000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000FF0000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000C0C0C000FFFF0000FFFFFF00FFFF0000C0C0C00080800000808000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      80000080800000808000FF000000FF00000000808000FF000000008080000080
      8000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808000008080000080800000808000008080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      800000808000FF000000FF00000080000000FF00000080000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000080000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000F8FFFFFFF83F0000
      E03F8000E00F0000800F8000C007000000038000800300000001800080030000
      00008000000100008000800000010000C000800000010000E000800000010000
      E001800000010000C003800080030000C007FFFF80030000E01FFFFFC0070000
      F07FFFFFE00F0000FFFFFFFFF83F000000000000000000000000000000000000
      000000000000}
  end
end
