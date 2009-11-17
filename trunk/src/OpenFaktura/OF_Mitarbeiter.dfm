object MitarbeiterForm: TMitarbeiterForm
  Left = 308
  Top = 258
  Width = 724
  Height = 508
  Caption = 'Mitarbeiter'
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
        Width = 99
        Height = 23
        Align = alLeft
        Caption = '  Mitarbeiter ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object ButtonPan: TPanel
        Left = 457
        Top = 0
        Width = 255
        Height = 23
        Align = alRight
        AutoSize = True
        BevelOuter = bvNone
        Color = clBtnShadow
        TabOrder = 0
        object AuswahlBtn: TJvSpeedButton
          Tag = 2
          Left = 70
          Top = 0
          Width = 65
          Height = 22
          Caption = 'Aus&wahl'
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
          OnClick = AnsichtAuswahlClick
        end
        object AllgBtn: TJvSpeedButton
          Tag = 1
          Left = 0
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
          OnClick = AnsichtAuswahlClick
        end
        object PositionenBtn: TJvSpeedButton
          Tag = 4
          Left = 136
          Top = 0
          Width = 73
          Height = 22
          Caption = 'P&ositionen'
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
          OnClick = AnsichtAuswahlClick
        end
        object ListeBtn: TJvSpeedButton
          Tag = 4
          Left = 206
          Top = 0
          Width = 49
          Height = 22
          Caption = '&Liste'
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
          OnClick = AnsichtAuswahlClick
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
        DataSource = Mita_DS
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
        Hint = 
          'durch Eingabe des Jokerzeichens % vor dem Suchtext '#13#10'kann auch n' +
          'ach Text im Suchfeld gesucht werden, '#13#10'der nicht am Anfang des F' +
          'eldes steht.'
        AutoSize = False
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnChange = SuchBegChange
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
      ClientBorderWidth = 0
      object Allg_TS: TTabSheet
        Caption = 'Allg_TS'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 716
          Height = 180
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object KommunikationGB: TOFGroupBox
            Left = 358
            Top = 0
            Width = 358
            Height = 180
            Align = alClient
            Caption = 'Kommunikation'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 0
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
            object MaFunkEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 66
              Width = 266
              Height = 19
              DataField = 'FUNK'
              DataSource = Mita_DS
              TabOrder = 2
            end
            object MaFaxEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 45
              Width = 266
              Height = 19
              DataField = 'FAX'
              DataSource = Mita_DS
              TabOrder = 1
            end
            object MaTelEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 24
              Width = 266
              Height = 19
              DataField = 'TELEFON'
              DataSource = Mita_DS
              TabOrder = 0
            end
            object MaEmailEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 87
              Width = 266
              Height = 19
              DataField = 'EMAIL'
              DataSource = Mita_DS
              TabOrder = 3
            end
          end
          object AllgemeinGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 358
            Height = 180
            Align = alLeft
            Caption = 'Allgemein'
            Color = 14680063
            Ctl3D = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 1
            object Label56: TLabel
              Left = 5
              Top = 27
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Mitarbeiter-Nr..:'
            end
            object Label1: TLabel
              Left = 5
              Top = 48
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Login-Name.:'
            end
            object Label2: TLabel
              Left = 5
              Top = 69
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Anzeige-Name :'
            end
            object Label3: TLabel
              Left = 5
              Top = 94
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Name :'
            end
            object Label4: TLabel
              Left = 5
              Top = 115
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Vorname :'
            end
            object Label5: TLabel
              Left = 5
              Top = 136
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Stra'#223'e :'
            end
            object Label6: TLabel
              Left = 5
              Top = 157
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Wohnort :'
            end
            object MaNumEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 24
              Width = 266
              Height = 19
              DataField = 'MA_NUMMER'
              DataSource = Mita_DS
              TabOrder = 0
            end
            object MaLoginEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 45
              Width = 266
              Height = 19
              DataField = 'LOGIN_NAME'
              DataSource = Mita_DS
              TabOrder = 1
            end
            object MaAnzeigeEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 66
              Width = 266
              Height = 19
              DataField = 'ANZEIGE_NAME'
              DataSource = Mita_DS
              TabOrder = 2
            end
            object MaNameEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 91
              Width = 266
              Height = 19
              DataField = 'NAME'
              DataSource = Mita_DS
              TabOrder = 3
            end
            object MaVNameEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 112
              Width = 266
              Height = 19
              DataField = 'VNAME'
              DataSource = Mita_DS
              TabOrder = 4
            end
            object MaStrasseEdi: TDBEdit
              Tag = 1
              Left = 84
              Top = 133
              Width = 266
              Height = 19
              DataField = 'STRASSE'
              DataSource = Mita_DS
              TabOrder = 5
            end
            object MaOrtEdi: TDBEdit
              Tag = 1
              Left = 144
              Top = 154
              Width = 206
              Height = 19
              DataField = 'ORT'
              DataSource = Mita_DS
              TabOrder = 7
            end
            object MaPLZEdi: TDBEdit
              Left = 84
              Top = 154
              Width = 57
              Height = 19
              DataField = 'PLZ'
              DataSource = Mita_DS
              TabOrder = 6
            end
          end
        end
        object BemerkungGB: TOFGroupBox
          Left = 0
          Top = 180
          Width = 716
          Height = 206
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
            Width = 700
            Height = 177
            Align = alClient
            Ctl3D = False
            DataField = 'BEMERKUNG'
            DataSource = Mita_DS
            ParentCtl3D = False
            TabOrder = 0
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        ImageIndex = 2
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 3
      end
      object Such_TS: TTabSheet
        Caption = 'Such_TS'
        ImageIndex = 1
        object SuchGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 716
          Height = 386
          Align = alClient
          DataSource = Mita_DS
          DefaultDrawing = False
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
          DisplayMemo = False
          RowColor1 = 14680063
          RowColor2 = clWindow
          ShowTitleEllipsis = True
          DefaultRowHeight = 17
          EditColor = clBlack
          Columns = <
            item
              Expanded = False
              FieldName = 'MA_NUMMER'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOGIN_NAME'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANZEIGE_NAME'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VNAME'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STRASSE'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LAND'
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLZ'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORT'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFON'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAX'
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
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GEBDATUM'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BESCHAEFTIGUNGSART'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BESCHAEFTIGUNGSGRAD'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'JAHRESURLAUB'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GUELTIG_VON'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GUELTIG_BIS'
              Width = 70
              Visible = True
            end>
        end
      end
    end
  end
  object Mita_Tab: TOFZQuery
    Connection = DM1.DB1
    AfterOpen = Mita_TabAfterScroll
    AfterScroll = Mita_TabAfterScroll
    BeforeInsert = Mita_TabBeforeInsert
    BeforePost = Mita_TabBeforePost
    AfterPost = Mita_TabAfterPost
    BeforeDelete = Mita_TabBeforeDelete
    AfterDelete = Mita_TabAfterScroll
    OFSecurity = DM1.CaoSecurity
    OFModulID = 1040
    OFSubModulID = 0
    UseRecordLock = False
    ShowLockErrors = False
    AutoReleaseLock = False
    Params = <>
    Sql.Strings = (
      'select * from MITARBEITER '
      'order by NAME, VNAME')
    Left = 288
    Top = 344
    object Mita_TabMA_ID: TLargeintField
      FieldName = 'MA_ID'
      Required = True
    end
    object Mita_TabLOGIN_NAME: TStringField
      DisplayLabel = 'Login-Name'
      FieldName = 'LOGIN_NAME'
      Size = 50
    end
    object Mita_TabANZEIGE_NAME: TStringField
      DisplayLabel = 'Anzeige-Name'
      FieldName = 'ANZEIGE_NAME'
      Size = 50
    end
    object Mita_TabMA_NUMMER: TStringField
      DisplayLabel = 'MA-Nr.'
      FieldName = 'MA_NUMMER'
      Size = 10
    end
    object Mita_TabNAME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'NAME'
      Size = 100
    end
    object Mita_TabVNAME: TStringField
      DisplayLabel = 'Vorname'
      FieldName = 'VNAME'
      Size = 100
    end
    object Mita_TabANREDE: TStringField
      DisplayLabel = 'Anrede'
      FieldName = 'ANREDE'
      Size = 15
    end
    object Mita_TabTITEL: TStringField
      DisplayLabel = 'Titel'
      FieldName = 'TITEL'
      Size = 15
    end
    object Mita_TabZUSATZ: TStringField
      DisplayLabel = 'Zusatz'
      FieldName = 'ZUSATZ'
      Size = 40
    end
    object Mita_TabZUSATZ2: TStringField
      DisplayLabel = 'Zusatz 2'
      FieldName = 'ZUSATZ2'
      Size = 40
    end
    object Mita_TabZUHAENDEN: TStringField
      DisplayLabel = 'zu H'#228'nden'
      FieldName = 'ZUHAENDEN'
      Size = 40
    end
    object Mita_TabSTRASSE: TStringField
      DisplayLabel = 'Stra'#223'e'
      FieldName = 'STRASSE'
      Size = 40
    end
    object Mita_TabLAND: TStringField
      DisplayLabel = 'Land'
      FieldName = 'LAND'
      Size = 5
    end
    object Mita_TabPLZ: TStringField
      FieldName = 'PLZ'
      Size = 10
    end
    object Mita_TabORT: TStringField
      DisplayLabel = 'Ort'
      FieldName = 'ORT'
      Size = 40
    end
    object Mita_TabTELEFON: TStringField
      DisplayLabel = 'Telefon'
      FieldName = 'TELEFON'
      Size = 100
    end
    object Mita_TabFAX: TStringField
      DisplayLabel = 'Telefax'
      FieldName = 'FAX'
      Size = 100
    end
    object Mita_TabFUNK: TStringField
      DisplayLabel = 'Mobilfunk'
      FieldName = 'FUNK'
      Size = 100
    end
    object Mita_TabEMAIL: TStringField
      DisplayLabel = 'eMail'
      FieldName = 'EMAIL'
      Size = 100
    end
    object Mita_TabINTERNET: TStringField
      DisplayLabel = 'Internet'
      FieldName = 'INTERNET'
      Size = 100
    end
    object Mita_TabSPRACH_ID: TIntegerField
      FieldName = 'SPRACH_ID'
    end
    object Mita_TabBESCHAEFTIGUNGSART: TIntegerField
      DisplayLabel = 'Be.-Art'
      DisplayWidth = 4
      FieldName = 'BESCHAEFTIGUNGSART'
    end
    object Mita_TabBESCHAEFTIGUNGSGRAD: TIntegerField
      DisplayLabel = 'Be.-Grad'
      DisplayWidth = 4
      FieldName = 'BESCHAEFTIGUNGSGRAD'
    end
    object Mita_TabJAHRESURLAUB: TFloatField
      DisplayLabel = 'Urlaub / Jahr'
      DisplayWidth = 4
      FieldName = 'JAHRESURLAUB'
    end
    object Mita_TabGUELTIG_VON: TDateTimeField
      DisplayLabel = 'von'
      DisplayWidth = 6
      FieldName = 'GUELTIG_VON'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object Mita_TabGUELTIG_BIS: TDateTimeField
      DisplayLabel = 'bis'
      DisplayWidth = 6
      FieldName = 'GUELTIG_BIS'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object Mita_TabGEBDATUM: TDateTimeField
      DisplayLabel = 'Geb.-Datum'
      DisplayWidth = 6
      FieldName = 'GEBDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object Mita_TabGESCHLECHT: TStringField
      FieldName = 'GESCHLECHT'
      Required = True
      Size = 1
    end
    object Mita_TabFAMSTAND: TIntegerField
      FieldName = 'FAMSTAND'
    end
    object Mita_TabBANK: TStringField
      FieldName = 'BANK'
      Size = 40
    end
    object Mita_TabBLZ: TStringField
      FieldName = 'BLZ'
      Size = 10
    end
    object Mita_TabKTO: TStringField
      FieldName = 'KTO'
    end
    object Mita_TabBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      BlobType = ftMemo
    end
    object Mita_TabERSTELLT: TDateTimeField
      FieldName = 'ERSTELLT'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object Mita_TabERSTELLT_NAME: TStringField
      FieldName = 'ERSTELLT_NAME'
    end
    object Mita_TabGEAEND: TDateTimeField
      FieldName = 'GEAEND'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object Mita_TabGEAEND_NAME: TStringField
      FieldName = 'GEAEND_NAME'
    end
    object Mita_TabUSER_PASSWORD: TStringField
      FieldName = 'USER_PASSWORD'
      Size = 32
    end
  end
  object Mita_DS: TDataSource
    DataSet = Mita_Tab
    Left = 352
    Top = 344
  end
  object MainMenu1: TJvMainMenu
    Images = MainForm.ImageList1
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 416
    Top = 347
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
      object MANummer: TMenuItem
        Tag = 3
        Caption = '&Mitarbeiternummer'
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
        OnClick = AnsichtAuswahlClick
      end
      object Provision1: TMenuItem
        Tag = 2
        Caption = 'Provision'
        GroupIndex = 4
        RadioItem = True
        Visible = False
        OnClick = AnsichtAuswahlClick
      end
      object Ansprechpartner1: TMenuItem
        Tag = 3
        Caption = 'Ansprechpartner'
        GroupIndex = 4
        RadioItem = True
        Visible = False
        OnClick = AnsichtAuswahlClick
      end
      object Liste1: TMenuItem
        Tag = 4
        Caption = 'Liste'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 118
        OnClick = AnsichtAuswahlClick
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
    end
  end
end
