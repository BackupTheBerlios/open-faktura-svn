object LiefExportDlg: TLiefExportDlg
  Left = 363
  Top = 175
  HelpContext = 110900
  BorderStyle = bsDialog
  Caption = 'Versanddatenexport / UPS'
  ClientHeight = 342
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AddBtn: TSpeedButton
    Left = 177
    Top = 86
    Width = 31
    Height = 33
    Hint = 'Feld einf'#252'gen'
    Caption = '>'
    ParentShowHint = False
    ShowHint = True
    OnClick = AddBtnClick
  end
  object SrcFelderLab: TLabel
    Left = 10
    Top = 68
    Width = 83
    Height = 13
    Caption = 'verf'#252'gbare Felder'
  end
  object DestFelderLab: TLabel
    Left = 218
    Top = 68
    Width = 92
    Height = 13
    Caption = 'ausgew'#228'hlte Felder'
  end
  object DelBtn: TSpeedButton
    Left = 177
    Top = 134
    Width = 31
    Height = 33
    Hint = 'Feld entfernen'
    Caption = '<'
    ParentShowHint = False
    ShowHint = True
    OnClick = DelBtnClick
  end
  object ExportFileNameLab: TLabel
    Left = 8
    Top = 38
    Width = 56
    Height = 13
    Caption = 'Exportdatei:'
  end
  object TrennzeichenLab: TLabel
    Left = 384
    Top = 11
    Width = 65
    Height = 13
    Caption = 'Trennzeichen'
  end
  object ModusLab: TLabel
    Left = 376
    Top = 38
    Width = 32
    Height = 13
    Caption = 'Modus'
  end
  object SrcGrid: TJvStringGrid
    Left = 8
    Top = 86
    Width = 161
    Height = 209
    ColCount = 1
    DefaultColWidth = 135
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    TabOrder = 6
    OnDblClick = AddBtnClick
    Alignment = taLeftJustify
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'MS Sans Serif'
    FixedFont.Style = []
  end
  object DstGrid: TJvStringGrid
    Left = 216
    Top = 86
    Width = 294
    Height = 209
    ColCount = 2
    DefaultColWidth = 135
    DefaultRowHeight = 17
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
    TabOrder = 7
    OnDblClick = DelBtnClick
    OnSetEditText = DstGridSetEditText
    Alignment = taLeftJustify
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'MS Sans Serif'
    FixedFont.Style = []
    RowHeights = (
      17
      17
      17
      17
      17)
  end
  object AktivCB: TCheckBox
    Left = 8
    Top = 9
    Width = 49
    Height = 17
    Caption = 'Aktiv'
    TabOrder = 0
  end
  object ExportFilenameEdit: TJvFilenameEdit
    Left = 72
    Top = 34
    Width = 297
    Height = 21
    TabOrder = 4
    Text = 'ExportFilenameEdit'
  end
  object MitFeldNamenCB: TCheckBox
    Left = 72
    Top = 9
    Width = 97
    Height = 17
    Caption = 'incl. Feldnamen'
    TabOrder = 1
  end
  object TrennzeichenCB: TComboBox
    Left = 456
    Top = 7
    Width = 57
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      ';'
      ','
      'TAB')
  end
  object ModusCB: TComboBox
    Left = 416
    Top = 34
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    Items.Strings = (
      #220'berschreiben'
      'Anh'#228'ngen')
  end
  object OKBtn: TBitBtn
    Left = 320
    Top = 310
    Width = 97
    Height = 25
    Caption = 'S&peichern'
    ModalResult = 1
    TabOrder = 8
    OnClick = OKBtnClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object CloseBtn: TBitBtn
    Left = 424
    Top = 310
    Width = 89
    Height = 25
    Caption = 'S&chlie'#223'en'
    TabOrder = 9
    OnClick = CloseBtnClick
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
    Left = 8
    Top = 310
    Width = 89
    Height = 25
    TabOrder = 10
    Kind = bkHelp
  end
  object TextInHKCB: TCheckBox
    Left = 184
    Top = 9
    Width = 185
    Height = 17
    Caption = 'Text in Hochkommas einschlie'#223'en'
    TabOrder = 2
  end
  object SrcFeldQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from JOURNAL '
      'left outer join ADRESSEN on ADRESSEN.REC_ID=JOURNAL.ADDR_ID'
      'limit 0,1')
    Params = <>
    Left = 80
    Top = 222
    object SrcFeldQueryREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object SrcFeldQueryADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
    end
    object SrcFeldQueryATRNUM: TIntegerField
      FieldName = 'ATRNUM'
      Required = True
    end
    object SrcFeldQueryVLSNUM: TIntegerField
      FieldName = 'VLSNUM'
      Required = True
    end
    object SrcFeldQueryORGNUM: TStringField
      FieldName = 'ORGNUM'
    end
    object SrcFeldQueryLDATUM: TDateField
      FieldName = 'LDATUM'
    end
    object SrcFeldQueryGEWICHT: TFloatField
      FieldName = 'GEWICHT'
      Required = True
    end
    object SrcFeldQueryNSUMME: TFloatField
      FieldName = 'NSUMME'
      Required = True
    end
    object SrcFeldQueryMSUMME: TFloatField
      FieldName = 'MSUMME'
      Required = True
    end
    object SrcFeldQueryBSUMME: TFloatField
      FieldName = 'BSUMME'
      Required = True
    end
    object SrcFeldQueryWAEHRUNG: TStringField
      FieldName = 'WAEHRUNG'
      Required = True
      Size = 5
    end
    object SrcFeldQueryERSTELLT: TDateField
      FieldName = 'ERSTELLT'
    end
    object SrcFeldQueryERST_NAME: TStringField
      FieldName = 'ERST_NAME'
    end
    object SrcFeldQueryKUN_NUM: TStringField
      FieldName = 'KUN_NUM'
    end
    object SrcFeldQueryKUN_ANREDE: TStringField
      FieldName = 'KUN_ANREDE'
      Size = 40
    end
    object SrcFeldQueryKUN_NAME1: TStringField
      FieldName = 'KUN_NAME1'
      Size = 40
    end
    object SrcFeldQueryKUN_NAME2: TStringField
      FieldName = 'KUN_NAME2'
      Size = 40
    end
    object SrcFeldQueryKUN_NAME3: TStringField
      FieldName = 'KUN_NAME3'
      Size = 40
    end
    object SrcFeldQueryKUN_ABTEILUNG: TStringField
      FieldName = 'KUN_ABTEILUNG'
      Size = 40
    end
    object SrcFeldQueryKUN_STRASSE: TStringField
      FieldName = 'KUN_STRASSE'
      Size = 40
    end
    object SrcFeldQueryKUN_LAND: TStringField
      FieldName = 'KUN_LAND'
      Size = 5
    end
    object SrcFeldQueryKUN_PLZ: TStringField
      FieldName = 'KUN_PLZ'
      Size = 10
    end
    object SrcFeldQueryKUN_ORT: TStringField
      FieldName = 'KUN_ORT'
      Size = 40
    end
    object SrcFeldQueryUSR1: TStringField
      FieldName = 'USR1'
      Size = 80
    end
    object SrcFeldQueryUSR2: TStringField
      FieldName = 'USR2'
      Size = 80
    end
    object SrcFeldQueryPROJEKT: TStringField
      FieldName = 'PROJEKT'
      Size = 80
    end
    object SrcFeldQueryBEST_NAME: TStringField
      FieldName = 'BEST_NAME'
      Size = 40
    end
    object SrcFeldQueryBEST_CODE: TIntegerField
      FieldName = 'BEST_CODE'
    end
    object SrcFeldQueryBEST_DATUM: TDateField
      FieldName = 'BEST_DATUM'
    end
    object SrcFeldQueryEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object SrcFeldQueryEMAIL2: TStringField
      FieldName = 'EMAIL2'
      Size = 100
    end
    object SrcFeldQueryINTERNET: TStringField
      FieldName = 'INTERNET'
      Size = 100
    end
    object SrcFeldQueryBRIEFANREDE: TStringField
      FieldName = 'BRIEFANREDE'
      Size = 100
    end
    object SrcFeldQueryDEB_NUM: TIntegerField
      FieldName = 'DEB_NUM'
    end
    object SrcFeldQueryUST_NUM: TStringField
      FieldName = 'UST_NUM'
      Size = 25
    end
    object SrcFeldQueryUSERFELD_01: TStringField
      FieldName = 'USERFELD_01'
      Size = 255
    end
    object SrcFeldQueryUSERFELD_02: TStringField
      FieldName = 'USERFELD_02'
      Size = 255
    end
    object SrcFeldQueryUSERFELD_03: TStringField
      FieldName = 'USERFELD_03'
      Size = 255
    end
    object SrcFeldQueryUSERFELD_04: TStringField
      FieldName = 'USERFELD_04'
      Size = 255
    end
    object SrcFeldQueryUSERFELD_05: TStringField
      FieldName = 'USERFELD_05'
      Size = 255
    end
    object SrcFeldQueryUSERFELD_06: TStringField
      FieldName = 'USERFELD_06'
      Size = 255
    end
    object SrcFeldQueryUSERFELD_07: TStringField
      FieldName = 'USERFELD_07'
      Size = 255
    end
    object SrcFeldQueryUSERFELD_08: TStringField
      FieldName = 'USERFELD_08'
      Size = 255
    end
    object SrcFeldQueryUSERFELD_09: TStringField
      FieldName = 'USERFELD_09'
      Size = 255
    end
    object SrcFeldQueryUSERFELD_10: TStringField
      FieldName = 'USERFELD_10'
      Size = 255
    end
  end
end
