object ArtikelImportForm: TArtikelImportForm
  Left = 331
  Top = 262
  BorderStyle = bsDialog
  Caption = 'Artikel - Import / Update'
  ClientHeight = 404
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = '110500'
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
    object CloseBtn: TBitBtn
      Left = 436
      Top = 4
      Width = 93
      Height = 25
      TabOrder = 0
      Kind = bkClose
    end
    object pb1: TProgressBar
      Left = 7
      Top = 7
      Width = 300
      Height = 19
      Smooth = True
      Step = 100
      TabOrder = 1
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
      Caption = 'Datei / Profil'
      ImageIndex = 6
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 31
        Height = 13
        Caption = '&Datei :'
      end
      object LiefIDLabel: TLabel
        Left = 197
        Top = 65
        Width = 54
        Height = 13
        Caption = 'LiefIDLabel'
      end
      object Label8: TLabel
        Left = 8
        Top = 40
        Width = 71
        Height = 13
        Caption = 'Trennzeichen :'
      end
      object Label7: TLabel
        Left = 360
        Top = 39
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
      object Label9: TLabel
        Left = 2
        Top = 208
        Width = 29
        Height = 13
        Caption = 'Profile'
      end
      object Bevel2: TBevel
        Left = 0
        Top = 204
        Width = 525
        Height = 2
      end
      object Label12: TLabel
        Left = 8
        Top = 65
        Width = 47
        Height = 13
        Caption = 'Lieferant :'
      end
      object FileEdit: TJvFilenameEdit
        Left = 82
        Top = 5
        Width = 439
        Height = 21
        DefaultExt = 'txt'
        Filter = 'Text-Datei|*.txt|Komma-Separiert|*.csv|Alle Dateien|*.*'
        DialogOptions = [ofHideReadOnly, ofPathMustExist, ofFileMustExist]
        DialogTitle = 'Datei ausw'#228'hlen ...'
        TabOrder = 0
        OnChange = FileEditChange
      end
      object KuNrEdit: TJvComboEdit
        Left = 82
        Top = 62
        Width = 100
        Height = 21
        Hint = 'mit F3 gelangen Sie in die Adressauswahl'
        AutoSelect = False
        ButtonWidth = 16
        ClickKey = 114
        DirectInput = False
        ImageKind = ikEllipsis
        TabOrder = 1
        OnButtonClick = KuNrEditButtonClick
      end
      object DelimCB: TComboBox
        Left = 82
        Top = 36
        Width = 100
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnChange = FileEditChange
        Items.Strings = (
          'Tab'
          'Komma'
          'Semikolon')
      end
      object LineIgnoreEdit: TSpinEdit
        Left = 455
        Top = 36
        Width = 66
        Height = 22
        MaxValue = 9999
        MinValue = 0
        TabOrder = 3
        Value = 0
        OnChange = FileEditChange
      end
      object ProfSaveBtn: TButton
        Left = 400
        Top = 312
        Width = 121
        Height = 25
        Caption = 'Profil speichern'
        TabOrder = 4
        OnClick = ProfSaveBtnClick
      end
      object ProfileEdit: TEdit
        Left = 2
        Top = 314
        Width = 385
        Height = 21
        TabOrder = 5
        OnChange = ProfileEditChange
      end
      object ProfLoadBtn: TButton
        Left = 400
        Top = 224
        Width = 121
        Height = 25
        Caption = 'Profil laden'
        TabOrder = 6
        OnClick = ProfLoadBtnClick
      end
      object ProfGrid: TDBGrid
        Left = 2
        Top = 224
        Width = 385
        Height = 85
        DataSource = ProfDS
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 7
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
      object HKTextCB: TCheckBox
        Left = 196
        Top = 38
        Width = 149
        Height = 17
        Caption = 'Text in Anf'#252'hrungszeichen'
        Checked = True
        State = cbChecked
        TabOrder = 8
        OnClick = FileEditChange
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
        Left = 4
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
        Left = 166
        Top = 122
        Width = 23
        Height = 22
        Caption = '>'
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Left = 166
        Top = 154
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
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
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
      object Label10: TLabel
        Left = 136
        Top = 96
        Width = 241
        Height = 105
        Alignment = taCenter
        AutoSize = False
        Caption = 'Daten werden analysiert,'#13#10'einen Moment bitte ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
      end
      object Label11: TLabel
        Left = 8
        Top = 320
        Width = 38
        Height = 13
        Caption = 'Modus :'
      end
      object ImGrid: TSortGrid
        Left = 3
        Top = 3
        Width = 523
        Height = 302
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
      object ModusCB: TComboBox
        Left = 54
        Top = 316
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'Neuanlage+Update'
          'nur Update'
          'nur Neuanlage')
      end
      object UpdateBtn: TBitBtn
        Left = 409
        Top = 314
        Width = 113
        Height = 25
        Caption = '&Import/Update'
        Enabled = False
        TabOrder = 2
        OnClick = UpdateBtnClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777000000070000007777777777000000070FFFF07777777777000000070FF
          FF07777777777000000070000007777777777000000070FFFF07777777777000
          000070FFFF077777777770000000700000077470000000000000777777774470
          EFEF00000000777777744440FEFE000000007777777744700000000000007000
          0007747777777000000070FFFF07777777777000000070FFFF07777777777000
          0000700000077777777770000000777777777777777770000000777777777777
          777770000000}
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
  object ASQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select *'
      'from ARTIKEL'
      'LIMIT 0,50')
    Params = <>
    Left = 372
    Top = 153
    object ASQueryREC_ID: TIntegerField
      FieldName = 'REC_ID'
      Visible = False
    end
    object ASQueryARTIKELTYP: TStringField
      FieldName = 'ARTIKELTYP'
      Visible = False
      Size = 1
    end
    object ASQueryRABGRP_ID: TStringField
      FieldName = 'RABGRP_ID'
      Size = 10
    end
    object ASQueryWARENGRUPPE: TIntegerField
      DisplayLabel = 'WG'
      FieldName = 'WARENGRUPPE'
    end
    object ASQueryMATCHCODE: TStringField
      DisplayLabel = 'MATCH'
      FieldName = 'MATCHCODE'
    end
    object ASQueryARTNUM: TStringField
      DisplayLabel = 'Art.-Nr.'
      FieldName = 'ARTNUM'
    end
    object ASQueryERSATZ_ARTNUM: TStringField
      DisplayLabel = 'Ersatz-Art.Nr.'
      FieldName = 'ERSATZ_ARTNUM'
    end
    object ASQueryBARCODE: TStringField
      DisplayLabel = 'Barcode'
      FieldName = 'BARCODE'
    end
    object ASQueryKURZNAME: TStringField
      DisplayLabel = 'Kurzname'
      FieldName = 'KURZNAME'
      Size = 80
    end
    object ASQueryLANGNAME: TBlobField
      DisplayLabel = 'Langtext'
      FieldName = 'LANGNAME'
    end
    object ASQueryKAS_NAME: TStringField
      DisplayLabel = 'Kasentext'
      FieldName = 'KAS_NAME'
      Size = 80
    end
    object ASQueryLAENGE: TStringField
      DisplayLabel = 'L'#228'nge'
      FieldName = 'LAENGE'
    end
    object ASQueryGROESSE: TStringField
      DisplayLabel = 'Gr'#246#223'e'
      FieldName = 'GROESSE'
    end
    object ASQueryGEWICHT: TFloatField
      DisplayLabel = 'Gewicht'
      FieldName = 'GEWICHT'
    end
    object ASQueryDIMENSION: TStringField
      DisplayLabel = 'Dimension'
      FieldName = 'DIMENSION'
    end
    object ASQueryINFO: TMemoField
      FieldName = 'INFO'
      BlobType = ftMemo
    end
    object ASQueryEK_PREIS: TFloatField
      DisplayLabel = 'EK-Preis'
      FieldName = 'EK_PREIS'
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object ASQueryVK1: TFloatField
      DisplayLabel = 'VK-Preis 1N'
      DisplayWidth = 12
      FieldName = 'VK1'
      DisplayFormat = ',###,##0.00 "DM"'
      EditFormat = '#0.00'
    end
    object ASQueryVK1B: TFloatField
      FieldName = 'VK1B'
      Visible = False
    end
    object ASQueryVK2: TFloatField
      DisplayLabel = 'VK-Preis 2N'
      DisplayWidth = 12
      FieldName = 'VK2'
      DisplayFormat = ',###,##0.00 "DM"'
      EditFormat = '#0.00'
    end
    object ASQueryVK2B: TFloatField
      FieldName = 'VK2B'
      Visible = False
    end
    object ASQueryVK3: TFloatField
      DisplayLabel = 'VK-Preis 3N'
      DisplayWidth = 12
      FieldName = 'VK3'
      DisplayFormat = ',###,##0.00 "DM"'
      EditFormat = '#0.00'
    end
    object ASQueryVK3B: TFloatField
      FieldName = 'VK3B'
      Visible = False
    end
    object ASQueryVK4: TFloatField
      DisplayLabel = 'VK-Preis 4N'
      DisplayWidth = 12
      FieldName = 'VK4'
      DisplayFormat = ',###,##0.00 "DM"'
      EditFormat = '#0.00'
    end
    object ASQueryVK4B: TFloatField
      FieldName = 'VK4B'
      Visible = False
    end
    object ASQueryVK5: TFloatField
      DisplayLabel = 'VK-Preis 5N'
      FieldName = 'VK5'
      EditFormat = '#0.00'
    end
    object ASQueryVK5B: TFloatField
      FieldName = 'VK5B'
      Visible = False
    end
    object ASQuerySTEUER_CODE: TIntegerField
      DisplayLabel = 'S'
      FieldName = 'STEUER_CODE'
      MaxValue = 3
    end
    object ASQueryPROVIS_PROZ: TFloatField
      FieldName = 'PROVIS_PROZ'
      Required = True
    end
    object ASQueryME_EINHEIT: TStringField
      DisplayLabel = 'ME-Einh.'
      FieldName = 'ME_EINHEIT'
      Size = 10
    end
    object ASQueryPR_EINHEIT: TFloatField
      DisplayLabel = 'PR-Einh.'
      FieldName = 'PR_EINHEIT'
    end
    object ASQueryVPE: TIntegerField
      FieldName = 'VPE'
    end
    object ASQueryMENGE_BVOR: TFloatField
      FieldName = 'MENGE_BVOR'
    end
    object ASQueryMENGE_AKT: TFloatField
      FieldName = 'MENGE_AKT'
      Visible = False
    end
    object ASQueryMENGE_MIN: TFloatField
      FieldName = 'MENGE_MIN'
      Visible = False
    end
    object ASQueryINVENTUR_WERT: TFloatField
      FieldName = 'INVENTUR_WERT'
      Visible = False
    end
    object ASQueryAUFW_KTO: TIntegerField
      FieldName = 'AUFW_KTO'
      Visible = False
    end
    object ASQueryERLOES_KTO: TIntegerField
      FieldName = 'ERLOES_KTO'
      Visible = False
    end
    object ASQueryHERKUNFTSLAND: TStringField
      DisplayLabel = 'Herk.-Land'
      FieldName = 'HERKUNFTSLAND'
      Size = 2
    end
    object ASQueryHERSTELLER_ID: TIntegerField
      FieldName = 'HERSTELLER_ID'
    end
    object ASQueryHERSTELLER_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'HERSTELLER_NAME'
      Size = 10
      Calculated = True
    end
    object ASQueryHERST_ARTNUM: TStringField
      FieldName = 'HERST_ARTNUM'
      Size = 100
    end
    object ASQueryLAGERORT: TStringField
      DisplayLabel = 'Lagerort'
      FieldName = 'LAGERORT'
    end
    object ASQuerySHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
    end
    object ASQuerySHOP_ARTIKEL_ID: TIntegerField
      FieldName = 'SHOP_ARTIKEL_ID'
      Visible = False
    end
    object ASQuerySHOP_PREIS_LISTE: TFloatField
      FieldName = 'SHOP_PREIS_LISTE'
    end
    object ASQuerySHOP_CHANGE_DATE: TDateTimeField
      FieldName = 'SHOP_CHANGE_DATE'
      Visible = False
    end
    object ASQuerySHOP_CHANGE_FLAG: TIntegerField
      FieldName = 'SHOP_CHANGE_FLAG'
      Required = True
    end
    object ASQuerySHOP_LANGTEXT: TMemoField
      FieldName = 'SHOP_LANGTEXT'
      BlobType = ftMemo
    end
    object ASQuerySHOP_DATENBLATT: TStringField
      FieldName = 'SHOP_DATENBLATT'
      Size = 100
    end
    object ASQuerySHOP_KATALOG: TStringField
      FieldName = 'SHOP_KATALOG'
      Size = 100
    end
    object ASQuerySHOP_ZEICHNUNG: TStringField
      FieldName = 'SHOP_ZEICHNUNG'
      Size = 100
    end
    object ASQuerySHOP_HANDBUCH: TStringField
      FieldName = 'SHOP_HANDBUCH'
      Size = 100
    end
    object ASQuerySHOP_IMAGE: TStringField
      FieldName = 'SHOP_IMAGE'
      Size = 100
    end
    object ASQuerySHOP_IMAGE_MED: TStringField
      FieldName = 'SHOP_IMAGE_MED'
      Size = 100
    end
    object ASQuerySHOP_IMAGE_LARGE: TStringField
      FieldName = 'SHOP_IMAGE_LARGE'
      Size = 100
    end
    object ASQueryNO_EK_FLAG: TBooleanField
      FieldName = 'NO_EK_FLAG'
      Required = True
      Visible = False
    end
    object ASQuerySN_FLAG: TBooleanField
      FieldName = 'SN_FLAG'
      Required = True
    end
    object ASQueryUSERFELD_01: TStringField
      FieldName = 'USERFELD_01'
      Size = 255
    end
    object ASQueryUSERFELD_02: TStringField
      FieldName = 'USERFELD_02'
      Size = 255
    end
    object ASQueryUSERFELD_03: TStringField
      FieldName = 'USERFELD_03'
      Size = 255
    end
    object ASQueryUSERFELD_04: TStringField
      FieldName = 'USERFELD_04'
      Size = 255
    end
    object ASQueryUSERFELD_05: TStringField
      FieldName = 'USERFELD_05'
      Size = 255
    end
    object ASQueryUSERFELD_06: TStringField
      FieldName = 'USERFELD_06'
      Size = 255
    end
    object ASQueryUSERFELD_07: TStringField
      FieldName = 'USERFELD_07'
      Size = 255
    end
    object ASQueryUSERFELD_08: TStringField
      FieldName = 'USERFELD_08'
      Size = 255
    end
    object ASQueryUSERFELD_09: TStringField
      FieldName = 'USERFELD_09'
      Size = 255
    end
    object ASQueryUSERFELD_10: TStringField
      FieldName = 'USERFELD_10'
      Size = 255
    end
    object ASQueryKATEGORIE_ID: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'KATEGORIE_ID'
      Calculated = True
    end
    object ASQueryKATEGORIE_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'KATEGORIE_NAME'
      Size = 100
      Calculated = True
    end
    object ASQueryERSTELLT: TDateField
      FieldName = 'ERSTELLT'
      Visible = False
    end
    object ASQueryERST_NAME: TStringField
      FieldName = 'ERST_NAME'
      Visible = False
    end
    object ASQueryGEAEND: TDateField
      FieldName = 'GEAEND'
      Visible = False
    end
    object ASQueryGEAEND_NAME: TStringField
      FieldName = 'GEAEND_NAME'
      Visible = False
    end
  end
  object ProfTab: TZQuery
    Connection = DM1.DB1
    BeforePost = ProfTabBeforePost
    SQL.Strings = (
      'select * from REGISTRY '
      'where NAME !='#39'DEFAULT'#39' and MAINKEY='#39'MAIN\\IMPORT\\ARTIKEL'#39
      'order by VAL_CHAR')
    Params = <>
    Left = 428
    Top = 152
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
    Left = 484
    Top = 152
  end
  object KatTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select SHOP_ID,ID,NAME from ARTIKEL_KAT')
    Params = <>
    Left = 372
    Top = 208
    object KatTabSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Required = True
    end
    object KatTabID: TIntegerField
      FieldName = 'ID'
    end
    object KatTabNAME: TStringField
      FieldName = 'NAME'
      Size = 250
    end
  end
end
