object KundenImportForm: TKundenImportForm
  Left = 444
  Top = 209
  HelpContext = 110600
  BorderStyle = bsDialog
  Caption = 'Adressen - Import / Update'
  ClientHeight = 404
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 372
    Width = 537
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object UpdateBtn: TBitBtn
      Left = 344
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Update'
      Enabled = False
      TabOrder = 0
      OnClick = UpdateBtnClick
    end
    object CloseBtn: TBitBtn
      Left = 428
      Top = 4
      Width = 93
      Height = 25
      TabOrder = 1
      Kind = bkClose
    end
    object pb1: TProgressBar
      Left = 7
      Top = 7
      Width = 321
      Height = 19
      Smooth = True
      Step = 100
      TabOrder = 2
    end
  end
  object PC1: TPageControl
    Left = 0
    Top = 0
    Width = 537
    Height = 372
    ActivePage = TabSheet6
    Align = alClient
    HotTrack = True
    TabOrder = 1
    OnChange = PC1Change
    object TabSheet6: TTabSheet
      Caption = 'Datei /Profil'
      ImageIndex = 6
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 31
        Height = 13
        Caption = '&Datei :'
      end
      object KGRLabel: TLabel
        Left = 189
        Top = 40
        Width = 113
        Height = 13
        Caption = 'Default-Kundengruppe :'
      end
      object Label9: TLabel
        Left = 8
        Top = 40
        Width = 71
        Height = 13
        Caption = 'Trennzeichen :'
      end
      object Label10: TLabel
        Left = 353
        Top = 41
        Width = 90
        Height = 13
        Caption = 'Zeile(n) ignorieren :'
      end
      object Bevel1: TBevel
        Left = 1
        Top = 93
        Width = 525
        Height = 2
      end
      object Bevel2: TBevel
        Left = 0
        Top = 204
        Width = 525
        Height = 2
      end
      object Label7: TLabel
        Left = 2
        Top = 208
        Width = 29
        Height = 13
        Caption = 'Profile'
      end
      object FileEdit: TJvFilenameEdit
        Left = 82
        Top = 5
        Width = 439
        Height = 21
        DefaultExt = 'txt'
        Filter = 'Text-Datei|*.txt|Alle Dateien|*.*'
        DialogOptions = [ofHideReadOnly, ofPathMustExist, ofFileMustExist]
        DialogTitle = 'Datei ausw'#228'hlen ...'
        TabOrder = 0
        OnChange = FileEditChange
      end
      object DelimCB: TComboBox
        Left = 82
        Top = 36
        Width = 100
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = FileEditChange
        Items.Strings = (
          'Tab'
          'Komma'
          'Semikolon')
      end
      object LineIgnoreEdit: TSpinEdit
        Left = 454
        Top = 36
        Width = 66
        Height = 22
        MaxValue = 9999
        MinValue = 0
        TabOrder = 2
        Value = 0
        OnChange = FileEditChange
      end
      object ProfGrid: TDBGrid
        Left = 2
        Top = 224
        Width = 385
        Height = 85
        DataSource = ProfDS
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = ProfLoadBtnClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NAME'
            Width = 264
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LAST_CHANGE'
            Width = 83
            Visible = True
          end>
      end
      object ProfLoadBtn: TButton
        Left = 400
        Top = 224
        Width = 121
        Height = 25
        Caption = 'Profil laden'
        TabOrder = 4
        OnClick = ProfLoadBtnClick
      end
      object ProfSaveBtn: TButton
        Left = 400
        Top = 312
        Width = 121
        Height = 25
        Caption = 'Profil speichern'
        TabOrder = 5
        OnClick = ProfSaveBtnClick
      end
      object ProfileEdit: TEdit
        Left = 2
        Top = 314
        Width = 385
        Height = 21
        TabOrder = 6
        OnChange = ProfileEditChange
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Feldzuweisung'
      object SpeedButton1: TSpeedButton
        Left = 166
        Top = 122
        Width = 23
        Height = 22
        Caption = '>'
        OnClick = SpeedButton1Click
      end
      object Label2: TLabel
        Left = 2
        Top = 98
        Width = 93
        Height = 13
        Caption = 'Importierbare Felder'
      end
      object Label3: TLabel
        Left = 204
        Top = 98
        Width = 70
        Height = 13
        Caption = 'Feldzuordnung'
      end
      object SpeedButton2: TSpeedButton
        Left = 166
        Top = 154
        Width = 23
        Height = 22
        Caption = '-'
        OnClick = SpeedButton2Click
      end
      object LB1: TListBox
        Left = 4
        Top = 114
        Width = 153
        Height = 227
        ItemHeight = 13
        TabOrder = 0
        OnDblClick = SpeedButton1Click
      end
      object FeldGrid: TStringGrid
        Left = 204
        Top = 114
        Width = 321
        Height = 227
        ColCount = 2
        DefaultColWidth = 148
        DefaultRowHeight = 18
        TabOrder = 1
        RowHeights = (
          18
          18
          18
          18
          18)
      end
      object ITab: TSortGrid
        Left = 4
        Top = 4
        Width = 521
        Height = 89
        ColCount = 2
        DefaultColWidth = 40
        DefaultRowHeight = 17
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
        TabOrder = 2
        CaseSensitive = False
        AlignmentHorz = taLeftJustify
        AlignmentVert = taTopJustify
        ProportionalScrollBars = True
        ExtendedKeys = False
        SortOnClick = True
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        PrintOptions.Orientation = poPortrait
        PrintOptions.PageTitleMargin = 0
        PrintOptions.PageFooter = 'date|time|page'
        PrintOptions.HeaderSize = 10
        PrintOptions.FooterSize = 7
        PrintOptions.DateFormat = 'd-mmm-yyyy'
        PrintOptions.TimeFormat = 'h:nn'
        PrintOptions.FromRow = 0
        PrintOptions.ToRow = 0
        PrintOptions.BorderStyle = bsNone
        PrintOptions.MarginBottom = 0
        PrintOptions.MarginLeft = 0
        PrintOptions.MarginTop = 0
        PrintOptions.MarginRight = 0
        WordWrap = False
        Color2 = 11796479
        Font2.Charset = DEFAULT_CHARSET
        Font2.Color = clWindowText
        Font2.Height = -11
        Font2.Name = 'MS Sans Serif'
        Font2.Style = []
        ColWidths = (
          40
          137)
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Wertzuweisungen'
      ImageIndex = 3
      object Label6: TLabel
        Left = 4
        Top = 98
        Width = 73
        Height = 13
        Caption = 'Wertzuordnung'
      end
      object WertGrid: TStringGrid
        Left = 4
        Top = 114
        Width = 521
        Height = 227
        ColCount = 2
        DefaultColWidth = 100
        DefaultRowHeight = 18
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        TabOrder = 0
        OnSelectCell = WertGridSelectCell
        ColWidths = (
          129
          371)
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Key-Zuweisungen'
      ImageIndex = 5
      object Label4: TLabel
        Left = 4
        Top = 98
        Width = 93
        Height = 13
        Caption = 'Importierbare Felder'
      end
      object SpeedButton3: TSpeedButton
        Left = 167
        Top = 140
        Width = 23
        Height = 22
        Caption = '>'
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Left = 167
        Top = 172
        Width = 23
        Height = 22
        Caption = '-'
        OnClick = SpeedButton4Click
      end
      object Label5: TLabel
        Left = 204
        Top = 98
        Width = 70
        Height = 13
        Caption = 'Feldzuordnung'
      end
      object LB4: TListBox
        Left = 4
        Top = 114
        Width = 153
        Height = 227
        ItemHeight = 13
        TabOrder = 0
        OnDblClick = SpeedButton3Click
      end
      object KeyGrid: TStringGrid
        Left = 204
        Top = 114
        Width = 321
        Height = 227
        ColCount = 2
        DefaultColWidth = 148
        DefaultRowHeight = 18
        RowCount = 8
        TabOrder = 1
        RowHeights = (
          18
          18
          18
          18
          18
          18
          18
          18)
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Import-Status'
      ImageIndex = 4
      object Label8: TLabel
        Left = 120
        Top = 120
        Width = 289
        Height = 25
        Alignment = taCenter
        AutoSize = False
        Caption = 'Daten werden analysiert, einen Moment bitte ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
      end
      object Sg2: TSortGrid
        Left = 0
        Top = 0
        Width = 529
        Height = 344
        DefaultColWidth = 40
        DefaultRowHeight = 17
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
        TabOrder = 0
        CaseSensitive = False
        AlignmentHorz = taLeftJustify
        AlignmentVert = taTopJustify
        ProportionalScrollBars = True
        ExtendedKeys = False
        SortOnClick = True
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        PrintOptions.Orientation = poPortrait
        PrintOptions.PageTitleMargin = 0
        PrintOptions.PageFooter = 'date|time|page'
        PrintOptions.HeaderSize = 10
        PrintOptions.FooterSize = 7
        PrintOptions.DateFormat = 'd-mmm-yyyy'
        PrintOptions.TimeFormat = 'h:nn'
        PrintOptions.FromRow = 0
        PrintOptions.ToRow = 0
        PrintOptions.BorderStyle = bsNone
        PrintOptions.MarginBottom = 0
        PrintOptions.MarginLeft = 0
        PrintOptions.MarginTop = 0
        PrintOptions.MarginRight = 0
        WordWrap = False
        Color2 = 11796479
        Font2.Charset = DEFAULT_CHARSET
        Font2.Color = clWindowText
        Font2.Height = -11
        Font2.Name = 'MS Sans Serif'
        Font2.Style = []
        ColWidths = (
          40
          138
          99
          95
          103)
      end
      object Animate1: TAnimate
        Left = 128
        Top = 56
        Width = 272
        Height = 60
        CommonAVI = aviCopyFiles
        StopFrame = 34
        Visible = False
      end
    end
    object Logbuch: TTabSheet
      Caption = 'Logbuch'
      ImageIndex = 2
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 529
        Height = 344
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object KunQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select *'
      'from ADRESSEN'
      'LIMIT 0,50')
    Params = <>
    Left = 268
    Top = 289
    object KunQueryMATCHCODE: TStringField
      FieldName = 'MATCHCODE'
    end
    object KunQueryKUNDENGRUPPE: TIntegerField
      FieldName = 'KUNDENGRUPPE'
    end
    object KunQueryKUNNUM1: TStringField
      FieldName = 'KUNNUM1'
    end
    object KunQueryKUNNUM2: TStringField
      FieldName = 'KUNNUM2'
    end
    object KunQueryANREDE: TStringField
      FieldName = 'ANREDE'
      Size = 40
    end
    object KunQueryNAME1: TStringField
      FieldName = 'NAME1'
      Size = 40
    end
    object KunQueryNAME2: TStringField
      FieldName = 'NAME2'
      Size = 40
    end
    object KunQueryNAME3: TStringField
      FieldName = 'NAME3'
      Size = 40
    end
    object KunQueryABTEILUNG: TStringField
      FieldName = 'ABTEILUNG'
      Size = 40
    end
    object KunQueryPLZ: TStringField
      FieldName = 'PLZ'
      Size = 10
    end
    object KunQueryORT: TStringField
      FieldName = 'ORT'
      Size = 40
    end
    object KunQueryLAND: TStringField
      FieldName = 'LAND'
      Size = 5
    end
    object KunQuerySTRASSE: TStringField
      FieldName = 'STRASSE'
      Size = 40
    end
    object KunQueryPOSTFACH: TStringField
      FieldName = 'POSTFACH'
      Size = 40
    end
    object KunQueryPF_PLZ: TStringField
      FieldName = 'PF_PLZ'
      Size = 10
    end
    object KunQueryGRUPPE: TStringField
      FieldName = 'GRUPPE'
      Size = 4
    end
    object KunQueryTELE1: TStringField
      FieldName = 'TELE1'
      Size = 100
    end
    object KunQueryTELE2: TStringField
      FieldName = 'TELE2'
      Size = 100
    end
    object KunQueryFAX: TStringField
      FieldName = 'FAX'
      Size = 100
    end
    object KunQueryFUNK: TStringField
      FieldName = 'FUNK'
      Size = 100
    end
    object KunQueryEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object KunQueryEMAIL2: TStringField
      FieldName = 'EMAIL2'
      Size = 100
    end
    object KunQueryINTERNET: TStringField
      FieldName = 'INTERNET'
      Size = 100
    end
    object KunQueryDIVERSES: TStringField
      FieldName = 'DIVERSES'
      Size = 100
    end
    object KunQueryBRIEFANREDE: TStringField
      FieldName = 'BRIEFANREDE'
      Size = 100
    end
    object KunQueryKTO_INHABER: TStringField
      FieldName = 'KTO_INHABER'
      Size = 40
    end
    object KunQueryBLZ: TStringField
      FieldName = 'BLZ'
      Size = 8
    end
    object KunQueryKTO: TStringField
      FieldName = 'KTO'
      Size = 10
    end
    object KunQueryBANK: TStringField
      FieldName = 'BANK'
      Size = 40
    end
    object KunQueryIBAN: TStringField
      FieldName = 'IBAN'
      Size = 100
    end
    object KunQuerySWIFT: TStringField
      FieldName = 'SWIFT'
      Size = 100
    end
    object KunQueryDEB_NUM: TIntegerField
      FieldName = 'DEB_NUM'
    end
    object KunQueryKRD_NUM: TIntegerField
      FieldName = 'KRD_NUM'
    end
    object KunQueryUST_NUM: TStringField
      FieldName = 'UST_NUM'
      Size = 25
    end
    object KunQuerySHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Visible = False
    end
    object KunQuerySHOP_KUNDE_ID: TIntegerField
      FieldName = 'SHOP_KUNDE_ID'
      Visible = False
    end
    object KunQueryPROVIS_PROZ: TFloatField
      FieldName = 'PROVIS_PROZ'
    end
    object KunQueryKUN_SEIT: TDateField
      FieldName = 'KUN_SEIT'
    end
    object KunQueryKUN_GEBDATUM: TDateField
      FieldName = 'KUN_GEBDATUM'
    end
    object KunQueryVERTRETER_ID: TIntegerField
      FieldName = 'VERTRETER_ID'
      Required = True
    end
    object KunQueryINFO: TMemoField
      FieldName = 'INFO'
      BlobType = ftMemo
    end
    object KunQueryGRABATT: TFloatField
      FieldName = 'GRABATT'
    end
    object KunQueryKUN_KRDLIMIT: TFloatField
      FieldName = 'KUN_KRDLIMIT'
    end
    object KunQueryPR_EBENE: TIntegerField
      FieldName = 'PR_EBENE'
    end
  end
  object ProfTab: TZQuery
    Connection = DM1.DB1
    BeforePost = ProfTabBeforePost
    SQL.Strings = (
      'select * from REGISTRY '
      'where NAME !='#39'DEFAULT'#39' and MAINKEY='#39'MAIN\\IMPORT\\ADRESSEN'#39
      'order by VAL_CHAR')
    Params = <>
    Left = 140
    Top = 288
    object ProfTabMAINKEY: TStringField
      FieldName = 'MAINKEY'
      Required = True
      Size = 255
    end
    object ProfTabNAME: TStringField
      DisplayLabel = 'Beschreibung'
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object ProfTabVAL_BLOB: TMemoField
      FieldName = 'VAL_BLOB'
      BlobType = ftMemo
    end
    object ProfTabLAST_CHANGE: TDateTimeField
      DisplayLabel = 'le. '#196'nderung'
      FieldName = 'LAST_CHANGE'
      DisplayFormat = 'dd.mm.yyyy'
    end
  end
  object ProfDS: TDataSource
    DataSet = ProfTab
    Left = 196
    Top = 288
  end
end
