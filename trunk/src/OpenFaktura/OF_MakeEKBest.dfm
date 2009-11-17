object MakeEKBestForm: TMakeEKBestForm
  Left = 498
  Top = 107
  Width = 686
  Height = 531
  Caption = 'Einkauf Bestellung erfassen'
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
    Width = 678
    Height = 485
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
      Width = 678
      Height = 458
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
          Width = 678
          Height = 401
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
              Expanded = False
              FieldName = 'LDATUM'
              Title.Caption = 'Lieferdatum'
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
          Top = 401
          Width = 678
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
          Width = 678
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
            Width = 300
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
            Width = 388
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
          Top = 401
          Width = 678
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
          Width = 678
          Height = 160
          Align = alTop
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 1
          OnResize = AlgPan2Resize
          object LiefanschrGB: TOFGroupBox
            Left = 328
            Top = 0
            Width = 350
            Height = 160
            Align = alClient
            Caption = 'Lieferanschrift'
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 1
            object Label14: TLabel
              Left = 5
              Top = 26
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Anrede:'
            end
            object Label16: TLabel
              Left = 5
              Top = 47
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Name 1:'
            end
            object Label17: TLabel
              Left = 5
              Top = 70
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Name 2:'
            end
            object Label21: TLabel
              Left = 5
              Top = 91
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Name 3:'
            end
            object Label24: TLabel
              Left = 5
              Top = 114
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Stra'#223'e:'
            end
            object Label25: TLabel
              Left = 5
              Top = 136
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Land/PLZ/Ort:'
            end
            object LiefAnschriftAuswahlBtn: TJvSpeedButton
              Left = 308
              Top = 21
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
            object LiefAnschriftDelBtn: TSpeedButton
              Left = 278
              Top = 21
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
            object L_Anrede: TEdit
              Left = 86
              Top = 22
              Width = 187
              Height = 19
              AutoSelect = False
              AutoSize = False
              Enabled = False
              TabOrder = 0
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object L_Name1: TEdit
              Tag = 1
              Left = 86
              Top = 44
              Width = 256
              Height = 19
              AutoSelect = False
              AutoSize = False
              Enabled = False
              TabOrder = 1
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object L_Name2: TEdit
              Tag = 1
              Left = 86
              Top = 66
              Width = 256
              Height = 19
              AutoSelect = False
              AutoSize = False
              Enabled = False
              TabOrder = 2
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object L_Name3: TEdit
              Tag = 1
              Left = 86
              Top = 87
              Width = 256
              Height = 19
              AutoSelect = False
              AutoSize = False
              Enabled = False
              TabOrder = 3
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object L_Strasse: TEdit
              Tag = 1
              Left = 86
              Top = 110
              Width = 256
              Height = 19
              AutoSelect = False
              AutoSize = False
              Enabled = False
              TabOrder = 4
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object L_LAND: TEdit
              Left = 86
              Top = 133
              Width = 19
              Height = 19
              AutoSelect = False
              AutoSize = False
              Enabled = False
              TabOrder = 5
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object L_PLZ: TEdit
              Left = 107
              Top = 133
              Width = 54
              Height = 19
              AutoSelect = False
              AutoSize = False
              Enabled = False
              TabOrder = 6
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object L_Ort: TEdit
              Tag = 1
              Left = 163
              Top = 133
              Width = 179
              Height = 19
              AutoSelect = False
              AutoSize = False
              Enabled = False
              TabOrder = 7
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
          object ZuweisungenGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 328
            Height = 160
            Align = alLeft
            Caption = 'Zuweisungen'
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 0
            object Label27: TLabel
              Left = 5
              Top = 70
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Zahlart:'
            end
            object Label38: TLabel
              Left = 5
              Top = 91
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'W'#228'hrung:'
            end
            object Label6: TLabel
              Left = 5
              Top = 114
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Zahlungsziel:'
            end
            object Label7: TLabel
              Left = 119
              Top = 113
              Width = 30
              Height = 13
              AutoSize = False
              Caption = 'Tage'
            end
            object Label8: TLabel
              Left = 193
              Top = 113
              Width = 39
              Height = 13
              AutoSize = False
              Caption = 'Skonto:'
            end
            object Label9: TLabel
              Left = 264
              Top = 113
              Width = 58
              Height = 13
              AutoSize = False
              Caption = 'Tage Netto'
            end
            object Label15: TLabel
              Left = 5
              Top = 136
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Liefer-Datum:'
            end
            object Label32: TLabel
              Left = 5
              Top = 47
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Referenz-Nr.:'
            end
            object Label23: TLabel
              Left = 5
              Top = 26
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Projekt.:'
            end
            object Label1: TLabel
              Left = 195
              Top = 136
              Width = 39
              Height = 13
              AutoSize = False
              Caption = 'Rabatt:'
            end
            object ZahlartDB: TDBLookupComboBox
              Tag = 1
              Left = 115
              Top = 66
              Width = 205
              Height = 19
              DataField = 'ZAHLART'
              DataSource = ReEdiDS
              KeyField = 'ZAHL_ID'
              ListField = 'LANGBEZ'
              ListSource = DM1.ZahlArtDS
              TabOrder = 3
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object WaehrungCB: TDBLookupComboBox
              Tag = 1
              Left = 115
              Top = 87
              Width = 205
              Height = 19
              DataField = 'WAEHRUNG'
              DataSource = ReEdiDS
              KeyField = 'WAEHRUNG'
              ListField = 'LANGBEZ'
              ListSource = DM1.WhrungDS
              ReadOnly = True
              TabOrder = 5
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object waehrung: TDBEdit
              Left = 88
              Top = 87
              Width = 28
              Height = 19
              AutoSelect = False
              DataField = 'WAEHRUNG'
              DataSource = ReEdiDS
              Enabled = False
              TabOrder = 4
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object Zahlart: TDBEdit
              Left = 88
              Top = 66
              Width = 28
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'ZAHLART'
              DataSource = ReEdiDS
              TabOrder = 2
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object SK_Skonto_Tage: TDBEdit
              Left = 88
              Top = 110
              Width = 28
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'SOLL_STAGE'
              DataSource = ReEdiDS
              TabOrder = 6
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object SK_Skonto_Proz: TDBEdit
              Left = 149
              Top = 110
              Width = 40
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'SOLL_SKONTO'
              DataSource = ReEdiDS
              TabOrder = 7
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object SK_Netto_Tage: TDBEdit
              Left = 234
              Top = 110
              Width = 28
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'SOLL_NTAGE'
              DataSource = ReEdiDS
              TabOrder = 8
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object LIE_Datum: TJvDBDateEdit
              Left = 88
              Top = 133
              Width = 101
              Height = 19
              DataField = 'LDATUM'
              DataSource = ReEdiDS
              AutoSelect = False
              NumGlyphs = 2
              YearDigits = dyFour
              TabOrder = 9
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyPress = KuNrEditKeyPress
              OnKeyDown = KuNrEditKeyDown
            end
            object Ref_Num: TDBEdit
              Tag = 1
              Left = 88
              Top = 44
              Width = 232
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'ORGNUM'
              DataSource = ReEdiDS
              TabOrder = 1
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object Projekt: TDBEdit
              Tag = 1
              Left = 88
              Top = 22
              Width = 232
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'PROJEKT'
              DataSource = ReEdiDS
              TabOrder = 0
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object GlobRabatt: TDBEdit
              Tag = 1
              Left = 235
              Top = 133
              Width = 85
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'GLOBRABATT'
              DataSource = ReEdiDS
              TabOrder = 10
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 377
          Width = 678
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
            Left = 675
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
            Width = 672
            Height = 24
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 3
            Color = 14680063
            TabOrder = 2
            object Label36: TLabel
              Left = 216
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
              Left = 372
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
              Left = 513
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
              Left = 569
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
              Left = 428
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
              Left = 272
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
        object InfoGB: TOFGroupBox
          Left = 0
          Top = 228
          Width = 678
          Height = 149
          Align = alClient
          Caption = 'Info'
          Color = 14680063
          Ctl3D = False
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 4
          object RechInfoMemo: TDBMemo
            Left = 8
            Top = 21
            Width = 662
            Height = 120
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
      end
      object PosTS: TTabSheet
        Caption = 'P&ositionen'
        ImageIndex = 1
        object ToolBar1: TToolBar
          Left = 0
          Top = 401
          Width = 678
          Height = 34
          Align = alBottom
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 72
          Caption = 'ToolBar1'
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = MainForm.VorgangImgList
          List = True
          ShowCaptions = True
          TabOrder = 1
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
          object Panel37: TPanel
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
            AutoSize = True
            Caption = 'L'#246'schen'
            ImageIndex = 6
            OnClick = DelBtnClick
          end
          object UpBtn: TToolButton
            Left = 265
            Top = 0
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 3
            OnClick = UpBtnClick
          end
          object DownBtn: TToolButton
            Left = 321
            Top = 0
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
        object KunDatGB2: TOFGroupBox
          Left = 0
          Top = 0
          Width = 678
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
          object Label4: TLabel
            Left = 5
            Top = 46
            Width = 82
            Height = 13
            AutoSize = False
            Caption = 'Intern-Nr:'
          end
          object Label5: TLabel
            Left = 5
            Top = 23
            Width = 82
            Height = 13
            AutoSize = False
            Caption = 'Ku-Nr. vom Lief. :'
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
            Width = 302
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
            Width = 390
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
            Left = 87
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
            Left = 87
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
        object Panel1: TPanel
          Left = 0
          Top = 377
          Width = 678
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel1'
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
            Left = 675
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
            Width = 672
            Height = 24
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 3
            Color = 14680063
            TabOrder = 2
            object Label18: TLabel
              Left = 216
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
              Left = 372
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
              Left = 513
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
              Left = 569
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
              Left = 428
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
              Left = 272
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
        object Panel36: TPanel
          Left = 0
          Top = 68
          Width = 678
          Height = 309
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 3
          object BestPosGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 678
            Height = 203
            Align = alClient
            Caption = 'Positionen'
            Color = 14680063
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            TabOrder = 0
            object PosGrid: TExRxDBGrid
              Left = 8
              Top = 21
              Width = 662
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
          object BestVorGB: TOFGroupBox
            Left = 0
            Top = 208
            Width = 678
            Height = 101
            Align = alBottom
            Caption = 'Bestellvorschlag'
            Color = 14680063
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            TabOrder = 1
            object OffBestGrid: TOFDBGrid
              Left = 8
              Top = 21
              Width = 662
              Height = 72
              Align = alClient
              BorderStyle = bsNone
              DataSource = BVorDS
              DefaultDrawing = False
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgMultiSelect]
              ParentShowHint = False
              PopupMenu = AddBestVorschlagPopup
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = OffBestGridDblClick
              MultiSelect = True
              OnContextPopup = OffBestGridContextPopup
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
              DefaultRowHeight = 15
              MultiLineTitles = True
              LinesPerRow = 2
              EditColor = 10485663
              OnApplyCellAttribute = OffBestGridApplyCellAttribute
              Columns = <
                item
                  Expanded = False
                  FieldName = 'REC_ID'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'MATCHCODE'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ARTNUM'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LIEF_BESTNUM'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KURZNAME'
                  Width = 180
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VK_MENGE'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MENGE_AKT'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MENGE_MIN'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MENGE_BESTELLT'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MENGE_EKBEST_EDI'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MENGE_DIV'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MENGE_BVOR'
                  Width = 50
                  Visible = True
                end>
            end
            object BestOnlyVK_CB: TCheckBox
              Left = 130
              Top = 0
              Width = 131
              Height = 14
              Caption = 'nur verkaufte Aktikel'
              TabOrder = 1
              OnClick = BestOnlyVK_CBClick
            end
          end
          object OffBestSplitter: TJvxSplitter
            Left = 0
            Top = 203
            Width = 678
            Height = 5
            ControlFirst = BestPosGB
            ControlSecond = BestVorGB
            Align = alBottom
            BevelInner = bvLowered
            BevelOuter = bvLowered
            Ctl3D = True
            TopLeftLimit = 150
            BottomRightLimit = 100
          end
        end
      end
      object Fertig: TTabSheet
        Caption = '&Fertig'
        ImageIndex = 3
        object KunDatGB4: TOFGroupBox
          Left = 0
          Top = 0
          Width = 678
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
            Width = 82
            Height = 13
            AutoSize = False
            Caption = 'Intern-Nr:'
          end
          object Label13: TLabel
            Left = 5
            Top = 23
            Width = 82
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
            Width = 302
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
            Width = 390
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
            Left = 87
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
            Left = 87
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
          Top = 401
          Width = 678
          Height = 34
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 149
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
            Caption = 'Speichern und Bestellen '
            ImageIndex = 11
            OnClick = BuchenBtnClick
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 68
          Width = 678
          Height = 160
          Align = alTop
          BevelOuter = bvNone
          Color = 14680063
          TabOrder = 1
          object CaoGroupBox1: TOFGroupBox
            Left = 0
            Top = 0
            Width = 328
            Height = 160
            Align = alLeft
            Caption = 'Zuweisungen'
            Ctl3D = False
            Enabled = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 0
            object Label26: TLabel
              Left = 5
              Top = 26
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Projekt.:'
            end
            object Label28: TLabel
              Left = 5
              Top = 47
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Referenz-Nr.:'
            end
            object Label29: TLabel
              Left = 5
              Top = 70
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Zahlart:'
            end
            object Label43: TLabel
              Left = 5
              Top = 91
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'W'#228'hrung:'
            end
            object Label44: TLabel
              Left = 5
              Top = 114
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Zahlungsziel:'
            end
            object Label45: TLabel
              Left = 5
              Top = 137
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Liefer-Datum:'
            end
            object Label46: TLabel
              Left = 119
              Top = 113
              Width = 30
              Height = 13
              AutoSize = False
              Caption = 'Tage'
            end
            object Label48: TLabel
              Left = 193
              Top = 113
              Width = 39
              Height = 13
              AutoSize = False
              Caption = 'Skonto:'
            end
            object Label49: TLabel
              Left = 264
              Top = 113
              Width = 58
              Height = 13
              AutoSize = False
              Caption = 'Tage Netto'
            end
            object DBEdit1: TDBEdit
              Tag = 1
              Left = 88
              Top = 22
              Width = 232
              Height = 19
              AutoSelect = False
              AutoSize = False
              Color = clBtnFace
              DataField = 'PROJEKT'
              DataSource = ReEdiDS
              TabOrder = 0
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit2: TDBEdit
              Tag = 1
              Left = 88
              Top = 44
              Width = 232
              Height = 19
              AutoSelect = False
              AutoSize = False
              Color = clBtnFace
              DataField = 'ORGNUM'
              DataSource = ReEdiDS
              TabOrder = 1
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit5: TDBEdit
              Left = 88
              Top = 110
              Width = 28
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              Color = clBtnFace
              DataField = 'SOLL_STAGE'
              DataSource = ReEdiDS
              TabOrder = 2
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit6: TDBEdit
              Left = 149
              Top = 110
              Width = 40
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              Color = clBtnFace
              DataField = 'SOLL_SKONTO'
              DataSource = ReEdiDS
              TabOrder = 3
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit7: TDBEdit
              Left = 234
              Top = 110
              Width = 28
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              Color = clBtnFace
              DataField = 'SOLL_NTAGE'
              DataSource = ReEdiDS
              TabOrder = 4
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit3: TDBEdit
              Tag = 1
              Left = 88
              Top = 66
              Width = 232
              Height = 19
              AutoSelect = False
              AutoSize = False
              Color = clBtnFace
              DataField = 'Zahlart_Str'
              DataSource = ReEdiDS
              TabOrder = 5
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit4: TDBEdit
              Tag = 1
              Left = 88
              Top = 87
              Width = 232
              Height = 19
              AutoSelect = False
              AutoSize = False
              Color = clBtnFace
              DataField = 'Waehrung_Str'
              DataSource = ReEdiDS
              TabOrder = 6
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit8: TDBEdit
              Tag = 1
              Left = 88
              Top = 133
              Width = 232
              Height = 19
              AutoSelect = False
              AutoSize = False
              Color = clBtnFace
              DataField = 'LDATUM'
              DataSource = ReEdiDS
              TabOrder = 7
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
          object CaoGroupBox2: TOFGroupBox
            Left = 328
            Top = 0
            Width = 350
            Height = 160
            Align = alClient
            Caption = 'Lieferanschrift'
            Ctl3D = False
            Enabled = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentCtl3D = False
            TabOrder = 1
            object Label50: TLabel
              Left = 5
              Top = 136
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Land/PLZ/Ort:'
            end
            object Label51: TLabel
              Left = 5
              Top = 114
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Stra'#223'e:'
            end
            object Label52: TLabel
              Left = 5
              Top = 91
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Name 3:'
            end
            object Label54: TLabel
              Left = 5
              Top = 70
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Name 2:'
            end
            object Label55: TLabel
              Left = 5
              Top = 47
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Name 1:'
            end
            object Label56: TLabel
              Left = 5
              Top = 26
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Anrede:'
            end
            object l_anrede2: TEdit
              Tag = 1
              Left = 86
              Top = 22
              Width = 256
              Height = 19
              AutoSelect = False
              AutoSize = False
              Color = clBtnFace
              Enabled = False
              TabOrder = 0
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object l_name1_2: TEdit
              Tag = 1
              Left = 86
              Top = 44
              Width = 256
              Height = 19
              AutoSelect = False
              AutoSize = False
              Color = clBtnFace
              Enabled = False
              TabOrder = 1
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object l_name2_2: TEdit
              Tag = 1
              Left = 86
              Top = 66
              Width = 256
              Height = 19
              AutoSelect = False
              AutoSize = False
              Color = clBtnFace
              Enabled = False
              TabOrder = 2
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object l_name3_2: TEdit
              Tag = 1
              Left = 86
              Top = 87
              Width = 256
              Height = 19
              AutoSelect = False
              AutoSize = False
              Color = clBtnFace
              Enabled = False
              TabOrder = 3
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object l_strasse2: TEdit
              Tag = 1
              Left = 86
              Top = 110
              Width = 256
              Height = 19
              AutoSelect = False
              AutoSize = False
              Color = clBtnFace
              Enabled = False
              TabOrder = 4
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object l_plz2: TEdit
              Left = 107
              Top = 133
              Width = 54
              Height = 19
              AutoSelect = False
              AutoSize = False
              Color = clBtnFace
              Enabled = False
              TabOrder = 5
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object l_ort2: TEdit
              Tag = 1
              Left = 163
              Top = 133
              Width = 179
              Height = 19
              AutoSelect = False
              AutoSize = False
              Color = clBtnFace
              Enabled = False
              TabOrder = 6
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object l_land2: TEdit
              Left = 86
              Top = 133
              Width = 19
              Height = 19
              AutoSelect = False
              AutoSize = False
              Color = clBtnFace
              Enabled = False
              TabOrder = 7
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
        end
        object CaoGroupBox4: TOFGroupBox
          Left = 0
          Top = 228
          Width = 678
          Height = 149
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
            Width = 44
            Height = 20
            Align = alClient
            Alignment = taCenter
            Caption = 'keine'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
          end
        end
        object Panel29: TPanel
          Left = 0
          Top = 377
          Width = 678
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
            Left = 675
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
            Width = 672
            Height = 24
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 3
            Color = 14680063
            TabOrder = 2
            object Label40: TLabel
              Left = 216
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
              Left = 372
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
              Left = 513
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
              Left = 569
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
              Left = 428
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
              Left = 272
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
      Width = 678
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      TabOrder = 1
      object Label35: TLabel
        Left = 0
        Top = 0
        Width = 232
        Height = 23
        Align = alLeft
        Caption = '  Einkauf Bestellung bearbeiten ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object ButtonPan: TPanel
        Left = 387
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
    Left = 69
    Top = 136
  end
  object ReEdiDS: TDataSource
    DataSet = ReEdiTab
    OnDataChange = ReEdiDSDataChange
    Left = 65
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
    Left = 33
    Top = 244
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
    object ArtikelTabLANGNAME: TMemoField
      FieldName = 'LANGNAME'
      BlobType = ftMemo
    end
    object ArtikelTabLAENGE: TStringField
      FieldName = 'LAENGE'
    end
    object ArtikelTabBREITE: TStringField
      FieldName = 'BREITE'
    end
    object ArtikelTabHOEHE: TStringField
      FieldName = 'HOEHE'
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
    object ArtikelTabNO_PROVISION_FLAG: TBooleanField
      FieldName = 'NO_PROVISION_FLAG'
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
    object ArtikelTabNO_VK_FLAG: TBooleanField
      FieldName = 'NO_VK_FLAG'
      Required = True
    end
    object ArtikelTabSN_FLAG: TBooleanField
      FieldName = 'SN_FLAG'
      Required = True
    end
    object ArtikelTabVPE: TIntegerField
      FieldName = 'VPE'
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
    OFModulID = 2060
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
      'select '
      ''
      
        'REC_ID,QUELLE,QUELLE_SUB,ADDR_ID,VRENUM,RDATUM,GLOBRABATT,LDATUM' +
        ',LOHN,WARE,TKOST,'
      'MWST_0,MWST_1,MWST_2,MWST_3,'
      'NSUMME,NSUMME_0,NSUMME_1,NSUMME_2,NSUMME_3,'
      'MSUMME,MSUMME_0,MSUMME_1,MSUMME_2,MSUMME_3,'
      'BSUMME,BSUMME_0,BSUMME_1,BSUMME_2,BSUMME_3,'
      'ATSUMME,ATMSUMME,GEGENKONTO,'
      'SOLL_STAGE,SOLL_SKONTO,SOLL_NTAGE,'
      'STADIUM,ERSTELLT,ERST_NAME,'
      'KUN_NUM,KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,'
      'KUN_ABTEILUNG,KUN_STRASSE,KUN_LAND,KUN_PLZ,KUN_ORT,'
      
        'USR1,USR2,PROJEKT,ORGNUM,BEST_NAME,BEST_CODE,INFO,LIEFART,ZAHLAR' +
        'T,WAEHRUNG,'
      'LIEF_ADDR_ID,BRUTTO_FLAG,MWST_FREI_FLAG,GEWICHT'
      ''
      'FROM JOURNAL'
      'where QUELLE=:QUELLE'
      'order by VRENUM')
    Left = 32
    Top = 103
    ParamData = <
      item
        DataType = ftString
        Name = 'QUELLE'
        ParamType = ptUnknown
        Value = '13'
      end>
    object ReEdiTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
      Visible = False
    end
    object ReEdiTabQUELLE: TIntegerField
      FieldName = 'QUELLE'
      Required = True
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
    object ReEdiTabVRENUM: TStringField
      Alignment = taCenter
      DisplayLabel = 'int. Nr.'
      DisplayWidth = 5
      FieldName = 'VRENUM'
      Required = True
    end
    object ReEdiTabRDATUM: TDateField
      DisplayLabel = 'le.'#196'nderung'
      FieldName = 'RDATUM'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object ReEdiTabGLOBRABATT: TFloatField
      FieldName = 'GLOBRABATT'
      Visible = False
      DisplayFormat = '0.0%'
    end
    object ReEdiTabLDATUM: TDateField
      FieldName = 'LDATUM'
      DisplayFormat = 'dd.mm.yyyy'
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
    object ReEdiTabSOLL_SKONTO: TFloatField
      FieldName = 'SOLL_SKONTO'
      Visible = False
      DisplayFormat = '0.0%'
      EditFormat = '0.0'
    end
    object ReEdiTabSOLL_STAGE: TLargeintField
      FieldName = 'SOLL_STAGE'
      Required = True
      Visible = False
    end
    object ReEdiTabSOLL_NTAGE: TLargeintField
      FieldName = 'SOLL_NTAGE'
      Required = True
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
      EditFormat = '#0'
    end
    object ReEdiTabZAHLART: TIntegerField
      FieldName = 'ZAHLART'
      Visible = False
      DisplayFormat = '0;-;0'
      EditFormat = '#0'
    end
    object ReEdiTabWAEHRUNG: TStringField
      DisplayLabel = 'WA'
      DisplayWidth = 3
      FieldName = 'WAEHRUNG'
      Size = 5
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
    object ReEdiTabLIEF_ADDR_ID: TIntegerField
      FieldName = 'LIEF_ADDR_ID'
    end
    object ReEdiTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object ReEdiTabMWST_FREI_FLAG: TBooleanField
      FieldName = 'MWST_FREI_FLAG'
      Required = True
    end
    object ReEdiTabGEWICHT: TFloatField
      FieldName = 'GEWICHT'
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
      'select * from JOURNALPOS'
      'where JOURNAL_ID=:ID')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '8488'
      end>
    Left = 34
    Top = 136
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
      FieldName = 'VLSNUM'
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
      DisplayFormat = ',###,##0.000;-,###,##0.000; '
      EditFormat = '#0.000'
    end
    object PosTabRABATT: TFloatField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 5
      FieldName = 'RABATT'
      DisplayFormat = ',###,##0.0"%";-,###,##0.0"%"; '
      EditFormat = '#0.0'
    end
    object PosTabGPREIS: TFloatField
      DisplayLabel = 'G-Preis'
      FieldName = 'GPREIS'
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
    object PosTabALTTEIL_FLAG: TBooleanField
      FieldName = 'ALTTEIL_FLAG'
      Required = True
    end
    object PosTabBEZ_FEST_FLAG: TBooleanField
      FieldName = 'BEZ_FEST_FLAG'
      Required = True
    end
    object PosTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object PosTabVPE: TLargeintField
      FieldName = 'VPE'
    end
    object PosTabSN_FLAG: TBooleanField
      FieldName = 'SN_FLAG'
      Required = True
    end
    object PosTabE_RGEWINN: TFloatField
      FieldName = 'E_RGEWINN'
      Visible = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
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
  end
  object MainMenu1: TJvMainMenu
    Images = MainForm.ImageList1
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 199
    Top = 87
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
        OnClick = NeuKomBtnClick
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
      object N1: TMenuItem
        Caption = '-'
      end
      object SpeichernundBuchen1: TMenuItem
        Caption = 'Speichern und Bestellen'
        ImageIndex = 18
        ShortCut = 32848
        OnClick = BuchenBtnClick
      end
      object N5: TMenuItem
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
  end
  object KunTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from ADRESSEN'
      'where REC_ID = :ID')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 35
    Top = 211
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object BVorDS: TDataSource
    DataSet = BVorTab
    Left = 70
    Top = 171
  end
  object BVorTab: TZQuery
    Connection = DM1.DB1
    BeforeOpen = BVorTabBeforeOpen
    AfterOpen = BVorTabAfterOpen
    SQL.Strings = (
      
        'select A.REC_ID, A.KURZNAME, A.MATCHCODE, A.ARTNUM,AP.BESTNUM as' +
        ' LIEF_BESTNUM,'
      'IF(AB3.SUM_MENGE !=0,AB3.SUM_MENGE,0) as VK_MENGE,'
      
        'A.MENGE_AKT,IFNULL(AB3.SUM_MENGE,0) - A.MENGE_AKT -IFNULL(AB1.SU' +
        'M_MENGE,0) -IFNULL(AB2.SUM_MENGE,0) + A.MENGE_MIN as MENGE_DIV,'
      'IFNULL(AB1.SUM_MENGE,0) as MENGE_BESTELLT,'
      'IFNULL(AB2.SUM_MENGE,0) as MENGE_EKBEST_EDI,'
      'A.MENGE_BVOR,A.MENGE_MIN '
      'from ARTIKEL A, ARTIKEL_PREIS AP '
      
        'left outer JOIN ARTIKEL_BDATEN AB1 on AB1.ARTIKEL_ID=A.REC_ID an' +
        'd AB1.QUELLE=26 and AB1.JAHR=0 and AB1.MONAT=0 '
      
        'left outer JOIN ARTIKEL_BDATEN AB2 on AB2.ARTIKEL_ID=A.REC_ID an' +
        'd AB2.QUELLE=16 and AB2.JAHR=0 and AB2.MONAT=0 '
      
        'left outer JOIN ARTIKEL_BDATEN AB3 on AB3.ARTIKEL_ID=A.REC_ID an' +
        'd AB3.QUELLE=13 and AB3.JAHR=0 and AB3.MONAT=0 '
      'where A.ARTIKELTYP="N" and AP.ADRESS_ID=:AID'
      
        'and AP.ARTIKEL_ID=A.REC_ID and A.MENGE_AKT + IFNULL(AB1.SUM_MENG' +
        'E,0) < IFNULL(AB3.SUM_MENGE,0) + A.MENGE_MIN '
      'having VK_MENGE!=0')
    Params = <
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
        Value = '-1'
      end>
    Left = 34
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
        Value = '-1'
      end>
    object BVorTabKURZNAME: TStringField
      DisplayLabel = 'Bezeichnung'
      FieldName = 'KURZNAME'
      Size = 40
    end
    object BVorTabMATCHCODE: TStringField
      DisplayLabel = 'Match'
      FieldName = 'MATCHCODE'
    end
    object BVorTabARTNUM: TStringField
      DisplayLabel = 'Artikelnummer'
      FieldName = 'ARTNUM'
    end
    object BVorTabLIEF_BESTNUM: TStringField
      DisplayLabel = 'Lief.-Bestellnummmer'
      FieldName = 'LIEF_BESTNUM'
      Size = 50
    end
    object BVorTabVK_MENGE: TFloatField
      DisplayLabel = 'Verkauft'
      FieldName = 'VK_MENGE'
      Required = True
      DisplayFormat = ',#0.00;,#0.00;-'
    end
    object BVorTabMENGE_AKT: TFloatField
      DisplayLabel = 'Lager'
      FieldName = 'MENGE_AKT'
      Required = True
      DisplayFormat = ',#0.00'
    end
    object BVorTabMENGE_DIV: TFloatField
      DisplayLabel = 'Fehlmenge'
      FieldName = 'MENGE_DIV'
      DisplayFormat = ',#0.00;-;-'
    end
    object BVorTabMENGE_BESTELLT: TFloatField
      DisplayLabel = 'Bestellt'
      FieldName = 'MENGE_BESTELLT'
      Required = True
      DisplayFormat = ',#0.00;,#0.00;-'
    end
    object BVorTabMENGE_EKBEST_EDI: TFloatField
      DisplayLabel = 'Best.-Edi'
      FieldName = 'MENGE_EKBEST_EDI'
      Required = True
      DisplayFormat = ',#0.00;,#0.00;-'
    end
    object BVorTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object BVorTabMENGE_BVOR: TFloatField
      DisplayLabel = 'Bestvor.'
      FieldName = 'MENGE_BVOR'
      DisplayFormat = ',#0.00;-;-'
    end
    object BVorTabMENGE_MIN: TFloatField
      DisplayLabel = 'Mind.-Best.'
      FieldName = 'MENGE_MIN'
      DisplayFormat = ',#0.00;-;-'
    end
  end
  object AddBestVorschlagPopup: TPopupMenu
    Left = 233
    Top = 89
    object ausgewArtikelhinzufgen1: TMenuItem
      Caption = 'ausgew. Artikel hinzuf'#252'gen'
      OnClick = ausgewArtikelhinzufgen1Click
    end
  end
  object ArtikelPopupMenu: TPopupMenu
    Images = MainForm.ImageList1
    Left = 235
    Top = 123
    object freierArtikel1: TMenuItem
      Caption = 'freien Artikel hinzuf'#252'gen'
      ImageIndex = 20
      OnClick = NeuFrArtBtnClick
    end
    object Text1: TMenuItem
      Caption = 'Text hinzuf'#252'gen'
      ImageIndex = 20
      OnClick = NeuKomBtnClick
    end
  end
end
