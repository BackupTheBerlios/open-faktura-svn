object InventurForm: TInventurForm
  Left = 402
  Top = 226
  Width = 696
  Height = 480
  Caption = 'Inventur'
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
    Width = 688
    Height = 434
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TopPan: TPanel
      Left = 0
      Top = 0
      Width = 688
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      TabOrder = 0
      object Label35: TLabel
        Left = 0
        Top = 0
        Width = 231
        Height = 23
        Align = alLeft
        Caption = '  Inventur erstellen / bearbeiten ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object ButtonPan: TPanel
        Left = 397
        Top = 0
        Width = 287
        Height = 23
        Align = alRight
        AutoSize = True
        BevelOuter = bvNone
        Color = clBtnShadow
        TabOrder = 0
        object ListeBtn: TJvSpeedButton
          Left = 0
          Top = 0
          Width = 65
          Height = 22
          Caption = 'Liste'
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
          OnMouseEnter = ListeBtnMouseEnter
          OnMouseLeave = ListeBtnMouseLeave
          OnClick = ListeBtnClick
        end
        object AllgemeinBtn: TJvSpeedButton
          Tag = 1
          Left = 66
          Top = 0
          Width = 68
          Height = 22
          Caption = 'All&gemein'
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
          OnMouseEnter = ListeBtnMouseEnter
          OnMouseLeave = ListeBtnMouseLeave
          OnClick = ListeBtnClick
        end
        object ArtikelBtn: TJvSpeedButton
          Tag = 2
          Left = 134
          Top = 0
          Width = 73
          Height = 22
          Caption = 'Artikel'
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
          OnMouseEnter = ListeBtnMouseEnter
          OnMouseLeave = ListeBtnMouseLeave
          OnClick = ListeBtnClick
        end
        object FertigBtn: TJvSpeedButton
          Tag = 3
          Left = 207
          Top = 0
          Width = 80
          Height = 22
          Caption = '&Fertigstellen'
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
          OnMouseEnter = ListeBtnMouseEnter
          OnMouseLeave = ListeBtnMouseLeave
          OnClick = ListeBtnClick
        end
      end
    end
    object PC1: TJvPageControl
      Left = 0
      Top = 27
      Width = 688
      Height = 407
      ActivePage = TabSheet1
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 1
      OnChange = PC1Change
      OnResize = PC1Resize
      ClientBorderWidth = 0
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        object InvListeGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 688
          Height = 358
          Align = alClient
          Ctl3D = True
          DataSource = InvKopfDS
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
          DefaultRowHeight = 18
          EditColor = clBlack
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATUM'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BESCHREIBUNG'
              Width = 320
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_STATUS'
              Width = 146
              Visible = True
            end>
        end
        object ListeToolbar: TToolBar
          Left = 0
          Top = 358
          Width = 688
          Height = 26
          Align = alBottom
          AutoSize = True
          BorderWidth = 1
          ButtonWidth = 101
          Caption = 'ToolBar2'
          EdgeBorders = []
          Flat = True
          Images = MainForm.ImageList1
          List = True
          ShowCaptions = True
          TabOrder = 1
          Wrapable = False
          object DBNavigator1: TDBNavigator
            Left = 0
            Top = 0
            Width = 185
            Height = 22
            DataSource = InvKopfDS
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
            TabOrder = 0
          end
          object ToolButton1: TToolButton
            Left = 185
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 11
            Style = tbsSeparator
          end
          object NewBelBtn: TToolButton
            Left = 193
            Top = 0
            AutoSize = True
            Caption = '&Neue Inventur'
            ImageIndex = 17
            OnClick = NewBelBtnClick
          end
          object ToolButton2: TToolButton
            Left = 292
            Top = 0
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 8
            Style = tbsSeparator
          end
          object EdiBtn1: TToolButton
            Left = 300
            Top = 0
            AutoSize = True
            Caption = '&Bearbeiten'
            ImageIndex = 30
            OnClick = EdiBtn1Click
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 688
          Height = 358
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object CaoGroupBox2: TOFGroupBox
            Left = 0
            Top = 314
            Width = 688
            Height = 44
            Align = alBottom
            Caption = 'Status'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 0
            object Label4: TLabel
              Left = 6
              Top = 24
              Width = 3
              Height = 13
            end
            object DBText1: TDBText
              Tag = 1
              Left = 8
              Top = 23
              Width = 672
              Height = 18
              DataField = 'CALC_STATUS'
              DataSource = InvKopfDS
            end
          end
          object CaoGroupBox1: TOFGroupBox
            Left = 0
            Top = 0
            Width = 688
            Height = 48
            Align = alTop
            Caption = 'Allgemein'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 1
            object Label1: TLabel
              Left = 8
              Top = 24
              Width = 37
              Height = 13
              Caption = 'Datum :'
            end
            object Label2: TLabel
              Left = 142
              Top = 24
              Width = 71
              Height = 13
              Caption = 'Beschreibung :'
            end
            object JvDBDateEdit1: TJvDBDateEdit
              Left = 50
              Top = 22
              Width = 86
              Height = 19
              DataField = 'DATUM'
              DataSource = InvKopfDS
              NumGlyphs = 2
              Weekends = [Sun, Sat]
              YearDigits = dyFour
              TabOrder = 0
            end
            object DBEdit1: TDBEdit
              Tag = 1
              Left = 217
              Top = 22
              Width = 463
              Height = 19
              DataField = 'BESCHREIBUNG'
              DataSource = InvKopfDS
              TabOrder = 1
            end
          end
          object CaoGroupBox3: TOFGroupBox
            Left = 0
            Top = 48
            Width = 688
            Height = 266
            Align = alClient
            Caption = 'Info und Bemerkungen'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 2
            object Label5: TLabel
              Left = 6
              Top = 24
              Width = 3
              Height = 13
            end
            object DBMemo1: TDBMemo
              Left = 8
              Top = 21
              Width = 672
              Height = 237
              Align = alClient
              DataField = 'INFO'
              DataSource = InvKopfDS
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
        object AllgToolbar: TToolBar
          Left = 0
          Top = 358
          Width = 688
          Height = 26
          Align = alBottom
          AutoSize = True
          BorderWidth = 1
          ButtonWidth = 84
          Caption = 'AllgToolbar'
          EdgeBorders = []
          Flat = True
          Images = MainForm.ImageList1
          Indent = 2
          List = True
          ShowCaptions = True
          TabOrder = 1
          Wrapable = False
          object DBNavigator3: TDBNavigator
            Left = 2
            Top = 0
            Width = 185
            Height = 22
            DataSource = InvKopfDS
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
            TabOrder = 0
          end
          object ToolButton4: TToolButton
            Left = 187
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 11
            Style = tbsSeparator
          end
          object EdiBtn2: TToolButton
            Left = 195
            Top = 0
            AutoSize = True
            Caption = '&Bearbeiten'
            ImageIndex = 30
            OnClick = EdiBtn1Click
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'TabSheet3'
        ImageIndex = 2
        object SuchGB: TOFGroupBox
          Left = 137
          Top = 0
          Width = 551
          Height = 358
          Align = alClient
          Caption = 'Artikelliste'
          Color = 14680063
          Ctl3D = False
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 0
          object ArtListGrid: TOFDBGrid
            Left = 8
            Top = 21
            Width = 535
            Height = 329
            Align = alClient
            BorderStyle = bsNone
            Ctl3D = True
            DataSource = InvArtDS
            DefaultDrawing = False
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
            ParentCtl3D = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = ArtListGridDblClick
            OnKeyPress = ArtListGridKeyPress
            TitleButtons = True
            OnTitleBtnClick = ArtListGridTitleBtnClick
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
            DefaultRowHeight = 17
            EditColor = clBlack
            Columns = <
              item
                Expanded = False
                FieldName = 'WARENGRUPPE'
                Width = 23
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ARTNUM'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MATCHCODE'
                Width = 108
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BARCODE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'LAENGE'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GROESSE'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIMENSION'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GEWICHT'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KURZTEXT'
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
                FieldName = 'INVENTUR_WERT'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MENGE_SOLL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MENGE_IST'
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CALC_STATUS'
                ReadOnly = True
                Width = 63
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BEARBEITER'
                ReadOnly = True
                Visible = False
              end>
          end
        end
        object WgrGB: TOFGroupBox
          Left = 0
          Top = 0
          Width = 137
          Height = 358
          Align = alLeft
          Caption = 'Warengruppen'
          Color = 14680063
          Ctl3D = False
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 1
          object ArtWgrTV: TTreeView
            Left = 8
            Top = 21
            Width = 121
            Height = 329
            Align = alClient
            BorderStyle = bsNone
            Color = 14680063
            HideSelection = False
            Indent = 19
            ReadOnly = True
            TabOrder = 0
            OnChange = ArtWgrTVChange
          end
        end
        object ArtikelToolbar: TToolBar
          Left = 0
          Top = 358
          Width = 688
          Height = 26
          Align = alBottom
          AutoSize = True
          BorderWidth = 1
          ButtonHeight = 7
          ButtonWidth = 13
          Caption = 'ToolBar2'
          EdgeBorders = []
          Flat = True
          Images = MainForm.ImageList1
          Indent = 2
          List = True
          ShowCaptions = True
          TabOrder = 2
          Wrapable = False
          object DBNavigator2: TDBNavigator
            Left = 2
            Top = 0
            Width = 185
            Height = 22
            DataSource = InvArtDS
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
            TabOrder = 0
          end
          object ToolButton3: TToolButton
            Left = 187
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 11
            Style = tbsSeparator
          end
          object Label52: TLabel
            Left = 195
            Top = 0
            Width = 50
            Height = 22
            Alignment = taCenter
            AutoSize = False
            Caption = 'Suchfeld'
            Layout = tlCenter
          end
          object SuchFeldCB: TComboBox
            Left = 245
            Top = 0
            Width = 96
            Height = 21
            Style = csDropDownList
            Ctl3D = False
            ItemHeight = 0
            ParentCtl3D = False
            TabOrder = 1
            OnChange = SuchFeldCBChange
            Items.Strings = (
              'Text'
              'Suchbegriff'
              'Artikelnummer'
              'Barcode/EAN')
          end
          object Label31: TLabel
            Left = 341
            Top = 0
            Width = 62
            Height = 22
            Alignment = taCenter
            AutoSize = False
            Caption = 'Suchbegriff'
            Layout = tlCenter
          end
          object SuchBeg: TEdit
            Left = 403
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
            OnChange = SuchBegChange
            OnKeyPress = SuchBegKeyPress
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'TabSheet4'
        ImageIndex = 3
        object CaoGroupBox4: TOFGroupBox
          Left = 0
          Top = 0
          Width = 688
          Height = 272
          Align = alClient
          Caption = 'Zu-Abgang gruppiert nach Warengruppen'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 0
          object WgrGrid: TOFDBGrid
            Left = 8
            Top = 21
            Width = 672
            Height = 243
            Align = alClient
            BorderStyle = bsNone
            Ctl3D = False
            DataSource = SumDS
            DefaultDrawing = False
            DragCursor = crDefault
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
            RowColor1 = 14680063
            RowColor2 = clWindow
            ShowTitleEllipsis = True
            DefaultRowHeight = 17
            EditColor = clBlack
            Columns = <
              item
                Expanded = False
                FieldName = 'WARENGRUPPE'
                Title.Caption = 'WG'
                Width = 33
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NAME'
                Title.Caption = 'Warengruppe'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SUM_SOLL'
                Title.Caption = 'Summe SOLL'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SUM_IST'
                Title.Caption = 'Summe IST'
                Width = 71
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WERT_SOLL'
                Title.Caption = 'Wert Soll'
                Width = 81
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WERT_IST'
                Title.Caption = 'Wert IST'
                Width = 87
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WERT_DIFF'
                Title.Caption = 'Zu- / Abgang'
                Visible = True
              end>
          end
        end
        object CaoGroupBox5: TOFGroupBox
          Left = 0
          Top = 272
          Width = 688
          Height = 86
          Align = alBottom
          Caption = 'Zusammenfassung'
          Color = 14680063
          Ctl3D = False
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 1
          object Label3: TLabel
            Left = 8
            Top = 24
            Width = 36
            Height = 13
            Caption = 'Status :'
          end
          object DBText2: TDBText
            Tag = 1
            Left = 50
            Top = 25
            Width = 630
            Height = 13
            DataField = 'CALC_STATUS'
            DataSource = InvKopfDS
          end
        end
        object FertigToolbar: TToolBar
          Left = 0
          Top = 358
          Width = 688
          Height = 26
          Align = alBottom
          AutoSize = True
          BorderWidth = 1
          ButtonWidth = 138
          Caption = 'ToolBar2'
          EdgeBorders = []
          Flat = True
          Images = MainForm.ImageList1
          Indent = 2
          List = True
          ShowCaptions = True
          TabOrder = 2
          Wrapable = False
          object DBNavigator4: TDBNavigator
            Left = 2
            Top = 0
            Width = 185
            Height = 22
            DataSource = SumDS
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
            TabOrder = 0
          end
          object ToolButton5: TToolButton
            Left = 187
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 11
            Style = tbsSeparator
          end
          object RefreshBtn: TToolButton
            Left = 195
            Top = 0
            AutoSize = True
            Caption = 'Aktualisieren'
            ImageIndex = 13
            OnClick = RefreshBtnClick
          end
          object ToolButton7: TToolButton
            Left = 286
            Top = 0
            Width = 8
            Caption = 'ToolButton7'
            ImageIndex = 12
            Style = tbsSeparator
          end
          object InvFertigBtn: TToolButton
            Left = 294
            Top = 0
            AutoSize = True
            Caption = 'Fertigstellen / Abschlu'#223
            ImageIndex = 12
            OnClick = InvFertigBtnClick
          end
        end
      end
    end
  end
  object InvKopfTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = InvKopfTabAfterScroll
    AfterScroll = InvKopfTabAfterScroll
    OnCalcFields = InvKopfTabCalcFields
    AfterPost = InvKopfTabAfterScroll
    AfterCancel = InvKopfTabAfterScroll
    AfterDelete = InvKopfTabAfterScroll
    SQL.Strings = (
      'select * from INVENTUR'
      'order by DATUM')
    Params = <>
    Left = 20
    Top = 78
    object InvKopfTabID: TIntegerField
      DisplayLabel = 'lfd. Nr.'
      FieldName = 'ID'
      DisplayFormat = '0000'
    end
    object InvKopfTabDATUM: TDateField
      DisplayLabel = 'Datum'
      FieldName = 'DATUM'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object InvKopfTabBESCHREIBUNG: TStringField
      DisplayLabel = 'Beschreibung'
      FieldName = 'BESCHREIBUNG'
      Size = 250
    end
    object InvKopfTabINFO: TMemoField
      FieldName = 'INFO'
      BlobType = ftMemo
    end
    object InvKopfTabSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object InvKopfTabCALC_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkCalculated
      FieldName = 'CALC_STATUS'
      Calculated = True
    end
  end
  object InvKopfDS: TDataSource
    DataSet = InvKopfTab
    Left = 84
    Top = 78
  end
  object InvArtDS: TDataSource
    DataSet = InvArtTab
    Left = 84
    Top = 126
  end
  object InvArtTab: TZQuery
    Connection = DM1.DB1
    AfterScroll = InvArtTabAfterScroll
    OnCalcFields = InvArtTabCalcFields
    UpdateObject = InvArtTabUpd
    BeforePost = InvArtTabBeforePost
    AfterPost = InvArtTabAfterPost
    BeforeDelete = InvArtTabBeforeDelete
    OnNewRecord = InvArtTabBeforeDelete
    SQL.Strings = (
      'select '
      'AI.INVENTUR_ID,'
      'AI.ARTIKEL_ID,'
      'AI.WARENGRUPPE, '
      'AI.ARTNUM,'
      'AI.MATCHCODE,'
      'AI.BARCODE,'
      'AI.KURZTEXT,'
      'A.LAENGE,'
      'A.GROESSE,'
      'A.DIMENSION,'
      'A.GEWICHT,'
      'AI.MENGE_IST,'
      'AI.MENGE_SOLL,'
      'AI.MENGE_DIFF,'
      'AI.EK_PREIS,'
      'AI.INVENTUR_WERT,'
      'AI.STATUS,'
      'AI.BEARBEITER'
      'from ARTIKEL_INVENTUR AI'
      'left outer JOIN ARTIKEL A on A.REC_ID=AI.ARTIKEL_ID'
      'limit 0,100')
    Params = <>
    Left = 20
    Top = 126
    object InvArtTabINVENTUR_ID: TIntegerField
      FieldName = 'INVENTUR_ID'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object InvArtTabARTIKEL_ID: TIntegerField
      FieldName = 'ARTIKEL_ID'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object InvArtTabWARENGRUPPE: TIntegerField
      DisplayLabel = 'WG'
      FieldName = 'WARENGRUPPE'
      ReadOnly = True
    end
    object InvArtTabARTNUM: TStringField
      DisplayLabel = 'Artikelnummer'
      FieldName = 'ARTNUM'
      ReadOnly = True
    end
    object InvArtTabMATCHCODE: TStringField
      DisplayLabel = 'MatchCode'
      FieldName = 'MATCHCODE'
      ReadOnly = True
      Size = 250
    end
    object InvArtTabBARCODE: TStringField
      DisplayLabel = 'Barcode'
      FieldName = 'BARCODE'
      ReadOnly = True
      Size = 250
    end
    object InvArtTabKURZTEXT: TStringField
      DisplayLabel = 'Kurztext'
      FieldName = 'KURZTEXT'
      ReadOnly = True
      Size = 250
    end
    object InvArtTabLAENGE: TStringField
      DisplayLabel = 'L'#228'nge'
      FieldName = 'LAENGE'
      ReadOnly = True
    end
    object InvArtTabGROESSE: TStringField
      DisplayLabel = 'Gr'#246#223'e'
      FieldName = 'GROESSE'
      ReadOnly = True
    end
    object InvArtTabDIMENSION: TStringField
      DisplayLabel = 'Dimension'
      FieldName = 'DIMENSION'
      ReadOnly = True
    end
    object InvArtTabGEWICHT: TFloatField
      DisplayLabel = 'Gewicht'
      FieldName = 'GEWICHT'
      ReadOnly = True
    end
    object InvArtTabEK_PREIS: TFloatField
      DisplayLabel = 'EK-Preis'
      FieldName = 'EK_PREIS'
      ReadOnly = True
      DisplayFormat = ',#0.000'
    end
    object InvArtTabINVENTUR_WERT: TFloatField
      DisplayLabel = 'Inventurwert'
      FieldName = 'INVENTUR_WERT'
      DisplayFormat = ',#0.0 "%"'
      MaxValue = 250.000000000000000000
    end
    object InvArtTabMENGE_SOLL: TFloatField
      DisplayLabel = 'Menge Soll'
      FieldName = 'MENGE_SOLL'
      ReadOnly = True
      Required = True
      DisplayFormat = ',#0.000'
    end
    object InvArtTabMENGE_IST: TFloatField
      DisplayLabel = 'Menge IST'
      FieldName = 'MENGE_IST'
      DisplayFormat = ',#0.000'
    end
    object InvArtTabSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
      Visible = False
    end
    object InvArtTabBEARBEITER: TStringField
      DisplayLabel = 'Bearbeitet von'
      FieldName = 'BEARBEITER'
      Size = 50
    end
    object InvArtTabCALC_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkCalculated
      FieldName = 'CALC_STATUS'
      Calculated = True
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
    Left = 84
    Top = 174
    object Adresse1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 3
      Visible = False
      object Neu1: TMenuItem
        Caption = '&Neu'
        GroupIndex = 2
        ImageIndex = 23
        ShortCut = 16462
      end
      object N1: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object SichtbareSpalten1: TMenuItem
        Caption = 'Sichtbare Spalten'
        GroupIndex = 2
        ImageIndex = 15
      end
      object Layoutspeichern1: TMenuItem
        Caption = 'Layout speichern'
        GroupIndex = 2
        ImageIndex = 16
      end
    end
    object Sortierung1: TMenuItem
      Caption = '&Sortierung'
      GroupIndex = 4
      object Match1: TMenuItem
        Tag = 1
        Caption = '&Match'
        Checked = True
        Default = True
        GroupIndex = 3
        RadioItem = True
        OnClick = Name11Click
      end
      object Name11: TMenuItem
        Tag = 2
        Caption = '&Artikelnummer'
        GroupIndex = 3
        RadioItem = True
        OnClick = Name11Click
      end
    end
    object MnuExtras: TMenuItem
      Caption = '&Extras'
      GroupIndex = 7
      object alleArtikelalsbearbeitetmarkieren1: TMenuItem
        Caption = 'alle Artikel als bearbeitet markieren'
        ImageIndex = 18
        OnClick = alleArtikelalsbearbeitetmarkieren1Click
      end
      object alleArtikelalsunbearbeitetmarkieren1: TMenuItem
        Caption = 'alle Artikel als unbearbeitet markieren'
        ImageIndex = 18
        OnClick = alleArtikelalsunbearbeitetmarkieren1Click
      end
      object SollmengennachISTMengenbernehmen1: TMenuItem
        Caption = 'SOLL-Mengen nach IST-Mengen '#252'bernehmen'
        ImageIndex = 18
        OnClick = SollmengennachISTMengenbernehmen1Click
      end
      object ISTMengenauf0setzen1: TMenuItem
        Caption = 'IST-Mengen auf 0 setzen'
        ImageIndex = 18
        OnClick = ISTMengenauf0setzen1Click
      end
    end
    object Drucken1: TMenuItem
      Caption = 'Dr&ucken'
      GroupIndex = 7
      object Artikelliste1: TMenuItem
        Caption = 'Inventur-Z'#228'hlliste'
        ImageIndex = 11
        OnClick = Artikelliste1Click
      end
      object Lagerwertliste1: TMenuItem
        Caption = 'Lagerwertliste'
        ImageIndex = 11
        OnClick = Lagerwertliste1Click
      end
      object InventurAuswertung1: TMenuItem
        Caption = 'Inventur-Auswertung'
        ImageIndex = 11
        Visible = False
      end
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 7
      Visible = False
      object Liste1: TMenuItem
        Tag = 6
        Caption = 'Liste'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 118
      end
      object Allgemein1: TMenuItem
        Tag = 1
        Caption = 'Allgemein'
        Checked = True
        GroupIndex = 4
        RadioItem = True
      end
      object MengePreise1: TMenuItem
        Tag = 2
        Caption = 'Artikel'
        GroupIndex = 4
        RadioItem = True
      end
      object Historie1: TMenuItem
        Tag = 5
        Caption = 'Fertigstellen'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 117
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
        end
        object N501: TMenuItem
          Tag = 50
          Caption = '50 Treffer'
          Checked = True
          Default = True
          GroupIndex = 12
          RadioItem = True
        end
        object N1001: TMenuItem
          Tag = 100
          Caption = '100 Treffer'
          GroupIndex = 12
          RadioItem = True
        end
        object N2001: TMenuItem
          Tag = 200
          Caption = '200 Treffer'
          GroupIndex = 12
          RadioItem = True
        end
        object N5001: TMenuItem
          Tag = 500
          Caption = '500 Treffer'
          GroupIndex = 12
          RadioItem = True
        end
        object alle1: TMenuItem
          Tag = 999999999
          Caption = 'alle Treffer'
          GroupIndex = 12
          RadioItem = True
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
      end
    end
  end
  object SumQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select WARENGRUPPE, NAME, '
      'SUM(MENGE_SOLL) as SUM_SOLL,'
      'SUM(MENGE_IST) as SUM_IST, '
      'SUM(MENGE_SOLL * EK_PREIS / 100 * INVENTUR_WERT) as WERT_SOLL,'
      'SUM(MENGE_IST * EK_PREIS / 100 * INVENTUR_WERT) as WERT_IST,'
      
        'SUM((MENGE_IST * EK_PREIS / 100 * INVENTUR_WERT) - (MENGE_SOLL *' +
        ' EK_PREIS / 100 * INVENTUR_WERT)) as WERT_DIFF'
      'from ARTIKEL_INVENTUR, WARENGRUPPEN'
      'where WARENGRUPPE= ID and ARTIKEL_INVENTUR.INVENTUR_ID=:ID'
      'group by WARENGRUPPE')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 20
    Top = 222
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object SumQueryWARENGRUPPE: TIntegerField
      FieldName = 'WARENGRUPPE'
    end
    object SumQueryNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object SumQuerySUM_SOLL: TFloatField
      FieldName = 'SUM_SOLL'
      DisplayFormat = ',#0.000'
    end
    object SumQuerySUM_IST: TFloatField
      FieldName = 'SUM_IST'
      DisplayFormat = ',#0.000'
    end
    object SumQueryWERT_SOLL: TFloatField
      FieldName = 'WERT_SOLL'
      DisplayFormat = ',#0.000 "'#8364'"'
    end
    object SumQueryWERT_IST: TFloatField
      FieldName = 'WERT_IST'
      DisplayFormat = ',#0.000 "'#8364'"'
    end
    object SumQueryWERT_DIFF: TFloatField
      FieldName = 'WERT_DIFF'
      DisplayFormat = ',#0.00 "'#8364'"'
    end
  end
  object SumDS: TDataSource
    DataSet = SumQuery
    Left = 84
    Top = 222
  end
  object InvArtTabUpd: TZUpdateSQL
    ModifySQL.Strings = (
      'UPDATE ARTIKEL_INVENTUR'
      
        'SET MENGE_IST=:MENGE_IST, STATUS=:STATUS, INVENTUR_WERT=:INVENTU' +
        'R_WERT, BEARBEITER=:BEARBEITER'
      'WHERE INVENTUR_ID=:INVENTUR_ID AND ARTIKEL_ID=:ARTIKEL_ID')
    UseSequenceFieldForRefreshSQL = False
    Left = 21
    Top = 274
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MENGE_IST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INVENTUR_WERT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BEARBEITER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INVENTUR_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ARTIKEL_ID'
        ParamType = ptUnknown
      end>
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = SearchTimerTimer
    Left = 21
    Top = 172
  end
end
