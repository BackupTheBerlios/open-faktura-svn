object SerNumSuchForm: TSerNumSuchForm
  Left = 314
  Top = 281
  BorderStyle = bsDialog
  Caption = 'Seriennummern suchen'
  ClientHeight = 327
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 15
    Width = 137
    Height = 13
    Caption = 'zu suchende Seriennummer :'
  end
  object NotFoundPan: TPanel
    Left = 8
    Top = 40
    Width = 433
    Height = 281
    BevelInner = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object NotFoundLab: TLabel
      Left = 88
      Top = 80
      Width = 270
      Height = 105
      Alignment = taCenter
      AutoSize = False
      Caption = 'Zu Ihrem Suchbegriff '#13#10'wurden keine Seiennummern gefunden.'
      Layout = tlCenter
      WordWrap = True
    end
  end
  object SNEdi: TEdit
    Left = 152
    Top = 12
    Width = 289
    Height = 21
    TabOrder = 0
    OnChange = SNEdiChange
    OnKeyPress = SNEdiKeyPress
  end
  object PC1: TPageControl
    Left = 8
    Top = 40
    Width = 433
    Height = 281
    ActivePage = ArtikelTS
    TabOrder = 4
    Visible = False
    object ArtikelTS: TTabSheet
      Caption = 'Artikel'
      object ArtikelGrid: TOFDBGrid
        Left = 0
        Top = 0
        Width = 425
        Height = 253
        Align = alClient
        DataSource = SNSucheArtDS
        DefaultDrawing = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = ArtikelGridDblClick
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 24
        TitleRowHeight = 24
        RowColor1 = clWindow
        RowColor2 = 14869218
        DefaultRowHeight = 17
        EditColor = clWindow
        Columns = <
          item
            Expanded = False
            FieldName = 'MATCHCODE'
            Title.Caption = 'Artikel-Suchbegr.'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARTNUM'
            Title.Caption = 'Artikelnummer'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KURZNAME'
            Title.Caption = 'Artikel-Bezeichnung'
            Width = 208
            Visible = True
          end>
      end
    end
    object SerNumTS: TTabSheet
      Caption = 'Seriennummern'
      ImageIndex = 1
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 84
        Height = 13
        Caption = 'Artikel-Suchbegr.:'
      end
      object DBText1: TDBText
        Left = 104
        Top = 8
        Width = 129
        Height = 17
        DataField = 'MATCHCODE'
        DataSource = SNSucheArtDS
      end
      object DBText2: TDBText
        Left = 104
        Top = 29
        Width = 313
        Height = 27
        DataField = 'KURZNAME'
        DataSource = SNSucheArtDS
        WordWrap = True
      end
      object DBText3: TDBText
        Left = 320
        Top = 8
        Width = 105
        Height = 17
        DataField = 'ARTNUM'
        DataSource = SNSucheArtDS
      end
      object Label3: TLabel
        Left = 248
        Top = 8
        Width = 69
        Height = 13
        Caption = 'Artikelnummer:'
      end
      object Label4: TLabel
        Left = 8
        Top = 28
        Width = 56
        Height = 13
        Caption = 'Artikel-Bez.:'
      end
      object SerNoGrid: TOFDBGrid
        Left = 0
        Top = 48
        Width = 425
        Height = 205
        DataSource = SNSucheDS
        DefaultDrawing = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = SerNoGridDblClick
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 24
        TitleRowHeight = 24
        RowColor1 = clWindow
        RowColor2 = 14869218
        DefaultRowHeight = 17
        EditColor = clWindow
        Columns = <
          item
            Expanded = False
            FieldName = 'SERNUMMER'
            Title.Caption = 'Seriennummer(n)'
            Width = 390
            Visible = True
          end>
      end
    end
    object SerNumDetailsTS: TTabSheet
      Caption = 'Details'
      ImageIndex = 2
      object Label5: TLabel
        Left = 8
        Top = 8
        Width = 84
        Height = 13
        Caption = 'Artikel-Suchbegr.:'
      end
      object Label6: TLabel
        Left = 8
        Top = 28
        Width = 56
        Height = 13
        Caption = 'Artikel-Bez.:'
      end
      object DBText4: TDBText
        Left = 104
        Top = 29
        Width = 313
        Height = 27
        DataField = 'KURZNAME'
        DataSource = SNSucheArtDS
        WordWrap = True
      end
      object DBText5: TDBText
        Left = 104
        Top = 8
        Width = 129
        Height = 17
        DataField = 'MATCHCODE'
        DataSource = SNSucheArtDS
      end
      object Label7: TLabel
        Left = 248
        Top = 8
        Width = 69
        Height = 13
        Caption = 'Artikelnummer:'
      end
      object DBText6: TDBText
        Left = 320
        Top = 8
        Width = 97
        Height = 17
        DataField = 'ARTNUM'
        DataSource = SNSucheArtDS
      end
      object Bevel1: TBevel
        Left = 8
        Top = 59
        Width = 409
        Height = 3
        Shape = bsTopLine
      end
      object Label8: TLabel
        Left = 8
        Top = 68
        Width = 76
        Height = 13
        Caption = 'Seriennnummer:'
      end
      object DBText7: TDBText
        Left = 104
        Top = 68
        Width = 313
        Height = 17
        DataField = 'SERNUMMER'
        DataSource = SNSucheDS
      end
      object Bevel2: TBevel
        Left = 8
        Top = 90
        Width = 409
        Height = 3
        Shape = bsTopLine
      end
      object HistGrid: TOFDBGrid
        Left = 7
        Top = 96
        Width = 412
        Height = 153
        DataSource = HistDS
        DefaultDrawing = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = SerNoGridDblClick
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 24
        TitleRowHeight = 24
        RowColor1 = clWindow
        RowColor2 = 14869218
        DefaultRowHeight = 17
        EditColor = clWindow
        Columns = <
          item
            Expanded = False
            FieldName = 'CALC_QUELLE'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BELEGNUM'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BELEGDATUM'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CALC_NAME'
            Width = 250
            Visible = True
          end>
      end
    end
  end
  object CloseBtn: TBitBtn
    Left = 448
    Top = 296
    Width = 113
    Height = 25
    Cancel = True
    Caption = 'S&chlie'#223'en'
    ModalResult = 1
    TabOrder = 2
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object HelpBtn: TBitBtn
    Left = 448
    Top = 256
    Width = 113
    Height = 25
    Enabled = False
    TabOrder = 3
    Kind = bkHelp
  end
  object SuchBtn: TBitBtn
    Left = 448
    Top = 9
    Width = 113
    Height = 25
    Caption = '&Suchen'
    Default = True
    Enabled = False
    TabOrder = 1
    OnClick = SuchBtnClick
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
  end
  object SNSucheArtTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = SNSucheArtTabAfterScroll
    AfterScroll = SNSucheArtTabAfterScroll
    SQL.Strings = (
      'select '
      '  A.REC_ID, A.MATCHCODE, A.ARTNUM, A.KURZNAME'
      'from '
      '  ARTIKEL A, ARTIKEL_SERNUM SN'
      'where '
      '  SN.ARTIKEL_ID=A.REC_ID and SN.SERNUMMER like :SN'
      'group by '
      '  A.REC_ID')
    Params = <
      item
        DataType = ftString
        Name = 'SN'
        ParamType = ptInput
        Value = '%12%'
      end>
    Left = 464
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'SN'
        ParamType = ptInput
        Value = '%12%'
      end>
    object SNSucheArtTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object SNSucheArtTabMATCHCODE: TStringField
      FieldName = 'MATCHCODE'
    end
    object SNSucheArtTabARTNUM: TStringField
      FieldName = 'ARTNUM'
    end
    object SNSucheArtTabKURZNAME: TStringField
      FieldName = 'KURZNAME'
      Size = 80
    end
  end
  object SNSucheArtDS: TDataSource
    DataSet = SNSucheArtTab
    Left = 528
    Top = 56
  end
  object SNSucheDS: TDataSource
    DataSet = SNSucheTab
    Left = 528
    Top = 104
  end
  object SNSucheTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = SNSucheTabAfterOpen
    AfterScroll = SNSucheTabAfterOpen
    SQL.Strings = (
      'select SN.* '
      '/*'
      'J1.RDATUM as EK_DATUM, J1.KUN_NAME1 as LIEFERANT,'
      'J2.LDATUM as LS_DATUM, J2.KUN_NAME1 as LS_KUNDE,'
      'J3.RDATUM as VK_DATUM, J3.KUN_NAME1 as VK_KUNDE*/'
      'from ARTIKEL A, ARTIKEL_SERNUM SN'
      '/*'
      'left outer JOIN JOURNAL J1 on J1.REC_ID=SN.EK_JOURNAL_ID'
      'left outer JOIN JOURNAL J2 on J2.REC_ID=SN.LS_JOURNAL_ID'
      'left outer JOIN JOURNAL J3 on J3.REC_ID=SN.VK_JOURNAL_ID */'
      'where SN.ARTIKEL_ID=A.REC_ID and SN.SERNUMMER like :SN'
      'and A.REC_ID=:AID')
    Params = <
      item
        DataType = ftString
        Name = 'SN'
        ParamType = ptInput
        Value = '%12%'
      end
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
        Value = '6788'
      end>
    Left = 464
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'SN'
        ParamType = ptInput
        Value = '%12%'
      end
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
        Value = '6788'
      end>
    object SNSucheTabSERNUMMER: TStringField
      FieldName = 'SERNUMMER'
      Size = 255
    end
    object SNSucheTabSNUM_ID: TIntegerField
      FieldName = 'SNUM_ID'
    end
  end
  object HistTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = HistTabCalcFields
    SQL.Strings = (
      'select '
      ' J.QUELLE, '
      ' IF(J.QUELLE in (2,12),J.VLSNUM,J.VRENUM)as BELEGNUM,'
      ' IF(J.QUELLE in (2,12),J.LDATUM,J.RDATUM)as BELEGDATUM, '
      
        ' J.KUN_ANREDE, J.KUN_NAME1, J.KUN_NAME2, J.KUN_NAME3, J.KUN_STRA' +
        'SSE, J.KUN_LAND, J.KUN_PLZ, J.KUN_ORT'
      'from '
      ' JOURNALPOS_SERNUM JPS, '
      ' JOURNALPOS JP, '
      ' JOURNAL J'
      'where '
      ' JPS.JOURNALPOS_ID=JP.REC_ID and '
      ' JPS.JOURNAL_ID=J.REC_ID and'
      ' JPS.ARTIKEL_ID=:AID and'
      ' JPS.SNUM_ID=:SID'
      'order by BELEGDATUM ASC, J.QUELLE DESC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'AID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SID'
        ParamType = ptUnknown
      end>
    Left = 464
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SID'
        ParamType = ptUnknown
      end>
    object HistTabQUELLE: TIntegerField
      FieldName = 'QUELLE'
    end
    object HistTabBELEGNUM: TStringField
      DisplayLabel = 'Beleg-Nr.'
      FieldName = 'BELEGNUM'
    end
    object HistTabBELEGDATUM: TStringField
      DisplayLabel = 'Datum'
      FieldName = 'BELEGDATUM'
      Size = 10
    end
    object HistTabKUN_ANREDE: TStringField
      FieldName = 'KUN_ANREDE'
      Size = 40
    end
    object HistTabKUN_NAME1: TStringField
      FieldName = 'KUN_NAME1'
      Size = 40
    end
    object HistTabKUN_NAME2: TStringField
      FieldName = 'KUN_NAME2'
      Size = 40
    end
    object HistTabKUN_NAME3: TStringField
      FieldName = 'KUN_NAME3'
      Size = 40
    end
    object HistTabKUN_STRASSE: TStringField
      FieldName = 'KUN_STRASSE'
      Size = 40
    end
    object HistTabKUN_LAND: TStringField
      FieldName = 'KUN_LAND'
      Size = 5
    end
    object HistTabKUN_PLZ: TStringField
      FieldName = 'KUN_PLZ'
      Size = 10
    end
    object HistTabKUN_ORT: TStringField
      FieldName = 'KUN_ORT'
      Size = 40
    end
    object HistTabCALC_NAME: TStringField
      DisplayLabel = 'Kunde / Lieferant'
      FieldKind = fkCalculated
      FieldName = 'CALC_NAME'
      Size = 255
      Calculated = True
    end
    object HistTabCALC_QUELLE: TStringField
      DisplayLabel = 'Quelle'
      FieldKind = fkCalculated
      FieldName = 'CALC_QUELLE'
      Size = 50
      Calculated = True
    end
  end
  object HistDS: TDataSource
    DataSet = HistTab
    Left = 528
    Top = 152
  end
end
