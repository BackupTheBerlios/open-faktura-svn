object EBBestVorForm: TEBBestVorForm
  Left = 301
  Top = 214
  Width = 726
  Height = 564
  Caption = 'EK-Bestellvorschlag'
  Color = clBtnFace
  DragKind = dkDock
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
    Width = 718
    Height = 518
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ArtPan: TPanel
      Left = 0
      Top = 0
      Width = 718
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      TabOrder = 0
      object FilterLab: TLabel
        Left = 202
        Top = 0
        Width = 3
        Height = 23
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 202
        Height = 23
        Align = alLeft
        Caption = '  Einkauf-Bestellvorschl'#228'ge   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
    end
    object ToolBar1: TToolBar
      Left = 0
      Top = 492
      Width = 718
      Height = 26
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 98
      Caption = 'ToolBar1'
      DisabledImages = MainForm.ImageList1
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = MainForm.ImageList1
      List = True
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 1
      Wrapable = False
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 0
        Width = 155
        Height = 22
        DataSource = EKBestVorDS
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Flat = True
        TabOrder = 0
      end
      object ToolButton1: TToolButton
        Left = 155
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        Style = tbsSeparator
      end
      object DBNavigator2: TDBNavigator
        Left = 163
        Top = 0
        Width = 62
        Height = 22
        DataSource = EKBestLiefDS
        VisibleButtons = [nbPrior, nbNext]
        Flat = True
        TabOrder = 1
      end
      object ToolButton7: TToolButton
        Left = 225
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 19
        Style = tbsSeparator
      end
      object LiefEdiBtn: TToolButton
        Left = 233
        Top = 0
        AutoSize = True
        Caption = 'Bearbeiten'
        ImageIndex = 30
        OnClick = LiefEdiBtnClick
      end
      object ToolButton3: TToolButton
        Left = 315
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 18
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 323
        Top = 0
        AutoSize = True
        Caption = 'neuer Lieferant'
        ImageIndex = 17
        OnClick = ToolButton2Click
      end
      object ToolButton5: TToolButton
        Left = 425
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 18
        Style = tbsSeparator
      end
      object BestellenBtn: TToolButton
        Left = 433
        Top = 0
        AutoSize = True
        Caption = 'Bestellen'
        ImageIndex = 18
      end
    end
    object ClientPanel: TPanel
      Left = 0
      Top = 27
      Width = 718
      Height = 465
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object DetailPan: TPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 465
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 0
          Top = 282
          Width = 718
          Height = 7
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          Visible = False
        end
        object LiefPC: TJvPageControl
          Left = 0
          Top = 289
          Width = 718
          Height = 176
          ActivePage = LieferantenTab
          Align = alBottom
          MultiLine = True
          Style = tsFlatButtons
          TabOrder = 0
          OnChange = LiefPCChange
          ClientBorderWidth = 0
          object LieferantenTab: TTabSheet
            Caption = 'Lieferanten'
            object LiefListGrid: TOFDBGrid
              Left = 0
              Top = 0
              Width = 718
              Height = 153
              Align = alClient
              DataSource = EKBestLiefDS
              DefaultDrawing = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = LiefEdiBtnClick
              TitleButtons = True
              OnTitleBtnClick = JourGridTitleBtnClick
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
              Columns = <
                item
                  Expanded = False
                  FieldName = 'BESTNUM'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PREIS'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'GEAEND'
                  ReadOnly = True
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'GEAEND_NAME'
                  ReadOnly = True
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MATCHCODE'
                  ReadOnly = True
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KUNNUM2'
                  ReadOnly = True
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NAME1'
                  ReadOnly = True
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LAND'
                  ReadOnly = True
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PLZ'
                  ReadOnly = True
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ORT'
                  ReadOnly = True
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TELE1'
                  ReadOnly = True
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMAIL'
                  ReadOnly = True
                  Width = 120
                  Visible = True
                end>
            end
          end
          object DetailTab: TTabSheet
            Caption = 'Details'
            ImageIndex = 1
            object SuchGB: TOFGroupBox
              Left = 460
              Top = 0
              Width = 258
              Height = 153
              Align = alClient
              Caption = 'Artikelinfo'
              Color = 14680063
              Ctl3D = False
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentColor = False
              ParentCtl3D = False
              TabOrder = 0
              object DBMemo1: TDBMemo
                Left = 8
                Top = 21
                Width = 242
                Height = 124
                Align = alClient
                DataField = 'INFO'
                DataSource = EKBestVorDS
                TabOrder = 0
              end
            end
            object CaoGroupBox1: TOFGroupBox
              Left = 0
              Top = 0
              Width = 258
              Height = 153
              Align = alLeft
              Caption = 'Lieferant'
              Color = 14680063
              Ctl3D = False
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentColor = False
              ParentCtl3D = False
              TabOrder = 1
              object Label2: TLabel
                Left = 6
                Top = 65
                Width = 65
                Height = 13
                AutoSize = False
                Caption = 'Name:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label3: TLabel
                Left = 5
                Top = 44
                Width = 65
                Height = 13
                AutoSize = False
                Caption = 'Kundennr.:'
              end
              object Label4: TLabel
                Left = 5
                Top = 24
                Width = 65
                Height = 13
                AutoSize = False
                Caption = 'Suchbegriff:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label5: TLabel
                Left = 5
                Top = 87
                Width = 65
                Height = 13
                AutoSize = False
                Caption = 'PLZ/Ort:'
              end
              object Label6: TLabel
                Left = 5
                Top = 110
                Width = 65
                Height = 13
                AutoSize = False
                Caption = 'Telefon:'
              end
              object Label7: TLabel
                Left = 5
                Top = 129
                Width = 65
                Height = 13
                AutoSize = False
                Caption = 'eMail:'
              end
              object DBEdit4: TDBEdit
                Left = 70
                Top = 20
                Width = 179
                Height = 19
                DataField = 'MATCHCODE'
                DataSource = EKBestLiefDS
                Enabled = False
                ReadOnly = True
                TabOrder = 0
              end
              object DBEdit9: TDBEdit
                Left = 70
                Top = 41
                Width = 179
                Height = 19
                DataField = 'KUNNUM2'
                DataSource = EKBestLiefDS
                Enabled = False
                ReadOnly = True
                TabOrder = 1
              end
              object DBEdit11: TDBEdit
                Left = 70
                Top = 62
                Width = 179
                Height = 19
                DataField = 'NAME1'
                DataSource = EKBestLiefDS
                Enabled = False
                ReadOnly = True
                TabOrder = 2
              end
              object DBEdit12: TDBEdit
                Left = 70
                Top = 84
                Width = 27
                Height = 19
                DataField = 'LAND'
                DataSource = EKBestLiefDS
                Enabled = False
                ReadOnly = True
                TabOrder = 3
              end
              object DBEdit15: TDBEdit
                Left = 102
                Top = 84
                Width = 51
                Height = 19
                DataField = 'PLZ'
                DataSource = EKBestLiefDS
                Enabled = False
                ReadOnly = True
                TabOrder = 4
              end
              object DBEdit16: TDBEdit
                Left = 158
                Top = 84
                Width = 91
                Height = 19
                DataField = 'ORT'
                DataSource = EKBestLiefDS
                Enabled = False
                ReadOnly = True
                TabOrder = 5
              end
              object DBEdit17: TDBEdit
                Left = 70
                Top = 106
                Width = 179
                Height = 19
                DataField = 'TELE1'
                DataSource = EKBestLiefDS
                Enabled = False
                ReadOnly = True
                TabOrder = 6
              end
              object DBEdit18: TDBEdit
                Left = 70
                Top = 127
                Width = 179
                Height = 19
                DataField = 'EMAIL'
                DataSource = EKBestLiefDS
                Enabled = False
                ReadOnly = True
                TabOrder = 7
              end
            end
            object CaoGroupBox2: TOFGroupBox
              Left = 258
              Top = 0
              Width = 202
              Height = 153
              Align = alLeft
              Caption = 'Menge / Preis'
              Color = 14680063
              Ctl3D = False
              FrameColor = clBtnFace
              TitleColor = 14680063
              ParentColor = False
              ParentCtl3D = False
              TabOrder = 2
              object Label8: TLabel
                Left = 5
                Top = 44
                Width = 63
                Height = 13
                AutoSize = False
                Caption = 'Preis :'
              end
              object Label9: TLabel
                Left = 5
                Top = 24
                Width = 63
                Height = 13
                AutoSize = False
                Caption = 'Bestellnr.:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object DBEdit1: TDBEdit
                Left = 73
                Top = 41
                Width = 121
                Height = 19
                DataField = 'PREIS'
                DataSource = EKBestLiefDS
                TabOrder = 0
              end
              object DBEdit2: TDBEdit
                Left = 73
                Top = 20
                Width = 121
                Height = 19
                DataField = 'BESTNUM'
                DataSource = EKBestLiefDS
                TabOrder = 1
              end
              object LiefDetailSaveBtn: TBitBtn
                Left = 8
                Top = 121
                Width = 90
                Height = 25
                Caption = 'Speichern'
                TabOrder = 2
                OnClick = LiefDetailSaveBtnClick
              end
              object LiefDetailCancelBtn: TBitBtn
                Left = 111
                Top = 121
                Width = 82
                Height = 25
                Caption = 'Verwerfen'
                TabOrder = 3
                OnClick = LiefDetailCancelBtnClick
              end
            end
          end
          object EKHistTab: TTabSheet
            Caption = 'EK-Historie'
            ImageIndex = 2
          end
          object EKBestTab: TTabSheet
            Caption = 'unfertige EK-Bestellungen'
            ImageIndex = 4
            object InfoGrid: TOFDBGrid
              Left = 0
              Top = 0
              Width = 718
              Height = 153
              Align = alClient
              DataSource = BewegungInfoDS
              DefaultDrawing = False
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = LiefEdiBtnClick
              TitleButtons = True
              OnTitleBtnClick = JourGridTitleBtnClick
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
              Columns = <
                item
                  Expanded = False
                  FieldName = 'RDATUM'
                  Title.Caption = 'Datum'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VRENUM'
                  Title.Caption = 'Beleg-Nr.'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KUN_NAME1'
                  Title.Caption = 'Name'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MENGE'
                  Title.Caption = 'Menge'
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
                  Title.Caption = 'Rabatt'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'WAEHRUNG'
                  Title.Caption = 'W'
                  Width = 20
                  Visible = True
                end>
            end
          end
          object VKReEdiTab: TTabSheet
            Caption = 'enthalten in unfertigen Rechnungen'
            ImageIndex = 3
          end
        end
        object JourGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 718
          Height = 282
          Align = alClient
          DataSource = EKBestVorDS
          DefaultDrawing = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleButtons = True
          OnTitleBtnClick = JourGridTitleBtnClick
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
          Columns = <
            item
              Expanded = False
              FieldName = 'MATCHCODE'
              Width = 90
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
              FieldName = 'KURZNAME'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VK_MENGE'
              Width = 60
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
              FieldName = 'MENGE_DIV'
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
              FieldName = 'MENGE_BVOR'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MENGE_MIN'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANZ_LIEF'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MIN_EKPREIS'
              Width = 70
              Visible = True
            end>
        end
      end
    end
  end
  object EKBestVorDS: TDataSource
    DataSet = EKBestVorTab
    OnDataChange = EKBestVorDSDataChange
    Left = 224
    Top = 120
  end
  object EKBestVorTab: TOFZQuery
    Connection = DM1.DB1
    AfterOpen = EKBestVorTabAfterScroll
    AfterScroll = EKBestVorTabAfterScroll
    UpdateObject = EKBestVorUpdateSql
    OFModulID = 0
    OFSubModulID = 0
    UseRecordLock = False
    ShowLockErrors = False
    AutoReleaseLock = False
    Params = <>
    SQL.Strings = (
      'select A.REC_ID, A.KURZNAME, A.MATCHCODE, A.ARTNUM,'
      'A.MENGE_VKRE_EDI as VK_MENGE, A.MENGE_AKT,'
      'A.MENGE_VKRE_EDI - A.MENGE_AKT - A.MENGE_BESTELLT -'
      'A.MENGE_EKBEST_EDI + A.MENGE_MIN as MENGE_DIV,'
      'A.MENGE_BESTELLT, A.MENGE_EKBEST_EDI, A.MENGE_BVOR,'
      
        'A.MENGE_MIN, A.INFO,MIN(AP.PREIS) as MIN_EKPREIS,COUNT(AP.ADRESS' +
        '_ID) as ANZ_LIEF'
      'from ARTIKEL A'
      
        'LEFT OUTER JOIN ARTIKEL_PREIS AP ON AP.ARTIKEL_ID=A.REC_ID and A' +
        'P.PREIS_TYP=5'
      
        'where A.ARTIKELTYP="N" and A.MENGE_AKT + A.MENGE_BESTELLT < A.ME' +
        'NGE_VKRE_EDI + A.MENGE_MIN'
      'group BY A.REC_ID')
    Left = 36
    Top = 120
    object EKBestVorTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object EKBestVorTabKURZNAME: TStringField
      DisplayLabel = 'Artikelbezeichnung'
      DisplayWidth = 80
      FieldName = 'KURZNAME'
      Size = 80
    end
    object EKBestVorTabMATCHCODE: TStringField
      DisplayLabel = 'Suchbegriff'
      FieldName = 'MATCHCODE'
    end
    object EKBestVorTabARTNUM: TStringField
      DisplayLabel = 'Artikelnummer'
      FieldName = 'ARTNUM'
    end
    object EKBestVorTabVK_MENGE: TFloatField
      DisplayLabel = 'Menge VK'
      FieldName = 'VK_MENGE'
      Required = True
      DisplayFormat = ',#0.00#;-,#0.00#;-'
    end
    object EKBestVorTabMENGE_AKT: TFloatField
      DisplayLabel = 'Lager'
      FieldName = 'MENGE_AKT'
      Required = True
      DisplayFormat = ',#0.00#;-,#0.00#;-'
    end
    object EKBestVorTabMENGE_DIV: TFloatField
      DisplayLabel = 'fehlt'
      FieldName = 'MENGE_DIV'
      DisplayFormat = ',#0.00#;-,#0.00#;-'
    end
    object EKBestVorTabMENGE_BESTELLT: TFloatField
      DisplayLabel = 'Bestellt'
      FieldName = 'MENGE_BESTELLT'
      Required = True
      DisplayFormat = ',#0.00#;-,#0.00#;-'
    end
    object EKBestVorTabMENGE_EKBEST_EDI: TFloatField
      DisplayLabel = 'Best.-Edi'
      FieldName = 'MENGE_EKBEST_EDI'
      Required = True
      DisplayFormat = ',#0.00#;-,#0.00#;-'
    end
    object EKBestVorTabMENGE_BVOR: TFloatField
      DisplayLabel = 'Vorschlag'
      FieldName = 'MENGE_BVOR'
      Required = True
      DisplayFormat = ',#0.00#;-,#0.00#;-'
    end
    object EKBestVorTabMENGE_MIN: TFloatField
      DisplayLabel = 'Mindestbestand'
      FieldName = 'MENGE_MIN'
      Required = True
      DisplayFormat = ',#0.00#;-,#0.00#;-'
    end
    object EKBestVorTabMIN_EKPREIS: TFloatField
      DisplayLabel = 'kl. EK-Preis'
      FieldName = 'MIN_EKPREIS'
      DisplayFormat = ',#0.00'
    end
    object EKBestVorTabANZ_LIEF: TLargeintField
      DisplayLabel = 'Anz. Lief.'
      FieldName = 'ANZ_LIEF'
      DisplayFormat = '0;-0;-'
    end
    object EKBestVorTabINFO: TMemoField
      FieldName = 'INFO'
      BlobType = ftMemo
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
    Left = 304
    Top = 120
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        ShortCut = 16454
        OnClick = SuchenBtn1Click
      end
      object N3: TMenuItem
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
      GroupIndex = 3
      object Belegnummer1: TMenuItem
        Tag = 1
        Caption = 'Suchbegriff'
        GroupIndex = 5
        RadioItem = True
        OnClick = Preis1Click
      end
      object Datum1: TMenuItem
        Tag = 2
        Caption = 'Artikelnummer'
        Checked = True
        GroupIndex = 5
        RadioItem = True
        OnClick = Preis1Click
      end
      object Name1: TMenuItem
        Tag = 3
        Caption = 'Artikelbezeichnung'
        GroupIndex = 5
        RadioItem = True
        OnClick = Preis1Click
      end
      object Stadium1: TMenuItem
        Tag = 4
        Caption = 'Menge verkauft'
        GroupIndex = 5
        RadioItem = True
        OnClick = Preis1Click
      end
      object Preis1: TMenuItem
        Tag = 5
        Caption = 'Menge Lager'
        GroupIndex = 5
        RadioItem = True
        OnClick = Preis1Click
      end
    end
    object Drucken1: TMenuItem
      Caption = '&Drucken'
      GroupIndex = 4
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 5
      object Filter1: TMenuItem
        Caption = 'Filter'
        ImageIndex = 10
        object alleBestellvorschlaege: TMenuItem
          Tag = 1
          Caption = 'alle Bestellvorschl'#228'ge'
          Checked = True
          GroupIndex = 1
          RadioItem = True
          OnClick = MenuFilterClick
        end
        object nurArtikelInRechnungen: TMenuItem
          Tag = 2
          Caption = 'nur Artikel in Rechnungen'
          GroupIndex = 1
          RadioItem = True
          OnClick = MenuFilterClick
        end
      end
      object N1: TMenuItem
        Caption = '-'
        GroupIndex = 1
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
  object EKBestLiefTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = EKBestLiefTabAfterScroll
    AfterScroll = EKBestLiefTabAfterScroll
    UpdateObject = EKBestLiefUpdateSql
    BeforePost = EKBestLiefTabBeforePost
    AfterPost = EKBestLiefTabAfterPost
    BeforeCancel = EKBestLiefTabAfterPost
    SQL.Strings = (
      'select '
      
        'AP.ARTIKEL_ID, AP.ADRESS_ID, AP.PREIS_TYP, AP.BESTNUM, AP.PREIS,' +
        ' AP.INFO, AP.GEAEND, AP.GEAEND_NAME,  '
      
        'AD.MATCHCODE, AD.KUNDENGRUPPE, AD.KUNNUM2, AD.NAME1, AD.STRASSE,' +
        ' '
      
        'AD.LAND, AD.PLZ, AD.ORT, AD.TELE1, AD.FAX, AD.EMAIL, AD.LIEF_LIE' +
        'FART, AD.LIEF_ZAHLART'
      'from ARTIKEL_PREIS AP, ADRESSEN AD'
      
        'where AP.PREIS_TYP=5 and AP.ADRESS_ID=AD.REC_ID and AP.ARTIKEL_I' +
        'D=:AID'
      'order by PREIS ASC')
    Params = <
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
        Value = '177'
      end>
    Left = 32
    Top = 179
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
        Value = '177'
      end>
    object EKBestLiefTabARTIKEL_ID: TIntegerField
      FieldName = 'ARTIKEL_ID'
    end
    object EKBestLiefTabADRESS_ID: TIntegerField
      FieldName = 'ADRESS_ID'
    end
    object EKBestLiefTabPREIS_TYP: TIntegerField
      FieldName = 'PREIS_TYP'
    end
    object EKBestLiefTabBESTNUM: TStringField
      DisplayLabel = 'Bestellnummer'
      FieldName = 'BESTNUM'
      Size = 50
    end
    object EKBestLiefTabPREIS: TFloatField
      DisplayLabel = 'EK-Preis'
      FieldName = 'PREIS'
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object EKBestLiefTabINFO: TMemoField
      FieldName = 'INFO'
      BlobType = ftMemo
    end
    object EKBestLiefTabGEAEND: TDateTimeField
      DisplayLabel = 'le.'#196'nderung'
      FieldName = 'GEAEND'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object EKBestLiefTabGEAEND_NAME: TStringField
      DisplayLabel = 'ge'#228'ndert von'
      FieldName = 'GEAEND_NAME'
    end
    object EKBestLiefTabMATCHCODE: TStringField
      DisplayLabel = 'Suchbegriff'
      FieldName = 'MATCHCODE'
      Required = True
    end
    object EKBestLiefTabKUNDENGRUPPE: TIntegerField
      DisplayLabel = 'KGR'
      FieldName = 'KUNDENGRUPPE'
      Required = True
    end
    object EKBestLiefTabKUNNUM2: TStringField
      DisplayLabel = 'Kundennr.'
      FieldName = 'KUNNUM2'
    end
    object EKBestLiefTabNAME1: TStringField
      DisplayLabel = 'Name des Lieferanten'
      FieldName = 'NAME1'
      Size = 40
    end
    object EKBestLiefTabSTRASSE: TStringField
      DisplayLabel = 'Stra'#223'e'
      FieldName = 'STRASSE'
      Size = 40
    end
    object EKBestLiefTabLAND: TStringField
      DisplayLabel = 'Land'
      FieldName = 'LAND'
      Size = 5
    end
    object EKBestLiefTabPLZ: TStringField
      FieldName = 'PLZ'
      Size = 10
    end
    object EKBestLiefTabORT: TStringField
      DisplayLabel = 'Ort'
      FieldName = 'ORT'
      Size = 40
    end
    object EKBestLiefTabTELE1: TStringField
      DisplayLabel = 'Telefon'
      FieldName = 'TELE1'
      Size = 100
    end
    object EKBestLiefTabFAX: TStringField
      FieldName = 'FAX'
      Size = 100
    end
    object EKBestLiefTabEMAIL: TStringField
      DisplayLabel = 'eMail'
      FieldName = 'EMAIL'
      Size = 100
    end
    object EKBestLiefTabLIEF_LIEFART: TIntegerField
      FieldName = 'LIEF_LIEFART'
      Required = True
    end
    object EKBestLiefTabLIEF_ZAHLART: TIntegerField
      FieldName = 'LIEF_ZAHLART'
      Required = True
    end
  end
  object EKBestLiefDS: TDataSource
    DataSet = EKBestLiefTab
    OnStateChange = EKBestLiefDSStateChange
    Left = 224
    Top = 179
  end
  object EKBestLiefUpdateSql: TZUpdateSQL
    ModifySQL.Strings = (
      
        'UPDATE ARTIKEL_PREIS SET PREIS=:PREIS, BESTNUM=:BESTNUM,GEAEND=:' +
        'GEAEND,GEAEND_NAME=:GEAEND_NAME '
      'WHERE ARTIKEL_ID=:ARTIKEL_ID AND ADRESS_ID=:ADRESS_ID')
    UseSequenceFieldForRefreshSQL = False
    Left = 128
    Top = 179
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PREIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BESTNUM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GEAEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GEAEND_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ARTIKEL_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ADRESS_ID'
        ParamType = ptUnknown
      end>
  end
  object EKBestVorUpdateSql: TZUpdateSQL
    ModifySQL.Strings = (
      'UPDATE ARTIKEL SET INFO=:INFO WHERE REC_ID=:REC_ID')
    UseSequenceFieldForRefreshSQL = False
    Left = 128
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INFO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REC_ID'
        ParamType = ptUnknown
      end>
  end
  object BewegungInfoTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      
        'select J.VRENUM, J.RDATUM, J.KUN_NAME1,JP.EPREIS,J.WAEHRUNG, JP.' +
        'MENGE, JP.RABATT'
      'from JOURNAL J, JOURNALPOS JP'
      
        'where JP.JOURNAL_ID=J.REC_ID and J.QUELLE=:QUELLE and JP.QUELLE=' +
        ':QUELLE and JP.ARTIKEL_ID=:AID'
      'order by RDATUM DESC')
    Params = <
      item
        DataType = ftInteger
        Name = 'QUELLE'
        ParamType = ptInput
        Value = '13'
      end
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
        Value = '3128'
      end>
    Left = 32
    Top = 235
    ParamData = <
      item
        DataType = ftInteger
        Name = 'QUELLE'
        ParamType = ptInput
        Value = '13'
      end
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
        Value = '3128'
      end>
    object BewegungInfoTabVRENUM: TStringField
      FieldName = 'VRENUM'
    end
    object BewegungInfoTabRDATUM: TDateField
      FieldName = 'RDATUM'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object BewegungInfoTabKUN_NAME1: TStringField
      FieldName = 'KUN_NAME1'
      Size = 40
    end
    object BewegungInfoTabEPREIS: TFloatField
      FieldName = 'EPREIS'
      Required = True
      DisplayFormat = ',#0.00'
    end
    object BewegungInfoTabMENGE: TFloatField
      FieldName = 'MENGE'
      Required = True
      DisplayFormat = ',#0.0#'
    end
    object BewegungInfoTabRABATT: TFloatField
      FieldName = 'RABATT'
      Required = True
      DisplayFormat = '0.0" %"'
    end
    object BewegungInfoTabWAEHRUNG: TStringField
      FieldName = 'WAEHRUNG'
      Size = 5
    end
  end
  object BewegungInfoDS: TDataSource
    DataSet = BewegungInfoTab
    Left = 128
    Top = 235
  end
end
