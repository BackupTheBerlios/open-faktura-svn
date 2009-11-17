object MakeEKReForm: TMakeEKReForm
  Left = 301
  Top = 158
  Width = 772
  Height = 548
  Caption = 'Einkauf erfassen'
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
    Width = 764
    Height = 502
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
      Width = 764
      Height = 475
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
          Width = 764
          Height = 418
          Align = alClient
          DataSource = ReEdiDS
          DefaultDrawing = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
          OnGetCellParams = ReEdiListGridGetCellParams
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 24
          TitleRowHeight = 24
          RowColor1 = clWindow
          RowColor2 = clWindow
          DefaultRowHeight = 17
          EditColor = clWindow
          Columns = <
            item
              Expanded = False
              FieldName = 'VRENUM'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_NUM'
              Title.Caption = 'Ku-Nr. vom Lief.'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_NAME1'
              Title.Caption = 'Lieferant'
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
              Alignment = taCenter
              Expanded = False
              FieldName = 'RDATUM'
              Width = 66
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'WV_Datum-Str'
              Width = 75
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
          Top = 418
          Width = 764
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
          Width = 764
          Height = 68
          Align = alTop
          Caption = 'Lieferant'
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
            Width = 82
            Height = 13
            AutoSize = False
            Caption = 'Intern-Nr:'
          end
          object Label47: TLabel
            Left = 5
            Top = 23
            Width = 82
            Height = 13
            AutoSize = False
            Caption = 'Ku-Nr. vom Lief. :'
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
            Width = 388
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
            Width = 476
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 3
            object DBText4: TDBText
              Left = 3
              Top = 2
              Width = 245
              Height = 16
              DataField = 'KUN_NAME1'
              DataSource = ReEdiDS
            end
          end
          object KuNrEdit: TJvDBComboEdit
            Left = 88
            Top = 20
            Width = 105
            Height = 19
            Hint = 'mit F3 gelangen Sie in die Adressauswahl'
            AutoSelect = False
            ClickKey = 114
            DataField = 'KUN_NUM'
            DataSource = ReEdiDS
            DirectInput = False
            ImageKind = ikEllipsis
            ButtonWidth = 16
            TabOrder = 4
            OnButtonClick = KuNrEditButtonClick
            OnEnter = RechInfoMemoEnter
            OnExit = RechInfoMemoExit
            OnKeyDown = KuNrEditKeyDown
            OnKeyPress = KuNrEditKeyPress
          end
          object Panel2: TPanel
            Left = 88
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
              DataField = 'VRENUM'
              DataSource = ReEdiDS
            end
          end
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 418
          Width = 764
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
          TabOrder = 2
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
          Width = 764
          Height = 183
          Align = alTop
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 1
          object InfoGB: TOFGroupBox
            Left = 327
            Top = 0
            Width = 437
            Height = 183
            Align = alClient
            Caption = 'Info'
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 1
            object RechInfoMemo: TDBMemo
              Left = 8
              Top = 21
              Width = 421
              Height = 154
              Hint = 'Zeilenumbruch mit Strg+Enter'
              Align = alClient
              DataField = 'INFO'
              DataSource = ReEdiDS
              ScrollBars = ssVertical
              TabOrder = 0
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
          object ZuweisungenGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 327
            Height = 183
            Align = alLeft
            Caption = 'Zuweisungen'
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 0
            object Label27: TLabel
              Left = 5
              Top = 25
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Zahlart:'
            end
            object Label38: TLabel
              Left = 5
              Top = 46
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'W'#228'hrung:'
            end
            object Label6: TLabel
              Left = 5
              Top = 69
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Zahlungsziel:'
            end
            object Label7: TLabel
              Left = 119
              Top = 68
              Width = 30
              Height = 13
              AutoSize = False
              Caption = 'Tage'
            end
            object Label8: TLabel
              Left = 193
              Top = 68
              Width = 39
              Height = 13
              AutoSize = False
              Caption = 'Skonto:'
            end
            object Label9: TLabel
              Left = 264
              Top = 68
              Width = 58
              Height = 13
              AutoSize = False
              Caption = 'Tage Netto'
            end
            object Label15: TLabel
              Left = 5
              Top = 93
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'ER-Datum:'
            end
            object Label32: TLabel
              Left = 5
              Top = 113
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'ER-Nummer:'
            end
            object Label23: TLabel
              Left = 5
              Top = 138
              Width = 77
              Height = 34
              AutoSize = False
              Caption = #220'berweisungs- text:'
              WordWrap = True
            end
            object ZahlartDB: TDBLookupComboBox
              Tag = 1
              Left = 115
              Top = 21
              Width = 204
              Height = 19
              DataField = 'ZAHLART'
              DataSource = ReEdiDS
              KeyField = 'ZAHL_ID'
              ListField = 'LANGBEZ'
              ListSource = DM1.ZahlArtDS
              TabOrder = 1
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object WaehrungCB: TDBLookupComboBox
              Tag = 1
              Left = 115
              Top = 42
              Width = 204
              Height = 19
              DataField = 'WAEHRUNG'
              DataSource = ReEdiDS
              KeyField = 'WAEHRUNG'
              ListField = 'LANGBEZ'
              ListSource = DM1.WhrungDS
              ReadOnly = True
              TabOrder = 3
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object waehrung: TDBEdit
              Left = 88
              Top = 42
              Width = 28
              Height = 19
              AutoSelect = False
              DataField = 'WAEHRUNG'
              DataSource = ReEdiDS
              Enabled = False
              TabOrder = 2
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object Zahlart: TDBEdit
              Left = 88
              Top = 21
              Width = 28
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'ZAHLART'
              DataSource = ReEdiDS
              TabOrder = 0
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object SK_Skonto_Tage: TDBEdit
              Left = 88
              Top = 65
              Width = 28
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'SOLL_STAGE'
              DataSource = ReEdiDS
              TabOrder = 4
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object SK_Skonto_Proz: TDBEdit
              Left = 149
              Top = 65
              Width = 40
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'SOLL_SKONTO'
              DataSource = ReEdiDS
              TabOrder = 5
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object SK_Netto_Tage: TDBEdit
              Left = 234
              Top = 65
              Width = 28
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'SOLL_NTAGE'
              DataSource = ReEdiDS
              TabOrder = 6
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object RE_Datum: TJvDBDateEdit
              Tag = 1
              Left = 88
              Top = 88
              Width = 231
              Height = 19
              Hint = 'Datum der Eingangsrechnung'
              DataField = 'RDATUM'
              DataSource = ReEdiDS
              AutoSelect = False
              NumGlyphs = 2
              YearDigits = dyFour
              TabOrder = 7
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyPress = KuNrEditKeyPress
              OnKeyDown = KuNrEditKeyDown
            end
            object Org_num: TDBEdit
              Tag = 1
              Left = 87
              Top = 110
              Width = 232
              Height = 19
              Hint = 'Belegnummer der Eingangsrechnung'
              AutoSelect = False
              AutoSize = False
              DataField = 'ORGNUM'
              DataSource = ReEdiDS
              TabOrder = 8
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object USR1: TDBEdit
              Tag = 1
              Left = 88
              Top = 136
              Width = 231
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'USR1'
              DataSource = ReEdiDS
              MaxLength = 40
              TabOrder = 9
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object USR2: TDBEdit
              Tag = 1
              Left = 88
              Top = 156
              Width = 231
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'USR2'
              DataSource = ReEdiDS
              Enabled = False
              MaxLength = 40
              TabOrder = 10
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 394
          Width = 764
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel1'
          TabOrder = 3
          object Panel16: TPanel
            Left = 0
            Top = 0
            Width = 3
            Height = 24
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel17: TPanel
            Left = 761
            Top = 0
            Width = 3
            Height = 24
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel18: TPanel
            Left = 3
            Top = 0
            Width = 758
            Height = 24
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 3
            Color = 14680063
            TabOrder = 2
            object Label36: TLabel
              Left = 302
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
            object Label37: TLabel
              Left = 458
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
            object Label39: TLabel
              Left = 599
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
            object Label34: TLabel
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
            object Panel19: TPanel
              Left = 655
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
            object Panel27: TPanel
              Left = 514
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
            object Panel28: TPanel
              Left = 358
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
          end
        end
        object CaoGroupBox3: TOFGroupBox
          Left = 0
          Top = 251
          Width = 764
          Height = 143
          Align = alClient
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 4
        end
      end
      object PosTS: TTabSheet
        Caption = 'P&ositionen'
        ImageIndex = 1
        object KunDatGB2: TOFGroupBox
          Left = 0
          Top = 0
          Width = 764
          Height = 68
          Align = alTop
          Caption = 'Lieferant'
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
          object Label1: TLabel
            Left = 5
            Top = 23
            Width = 84
            Height = 13
            AutoSize = False
            Caption = 'Ku-Nr. vom Lief. :'
            Color = 14680063
            ParentColor = False
          end
          object Label4: TLabel
            Left = 5
            Top = 46
            Width = 84
            Height = 13
            AutoSize = False
            Caption = 'Intern-Nr:'
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
            Width = 388
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
            Width = 476
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 3
            object DBText9: TDBText
              Left = 3
              Top = 2
              Width = 245
              Height = 16
              DataField = 'KUN_NAME1'
              DataSource = ReEdiDS
            end
          end
          object Panel13: TPanel
            Left = 88
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
              DataField = 'VRENUM'
              DataSource = ReEdiDS
            end
          end
          object Panel25: TPanel
            Left = 88
            Top = 20
            Width = 105
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 5
            object DBText12: TDBText
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
        object CenterPan: TPanel
          Left = 0
          Top = 68
          Width = 764
          Height = 326
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object OffBestGB: TOFGroupBox
            Left = 0
            Top = 208
            Width = 764
            Height = 118
            Align = alBottom
            Caption = 'offene Bestellungen'
            Color = 14680063
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            TabOrder = 0
            object OffBestGrid: TOFDBGrid
              Left = 8
              Top = 21
              Width = 748
              Height = 89
              Align = alClient
              BorderStyle = bsNone
              DataSource = OffBestDS
              DefaultDrawing = False
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = OffBestGridDblClick
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 24
              TitleRowHeight = 24
              RowColor1 = 12255087
              RowColor2 = clWindow
              ShowTextEllipsis = False
              ShowTitleEllipsis = True
              RowSizingAllowed = True
              DefaultRowHeight = 15
              MultiLineTitles = True
              LinesPerRow = 2
              EditColor = 10485663
              Columns = <
                item
                  Expanded = False
                  FieldName = 'VRENUM'
                  Title.Caption = 'Best.-Nr.'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RDATUM'
                  Title.Caption = 'Datum'
                  Width = 56
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LDATUM'
                  Title.Caption = 'Lieferdatum'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ARTNUM'
                  Title.Caption = 'Artikelnr.'
                  Width = 77
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MATCHCODE'
                  Title.Caption = 'Match'
                  Width = 74
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BEZEICHNUNG'
                  Title.Caption = 'Bezeichnung'
                  Width = 155
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MENGE_BEST'
                  Title.Caption = 'Bestellmenge'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MENGE_OFFEN'
                  Title.Caption = 'Menge offen'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EPREIS'
                  Title.Caption = 'E-Preis'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RABATT'
                  Title.Caption = 'Rab.'
                  Width = 46
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RABATT2'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'RABATT3'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'POSREC_ID'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'ARTIKEL_ID'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'MENGE_EK'
                  Visible = False
                end>
            end
          end
          object OffBestSplitter: TJvxSplitter
            Left = 0
            Top = 203
            Width = 764
            Height = 5
            ControlFirst = PosiGB
            ControlSecond = OffBestGB
            Align = alBottom
            BevelInner = bvLowered
            BevelOuter = bvLowered
            Ctl3D = True
            TopLeftLimit = 150
            BottomRightLimit = 100
          end
          object PosiGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 764
            Height = 203
            Align = alClient
            Caption = 'Positionen'
            Color = 14680063
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            TabOrder = 2
            object PosGrid: TExRxDBGrid
              Left = 8
              Top = 21
              Width = 748
              Height = 174
              Align = alClient
              BorderStyle = bsNone
              DataSource = PosDS
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
              ParentShowHint = False
              ShowHint = True
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
              DefaultRowHeight = 29
              RowSizingAllowed = True
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
              LinesPerRow = 2
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
        end
        object ToolBar1: TToolBar
          Left = 0
          Top = 418
          Width = 764
          Height = 34
          Align = alBottom
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 104
          Caption = 'ToolBar1'
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = MainForm.VorgangImgList
          List = True
          ShowCaptions = True
          TabOrder = 2
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
          object Panel36: TPanel
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
          object EditSNBtn: TToolButton
            Left = 189
            Top = 0
            AutoSize = True
            Caption = 'Seriennummern'
            ImageIndex = 13
            OnClick = EditSNBtnClick
          end
          object DelBtn: TToolButton
            Left = 297
            Top = 0
            AutoSize = True
            Caption = 'L'#246'schen'
            ImageIndex = 6
            OnClick = DelBtnClick
          end
          object UpBtn: TToolButton
            Left = 373
            Top = 0
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 3
            OnClick = UpBtnClick
          end
          object DownBtn: TToolButton
            Left = 429
            Top = 0
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 4
            OnClick = DownBtnClick
          end
          object DBNavigator3: TDBNavigator
            Left = 485
            Top = 0
            Width = 120
            Height = 26
            DataSource = PosDS
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
            Flat = True
            TabOrder = 0
          end
          object ToolButton2: TToolButton
            Left = 605
            Top = 0
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 10
            Style = tbsSeparator
          end
          object GotoFertigBtn: TToolButton
            Left = 613
            Top = 0
            AutoSize = True
            Caption = 'Weiter'
            ImageIndex = 9
            OnClick = GotoFertigBtnClick
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 394
          Width = 764
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel1'
          TabOrder = 3
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
            Left = 761
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
            Width = 758
            Height = 24
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 3
            Color = 14680063
            TabOrder = 2
            object Label18: TLabel
              Left = 302
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
            object Label19: TLabel
              Left = 458
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
            object Label20: TLabel
              Left = 599
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
            object Label33: TLabel
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
            object bsumpan: TPanel
              Left = 655
              Top = 3
              Width = 100
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              BorderWidth = 2
              Color = 14680063
              TabOrder = 0
              object DBText10: TDBText
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
            object msumpan: TPanel
              Left = 514
              Top = 3
              Width = 85
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              BorderWidth = 2
              Color = 14680063
              TabOrder = 1
              object DBText25: TDBText
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
            object nsumpan: TPanel
              Left = 358
              Top = 3
              Width = 100
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              BorderWidth = 2
              Color = 14680063
              TabOrder = 2
              object DBText26: TDBText
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
          end
        end
      end
      object Fertig: TTabSheet
        Caption = '&Fertig'
        ImageIndex = 3
        object KunDatGB4: TOFGroupBox
          Left = 0
          Top = 0
          Width = 764
          Height = 68
          Align = alTop
          Caption = 'Lieferant'
          Color = 14680063
          Ctl3D = False
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 0
          object Label10: TLabel
            Left = 199
            Top = 46
            Width = 78
            Height = 13
            AutoSize = False
            Caption = 'Land/Plz/Ort:'
          end
          object Label11: TLabel
            Left = 199
            Top = 23
            Width = 77
            Height = 13
            AutoSize = False
            Caption = 'Name1:'
          end
          object Label12: TLabel
            Left = 5
            Top = 46
            Width = 84
            Height = 13
            AutoSize = False
            Caption = 'Intern-Nr:'
          end
          object Label13: TLabel
            Left = 5
            Top = 23
            Width = 84
            Height = 13
            AutoSize = False
            Caption = 'Ku-Nr. vom Lief. :'
            Color = 14680063
            ParentColor = False
          end
          object Panel20: TPanel
            Left = 308
            Top = 43
            Width = 58
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 0
            object DBText18: TDBText
              Left = 3
              Top = 2
              Width = 52
              Height = 15
              DataField = 'KUN_PLZ'
              DataSource = ReEdiDS
            end
          end
          object Panel21: TPanel
            Tag = 1
            Left = 368
            Top = 43
            Width = 388
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 1
            object DBText19: TDBText
              Left = 3
              Top = 2
              Width = 158
              Height = 16
              DataField = 'KUN_ORT'
              DataSource = ReEdiDS
            end
          end
          object Panel22: TPanel
            Left = 280
            Top = 43
            Width = 24
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 2
            object DBText20: TDBText
              Left = 3
              Top = 2
              Width = 18
              Height = 16
              DataField = 'KUN_LAND'
              DataSource = ReEdiDS
            end
          end
          object Panel23: TPanel
            Tag = 1
            Left = 280
            Top = 20
            Width = 476
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 3
            object DBText21: TDBText
              Left = 3
              Top = 2
              Width = 245
              Height = 16
              DataField = 'KUN_NAME1'
              DataSource = ReEdiDS
            end
          end
          object Panel24: TPanel
            Left = 88
            Top = 43
            Width = 105
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 4
            object DBText22: TDBText
              Left = 3
              Top = 2
              Width = 97
              Height = 15
              Alignment = taCenter
              DataField = 'VRENUM'
              DataSource = ReEdiDS
            end
          end
          object Panel26: TPanel
            Left = 88
            Top = 20
            Width = 105
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 5
            object DBText24: TDBText
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
        object ToolBar5: TToolBar
          Left = 0
          Top = 418
          Width = 764
          Height = 34
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 143
          Caption = 'ToolBar2'
          EdgeBorders = []
          Flat = True
          Images = MainForm.VorgangImgList
          List = True
          ShowCaptions = True
          TabOrder = 2
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
            Caption = 'Speichern und Buchen '
            ImageIndex = 11
            OnClick = BuchenBtnClick
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 68
          Width = 764
          Height = 183
          Align = alTop
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 1
          object CaoGroupBox1: TOFGroupBox
            Left = 0
            Top = 0
            Width = 409
            Height = 183
            Align = alLeft
            Caption = 'Zuweisungen'
            Ctl3D = False
            Enabled = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 0
            object Label14: TLabel
              Left = 5
              Top = 26
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Zahlart:'
            end
            object Label16: TLabel
              Left = 5
              Top = 47
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'W'#228'hrung:'
            end
            object Label17: TLabel
              Left = 5
              Top = 70
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Zahlungsziel:'
            end
            object Label21: TLabel
              Left = 119
              Top = 69
              Width = 30
              Height = 13
              AutoSize = False
              Caption = 'Tage'
            end
            object Label24: TLabel
              Left = 193
              Top = 69
              Width = 39
              Height = 13
              AutoSize = False
              Caption = 'Skonto:'
            end
            object Label25: TLabel
              Left = 264
              Top = 69
              Width = 58
              Height = 13
              AutoSize = False
              Caption = 'Tage Netto'
            end
            object Label26: TLabel
              Left = 5
              Top = 94
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'ER-Datum:'
            end
            object Label28: TLabel
              Left = 5
              Top = 114
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'ER-Nummer:'
            end
            object Label29: TLabel
              Left = 5
              Top = 139
              Width = 77
              Height = 34
              AutoSize = False
              Caption = #220'berweisungs- text:'
              WordWrap = True
            end
            object DBEdit1: TDBEdit
              Tag = 1
              Left = 88
              Top = 43
              Width = 313
              Height = 19
              Color = clBtnFace
              DataField = 'WAEHRUNG'
              DataSource = ReEdiDS
              TabOrder = 1
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit2: TDBEdit
              Tag = 1
              Left = 88
              Top = 22
              Width = 313
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              Color = clBtnFace
              DataField = 'Zahlart_Str'
              DataSource = ReEdiDS
              TabOrder = 0
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit3: TDBEdit
              Left = 88
              Top = 66
              Width = 28
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              Color = clBtnFace
              DataField = 'SOLL_STAGE'
              DataSource = ReEdiDS
              TabOrder = 2
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit4: TDBEdit
              Left = 149
              Top = 66
              Width = 40
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              Color = clBtnFace
              DataField = 'SOLL_SKONTO'
              DataSource = ReEdiDS
              TabOrder = 3
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit5: TDBEdit
              Left = 234
              Top = 66
              Width = 28
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              Color = clBtnFace
              DataField = 'SOLL_NTAGE'
              DataSource = ReEdiDS
              TabOrder = 4
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit6: TDBEdit
              Tag = 1
              Left = 87
              Top = 111
              Width = 314
              Height = 19
              AutoSize = False
              Color = clBtnFace
              DataField = 'ORGNUM'
              DataSource = ReEdiDS
              TabOrder = 5
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit7: TDBEdit
              Tag = 1
              Left = 88
              Top = 137
              Width = 313
              Height = 19
              AutoSize = False
              Color = clBtnFace
              DataField = 'USR1'
              DataSource = ReEdiDS
              TabOrder = 6
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit8: TDBEdit
              Tag = 1
              Left = 88
              Top = 157
              Width = 313
              Height = 19
              AutoSize = False
              Color = clBtnFace
              DataField = 'USR2'
              DataSource = ReEdiDS
              TabOrder = 7
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit9: TDBEdit
              Tag = 1
              Left = 87
              Top = 89
              Width = 314
              Height = 19
              AutoSize = False
              Color = clBtnFace
              DataField = 'RDATUM'
              DataSource = ReEdiDS
              TabOrder = 8
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
          object CaoGroupBox2: TOFGroupBox
            Left = 409
            Top = 0
            Width = 355
            Height = 183
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
              Width = 339
              Height = 154
              Align = alClient
              Color = clBtnFace
              DataField = 'INFO'
              DataSource = ReEdiDS
              ScrollBars = ssVertical
              TabOrder = 0
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
        end
        object CaoGroupBox4: TOFGroupBox
          Left = 0
          Top = 251
          Width = 764
          Height = 143
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
        object Panel29: TPanel
          Left = 0
          Top = 394
          Width = 764
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel1'
          TabOrder = 4
          object Panel30: TPanel
            Left = 0
            Top = 0
            Width = 3
            Height = 24
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel31: TPanel
            Left = 761
            Top = 0
            Width = 3
            Height = 24
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel32: TPanel
            Left = 3
            Top = 0
            Width = 758
            Height = 24
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 3
            Color = 14680063
            TabOrder = 2
            object Label40: TLabel
              Left = 302
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
            object Label41: TLabel
              Left = 458
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
            object Label42: TLabel
              Left = 599
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
            object Label30: TLabel
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
            object Panel33: TPanel
              Left = 655
              Top = 3
              Width = 100
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              BorderWidth = 2
              Color = 14680063
              TabOrder = 0
              object DBText27: TDBText
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
            object Panel34: TPanel
              Left = 514
              Top = 3
              Width = 85
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              BorderWidth = 2
              Color = 14680063
              TabOrder = 1
              object DBText28: TDBText
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
            object Panel35: TPanel
              Left = 358
              Top = 3
              Width = 100
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              BorderWidth = 2
              Color = 14680063
              TabOrder = 2
              object DBText29: TDBText
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
          end
        end
      end
    end
    object TopPan: TPanel
      Left = 0
      Top = 0
      Width = 764
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      TabOrder = 1
      object ReEdiTopLab: TLabel
        Left = 0
        Top = 0
        Width = 155
        Height = 23
        Align = alLeft
        Caption = '  Einkauf bearbeiten ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object ButtonPan: TPanel
        Left = 473
        Top = 0
        Width = 287
        Height = 23
        Align = alRight
        AutoSize = True
        BevelOuter = bvNone
        Color = clBtnShadow
        TabOrder = 0
        object AuswahlBtn: TJvSpeedButton
          Tag = 4
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
          Tag = 1
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
          Tag = 5
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
    Left = 77
    Top = 140
  end
  object ReEdiDS: TDataSource
    DataSet = ReEdiTab
    OnDataChange = ReEdiDSDataChange
    Left = 77
    Top = 103
  end
  object ArtikelTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from ARTIKEL'
      'where REC_ID=:ID'
      'LIMIT 0,10')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 41
    Top = 217
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object ArtikelTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object ArtikelTabARTIKELTYP: TStringField
      FieldName = 'ARTIKELTYP'
      Size = 1
    end
    object ArtikelTabARTNUM: TStringField
      FieldName = 'ARTNUM'
    end
    object ArtikelTabMATCHCODE: TStringField
      FieldName = 'MATCHCODE'
    end
    object ArtikelTabBARCODE: TStringField
      FieldName = 'BARCODE'
    end
    object ArtikelTabKURZNAME: TStringField
      FieldName = 'KURZNAME'
      Size = 80
    end
    object ArtikelTabKAS_NAME: TStringField
      FieldName = 'KAS_NAME'
      Size = 80
    end
    object ArtikelTabLANGNAME: TBlobField
      FieldName = 'LANGNAME'
    end
    object ArtikelTabLAENGE: TStringField
      FieldName = 'LAENGE'
    end
    object ArtikelTabGROESSE: TStringField
      FieldName = 'GROESSE'
    end
    object ArtikelTabDIMENSION: TStringField
      FieldName = 'DIMENSION'
    end
    object ArtikelTabGEWICHT: TFloatField
      FieldName = 'GEWICHT'
    end
    object ArtikelTabEK_PREIS: TFloatField
      FieldName = 'EK_PREIS'
      DisplayFormat = ',#0.000'
    end
    object ArtikelTabVK1: TFloatField
      FieldName = 'VK1'
    end
    object ArtikelTabVK2: TFloatField
      FieldName = 'VK2'
    end
    object ArtikelTabVK3: TFloatField
      FieldName = 'VK3'
    end
    object ArtikelTabVK4: TFloatField
      FieldName = 'VK4'
    end
    object ArtikelTabVK5: TFloatField
      FieldName = 'VK5'
    end
    object ArtikelTabSTEUER_CODE: TIntegerField
      FieldName = 'STEUER_CODE'
    end
    object ArtikelTabME_EINHEIT: TStringField
      FieldName = 'ME_EINHEIT'
      Size = 10
    end
    object ArtikelTabPR_EINHEIT: TFloatField
      FieldName = 'PR_EINHEIT'
    end
    object ArtikelTabWARENGRUPPE: TIntegerField
      FieldName = 'WARENGRUPPE'
    end
    object ArtikelTabMENGE_AKT: TFloatField
      FieldName = 'MENGE_AKT'
    end
    object ArtikelTabERLOES_KTO: TIntegerField
      FieldName = 'ERLOES_KTO'
    end
    object ArtikelTabAUFW_KTO: TIntegerField
      FieldName = 'AUFW_KTO'
    end
    object ArtikelTabERSATZ_ARTNUM: TStringField
      FieldName = 'ERSATZ_ARTNUM'
    end
    object ArtikelTabRABGRP_ID: TStringField
      FieldName = 'RABGRP_ID'
      Size = 10
    end
    object ArtikelTabALTTEIL_FLAG: TBooleanField
      FieldName = 'ALTTEIL_FLAG'
      Required = True
    end
    object ArtikelTabNO_RABATT_FLAG: TBooleanField
      FieldName = 'NO_RABATT_FLAG'
      Required = True
    end
    object ArtikelTabNO_BEZEDIT_FLAG: TBooleanField
      FieldName = 'NO_BEZEDIT_FLAG'
      Required = True
    end
    object ArtikelTabNO_EK_FLAG: TBooleanField
      FieldName = 'NO_EK_FLAG'
      Required = True
    end
    object ArtikelTabSN_FLAG: TBooleanField
      FieldName = 'SN_FLAG'
      Required = True
    end
  end
  object ReEdiTab: TOFZQuery
    Connection = DM1.DB1
    AfterOpen = ReEdiTabAfterScroll
    BeforeClose = ReEdiTabBeforeClose
    AfterScroll = ReEdiTabAfterScroll
    OnCalcFields = ReEdiTabCalcFields
    BeforePost = ReEdiTabBeforePost
    AfterPost = ReEdiTabAfterPost
    BeforeDelete = ReEdiTabBeforeDelete
    OnNewRecord = ReEdiTabOnNewRecord
    OFSecurity = DM1.CaoSecurity
    OFModulID = 2050
    OFSubModulID = 0
    UseRecordLock = False
    ShowLockErrors = False
    AutoReleaseLock = False
    Params = <
      item
        DataType = ftString
        Name = 'QUELLE'
        ParamType = ptUnknown
        Value = '13'
      end>
    SQL.Strings = (
      'select * FROM JOURNAL'
      'where QUELLE=:QUELLE'
      'order by VRENUM')
    Left = 43
    Top = 103
    ParamData = <
      item
        DataType = ftString
        Name = 'QUELLE'
        ParamType = ptUnknown
        Value = '13'
      end>
    object ReEdiTabQUELLE: TIntegerField
      FieldName = 'QUELLE'
      Required = True
      Visible = False
    end
    object ReEdiTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
      Visible = False
    end
    object ReEdiTabQUELLE_SUB: TIntegerField
      FieldName = 'QUELLE_SUB'
      Visible = False
    end
    object ReEdiTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
      Visible = False
    end
    object ReEdiTabATRNUM: TIntegerField
      FieldName = 'ATRNUM'
      Visible = False
    end
    object ReEdiTabVRENUM: TStringField
      Alignment = taCenter
      DisplayLabel = 'int. Nr.'
      DisplayWidth = 5
      FieldName = 'VRENUM'
      Required = True
    end
    object ReEdiTabVLSNUM: TStringField
      FieldName = 'VLSNUM'
      Visible = False
    end
    object ReEdiTabFOLGENR: TIntegerField
      FieldName = 'FOLGENR'
      Visible = False
    end
    object ReEdiTabKM_STAND: TIntegerField
      FieldName = 'KM_STAND'
      Visible = False
    end
    object ReEdiTabKFZ_ID: TIntegerField
      FieldName = 'KFZ_ID'
      Visible = False
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
    object ReEdiTabADATUM: TDateField
      FieldName = 'ADATUM'
      Visible = False
    end
    object ReEdiTabLDATUM: TDateField
      FieldName = 'LDATUM'
      Visible = False
    end
    object ReEdiTabTermin: TDateField
      FieldName = 'TERMIN'
      Visible = False
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
    object ReEdiTabNSUMME_0: TFloatField
      FieldName = 'NSUMME_0'
    end
    object ReEdiTabNSUMME_1: TFloatField
      FieldName = 'NSUMME_1'
    end
    object ReEdiTabNSUMME_2: TFloatField
      FieldName = 'NSUMME_2'
    end
    object ReEdiTabNSUMME_3: TFloatField
      FieldName = 'NSUMME_3'
    end
    object ReEdiTabNSUMME: TFloatField
      DisplayLabel = 'Gesamt (netto)'
      DisplayWidth = 9
      FieldName = 'NSUMME'
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
    object ReEdiTabMSUMME: TFloatField
      FieldName = 'MSUMME'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabBSUMME_0: TFloatField
      FieldName = 'BSUMME_0'
    end
    object ReEdiTabBSUMME_1: TFloatField
      FieldName = 'BSUMME_1'
    end
    object ReEdiTabBSUMME_2: TFloatField
      FieldName = 'BSUMME_2'
    end
    object ReEdiTabBSUMME_3: TFloatField
      FieldName = 'BSUMME_3'
    end
    object ReEdiTabBSUMME: TFloatField
      DisplayLabel = 'Brutto'
      FieldName = 'BSUMME'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
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
    object ReEdiTabSOLL_SKONTO: TFloatField
      FieldName = 'SOLL_SKONTO'
      Visible = False
      DisplayFormat = '0.0%'
      EditFormat = '0.0'
    end
    object ReEdiTabSOLL_STAGE: TLargeintField
      FieldName = 'SOLL_STAGE'
      Visible = False
    end
    object ReEdiTabSOLL_NTAGE: TLargeintField
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
    object ReEdiTabRDATUM: TDateField
      DisplayLabel = 'le.'#196'nderung'
      FieldName = 'RDATUM'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object ReEdiTabWV_DatumStr: TStringField
      DisplayLabel = 'Termin'
      FieldKind = fkCalculated
      FieldName = 'WV_Datum-Str'
      Size = 15
      Calculated = True
    end
    object ReEdiTabZahlart_Str: TStringField
      FieldKind = fkLookup
      FieldName = 'Zahlart_Str'
      LookupDataSet = DM1.ZahlartTab
      LookupKeyFields = 'ZAHL_ID'
      LookupResultField = 'LANGBEZ'
      KeyFields = 'ZAHLART'
      Size = 50
      Lookup = True
    end
    object ReEdiTabWaehrung_Str: TStringField
      FieldKind = fkLookup
      FieldName = 'Waehrung_Str'
      LookupDataSet = DM1.WhrungTab
      LookupKeyFields = 'WAEHRUNG'
      LookupResultField = 'LANGBEZ'
      KeyFields = 'WAEHRUNG'
      Size = 50
      Lookup = True
    end
    object ReEdiTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object ReEdiTabMWST_FREI_FLAG: TBooleanField
      FieldName = 'MWST_FREI_FLAG'
      Required = True
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
      'select '
      '  * '
      'from '
      '  JOURNALPOS'
      'where '
      '  JOURNAL_ID = :ID')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '8488'
      end>
    Left = 44
    Top = 139
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
    object PosTabQUELLE: TIntegerField
      FieldName = 'QUELLE'
      Visible = False
    end
    object PosTabQUELLE_SUB: TIntegerField
      FieldName = 'QUELLE_SUB'
      Visible = False
    end
    object PosTabQUELLE_SRC: TIntegerField
      FieldName = 'QUELLE_SRC'
      Required = True
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
    object PosTabVRENUM: TStringField
      FieldName = 'VRENUM'
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
      DisplayWidth = 80
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
      EditFormat = '#0.000'
    end
    object PosTabRABATT: TFloatField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 5
      FieldName = 'RABATT'
      DisplayFormat = ',0.0"%";-,#0.0"%"; '
      EditFormat = '#0.0'
    end
    object PosTabGPREIS: TFloatField
      DisplayLabel = 'G-Preis'
      FieldName = 'GPREIS'
      DisplayFormat = ',#0.00'
    end
    object PosTabNSumme: TCurrencyField
      DisplayLabel = 'G-Preis'
      DisplayWidth = 9
      FieldKind = fkCalculated
      FieldName = 'NSumme'
      DisplayFormat = ',#0.00'
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
    object PosTabGEGENKTO: TIntegerField
      FieldName = 'GEGENKTO'
      Visible = False
    end
    object PosTabSN_FLAG: TBooleanField
      FieldName = 'SN_FLAG'
      Required = True
    end
    object PosTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object PosTabE_RGEWINN: TFloatField
      FieldName = 'E_RGEWINN'
      Visible = False
      DisplayFormat = ',#0.00'
    end
    object PosTabG_RGEWINN: TFloatField
      FieldName = 'G_RGEWINN'
      DisplayFormat = ',#0.00'
    end
    object PosTabE_RABATT_BETRAG: TFloatField
      FieldName = 'E_RABATT_BETRAG'
      DisplayFormat = ',#0.00'
    end
    object PosTabG_RABATT_BETRAG: TFloatField
      FieldName = 'G_RABATT_BETRAG'
      DisplayFormat = ',#0.00'
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
    Left = 255
    Top = 112
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
      object ArtikelHinzufgen1: TMenuItem
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
        OnClick = AddTextBtnClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Kopieren1: TMenuItem
        Caption = 'Kopieren'
        ImageIndex = 14
        ShortCut = 16459
        OnClick = Kopieren1Click
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
      object N5: TMenuItem
        Caption = '-'
      end
      object SpeichernundBuchen1: TMenuItem
        Caption = 'Speichern und Buchen'
        ImageIndex = 18
        ShortCut = 32848
        OnClick = BuchenBtnClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        ShortCut = 16454
        OnClick = Suchen1Click
      end
      object N6: TMenuItem
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
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 4
      object Auswahl1: TMenuItem
        Caption = 'Auswahl'
        Checked = True
        GroupIndex = 2
        RadioItem = True
        ShortCut = 117
        OnClick = GotoAuswahlBtnClick
      end
      object Allgemein1: TMenuItem
        Caption = 'Allgemein'
        GroupIndex = 2
        RadioItem = True
        ShortCut = 118
        OnClick = GotoAllgBtnClick
      end
      object Positionen1: TMenuItem
        Caption = 'Positionen'
        GroupIndex = 2
        RadioItem = True
        ShortCut = 119
        OnClick = GotoPosBtnClick
      end
      object Fertigstellen1: TMenuItem
        Caption = 'Fertigstellen'
        GroupIndex = 2
        RadioItem = True
        ShortCut = 123
        OnClick = GotoFertigBtnClick
      end
      object N4: TMenuItem
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
    object Extras1: TMenuItem
      Caption = 'E&xtras'
      GroupIndex = 4
      object UmschaltungBruttoNetto1: TMenuItem
        Caption = 'Umschaltung Brutto<-->Netto'
        ShortCut = 16469
        OnClick = UmschaltungBruttoNetto1Click
      end
    end
  end
  object SNTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select SN.SERNUMMER,SN.SNUM_ID,SN.ARTIKEL_ID '
      'from JOURNALPOS_SERNUM JPS, ARTIKEL_SERNUM SN '
      
        'where JPS.ARTIKEL_ID=SN.ARTIKEL_ID and JPS.SNUM_ID=SN.SNUM_ID an' +
        'd '
      'JPS.JOURNAL_ID=18834 and JPS.JOURNALPOS_ID=56864')
    Params = <>
    Left = 42
    Top = 178
    object SNTabARTIKEL_ID: TIntegerField
      FieldName = 'ARTIKEL_ID'
      Required = True
    end
    object SNTabSERNUMMER: TStringField
      FieldName = 'SERNUMMER'
      Required = True
      Size = 255
    end
    object SNTabSNUM_ID: TIntegerField
      FieldName = 'SNUM_ID'
    end
  end
  object SNDS: TDataSource
    DataSet = SNTab
    Left = 77
    Top = 178
  end
  object ArtikelPopupMenu: TPopupMenu
    Images = MainForm.ImageList1
    Left = 290
    Top = 112
    object freierArtikel1: TMenuItem
      Caption = 'freien Artikel hinzuf'#252'gen'
      ImageIndex = 20
      OnClick = NeuFrArtBtnClick
    end
    object Text1: TMenuItem
      Caption = 'Text hinzuf'#252'gen'
      ImageIndex = 20
      OnClick = AddTextBtnClick
    end
  end
  object OffBestTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = OffBestTabAfterOpen
    SQL.Strings = (
      'select JOURNAL.VRENUM, JOURNAL.RDATUM, JOURNAL.LDATUM,'
      'IFNULL(SUM(JP2.MENGE),0) as MENGE_EK,'
      
        'IFNULL(JOURNALPOS.MENGE-SUM(JP2.MENGE),JOURNALPOS.MENGE) as MENG' +
        'E_OFFEN,'
      'JOURNALPOS.MENGE as MENGE_BEST,'
      
        'JOURNALPOS.REC_ID as POSREC_ID,JOURNALPOS.MATCHCODE, JOURNALPOS.' +
        'ARTNUM, '
      
        'JOURNALPOS.ARTIKEL_ID, JOURNALPOS.EPREIS, JOURNALPOS.RABATT, JOU' +
        'RNALPOS.RABATT2, '
      'JOURNALPOS.RABATT3, JOURNALPOS.BEZEICHNUNG'
      'from JOURNALPOS, JOURNAL'
      
        'left outer join JOURNALPOS as JP2 on JP2.QUELLE_SRC = JOURNALPOS' +
        '.REC_ID '
      'where JOURNALPOS.QUELLE=6 and JOURNALPOS.ADDR_ID=:AID'
      
        'and JOURNALPOS.ARTIKELTYP in ('#39'N'#39','#39'S'#39') and JOURNAL.REC_ID=JOURNA' +
        'LPOS.JOURNAL_ID '
      'and JOURNAL.STADIUM BETWEEN 20 and 98'
      'group by POSREC_ID'
      'having MENGE_OFFEN>0')
    Params = <
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
        Value = '3'
      end>
    Left = 43
    Top = 252
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
        Value = '3'
      end>
    object OffBestTabVRENUM: TStringField
      FieldName = 'VRENUM'
    end
    object OffBestTabRDATUM: TDateField
      FieldName = 'RDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object OffBestTabLDATUM: TDateField
      FieldName = 'LDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object OffBestTabMENGE_EK: TFloatField
      FieldName = 'MENGE_EK'
      DisplayFormat = ',#0.00;-,#0.00,-'
    end
    object OffBestTabMENGE_OFFEN: TFloatField
      FieldName = 'MENGE_OFFEN'
      DisplayFormat = ',#0.00;-,#0.00,-'
    end
    object OffBestTabMENGE_BEST: TFloatField
      FieldName = 'MENGE_BEST'
      DisplayFormat = ',#0.00;-,#0.00,-'
    end
    object OffBestTabPOSREC_ID: TIntegerField
      FieldName = 'POSREC_ID'
    end
    object OffBestTabMATCHCODE: TStringField
      FieldName = 'MATCHCODE'
    end
    object OffBestTabARTNUM: TStringField
      FieldName = 'ARTNUM'
    end
    object OffBestTabARTIKEL_ID: TIntegerField
      FieldName = 'ARTIKEL_ID'
    end
    object OffBestTabEPREIS: TFloatField
      FieldName = 'EPREIS'
      DisplayFormat = ',#0.000'
    end
    object OffBestTabRABATT: TFloatField
      FieldName = 'RABATT'
      DisplayFormat = ',#0.0%'
    end
    object OffBestTabRABATT2: TFloatField
      FieldName = 'RABATT2'
      DisplayFormat = ',#0.0%'
    end
    object OffBestTabRABATT3: TFloatField
      FieldName = 'RABATT3'
      DisplayFormat = ',#0.0%'
    end
    object OffBestTabBEZEICHNUNG: TMemoField
      FieldName = 'BEZEICHNUNG'
      BlobType = ftMemo
    end
  end
  object OffBestDS: TDataSource
    DataSet = OffBestTab
    Left = 77
    Top = 252
  end
end
