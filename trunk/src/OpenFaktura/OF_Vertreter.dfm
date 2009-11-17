object VertreterForm: TVertreterForm
  Left = 364
  Top = 167
  Width = 724
  Height = 508
  Caption = 'Vertreter'
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
    Width = 716
    Height = 462
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TopPan: TPanel
      Left = 0
      Top = 0
      Width = 716
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      object MainTopLab: TLabel
        Left = 0
        Top = 0
        Width = 85
        Height = 23
        Align = alLeft
        Caption = ' Vertreter ... '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object ButtonPan: TPanel
        Left = 454
        Top = 0
        Width = 258
        Height = 23
        Align = alRight
        AutoSize = True
        BevelOuter = bvNone
        Color = clBtnShadow
        TabOrder = 0
        object AllgBtn: TJvSpeedButton
          Tag = 1
          Left = 0
          Top = 0
          Width = 65
          Height = 22
          Caption = 'Allgemein'
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
        object ProBtn: TJvSpeedButton
          Tag = 2
          Left = 66
          Top = 0
          Width = 68
          Height = 22
          Caption = 'Provision'
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
        object Liste_Btn: TJvSpeedButton
          Tag = 3
          Left = 138
          Top = 0
          Width = 73
          Height = 22
          Caption = '_Liste'
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
          OnMouseEnter = ListeBtnMouseEnter
          OnMouseLeave = ListeBtnMouseLeave
          OnClick = ListeBtnClick
        end
        object ListeBtn: TJvSpeedButton
          Tag = 4
          Left = 211
          Top = 0
          Width = 47
          Height = 22
          Caption = 'Liste'
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
    object KunToolbar: TToolBar
      Left = 0
      Top = 436
      Width = 716
      Height = 26
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 88
      Caption = 'NavToolbar'
      EdgeBorders = []
      Flat = True
      Images = MainForm.ImageList1
      Indent = 2
      List = True
      ShowCaptions = True
      TabOrder = 1
      object DBNavigator3: TDBNavigator
        Left = 2
        Top = 0
        Width = 192
        Height = 22
        DataSource = Vert_DS
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
        Flat = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object Label35: TLabel
        Left = 194
        Top = 0
        Width = 64
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Suchbegriff'
        Layout = tlCenter
      end
      object SuchBeg: TEdit
        Left = 258
        Top = 0
        Width = 100
        Height = 22
        TabStop = False
        AutoSize = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnChange = SuchBegChange
        OnKeyPress = SuchBegKeyPress
      end
      object ToolButton6: TToolButton
        Left = 358
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object UebernahmeBtn: TToolButton
        Left = 366
        Top = 0
        AutoSize = True
        Caption = #220'ber&nahme'
        ImageIndex = 22
        Visible = False
      end
    end
    object Main_PC: TJvPageControl
      Left = 0
      Top = 27
      Width = 716
      Height = 409
      ActivePage = Allg_TS
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 2
      OnChange = Main_PCChange
      ClientBorderWidth = 1
      object Allg_TS: TTabSheet
        Caption = 'Allgemein'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 714
          Height = 135
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object KommunikationGB: TOFGroupBox
            Left = 358
            Top = 0
            Width = 356
            Height = 135
            Align = alClient
            Caption = 'Kommunikation'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 1
            object Label7: TLabel
              Left = 5
              Top = 27
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Telefon :'
            end
            object Label8: TLabel
              Left = 5
              Top = 48
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Telefax :'
            end
            object Label9: TLabel
              Left = 5
              Top = 69
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Mobilfunk :'
            end
            object Label10: TLabel
              Left = 5
              Top = 88
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'eMail :'
            end
            object VeFunkEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 66
              Width = 264
              Height = 19
              DataField = 'FUNK'
              DataSource = Vert_DS
              TabOrder = 2
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object VeFaxEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 45
              Width = 264
              Height = 19
              DataField = 'FAX'
              DataSource = Vert_DS
              TabOrder = 1
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object VeTelEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 24
              Width = 264
              Height = 19
              DataField = 'TELEFON'
              DataSource = Vert_DS
              TabOrder = 0
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object VeEmailEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 87
              Width = 264
              Height = 19
              DataField = 'EMAIL'
              DataSource = Vert_DS
              TabOrder = 3
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
          end
          object AllgemeinGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 358
            Height = 135
            Align = alLeft
            Caption = 'Allgemein'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 0
            object Label56: TLabel
              Left = 5
              Top = 27
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Vertreter-Nr..:'
            end
            object Label3: TLabel
              Left = 5
              Top = 50
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Name :'
            end
            object Label4: TLabel
              Left = 5
              Top = 69
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Vorname :'
            end
            object Label5: TLabel
              Left = 5
              Top = 90
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Stra'#223'e :'
            end
            object Label6: TLabel
              Left = 5
              Top = 111
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Wohnort :'
            end
            object VeNumEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 24
              Width = 266
              Height = 19
              DataField = 'VERTR_NUMMER'
              DataSource = Vert_DS
              TabOrder = 0
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object VeNameEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 45
              Width = 266
              Height = 19
              DataField = 'NAME'
              DataSource = Vert_DS
              TabOrder = 1
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object VeVNameEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 66
              Width = 266
              Height = 19
              DataField = 'VNAME'
              DataSource = Vert_DS
              TabOrder = 2
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object VeStrasseEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 87
              Width = 266
              Height = 19
              DataField = 'STRASSE'
              DataSource = Vert_DS
              TabOrder = 3
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object VeOrtEdi: TDBEdit
              Tag = 1
              Left = 144
              Top = 108
              Width = 206
              Height = 19
              DataField = 'ORT'
              DataSource = Vert_DS
              TabOrder = 5
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object VePLZEdi: TDBEdit
              Left = 84
              Top = 108
              Width = 57
              Height = 19
              DataField = 'PLZ'
              DataSource = Vert_DS
              TabOrder = 4
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
          end
        end
        object BemerkungGB: TOFGroupBox
          Left = 0
          Top = 135
          Width = 714
          Height = 249
          Align = alClient
          Caption = 'Bemerkung'
          Color = 14680063
          Ctl3D = False
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 1
          object MaBemerkung: TDBMemo
            Left = 8
            Top = 21
            Width = 698
            Height = 220
            Align = alClient
            Ctl3D = False
            DataField = 'BEMERKUNG'
            DataSource = Vert_DS
            ParentCtl3D = False
            TabOrder = 0
            WantTabs = True
            OnEnter = VeNumEdiEnter
            OnExit = VeNumEdiExit
            OnKeyDown = VeNumEdiKeyDown
            OnKeyPress = VeNumEdiKeyPress
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 1
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 714
          Height = 174
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object CaoGroupBox1: TOFGroupBox
            Left = 0
            Top = 0
            Width = 357
            Height = 174
            Align = alLeft
            Caption = 'Provision'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 0
            object Label1: TLabel
              Left = 5
              Top = 27
              Width = 120
              Height = 13
              AutoSize = False
              Caption = 'Provisionsart.: A/U/K'
            end
            object Label2: TLabel
              Left = 5
              Top = 47
              Width = 120
              Height = 13
              AutoSize = False
              Caption = 'Abrechnungszeitpunkt :'
            end
            object Label11: TLabel
              Left = 5
              Top = 68
              Width = 120
              Height = 13
              AutoSize = False
              Caption = 'Provision mit Transport :'
            end
            object Label12: TLabel
              Left = 5
              Top = 89
              Width = 120
              Height = 13
              AutoSize = False
              Caption = 'Provisions Satz :'
            end
            object Label13: TLabel
              Left = 5
              Top = 110
              Width = 120
              Height = 13
              AutoSize = False
              Caption = 'Letzte Abrechnung :'
            end
            object Label14: TLabel
              Left = 5
              Top = 131
              Width = 120
              Height = 13
              AutoSize = False
              Caption = 'Umsatz :'
            end
            object Label15: TLabel
              Left = 5
              Top = 152
              Width = 120
              Height = 13
              AutoSize = False
              Caption = 'Erzielte Provision :'
            end
            object ProvArtEdi: TDBEdit
              Tag = 1
              Left = 132
              Top = 20
              Width = 217
              Height = 19
              DataField = 'PROVISIONSART'
              DataSource = Vert_DS
              TabOrder = 0
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object DBEdit2: TDBEdit
              Tag = 1
              Left = 132
              Top = 41
              Width = 217
              Height = 19
              DataField = 'ABRECHNUNGSZEITPUNKT'
              DataSource = Vert_DS
              TabOrder = 1
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object DBEdit3: TDBEdit
              Tag = 1
              Left = 132
              Top = 62
              Width = 217
              Height = 19
              DataField = 'PROVISIONMITTRANSPORT'
              DataSource = Vert_DS
              TabOrder = 2
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object DBEdit4: TDBEdit
              Tag = 1
              Left = 132
              Top = 83
              Width = 217
              Height = 19
              DataField = 'PROVISIONSATZ'
              DataSource = Vert_DS
              TabOrder = 3
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object DBEdit5: TDBEdit
              Tag = 1
              Left = 132
              Top = 125
              Width = 217
              Height = 19
              DataField = 'UMSATZ'
              DataSource = Vert_DS
              Enabled = False
              ReadOnly = True
              TabOrder = 5
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object DBEdit7: TDBEdit
              Tag = 1
              Left = 132
              Top = 146
              Width = 217
              Height = 19
              DataField = 'PROVISION'
              DataSource = Vert_DS
              Enabled = False
              ReadOnly = True
              TabOrder = 6
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object DBEdit6: TDBEdit
              Tag = 1
              Left = 132
              Top = 104
              Width = 217
              Height = 19
              DataField = 'LETZTEABRECHNUNG'
              DataSource = Vert_DS
              Enabled = False
              ReadOnly = True
              TabOrder = 4
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
          end
          object BankGB: TOFGroupBox
            Left = 357
            Top = 0
            Width = 357
            Height = 174
            Align = alClient
            Caption = 'Bankverbindung'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 1
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
            object KontoEdi: TDBEdit
              Tag = 1
              Left = 86
              Top = 41
              Width = 257
              Height = 19
              AutoSelect = False
              DataField = 'KTO'
              DataSource = Vert_DS
              TabOrder = 1
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object BlZEdi: TJvDBComboEdit
              Tag = 1
              Left = 86
              Top = 62
              Width = 257
              Height = 19
              AutoSelect = False
              DataField = 'BLZ'
              DataSource = Vert_DS
              ImageKind = ikEllipsis
              ButtonWidth = 16
              TabOrder = 2
              OnButtonClick = BlZEdiButtonClick
              OnEnter = VeNumEdiEnter
              OnExit = BlZEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object BankNameEdi: TDBEdit
              Tag = 1
              Left = 86
              Top = 83
              Width = 257
              Height = 19
              AutoSelect = False
              DataField = 'BANK'
              DataSource = Vert_DS
              TabOrder = 3
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object KontoInhEdi: TDBEdit
              Tag = 1
              Left = 86
              Top = 20
              Width = 257
              Height = 19
              AutoSelect = False
              DataSource = Vert_DS
              TabOrder = 0
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
          end
        end
        object CaoGroupBox2: TOFGroupBox
          Left = 0
          Top = 174
          Width = 714
          Height = 210
          Align = alClient
          Color = 14680063
          Ctl3D = False
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 1
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'TabSheet3'
        ImageIndex = 2
      end
      object Such_TS: TTabSheet
        Caption = 'Such_TS'
        ImageIndex = 3
        object SuchGrid: TExRxDBGrid
          Left = 0
          Top = 0
          Width = 714
          Height = 384
          Align = alClient
          BorderStyle = bsNone
          DataSource = Vert_DS
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = SuchGridDblClick
          TitleButtons = True
          OnTitleBtnClick = SuchGridTitleBtnClick
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 24
          TitleRowHeight = 24
          Controls = <>
          ScrollBars = ssHorizontal
          EditColor = 12255087
          DefaultRowHeight = 17
          DisplayImages = False
          DisplayMemo = False
          RowColor1 = 14680063
          RowColor2 = clWindow
          UseRowColors = True
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
          ShowTextEllipsis = True
          ShowTitleEllipsis = True
          ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
          MaskedColumnDrag = True
          ShowTitlesWhenInactive = True
          ValueChecked = 1
          ValueUnChecked = 0
          Columns = <
            item
              Expanded = False
              FieldName = 'VERTR_NUMMER'
              Title.Caption = 'Nummer'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Caption = 'Name'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VNAME'
              Title.Caption = 'Vorname'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STRASSE'
              Title.Caption = 'Stra'#223'e'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LAND'
              Title.Caption = 'Land'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLZ'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORT'
              Title.Caption = 'Ort'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFON'
              Title.Caption = 'Telefon'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAX'
              Title.Caption = 'Fax'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FUNK'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Title.Caption = 'eMail'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVISIONSART'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ABRECHNUNGSZEITPUNKT'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PROVISIONMITTRANSPORT'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PROVISIONSATZ'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'LETZTEABRECHNUNG'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'UMSATZ'
              Title.Caption = 'Umsatz'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVISION'
              Title.Caption = 'Provision'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GEBDATUM'
              Title.Caption = 'Geb.-Datum'
              Visible = True
            end>
        end
      end
    end
  end
  object Vert_Tab: TZQuery
    Connection = DM1.DB1
    AfterOpen = Vert_TabAfterScroll
    AfterScroll = Vert_TabAfterScroll
    BeforeInsert = Vert_TabBeforeInsert
    BeforePost = Vert_TabBeforePost
    AfterPost = Vert_TabAfterPost
    AfterDelete = Vert_TabAfterScroll
    SQL.Strings = (
      'select * from VERTRETER')
    Params = <>
    Left = 420
    Top = 252
    object Vert_TabVERTRETER_ID: TIntegerField
      FieldName = 'VERTRETER_ID'
    end
    object Vert_TabVERTR_NUMMER: TStringField
      FieldName = 'VERTR_NUMMER'
      Size = 10
    end
    object Vert_TabNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object Vert_TabVNAME: TStringField
      FieldName = 'VNAME'
      Size = 100
    end
    object Vert_TabANREDE: TStringField
      FieldName = 'ANREDE'
      Size = 15
    end
    object Vert_TabTITEL: TStringField
      FieldName = 'TITEL'
      Size = 15
    end
    object Vert_TabZUSATZ: TStringField
      FieldName = 'ZUSATZ'
      Size = 40
    end
    object Vert_TabZUSATZ2: TStringField
      FieldName = 'ZUSATZ2'
      Size = 40
    end
    object Vert_TabZUHAENDEN: TStringField
      FieldName = 'ZUHAENDEN'
      Size = 40
    end
    object Vert_TabSTRASSE: TStringField
      FieldName = 'STRASSE'
      Size = 40
    end
    object Vert_TabLAND: TStringField
      FieldName = 'LAND'
      Size = 5
    end
    object Vert_TabPLZ: TStringField
      FieldName = 'PLZ'
      Size = 10
    end
    object Vert_TabORT: TStringField
      FieldName = 'ORT'
      Size = 40
    end
    object Vert_TabTELEFON: TStringField
      FieldName = 'TELEFON'
      Size = 100
    end
    object Vert_TabFAX: TStringField
      FieldName = 'FAX'
      Size = 100
    end
    object Vert_TabFUNK: TStringField
      DisplayLabel = 'Mobil'
      FieldName = 'FUNK'
      Size = 100
    end
    object Vert_TabEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object Vert_TabINTERNET: TStringField
      FieldName = 'INTERNET'
      Size = 100
    end
    object Vert_TabSPRACH_ID: TIntegerField
      FieldName = 'SPRACH_ID'
    end
    object Vert_TabPROVISIONSART: TStringField
      FieldName = 'PROVISIONSART'
      Size = 1
    end
    object Vert_TabABRECHNUNGSZEITPUNKT: TStringField
      FieldName = 'ABRECHNUNGSZEITPUNKT'
      Size = 1
    end
    object Vert_TabPROVISIONSATZ: TFloatField
      FieldName = 'PROVISIONSATZ'
      DisplayFormat = ',#0.00" %"'
      EditFormat = '0.00'
    end
    object Vert_TabPROVISIONMITTRANSPORT: TBooleanField
      FieldName = 'PROVISIONMITTRANSPORT'
    end
    object Vert_TabLETZTEABRECHNUNG: TDateField
      FieldName = 'LETZTEABRECHNUNG'
      DisplayFormat = 'dd.mm.yyyy;-;-'
    end
    object Vert_TabUMSATZ: TFloatField
      FieldName = 'UMSATZ'
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object Vert_TabPROVISION: TFloatField
      FieldName = 'PROVISION'
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object Vert_TabBESCHAEFTIGUNGSART: TIntegerField
      FieldName = 'BESCHAEFTIGUNGSART'
    end
    object Vert_TabBESCHAEFTIGUNGSGRAD: TIntegerField
      FieldName = 'BESCHAEFTIGUNGSGRAD'
      DisplayFormat = '0" %"'
      EditFormat = '0'
    end
    object Vert_TabGUELTIG_VON: TDateTimeField
      FieldName = 'GUELTIG_VON'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object Vert_TabGUELTIG_BIS: TDateTimeField
      FieldName = 'GUELTIG_BIS'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object Vert_TabGEBDATUM: TDateTimeField
      FieldName = 'GEBDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object Vert_TabGESCHLECHT: TStringField
      FieldName = 'GESCHLECHT'
      Size = 1
    end
    object Vert_TabFAMSTAND: TIntegerField
      FieldName = 'FAMSTAND'
    end
    object Vert_TabBANK: TStringField
      FieldName = 'BANK'
      Size = 40
    end
    object Vert_TabBLZ: TStringField
      FieldName = 'BLZ'
      Size = 10
    end
    object Vert_TabKTO: TStringField
      FieldName = 'KTO'
    end
    object Vert_TabBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      BlobType = ftMemo
    end
    object Vert_TabERSTELLT: TDateTimeField
      FieldName = 'ERSTELLT'
      DisplayFormat = 'dd.mm.yyyyy'
    end
    object Vert_TabERSTELLT_NAME: TStringField
      FieldName = 'ERSTELLT_NAME'
    end
    object Vert_TabGEAEND: TDateTimeField
      FieldName = 'GEAEND'
      DisplayFormat = 'dd.mm.yyyyy'
    end
    object Vert_TabGEAEND_NAME: TStringField
      FieldName = 'GEAEND_NAME'
    end
  end
  object Vert_DS: TDataSource
    DataSet = Vert_Tab
    Left = 420
    Top = 296
  end
  object MainMenu1: TJvMainMenu
    Images = MainForm.ImageList1
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 420
    Top = 343
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
        Enabled = False
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
      object Nummer: TMenuItem
        Tag = 3
        Caption = 'N&ummer'
        GroupIndex = 3
        RadioItem = True
        OnClick = SortierungClick
      end
      object Name: TMenuItem
        Tag = 1
        Caption = '&Name'
        Checked = True
        Default = True
        GroupIndex = 3
        RadioItem = True
        OnClick = SortierungClick
      end
      object Ort: TMenuItem
        Tag = 2
        Caption = '&Ort'
        GroupIndex = 3
        RadioItem = True
        OnClick = SortierungClick
      end
    end
    object MenuItem2: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 4
      object Allgemein1: TMenuItem
        Tag = 1
        Caption = 'Allgemein'
        Checked = True
        GroupIndex = 4
        RadioItem = True
        ShortCut = 117
        OnClick = ListeBtnClick
      end
      object Provision1: TMenuItem
        Tag = 2
        Caption = 'Provision'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32885
        OnClick = ListeBtnClick
      end
      object Ansprechpartner1: TMenuItem
        Tag = 3
        Caption = 'Ansprechpartner'
        GroupIndex = 4
        RadioItem = True
        Visible = False
        OnClick = ListeBtnClick
      end
      object Liste1: TMenuItem
        Tag = 4
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
          OnClick = TrefferClick
        end
        object N501: TMenuItem
          Tag = 50
          Caption = '50 Treffer'
          Checked = True
          Default = True
          GroupIndex = 12
          RadioItem = True
          OnClick = TrefferClick
        end
        object N1001: TMenuItem
          Tag = 100
          Caption = '100 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = TrefferClick
        end
        object N2001: TMenuItem
          Tag = 200
          Caption = '200 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = TrefferClick
        end
        object N5001: TMenuItem
          Tag = 500
          Caption = '500 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = TrefferClick
        end
        object alle1: TMenuItem
          Tag = 999999999
          Caption = 'alle Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = TrefferClick
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
      GroupIndex = 5
      Visible = False
      object N5: TMenuItem
        Caption = '-'
      end
      object N6: TMenuItem
        Caption = '-'
      end
    end
  end
end
