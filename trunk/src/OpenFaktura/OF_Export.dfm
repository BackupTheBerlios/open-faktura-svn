object ExportForm: TExportForm
  Left = 308
  Top = 256
  Width = 783
  Height = 540
  Caption = 'Export'
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
    Width = 775
    Height = 494
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TopPan: TPanel
      Left = 0
      Top = 0
      Width = 775
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      object ReEdiTopLab: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 23
        Align = alLeft
        Caption = '  Export ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object ButtonPan: TPanel
        Left = 484
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
          Caption = 'Aus&wahl'
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
          OnClick = AuswahlBtnClick
        end
        object AllgemeinBtn: TJvSpeedButton
          Tag = 2
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
          Visible = False
          OnMouseEnter = AuswahlBtnMouseEnter
          OnMouseLeave = AuswahlBtnMouseLeave
          OnClick = AuswahlBtnClick
        end
        object SQLBtn: TJvSpeedButton
          Tag = 3
          Left = 134
          Top = 0
          Width = 73
          Height = 22
          Caption = 'S&QL'
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
          OnClick = AuswahlBtnClick
        end
        object FelderBtn: TJvSpeedButton
          Tag = 4
          Left = 207
          Top = 0
          Width = 80
          Height = 22
          Caption = '&Felder'
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
          Visible = False
          OnMouseEnter = AuswahlBtnMouseEnter
          OnMouseLeave = AuswahlBtnMouseLeave
          OnClick = AuswahlBtnClick
        end
      end
    end
    object PC1: TJvPageControl
      Left = 0
      Top = 27
      Width = 775
      Height = 467
      ActivePage = SQLExecTS
      Align = alClient
      MultiLine = True
      Style = tsFlatButtons
      TabOrder = 1
      OnChange = PC1Change
      ClientBorderWidth = 0
      HideAllTabs = True
      object AuswahlTS: TTabSheet
        Caption = 'Auswahl'
        object ToolBar1: TToolBar
          Left = 0
          Top = 414
          Width = 775
          Height = 30
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonWidth = 87
          Caption = 'ToolBar1'
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = MainForm.ImageList1
          List = True
          ShowCaptions = True
          TabOrder = 0
          object DBNavigator1: TDBNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = ExportDS
            Flat = True
            TabOrder = 0
          end
          object ToolButton1: TToolButton
            Left = 240
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            Style = tbsSeparator
          end
          object AuswExportBtn: TToolButton
            Left = 248
            Top = 0
            AutoSize = True
            Caption = 'Export (CSV)'
            ImageIndex = 37
            OnClick = AuswExportBtnClick
          end
          object ToolButton3: TToolButton
            Left = 339
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 38
            Style = tbsSeparator
          end
          object EdiBtn: TToolButton
            Left = 347
            Top = 0
            AutoSize = True
            Caption = '&Bearbeiten'
            ImageIndex = 30
            OnClick = EdiBtnClick
          end
        end
        object ExportListGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 775
          Height = 414
          Align = alClient
          DataSource = ExportDS
          DefaultDrawing = False
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
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
          RowColor1 = 12255087
          RowColor2 = clWindow
          DefaultRowHeight = 17
          EditColor = clBlack
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KURZBEZ'
              Width = 490
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LAST_CHANGE'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHANGE_NAME'
              Width = 110
              Visible = True
            end>
        end
      end
      object AllgTS: TTabSheet
        Caption = 'Allgemein'
        ImageIndex = 3
      end
      object SQLExecTS: TTabSheet
        Caption = 'SQL'
        ImageIndex = 1
        object JvxSplitter1: TJvxSplitter
          Left = 0
          Top = 193
          Width = 775
          Height = 4
          ControlFirst = Panel1
          Align = alTop
          TopLeftLimit = 100
          BottomRightLimit = 100
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 414
          Width = 775
          Height = 30
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonWidth = 96
          Caption = 'ToolBar1'
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = MainForm.ImageList1
          List = True
          ShowCaptions = True
          TabOrder = 1
          Wrapable = False
          object Auswahl2Btn: TToolButton
            Tag = 1
            Left = 0
            Top = 0
            AutoSize = True
            Caption = 'Zur'#252'ck'
            ImageIndex = 36
            OnClick = AuswahlBtnClick
          end
          object ToolButton4: TToolButton
            Left = 65
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 38
            Style = tbsSeparator
          end
          object DBNavigator2: TDBNavigator
            Left = 73
            Top = 0
            Width = 190
            Height = 22
            DataSource = EDS
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
            TabOrder = 0
          end
          object ToolButton5: TToolButton
            Left = 263
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 0
            Style = tbsSeparator
          end
          object SQLExecBtn: TToolButton
            Left = 271
            Top = 0
            AutoSize = True
            Caption = 'Ausf'#252'hren (F8)'
            ImageIndex = 18
            OnClick = SQLExecBtnClick
          end
          object ToolButton2: TToolButton
            Left = 371
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            Style = tbsSeparator
          end
          object ExportBtn: TToolButton
            Left = 379
            Top = 0
            AutoSize = True
            Caption = 'Export (CSV)'
            ImageIndex = 37
            OnClick = ExportBtnClick
          end
          object ToolButton7: TToolButton
            Left = 470
            Top = 0
            Width = 8
            Caption = 'ToolButton7'
            ImageIndex = 38
            Style = tbsSeparator
          end
          object PrintBtn: TToolButton
            Left = 478
            Top = 0
            AutoSize = True
            Caption = 'Drucken'
            ImageIndex = 11
            OnClick = PrintBtnClick
          end
        end
        object SqlGrid: TOFDBGrid
          Left = 0
          Top = 197
          Width = 775
          Height = 217
          Align = alClient
          DataSource = EDS
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
          RowColor1 = 12255087
          RowColor2 = clWindow
          ShowTitleEllipsis = True
          DefaultRowHeight = 17
          EditColor = clBlack
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 775
          Height = 193
          Align = alTop
          Caption = 'Panel1'
          TabOrder = 3
          object Panel2: TPanel
            Left = 1
            Top = 1
            Width = 208
            Height = 191
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object TableList: TListBox
              Left = 0
              Top = 28
              Width = 208
              Height = 163
              Style = lbOwnerDrawFixed
              Align = alClient
              Ctl3D = True
              ItemHeight = 13
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 0
              OnDrawItem = TableListDrawItem
            end
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 208
              Height = 28
              Align = alTop
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'Tabellen '#220'bersicht'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
          end
          object Panel4: TPanel
            Left = 214
            Top = 1
            Width = 560
            Height = 191
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object SQLEditor: TSynEdit
              Left = 0
              Top = 29
              Width = 560
              Height = 162
              Cursor = crIBeam
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier New'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              BookMarkOptions.EnableKeys = False
              BorderStyle = bsNone
              Gutter.AutoSize = True
              Gutter.Color = 15592428
              Gutter.DigitCount = 3
              Gutter.Font.Charset = ANSI_CHARSET
              Gutter.Font.Color = clWindowText
              Gutter.Font.Height = -11
              Gutter.Font.Name = 'Arial'
              Gutter.Font.Style = [fsBold]
              Gutter.LeftOffset = 15
              Gutter.ShowLineNumbers = True
              Highlighter = MySQLSyn
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
              Lines.Strings = (
                '')
              Options = [eoAutoIndent, eoDragDropEditing, eoGroupUndo, eoKeepCaretX, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces, eoTrimTrailingSpaces]
              OnChange = SQLEditorChange
            end
            object ToolBar3: TToolBar
              Left = 0
              Top = 0
              Width = 560
              Height = 29
              Caption = 'ToolBar3'
              EdgeBorders = [ebTop, ebBottom]
              Images = ImageList2
              TabOrder = 1
              object ToolButton6: TToolButton
                Left = 0
                Top = 2
                Width = 17
                Caption = 'ToolButton6'
                Style = tbsSeparator
              end
              object UndoBtn: TToolButton
                Left = 17
                Top = 2
                Hint = 'R'#252'ckg'#228'ngig'
                Caption = 'UndoBtn'
                Enabled = False
                ImageIndex = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = UndoBtnClick
              end
              object RedoBtn: TToolButton
                Left = 40
                Top = 2
                Hint = 'Wiederherstellen'
                Caption = 'RedoBtn'
                Enabled = False
                ImageIndex = 3
                ParentShowHint = False
                ShowHint = True
                OnClick = RedoBtnClick
              end
              object ToolButton10: TToolButton
                Left = 63
                Top = 2
                Width = 26
                Caption = 'ToolButton10'
                ImageIndex = 2
                Style = tbsSeparator
              end
              object RunSQLBtn: TToolButton
                Left = 89
                Top = 2
                Hint = 'Ausf'#252'hren (F8)'
                Caption = 'RunSQLBtn'
                ImageIndex = 4
                ParentShowHint = False
                ShowHint = True
                OnClick = SQLExecBtnClick
              end
            end
          end
          object JvxSplitter2: TJvxSplitter
            Left = 209
            Top = 1
            Width = 5
            Height = 191
            ControlFirst = Panel2
            Align = alLeft
            TopLeftLimit = 100
            BottomRightLimit = 100
          end
        end
      end
      object FelderTS: TTabSheet
        Caption = 'Felder'
        ImageIndex = 2
      end
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
    Left = 204
    Top = 316
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Ausfhren1: TMenuItem
        Caption = 'Ausf'#252'hren'
        ImageIndex = 18
        ShortCut = 119
        OnClick = Ausfhren1Click
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
      Enabled = False
      GroupIndex = 4
      Visible = False
    end
  end
  object ExportTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = ExportTabAfterPost
    AfterScroll = ExportTabAfterPost
    BeforePost = ExportTabBeforePost
    AfterPost = ExportTabAfterPost
    SQL.Strings = (
      'select * from EXPORT'
      'order by KURZBEZ')
    Params = <>
    Left = 48
    Top = 317
    object ExportTabID: TIntegerField
      DisplayLabel = 'lfd. Nr.'
      FieldName = 'ID'
      DisplayFormat = '00000'
    end
    object ExportTabKURZBEZ: TStringField
      DisplayLabel = 'Beschreibung'
      DisplayWidth = 50
      FieldName = 'KURZBEZ'
      Required = True
      Size = 255
    end
    object ExportTabINFO: TMemoField
      FieldName = 'INFO'
      Required = True
      Visible = False
      BlobType = ftMemo
    end
    object ExportTabQUERY: TMemoField
      FieldName = 'QUERY'
      Required = True
      Visible = False
      BlobType = ftMemo
    end
    object ExportTabFELDER: TMemoField
      FieldName = 'FELDER'
      Visible = False
      BlobType = ftMemo
    end
    object ExportTabFORMULAR: TBlobField
      FieldName = 'FORMULAR'
      Visible = False
    end
    object ExportTabFORMAT: TStringField
      FieldName = 'FORMAT'
      Visible = False
      Size = 3
    end
    object ExportTabFILENAME: TStringField
      FieldName = 'FILENAME'
      Visible = False
      Size = 255
    end
    object ExportTabLAST_CHANGE: TDateTimeField
      DisplayLabel = 'le. '#196'nderung'
      FieldName = 'LAST_CHANGE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object ExportTabCHANGE_NAME: TStringField
      DisplayLabel = 'ge'#228'nd. von'
      DisplayWidth = 10
      FieldName = 'CHANGE_NAME'
      Size = 100
    end
  end
  object ExportDS: TDataSource
    DataSet = ExportTab
    Left = 129
    Top = 317
  end
  object EQuery: TZQuery
    Connection = DM1.DB1
    AfterOpen = EQueryAfterOpen
    AfterClose = EQueryAfterOpen
    Params = <>
    Left = 276
    Top = 318
  end
  object EDS: TDataSource
    DataSet = EQuery
    Left = 324
    Top = 318
  end
  object SaveDialog1: TSaveDialog
    Filter = 'CSV-Dateien|csv|Excel-Dateien|xls'
    Left = 399
    Top = 318
  end
  object WordList: TSynCompletionProposal
    DefaultType = ctCode
    Options = [scoLimitToMatchedText, scoUseInsertList, scoUsePrettyText, scoUseBuiltInTimer, scoEndCharCompletion]
    OnExecute = WordListExecute
    ItemList.Strings = (
      'Hallo Hallo'
      '')
    InsertList.Strings = (
      'Hallo Hallo'
      '')
    Position = 0
    NbLinesInWindow = 8
    ClSelect = clHighlight
    ClSelectedText = clHighlightText
    ClBackground = clWindow
    Width = 262
    BiggestWord = 'CONSTRUCTOR'
    EndOfTokenChr = '()[]. '
    TriggerChars = '.'
    Title = 'Tabellenfelder'
    ClTitleBackground = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBtnText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    ShortCut = 16416
    Editor = SQLEditor
    TimerInterval = 1000
    Left = 650
    Top = 312
  end
  object MySQLSyn: TSynSQLSyn
    DefaultFilter = 'SQL Files (*.sql)|*.sql'
    KeyAttri.Foreground = clBlue
    SymbolAttri.Foreground = clFuchsia
    SymbolAttri.Style = [fsBold]
    VariableAttri.Foreground = clGreen
    SQLDialect = sqlMySQL
    Left = 702
    Top = 313
  end
  object ImageList2: TImageList
    Left = 590
    Top = 312
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      000084848400C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000BDBD000000000084848400C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF00000000000000000084848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000BDBD000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF00000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF00000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000000000C6C6C600000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000AD5218000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CE7B7B00BD5A4A00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5632100C6630000B54A
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6845A00BD5A0000BD520000C68C6B000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B54A0000C663
      0000BD5A1800000000000000000000000000000000000000000000000000D68C
      9400B5520000C6630000BD632100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD5A
      1000C65A0000AD5218000000000000000000000000000000000000000000B55A
      1000C65A0000B55A100000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD5A0000BD5A000000000000000000000000000000000000BD734200BD5A
      0000B5520800CE9C840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000CE630000CE63
      0000C6630000BD5A0000BD5A0000BD5A0000BD520000C68C6B00000000000000
      0000AD521800C6630000BD6B3100000000000000000000000000BD5A0000C663
      0000BD635A000000000000000000BD6B2900C65A0000C65A0000C65A0000C663
      0000C6630000C6630000C663180000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000DE730000DE73
      0000C6630000AD4A0000C68C6B00CE9C7B00D6A5840000000000000000000000
      0000CE9C7B00BD5A0000BD5A08000000000000000000C6396300DE730000BD5A
      0000000000000000000000000000D66B8400C6845200C6845200BD6B2900B552
      0000C6630000C6630000C663180000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000E77B0000D66B
      0000D66B0000D66B0000BD633100000000000000000000000000000000000000
      000000000000BD5A1000BD5A0000D6A5840000000000CE844200F78C0000BD63
      2900000000000000000000000000000000000000000000000000B5521000C65A
      0000BD5A0000C65A0000C663180000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000F7940000BD5A
      0000C67B4200D66B0000CE630000BD6331000000000000000000000000000000
      000000000000BD5A1000BD5A0000D6AD8C0000000000CE844200F7940000C673
      31000000000000000000000000000000000000000000BD632900C65A0000BD5A
      0000AD4A1000BD5A0000C663180000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FF9C1000C663
      000000000000CE736300D66B0000DE730000BD63210000000000000000000000
      0000BD734A00BD5A0000BD5A08000000000000000000C6635A00FFA52900CE73
      080000000000000000000000000000000000BD520000C6630000BD5A08000000
      0000CE9C7B00BD5A0000C6631800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFAD4200C66B
      10000000000000000000C67B4200D66B0000DE730000CE6B0800C6733100C673
      3100BD5A0000C6630000BD6B3900000000000000000000000000DE8C2900F7A5
      3900CE732100C64A4A00CE7B3900CE6B0800DE730000C65A0000000000000000
      0000CE9C7B00BD5A0000C663180000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000DE944200C673
      3900000000000000000000000000D68C8C00CE6B1800D66B0000DE730000DE73
      0000BD5A0000B55A290000000000000000000000000000000000C68C6B00DE94
      4200FFB54A00FFA52900F7940000E7840000C66B210000000000000000000000
      000000000000B5520000BD632100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6A57B00C6733900BD6B
      3900CE9C7B000000000000000000000000000000000000000000000000000000
      0000CE7B4200C66B2900C6631800CE8C63000000000000000000000000000000
      000000000000CE9C840000000000000000000000000000000000000000000000
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
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000C3FF000000000000C0FF000000000000E03F000000000000
      F01F000000000000F80F000000000000F807000000000000F00F000000000000
      F807000000000000FE03000000000000FF81000000000000FFE3000000000000
      FFFF000000000000FFFF000000000000FFFFFFFFFFFFFFFFC003C003FFDFF9FF
      C003C003FF8FF0FFC003C003FFC7E1FFC003C003FFE3E3FFC003C003FFF3C3FF
      C003C003C031C601C003C003C0718E01C003C003C1F88FC1C003C003C0F88F81
      C003C003C8718F11C003C003CC01C031C003C003CE03C079C003C003FF87F0FB
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
