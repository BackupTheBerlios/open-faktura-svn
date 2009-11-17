object KasBuchAB: TKasBuchAB
  Left = 336
  Top = 199
  HelpContext = 100450
  BorderStyle = bsDialog
  Caption = 'Kassenbuch Anfangsbestand'
  ClientHeight = 128
  ClientWidth = 356
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
    Left = 7
    Top = 11
    Width = 63
    Height = 13
    Caption = 'Endbestand :'
    OnClick = FormShow
  end
  object Label2: TLabel
    Left = 7
    Top = 67
    Width = 71
    Height = 13
    Caption = 'Buchungstext :'
    OnClick = FormShow
  end
  object Label3: TLabel
    Left = 96
    Top = 11
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 274
    Top = 11
    Width = 32
    Height = 13
    Alignment = taRightJustify
    Caption = 'Label4'
  end
  object Label5: TLabel
    Left = 7
    Top = 35
    Width = 83
    Height = 13
    Caption = 'Anfangsbestand :'
    OnClick = FormShow
  end
  object Label6: TLabel
    Left = 96
    Top = 35
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object Label7: TLabel
    Left = 320
    Top = 11
    Width = 28
    Height = 13
    AutoSize = False
    Caption = 'Label7'
  end
  object Label8: TLabel
    Left = 320
    Top = 35
    Width = 28
    Height = 13
    AutoSize = False
    Caption = 'Label7'
  end
  object BuchText: TEdit
    Left = 96
    Top = 64
    Width = 249
    Height = 21
    TabOrder = 0
  end
  object BuchenBtn: TBitBtn
    Left = 112
    Top = 96
    Width = 121
    Height = 25
    Caption = '&Buchen'
    Default = True
    TabOrder = 1
    OnClick = BuchenBtnClick
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
  object AbortBtn: TBitBtn
    Left = 248
    Top = 96
    Width = 97
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object StartValEdit: TJvCalcEdit
    Left = 202
    Top = 32
    Width = 111
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 ;-,0.00 '
    ShowButton = False
    TabOrder = 3
    DecimalPlacesAlwaysShown = False
  end
  object KasseTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from FIBU_KASSE limit 0,1')
    Params = <>
    Left = 24
    Top = 80
    object KasseTabBDATUM: TDateField
      FieldName = 'BDATUM'
      Required = True
    end
    object KasseTabBELEGNUM: TStringField
      FieldName = 'BELEGNUM'
      Size = 10
    end
    object KasseTabQUELLE: TIntegerField
      FieldName = 'QUELLE'
      Required = True
    end
    object KasseTabGKONTO: TIntegerField
      FieldName = 'GKONTO'
    end
    object KasseTabSKONTO: TFloatField
      FieldName = 'SKONTO'
    end
    object KasseTabZU_ABGANG: TFloatField
      FieldName = 'ZU_ABGANG'
      Required = True
    end
    object KasseTabBTXT: TMemoField
      FieldName = 'BTXT'
      BlobType = ftMemo
    end
    object KasseTabJOURNAL_ID: TIntegerField
      FieldName = 'JOURNAL_ID'
    end
    object KasseTabMA_ID: TIntegerField
      FieldName = 'MA_ID'
    end
    object KasseTabERSTELLT: TDateField
      FieldName = 'ERSTELLT'
    end
    object KasseTabERST_NAME: TStringField
      FieldName = 'ERST_NAME'
    end
  end
end
