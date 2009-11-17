object KFZForm: TKFZForm
  Left = 438
  Top = 111
  Width = 644
  Height = 546
  Caption = 'KFZ-Stammdaten'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object KFZPanel: TPanel
    Left = 0
    Top = 0
    Width = 636
    Height = 481
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object KFZPan: TPanel
      Left = 0
      Top = 0
      Width = 636
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object ListeTabBtn: TJvSpeedButton
        Tag = 4
        Left = 509
        Top = -1
        Width = 56
        Height = 22
        Caption = 'Liste'
        Flat = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnMouseEnter = AlgTabBtnMouseEnter
        OnMouseLeave = AlgTabBtnMouseLeave
        OnClick = AlgTabBtnClick
      end
      object HistTabBtn: TJvSpeedButton
        Tag = 3
        Left = 445
        Top = -1
        Width = 60
        Height = 22
        Caption = 'Historie'
        Flat = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnMouseEnter = AlgTabBtnMouseEnter
        OnMouseLeave = AlgTabBtnMouseLeave
        OnClick = AlgTabBtnClick
      end
      object AlgTabBtn: TJvSpeedButton
        Tag = 1
        Left = 330
        Top = -1
        Width = 66
        Height = 22
        Caption = 'Allgemein'
        Flat = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnMouseEnter = AlgTabBtnMouseEnter
        OnMouseLeave = AlgTabBtnMouseLeave
        OnClick = AlgTabBtnClick
      end
      object InfoTabBtn: TJvSpeedButton
        Tag = 2
        Left = 397
        Top = -1
        Width = 48
        Height = 22
        Caption = 'Info'
        Flat = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnMouseEnter = AlgTabBtnMouseEnter
        OnMouseLeave = AlgTabBtnMouseLeave
        OnClick = AlgTabBtnClick
      end
      object Label10: TLabel
        Left = 0
        Top = 0
        Width = 72
        Height = 21
        Align = alLeft
        Caption = '   Fahrzeuge'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
    end
    object KFZ_PC: TJvPageControl
      Left = 0
      Top = 25
      Width = 636
      Height = 430
      ActivePage = Allg_TS
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 1
      OnChange = KFZ_PCChange
      ClientBorderWidth = 0
      object Allg_TS: TTabSheet
        Tag = 1
        Caption = 'Allgemein'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 282
          Height = 407
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object SuchGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 282
            Height = 89
            Align = alTop
            Caption = 'Suchbegriffe'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 0
            object Label3: TLabel
              Left = 5
              Top = 25
              Width = 57
              Height = 13
              AutoSize = False
              Caption = 'Kennz.:'
              FocusControl = kennz
            end
            object Label4: TLabel
              Left = 5
              Top = 45
              Width = 57
              Height = 13
              AutoSize = False
              Caption = 'FGST-Nr.:'
              FocusControl = fgstnum
            end
            object KFZGruppe: TLabel
              Left = 5
              Top = 64
              Width = 44
              Height = 13
              AutoSize = False
              Caption = 'Gruppe:'
            end
            object kennz: TDBEdit
              Tag = 1
              Left = 64
              Top = 21
              Width = 210
              Height = 19
              AutoSelect = False
              CharCase = ecUpperCase
              DataField = 'POL_KENNZ'
              DataSource = KFZ_DS
              TabOrder = 0
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object fgstnum: TDBEdit
              Tag = 1
              Left = 64
              Top = 41
              Width = 210
              Height = 19
              AutoSelect = False
              CharCase = ecUpperCase
              DataField = 'FGST_NUM'
              DataSource = KFZ_DS
              TabOrder = 1
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object Kfzgr_CB: TDBLookupComboBox
              Tag = 1
              Left = 95
              Top = 61
              Width = 179
              Height = 19
              Cursor = crHandPoint
              DataField = 'GRUPPE'
              DataSource = KFZ_DS
              DropDownRows = 15
              KeyField = 'GR'
              ListField = 'LANGBEZ'
              ListSource = DM1.KFZGrDS
              TabOrder = 3
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object Kfzgr: TDBEdit
              Left = 64
              Top = 61
              Width = 33
              Height = 19
              DataField = 'GRUPPE'
              DataSource = KFZ_DS
              TabOrder = 2
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
          end
          object AlgGB: TOFGroupBox
            Left = 0
            Top = 89
            Width = 282
            Height = 187
            Align = alTop
            Caption = 'Allgemein'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 1
            object Label23: TLabel
              Left = 5
              Top = 25
              Width = 57
              Height = 13
              AutoSize = False
              Caption = 'Typ :'
              FocusControl = farbe
            end
            object Label5: TLabel
              Left = 5
              Top = 45
              Width = 57
              Height = 13
              AutoSize = False
              Caption = 'Ausf'#252'hr.:'
              FocusControl = ausfuehr
            end
            object Label6: TLabel
              Left = 5
              Top = 65
              Width = 57
              Height = 13
              AutoSize = False
              Caption = 'Motor :'
              FocusControl = motor
            end
            object Label26: TLabel
              Left = 5
              Top = 85
              Width = 57
              Height = 13
              AutoSize = False
              Caption = 'Motor-Nr. :'
              FocusControl = motor
            end
            object Label7: TLabel
              Left = 5
              Top = 105
              Width = 57
              Height = 13
              AutoSize = False
              Caption = 'Getriebe :'
              FocusControl = farbe
            end
            object Label8: TLabel
              Left = 5
              Top = 125
              Width = 57
              Height = 13
              AutoSize = False
              Caption = 'Farbe :'
              FocusControl = getriebe
            end
            object Label9: TLabel
              Left = 5
              Top = 145
              Width = 57
              Height = 13
              AutoSize = False
              Caption = 'Polster :'
              FocusControl = polster
            end
            object Label15: TLabel
              Left = 5
              Top = 164
              Width = 57
              Height = 13
              AutoSize = False
              Caption = 'KW :'
              FocusControl = kw
            end
            object Label1: TLabel
              Left = 91
              Top = 164
              Width = 22
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'PS :'
              FocusControl = kw
            end
            object Label25: TLabel
              Left = 147
              Top = 164
              Width = 59
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Hubraum :'
              FocusControl = farbe
            end
            object polster: TDBEdit
              Tag = 1
              Left = 64
              Top = 141
              Width = 210
              Height = 19
              AutoSelect = False
              DataField = 'POLSTER'
              DataSource = KFZ_DS
              TabOrder = 6
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object farbe: TDBEdit
              Tag = 1
              Left = 64
              Top = 121
              Width = 210
              Height = 19
              AutoSelect = False
              DataField = 'GETRIEBE'
              DataSource = KFZ_DS
              TabOrder = 5
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object getriebe: TDBEdit
              Tag = 1
              Left = 64
              Top = 101
              Width = 210
              Height = 19
              AutoSelect = False
              DataField = 'FARBE'
              DataSource = KFZ_DS
              TabOrder = 4
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object MotorNr: TDBEdit
              Tag = 1
              Left = 64
              Top = 81
              Width = 210
              Height = 19
              AutoSelect = False
              DataField = 'MOTOR_NR'
              DataSource = KFZ_DS
              TabOrder = 3
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object motor: TDBEdit
              Tag = 1
              Left = 64
              Top = 61
              Width = 210
              Height = 19
              AutoSelect = False
              DataField = 'MOTOR'
              DataSource = KFZ_DS
              TabOrder = 2
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object ausfuehr: TDBEdit
              Tag = 1
              Left = 64
              Top = 41
              Width = 210
              Height = 19
              AutoSelect = False
              DataField = 'AUSFUER'
              DataSource = KFZ_DS
              TabOrder = 1
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object Typ: TDBEdit
              Tag = 1
              Left = 64
              Top = 21
              Width = 210
              Height = 19
              AutoSelect = False
              DataField = 'TYP'
              DataSource = KFZ_DS
              TabOrder = 0
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object kw: TDBEdit
              Left = 64
              Top = 161
              Width = 25
              Height = 19
              AutoSelect = False
              DataField = 'KW'
              DataSource = KFZ_DS
              TabOrder = 7
              OnChange = kwChange
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object ps: TDBEdit
              Left = 115
              Top = 161
              Width = 25
              Height = 19
              AutoSelect = False
              DataField = 'PS'
              DataSource = KFZ_DS
              TabOrder = 8
              OnChange = psChange
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object Hubraum: TDBEdit
              Tag = 1
              Left = 208
              Top = 161
              Width = 66
              Height = 19
              AutoSelect = False
              DataField = 'HUBRAUM'
              DataSource = KFZ_DS
              TabOrder = 9
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
          end
          object KundeGB: TOFGroupBox
            Left = 0
            Top = 276
            Width = 282
            Height = 131
            Align = alClient
            Caption = 'Kunde'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 2
            object Label33: TLabel
              Left = 5
              Top = 25
              Width = 57
              Height = 13
              AutoSize = False
              Caption = 'Name.:'
              FocusControl = kennz
            end
            object Label34: TLabel
              Left = 5
              Top = 45
              Width = 57
              Height = 13
              AutoSize = False
              Caption = 'PLZ / Ort :'
              FocusControl = fgstnum
            end
            object DBEdit6: TDBEdit
              Left = 64
              Top = 44
              Width = 17
              Height = 19
              AutoSelect = False
              DataField = 'LAND'
              DataSource = KFZ_DS
              Enabled = False
              ReadOnly = True
              TabOrder = 1
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object DBEdit7: TDBEdit
              Left = 82
              Top = 44
              Width = 41
              Height = 19
              AutoSelect = False
              DataField = 'PLZ'
              DataSource = KFZ_DS
              Enabled = False
              ReadOnly = True
              TabOrder = 2
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object DBEdit8: TDBEdit
              Tag = 1
              Left = 124
              Top = 44
              Width = 150
              Height = 19
              AutoSelect = False
              DataField = 'ORT'
              DataSource = KFZ_DS
              Enabled = False
              ReadOnly = True
              TabOrder = 3
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object KundeEdit: TJvDBComboEdit
              Tag = 1
              Left = 64
              Top = 22
              Width = 210
              Height = 19
              AutoSelect = False
              DataField = 'NAME1'
              DataSource = KFZ_DS
              DirectInput = False
              ImageKind = ikEllipsis
              ButtonWidth = 16
              ReadOnly = True
              TabOrder = 0
              OnButtonClick = KundeEditButtonClick
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
          end
        end
        object Panel2: TPanel
          Left = 282
          Top = 0
          Width = 271
          Height = 407
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object SchluesselGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 271
            Height = 132
            Align = alTop
            Caption = 'Schl'#252'sselnummern'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 0
            object Label27: TLabel
              Left = 5
              Top = 25
              Width = 80
              Height = 13
              AutoSize = False
              Caption = 'Schl.-Nr. zu 2. :'
            end
            object Label28: TLabel
              Left = 5
              Top = 45
              Width = 80
              Height = 13
              AutoSize = False
              Caption = 'Schl.-Nr. zu 3.'
            end
            object Label13: TLabel
              Left = 5
              Top = 110
              Width = 80
              Height = 13
              AutoSize = False
              Caption = 'Z-Schl'#252'ssel-Nr.:'
              FocusControl = zschl_nr
            end
            object Label12: TLabel
              Left = 5
              Top = 90
              Width = 80
              Height = 13
              AutoSize = False
              Caption = 'KFZ-Brief-Nr.:'
              FocusControl = kfzbr_nr
            end
            object Label11: TLabel
              Left = 5
              Top = 70
              Width = 80
              Height = 13
              AutoSize = False
              Caption = 'Schl'#252'ssel-Nr.:'
              FocusControl = scl_nr
            end
            object schl2Edi: TDBEdit
              Tag = 1
              Left = 88
              Top = 21
              Width = 175
              Height = 19
              AutoSelect = False
              DataField = 'SCHL_ZU_2'
              DataSource = KFZ_DS
              TabOrder = 0
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object schl3Edi: TDBEdit
              Tag = 1
              Left = 88
              Top = 41
              Width = 175
              Height = 19
              AutoSelect = False
              DataField = 'SCHL_ZU_3'
              DataSource = KFZ_DS
              TabOrder = 1
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object scl_nr: TDBEdit
              Tag = 1
              Left = 88
              Top = 66
              Width = 175
              Height = 19
              AutoSelect = False
              DataField = 'SCHLUES_NR'
              DataSource = KFZ_DS
              TabOrder = 2
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object kfzbr_nr: TDBEdit
              Tag = 1
              Left = 88
              Top = 86
              Width = 175
              Height = 19
              AutoSelect = False
              DataField = 'KFZBRI_NR'
              DataSource = KFZ_DS
              TabOrder = 3
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object zschl_nr: TDBEdit
              Tag = 1
              Left = 88
              Top = 106
              Width = 175
              Height = 19
              AutoSelect = False
              DataField = 'ZSCHL_NR'
              DataSource = KFZ_DS
              TabOrder = 4
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
          end
          object ReifenGB: TOFGroupBox
            Left = 0
            Top = 132
            Width = 271
            Height = 67
            Align = alTop
            Caption = 'Reifen'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 1
            object Label21: TLabel
              Left = 5
              Top = 26
              Width = 80
              Height = 13
              AutoSize = False
              Caption = 'Typ / Ausf. :'
            end
            object Label22: TLabel
              Left = 5
              Top = 45
              Width = 80
              Height = 13
              AutoSize = False
              Caption = 'Gr'#246#223'e :'
            end
            object Reifen: TDBEdit
              Tag = 1
              Left = 92
              Top = 22
              Width = 171
              Height = 19
              AutoSelect = False
              DataField = 'REIFEN'
              DataSource = KFZ_DS
              TabOrder = 0
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object ReifenGr: TDBEdit
              Tag = 1
              Left = 92
              Top = 42
              Width = 171
              Height = 19
              AutoSelect = False
              DataField = 'REIF_GR'
              DataSource = KFZ_DS
              TabOrder = 1
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
          end
          object BewDatGb: TOFGroupBox
            Left = 0
            Top = 199
            Width = 271
            Height = 208
            Align = alClient
            Caption = 'Bewegungsdaten'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 2
            object Label19: TLabel
              Left = 5
              Top = 179
              Width = 80
              Height = 13
              AutoSize = False
              Caption = 'letzter Besuch :'
            end
            object Label2: TLabel
              Left = 5
              Top = 113
              Width = 80
              Height = 13
              AutoSize = False
              Caption = 'n'#228'chste AU :'
            end
            object Label17: TLabel
              Left = 5
              Top = 91
              Width = 80
              Height = 13
              AutoSize = False
              Caption = 'n'#228'chster T'#220'V :'
            end
            object Label14: TLabel
              Left = 5
              Top = 69
              Width = 80
              Height = 13
              AutoSize = False
              Caption = 'KM-Stand :'
              FocusControl = kmstand
            end
            object Label30: TLabel
              Left = 5
              Top = 26
              Width = 80
              Height = 13
              AutoSize = False
              Caption = 'Baujahr :'
              FocusControl = baujahr
            end
            object Label32: TLabel
              Left = 5
              Top = 47
              Width = 80
              Height = 13
              AutoSize = False
              Caption = 'Tag d. Erstzul. :'
            end
            object Label35: TLabel
              Left = 5
              Top = 135
              Width = 80
              Height = 13
              AutoSize = False
              Caption = 'n'#228'chste SP :'
            end
            object Label36: TLabel
              Left = 5
              Top = 157
              Width = 80
              Height = 13
              AutoSize = False
              Caption = 'n'#228'chste TP :'
            end
            object NextAUEdi: TJvDBDateEdit
              Tag = 1
              Left = 88
              Top = 110
              Width = 175
              Height = 19
              DataField = 'NAE_AU'
              DataSource = KFZ_DS
              AutoSelect = False
              NumGlyphs = 2
              YearDigits = dyFour
              TabOrder = 4
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyPress = kennzKeyPress
              OnKeyDown = kennzKeyDown
            end
            object NextTUVEdi: TJvDBDateEdit
              Tag = 1
              Left = 88
              Top = 88
              Width = 175
              Height = 19
              DataField = 'NAE_TUEV'
              DataSource = KFZ_DS
              AutoSelect = False
              NumGlyphs = 2
              YearDigits = dyFour
              TabOrder = 3
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyPress = kennzKeyPress
              OnKeyDown = kennzKeyDown
            end
            object kmstand: TDBEdit
              Tag = 1
              Left = 88
              Top = 66
              Width = 175
              Height = 19
              AutoSelect = False
              DataField = 'KM_STAND'
              DataSource = KFZ_DS
              TabOrder = 2
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object LeBesuchEdi: TJvDBDateEdit
              Tag = 1
              Left = 88
              Top = 176
              Width = 175
              Height = 19
              DataField = 'LE_BESUCH'
              DataSource = KFZ_DS
              AutoSelect = False
              NumGlyphs = 2
              YearDigits = dyFour
              TabOrder = 7
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyPress = kennzKeyPress
              OnKeyDown = kennzKeyDown
            end
            object baujahr: TDBEdit
              Tag = 1
              Left = 88
              Top = 22
              Width = 175
              Height = 19
              AutoSelect = False
              DataField = 'HERSTELLUNG'
              DataSource = KFZ_DS
              TabOrder = 0
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object Zulassungsdatum: TJvDBDateEdit
              Tag = 1
              Left = 88
              Top = 44
              Width = 175
              Height = 19
              DataField = 'ZULASSUNG'
              DataSource = KFZ_DS
              AutoSelect = False
              NumGlyphs = 2
              YearDigits = dyFour
              TabOrder = 1
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyPress = kennzKeyPress
              OnKeyDown = kennzKeyDown
            end
            object NextSP: TJvDBDateEdit
              Tag = 1
              Left = 88
              Top = 132
              Width = 175
              Height = 19
              DataField = 'NAE_SP'
              DataSource = KFZ_DS
              AutoSelect = False
              NumGlyphs = 2
              YearDigits = dyFour
              TabOrder = 5
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyPress = kennzKeyPress
              OnKeyDown = kennzKeyDown
            end
            object NextTP: TJvDBDateEdit
              Tag = 1
              Left = 88
              Top = 154
              Width = 175
              Height = 19
              DataField = 'NAE_TP'
              DataSource = KFZ_DS
              AutoSelect = False
              NumGlyphs = 2
              YearDigits = dyFour
              TabOrder = 6
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyPress = kennzKeyPress
              OnKeyDown = kennzKeyDown
            end
          end
        end
        object CaoGroupBox5: TOFGroupBox
          Left = 553
          Top = 0
          Width = 83
          Height = 407
          Align = alClient
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 2
        end
      end
      object Notiz_TS: TTabSheet
        Tag = 2
        Caption = 'Notizen'
        ImageIndex = 3
        object CaoGroupBox1: TOFGroupBox
          Left = 0
          Top = 0
          Width = 634
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
          TabOrder = 0
          object Label18: TLabel
            Left = 5
            Top = 25
            Width = 57
            Height = 13
            AutoSize = False
            Caption = 'Kennz.:'
            FocusControl = DBEdit1
          end
          object Label20: TLabel
            Left = 5
            Top = 45
            Width = 57
            Height = 13
            AutoSize = False
            Caption = 'FGST-Nr.:'
            FocusControl = DBEdit2
          end
          object DBEdit1: TDBEdit
            Tag = 1
            Left = 64
            Top = 21
            Width = 562
            Height = 19
            AutoSelect = False
            DataField = 'POL_KENNZ'
            DataSource = KFZ_DS
            TabOrder = 0
            OnEnter = LeBesuchEdiEnter
            OnExit = LeBesuchEdiExit
            OnKeyDown = kennzKeyDown
            OnKeyPress = kennzKeyPress
          end
          object DBEdit2: TDBEdit
            Tag = 1
            Left = 64
            Top = 41
            Width = 562
            Height = 19
            AutoSelect = False
            DataField = 'FGST_NUM'
            DataSource = KFZ_DS
            TabOrder = 1
            OnEnter = LeBesuchEdiEnter
            OnExit = LeBesuchEdiExit
            OnKeyDown = kennzKeyDown
            OnKeyPress = kennzKeyPress
          end
        end
        object CaoGroupBox3: TOFGroupBox
          Left = 0
          Top = 68
          Width = 634
          Height = 340
          Align = alClient
          Caption = 'Info'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 1
          object AddrNotiz: TDBMemo
            Left = 8
            Top = 21
            Width = 618
            Height = 311
            Hint = 'Zeilenumbruch mit Strg+Enter'
            Align = alClient
            Ctl3D = False
            DataField = 'INFO'
            DataSource = KFZ_DS
            ParentCtl3D = False
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      object Hist_TS: TTabSheet
        Tag = 3
        Caption = 'Historie'
        ImageIndex = 6
        object CaoGroupBox2: TOFGroupBox
          Left = 0
          Top = 0
          Width = 636
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
          TabOrder = 0
          object Label24: TLabel
            Left = 5
            Top = 25
            Width = 57
            Height = 13
            AutoSize = False
            Caption = 'Kennz.:'
            FocusControl = DBEdit3
          end
          object Label29: TLabel
            Left = 5
            Top = 45
            Width = 57
            Height = 13
            AutoSize = False
            Caption = 'FGST-Nr.:'
            FocusControl = DBEdit4
          end
          object DBEdit3: TDBEdit
            Tag = 1
            Left = 64
            Top = 21
            Width = 562
            Height = 19
            AutoSelect = False
            DataField = 'POL_KENNZ'
            DataSource = KFZ_DS
            TabOrder = 0
            OnEnter = LeBesuchEdiEnter
            OnExit = LeBesuchEdiExit
            OnKeyDown = kennzKeyDown
            OnKeyPress = kennzKeyPress
          end
          object DBEdit4: TDBEdit
            Tag = 1
            Left = 64
            Top = 41
            Width = 562
            Height = 19
            AutoSelect = False
            DataField = 'FGST_NUM'
            DataSource = KFZ_DS
            TabOrder = 1
            OnEnter = LeBesuchEdiEnter
            OnExit = LeBesuchEdiExit
            OnKeyDown = kennzKeyDown
            OnKeyPress = kennzKeyPress
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 68
          Width = 636
          Height = 36
          Align = alTop
          BevelOuter = bvNone
          BorderWidth = 3
          TabOrder = 1
          object ToolBar99: TToolBar
            Left = 3
            Top = 3
            Width = 630
            Height = 30
            Align = alClient
            BorderWidth = 1
            Caption = 'ToolBar99'
            Color = 14680063
            EdgeBorders = []
            ParentColor = False
            TabOrder = 0
            object Label60: TLabel
              Left = 0
              Top = 2
              Width = 35
              Height = 22
              Alignment = taRightJustify
              AutoSize = False
              Caption = '&Jahr : '
              Layout = tlCenter
            end
            object JahrCB: TComboBox
              Left = 35
              Top = 2
              Width = 98
              Height = 21
              Style = csDropDownList
              ItemHeight = 0
              TabOrder = 0
              OnChange = JahrCBChange
            end
            object ToolButton5: TToolButton
              Left = 133
              Top = 2
              Width = 8
              Caption = 'ToolButton3'
              ImageIndex = 1
              Style = tbsSeparator
            end
            object OPOSViewBtn: TSpeedButton
              Left = 141
              Top = 2
              Width = 65
              Height = 22
              AllowAllUp = True
              GroupIndex = 100
              Caption = 'OPOS'
              Flat = True
              Transparent = False
              OnClick = JahrCBChange
            end
            object ToolButton1: TToolButton
              Left = 206
              Top = 2
              Width = 8
              Caption = 'ToolButton1'
              Style = tbsSeparator
            end
            object ArtikelViewBtn: TSpeedButton
              Left = 214
              Top = 2
              Width = 65
              Height = 22
              AllowAllUp = True
              GroupIndex = 101
              Caption = 'Artikel'
              Flat = True
              Transparent = False
              OnClick = JahrCBChange
            end
          end
        end
        object CaoGroupBox6: TOFGroupBox
          Left = 0
          Top = 104
          Width = 636
          Height = 265
          Align = alClient
          Caption = 'Liste'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 2
          object JourPosGrid: TOFDBGrid
            Left = 8
            Top = 138
            Width = 618
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
          object RxSplitter1: TJvxSplitter
            Left = 8
            Top = 133
            Width = 618
            Height = 5
            ControlFirst = JournalGrid
            ControlSecond = JourPosGrid
            Align = alBottom
            BevelInner = bvLowered
          end
          object JournalGrid: TOFDBGrid
            Left = 8
            Top = 21
            Width = 618
            Height = 112
            Align = alClient
            BorderStyle = bsNone
            DataSource = JourTabDS
            DefaultDrawing = False
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
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
            RowColor1 = 14680063
            RowColor2 = clWindow
            ShowTitleEllipsis = True
            RowSizingAllowed = True
            DefaultRowHeight = 16
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
                FieldName = 'KUN_NAME1'
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
        end
        object HistSumBar: TStatusBar
          Left = 0
          Top = 369
          Width = 636
          Height = 19
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Panels = <
            item
              Bevel = pbNone
              Text = 'OFFEN'
              Width = 40
            end
            item
              Alignment = taRightJustify
              Text = '0,00 DM'
              Width = 100
            end
            item
              Bevel = pbNone
              Text = 'BEZAHLT'
              Width = 55
            end
            item
              Alignment = taRightJustify
              Text = '0,00 DM'
              Width = 100
            end
            item
              Bevel = pbNone
              Text = 'GESAMT'
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
          Top = 388
          Width = 636
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
      end
      object List_TS: TTabSheet
        Tag = 4
        Caption = 'Liste'
        ImageIndex = 5
        object KFZ_GRD: TOFDBGrid
          Left = 0
          Top = 0
          Width = 634
          Height = 408
          Align = alClient
          DataSource = KFZ_DS
          DefaultDrawing = False
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnTitleClick = KFZ_GRDTitleClick
          AutoAppend = False
          TitleButtons = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 24
          TitleRowHeight = 24
          DisplayDateTime = False
          RowColor1 = 12255087
          RowColor2 = clWindow
          ShowTitleEllipsis = True
          DefaultRowHeight = 16
          EditColor = clBlack
          Columns = <
            item
              Expanded = False
              FieldName = 'POL_KENNZ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FGST_NUM'
              Title.Caption = 'Fahrgestell-Nr.'
              Width = 129
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HERSTELLUNG'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HUBRAUM'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KW'
              Width = 26
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PS'
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KM_STAND'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SCHL_ZU_2'
              Title.Caption = 'Schl.-Nr. zu 2.'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SCHL_ZU_3'
              Title.Caption = 'Schl.-Nr. zu 3.'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KFZBRI_NR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZULASSUNG'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LE_BESUCH'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAE_TUEV'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAE_AU'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UMSATZ_GES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UMSATZ_GAR'
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
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'STRASSE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'LAND'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PLZ'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ORT'
              Visible = False
            end>
        end
      end
    end
    object KFZToolBar: TToolBar
      Left = 0
      Top = 455
      Width = 636
      Height = 26
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 88
      Caption = 'KFZToolBar'
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = MainForm.ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 2
      Wrapable = False
      object DBNavigator2: TDBNavigator
        Left = 0
        Top = 0
        Width = 192
        Height = 22
        DataSource = KFZ_DS
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
        Flat = True
        ConfirmDelete = False
        TabOrder = 0
      end
      object Label52: TLabel
        Left = 192
        Top = 0
        Width = 50
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Suchfeld'
        Layout = tlCenter
      end
      object SuchFeldCB: TComboBox
        Left = 242
        Top = 0
        Width = 92
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnChange = SuchbegChange
        Items.Strings = (
          'Kennzeichen'
          'Fahrgestell-Nr.'
          'Kunden-Nr.'
          'Name des Kunden')
      end
      object Label31: TLabel
        Left = 334
        Top = 0
        Width = 64
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = '&Suchbegriff'
        FocusControl = Suchbeg
        Layout = tlCenter
      end
      object Suchbeg: TEdit
        Left = 398
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
        OnKeyPress = SuchbegKeyPress
      end
      object ToolButton6: TToolButton
        Left = 498
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object UebernahmeBtn: TToolButton
        Left = 506
        Top = 0
        AutoSize = True
        Caption = #220'&bernahme'
        ImageIndex = 22
        Visible = False
        OnClick = UebernahmeBtnClick
      end
    end
  end
  object SB1: TStatusBar
    Left = 0
    Top = 481
    Width = 636
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
  end
  object MainMenu1: TJvMainMenu
    Images = MainForm.ImageList1
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 133
    Top = 129
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Neu1: TMenuItem
        Caption = '&Neu'
        GroupIndex = 2
        ImageIndex = 23
        ShortCut = 16462
      end
      object Lschen1: TMenuItem
        Caption = '&L'#246'schen'
        GroupIndex = 2
        ImageIndex = 6
        ShortCut = 16430
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
    end
    object Sortierung1: TMenuItem
      Caption = '&Sortierung'
      GroupIndex = 3
      object Match1: TMenuItem
        Tag = 1
        Caption = '&Kennzeichen'
        Checked = True
        Default = True
        GroupIndex = 3
        RadioItem = True
        OnClick = LiefNummer1Click
      end
      object Name11: TMenuItem
        Tag = 2
        Caption = '&Fahrgestellnummer'
        GroupIndex = 3
        RadioItem = True
        OnClick = LiefNummer1Click
      end
      object PLZOrt1: TMenuItem
        Tag = 3
        Caption = '&Kundennummer'
        GroupIndex = 3
        RadioItem = True
        OnClick = LiefNummer1Click
      end
    end
    object MnuPrint: TMenuItem
      Caption = 'Drucken'
      GroupIndex = 3
      object MnuPrintKFZ: TMenuItem
        Caption = 'Fahrzeug'
        ImageIndex = 11
        OnClick = MnuPrintKFZClick
      end
      object MnuPrintKFZListe: TMenuItem
        Caption = 'Fahrzeug-Liste'
        ImageIndex = 11
        OnClick = MnuPrintKFZListeClick
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
        OnClick = AlgTabBtnClick
      end
      object Info1: TMenuItem
        Tag = 2
        Caption = 'Info'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32887
        OnClick = AlgTabBtnClick
      end
      object Historie1: TMenuItem
        Tag = 3
        Caption = 'Historie'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32888
        OnClick = AlgTabBtnClick
      end
      object Liste1: TMenuItem
        Tag = 4
        Caption = 'Liste'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 118
        OnClick = AlgTabBtnClick
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
  end
  object KFZ_DS: TDataSource
    DataSet = KFZTab
    OnDataChange = KFZ_DSDataChange
    Left = 165
    Top = 165
  end
  object KFZTab: TOFZQuery
    Connection = DM1.DB1
    AfterOpen = KFZTabAfterScroll
    AfterScroll = KFZTabAfterScroll
    AfterPost = KFZTabAfterScroll
    BeforeDelete = KFZTabBeforeDelete
    AfterDelete = KFZTabAfterScroll
    OFSecurity = DM1.CaoSecurity
    OFModulID = 1030
    OFSubModulID = 0
    UseRecordLock = False
    ShowLockErrors = False
    AutoReleaseLock = False
    Params = <>
    SQL.Strings = (
      
        'select KFZ.*, AD.ANREDE, AD.NAME1, AD.NAME2, AD.NAME3, AD.STRASS' +
        'E, AD.PLZ, AD.ORT, AD.LAND'
      'from KFZ'
      'left outer join ADRESSEN as AD on KFZ.ADDR_ID=AD.REC_ID')
    Left = 132
    Top = 165
    object KFZTabKFZ_ID: TIntegerField
      FieldName = 'KFZ_ID'
    end
    object KFZTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
    end
    object KFZTabKFZ_GRUPPE: TIntegerField
      FieldName = 'KFZ_GRUPPE'
    end
    object KFZTabPOL_KENNZ: TStringField
      DisplayLabel = 'Kennzeichen'
      FieldName = 'POL_KENNZ'
      Required = True
      Size = 10
    end
    object KFZTabFGST_NUM: TStringField
      DisplayLabel = 'Fahrgest.-Nr.'
      FieldName = 'FGST_NUM'
      Required = True
    end
    object KFZTabTYP_ID: TIntegerField
      FieldName = 'TYP_ID'
    end
    object KFZTabTYP: TStringField
      DisplayLabel = 'Typ'
      FieldName = 'TYP'
      Size = 10
    end
    object KFZTabAUSFUER: TStringField
      DisplayLabel = 'Ausf'#252'hrung'
      FieldName = 'AUSFUER'
      Size = 10
    end
    object KFZTabART_ID: TIntegerField
      FieldName = 'ART_ID'
    end
    object KFZTabFABRIKAT_ID: TIntegerField
      FieldName = 'FABRIKAT_ID'
    end
    object KFZTabKRAFTSTOFF_ID: TIntegerField
      FieldName = 'KRAFTSTOFF_ID'
    end
    object KFZTabGRUPPE: TIntegerField
      DisplayLabel = 'Gruppe'
      FieldName = 'GRUPPE'
    end
    object KFZTabSCHLUES_NR: TStringField
      DisplayLabel = 'Schl'#252'ssel-Nr.'
      FieldName = 'SCHLUES_NR'
      Size = 10
    end
    object KFZTabZSCHL_NR: TStringField
      DisplayLabel = 'Z'#252'ndschl'#252'ssel-Nr.'
      FieldName = 'ZSCHL_NR'
      Size = 10
    end
    object KFZTabMOTOR_NR: TStringField
      DisplayLabel = 'Motor-Nr.'
      FieldName = 'MOTOR_NR'
    end
    object KFZTabKFZBRI_NR: TStringField
      DisplayLabel = 'KFZ-Brief'
      FieldName = 'KFZBRI_NR'
      Size = 15
    end
    object KFZTabMOTOR: TStringField
      DisplayLabel = 'Motor'
      FieldName = 'MOTOR'
      Size = 15
    end
    object KFZTabGETRIEBE: TStringField
      DisplayLabel = 'Getriebe'
      FieldName = 'GETRIEBE'
      Size = 10
    end
    object KFZTabKW: TIntegerField
      FieldName = 'KW'
    end
    object KFZTabPS: TIntegerField
      FieldName = 'PS'
    end
    object KFZTabKM_STAND: TIntegerField
      DisplayLabel = 'KM-Stand'
      FieldName = 'KM_STAND'
      DisplayFormat = ',#0'
      EditFormat = '0'
    end
    object KFZTabHUBRAUM: TIntegerField
      DisplayLabel = 'Hubraum'
      FieldName = 'HUBRAUM'
    end
    object KFZTabREIFEN: TStringField
      DisplayLabel = 'Reifen'
      FieldName = 'REIFEN'
      Size = 10
    end
    object KFZTabREIF_GR: TStringField
      DisplayLabel = 'Reifen-Gr'#246#223'e'
      FieldName = 'REIF_GR'
      Size = 10
    end
    object KFZTabFARBE: TStringField
      DisplayLabel = 'Farbe'
      FieldName = 'FARBE'
      Size = 10
    end
    object KFZTabPOLSTER: TStringField
      DisplayLabel = 'Polster'
      FieldName = 'POLSTER'
      Size = 10
    end
    object KFZTabZULASSUNG: TDateField
      DisplayLabel = 'Zulassungstag'
      FieldName = 'ZULASSUNG'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object KFZTabHERSTELLUNG: TDateField
      DisplayLabel = 'Baujahr'
      DisplayWidth = 7
      FieldName = 'HERSTELLUNG'
      DisplayFormat = 'mm.yyyy'
      EditMask = '90/90/0000'
    end
    object KFZTabKAUFDATUM: TDateField
      FieldName = 'KAUFDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object KFZTabLE_BESUCH: TDateField
      DisplayLabel = 'le. Besuch'
      FieldName = 'LE_BESUCH'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object KFZTabNAE_TUEV: TDateField
      DisplayLabel = 'n'#228'. T'#220'V'
      FieldName = 'NAE_TUEV'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object KFZTabNAE_AU: TDateField
      DisplayLabel = 'n'#228'. AU'
      FieldName = 'NAE_AU'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object KFZTabEK_PREIS: TFloatField
      FieldName = 'EK_PREIS'
    end
    object KFZTabRUESTK: TFloatField
      FieldName = 'RUESTK'
    end
    object KFZTabVK_NETTO: TFloatField
      FieldName = 'VK_NETTO'
    end
    object KFZTabMWST_PROZ: TFloatField
      FieldName = 'MWST_PROZ'
    end
    object KFZTabUMSATZ_GES: TFloatField
      DisplayLabel = 'Umsatz ges.'
      FieldName = 'UMSATZ_GES'
    end
    object KFZTabUMSATZ_GAR: TFloatField
      DisplayLabel = 'Umsatz Gar.'
      FieldName = 'UMSATZ_GAR'
    end
    object KFZTabINFO: TBlobField
      FieldName = 'INFO'
    end
    object KFZTabWKST_INFO: TBlobField
      FieldName = 'WKST_INFO'
    end
    object KFZTabSCHL_ZU_2: TStringField
      FieldName = 'SCHL_ZU_2'
    end
    object KFZTabSCHL_ZU_3: TStringField
      FieldName = 'SCHL_ZU_3'
    end
    object KFZTabNAE_SP: TDateField
      FieldName = 'NAE_SP'
    end
    object KFZTabNAE_TP: TDateField
      FieldName = 'NAE_TP'
    end
    object KFZTabANREDE: TStringField
      DisplayLabel = 'Anrede'
      FieldName = 'ANREDE'
      ReadOnly = True
      Size = 40
    end
    object KFZTabNAME1: TStringField
      DisplayLabel = 'Name'
      FieldName = 'NAME1'
      ReadOnly = True
      Size = 40
    end
    object KFZTabNAME2: TStringField
      FieldName = 'NAME2'
      ReadOnly = True
      Size = 40
    end
    object KFZTabNAME3: TStringField
      FieldName = 'NAME3'
      ReadOnly = True
      Size = 40
    end
    object KFZTabSTRASSE: TStringField
      DisplayLabel = 'Stra'#223'e'
      FieldName = 'STRASSE'
      ReadOnly = True
      Size = 40
    end
    object KFZTabPLZ: TStringField
      FieldName = 'PLZ'
      ReadOnly = True
      Size = 10
    end
    object KFZTabORT: TStringField
      DisplayLabel = 'Ort'
      FieldName = 'ORT'
      ReadOnly = True
      Size = 40
    end
    object KFZTabLAND: TStringField
      DisplayLabel = 'Land'
      FieldName = 'LAND'
      ReadOnly = True
      Size = 5
    end
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = SearchTimerTimer
    Left = 166
    Top = 130
  end
  object JourTabDS: TDataSource
    DataSet = JourTab
    Left = 165
    Top = 199
  end
  object JPosTabDS: TDataSource
    DataSet = JPosTab
    Left = 165
    Top = 232
  end
  object JourTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = JourTabAfterOpen
    AfterScroll = JourTabAfterOpen
    OnCalcFields = JourTabCalcFields
    SQL.Strings = (
      'select KFZ_ID, REC_ID, QUELLE, VRENUM, RDATUM, KUN_NAME1, '
      'ADDR_ID, KFZ_ID, KM_STAND, NSUMME, MSUMME, BSUMME, '
      'IST_BETRAG, STADIUM, PROJEKT, ORGNUM, WAEHRUNG,'
      'MWST_0, MWST_1, MWST_2, MWST_3'
      'from JOURNAL'
      'where ADDR_ID=118 and JAHR=2000'
      '')
    Params = <>
    Left = 132
    Top = 199
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
    object JourTabRDATUM: TDateField
      Alignment = taCenter
      DisplayLabel = 'Datum'
      DisplayWidth = 12
      FieldName = 'RDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object JourTabKUN_NAME1: TStringField
      DisplayLabel = 'Kunde'
      DisplayWidth = 36
      FieldName = 'KUN_NAME1'
      Size = 30
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
      'select JOURNAL_ID, QUELLE, JAHR, ARTIKEL_ID, ADDR_ID, VRENUM, '
      'BEZEICHNUNG, MATCHCODE, ARTNUM, BARCODE, MENGE,'
      'EPREIS, RABATT, STEUER_CODE'
      'from JOURNALPOS'
      'where JOURNAL_ID = 1000'
      'order by POSITION')
    Params = <>
    Left = 132
    Top = 232
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
  end
  object SumQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select STADIUM, SUM(NSUMME), SUM(MSUMME), SUM(BSUMME), WAEHRUNG'
      'from JOURNAL'
      'where ADDR_ID=118 and JAHR>=2000 and JAHR<=2000'
      'group by STADIUM, WAEHRUNG')
    Params = <>
    Left = 132
    Top = 264
  end
  object KFZUpdateSql: TZUpdateSQL
    DeleteSQL.Strings = (
      'delete from KFZ where KFZ_ID=:KFZ_ID')
    UseSequenceFieldForRefreshSQL = False
    Left = 198
    Top = 165
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'KFZ_ID'
        ParamType = ptUnknown
      end>
  end
end
