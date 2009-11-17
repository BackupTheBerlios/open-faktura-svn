object MakeVKReForm: TMakeVKReForm
  Left = 380
  Top = 108
  Width = 801
  Height = 696
  Caption = 'Rechnung erstellen'
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
    Width = 793
    Height = 650
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
      Width = 793
      Height = 623
      ActivePage = PosDetailTS
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
          Width = 793
          Height = 566
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
          OnDrawColumnCell = ReEdiListGridDrawColumnCell
          OnDblClick = DBGrid1DblClick
          TitleButtons = True
          OnTitleBtnClick = ReEdiListGridTitleBtnClick
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
          OnApplyCellAttribute = ReEdiListGridApplyCellAttribute
          Columns = <
            item
              Expanded = False
              FieldName = 'STADIUM'
              Title.Caption = ' '
              Width = 16
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VRENUM'
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
              FieldName = 'ZAHLART_STR'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIEFART_STR'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STADIUM_STR'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_SHOPSTATUS'
              Title.Caption = 'Shop-Status'
              Width = 120
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
          Top = 566
          Width = 793
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
            OnClick = DBGrid1DblClick
          end
        end
      end
      object AdressTS: TTabSheet
        Caption = 'All&gemein'
        object KundatGB: TOFGroupBox
          Left = 0
          Top = 0
          Width = 793
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
            Caption = 'Kunde:'
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
            Width = 417
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 1
            object DBText5: TDBText
              Left = 3
              Top = 2
              Width = 42
              Height = 13
              AutoSize = True
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
            Width = 505
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 3
            object DBText4: TDBText
              Left = 3
              Top = 2
              Width = 42
              Height = 13
              AutoSize = True
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
              DataField = 'VRENUM'
              DataSource = ReEdiDS
            end
          end
        end
        object AlgPan3: TPanel
          Left = 0
          Top = 173
          Width = 793
          Height = 156
          Align = alTop
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 2
          OnResize = AlgPan3Resize
          object CaoGroupBox3: TOFGroupBox
            Left = 0
            Top = 0
            Width = 341
            Height = 156
            Align = alLeft
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
              Width = 99
              Height = 19
              AutoSize = False
              DataField = 'GLOBRABATT'
              DataSource = ReEdiDS
              TabOrder = 12
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object PR_EbeneCB: TVolgaDBEdit
              Left = 88
              Top = 130
              Width = 49
              Height = 19
              ButtonWidth = 17
              DataField = 'PR_EBENE'
              DataSource = ReEdiDS
              DialogStyle = vdsCombo
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
              Width = 218
              Height = 19
              DataField = 'VERTRETER_ID'
              DataSource = ReEdiDS
              KeyField = 'VERTRETER_ID'
              ListField = 'NAME;VNAME'
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
              Width = 218
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
              Width = 218
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
              DataField = 'WAEHRUNG'
              DataSource = ReEdiDS
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clInactiveCaption
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
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
              Width = 218
              Height = 19
              Ctl3D = False
              DataField = 'LIEFART'
              DataSource = ReEdiDS
              KeyField = 'LIEF_ID'
              ListField = 'LANGBEZ'
              ListSource = DM1.LiefArtDS
              ParentCtl3D = False
              TabOrder = 1
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
          object LiefanschrGB: TOFGroupBox
            Left = 341
            Top = 0
            Width = 452
            Height = 156
            Align = alClient
            Caption = 'Lieferanschrift'
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 1
            object Label1: TLabel
              Left = 5
              Top = 24
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Anrede:'
            end
            object Label16: TLabel
              Left = 5
              Top = 45
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Name 1:'
            end
            object Label42: TLabel
              Left = 5
              Top = 68
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Name 2:'
            end
            object Label67: TLabel
              Left = 5
              Top = 89
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Name 3:'
            end
            object Label68: TLabel
              Left = 5
              Top = 112
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Stra'#223'e:'
            end
            object Label69: TLabel
              Left = 5
              Top = 134
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Land/PLZ/Ort:'
            end
            object LiefAnschriftDelBtn: TSpeedButton
              Left = 281
              Top = 20
              Width = 25
              Height = 19
              Hint = 'Lieferanschrift l'#246'schen'
              Flat = True
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333333333333000033338833333333333333333F333333333333
                0000333199833333183333333388F333333F3333000033319998333199833333
                38F38F333F88F33300003331999983199998333338F338F3F8338F3300003333
                199998999998333338F3338F833338F3000033333199999999833333338F3338
                3333F8330000333333199999983333333338F333333F83330000333333399999
                8333333333338F3333383333000033333331999983333333333338F333833333
                00003333331999998333333333333833338F3333000033333199989998333333
                33338333338F333300003333199983199983333333383338F338F33300003333
                1998333199983333338F33838F338F33000033333193333319993333338FF833
                38F338F300003333333333333191333333388333338FFF830000333333333333
                3333333333333333333888330000333333333333333333333333333333333333
                0000}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = LiefAnschriftDelBtnClick
            end
            object LiefAnschriftAuswahlBtn: TJvSpeedButton
              Left = 311
              Top = 20
              Width = 25
              Height = 19
              Hint = 'Lieferanschrift ausw'#228'hlen'
              Flat = True
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                7777770000007777777777777777770000007777770007777700070000007777
                770F0777770F0700000077777700087778000700000077777700000000000700
                00007777770F0000F000070000007777770F0000F00007000000780000000000
                00000700000070FBFB00000800007700000070BFBFBF00B070077700000070FB
                FBFB00F070077700000070BFBFBF00B070077700000070FBFBFBFBF077777700
                000070BFBFBFBFB077777700000070FBF0000008777777000000770007777777
                777777000000777777777777777777000000}
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              OnClick = LiefAnschriftAuswahlBtnClick
            end
            object L_Anrede: TEdit
              Left = 86
              Top = 20
              Width = 190
              Height = 19
              AutoSelect = False
              AutoSize = False
              Enabled = False
              TabOrder = 0
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object L_Name1: TEdit
              Tag = 1
              Left = 86
              Top = 42
              Width = 358
              Height = 19
              AutoSelect = False
              AutoSize = False
              Enabled = False
              TabOrder = 1
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object L_Name2: TEdit
              Tag = 1
              Left = 86
              Top = 64
              Width = 358
              Height = 19
              AutoSelect = False
              AutoSize = False
              Enabled = False
              TabOrder = 2
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object L_Name3: TEdit
              Tag = 1
              Left = 86
              Top = 85
              Width = 358
              Height = 19
              AutoSelect = False
              AutoSize = False
              Enabled = False
              TabOrder = 3
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object L_Strasse: TEdit
              Tag = 1
              Left = 86
              Top = 108
              Width = 358
              Height = 19
              AutoSelect = False
              AutoSize = False
              Enabled = False
              TabOrder = 4
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object L_LAND: TEdit
              Left = 86
              Top = 130
              Width = 19
              Height = 19
              AutoSelect = False
              AutoSize = False
              Enabled = False
              TabOrder = 5
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object L_PLZ: TEdit
              Left = 107
              Top = 130
              Width = 54
              Height = 19
              AutoSelect = False
              AutoSize = False
              Enabled = False
              TabOrder = 6
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object L_Ort: TEdit
              Tag = 1
              Left = 163
              Top = 130
              Width = 281
              Height = 19
              AutoSelect = False
              AutoSize = False
              Enabled = False
              TabOrder = 7
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 566
          Width = 793
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
          Width = 793
          Height = 105
          Align = alTop
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 1
          object TexteGB: TOFGroupBox
            Left = 341
            Top = 0
            Width = 452
            Height = 105
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
              Width = 358
              Height = 19
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
              Width = 358
              Height = 19
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
              Width = 358
              Height = 19
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
            Width = 341
            Height = 105
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
              Caption = 'Bestelldatum:'
            end
            object Label32: TLabel
              Left = 5
              Top = 63
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Referenznr.:'
            end
            object Label63: TLabel
              Left = 5
              Top = 83
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Termin:'
            end
            object best_num: TDBEdit
              Tag = 1
              Left = 86
              Top = 60
              Width = 247
              Height = 19
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
              Width = 247
              Height = 19
              DataField = 'BEST_DATUM'
              DataSource = ReEdiDS
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
              Width = 247
              Height = 19
              ButtonWidth = 16
              Ctl3D = False
              DataField = 'BEST_NAME'
              DataSource = ReEdiDS
              DialogStyle = vdsCombo
              EnterAsTab = False
              ParentCtl3D = False
              TabOrder = 0
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBDateEdit2: TJvDBDateEdit
              Tag = 1
              Left = 86
              Top = 80
              Width = 247
              Height = 19
              DataField = 'TERMIN'
              DataSource = ReEdiDS
              YearDigits = dyFour
              TabOrder = 3
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyPress = KuNrEditKeyPress
              OnKeyDown = KuNrEditKeyDown
            end
          end
        end
        object AlgSumPan: TPanel
          Left = 0
          Top = 542
          Width = 793
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
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
            Left = 790
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
            Width = 787
            Height = 24
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 3
            Color = 14680063
            TabOrder = 2
            object Label14: TLabel
              Left = 360
              Top = 3
              Width = 46
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
              Left = 506
              Top = 3
              Width = 46
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
              Left = 637
              Top = 3
              Width = 47
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
            object Label83: TLabel
              Left = 228
              Top = 3
              Width = 61
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Gewicht :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object RohgewLab1: TLabel
              Left = 96
              Top = 3
              Width = 61
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Rohgew. :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object Panel27: TPanel
              Left = 684
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
              Left = 552
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
              Left = 406
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
              Left = 289
              Top = 3
              Width = 71
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              BorderWidth = 2
              Color = 14680063
              TabOrder = 3
              object DBText41: TDBText
                Left = 2
                Top = 2
                Width = 67
                Height = 14
                Align = alClient
                Alignment = taRightJustify
                DataField = 'GEWICHT'
                DataSource = ReEdiDS
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object RohgewLab2: TPanel
              Left = 157
              Top = 3
              Width = 71
              Height = 18
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              BorderWidth = 2
              Color = 14680063
              TabOrder = 4
              object DBText10: TDBText
                Left = 2
                Top = 2
                Width = 67
                Height = 14
                Align = alClient
                Alignment = taRightJustify
                DataField = 'ROHGEWINN'
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
        object ReAllgBottomPan: TPanel
          Left = 0
          Top = 329
          Width = 793
          Height = 213
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 5
          object InfoGB: TOFGroupBox
            Left = 341
            Top = 0
            Width = 452
            Height = 213
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
              Width = 436
              Height = 184
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
          object Panel53: TPanel
            Left = 0
            Top = 0
            Width = 341
            Height = 213
            Align = alLeft
            BevelOuter = bvNone
            Color = 14680063
            TabOrder = 1
            object ShopStatusGB: TOFGroupBox
              Left = 0
              Top = 166
              Width = 341
              Height = 47
              Align = alBottom
              Caption = 'Shop-Status'
              Color = 14680063
              Ctl3D = False
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentColor = False
              ParentCtl3D = False
              TabOrder = 0
              object ShopStatusLab: TLabel
                Left = 5
                Top = 24
                Width = 33
                Height = 13
                Caption = 'Status:'
              end
              object DBEdit6: TDBEdit
                Left = 88
                Top = 20
                Width = 28
                Height = 19
                AutoSize = False
                CharCase = ecUpperCase
                DataField = 'SHOP_STATUS'
                DataSource = ReEdiDS
                TabOrder = 0
                OnEnter = KuNrEditEnter
                OnExit = KuNrEditExit
                OnKeyDown = KuNrEditKeyDown
                OnKeyPress = KuNrEditKeyPress
              end
              object DBLookupComboBox5: TDBLookupComboBox
                Tag = 1
                Left = 115
                Top = 20
                Width = 218
                Height = 19
                DataField = 'SHOP_STATUS'
                DataSource = ReEdiDS
                KeyField = 'ORDERSTATUS_ID'
                ListField = 'LANGBEZ'
                ListSource = DM1.ShopOSDS
                TabOrder = 1
                OnEnter = KuNrEditEnter
                OnExit = KuNrEditExit
                OnKeyDown = KuNrEditKeyDown
                OnKeyPress = KuNrEditKeyPress
              end
            end
            object KFZGB: TOFGroupBox
              Left = 0
              Top = 0
              Width = 341
              Height = 166
              Align = alClient
              Caption = 'Fahrzeugdaten'
              Color = 14680063
              Ctl3D = False
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentColor = False
              ParentCtl3D = False
              TabOrder = 1
              object Label60: TLabel
                Left = 5
                Top = 103
                Width = 77
                Height = 13
                AutoSize = False
                Caption = 'Kilometerstand:'
              end
              object Label62: TLabel
                Left = 5
                Top = 84
                Width = 77
                Height = 13
                AutoSize = False
                Caption = 'Fahrgestell-Nr.:'
              end
              object Label64: TLabel
                Left = 5
                Top = 23
                Width = 68
                Height = 13
                AutoSize = False
                Caption = 'Kennzeichen:'
              end
              object KFZUebernehmenBtn: TSpeedButton
                Left = 57
                Top = 122
                Width = 93
                Height = 25
                Hint = 'Fahrzeug in Rechnung '#252'bernehmen'
                Caption = #220'bernehmen'
                Flat = True
                Glyph.Data = {
                  BE060000424DBE06000000000000360400002800000024000000120000000100
                  0800000000008802000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A600000000000000000000000000000000000000000000000000000000000000
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
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  03030303030303030303030303030303030303030303FF030303030303030303
                  03030303030303040403030303030303030303030303030303F8F8FF03030303
                  03030303030303030303040202040303030303030303030303030303F80303F8
                  FF030303030303030303030303040202020204030303030303030303030303F8
                  03030303F8FF0303030303030303030304020202020202040303030303030303
                  0303F8030303030303F8FF030303030303030304020202FA0202020204030303
                  0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
                  040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
                  03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
                  FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
                  0303030303030303030303FA0202020403030303030303030303030303F8FF03
                  03F8FF03030303030303030303030303FA020202040303030303030303030303
                  0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
                  03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
                  030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
                  0202040303030303030303030303030303F8FF03F8FF03030303030303030303
                  03030303FA0202030303030303030303030303030303F8FFF803030303030303
                  030303030303030303FA0303030303030303030303030303030303F803030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  0303}
                NumGlyphs = 2
                OnClick = KFZUebernehmenBtnClick
              end
              object KFZAddrAssign: TSpeedButton
                Left = 228
                Top = 122
                Width = 25
                Height = 25
                Hint = 'Fahrzeug dem Kunden zuordnen'
                Flat = True
                Glyph.Data = {
                  66010000424D6601000000000000760000002800000014000000140000000100
                  040000000000F000000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                  DDDDDDDD0000DD70DDD000DDDDDDDDDD0000DF8700007700DDDDDDDD0000D0F8
                  7077FF770DDDDDDD0000DD0F870000F870DDDDDD0000DD00F870880F870DDDDD
                  0000DD080F870880F870DDDD0000D08800F808880F870DDD0000D0F708008888
                  80F870DD0000D0F708888888880F70DD0000DD0F70F8F8888880F70D0000DD0F
                  808F8F880080F70D0000DDD0F0F8F8F08700870D0000DDF07FFFFF80F87000DD
                  0000DDDFFFFFF0F80F8700DD0000DDF8FFF7070000F870DD0000DDDF8FF0FF77
                  880F870D0000DDDDFDF000FFF000F87D0000DDDDDDDDDD000DDD0FDD0000DDDD
                  DDDDDDDDDDDDDDDD0000}
                OnClick = KFZAddrAssignClick
              end
              object Label65: TLabel
                Left = 5
                Top = 44
                Width = 77
                Height = 13
                AutoSize = False
                Caption = 'Schl.-Nr. zu 2.:'
              end
              object Label66: TLabel
                Left = 5
                Top = 63
                Width = 77
                Height = 13
                AutoSize = False
                Caption = 'Schl.-Nr. zu 3.:'
              end
              object KFZAddrErase: TSpeedButton
                Left = 150
                Top = 122
                Width = 78
                Height = 25
                Hint = 'Fahrzeug aus der Rechnung entfernen'
                Caption = 'Verwerfen'
                Flat = True
                Glyph.Data = {
                  DE010000424DDE01000000000000760000002800000024000000120000000100
                  0400000000006801000000000000000000001000000010000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  333333333333333333333333000033338833333333333333333F333333333333
                  0000333199833333183333333388F333333F3333000033319998333199833333
                  38F38F333F88F33300003331999983199998333338F338F3F8338F3300003333
                  199998999998333338F3338F833338F3000033333199999999833333338F3338
                  3333F8330000333333199999983333333338F333333F83330000333333399999
                  8333333333338F3333383333000033333331999983333333333338F333833333
                  00003333331999998333333333333833338F3333000033333199989998333333
                  33338333338F333300003333199983199983333333383338F338F33300003333
                  1998333199983333338F33838F338F33000033333193333319993333338FF833
                  38F338F300003333333333333191333333388333338FFF830000333333333333
                  3333333333333333333888330000333333333333333333333333333333333333
                  0000}
                NumGlyphs = 2
                OnClick = KFZAddrEraseClick
              end
              object KFZAuswahlBtn: TJvSpeedButton
                Left = 253
                Top = 122
                Width = 82
                Height = 25
                Hint = 'Fahrzeugstamm '#246'ffnen und Fahrzeug ausw'#228'hlen'
                Caption = 'Auswahl ...'
                Flat = True
                Glyph.Data = {
                  4E010000424D4E01000000000000760000002800000012000000120000000100
                  040000000000D800000000000000000000001000000010000000000000000000
                  BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  7777770000007777777777777777770000007777770007777700070000007777
                  770F0777770F0700000077777700087778000700000077777700000000000700
                  00007777770F0000F000070000007777770F0000F00007000000780000000000
                  00000700000070FBFB00000800007700000070BFBFBF00B070077700000070FB
                  FBFB00F070077700000070BFBFBF00B070077700000070FBFBFBFBF077777700
                  000070BFBFBFBFB077777700000070FBF0000008777777000000770007777777
                  777777000000777777777777777777000000}
                HotTrackFont.Charset = DEFAULT_CHARSET
                HotTrackFont.Color = clWindowText
                HotTrackFont.Height = -11
                HotTrackFont.Name = 'MS Sans Serif'
                HotTrackFont.Style = []
                OnClick = KFZIDCBButtonClick
              end
              object KFZNavZurueckBtn: TSpeedButton
                Left = 7
                Top = 122
                Width = 25
                Height = 25
                Hint = 'vorheriges Fahrzeug'
                Flat = True
                Glyph.Data = {
                  DE000000424DDE0000000000000076000000280000000D0000000D0000000100
                  0400000000006800000000000000000000001000000010000000000000000000
                  BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  7000777777077777700077777007777770007777060777777000777066000007
                  7000770666666607700070666666660770007706666666077000777066000007
                  7000777706077777700077777007777770007777770777777000777777777777
                  7000}
                OnClick = KFZNavZurueckBtnClick
              end
              object KFZNavVorBtn: TSpeedButton
                Left = 32
                Top = 122
                Width = 25
                Height = 25
                Hint = 'n'#228'chstes Fahrzeug'
                Flat = True
                Glyph.Data = {
                  DE000000424DDE0000000000000076000000280000000D0000000D0000000100
                  0400000000006800000000000000000000001000000010000000000000000000
                  BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  7000777777077777700077777700777770007777770607777000770000066077
                  7000770666666607700077066666666070007706666666077000770000066077
                  7000777777060777700077777700777770007777770777777000777777777777
                  7000}
                OnClick = KFZNavVorBtnClick
              end
              object KFZFGSTNR: TDBEdit
                Tag = 1
                Left = 86
                Top = 80
                Width = 247
                Height = 19
                AutoSize = False
                DataField = 'FGST_NUM'
                DataSource = ReKFZDS
                Enabled = False
                ReadOnly = True
                TabOrder = 0
                OnEnter = KuNrEditEnter
                OnExit = KuNrEditExit
                OnKeyDown = KuNrEditKeyDown
                OnKeyPress = KuNrEditKeyPress
              end
              object KFZ_KMSTAND: TDBEdit
                Tag = 1
                Left = 86
                Top = 100
                Width = 247
                Height = 19
                AutoSize = False
                DataField = 'KM_STAND'
                DataSource = ReEdiDS
                TabOrder = 1
                OnEnter = KuNrEditEnter
                OnExit = KuNrEditExit
                OnKeyDown = KuNrEditKeyDown
                OnKeyPress = KuNrEditKeyPress
              end
              object KFZPolKZ: TDBEdit
                Tag = 1
                Left = 86
                Top = 20
                Width = 247
                Height = 18
                AutoSize = False
                DataField = 'POL_KENNZ'
                DataSource = ReKFZDS
                Enabled = False
                ReadOnly = True
                TabOrder = 2
                OnEnter = KuNrEditEnter
                OnExit = KuNrEditExit
                OnKeyDown = KuNrEditKeyDown
                OnKeyPress = KuNrEditKeyPress
              end
              object KFZ_SCHL_ZU_2: TDBEdit
                Tag = 1
                Left = 86
                Top = 40
                Width = 247
                Height = 19
                AutoSize = False
                DataField = 'SCHL_ZU_2'
                DataSource = ReKFZDS
                Enabled = False
                ReadOnly = True
                TabOrder = 3
                OnEnter = KuNrEditEnter
                OnExit = KuNrEditExit
                OnKeyDown = KuNrEditKeyDown
                OnKeyPress = KuNrEditKeyPress
              end
              object KFZ_SCHL_ZU_3: TDBEdit
                Tag = 1
                Left = 86
                Top = 60
                Width = 247
                Height = 19
                AutoSize = False
                DataField = 'SCHL_ZU_3'
                DataSource = ReKFZDS
                Enabled = False
                TabOrder = 4
                OnEnter = KuNrEditEnter
                OnExit = KuNrEditExit
                OnKeyDown = KuNrEditKeyDown
                OnKeyPress = KuNrEditKeyPress
              end
            end
          end
        end
      end
      object PosTS: TTabSheet
        Caption = 'P&ositionen'
        ImageIndex = 1
        object ToolBar1: TToolBar
          Left = 0
          Top = 566
          Width = 793
          Height = 34
          Align = alBottom
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 110
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
              ArrowWidth = 17
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
          object EditSNBtn1: TToolButton
            Left = 189
            Top = 0
            AutoSize = True
            Caption = '&Seriennummern'
            ImageIndex = 13
            OnClick = EditSNBtn1Click
          end
          object PosDelBtn1: TToolButton
            Left = 297
            Top = 0
            Hint = 'Position l'#246'schen'
            AutoSize = True
            Caption = 'L'#246'schen'
            ImageIndex = 6
            OnClick = PosDelBtn1Click
          end
          object UpBtn1: TToolButton
            Left = 373
            Top = 0
            Hint = 'Position nach oben verschieben'
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 3
            OnClick = UpBtn1Click
          end
          object DownBtn1: TToolButton
            Left = 429
            Top = 0
            Hint = 'Position nach unten verschieben'
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 4
            OnClick = DownBtn1Click
          end
          object DBNavigator3: TDBNavigator
            Left = 485
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
        object CaoGroupBox8: TOFGroupBox
          Left = 0
          Top = 68
          Width = 793
          Height = 385
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
            Width = 777
            Height = 356
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
                Title.Caption = 'Suchbegriff'#13#10'Artikelnummer'
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
                FieldName = 'MWST'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VLSNUM'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'MENGE_GELIEFERT'
                Title.Caption = 'Menge geliefert'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'GEWICHT'
                Visible = True
              end>
          end
        end
        object PosSumPan: TPanel
          Left = 0
          Top = 542
          Width = 793
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
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
            Left = 790
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
          Top = 453
          Width = 793
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
            Left = 790
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
            Width = 787
            Height = 24
            Hint = 'mit F9 kann man diese Info ein- und ausschalten ...'
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 5
            Color = 14680063
            TabOrder = 2
            DesignSize = (
              787
              24)
            object InfoEKLab: TLabel
              Left = 440
              Top = 5
              Width = 68
              Height = 14
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
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
            object InfoRGWLab: TLabel
              Left = 612
              Top = 5
              Width = 75
              Height = 14
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
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
              Height = 14
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
              Left = 72
              Top = 5
              Width = 367
              Height = 14
              Alignment = taRightJustify
              Anchors = [akLeft, akTop, akRight]
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
              Left = 508
              Top = 5
              Width = 99
              Height = 14
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              DataField = 'EK_PREIS'
              DataSource = PosDS
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object InfoRGW: TDBText
              Left = 686
              Top = 5
              Width = 96
              Height = 14
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              DataField = 'E_RGEWINN'
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
          Top = 477
          Width = 793
          Height = 65
          Align = alBottom
          BevelOuter = bvNone
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
        end
        object PosKunDatPan: TPanel
          Left = 0
          Top = 0
          Width = 793
          Height = 68
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 5
          object KunDatGB2: TOFGroupBox
            Left = 0
            Top = 0
            Width = 793
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
              Caption = 'Kunde:'
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
              Width = 417
              Height = 20
              Alignment = taRightJustify
              BevelOuter = bvLowered
              TabOrder = 1
              object DBText3: TDBText
                Left = 3
                Top = 2
                Width = 42
                Height = 13
                AutoSize = True
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
              Width = 505
              Height = 20
              Alignment = taRightJustify
              BevelOuter = bvLowered
              TabOrder = 3
              object DBText9: TDBText
                Left = 3
                Top = 2
                Width = 42
                Height = 13
                AutoSize = True
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
                DataField = 'VRENUM'
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
      object PosDetailTS: TTabSheet
        Caption = 'Detail'
        ImageIndex = 4
        object ToolBar4: TToolBar
          Left = 0
          Top = 566
          Width = 793
          Height = 34
          Align = alBottom
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 110
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
          TabOrder = 5
          Wrapable = False
          object PosDetailZurueckBtn: TToolButton
            Left = 0
            Top = 0
            AutoSize = True
            Caption = 'Zur'#252'ck'
            ImageIndex = 8
            OnClick = GotoAllgBtnClick
          end
          object ToolButton7: TToolButton
            Left = 69
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 11
            Style = tbsSeparator
          end
          object Panel37: TPanel
            Left = 77
            Top = 0
            Width = 112
            Height = 26
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object JvArrowButton1: TJvArrowButton
              Left = 0
              Top = 0
              Width = 112
              Height = 26
              ArrowWidth = 17
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
          object EditSNBtn2: TToolButton
            Left = 189
            Top = 0
            AutoSize = True
            Caption = '&Seriennummern'
            ImageIndex = 13
            OnClick = EditSNBtn1Click
          end
          object PosDelBtn2: TToolButton
            Left = 297
            Top = 0
            Hint = 'Position l'#246'schen'
            AutoSize = True
            Caption = 'L'#246'schen'
            ImageIndex = 6
            OnClick = PosDelBtn1Click
          end
          object UpBtn2: TToolButton
            Left = 373
            Top = 0
            Hint = 'Position nach oben verschieben'
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 3
            OnClick = UpBtn1Click
          end
          object DownBtn2: TToolButton
            Left = 429
            Top = 0
            Hint = 'Position nach unten verschieben'
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 4
            OnClick = DownBtn1Click
          end
          object DBNavigator2: TDBNavigator
            Left = 485
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
          object ToolButton14: TToolButton
            Left = 605
            Top = 0
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 10
            Style = tbsSeparator
          end
          object PosDetailWeiterBtn: TToolButton
            Left = 613
            Top = 0
            AutoSize = True
            Caption = 'Weiter'
            ImageIndex = 9
            OnClick = GotoFertigBtnClick
          end
        end
        object PosDetailKundatPan: TPanel
          Left = 0
          Top = 0
          Width = 793
          Height = 68
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Kundendaten'
          TabOrder = 0
        end
        object CaoGroupBox10: TOFGroupBox
          Left = 0
          Top = 68
          Width = 793
          Height = 129
          Align = alTop
          Caption = 'akt. Position'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 1
          object Label79: TLabel
            Left = 241
            Top = 23
            Width = 26
            Height = 13
            AutoSize = False
            Caption = 'Text:'
          end
          object DetailMatchLab: TLabel
            Left = 5
            Top = 46
            Width = 77
            Height = 13
            AutoSize = False
            Caption = 'Suchbegriff:'
          end
          object DetailArtNumLab: TLabel
            Left = 5
            Top = 25
            Width = 77
            Height = 13
            AutoSize = False
            Caption = 'Artikelnr.:'
          end
          object DBText31: TDBText
            Left = 117
            Top = 1
            Width = 64
            Height = 13
            DataField = 'POSITION'
            DataSource = PosDS
          end
          object DetailBarcodeLab: TLabel
            Left = 5
            Top = 68
            Width = 77
            Height = 13
            AutoSize = False
            Caption = 'Barcode/EAN:'
          end
          object Label84: TLabel
            Left = 198
            Top = 0
            Width = 77
            Height = 13
            AutoSize = False
            Caption = 'Artikeltyp:'
          end
          object DetailArtikelTyp: TLabel
            Left = 279
            Top = 0
            Width = 137
            Height = 13
            AutoSize = False
            Caption = 'DetailArtikelTyp'
          end
          object DetailVPELab: TLabel
            Left = 160
            Top = 89
            Width = 26
            Height = 13
            AutoSize = False
            Caption = 'VPE:'
          end
          object DetailGewichtLab: TLabel
            Left = 5
            Top = 89
            Width = 77
            Height = 13
            AutoSize = False
            Caption = 'Gewicht (Kg):'
          end
          object DetailText: TDBMemo
            Tag = 1
            Left = 272
            Top = 22
            Width = 513
            Height = 101
            Ctl3D = False
            DataField = 'BEZEICHNUNG'
            DataSource = PosDS
            ParentCtl3D = False
            ScrollBars = ssVertical
            TabOrder = 5
            WantTabs = True
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
          object DetailArtnum: TDBEdit
            Left = 85
            Top = 23
            Width = 149
            Height = 19
            Ctl3D = False
            DataField = 'ARTNUM'
            DataSource = PosDS
            ParentCtl3D = False
            TabOrder = 0
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
          object DetailMatch: TDBEdit
            Left = 85
            Top = 44
            Width = 149
            Height = 19
            Ctl3D = False
            DataField = 'MATCHCODE'
            DataSource = PosDS
            ParentCtl3D = False
            TabOrder = 1
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
          object DetailBarcode: TDBEdit
            Left = 85
            Top = 65
            Width = 149
            Height = 19
            Ctl3D = False
            DataField = 'BARCODE'
            DataSource = PosDS
            ParentCtl3D = False
            TabOrder = 2
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
          object DetailVPE: TDBEdit
            Left = 189
            Top = 86
            Width = 44
            Height = 19
            Ctl3D = False
            DataField = 'VPE'
            DataSource = PosDS
            ParentCtl3D = False
            TabOrder = 4
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
          object DetailGewichtEdi: TDBEdit
            Left = 85
            Top = 86
            Width = 68
            Height = 19
            Ctl3D = False
            DataField = 'GEWICHT'
            DataSource = PosDS
            ParentCtl3D = False
            TabOrder = 3
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
        end
        object PosDetailSumPan: TPanel
          Left = 0
          Top = 542
          Width = 793
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 4
          object Panel41: TPanel
            Left = 0
            Top = 0
            Width = 3
            Height = 24
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel42: TPanel
            Left = 790
            Top = 0
            Width = 3
            Height = 24
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
        object PosDetailInfoPan: TPanel
          Left = 0
          Top = 284
          Width = 793
          Height = 258
          Align = alClient
          BevelOuter = bvNone
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 3
          object Panel55: TPanel
            Left = 0
            Top = 0
            Width = 3
            Height = 210
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel58: TPanel
            Left = 790
            Top = 0
            Width = 3
            Height = 210
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel59: TPanel
            Left = 3
            Top = 0
            Width = 787
            Height = 210
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object Panel57: TPanel
              Left = 0
              Top = 0
              Width = 787
              Height = 5
              Align = alTop
              BevelOuter = bvNone
              Color = 14680063
              TabOrder = 0
            end
            object PreisPC: TJvPageControl
              Left = 0
              Top = 5
              Width = 787
              Height = 202
              ActivePage = LiefTS
              Align = alClient
              Style = tsButtons
              TabOrder = 1
              OnChange = PreisPCChange
              OnResize = PreisPCResize
              ParentColor = False
              Color = 14680063
              object PreisAlgTS: TTabSheet
                Tag = 2
                Caption = 'Preise allgemein'
                ImageIndex = 1
                object PreisGrid: TJvStringGrid
                  Left = 0
                  Top = 0
                  Width = 487
                  Height = 77
                  ColCount = 6
                  Ctl3D = False
                  DefaultColWidth = 100
                  DefaultRowHeight = 18
                  RowCount = 4
                  Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected]
                  ParentCtl3D = False
                  ScrollBars = ssNone
                  TabOrder = 0
                  Alignment = taRightJustify
                  FixedFont.Charset = DEFAULT_CHARSET
                  FixedFont.Color = clWindowText
                  FixedFont.Height = -11
                  FixedFont.Name = 'MS Sans Serif'
                  FixedFont.Style = []
                end
              end
              object PreisVKHisTS: TTabSheet
                Caption = 'VK-Historie'
                ImageIndex = 4
                object HistGrid: TOFDBGrid
                  Left = 0
                  Top = 0
                  Width = 779
                  Height = 171
                  Align = alClient
                  BorderStyle = bsNone
                  Ctl3D = False
                  DataSource = HisDS
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
                      FieldName = 'KUN_NAME1'
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
              object LiefPreisTS: TTabSheet
                Tag = 4
                Caption = 'Lieferanten / Preise'
                ImageIndex = 3
                object ArtLiefPreisGrid: TOFDBGrid
                  Left = 0
                  Top = 0
                  Width = 779
                  Height = 167
                  Align = alClient
                  BorderStyle = bsNone
                  DataSource = ArtPreisDS
                  DefaultDrawing = False
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  AutoAppend = False
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
                  EditColor = clHighlight
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
                object Panel56: TPanel
                  Left = 0
                  Top = 167
                  Width = 779
                  Height = 4
                  Align = alBottom
                  BevelOuter = bvNone
                  Color = 14680063
                  TabOrder = 1
                end
              end
              object PreisEKHisTS: TTabSheet
                Caption = 'EK-Historie'
                ImageIndex = 3
              end
              object EKBestTS: TTabSheet
                Caption = 'EK-Bestellungen'
                ImageIndex = 6
              end
              object LiefTS: TTabSheet
                Caption = 'Lieferungen'
                ImageIndex = 7
                object LiefGrid: TOFDBGrid
                  Left = 0
                  Top = 0
                  Width = 779
                  Height = 171
                  Align = alClient
                  BorderStyle = bsNone
                  DataSource = LiefDS
                  DefaultDrawing = False
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  AutoAppend = False
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
                      FieldName = 'VLSNUM'
                      Width = 50
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'LDATUM'
                      Width = 60
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'LIEFART_STR'
                      Width = 100
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'KUN_NAME1'
                      Width = 140
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'MENGE'
                      Width = 50
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'ARTNUM'
                      Width = 60
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'BEZEICHNUNG'
                      Width = 230
                      Visible = True
                    end>
                end
              end
              object TabSheet6: TTabSheet
                Caption = 'Artikel-Info'
                ImageIndex = 5
                object Memo1: TMemo
                  Left = 0
                  Top = 0
                  Width = 779
                  Height = 171
                  Align = alClient
                  ReadOnly = True
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
              object StueckListTS: TTabSheet
                Caption = 'St'#252'ckliste'
                Enabled = False
                ImageIndex = 5
                object StListGrid: TOFDBGrid
                  Left = 0
                  Top = 0
                  Width = 779
                  Height = 171
                  Align = alClient
                  BorderStyle = bsNone
                  DataSource = STListDS
                  DefaultDrawing = False
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  AutoAppend = False
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
                  EditColor = clHighlight
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'MENGE'
                      Width = 60
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'ARTNUM'
                      Width = 90
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'MATCHCODE'
                      Width = 90
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'BARCODE'
                      Width = 90
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'KURZNAME'
                      Width = 200
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
                      Width = 65
                      Visible = True
                    end>
                end
              end
            end
            object Panel60: TPanel
              Left = 0
              Top = 207
              Width = 787
              Height = 3
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 2
            end
          end
          object SchnellerfassungGB: TOFGroupBox
            Left = 0
            Top = 210
            Width = 793
            Height = 48
            Align = alBottom
            Caption = 'Schnellerfassung'
            Color = 14680063
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            TabOrder = 3
            object Label90: TLabel
              Left = 128
              Top = 25
              Width = 69
              Height = 13
              Caption = 'Artikel&nummer:'
              FocusControl = SchnellArtnum
            end
            object Label91: TLabel
              Left = 313
              Top = 25
              Width = 70
              Height = 13
              Caption = 'Barcode/&EAN:'
              FocusControl = SchnellBarcode
            end
            object Label92: TLabel
              Left = 501
              Top = 24
              Width = 60
              Height = 13
              Caption = '&Suchbegriff :'
              FocusControl = SchnellMatchcode
            end
            object Label94: TLabel
              Left = 8
              Top = 25
              Width = 36
              Height = 13
              Caption = 'Menge:'
              FocusControl = SchnellArtnum
            end
            object SchnellArtnum: TEdit
              Tag = -2
              Left = 202
              Top = 22
              Width = 106
              Height = 19
              CharCase = ecUpperCase
              TabOrder = 1
              OnEnter = DetailArtnumEnter
              OnExit = SchnellArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = SchnellArtnumKeyPress
            end
            object SchnellBarcode: TEdit
              Tag = -3
              Left = 389
              Top = 22
              Width = 106
              Height = 19
              TabOrder = 2
              OnEnter = DetailArtnumEnter
              OnExit = SchnellArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = SchnellArtnumKeyPress
            end
            object SchnellMatchcode: TEdit
              Tag = -1
              Left = 567
              Top = 22
              Width = 106
              Height = 19
              TabOrder = 3
              OnEnter = DetailArtnumEnter
              OnExit = SchnellArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = SchnellArtnumKeyPress
            end
            object AddMengeEdi: TJvSpinEdit
              Left = 48
              Top = 22
              Width = 74
              Height = 19
              Alignment = taRightJustify
              ValueType = vtFloat
              Value = 1.000000000000000000
              TabOrder = 0
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
          end
        end
        object PosDetailCalcGB: TOFGroupBox
          Left = 0
          Top = 197
          Width = 793
          Height = 87
          Align = alTop
          Caption = 'Kalkulation'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 2
          object DetailEPreisRLab: TLabel
            Left = 344
            Top = 21
            Width = 53
            Height = 13
            Caption = 'Einzelpreis:'
          end
          object DetailRabattLab: TLabel
            Left = 278
            Top = 21
            Width = 35
            Height = 13
            Caption = 'Rabatt:'
          end
          object DetailRohertragLab: TLabel
            Left = 280
            Top = 64
            Width = 60
            Height = 13
            Caption = 'E-Rohertrag:'
          end
          object DetailEPreisLab: TLabel
            Left = 186
            Top = 21
            Width = 50
            Height = 13
            Caption = 'Basispreis:'
          end
          object DetailFaktorLab: TLabel
            Left = 104
            Top = 21
            Width = 33
            Height = 13
            Caption = 'Faktor:'
          end
          object DetailAufpreisLab: TLabel
            Left = 55
            Top = 64
            Width = 41
            Height = 13
            Caption = 'Aufpreis:'
          end
          object DetailEKPreisLab: TLabel
            Left = 13
            Top = 21
            Width = 43
            Height = 13
            Caption = 'EK-Preis:'
          end
          object DetailMengeLab: TLabel
            Left = 436
            Top = 21
            Width = 36
            Height = 13
            Caption = 'Menge:'
          end
          object DetailGPreisLab: TLabel
            Left = 538
            Top = 21
            Width = 78
            Height = 13
            Caption = 'Gesamtpreis (N):'
          end
          object DetailGPreisBLab: TLabel
            Left = 630
            Top = 21
            Width = 77
            Height = 13
            Caption = 'Gesamtpreis (B):'
          end
          object DetailMEEinheitLab: TLabel
            Left = 486
            Top = 21
            Width = 35
            Height = 13
            Caption = 'Einheit:'
          end
          object DetailRGW_NR: TDBEdit
            Left = 343
            Top = 61
            Width = 88
            Height = 19
            Ctl3D = False
            DataField = 'E_RGEWINN'
            DataSource = PosDS
            ParentCtl3D = False
            TabOrder = 6
            OnChange = DetailRGW_NRChange
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
          object DetailEPreisR: TJvCalcEdit
            Left = 343
            Top = 37
            Width = 88
            Height = 19
            Flat = True
            ParentCtl3D = False
            ShowButton = False
            TabOrder = 5
            DecimalPlacesAlwaysShown = False
            OnChange = DetailEPreisRChange
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
          object DetailRabatt: TDBEdit
            Left = 277
            Top = 37
            Width = 63
            Height = 19
            Ctl3D = False
            DataField = 'RABATT'
            DataSource = PosDS
            ParentCtl3D = False
            TabOrder = 4
            OnChange = DetailRabattChange
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
          object DetailEPreis: TDBEdit
            Left = 185
            Top = 37
            Width = 88
            Height = 19
            Ctl3D = False
            DataField = 'EPREIS'
            DataSource = PosDS
            ParentCtl3D = False
            TabOrder = 3
            OnChange = DetailEPreisChange
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
          object DetailFaktor: TJvCalcEdit
            Left = 103
            Top = 37
            Width = 78
            Height = 19
            Flat = True
            ParentCtl3D = False
            ShowButton = False
            TabOrder = 1
            DecimalPlacesAlwaysShown = False
            OnChange = DetailFaktorChange
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
          object DetailRGW: TJvCalcEdit
            Left = 103
            Top = 61
            Width = 78
            Height = 19
            Flat = True
            ParentCtl3D = False
            ShowButton = False
            TabOrder = 2
            DecimalPlacesAlwaysShown = False
            OnChange = DetailRGWChange
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
          object DetailEKPreis: TDBEdit
            Left = 11
            Top = 37
            Width = 88
            Height = 19
            Ctl3D = False
            DataField = 'EK_PREIS'
            DataSource = PosDS
            ParentCtl3D = False
            TabOrder = 0
            OnChange = DetailEPreisChange
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
          object DetailMenge: TDBEdit
            Left = 435
            Top = 37
            Width = 45
            Height = 19
            Ctl3D = False
            DataField = 'MENGE'
            DataSource = PosDS
            ParentCtl3D = False
            TabOrder = 7
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
          object DetailMEEinheit: TDBEdit
            Left = 485
            Top = 37
            Width = 50
            Height = 19
            Ctl3D = False
            DataField = 'ME_EINHEIT'
            DataSource = PosDS
            ParentCtl3D = False
            TabOrder = 8
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
          object DetailGPreis: TDBEdit
            Left = 539
            Top = 37
            Width = 86
            Height = 19
            Ctl3D = False
            DataField = 'NSumme'
            DataSource = PosDS
            ParentCtl3D = False
            TabOrder = 9
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
          object DetailGPreisB: TDBEdit
            Left = 630
            Top = 37
            Width = 86
            Height = 19
            Ctl3D = False
            DataSource = PosDS
            ParentCtl3D = False
            TabOrder = 10
            OnEnter = DetailArtnumEnter
            OnExit = DetailArtnumExit
            OnKeyDown = DetailArtnumKeyDown
            OnKeyPress = DetailArtnumKeyPress
          end
        end
      end
      object Fertig: TTabSheet
        Caption = '&Fertig'
        ImageIndex = 3
        object ToolBar5: TToolBar
          Left = 0
          Top = 566
          Width = 793
          Height = 34
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 146
          Caption = 'ToolBar2'
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
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
          object LieferscheinBuchenBtn: TToolButton
            Left = 77
            Top = 0
            AutoSize = True
            Caption = '&Lieferschein erstellen'
            ImageIndex = 12
            OnClick = LieferscheinBuchenBtnClick
          end
          object ToolButton8: TToolButton
            Left = 211
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 15
            Style = tbsSeparator
          end
          object TeillieferungBtn: TToolButton
            Left = 219
            Top = 0
            AutoSize = True
            Caption = '&Teillieferung'
            ImageIndex = 12
            OnClick = TeillieferungBtnClick
          end
          object ToolButton6: TToolButton
            Left = 311
            Top = 0
            Width = 8
            Caption = 'ToolButton6'
            ImageIndex = 12
            Style = tbsSeparator
          end
          object BuchenBtn: TToolButton
            Left = 319
            Top = 0
            AutoSize = True
            Caption = 'S&peichern und Buchen'
            ImageIndex = 11
            OnClick = BuchenBtnClick
          end
          object ToolButton1: TToolButton
            Left = 463
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 12
            Style = tbsSeparator
          end
          object PrintPrevBtn: TToolButton
            Left = 471
            Top = 0
            AutoSize = True
            Caption = 'Druck&vorschau'
            ImageIndex = 14
            OnClick = PrintPrevBtnClick
          end
          object ToolButton5: TToolButton
            Left = 579
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 15
            Style = tbsSeparator
          end
          object Label78: TLabel
            Left = 587
            Top = 0
            Width = 52
            Height = 26
            Alignment = taCenter
            AutoSize = False
            Caption = 'Status :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object StadiumCB: TJvDBComboBox
            Left = 639
            Top = 1
            Width = 145
            Height = 24
            DataField = 'STADIUM'
            DataSource = ReEdiDS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 16
            Items.Strings = (
              'in Bearbeitung'
              'bitte pr'#252'fen'
              'Freigegeben'
              'Stapeldruck')
            ParentFont = False
            TabOrder = 0
            Values.Strings = (
              '0'
              '10'
              '20'
              '30')
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 68
          Width = 793
          Height = 84
          Align = alTop
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 1
          object CaoGroupBox1: TOFGroupBox
            Left = 326
            Top = 0
            Width = 467
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
              Width = 373
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
              Width = 373
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
              Width = 373
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
              Caption = 'Referenznr.:'
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
              Caption = 'Bestellt durch:'
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
          Width = 793
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
            Width = 467
            Height = 133
            Align = alClient
            Caption = 'Info'
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 1
            object DBMemo1: TDBMemo
              Left = 8
              Top = 21
              Width = 451
              Height = 104
              Align = alClient
              Color = clBtnFace
              DataField = 'INFO'
              DataSource = ReEdiDS
              Enabled = False
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
          Width = 793
          Height = 257
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
          Top = 542
          Width = 793
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
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
            Left = 790
            Top = 0
            Width = 3
            Height = 24
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
        object FertigKundDatPan: TPanel
          Left = 0
          Top = 0
          Width = 793
          Height = 68
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Kundendaten'
          TabOrder = 5
        end
      end
    end
    object TopPan: TPanel
      Left = 0
      Top = 0
      Width = 793
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
        Width = 173
        Height = 23
        Align = alLeft
        Caption = '  Rechnung bearbeiten ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object ButtonPan: TPanel
        Left = 417
        Top = 0
        Width = 372
        Height = 23
        Align = alRight
        AutoSize = True
        BevelOuter = bvNone
        Color = clBtnShadow
        TabOrder = 0
        object PositionenBtn: TJvSpeedButton
          Tag = 3
          Left = 133
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
          Left = 292
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
        object PosDetailBtn: TJvSpeedButton
          Tag = 5
          Left = 206
          Top = 0
          Width = 86
          Height = 22
          Caption = 'Pos.-Details'
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
          OnClick = PosDetailBtnClick
        end
        object AllgemeinBtn: TJvSpeedButton
          Tag = 1
          Left = 65
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
      end
    end
  end
  object PosDS: TDataSource
    DataSet = PosTab
    Left = 91
    Top = 130
  end
  object ReEdiDS: TDataSource
    DataSet = ReEdiTab
    OnDataChange = ReEdiDSDataChange
    Left = 91
    Top = 97
  end
  object ReEdiTab: TOFZQuery
    Connection = DM1.DB1
    AfterOpen = ReEdiTabAfterScroll
    BeforeClose = ReEdiTabBeforeClose
    AfterScroll = ReEdiTabAfterScroll
    OnCalcFields = ReEdiTabCalcFields
    BeforeEdit = ReEdiTabBeforeEdit
    BeforePost = ReEdiTabBeforePost
    AfterPost = ReEdiTabAfterPost
    BeforeDelete = ReEdiTabBeforeDelete
    OnNewRecord = ReEdiTabOnNewRecord
    OFSecurity = DM1.CaoSecurity
    OFModulID = 2010
    OFSubModulID = 0
    UseRecordLock = True
    ShowLockErrors = True
    LockIDField = 'REC_ID'
    AutoReleaseLock = False
    OnLockError = ReEdiTabLockError
    Params = <
      item
        DataType = ftString
        Name = 'QUELLE'
        ParamType = ptUnknown
        Value = '13'
      end>
    SQL.Strings = (
      'select '
      '  * '
      'from'
      '  JOURNAL'
      'where '
      '  QUELLE = :QUELLE and QUELLE_SUB <> 2'
      'order by '
      '  VRENUM')
    Left = 59
    Top = 97
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
      DisplayFormat = ',#0;-;-'
      EditFormat = '0'
    end
    object ReEdiTabKFZ_ID: TIntegerField
      FieldName = 'KFZ_ID'
      Visible = False
    end
    object ReEdiTabVERTRETER_ID: TIntegerField
      FieldName = 'VERTRETER_ID'
      Visible = False
      DisplayFormat = '0;-;-'
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
    object ReEdiTabWV_DATUM: TDateField
      DisplayLabel = 'Termin'
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
    object ReEdiTabNSUMME: TFloatField
      DisplayLabel = 'Gesamt (netto)'
      DisplayWidth = 9
      FieldName = 'NSUMME'
      DisplayFormat = ',###,##0.00'
      currency = True
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
    object ReEdiTabSOLL_STAGE: TLargeintField
      FieldName = 'SOLL_STAGE'
      Required = True
      Visible = False
    end
    object ReEdiTabSOLL_SKONTO: TFloatField
      FieldName = 'SOLL_SKONTO'
      Visible = False
      DisplayFormat = '0.0%'
      EditFormat = '0.0'
    end
    object ReEdiTabSOLL_NTAGE: TLargeintField
      FieldName = 'SOLL_NTAGE'
      Required = True
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
      DisplayLabel = 'ST'
      FieldName = 'STADIUM'
      Visible = False
    end
    object ReEdiTabSTADIUM_STR: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'STADIUM_STR'
      Size = 100
      Calculated = True
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
      Size = 80
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
      EditFormat = '0'
    end
    object ReEdiTabZAHLART: TIntegerField
      FieldName = 'ZAHLART'
      Visible = False
      DisplayFormat = '0;-;0'
      EditFormat = '0'
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
    object ReEdiTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object ReEdiTabMWST_FREI_FLAG: TBooleanField
      FieldName = 'MWST_FREI_FLAG'
      Required = True
    end
    object ReEdiTabSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
    end
    object ReEdiTabSHOP_ORDERID: TIntegerField
      FieldName = 'SHOP_ORDERID'
    end
    object ReEdiTabSHOP_STATUS: TIntegerField
      FieldName = 'SHOP_STATUS'
    end
    object ReEdiTabSHOP_CHANGE_FLAG: TBooleanField
      FieldName = 'SHOP_CHANGE_FLAG'
      Required = True
    end
    object ReEdiTabLIEF_ADDR_ID: TIntegerField
      FieldName = 'LIEF_ADDR_ID'
    end
    object ReEdiTabPROVIS_WERT: TFloatField
      FieldName = 'PROVIS_WERT'
    end
    object ReEdiTabZAHLART_STR: TStringField
      DisplayLabel = 'Zahlart'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'ZAHLART_STR'
      LookupDataSet = DM1.ZahlartTab
      LookupKeyFields = 'ZAHL_ID'
      LookupResultField = 'LANGBEZ'
      KeyFields = 'ZAHLART'
      Size = 100
      Lookup = True
    end
    object ReEdiTabLIEFART_STR: TStringField
      DisplayLabel = 'Versandart'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'LIEFART_STR'
      LookupDataSet = DM1.LiefArtTab
      LookupKeyFields = 'LIEF_ID'
      LookupResultField = 'LANGBEZ'
      KeyFields = 'LIEFART'
      Size = 100
      Lookup = True
    end
    object ReEdiTabGEWICHT: TFloatField
      FieldName = 'GEWICHT'
      DisplayFormat = ',#0.000" Kg";-,#0.000" Kg";-'
    end
    object ReEdiTabROHGEWINN: TFloatField
      FieldName = 'ROHGEWINN'
      DisplayFormat = ',#0.00'
    end
    object ReEdiTabCALC_SHOPSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_SHOPSTATUS'
      Size = 30
      Calculated = True
    end
    object ReEdiTabCALC_NAME: TStringField
      DisplayLabel = 'Kunde'
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
      'select '
      '  * '
      'from '
      '  JOURNALPOS'
      'where '
      '  JOURNAL_ID = :ID and ARTIKELTYP <> "X"'
      'order by '
      '  POSITION')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '8488'
      end>
    Left = 60
    Top = 130
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
    object PosTabATRNUM: TIntegerField
      FieldName = 'ATRNUM'
      Visible = False
    end
    object PosTabVRENUM: TStringField
      FieldName = 'VRENUM'
      Visible = False
    end
    object PosTabVLSNUM: TStringField
      DisplayLabel = 'Lief.-Nr.'
      FieldName = 'VLSNUM'
      Visible = False
    end
    object PosTabMATCHCODE: TStringField
      DisplayLabel = 'Suchbegriff'
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
    object PosTabBREITE: TStringField
      FieldName = 'BREITE'
    end
    object PosTabHOEHE: TStringField
      FieldName = 'HOEHE'
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
      DisplayLabel = 'Gewicht (Kg)'
      FieldName = 'GEWICHT'
      Visible = False
      DisplayFormat = ',#0.000;-,#0.000;-'
      EditFormat = '0.000'
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
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
      EditFormat = '0.00'
    end
    object PosTabRABATT: TFloatField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 5
      FieldName = 'RABATT'
      DisplayFormat = ',###,##0.0"%";-,###,##0.0"%"; '
      EditFormat = '0.00'
    end
    object PosTabGPREIS: TFloatField
      DisplayLabel = 'G-Preis'
      FieldName = 'GPREIS'
    end
    object PosTabE_RGEWINN: TFloatField
      FieldName = 'E_RGEWINN'
      Visible = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
      EditFormat = '0.00'
    end
    object PosTabG_RGEWINN: TFloatField
      FieldName = 'G_RGEWINN'
    end
    object PosTabE_RABATT_BETRAG: TFloatField
      FieldName = 'E_RABATT_BETRAG'
    end
    object PosTabG_RABATT_BETRAG: TFloatField
      FieldName = 'G_RABATT_BETRAG'
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
      FieldName = 'NSUMME'
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
    object PosTabCALC_STEUERPROZ: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_STEUERPROZ'
      Calculated = True
    end
    object PosTabMwSt: TStringField
      DisplayLabel = 'MwSt'
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'MWST'
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
    object PosTabSN_FLAG: TBooleanField
      FieldName = 'SN_FLAG'
      Required = True
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
    object PosTabPROVIS_PROZ: TFloatField
      FieldName = 'PROVIS_PROZ'
    end
    object PosTabPROVIS_WERT: TFloatField
      FieldName = 'PROVIS_WERT'
    end
    object PosTabVPE: TLargeintField
      FieldName = 'VPE'
    end
    object PosTabMENGE_GELIEFERT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MENGE_GELIEFERT'
      DisplayFormat = ',#0.00;,#0.00;-'
      Calculated = True
    end
    object PosTabEK_PREIS: TFloatField
      FieldName = 'EK_PREIS'
      EditFormat = ',#0.00'
    end
    object PosTabCALC_FAKTOR: TFloatField
      FieldName = 'CALC_FAKTOR'
      DisplayFormat = ',#0.00000'
      EditFormat = '0.00000'
    end
    object PosTabNO_RABATT_FLAG: TBooleanField
      FieldName = 'NO_RABATT_FLAG'
    end
    object PosTabCALC_BPREIS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_BPREIS'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
  end
  object MainMenu1: TJvMainMenu
    AutoHotkeys = maManual
    Images = MainForm.ImageList1
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 273
    Top = 94
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object neuenBelegerstellen1: TMenuItem
        AutoHotkeys = maManual
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
        ImageIndex = 20
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
        ImageIndex = 14
        ShortCut = 16459
        OnClick = Kopieren1Click
      end
      object EKBestellungerstellen1: TMenuItem
        Caption = 'in EK-Bestellung umwandeln'
        ImageIndex = 14
        OnClick = EKBestellungerstellen1Click
      end
      object Storno1: TMenuItem
        Caption = 'Beleg l'#246'schen'
        ImageIndex = 19
        ShortCut = 8238
        OnClick = Del1BtnClick
      end
      object Positionlschen1: TMenuItem
        Caption = 'Position l'#246'schen'
        ImageIndex = 6
        ShortCut = 16430
        OnClick = PosDelBtn1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Teillieferung1: TMenuItem
        Caption = 'Teillieferung'
        ImageIndex = 18
        ShortCut = 32852
        OnClick = TeillieferungBtnClick
      end
      object Lieferscheinerstellen1: TMenuItem
        Caption = 'Lieferschein erstellen'
        ImageIndex = 18
        ShortCut = 32844
        OnClick = LieferscheinBuchenBtnClick
      end
      object Speichernundbuchen1: TMenuItem
        Caption = 'Speichern und buchen'
        ImageIndex = 18
        ShortCut = 32848
        OnClick = BuchenBtnClick
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
      object N7: TMenuItem
        Caption = '-'
        ShortCut = 111
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
        GroupIndex = 1
        RadioItem = True
        ShortCut = 117
        OnClick = GotoAuswahlBtnClick
      end
      object Allgemein1: TMenuItem
        Caption = 'Allgemein'
        GroupIndex = 1
        RadioItem = True
        ShortCut = 118
        OnClick = GotoAllgBtnClick
      end
      object Positionen1: TMenuItem
        Caption = 'Positionen'
        GroupIndex = 1
        RadioItem = True
        ShortCut = 119
        OnClick = GotoPosBtnClick
      end
      object PosDetails1: TMenuItem
        Caption = 'Pos.-Details'
        GroupIndex = 1
        RadioItem = True
        ShortCut = 122
        OnClick = PosDetailBtnClick
      end
      object Fertigstellen1: TMenuItem
        Caption = 'Fertigstellen'
        GroupIndex = 1
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
      object AtrisImport1: TMenuItem
        Caption = 'Atris-Import'
        ImageIndex = 22
        ShortCut = 32887
        OnClick = AtrisImport1Click
      end
      object PossortierennachArtikelnummer1: TMenuItem
        Caption = 'Pos. sortieren nach Artikelnummer'
        OnClick = PossortierennachArtikelnummer1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object UmschaltungBruttoNetto1: TMenuItem
        Caption = 'Umschaltung Brutto<-->Netto'
        ShortCut = 16469
        OnClick = UmschaltungBruttoNetto1Click
      end
    end
  end
  object ReKFZTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = ReKFZTabAfterScroll
    AfterScroll = ReKFZTabAfterScroll
    AfterPost = ReKFZTabAfterScroll
    SQL.Strings = (
      
        'select KFZ_ID,ADDR_ID,FGST_NUM,POL_KENNZ,SCHL_ZU_2,SCHL_ZU_3,KM_' +
        'STAND,'
      'ZULASSUNG,LE_BESUCH,NAE_TUEV,NAE_AU from KFZ'
      'where KFZ_ID=:KID or ADDR_ID=:AID')
    Params = <
      item
        DataType = ftInteger
        Name = 'KID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
      end>
    Left = 160
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'KID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
      end>
    object ReKFZTabKFZ_ID: TIntegerField
      FieldName = 'KFZ_ID'
    end
    object ReKFZTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
    end
    object ReKFZTabFGST_NUM: TStringField
      FieldName = 'FGST_NUM'
      Required = True
    end
    object ReKFZTabPOL_KENNZ: TStringField
      FieldName = 'POL_KENNZ'
      Required = True
      Size = 10
    end
    object ReKFZTabSCHL_ZU_2: TStringField
      FieldName = 'SCHL_ZU_2'
    end
    object ReKFZTabSCHL_ZU_3: TStringField
      FieldName = 'SCHL_ZU_3'
    end
    object ReKFZTabKM_STAND: TIntegerField
      FieldName = 'KM_STAND'
      DisplayFormat = ',#0;-;-'
    end
    object ReKFZTabZULASSUNG: TDateField
      FieldName = 'ZULASSUNG'
    end
    object ReKFZTabLE_BESUCH: TDateField
      FieldName = 'LE_BESUCH'
    end
    object ReKFZTabNAE_TUEV: TDateField
      FieldName = 'NAE_TUEV'
    end
    object ReKFZTabNAE_AU: TDateField
      FieldName = 'NAE_AU'
    end
  end
  object ReKFZDS: TDataSource
    DataSet = ReKFZTab
    Left = 192
    Top = 128
  end
  object SNTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select SN.SERNUMMER,SN.SNUM_ID, SN.ARTIKEL_ID'
      'from JOURNALPOS_SERNUM JPS, ARTIKEL_SERNUM SN'
      'where JPS.SNUM_ID=SN.ARTIKEL_ID and JPS.SNUM_ID=SN.SNUM_ID')
    Params = <>
    Left = 158
    Top = 96
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
    Left = 190
    Top = 96
  end
  object ArtikelPopupMenu: TPopupMenu
    Left = 307
    Top = 94
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
  object HisDS: TDataSource
    DataSet = HisTab
    Left = 94
    Top = 265
  end
  object HisTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = HisTabCalcFields
    SQL.Strings = (
      'select '
      
        'JOURNALPOS.JOURNAL_ID, JOURNALPOS.QUELLE, JOURNALPOS.ARTIKEL_ID,' +
        ' JOURNALPOS.VRENUM, '
      
        'JOURNALPOS.BEZEICHNUNG, JOURNALPOS.MENGE,JOURNALPOS.EPREIS, JOUR' +
        'NALPOS.RABATT, JOURNALPOS.STEUER_CODE,'
      ''
      
        'JOURNAL.REC_ID, JOURNAL.RDATUM, JOURNAL.KUN_NAME1, JOURNAL.WAEHR' +
        'UNG, JOURNAL.MWST_0, '
      
        'JOURNAL.MWST_1, JOURNAL.MWST_2, JOURNAL.MWST_3, JOURNAL.LDATUM, ' +
        'JOURNAL.VLSNUM, JOURNAL.BRUTTO_FLAG'
      ''
      'from JOURNALPOS, JOURNAL'
      ''
      'where JOURNAL.QUELLE=:QID and JOURNALPOS.ARTIKEL_ID =:AID'
      'and JOURNALPOS.JOURNAL_ID = JOURNAL.REC_ID'
      
        'and JOURNALPOS.ARTIKELTYP in ('#39'N'#39','#39'S'#39','#39'L'#39') and JOURNALPOS.ARTIKE' +
        'L_ID>0'
      'order by RDATUM DESC, VRENUM DESC'
      'LIMIT 0,100')
    Params = <
      item
        DataType = ftInteger
        Name = 'QID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
      end>
    MasterSource = PosDS
    Left = 64
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'QID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
      end>
    object HisTabQUELLE: TIntegerField
      FieldName = 'QUELLE'
      Visible = False
    end
    object HisTabRDATUM: TDateField
      Alignment = taCenter
      DisplayLabel = 'Datum'
      DisplayWidth = 10
      FieldName = 'RDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object HisTabLDATUM: TDateField
      Alignment = taCenter
      DisplayLabel = 'Datum'
      FieldName = 'LDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object HisTabVRENUM: TStringField
      DisplayLabel = 'Beleg'
      DisplayWidth = 12
      FieldName = 'VRENUM'
    end
    object HisTabVLSNUM: TStringField
      DisplayLabel = 'Beleg'
      FieldName = 'VLSNUM'
    end
    object HisTabKUN_NAME1: TStringField
      DisplayLabel = 'Kunde / Lieferant'
      DisplayWidth = 30
      FieldName = 'KUN_NAME1'
      Size = 30
    end
    object HisTabMENGE: TFloatField
      DisplayLabel = 'Menge'
      DisplayWidth = 12
      FieldName = 'MENGE'
      DisplayFormat = ',###,##0.00'
    end
    object HisTabEPREIS: TFloatField
      DisplayLabel = 'E-Preis'
      DisplayWidth = 12
      FieldName = 'EPREIS'
      Visible = False
    end
    object HisTabEPREIS_STR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'E-Preis'
      FieldKind = fkCalculated
      FieldName = 'EPREIS_STR'
      Calculated = True
    end
    object HisTabRABATT: TFloatField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 8
      FieldName = 'RABATT'
      DisplayFormat = '0.0 "%";-0.0 "%"; '
    end
    object HisTabGPREIS_STR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Gesamt'
      FieldKind = fkCalculated
      FieldName = 'GPREIS_STR'
      Calculated = True
    end
    object HisTabWAEHRUNG: TStringField
      Alignment = taCenter
      DisplayLabel = 'W'
      DisplayWidth = 2
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object HisTabMWST_0: TFloatField
      FieldName = 'MWST_0'
      Visible = False
    end
    object HisTabMWST_1: TFloatField
      FieldName = 'MWST_1'
      Visible = False
    end
    object HisTabMWST_2: TFloatField
      FieldName = 'MWST_2'
      Visible = False
    end
    object HisTabMWST_3: TFloatField
      FieldName = 'MWST_3'
      Visible = False
    end
    object HisTabSTEUER_CODE: TIntegerField
      DisplayLabel = 'ST-Code'
      FieldName = 'STEUER_CODE'
    end
    object HisTabSTEUER_PROZ: TFloatField
      DisplayLabel = 'MwSt'
      FieldKind = fkCalculated
      FieldName = 'STEUER_PROZ'
      DisplayFormat = '0"%";0"%"; '
      Calculated = True
    end
    object HisTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object HisTabARTIKEL_ID: TIntegerField
      FieldName = 'ARTIKEL_ID'
      Required = True
    end
  end
  object ArtPreisTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = ArtPreisTabCalcFields
    SQL.Strings = (
      'select * from ARTIKEL_PREIS'
      'where ARTIKEL_ID=:ID and PREIS_TYP=5')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 60
    Top = 163
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
    object ArtPreisTabLieferantStr: TStringField
      DisplayLabel = 'Lieferant'
      FieldKind = fkCalculated
      FieldName = 'LieferantStr'
      Size = 255
      Calculated = True
    end
    object ArtPreisTabMENGE2: TLargeintField
      FieldName = 'MENGE2'
      DisplayFormat = ',#0'
    end
    object ArtPreisTabPREIS2: TFloatField
      FieldName = 'PREIS2'
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object ArtPreisTabMENGE3: TLargeintField
      FieldName = 'MENGE3'
      DisplayFormat = ',#0'
    end
    object ArtPreisTabPREIS3: TFloatField
      FieldName = 'PREIS3'
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object ArtPreisTabMENGE4: TLargeintField
      FieldName = 'MENGE4'
      DisplayFormat = ',#0'
    end
    object ArtPreisTabPREIS4: TFloatField
      FieldName = 'PREIS4'
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object ArtPreisTabMENGE5: TLargeintField
      FieldName = 'MENGE5'
      DisplayFormat = ',#0'
    end
    object ArtPreisTabPREIS5: TFloatField
      FieldName = 'PREIS5'
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
  end
  object ArtPreisDS: TDataSource
    DataSet = ArtPreisTab
    Left = 92
    Top = 163
  end
  object STListTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      
        'select ARS.*,  A.ARTNUM, A.MATCHCODE, A.BARCODE, A.KURZNAME, A.E' +
        'K_PREIS, A.MENGE_AKT'
      'from ARTIKEL_STUECKLIST ARS, ARTIKEL A'
      'where ARS.REC_ID=:ID and A.REC_ID=ARS.ART_ID')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 62
    Top = 230
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
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
      DisplayWidth = 8
      FieldName = 'MENGE_AKT'
      DisplayFormat = ',#0.00'
    end
  end
  object STListDS: TDataSource
    DataSet = STListTab
    Left = 95
    Top = 227
  end
  object LiefTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      
        'select J.VLSNUM, J.LDATUM, J.LIEFART, J.KUN_NAME1, JP.ARTNUM, JP' +
        '.MENGE, JP.BEZEICHNUNG'
      'from JOURNAL J, JOURNALPOS JP'
      'where J.REC_ID=JP.JOURNAL_ID'
      'and JP.QUELLE=2 and JP.QUELLE_SRC=:SRC_ID'
      'order by J.LDATUM ASC')
    Params = <
      item
        DataType = ftInteger
        Name = 'SRC_ID'
        ParamType = ptInput
      end>
    Left = 60
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SRC_ID'
        ParamType = ptInput
      end>
    object LiefTabVLSNUM: TStringField
      DisplayLabel = 'LS-Num.'
      DisplayWidth = 7
      FieldName = 'VLSNUM'
      Required = True
    end
    object LiefTabLDATUM: TDateField
      DisplayLabel = 'Lief.-Datum'
      DisplayWidth = 9
      FieldName = 'LDATUM'
    end
    object LiefTabLIEFART: TIntegerField
      DisplayWidth = 7
      FieldName = 'LIEFART'
      Required = True
    end
    object LiefTabKUN_NAME1: TStringField
      DisplayLabel = 'Kunde'
      DisplayWidth = 25
      FieldName = 'KUN_NAME1'
      Size = 40
    end
    object LiefTabARTNUM: TStringField
      DisplayLabel = 'Artikelnr.'
      DisplayWidth = 12
      FieldName = 'ARTNUM'
    end
    object LiefTabMENGE: TFloatField
      DisplayLabel = 'Menge'
      DisplayWidth = 6
      FieldName = 'MENGE'
      Required = True
      DisplayFormat = ',#0.00'
    end
    object LiefTabBEZEICHNUNG: TMemoField
      DisplayLabel = 'Bezeichnung'
      DisplayWidth = 10
      FieldName = 'BEZEICHNUNG'
      BlobType = ftMemo
    end
    object LiefTabLIEFART_STR: TStringField
      DisplayLabel = 'Versand'
      DisplayWidth = 61
      FieldKind = fkLookup
      FieldName = 'LIEFART_STR'
      LookupDataSet = DM1.LiefArtTab
      LookupKeyFields = 'LIEF_ID'
      LookupResultField = 'LANGBEZ'
      KeyFields = 'LIEFART'
      Size = 100
      Lookup = True
    end
  end
  object LiefDS: TDataSource
    DataSet = LiefTab
    Left = 94
    Top = 196
  end
end
