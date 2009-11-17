object AdressBuchForm: TAdressBuchForm
  Left = 364
  Top = 148
  Width = 695
  Height = 624
  BorderIcons = [biSystemMenu]
  Caption = 'Adressbuch'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 687
    Height = 578
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object KunToolbar: TToolBar
      Left = 0
      Top = 533
      Width = 687
      Height = 26
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 88
      Caption = 'KunToolbar'
      EdgeBorders = []
      Flat = True
      Images = ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 0
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
        OnChange = SuchBegChange
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
        ImageIndex = 0
        Visible = False
        OnClick = UebernahmeBtnClick
      end
    end
    object SB1: TStatusBar
      Left = 0
      Top = 559
      Width = 687
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
          Width = 150
        end
        item
          Text = 'erstellt'
          Width = 120
        end
        item
          Text = 'geaend'
          Width = 120
        end>
      UseSystemFont = False
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 687
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      TabOrder = 2
      object AllgBtn: TJvSpeedButton
        Tag = 1
        Left = 372
        Top = 0
        Width = 63
        Height = 22
        Caption = 'Allgemein'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
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
        OnClick = AllgBtnClick
      end
      object ListeBtn: TJvSpeedButton
        Tag = 3
        Left = 540
        Top = 0
        Width = 45
        Height = 22
        Caption = 'Liste'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        ParentFont = False
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
        OnClick = AllgBtnClick
      end
      object ASPBtn: TJvSpeedButton
        Tag = 2
        Left = 435
        Top = 0
        Width = 105
        Height = 22
        Caption = 'Ansprechpartner'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        ParentFont = False
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
        OnClick = AllgBtnClick
      end
    end
    object ADDR_PC: TJvPageControl
      Left = 0
      Top = 26
      Width = 687
      Height = 507
      ActivePage = Allg_TS
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
        object InfoGB: TOFGroupBox
          Left = 0
          Top = 256
          Width = 687
          Height = 228
          Align = alClient
          Caption = 'Info'
          Color = 14680063
          Ctl3D = False
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 0
          object InfoMemo: TDBMemo
            Left = 8
            Top = 21
            Width = 671
            Height = 199
            Hint = 'Zeilenumbruch mit Strg+Enter'
            Align = alClient
            DataField = 'INFO'
            DataSource = KS_DS
            ScrollBars = ssVertical
            TabOrder = 0
            OnEnter = matchEnter
            OnExit = matchExit
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 687
          Height = 256
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object KunAlgLeftPan: TPanel
            Left = 0
            Top = 0
            Width = 428
            Height = 256
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object AnschriftGB: TOFGroupBox
              Left = 0
              Top = 68
              Width = 428
              Height = 188
              Align = alClient
              Caption = 'Anschrift'
              Color = 14680063
              Ctl3D = False
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentColor = False
              ParentCtl3D = False
              TabOrder = 1
              object LandPLZPostfLab: TLabel
                Left = 5
                Top = 165
                Width = 79
                Height = 13
                AutoSize = False
                Caption = 'Land/Plz/Postf.:'
              end
              object LandPLZOrtLab: TLabel
                Left = 5
                Top = 145
                Width = 79
                Height = 13
                AutoSize = False
                Caption = 'Land/Plz/Ort:'
              end
              object StrasseLab: TLabel
                Left = 5
                Top = 125
                Width = 79
                Height = 13
                AutoSize = False
                Caption = 'Strasse:'
                FocusControl = strasse
              end
              object AbteilungLab: TLabel
                Left = 5
                Top = 105
                Width = 79
                Height = 13
                AutoSize = False
                Caption = 'z.Hd. von:'
                FocusControl = abteilung
              end
              object Name3Lab: TLabel
                Left = 5
                Top = 85
                Width = 79
                Height = 13
                AutoSize = False
                Caption = 'Name 3:'
                FocusControl = name3
              end
              object Name2Lab: TLabel
                Left = 5
                Top = 66
                Width = 79
                Height = 13
                AutoSize = False
                Caption = 'Name 2:'
                FocusControl = name2
              end
              object Name1Lab: TJvLabel
                Left = 5
                Top = 46
                Width = 79
                Height = 13
                AutoSize = False
                Caption = 'Name 1:'
                FocusControl = name1
                HotTrackFont.Charset = DEFAULT_CHARSET
                HotTrackFont.Color = clBlue
                HotTrackFont.Height = -11
                HotTrackFont.Name = 'MS Sans Serif'
                HotTrackFont.Style = [fsUnderline]
              end
              object Label3: TLabel
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
                Width = 334
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
                Width = 334
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
                Width = 334
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
                Width = 334
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
                Width = 334
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
                Width = 254
                Height = 19
                AutoSelect = False
                ButtonHint = 'Ortsverzeichnis aufrufen'
                DataField = 'ORT'
                DataSource = KS_DS
                ImageKind = ikEllipsis
                ButtonWidth = 16
                TabOrder = 8
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object Postfach: TJvDBComboEdit
                Tag = 2
                Left = 166
                Top = 162
                Width = 254
                Height = 19
                AutoSelect = False
                ButtonHint = 'Ortsverzeichnis aufrufen'
                DataField = 'POSTFACH'
                DataSource = KS_DS
                ImageKind = ikEllipsis
                ButtonWidth = 16
                TabOrder = 11
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
                Width = 334
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
            end
            object SuchbegrGB: TOFGroupBox
              Left = 0
              Top = 0
              Width = 428
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
                Width = 169
                Height = 19
                AutoSelect = False
                AutoSize = False
                DataField = 'KUNNUM2'
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
                Width = 334
                Height = 19
                AutoSelect = False
                AutoSize = False
                DataField = 'MATCHCODE'
                DataSource = KS_DS
                TabOrder = 0
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
            end
          end
          object KunAlgRightPan: TPanel
            Left = 428
            Top = 0
            Width = 259
            Height = 256
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object KommunikationGB: TOFGroupBox
              Left = 0
              Top = 0
              Width = 259
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
                Width = 196
                Height = 19
                AutoSelect = False
                ButtonHint = 'anrufen ('#252'ber Tapi)'
                DataField = 'TELE1'
                DataSource = KS_DS
                ButtonWidth = 20
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object tele2: TJvDBComboEdit
                Tag = 1
                Left = 55
                Top = 43
                Width = 196
                Height = 19
                AutoSelect = False
                ButtonHint = 'anrufen ('#252'ber Tapi)'
                DataField = 'TELE2'
                DataSource = KS_DS
                ButtonWidth = 20
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object fax: TDBEdit
                Tag = 1
                Left = 55
                Top = 65
                Width = 196
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
                Width = 196
                Height = 19
                AutoSelect = False
                ButtonHint = 'neue EMail mit dieser Adresse erstellen'
                DataField = 'EMAIL'
                DataSource = KS_DS
                ButtonWidth = 20
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object internet: TJvDBComboEdit
                Tag = 1
                Left = 55
                Top = 154
                Width = 196
                Height = 19
                AutoSelect = False
                ButtonHint = 'Internetseite aufrufen'
                DataField = 'INTERNET'
                DataSource = KS_DS
                ParentShowHint = False
                ShowHint = True
                TabOrder = 6
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object divers1: TDBEdit
                Tag = 1
                Left = 55
                Top = 178
                Width = 196
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
                Width = 196
                Height = 19
                AutoSelect = False
                ButtonHint = 'anrufen ('#252'ber Tapi)'
                DataField = 'FUNK'
                DataSource = KS_DS
                ButtonWidth = 20
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object email2: TJvDBComboEdit
                Tag = 1
                Left = 55
                Top = 132
                Width = 196
                Height = 19
                AutoSelect = False
                ButtonHint = 'neue EMail mit dieser Adresse erstellen'
                DataField = 'EMAIL2'
                DataSource = KS_DS
                ButtonWidth = 20
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
            end
            object DatumGB: TOFGroupBox
              Left = 0
              Top = 204
              Width = 259
              Height = 52
              Align = alClient
              Caption = 'Daten'
              Color = 14680063
              Ctl3D = False
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentColor = False
              ParentCtl3D = False
              TabOrder = 1
              object GebdatToOutlookLabel: TJvLabel
                Left = 5
                Top = 27
                Width = 109
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
                HotTrackFont.Charset = DEFAULT_CHARSET
                HotTrackFont.Color = clBlue
                HotTrackFont.Height = -11
                HotTrackFont.Name = 'MS Sans Serif'
                HotTrackFont.Style = [fsUnderline]
              end
              object GebDat: TJvDBDateEdit
                Tag = 1
                Left = 114
                Top = 24
                Width = 137
                Height = 19
                DataField = 'KUN_GEBDATUM'
                DataSource = KS_DS
                AutoSelect = False
                YearDigits = dyFour
                TabOrder = 0
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyPress = matchKeyPress
                OnKeyDown = matchKeyDown
              end
            end
          end
        end
      end
      object ASP_TS: TTabSheet
        Tag = 2
        Caption = 'Ansprechpartner'
        ImageIndex = 8
        object Panel5: TPanel
          Left = 0
          Top = 68
          Width = 687
          Height = 220
          Align = alTop
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 0
          object AspAlgGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 433
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
              Width = 339
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
              Width = 339
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
              Width = 339
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
              Width = 339
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
              Width = 339
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
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object APOrt: TJvDBComboEdit
              Tag = 2
              Left = 166
              Top = 124
              Width = 259
              Height = 19
              AutoSelect = False
              ButtonHint = 'Ortsverzeichnis aufrufen'
              DataField = 'ORT'
              DataSource = APDS
              ImageKind = ikEllipsis
              ButtonWidth = 16
              TabOrder = 7
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object APAnrede: TVolgaDBEdit
              Tag = 1
              Left = 86
              Top = 41
              Width = 339
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
            Left = 433
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
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
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
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
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
                ButtonWidth = 20
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
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
                ButtonWidth = 20
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
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
                ButtonWidth = 20
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
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
          Width = 687
          Height = 196
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
            Width = 671
            Height = 167
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
        object AddrTopGB: TOFGroupBox
          Left = 0
          Top = 0
          Width = 687
          Height = 68
          Align = alTop
          Caption = 'Suchbegriffe'
          Color = 14680063
          Ctl3D = False
          Enabled = False
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 2
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
          end
          object DBEdit14: TDBEdit
            Tag = 1
            Left = 322
            Top = 20
            Width = 357
            Height = 19
            AutoSize = False
            DataField = 'NAME1'
            DataSource = KS_DS
            Enabled = False
            ReadOnly = True
            TabOrder = 3
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
          end
          object DBEdit7: TDBEdit
            Tag = 1
            Left = 394
            Top = 43
            Width = 285
            Height = 19
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'ORT'
            DataSource = KS_DS
            Enabled = False
            ReadOnly = True
            TabOrder = 6
          end
        end
      end
      object Such_TS: TTabSheet
        Tag = 3
        Caption = 'Liste'
        ImageIndex = 7
        object KunSuchGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 687
          Height = 484
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
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NAME1'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME2'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME3'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ABTEILUNG'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'STRASSE'
              Width = 125
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LAND'
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
              Visible = False
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
              FieldName = 'KUN_GEBDATUM'
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
  end
  object ImageList1: TImageList
    Left = 64
    Top = 333
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000E7F8000000000000
      E7F800000000000081FF00000000000081FC000000000000E7FC000000000000
      E7FF000000000000FFFC000000000000FEFC000000000000FE7F000000000000
      80130000000000008013000000000000FE7F000000000000FEF8000000000000
      FFF8000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object ImageList2: TImageList
    Left = 64
    Top = 366
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
  object MainMenu1: TJvMainMenu
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 228
    Top = 333
    object Datei1: TMenuItem
      Caption = 'Datei'
      object Schlieen1: TMenuItem
        Caption = 'Schlie'#223'en'
        ImageIndex = 44
        ShortCut = 27
        OnClick = Schlieen1Click
      end
    end
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
        OnClick = MnuSortierungClick
      end
      object Name11: TMenuItem
        Tag = 2
        Caption = '&Name1'
        Checked = True
        Default = True
        GroupIndex = 3
        RadioItem = True
        OnClick = MnuSortierungClick
      end
      object PLZOrt1: TMenuItem
        Tag = 3
        Caption = '&PLZ / Ort'
        GroupIndex = 3
        RadioItem = True
        OnClick = MnuSortierungClick
      end
      object Kundennummer1: TMenuItem
        Tag = 4
        Caption = '&Kundennummer'
        GroupIndex = 3
        RadioItem = True
        OnClick = MnuSortierungClick
      end
      object LiefNummer1: TMenuItem
        Tag = 5
        Caption = '&Lief.-Nummer'
        GroupIndex = 3
        RadioItem = True
        OnClick = MnuSortierungClick
      end
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 4
      object Allgemein1: TMenuItem
        Tag = 1
        Caption = 'Allgemein'
        Checked = True
        GroupIndex = 4
        RadioItem = True
        ShortCut = 117
        OnClick = AllgBtnClick
      end
      object Ansprechpartner1: TMenuItem
        Tag = 2
        Caption = 'Ansprechpartner'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32885
        OnClick = AllgBtnClick
      end
      object Liste1: TMenuItem
        Tag = 3
        Caption = 'Liste'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 118
        OnClick = AllgBtnClick
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
          OnClick = MnuAnichtTrefferClick
        end
        object N501: TMenuItem
          Tag = 50
          Caption = '50 Treffer'
          Checked = True
          Default = True
          GroupIndex = 12
          RadioItem = True
          OnClick = MnuAnichtTrefferClick
        end
        object N1001: TMenuItem
          Tag = 100
          Caption = '100 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = MnuAnichtTrefferClick
        end
        object N2001: TMenuItem
          Tag = 200
          Caption = '200 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = MnuAnichtTrefferClick
        end
        object N5001: TMenuItem
          Tag = 500
          Caption = '500 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = MnuAnichtTrefferClick
        end
        object alle1: TMenuItem
          Tag = 999999999
          Caption = 'alle Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = MnuAnichtTrefferClick
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
  end
  object KSQuery: TOFZQuery
    Connection = DM1.DB1
    AfterOpen = KSQueryAfterScroll
    AfterScroll = KSQueryAfterScroll
    UpdateObject = AddrUpdSQL
    OnUpdateRecord = KSQueryUpdateRecord
    BeforeInsert = KSQueryBeforeInsert
    BeforePost = KSQueryBeforePost
    AfterPost = KSQueryAfterScroll
    AfterCancel = KSQueryAfterScroll
    BeforeDelete = KSQueryBeforeDelete
    AfterDelete = KSQueryAfterScroll
    OnNewRecord = KSQueryNewRecord
    OFSecurity = DM1.CaoSecurity
    OFModulID = 0
    OFSubModulID = 0
    UseRecordLock = True
    ShowLockErrors = False
    LockIDField = 'REC_ID'
    AutoReleaseLock = False
    Params = <>
    SQL.Strings = (
      'SELECT'
      'REC_ID,KUNDENGRUPPE,MATCHCODE,ANREDE,NAME1,NAME2,NAME3,'
      'ABTEILUNG,STRASSE,LAND,PLZ,ORT,PF_PLZ,POSTFACH,EMAIL,EMAIL2,'
      'TELE1,TELE2,INTERNET,DIVERSES,INFO,ERSTELLT,ERST_NAME,'
      'GEAEND,GEAEND_NAME,KUN_GEBDATUM, KUNNUM1,KUNNUM2,FAX,FUNK,'
      'SHOP_ID,PR_EBENE,WAEHRUNG,SHOP_CHANGE_FLAG'
      'FROM ADRESSEN'
      'ORDER BY MATCHCODE'
      'LIMIT 0,200')
    Left = 124
    Top = 333
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
    object KSQueryKUNNUM1: TStringField
      DisplayLabel = 'KuNr.'
      DisplayWidth = 10
      FieldName = 'KUNNUM1'
    end
    object KSQueryKUNNUM2: TStringField
      DisplayLabel = 'Lie.-Nr.'
      FieldName = 'KUNNUM2'
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
      DisplayLabel = 'Abteilung'
      FieldName = 'ABTEILUNG'
      Size = 40
    end
    object KSQueryKUN_GEBDATUM: TDateField
      DisplayLabel = 'Gebdat.'
      FieldName = 'KUN_GEBDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object KSQuerySTRASSE: TStringField
      DisplayLabel = 'Stra'#223'e'
      FieldName = 'STRASSE'
      Size = 40
    end
    object KSQueryLAND: TStringField
      DisplayLabel = 'Land'
      FieldName = 'LAND'
      Size = 5
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
    object KSQueryINFO: TBlobField
      FieldName = 'INFO'
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
    object KSQuerySHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
    end
    object KSQueryPR_EBENE: TIntegerField
      FieldName = 'PR_EBENE'
    end
    object KSQueryWAEHRUNG: TStringField
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object KSQuerySHOP_CHANGE_FLAG: TIntegerField
      FieldName = 'SHOP_CHANGE_FLAG'
    end
  end
  object KS_DS: TDataSource
    DataSet = KSQuery
    Left = 174
    Top = 333
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = SearchTimerTimer
    Left = 295
    Top = 333
  end
  object AddrUpdSQL: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM ADRESSEN WHERE REC_ID=:REC_ID')
    InsertSQL.Strings = (
      'INSERT INTO ADRESSEN')
    ModifySQL.Strings = (
      'UPDATE ADRESSEN WHERE REC_ID=:REC_ID')
    UseSequenceFieldForRefreshSQL = False
    Left = 364
    Top = 333
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'REC_ID'
        ParamType = ptUnknown
      end>
  end
  object APTab: TZQuery
    Connection = DM1.DB1
    BeforeInsert = APTabBeforeEdit
    BeforeEdit = APTabBeforeEdit
    BeforePost = APTabBeforePost
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
    Left = 423
    Top = 333
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object APDS: TDataSource
    DataSet = APTab
    Left = 465
    Top = 333
  end
end
