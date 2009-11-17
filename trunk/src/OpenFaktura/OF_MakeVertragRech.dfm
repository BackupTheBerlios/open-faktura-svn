object MakeVertragReForm: TMakeVertragReForm
  Left = 405
  Top = 196
  Width = 732
  Height = 589
  Caption = 'Vertrag erstellen'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  ShowHint = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object RePanel: TPanel
    Left = 0
    Top = 0
    Width = 724
    Height = 543
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object PC1: TJvPageControl
      Left = 0
      Top = 27
      Width = 724
      Height = 516
      ActivePage = EdiListTS
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = PC1Change
      OnChanging = PC1Changing
      ClientBorderWidth = 0
      object EdiListTS: TTabSheet
        Caption = 'Aus&wahl'
        ImageIndex = 4
        object ReEdiListGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 724
          Height = 459
          Align = alClient
          Ctl3D = True
          DataSource = ReEdiDS
          DefaultDrawing = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
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
          OnApplyCellAttribute = ReEdiListGridApplyCellAttribute
          Columns = <
            item
              Expanded = False
              FieldName = 'AKTIV_FLAG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VVTNUM'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_NUM'
              Title.Caption = 'Ku-Nr.'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_NAME'
              Title.Caption = 'Kunde'
              Width = 198
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROJEKT'
              Width = 196
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NSUMME'
              Title.Caption = 'Summe Netto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BSUMME'
              Title.Caption = 'Summe Brutto'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'WAEHRUNG'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DATUM_START'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATUM_ENDE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_DATUM_NEXT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ERST_NAME'
              Title.Caption = 'erstellt von'
              Width = 80
              Visible = True
            end>
        end
        object ToolBar3: TToolBar
          Left = 0
          Top = 459
          Width = 724
          Height = 34
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 98
          Caption = 'ToolBar2'
          EdgeBorders = []
          Flat = True
          Images = MainForm.VorgangImgList
          List = True
          ShowCaptions = True
          TabOrder = 1
          Wrapable = False
          object DBNavigator1: TDBNavigator
            Left = 0
            Top = 0
            Width = 185
            Height = 26
            DataSource = ReEdiDS
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
            Hints.Strings = (
              'Erster Beleg'
              'Vorheriger Beleg'
              'N'#228'chster Beleg'
              'Letzter Beleg'
              'Datensatz einf'#252'gen'
              'Datensatz l'#246'schen'
              'Datensatz bearbeiten'
              #220'bernehmen'
              'Bearbeiten abbrechen'
              'Daten aktualisieren')
            TabOrder = 0
          end
          object NewBelBtn: TToolButton
            Left = 185
            Top = 0
            AutoSize = True
            Caption = 'Neuen Beleg'
            ImageIndex = 7
            OnClick = New1BtnClick
          end
          object BelDelBtn: TToolButton
            Left = 282
            Top = 0
            AutoSize = True
            Caption = 'Beleg l'#246'schen'
            ImageIndex = 1
            OnClick = Del1BtnClick
          end
          object ReEdiBtn: TToolButton
            Left = 384
            Top = 0
            AutoSize = True
            Caption = 'Bearbeiten'
            ImageIndex = 10
            OnClick = ReEdiBtnClick
          end
        end
      end
      object AdressTS: TTabSheet
        Caption = 'All&gemein'
        object KundatGB: TOFGroupBox
          Left = 0
          Top = 0
          Width = 724
          Height = 68
          Align = alTop
          Caption = 'Kundendaten'
          Color = 14680063
          Ctl3D = False
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 0
          object Label31: TLabel
            Left = 199
            Top = 46
            Width = 78
            Height = 13
            AutoSize = False
            Caption = 'Land/Plz/Ort:'
          end
          object Label53: TLabel
            Left = 199
            Top = 23
            Width = 77
            Height = 13
            AutoSize = False
            Caption = 'Name1:'
          end
          object Label22: TLabel
            Left = 5
            Top = 46
            Width = 77
            Height = 13
            AutoSize = False
            Caption = 'Intern-Nr:'
          end
          object Label47: TLabel
            Left = 5
            Top = 23
            Width = 77
            Height = 13
            AutoSize = False
            Caption = 'Kunden-Nr:'
          end
          object Panel10: TPanel
            Left = 308
            Top = 43
            Width = 58
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 0
            object DBText6: TDBText
              Left = 3
              Top = 2
              Width = 52
              Height = 15
              DataField = 'KUN_PLZ'
              DataSource = ReEdiDS
            end
          end
          object Panel11: TPanel
            Tag = 1
            Left = 368
            Top = 43
            Width = 348
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 1
            object DBText5: TDBText
              Left = 3
              Top = 2
              Width = 158
              Height = 16
              DataField = 'KUN_ORT'
              DataSource = ReEdiDS
            end
          end
          object Panel9: TPanel
            Left = 280
            Top = 43
            Width = 24
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 2
            object DBText7: TDBText
              Left = 3
              Top = 2
              Width = 18
              Height = 16
              DataField = 'KUN_LAND'
              DataSource = ReEdiDS
            end
          end
          object Panel8: TPanel
            Tag = 1
            Left = 280
            Top = 20
            Width = 436
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 3
            object DBText4: TDBText
              Left = 3
              Top = 2
              Width = 245
              Height = 16
              DataField = 'CALC_NAME'
              DataSource = ReEdiDS
            end
          end
          object KuNrEdit: TJvDBComboEdit
            Left = 87
            Top = 20
            Width = 105
            Height = 19
            Hint = 'mit F3 gelangen Sie in die Adressauswahl'
            AutoSelect = False
            ClickKey = 114
            DataField = 'KUN_NUM'
            DataSource = ReEdiDS
            ImageKind = ikEllipsis
            ButtonWidth = 16
            TabOrder = 4
            OnButtonClick = KuNrEditButtonClick
            OnEnter = KuNrEditEnter
            OnExit = KuNrEditExit
            OnKeyDown = KuNrEditKeyDown
            OnKeyPress = KuNrEditKeyPress
          end
          object Panel2: TPanel
            Left = 87
            Top = 43
            Width = 105
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 5
            object DBText1: TDBText
              Left = 3
              Top = 2
              Width = 97
              Height = 15
              Alignment = taCenter
              DataField = 'VVTNUM'
              DataSource = ReEdiDS
            end
          end
        end
        object AlgPan3: TPanel
          Left = 0
          Top = 156
          Width = 326
          Height = 279
          Align = alLeft
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 2
          object CaoGroupBox3: TOFGroupBox
            Left = 0
            Top = 0
            Width = 326
            Height = 161
            Align = alTop
            Caption = 'Zuweisungen'
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 0
            object Label30: TLabel
              Left = 5
              Top = 134
              Width = 52
              Height = 13
              AutoSize = False
              Caption = 'Preisliste:'
            end
            object Label29: TLabel
              Left = 195
              Top = 134
              Width = 39
              Height = 13
              AutoSize = False
              Caption = 'Rabatt:'
            end
            object Label26: TLabel
              Left = 5
              Top = 24
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Versand:'
            end
            object Label15: TLabel
              Left = 5
              Top = 45
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Vertreter:'
            end
            object Label27: TLabel
              Left = 5
              Top = 68
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Zahlart:'
            end
            object Label38: TLabel
              Left = 5
              Top = 89
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'W'#228'hrung:'
            end
            object Label6: TLabel
              Left = 5
              Top = 112
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Zahlungsziel:'
            end
            object Label7: TLabel
              Left = 119
              Top = 111
              Width = 30
              Height = 13
              AutoSize = False
              Caption = 'Tage'
            end
            object Label8: TLabel
              Left = 193
              Top = 111
              Width = 39
              Height = 13
              AutoSize = False
              Caption = 'Skonto:'
            end
            object Label9: TLabel
              Left = 264
              Top = 111
              Width = 58
              Height = 13
              AutoSize = False
              Caption = 'Tage Netto'
            end
            object GlobRabatt: TDBEdit
              Tag = 1
              Left = 234
              Top = 130
              Width = 84
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'GLOBRABATT'
              DataSource = ReEdiDS
              TabOrder = 12
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object PR_EbeneCB: TJvDBComboBox
              Left = 88
              Top = 130
              Width = 46
              Height = 21
              DataField = 'PR_EBENE'
              DataSource = ReEdiDS
              ItemHeight = 13
              Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5')
              TabOrder = 11
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object VertreterCB: TDBLookupComboBox
              Tag = 1
              Left = 115
              Top = 42
              Width = 203
              Height = 19
              DataField = 'VERTRETER_ID'
              DataSource = ReEdiDS
              KeyField = 'VERTRETER_ID'
              ListField = 'NAME'
              ListSource = DM1.VertreterDS
              TabOrder = 3
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object ZahlartDB: TDBLookupComboBox
              Tag = 1
              Left = 115
              Top = 64
              Width = 203
              Height = 19
              DataField = 'ZAHLART'
              DataSource = ReEdiDS
              KeyField = 'ZAHL_ID'
              ListField = 'LANGBEZ'
              ListSource = DM1.ZahlArtDS
              TabOrder = 5
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object WaehrungCB: TDBLookupComboBox
              Tag = 1
              Left = 115
              Top = 85
              Width = 203
              Height = 19
              DataField = 'WAEHRUNG'
              DataSource = ReEdiDS
              Enabled = False
              KeyField = 'WAEHRUNG'
              ListField = 'LANGBEZ'
              ReadOnly = True
              TabOrder = 7
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object waehrung: TDBEdit
              Left = 88
              Top = 85
              Width = 28
              Height = 19
              AutoSelect = False
              DataField = 'WAEHRUNG'
              DataSource = ReEdiDS
              Enabled = False
              ReadOnly = True
              TabOrder = 6
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object Zahlart: TDBEdit
              Left = 88
              Top = 64
              Width = 28
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'ZAHLART'
              DataSource = ReEdiDS
              TabOrder = 4
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object Vertreter: TDBEdit
              Left = 88
              Top = 42
              Width = 28
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'VERTRETER_ID'
              DataSource = ReEdiDS
              TabOrder = 2
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object Versand: TDBEdit
              Left = 88
              Top = 20
              Width = 28
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'LIEFART'
              DataSource = ReEdiDS
              TabOrder = 0
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object SK_Skonto_Tage: TDBEdit
              Left = 88
              Top = 108
              Width = 28
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'SOLL_STAGE'
              DataSource = ReEdiDS
              TabOrder = 8
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object SK_Skonto_Proz: TDBEdit
              Left = 149
              Top = 108
              Width = 40
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'SOLL_SKONTO'
              DataSource = ReEdiDS
              TabOrder = 9
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object SK_Netto_Tage: TDBEdit
              Left = 234
              Top = 108
              Width = 28
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'SOLL_NTAGE'
              DataSource = ReEdiDS
              TabOrder = 10
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object VersandCB: TDBLookupComboBox
              Tag = 1
              Left = 115
              Top = 20
              Width = 203
              Height = 19
              DataField = 'LIEFART'
              DataSource = ReEdiDS
              KeyField = 'LIEF_ID'
              ListField = 'LANGBEZ'
              ListSource = DM1.LiefArtDS
              TabOrder = 1
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
          object KFZGB: TOFGroupBox
            Left = 0
            Top = 161
            Width = 326
            Height = 118
            Align = alClient
            Caption = 'Vertragsdaten'
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 1
            object Label1: TLabel
              Left = 5
              Top = 22
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Vertragsbeginn:'
            end
            object Label16: TLabel
              Left = 5
              Top = 43
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Vertragsende:'
            end
            object Label42: TLabel
              Left = 5
              Top = 64
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'n'#228'. Rechnung:'
            end
            object Label60: TLabel
              Left = 5
              Top = 85
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Intervall:'
            end
            object Label62: TLabel
              Left = 232
              Top = 24
              Width = 85
              Height = 81
              AutoSize = False
              Caption = 
                'direkt drucken, ansonsten wird die Rechn. zum bearbeiten erstell' +
                't'
              Enabled = False
              WordWrap = True
            end
            object JvDBDateEdit1: TJvDBDateEdit
              Left = 86
              Top = 21
              Width = 126
              Height = 19
              DataField = 'DATUM_START'
              DataSource = ReEdiDS
              AutoSelect = False
              NumGlyphs = 2
              YearDigits = dyFour
              TabOrder = 0
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyPress = KuNrEditKeyPress
              OnKeyDown = KuNrEditKeyDown
            end
            object JvDBDateEdit2: TJvDBDateEdit
              Left = 86
              Top = 42
              Width = 126
              Height = 19
              DataField = 'DATUM_ENDE'
              DataSource = ReEdiDS
              AutoSelect = False
              NumGlyphs = 2
              YearDigits = dyFour
              TabOrder = 1
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyPress = KuNrEditKeyPress
              OnKeyDown = KuNrEditKeyDown
            end
            object JvDBDateEdit3: TJvDBDateEdit
              Left = 86
              Top = 63
              Width = 126
              Height = 19
              DataField = 'DATUM_NEXT'
              DataSource = ReEdiDS
              AutoSelect = False
              NumGlyphs = 2
              YearDigits = dyFour
              TabOrder = 2
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyPress = KuNrEditKeyPress
              OnKeyDown = KuNrEditKeyDown
            end
            object VolgaDBEdit1: TVolgaDBEdit
              Left = 133
              Top = 84
              Width = 79
              Height = 19
              AutoDropDown = True
              ButtonWidth = 17
              ComboProps.ComboItems.Strings = (
                'Woche'
                'Monat'
                'Quartal'
                'Halbjahr'
                'Jahr')
              ComboProps.ComboValues.Strings = (
                'W'
                'M'
                'Q'
                'H'
                'J')
              DataField = 'INTERVALL'
              DataSource = ReEdiDS
              DialogStyle = vdsCombo
              Style = vcsDropDownList
              TabOrder = 4
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object JvDBSpinEdit1: TDBEdit
              Left = 86
              Top = 84
              Width = 43
              Height = 19
              DataField = 'INTERVALL_NUM'
              DataSource = ReEdiDS
              MaxLength = 3
              TabOrder = 3
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBCheckBox1: TDBCheckBox
              Left = 216
              Top = 22
              Width = 16
              Height = 17
              Caption = 'DBCheckBox1'
              DataField = 'PRINT_FLAG'
              DataSource = ReEdiDS
              TabOrder = 5
              ValueChecked = 'Wahr'
              ValueUnchecked = 'Falsch'
            end
          end
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 459
          Width = 724
          Height = 34
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 98
          Caption = 'ToolBar2'
          EdgeBorders = []
          Flat = True
          Images = MainForm.VorgangImgList
          List = True
          ShowCaptions = True
          TabOrder = 3
          Wrapable = False
          object GotoAuswahlBtn: TToolButton
            Left = 0
            Top = 0
            AutoSize = True
            Caption = 'Zur'#252'ck'
            ImageIndex = 8
            OnClick = GotoAuswahlBtnClick
          end
          object ToolButton4: TToolButton
            Left = 69
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 10
            Style = tbsSeparator
          end
          object KopfNav2: TDBNavigator
            Left = 77
            Top = 0
            Width = 185
            Height = 26
            DataSource = ReEdiDS
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
            Hints.Strings = (
              'Erster Beleg'
              'Vorheriger Beleg'
              'N'#228'chster Beleg'
              'Letzter Beleg'
              'Datensatz einf'#252'gen'
              'Datensatz l'#246'schen'
              'Datensatz bearbeiten'
              #220'bernehmen'
              'Bearbeiten abbrechen'
              'Daten aktualisieren')
            TabOrder = 0
          end
          object New1Btn: TToolButton
            Left = 262
            Top = 0
            AutoSize = True
            Caption = 'Neuen Beleg'
            ImageIndex = 7
            OnClick = New1BtnClick
          end
          object Del1Btn: TToolButton
            Left = 359
            Top = 0
            AutoSize = True
            Caption = 'Beleg l'#246'schen'
            ImageIndex = 1
            OnClick = Del1BtnClick
          end
          object ToolButton9: TToolButton
            Left = 461
            Top = 0
            Width = 8
            Caption = 'ToolButton9'
            ImageIndex = 11
            Style = tbsSeparator
          end
          object GotoPosBtn: TToolButton
            Left = 469
            Top = 0
            AutoSize = True
            Caption = 'Weiter'
            ImageIndex = 9
            OnClick = GotoPosBtnClick
          end
        end
        object AlgPan2: TPanel
          Left = 0
          Top = 68
          Width = 724
          Height = 88
          Align = alTop
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 1
          object TexteGB: TOFGroupBox
            Left = 326
            Top = 0
            Width = 398
            Height = 88
            Align = alClient
            Caption = 'Texte'
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 1
            object Label23: TLabel
              Left = 5
              Top = 22
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Projekt:'
            end
            object Label24: TLabel
              Left = 5
              Top = 44
              Width = 77
              Height = 13
              AutoSize = False
              Caption = #220'berschrift 1:'
            end
            object Label25: TLabel
              Left = 5
              Top = 63
              Width = 77
              Height = 13
              AutoSize = False
              Caption = #220'berschrift 2:'
            end
            object usr2: TDBEdit
              Tag = 1
              Left = 86
              Top = 60
              Width = 304
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'USR2'
              DataSource = ReEdiDS
              TabOrder = 2
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object usr1: TDBEdit
              Tag = 1
              Left = 86
              Top = 40
              Width = 304
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'USR1'
              DataSource = ReEdiDS
              TabOrder = 1
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object projekt: TDBEdit
              Tag = 1
              Left = 86
              Top = 20
              Width = 304
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'PROJEKT'
              DataSource = ReEdiDS
              TabOrder = 0
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
          object BestellGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 326
            Height = 88
            Align = alLeft
            Caption = 'Bestelldaten'
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 0
            object Label21: TLabel
              Left = 5
              Top = 23
              Width = 80
              Height = 13
              AutoSize = False
              Caption = 'Bestellt durch:'
            end
            object Label28: TLabel
              Left = 5
              Top = 44
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Datum:'
            end
            object Label32: TLabel
              Left = 5
              Top = 63
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Referenznr.:'
            end
            object best_num: TDBEdit
              Tag = 1
              Left = 86
              Top = 60
              Width = 232
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'ORGNUM'
              DataSource = ReEdiDS
              TabOrder = 2
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object best_datum: TJvDBDateEdit
              Tag = 1
              Left = 86
              Top = 40
              Width = 232
              Height = 19
              DataField = 'BEST_DATUM'
              DataSource = ReEdiDS
              AutoSelect = False
              NumGlyphs = 2
              YearDigits = dyFour
              TabOrder = 1
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyPress = KuNrEditKeyPress
              OnKeyDown = KuNrEditKeyDown
            end
            object best_name: TVolgaDBEdit
              Tag = 1
              Left = 86
              Top = 20
              Width = 232
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'BEST_NAME'
              DataSource = ReEdiDS
              TabOrder = 0
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
        end
        object AlgSumPanel: TPanel
          Left = 0
          Top = 435
          Width = 724
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'AlgSumPanel'
          TabOrder = 4
          object Panel17: TPanel
            Left = 0
            Top = 0
            Width = 3
            Height = 24
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel18: TPanel
            Left = 721
            Top = 0
            Width = 3
            Height = 24
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object SumPan: TPanel
            Left = 3
            Top = 0
            Width = 718
            Height = 24
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 3
            Color = 14680063
            TabOrder = 2
            object Label14: TLabel
              Left = 262
              Top = 3
              Width = 56
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Netto :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object Label17: TLabel
              Left = 418
              Top = 3
              Width = 56
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'MwSt :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object Label33: TLabel
              Left = 559
              Top = 3
              Width = 56
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Brutto :'
              Color = 14680063
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object Label55: TLabel
              Left = 3
              Top = 3
              Width = 68
              Height = 16
              Align = alLeft
              Caption = ' Summen:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object Panel27: TPanel
              Left = 615
              Top = 3
              Width = 100
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              BorderWidth = 2
              Color = 14680063
              TabOrder = 0
              object DBText15: TDBText
                Left = 2
                Top = 2
                Width = 96
                Height = 14
                Align = alClient
                Alignment = taRightJustify
                DataField = 'BSUMME'
                DataSource = ReEdiDS
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object Panel28: TPanel
              Left = 474
              Top = 3
              Width = 85
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              BorderWidth = 2
              Color = 14680063
              TabOrder = 1
              object DBText16: TDBText
                Left = 2
                Top = 2
                Width = 81
                Height = 14
                Align = alClient
                Alignment = taRightJustify
                DataField = 'MSUMME'
                DataSource = ReEdiDS
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object Panel29: TPanel
              Left = 318
              Top = 3
              Width = 100
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              BorderWidth = 2
              Color = 14680063
              TabOrder = 2
              object DBText17: TDBText
                Left = 2
                Top = 2
                Width = 96
                Height = 14
                Align = alClient
                Alignment = taRightJustify
                DataField = 'NSUMME'
                DataSource = ReEdiDS
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object Panel62: TPanel
              Left = 191
              Top = 3
              Width = 71
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              BorderWidth = 2
              Color = 14680063
              TabOrder = 3
            end
          end
        end
        object ReAllgBottomPan: TPanel
          Left = 326
          Top = 156
          Width = 398
          Height = 279
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 5
          object InfoGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 398
            Height = 279
            Align = alClient
            Caption = 'Info'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 0
            object RechInfoMemo: TDBMemo
              Left = 8
              Top = 21
              Width = 382
              Height = 250
              Hint = 'Zeilenumbruch mit Strg+Enter'
              Align = alClient
              DataField = 'INFO'
              DataSource = ReEdiDS
              ScrollBars = ssVertical
              TabOrder = 0
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
        end
      end
      object PosTS: TTabSheet
        Caption = 'P&ositionen'
        ImageIndex = 1
        object ToolBar1: TToolBar
          Left = 0
          Top = 459
          Width = 724
          Height = 34
          Align = alBottom
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 78
          Caption = 'ToolBar1'
          Color = clBtnFace
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = MainForm.VorgangImgList
          List = True
          ParentColor = False
          ShowCaptions = True
          TabOrder = 0
          Wrapable = False
          object GotoAllgBtn: TToolButton
            Left = 0
            Top = 0
            AutoSize = True
            Caption = 'Zur'#252'ck'
            ImageIndex = 8
            OnClick = GotoAllgBtnClick
          end
          object ToolButton3: TToolButton
            Left = 69
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 11
            Style = tbsSeparator
          end
          object Panel1: TPanel
            Left = 77
            Top = 0
            Width = 112
            Height = 26
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object NeuArtBtn1: TJvArrowButton
              Left = 0
              Top = 0
              Width = 112
              Height = 26
              DropDown = ArtikelPopupMenu
              Caption = 'Artikel hinzu'
              Flat = True
              FillFont.Charset = DEFAULT_CHARSET
              FillFont.Color = clWindowText
              FillFont.Height = -11
              FillFont.Name = 'MS Sans Serif'
              FillFont.Style = []
              Glyph.Data = {
                66010000424D6601000000000000760000002800000014000000140000000100
                040000000000F000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888800008888888888888888888800008888777777778888888800008800
                00000000788888880000880BFFFBFFF0777777880000880F444444F000000078
                0000880FFBFFFBF0FBFFF0780000880F444444F04444F0780000880BFFFBFFF0
                FFFBF0780000880F444444F04444F0780000880FFBFFFBF0FBFFF0780000880F
                44F000004477F0780000880BFFF0FFF0FF0007780000880F44F0FB00F70A0778
                0000880FFBF0F0FF000A00080000880000000F470AAAAA080000888888880FFB
                000A00080000888888880000770A088800008888888888888800088800008888
                88888888888888880000}
              Spacing = -1
              OnClick = NeuArtBtnClick
            end
          end
          object DelBtn: TToolButton
            Left = 189
            Top = 0
            Hint = 'Position l'#246'schen'
            AutoSize = True
            Caption = '&L'#246'schen'
            ImageIndex = 6
            OnClick = DelBtnClick
          end
          object UpBtn: TToolButton
            Left = 265
            Top = 0
            Hint = 'Position nach oben verschieben'
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 3
            OnClick = UpBtnClick
          end
          object DownBtn: TToolButton
            Left = 321
            Top = 0
            Hint = 'Position nach unten verschieben'
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 4
            OnClick = DownBtnClick
          end
          object DBNavigator3: TDBNavigator
            Left = 377
            Top = 0
            Width = 120
            Height = 26
            DataSource = PosDS
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
            Flat = True
            Hints.Strings = (
              'Erste Position'
              'Vorherige Position'
              'N'#228'chste Position'
              'Letzte Position'
              'Datensatz einf'#252'gen'
              'Datensatz l'#246'schen'
              'Datensatz bearbeiten'
              #220'bernehmen'
              'Bearbeiten abbrechen'
              'Daten aktualisieren')
            TabOrder = 0
          end
          object ToolButton2: TToolButton
            Left = 497
            Top = 0
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 10
            Style = tbsSeparator
          end
          object GotoFertigBtn: TToolButton
            Left = 505
            Top = 0
            AutoSize = True
            Caption = 'Weiter'
            ImageIndex = 9
            OnClick = GotoFertigBtnClick
          end
        end
        object CaoGroupBox8: TOFGroupBox
          Left = 0
          Top = 68
          Width = 724
          Height = 340
          Align = alClient
          Caption = 'Positionen'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 1
          object PosGrid: TExRxDBGrid
            Left = 8
            Top = 21
            Width = 708
            Height = 311
            Align = alClient
            BorderStyle = bsNone
            Ctl3D = False
            DataSource = PosDS
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete]
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnKeyDown = PosGridKeyDown
            OnKeyPress = PosGridKeyPress
            OnShowEditor = PosGridShowEditor
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 24
            TitleRowHeight = 24
            Controls = <>
            ScrollBars = ssHorizontal
            EditColor = 10485663
            DefaultRowHeight = 51
            RowSizingAllowed = True
            OnApplyCellAttribute = PosGridApplyCellAttribute
            GridAutoWidthOnResize = False
            RowColor1 = 12255087
            RowColor2 = clWindow
            UseRowColors = True
            MultiLineTitles = True
            AllowAutoAppend = False
            DrawFocusRect = False
            HighlightColor = clNavy
            ImageHighlightColor = clWindow
            HighlightFontColor = clWhite
            HotTrackColor = clNavy
            LockedCols = 0
            LockedFont.Charset = DEFAULT_CHARSET
            LockedFont.Color = clWindowText
            LockedFont.Height = -11
            LockedFont.Name = 'MS Sans Serif'
            LockedFont.Style = []
            LockedColor = clGray
            FlatCheckBox = False
            LinesPerRow = 3
            ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
            MaskedColumnDrag = True
            ShowTitlesWhenInactive = True
            BoldTitlesWhenCells3D = True
            ValueChecked = 1
            ValueUnChecked = 0
            Columns = <
              item
                Expanded = False
                FieldName = 'POSITION'
                ReadOnly = True
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
                FieldName = 'MATCH_ARTNUM'
                ReadOnly = True
                Width = 82
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BEZEICHNUNG'
                Width = 270
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MENGE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ME_EINHEIT'
                Width = 52
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EPREIS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RABATT'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GPREIS'
                ReadOnly = True
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STEUER_CODE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MwSt'
                ReadOnly = True
                Visible = True
              end>
          end
        end
        object PosSumPan: TPanel
          Left = 0
          Top = 435
          Width = 724
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'PosSumPan'
          TabOrder = 2
          object Panel14: TPanel
            Left = 0
            Top = 0
            Width = 3
            Height = 24
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel15: TPanel
            Left = 721
            Top = 0
            Width = 3
            Height = 24
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
        object InfoPanOut: TPanel
          Left = 0
          Top = 408
          Width = 724
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 3
          object Panel38: TPanel
            Left = 0
            Top = 0
            Width = 3
            Height = 24
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel39: TPanel
            Left = 721
            Top = 0
            Width = 3
            Height = 24
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object PosInfoPan: TPanel
            Left = 3
            Top = 0
            Width = 718
            Height = 24
            Hint = 'mit F9 kann man diese Info ein- und ausschalten ...'
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 5
            Color = 14680063
            TabOrder = 2
            object Label52: TLabel
              Left = 368
              Top = 5
              Width = 68
              Height = 14
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'EK-Preis :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object Label54: TLabel
              Left = 535
              Top = 5
              Width = 82
              Height = 14
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Rohgewinn :'
              Color = 14680063
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object Label61: TLabel
              Left = 5
              Top = 5
              Width = 66
              Height = 16
              Align = alLeft
              Caption = ' Pos-Info:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object DBText29: TDBText
              Left = 311
              Top = 5
              Width = 57
              Height = 13
              Align = alRight
              Alignment = taRightJustify
              AutoSize = True
              DataField = 'CALC_LAGERMENGE_STR'
              DataSource = PosDS
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object InfoEK: TDBText
              Left = 436
              Top = 5
              Width = 99
              Height = 14
              Align = alRight
              Alignment = taRightJustify
              DataField = 'CALC_EK'
              DataSource = PosDS
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object InfoRGW: TDBText
              Left = 617
              Top = 5
              Width = 96
              Height = 14
              Align = alRight
              Alignment = taRightJustify
              DataField = 'CALC_RGEWINN'
              DataSource = PosDS
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object BottomSpacePan: TPanel
          Left = 0
          Top = 432
          Width = 724
          Height = 3
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 4
        end
        object PosTopKunPan: TPanel
          Left = 0
          Top = 0
          Width = 724
          Height = 68
          Align = alTop
          BevelOuter = bvNone
          Caption = 'PosTopKunPan'
          TabOrder = 5
          object KunDatGB2: TOFGroupBox
            Left = 0
            Top = 0
            Width = 724
            Height = 68
            Align = alClient
            Caption = 'Kundendaten'
            Color = 14680063
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            TabOrder = 0
            object Label2: TLabel
              Left = 199
              Top = 46
              Width = 78
              Height = 13
              AutoSize = False
              Caption = 'Land/Plz/Ort:'
            end
            object Label3: TLabel
              Left = 199
              Top = 23
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Name1:'
            end
            object Label4: TLabel
              Left = 5
              Top = 46
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Intern-Nr:'
            end
            object Label5: TLabel
              Left = 5
              Top = 23
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Kunden-Nr:'
            end
            object Panel4: TPanel
              Left = 308
              Top = 43
              Width = 58
              Height = 20
              Alignment = taRightJustify
              BevelOuter = bvLowered
              TabOrder = 0
              object DBText2: TDBText
                Left = 3
                Top = 2
                Width = 52
                Height = 15
                DataField = 'KUN_PLZ'
                DataSource = ReEdiDS
              end
            end
            object Panel5: TPanel
              Tag = 1
              Left = 368
              Top = 43
              Width = 348
              Height = 20
              Alignment = taRightJustify
              BevelOuter = bvLowered
              TabOrder = 1
              object DBText3: TDBText
                Left = 3
                Top = 2
                Width = 158
                Height = 16
                DataField = 'KUN_ORT'
                DataSource = ReEdiDS
              end
            end
            object Panel6: TPanel
              Left = 280
              Top = 43
              Width = 24
              Height = 20
              Alignment = taRightJustify
              BevelOuter = bvLowered
              TabOrder = 2
              object DBText8: TDBText
                Left = 3
                Top = 2
                Width = 18
                Height = 16
                DataField = 'KUN_LAND'
                DataSource = ReEdiDS
              end
            end
            object Panel12: TPanel
              Tag = 1
              Left = 280
              Top = 20
              Width = 436
              Height = 20
              Alignment = taRightJustify
              BevelOuter = bvLowered
              TabOrder = 3
              object DBText9: TDBText
                Left = 3
                Top = 2
                Width = 245
                Height = 16
                DataField = 'CALC_NAME'
                DataSource = ReEdiDS
              end
            end
            object Panel13: TPanel
              Left = 86
              Top = 43
              Width = 105
              Height = 20
              Alignment = taRightJustify
              BevelOuter = bvLowered
              TabOrder = 4
              object DBText11: TDBText
                Left = 3
                Top = 2
                Width = 97
                Height = 15
                Alignment = taCenter
                DataField = 'VVTNUM'
                DataSource = ReEdiDS
              end
            end
            object Panel25: TPanel
              Left = 86
              Top = 20
              Width = 105
              Height = 20
              Alignment = taRightJustify
              BevelOuter = bvLowered
              TabOrder = 5
              object DBText23: TDBText
                Left = 3
                Top = 2
                Width = 100
                Height = 15
                Alignment = taCenter
                DataField = 'KUN_NUM'
                DataSource = ReEdiDS
              end
            end
          end
        end
      end
      object Fertig: TTabSheet
        Caption = '&Fertig'
        ImageIndex = 3
        object ToolBar5: TToolBar
          Left = 0
          Top = 459
          Width = 724
          Height = 34
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 126
          Caption = 'ToolBar2'
          EdgeBorders = []
          Flat = True
          Images = MainForm.VorgangImgList
          List = True
          ShowCaptions = True
          TabOrder = 0
          Wrapable = False
          object ToolButton12: TToolButton
            Left = 0
            Top = 0
            AutoSize = True
            Caption = 'Zur'#252'ck'
            ImageIndex = 8
            OnClick = GotoPosBtnClick
          end
          object ToolButton17: TToolButton
            Left = 69
            Top = 0
            Width = 8
            Caption = 'ToolButton17'
            ImageIndex = 12
            Style = tbsSeparator
          end
          object BuchenBtn: TToolButton
            Left = 77
            Top = 0
            AutoSize = True
            Caption = 'Vertrag aktivieren'
            ImageIndex = 11
            OnClick = BuchenBtnClick
          end
          object DeaktivierenBtn: TToolButton
            Left = 195
            Top = 0
            AutoSize = True
            Caption = 'Vertrag deaktivieren'
            ImageIndex = 15
            Visible = False
            OnClick = DeaktivierenBtnClick
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 68
          Width = 724
          Height = 84
          Align = alTop
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 1
          object CaoGroupBox1: TOFGroupBox
            Left = 326
            Top = 0
            Width = 398
            Height = 84
            Align = alClient
            Caption = 'Texte'
            Ctl3D = False
            Enabled = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 1
            object Label34: TLabel
              Left = 5
              Top = 22
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Projekt:'
            end
            object Label35: TLabel
              Left = 5
              Top = 44
              Width = 77
              Height = 13
              AutoSize = False
              Caption = #220'berschrift 1:'
            end
            object Label36: TLabel
              Left = 5
              Top = 63
              Width = 77
              Height = 13
              AutoSize = False
              Caption = #220'berschrift 2:'
            end
            object DBEdit1: TDBEdit
              Tag = 1
              Left = 86
              Top = 60
              Width = 304
              Height = 19
              AutoSize = False
              Color = clBtnFace
              DataField = 'USR2'
              DataSource = ReEdiDS
              TabOrder = 2
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit2: TDBEdit
              Tag = 1
              Left = 86
              Top = 40
              Width = 304
              Height = 19
              AutoSize = False
              Color = clBtnFace
              DataField = 'USR1'
              DataSource = ReEdiDS
              TabOrder = 1
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit3: TDBEdit
              Tag = 1
              Left = 86
              Top = 20
              Width = 304
              Height = 19
              AutoSize = False
              Color = clBtnFace
              DataField = 'PROJEKT'
              DataSource = ReEdiDS
              TabOrder = 0
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
          object CaoGroupBox2: TOFGroupBox
            Left = 0
            Top = 0
            Width = 326
            Height = 84
            Align = alLeft
            Caption = 'Bestelldaten'
            Ctl3D = False
            Enabled = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 0
            object Label37: TLabel
              Left = 5
              Top = 63
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Bestellnummer:'
            end
            object Label39: TLabel
              Left = 5
              Top = 43
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Bestelldatum:'
            end
            object Label40: TLabel
              Left = 5
              Top = 22
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'bestellt durch:'
            end
            object DBEdit4: TDBEdit
              Tag = 1
              Left = 86
              Top = 60
              Width = 232
              Height = 19
              AutoSize = False
              Color = clBtnFace
              DataField = 'ORGNUM'
              DataSource = ReEdiDS
              TabOrder = 2
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBDateEdit1: TJvDBDateEdit
              Tag = 1
              Left = 86
              Top = 40
              Width = 232
              Height = 19
              DataField = 'BEST_DATUM'
              DataSource = ReEdiDS
              Color = clBtnFace
              NumGlyphs = 2
              YearDigits = dyFour
              TabOrder = 1
              OnKeyPress = KuNrEditKeyPress
              OnKeyDown = KuNrEditKeyDown
            end
            object DBEdit5: TDBEdit
              Tag = 1
              Left = 86
              Top = 20
              Width = 232
              Height = 19
              AutoSize = False
              Color = clBtnFace
              DataField = 'BEST_NAME'
              DataSource = ReEdiDS
              TabOrder = 0
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 152
          Width = 724
          Height = 133
          Align = alTop
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 2
          object CaoGroupBox5: TOFGroupBox
            Left = 0
            Top = 0
            Width = 326
            Height = 133
            Align = alLeft
            Caption = 'Zuweisungen'
            Ctl3D = False
            Enabled = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 0
            object Label43: TLabel
              Left = 5
              Top = 24
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Versand:'
            end
            object Label44: TLabel
              Left = 5
              Top = 45
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Vertreter:'
            end
            object Label45: TLabel
              Left = 5
              Top = 68
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Zahlart:'
            end
            object Label46: TLabel
              Left = 5
              Top = 89
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'W'#228'hrung:'
            end
            object Label48: TLabel
              Left = 5
              Top = 112
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Zahlungsziel:'
            end
            object Label49: TLabel
              Left = 119
              Top = 111
              Width = 30
              Height = 13
              AutoSize = False
              Caption = 'Tage'
            end
            object Label50: TLabel
              Left = 193
              Top = 111
              Width = 39
              Height = 13
              AutoSize = False
              Caption = 'Skonto:'
            end
            object Label51: TLabel
              Left = 264
              Top = 111
              Width = 58
              Height = 13
              AutoSize = False
              Caption = 'Tage Netto'
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Tag = 1
              Left = 88
              Top = 42
              Width = 230
              Height = 19
              Color = clBtnFace
              DataField = 'VERTRETER_ID'
              DataSource = ReEdiDS
              KeyField = 'VERTRETER_ID'
              ListField = 'NAME'
              ListSource = DM1.VertreterDS
              TabOrder = 0
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBLookupComboBox2: TDBLookupComboBox
              Tag = 1
              Left = 88
              Top = 64
              Width = 230
              Height = 19
              Color = clBtnFace
              DataField = 'ZAHLART'
              DataSource = ReEdiDS
              KeyField = 'ZAHL_ID'
              ListField = 'LANGBEZ'
              ListSource = DM1.ZahlArtDS
              TabOrder = 1
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBLookupComboBox3: TDBLookupComboBox
              Tag = 1
              Left = 88
              Top = 85
              Width = 230
              Height = 19
              Color = clBtnFace
              DataField = 'WAEHRUNG'
              DataSource = ReEdiDS
              KeyField = 'WAEHRUNG'
              ListField = 'LANGBEZ'
              ListSource = DM1.WhrungDS
              ReadOnly = True
              TabOrder = 2
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit11: TDBEdit
              Left = 88
              Top = 108
              Width = 28
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              Color = clBtnFace
              DataField = 'SOLL_STAGE'
              DataSource = ReEdiDS
              TabOrder = 3
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit12: TDBEdit
              Left = 149
              Top = 108
              Width = 40
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              Color = clBtnFace
              DataField = 'SOLL_SKONTO'
              DataSource = ReEdiDS
              TabOrder = 4
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit13: TDBEdit
              Left = 234
              Top = 108
              Width = 28
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              Color = clBtnFace
              DataField = 'SOLL_NTAGE'
              DataSource = ReEdiDS
              TabOrder = 5
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBLookupComboBox4: TDBLookupComboBox
              Tag = 1
              Left = 88
              Top = 20
              Width = 230
              Height = 19
              Color = clBtnFace
              DataField = 'LIEFART'
              DataSource = ReEdiDS
              KeyField = 'LIEF_ID'
              ListField = 'LANGBEZ'
              ListSource = DM1.LiefArtDS
              TabOrder = 6
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
          object CaoGroupBox6: TOFGroupBox
            Left = 326
            Top = 0
            Width = 398
            Height = 133
            Align = alClient
            Caption = 'Info'
            Ctl3D = False
            Enabled = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 1
            object DBMemo1: TDBMemo
              Left = 8
              Top = 21
              Width = 382
              Height = 104
              Align = alClient
              Color = clBtnFace
              DataField = 'INFO'
              DataSource = ReEdiDS
              ScrollBars = ssVertical
              TabOrder = 0
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
        end
        object CaoGroupBox7: TOFGroupBox
          Left = 0
          Top = 285
          Width = 724
          Height = 150
          Align = alClient
          Caption = 'festgestellte Probleme'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 3
          object ProblemLab: TLabel
            Left = 8
            Top = 21
            Width = 39
            Height = 16
            Align = alClient
            Alignment = taCenter
            Caption = 'keine'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
          end
        end
        object FertigSumPan: TPanel
          Left = 0
          Top = 435
          Width = 724
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'FertigSumPan'
          TabOrder = 4
          object Panel31: TPanel
            Left = 0
            Top = 0
            Width = 3
            Height = 24
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel32: TPanel
            Left = 721
            Top = 0
            Width = 3
            Height = 24
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
        object FertigTopKunPan: TPanel
          Left = 0
          Top = 0
          Width = 724
          Height = 68
          Align = alTop
          BevelOuter = bvNone
          Caption = 'FertigTopKunPan'
          TabOrder = 5
        end
      end
    end
    object TopPan: TPanel
      Left = 0
      Top = 0
      Width = 724
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      object ReEdiTopLab: TLabel
        Left = 0
        Top = 0
        Width = 155
        Height = 23
        Align = alLeft
        Caption = '  Vertrag bearbeiten ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object ButtonPan: TPanel
        Left = 433
        Top = 0
        Width = 287
        Height = 23
        Align = alRight
        AutoSize = True
        BevelOuter = bvNone
        Color = clBtnShadow
        TabOrder = 0
        object AuswahlBtn: TJvSpeedButton
          Tag = 1
          Left = 0
          Top = 0
          Width = 65
          Height = 22
          Caption = 'Auswahl'
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
          OnMouseEnter = AuswahlBtnMouseEnter
          OnMouseLeave = AuswahlBtnMouseLeave
          OnClick = GotoAuswahlBtnClick
        end
        object AllgemeinBtn: TJvSpeedButton
          Tag = 2
          Left = 66
          Top = 0
          Width = 68
          Height = 22
          Caption = 'Allgemein'
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
          OnMouseEnter = AuswahlBtnMouseEnter
          OnMouseLeave = AuswahlBtnMouseLeave
          OnClick = GotoAllgBtnClick
        end
        object PositionenBtn: TJvSpeedButton
          Tag = 3
          Left = 134
          Top = 0
          Width = 73
          Height = 22
          Caption = 'Positionen'
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
          OnMouseEnter = AuswahlBtnMouseEnter
          OnMouseLeave = AuswahlBtnMouseLeave
          OnClick = GotoPosBtnClick
        end
        object FertigBtn: TJvSpeedButton
          Tag = 4
          Left = 207
          Top = 0
          Width = 80
          Height = 22
          Caption = 'Fertigstellen'
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
          OnMouseEnter = AuswahlBtnMouseEnter
          OnMouseLeave = AuswahlBtnMouseLeave
          OnClick = GotoFertigBtnClick
        end
      end
    end
  end
  object PosDS: TDataSource
    DataSet = PosTab
    OnDataChange = PosDSDataChange
    Left = 645
    Top = 361
  end
  object ReEdiDS: TDataSource
    DataSet = ReEdiTab
    OnDataChange = ReEdiDSDataChange
    Left = 561
    Top = 362
  end
  object ReEdiTab: TOFZQuery
    Connection = DM1.DB1
    AfterOpen = ReEdiTabAfterScroll
    BeforeClose = ReEdiTabBeforeClose
    AfterScroll = ReEdiTabAfterScroll
    OnCalcFields = ReEdiTabCalcFields
    AfterEdit = ReEdiTabAfterEdit
    BeforePost = ReEdiTabBeforePost
    AfterPost = ReEdiTabAfterPost
    BeforeDelete = ReEdiTabBeforeDelete
    OnNewRecord = ReEdiTabOnNewRecord
    OFSecurity = DM1.CaoSecurity
    OFModulID = 2070
    OFSubModulID = 0
    UseRecordLock = False
    ShowLockErrors = False
    AutoReleaseLock = False
    Params = <>
    SQL.Strings = (
      'select * FROM VERTRAG'
      'order by VVTNUM')
    Left = 561
    Top = 309
    object ReEdiTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
      Visible = False
    end
    object ReEdiTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
      Visible = False
    end
    object ReEdiTabVVTNUM: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Vertrag-Nr.'
      DisplayWidth = 5
      FieldName = 'VVTNUM'
      Required = True
      DisplayFormat = '"V"0000'
    end
    object ReEdiTabVERTRETER_ID: TIntegerField
      FieldName = 'VERTRETER_ID'
      Visible = False
    end
    object ReEdiTabGLOBRABATT: TFloatField
      FieldName = 'GLOBRABATT'
      Visible = False
      DisplayFormat = '0.0%'
    end
    object ReEdiTabPR_EBENE: TIntegerField
      FieldName = 'PR_EBENE'
      Visible = False
    end
    object ReEdiTabKOST_NETTO: TFloatField
      FieldName = 'KOST_NETTO'
      Visible = False
    end
    object ReEdiTabWERT_NETTO: TFloatField
      FieldName = 'WERT_NETTO'
      Visible = False
    end
    object ReEdiTabLOHN: TFloatField
      FieldName = 'LOHN'
      Visible = False
    end
    object ReEdiTabWARE: TFloatField
      FieldName = 'WARE'
      Visible = False
    end
    object ReEdiTabTKOST: TFloatField
      FieldName = 'TKOST'
      Visible = False
    end
    object ReEdiTabMWST_0: TFloatField
      FieldName = 'MWST_0'
      Visible = False
    end
    object ReEdiTabMWST_1: TFloatField
      FieldName = 'MWST_1'
      Visible = False
    end
    object ReEdiTabMWST_2: TFloatField
      FieldName = 'MWST_2'
      Visible = False
    end
    object ReEdiTabMWST_3: TFloatField
      FieldName = 'MWST_3'
      Visible = False
    end
    object ReEdiTabNSUMME: TFloatField
      DisplayLabel = 'Gesamt (netto)'
      DisplayWidth = 9
      FieldName = 'NSUMME'
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabNSUMME_0: TFloatField
      FieldName = 'NSUMME_0'
      Required = True
    end
    object ReEdiTabNSUMME_1: TFloatField
      FieldName = 'NSUMME_1'
      Required = True
    end
    object ReEdiTabNSUMME_2: TFloatField
      FieldName = 'NSUMME_2'
      Required = True
    end
    object ReEdiTabNSUMME_3: TFloatField
      FieldName = 'NSUMME_3'
      Required = True
    end
    object ReEdiTabMSUMME: TFloatField
      FieldName = 'MSUMME'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabMSUMME_0: TFloatField
      FieldName = 'MSUMME_0'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabMSUMME_1: TFloatField
      FieldName = 'MSUMME_1'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabMSUMME_2: TFloatField
      FieldName = 'MSUMME_2'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabMSUMME_3: TFloatField
      FieldName = 'MSUMME_3'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabBSUMME: TFloatField
      DisplayLabel = 'Brutto'
      FieldName = 'BSUMME'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabBSUMME_0: TFloatField
      FieldName = 'BSUMME_0'
      Required = True
    end
    object ReEdiTabBSUMME_1: TFloatField
      FieldName = 'BSUMME_1'
      Required = True
    end
    object ReEdiTabBSUMME_2: TFloatField
      FieldName = 'BSUMME_2'
      Required = True
    end
    object ReEdiTabBSUMME_3: TFloatField
      FieldName = 'BSUMME_3'
      Required = True
    end
    object ReEdiTabATSUMME: TFloatField
      FieldName = 'ATSUMME'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabATMSUMME: TFloatField
      FieldName = 'ATMSUMME'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabGEGENKONTO: TIntegerField
      FieldName = 'GEGENKONTO'
      Visible = False
    end
    object ReEdiTabSOLL_STAGE: TIntegerField
      FieldName = 'SOLL_STAGE'
      Visible = False
    end
    object ReEdiTabSOLL_SKONTO: TFloatField
      FieldName = 'SOLL_SKONTO'
      Visible = False
      DisplayFormat = '0.0%'
      EditFormat = '0.0'
    end
    object ReEdiTabSOLL_NTAGE: TIntegerField
      FieldName = 'SOLL_NTAGE'
      Visible = False
    end
    object ReEdiTabSOLL_RATEN: TIntegerField
      FieldName = 'SOLL_RATEN'
      Visible = False
    end
    object ReEdiTabSOLL_RATBETR: TFloatField
      FieldName = 'SOLL_RATBETR'
      Visible = False
    end
    object ReEdiTabSOLL_RATINTERVALL: TIntegerField
      FieldName = 'SOLL_RATINTERVALL'
      Visible = False
    end
    object ReEdiTabSTADIUM: TIntegerField
      FieldName = 'STADIUM'
      Visible = False
    end
    object ReEdiTabERSTELLT: TDateField
      FieldName = 'ERSTELLT'
      Visible = False
    end
    object ReEdiTabERST_NAME: TStringField
      FieldName = 'ERST_NAME'
      Visible = False
    end
    object ReEdiTabKUN_NUM: TStringField
      Alignment = taCenter
      FieldName = 'KUN_NUM'
      Visible = False
    end
    object ReEdiTabKUN_ANREDE: TStringField
      FieldName = 'KUN_ANREDE'
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_NAME1: TStringField
      DisplayLabel = 'Kunde'
      FieldName = 'KUN_NAME1'
      Size = 40
    end
    object ReEdiTabKUN_NAME2: TStringField
      FieldName = 'KUN_NAME2'
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_NAME3: TStringField
      FieldName = 'KUN_NAME3'
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_ABTEILUNG: TStringField
      FieldName = 'KUN_ABTEILUNG'
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_STRASSE: TStringField
      FieldName = 'KUN_STRASSE'
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_LAND: TStringField
      FieldName = 'KUN_LAND'
      Visible = False
      Size = 5
    end
    object ReEdiTabKUN_PLZ: TStringField
      FieldName = 'KUN_PLZ'
      Visible = False
      Size = 10
    end
    object ReEdiTabKUN_ORT: TStringField
      FieldName = 'KUN_ORT'
      Visible = False
      Size = 40
    end
    object ReEdiTabUSR1: TStringField
      FieldName = 'USR1'
      Visible = False
      Size = 80
    end
    object ReEdiTabUSR2: TStringField
      FieldName = 'USR2'
      Visible = False
      Size = 80
    end
    object ReEdiTabPROJEKT: TStringField
      DisplayLabel = 'Projekt / Beschreibung'
      FieldName = 'PROJEKT'
      Size = 40
    end
    object ReEdiTabORGNUM: TStringField
      FieldName = 'ORGNUM'
      Visible = False
    end
    object ReEdiTabBEST_NAME: TStringField
      FieldName = 'BEST_NAME'
      Visible = False
      Size = 40
    end
    object ReEdiTabBEST_CODE: TIntegerField
      FieldName = 'BEST_CODE'
      Visible = False
    end
    object ReEdiTabBEST_DATUM: TDateField
      FieldName = 'BEST_DATUM'
    end
    object ReEdiTabINFO: TBlobField
      FieldName = 'INFO'
      Visible = False
    end
    object ReEdiTabLIEFART: TIntegerField
      FieldName = 'LIEFART'
      Visible = False
      DisplayFormat = '0;-;0'
    end
    object ReEdiTabZAHLART: TIntegerField
      FieldName = 'ZAHLART'
      Visible = False
      DisplayFormat = '0;-;0'
    end
    object ReEdiTabWAEHRUNG: TStringField
      DisplayLabel = 'WA'
      DisplayWidth = 3
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object ReEdiTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object ReEdiTabMWST_FREI_FLAG: TBooleanField
      FieldName = 'MWST_FREI_FLAG'
      Required = True
    end
    object ReEdiTabDATUM_START: TDateField
      DisplayLabel = 'Datum Beginn'
      FieldName = 'DATUM_START'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object ReEdiTabDATUM_ENDE: TDateField
      DisplayLabel = 'Datum Ende'
      FieldName = 'DATUM_ENDE'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object ReEdiTabDATUM_NEXT: TDateField
      DisplayLabel = 'n'#228'. Rechnung'
      FieldName = 'DATUM_NEXT'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object ReEdiTabINTERVALL_NUM: TIntegerField
      DisplayLabel = 'Intervall'
      FieldName = 'INTERVALL_NUM'
      Required = True
      EditFormat = '0'
      MaxValue = 999
      MinValue = 1
    end
    object ReEdiTabAKTIV_FLAG: TBooleanField
      DisplayLabel = 'Aktiv'
      FieldName = 'AKTIV_FLAG'
      Required = True
    end
    object ReEdiTabPRINT_FLAG: TBooleanField
      FieldName = 'PRINT_FLAG'
      Required = True
    end
    object ReEdiTabINTERVALL: TStringField
      FieldName = 'INTERVALL'
      Size = 1
    end
    object ReEdiTabCALC_DATUM_NEXT: TStringField
      DisplayLabel = 'n'#228'. Rechnung'
      FieldKind = fkCalculated
      FieldName = 'CALC_DATUM_NEXT'
      Size = 10
      Calculated = True
    end
    object ReEdiTabCALC_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_NAME'
      Size = 255
      Calculated = True
    end
  end
  object PosTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = PosTabAfterScroll
    AfterScroll = PosTabAfterScroll
    OnCalcFields = PosTabCalcFields
    BeforeInsert = PosTabBeforeInsert
    BeforeEdit = PosTabBeforeEdit
    BeforePost = PosTabBeforePost
    AfterPost = PosTabAfterPost
    AfterCancel = PosTabAfterPost
    BeforeDelete = PosTabBeforeDelete
    AfterDelete = PosTabAfterDelete
    OnNewRecord = PosTabNewRecord
    SQL.Strings = (
      'select * from VERTRAGPOS'
      'where JOURNAL_ID=:ID')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '8488'
      end>
    Left = 641
    Top = 309
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '8488'
      end>
    object PosTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
      Visible = False
    end
    object PosTabJOURNAL_ID: TIntegerField
      FieldName = 'JOURNAL_ID'
      Required = True
      Visible = False
    end
    object PosTabPOSITION: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Pos.'
      DisplayWidth = 3
      FieldName = 'POSITION'
      Required = True
      DisplayFormat = '000'
    end
    object PosTabARTIKELTYP: TStringField
      Alignment = taCenter
      DisplayLabel = 'T'
      DisplayWidth = 2
      FieldName = 'ARTIKELTYP'
      Size = 1
    end
    object PosTabARTIKEL_ID: TIntegerField
      FieldName = 'ARTIKEL_ID'
      Required = True
      Visible = False
    end
    object PosTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
      Visible = False
    end
    object PosTabVVTNUM: TIntegerField
      FieldName = 'VVTNUM'
      Visible = False
    end
    object PosTabMATCHCODE: TStringField
      FieldName = 'MATCHCODE'
      Visible = False
    end
    object PosTabARTNUM: TStringField
      FieldName = 'ARTNUM'
      Visible = False
    end
    object PosTabBARCODE: TStringField
      FieldName = 'BARCODE'
      Visible = False
    end
    object PosTabBEZEICHNUNG: TMemoField
      DisplayLabel = 'Artikelbezeichnung'
      DisplayWidth = 70
      FieldName = 'BEZEICHNUNG'
      BlobType = ftMemo
    end
    object PosTabLAENGE: TStringField
      FieldName = 'LAENGE'
      Visible = False
    end
    object PosTabGROESSE: TStringField
      FieldName = 'GROESSE'
      Visible = False
    end
    object PosTabDIMENSION: TStringField
      FieldName = 'DIMENSION'
      Visible = False
    end
    object PosTabGEWICHT: TFloatField
      FieldName = 'GEWICHT'
      Visible = False
    end
    object PosTabME_EINHEIT: TStringField
      DisplayLabel = 'M.-Einheit'
      FieldName = 'ME_EINHEIT'
      Visible = False
      Size = 10
    end
    object PosTabPR_EINHEIT: TFloatField
      FieldName = 'PR_EINHEIT'
      Visible = False
    end
    object PosTabMENGE: TFloatField
      DisplayLabel = 'Menge'
      DisplayWidth = 6
      FieldName = 'MENGE'
      DisplayFormat = ',#0.0##;-,#0.0##; '
      EditFormat = '0.000'
    end
    object PosTabEPREIS: TFloatField
      DisplayLabel = 'E-Preis'
      DisplayWidth = 8
      FieldName = 'EPREIS'
      DisplayFormat = ',#0.00'
    end
    object PosTabRABATT: TFloatField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 5
      FieldName = 'RABATT'
      DisplayFormat = ',###,##0.0"%";-,###,##0.0"%"; '
    end
    object PosTabGPREIS: TFloatField
      DisplayLabel = 'G-Preis'
      FieldName = 'GPREIS'
      Required = True
      DisplayFormat = ',#0.00'
    end
    object PosTabALTTEIL_STCODE: TIntegerField
      FieldName = 'ALTTEIL_STCODE'
      Visible = False
    end
    object PosTabGEGENKTO: TIntegerField
      FieldName = 'GEGENKTO'
      Visible = False
    end
    object PosTabNSumme: TCurrencyField
      DisplayLabel = 'G-Preis'
      DisplayWidth = 9
      FieldKind = fkCalculated
      FieldName = 'NSumme'
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
      Calculated = True
    end
    object PosTabSTEUER_CODE: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'S'
      DisplayWidth = 2
      FieldName = 'STEUER_CODE'
      DisplayFormat = '0;-;-'
    end
    object PosTabMwSt: TStringField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'MwSt'
      Size = 8
      Calculated = True
    end
    object PosTabALTTEIL_PROZ: TFloatField
      FieldName = 'ALTTEIL_PROZ'
      Visible = False
    end
    object PosTabMATCH_ARTNUM: TStringField
      DisplayLabel = 'Matchcode'
      FieldKind = fkCalculated
      FieldName = 'MATCH_ARTNUM'
      Size = 80
      Calculated = True
    end
    object PosTabCALC_EK: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_EK'
      DisplayFormat = ',###,##0.00'
      Calculated = True
    end
    object PosTabCALC_RGEWINN: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_RGEWINN'
      DisplayFormat = ',###,##0.00'
      Calculated = True
    end
    object PosTabALTTEIL_FLAG: TBooleanField
      FieldName = 'ALTTEIL_FLAG'
      Required = True
    end
    object PosTabBEZ_FEST_FLAG: TBooleanField
      FieldName = 'BEZ_FEST_FLAG'
      Required = True
    end
    object PosTabCALC_LAGERMENGE_STR: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_LAGERMENGE_STR'
      Visible = False
      Size = 250
      Calculated = True
    end
    object PosTabCALC_LAGERMENGE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_LAGERMENGE'
      Visible = False
      Calculated = True
    end
    object PosTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object PosTabCALC_STEUERPORZ: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_STEUERPORZ'
      Calculated = True
    end
    object PosTabE_RGEWINN: TFloatField
      FieldName = 'E_RGEWINN'
      Visible = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
    end
    object PosTabG_RGEWINN: TFloatField
      FieldName = 'G_RGEWINN'
      Required = True
    end
    object PosTabE_RABATT_BETRAG: TFloatField
      FieldName = 'E_RABATT_BETRAG'
      Required = True
    end
    object PosTabG_RABATT_BETRAG: TFloatField
      FieldName = 'G_RABATT_BETRAG'
      Required = True
    end
    object PosTabVPE: TLargeintField
      FieldName = 'VPE'
    end
    object PosTabEK_PREIS: TFloatField
      FieldName = 'EK_PREIS'
    end
    object PosTabCALC_FAKTOR: TFloatField
      FieldName = 'CALC_FAKTOR'
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
    Left = 561
    Top = 412
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object neuenBelegerstellen1: TMenuItem
        Caption = 'neuen Beleg erstellen'
        ImageIndex = 23
        ShortCut = 16429
        OnClick = New1BtnClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Adressezuweisen1: TMenuItem
        Caption = 'Adresse zuweisen'
        ImageIndex = 33
        ShortCut = 114
        OnClick = KuNrEditButtonClick
      end
      object Artikelhinzufgen1: TMenuItem
        Caption = 'Artikel hinzuf'#252'gen'
        ImageIndex = 33
        ShortCut = 45
        OnClick = NeuArtBtnClick
      end
      object freienArtikelhinzufgen1: TMenuItem
        Caption = 'freien Artikel hinzuf'#252'gen'
        ImageIndex = 20
        ShortCut = 16457
        OnClick = NeuFrArtBtnClick
      end
      object Texthinzufgen1: TMenuItem
        Caption = 'Text hinzuf'#252'gen'
        ImageIndex = 20
        ShortCut = 16468
        OnClick = NeuKomBtnClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Kopieren1: TMenuItem
        Caption = 'Kopieren'
        Enabled = False
        ImageIndex = 14
        ShortCut = 16459
      end
      object Storno1: TMenuItem
        Caption = 'Beleg l'#246'schen'
        ImageIndex = 19
        ShortCut = 8238
        OnClick = Del1BtnClick
      end
      object Positionlschen1: TMenuItem
        Caption = 'Position l'#246'schen'
        ImageIndex = 32
        ShortCut = 16430
        OnClick = DelBtnClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Speichernundaktivieren1: TMenuItem
        Caption = 'Speichern und aktivieren'
        ImageIndex = 18
        ShortCut = 32848
        OnClick = BuchenBtnClick
      end
      object Vertragdeaktivieren1: TMenuItem
        Caption = 'Vertrag deaktivieren'
        ImageIndex = 78
        ShortCut = 32837
        OnClick = DeaktivierenBtnClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        ShortCut = 16454
        OnClick = Suchen1Click
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
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 4
      object Auswahl1: TMenuItem
        Tag = 1
        Caption = 'Auswahl'
        Checked = True
        GroupIndex = 2
        RadioItem = True
        ShortCut = 117
        OnClick = GotoAuswahlBtnClick
      end
      object Allgemein1: TMenuItem
        Tag = 2
        Caption = 'Allgemein'
        GroupIndex = 2
        RadioItem = True
        ShortCut = 118
        OnClick = GotoAllgBtnClick
      end
      object Positionen1: TMenuItem
        Tag = 3
        Caption = 'Positionen'
        GroupIndex = 2
        RadioItem = True
        ShortCut = 119
        OnClick = GotoPosBtnClick
      end
      object Fertigstellen1: TMenuItem
        Tag = 4
        Caption = 'Fertigstellen'
        GroupIndex = 2
        RadioItem = True
        ShortCut = 123
        OnClick = GotoFertigBtnClick
      end
      object N5: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        GroupIndex = 3
        ImageIndex = 13
        ShortCut = 116
        OnClick = Aktualisieren1Click
      end
    end
    object Spezial1: TMenuItem
      Caption = 'E&xtras'
      GroupIndex = 4
      object MakeBelege: TMenuItem
        Caption = 'f'#228'llige Belege erstellen'
        ImageIndex = 22
        ShortCut = 32887
        OnClick = MakeBelegeClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object UmschaltungBruttoNetto1: TMenuItem
        Caption = 'Umschaltung Brutto<-->Netto'
        OnClick = UmschaltungBruttoNetto1Click
      end
    end
  end
  object ArtikelPopupMenu: TPopupMenu
    Left = 644
    Top = 412
    object freierArtikel1: TMenuItem
      Caption = 'freien Artikel hinzuf'#252'gen'
      ImageIndex = 0
      OnClick = NeuFrArtBtnClick
    end
    object Text1: TMenuItem
      Caption = 'Text hinzuf'#252'gen'
      ImageIndex = 5
      OnClick = NeuKomBtnClick
    end
  end
end
