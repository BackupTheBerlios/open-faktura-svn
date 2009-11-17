object AdressenLiefForm: TAdressenLiefForm
  Left = 297
  Top = 238
  BorderStyle = bsDialog
  Caption = 'Lieferanschrift'
  ClientHeight = 208
  ClientWidth = 421
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = '110700'
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 186
    Width = 421
    Height = 22
    Align = alBottom
    AutoSize = True
    ButtonWidth = 88
    Caption = 'ToolBar1'
    EdgeBorders = []
    Flat = True
    Images = MainForm.ImageList1
    List = True
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    Wrapable = False
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 0
      Width = 240
      Height = 22
      DataSource = KunLiefDS
      Flat = True
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
    end
    object ToolButton1: TToolButton
      Left = 240
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object DetailBtn: TToolButton
      Left = 248
      Top = 0
      AutoSize = True
      Caption = 'Details'
      ImageIndex = 48
      OnClick = AddrGridDblClick
    end
    object ToolButton3: TToolButton
      Left = 311
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object UebernehmenBtn: TToolButton
      Left = 319
      Top = 0
      AutoSize = True
      Caption = #220'bernehmen'
      ImageIndex = 22
      Visible = False
      OnClick = UebernehmenBtnClick
    end
  end
  object PC1: TJvPageControl
    Left = 0
    Top = 0
    Width = 421
    Height = 186
    ActivePage = ListeTS
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    ClientBorderWidth = 3
    object ListeTS: TTabSheet
      Caption = 'ListeTS'
      object AddrGrid: TOFDBGrid
        Left = 0
        Top = 0
        Width = 415
        Height = 157
        Align = alClient
        DataSource = KunLiefDS
        DefaultDrawing = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = AddrGridDblClick
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
            FieldName = 'ANREDE'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME1'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME2'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STRASSE'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LAND'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PLZ'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORT'
            Width = 100
            Visible = True
          end>
      end
    end
    object DetailsTS: TTabSheet
      Caption = 'DetailsTS'
      ImageIndex = 1
      object LiefAnsrGB: TPanel
        Left = 0
        Top = 0
        Width = 415
        Height = 157
        Align = alClient
        BevelOuter = bvLowered
        Color = 14680063
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Label2: TLabel
          Left = 5
          Top = 138
          Width = 77
          Height = 13
          AutoSize = False
          Caption = 'Land/Plz/Ort:'
        end
        object Label1: TLabel
          Left = 5
          Top = 10
          Width = 78
          Height = 13
          AutoSize = False
          Caption = 'Anrede:'
        end
        object Label22: TLabel
          Left = 5
          Top = 32
          Width = 77
          Height = 13
          AutoSize = False
          Caption = 'Name 1:'
          FocusControl = lname1
        end
        object Label21: TLabel
          Left = 5
          Top = 54
          Width = 77
          Height = 13
          AutoSize = False
          Caption = 'Name 2:'
          FocusControl = lname2
        end
        object Label20: TLabel
          Left = 5
          Top = 74
          Width = 77
          Height = 13
          AutoSize = False
          Caption = 'Name 3:'
          FocusControl = lname3
        end
        object Label19: TLabel
          Left = 5
          Top = 95
          Width = 77
          Height = 13
          AutoSize = False
          Caption = 'z.Hd. von:'
          FocusControl = labteilung
        end
        object Label18: TLabel
          Left = 5
          Top = 116
          Width = 77
          Height = 13
          AutoSize = False
          Caption = 'Strasse:'
          FocusControl = lstrasse
        end
        object lplz: TJvDBComboEdit
          Left = 117
          Top = 134
          Width = 75
          Height = 19
          DataField = 'PLZ'
          DataSource = KunLiefDS
          ImageKind = ikEllipsis
          ButtonWidth = 16
          TabOrder = 7
          OnButtonClick = lplzButtonClick
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
        end
        object lort: TJvDBComboEdit
          Tag = 2
          Left = 198
          Top = 134
          Width = 211
          Height = 19
          AutoSelect = False
          DataField = 'ORT'
          DataSource = KunLiefDS
          ImageKind = ikEllipsis
          ButtonWidth = 16
          TabOrder = 8
          OnButtonClick = lplzButtonClick
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
        end
        object lstrasse: TDBEdit
          Tag = 1
          Left = 92
          Top = 112
          Width = 317
          Height = 19
          AutoSelect = False
          DataField = 'STRASSE'
          DataSource = KunLiefDS
          TabOrder = 5
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
        end
        object labteilung: TDBEdit
          Tag = 1
          Left = 92
          Top = 91
          Width = 317
          Height = 19
          AutoSelect = False
          DataField = 'ABTEILUNG'
          DataSource = KunLiefDS
          TabOrder = 4
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
        end
        object lname3: TDBEdit
          Tag = 1
          Left = 92
          Top = 70
          Width = 317
          Height = 19
          AutoSelect = False
          DataField = 'NAME3'
          DataSource = KunLiefDS
          TabOrder = 3
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
        end
        object lname2: TDBEdit
          Tag = 1
          Left = 92
          Top = 49
          Width = 317
          Height = 19
          AutoSelect = False
          DataField = 'NAME2'
          DataSource = KunLiefDS
          TabOrder = 2
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
        end
        object lname1: TDBEdit
          Tag = 1
          Left = 92
          Top = 28
          Width = 317
          Height = 19
          AutoSelect = False
          DataField = 'NAME1'
          DataSource = KunLiefDS
          TabOrder = 1
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
        end
        object lanrede: TVolgaDBEdit
          Tag = 1
          Left = 92
          Top = 6
          Width = 317
          Height = 19
          ButtonWidth = 17
          ComboProps.ComboItems.Strings = (
            'Firma'
            'Verein'
            'Herr'
            'Frau'
            'Familie')
          DataField = 'ANREDE'
          DataSource = KunLiefDS
          DialogStyle = vdsCombo
          TabOrder = 0
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
        end
        object lland: TDBEdit
          Left = 92
          Top = 134
          Width = 22
          Height = 19
          AutoSelect = False
          DataField = 'LAND'
          DataSource = KunLiefDS
          TabOrder = 6
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
        end
      end
    end
  end
  object KunLiefTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = KunLiefTabAfterOpen
    AfterInsert = KunLiefTabAfterInsert
    BeforePost = KunLiefTabBeforePost
    AfterPost = KunLiefTabAfterOpen
    AfterCancel = KunLiefTabAfterOpen
    BeforeDelete = KunLiefTabBeforeDelete
    AfterDelete = KunLiefTabAfterOpen
    SQL.Strings = (
      'select * from ADRESSEN_LIEF'
      'where ADDR_ID=:ADDR_ID'
      'order by NAME1, STRASSE, PLZ, ORT')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ADDR_ID'
        ParamType = ptUnknown
      end>
    Left = 172
    Top = 91
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ADDR_ID'
        ParamType = ptUnknown
      end>
    object KunLiefTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object KunLiefTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
    end
    object KunLiefTabANREDE: TStringField
      DisplayLabel = 'Anrede'
      FieldName = 'ANREDE'
      Size = 40
    end
    object KunLiefTabNAME1: TStringField
      DisplayLabel = 'Name 1'
      FieldName = 'NAME1'
      Required = True
      Size = 40
    end
    object KunLiefTabNAME2: TStringField
      DisplayLabel = 'Name 2'
      FieldName = 'NAME2'
      Size = 40
    end
    object KunLiefTabABTEILUNG: TStringField
      DisplayLabel = 'Abteilung'
      FieldName = 'ABTEILUNG'
      Size = 40
    end
    object KunLiefTabSTRASSE: TStringField
      DisplayLabel = 'Stra'#223'e'
      FieldName = 'STRASSE'
      Required = True
      Size = 40
    end
    object KunLiefTabLAND: TStringField
      DisplayLabel = 'Land'
      FieldName = 'LAND'
      Size = 5
    end
    object KunLiefTabPLZ: TStringField
      FieldName = 'PLZ'
      Required = True
      Size = 10
    end
    object KunLiefTabORT: TStringField
      DisplayLabel = 'Ort'
      FieldName = 'ORT'
      Required = True
      Size = 40
    end
    object KunLiefTabINFO: TMemoField
      FieldName = 'INFO'
      BlobType = ftMemo
    end
    object KunLiefTabNAME3: TStringField
      FieldName = 'NAME3'
      Size = 40
    end
  end
  object KunLiefDS: TDataSource
    DataSet = KunLiefTab
    Left = 252
    Top = 91
  end
end
