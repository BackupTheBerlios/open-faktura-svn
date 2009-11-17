object NewMandantDlg: TNewMandantDlg
  Left = 464
  Top = 382
  HelpContext = 100300
  BorderStyle = bsDialog
  Caption = 'neuen Mandanten (DB) anlegen'
  ClientHeight = 237
  ClientWidth = 482
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
  object Hinweis: TLabel
    Left = 75
    Top = 151
    Width = 398
    Height = 44
    AutoSize = False
    WordWrap = True
  end
  object Label15: TLabel
    Left = 10
    Top = 150
    Width = 65
    Height = 13
    AutoSize = False
    Caption = 'Hinweis :'
  end
  object Label11: TLabel
    Left = 10
    Top = 124
    Width = 65
    Height = 13
    AutoSize = False
    Caption = '&Pa'#223'wort :'
    FocusControl = NewPWEdi
  end
  object Label10: TLabel
    Left = 10
    Top = 97
    Width = 65
    Height = 13
    AutoSize = False
    Caption = '&Benutzer :'
    FocusControl = NewUserEdi
  end
  object Label9: TLabel
    Left = 10
    Top = 71
    Width = 65
    Height = 13
    AutoSize = False
    Caption = '&Datenbank :'
    FocusControl = NewDBEdi
  end
  object Label8: TLabel
    Left = 10
    Top = 45
    Width = 65
    Height = 13
    AutoSize = False
    Caption = 'Ser&ver :'
    FocusControl = NewServerEdi
  end
  object Label13: TLabel
    Left = 354
    Top = 45
    Width = 25
    Height = 13
    Caption = 'P&ort :'
    FocusControl = NewPortEdi
  end
  object Label14: TLabel
    Left = 10
    Top = 13
    Width = 65
    Height = 13
    AutoSize = False
    Caption = '&Mandant :'
    FocusControl = edNewMandantName
  end
  object NewManAbortBtn: TBitBtn
    Left = 376
    Top = 205
    Width = 97
    Height = 25
    Caption = '&Abbrechen'
    TabOrder = 8
    OnClick = NewManAbortBtnClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object SaveBtn: TBitBtn
    Left = 272
    Top = 205
    Width = 95
    Height = 25
    Caption = '&Speichern'
    Enabled = False
    TabOrder = 7
    OnClick = SaveBtnClick
    Glyph.Data = {
      06020000424D0602000000000000760000002800000028000000140000000100
      0400000000009001000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      33333333333333333333333333333FFFFFFFFFFFF33333380000000000008333
      33338888888888883F333330CC08CCF770CC03333338F38F333338F38F333330
      CC08CCF770CC03333338F38F333338F38F333330CC07887770CC03333338F38F
      FFFFF8338F333330CC60000006CC03333338F338888883338F333330CCCCCCCC
      CCCC03333338F33FFFFFFFF38F333330C6000000006C03333338F3888888883F
      8F333330C0FFFFFFFF0C03333338F8F33333338F8F333330C0FFFFFFFF0C0333
      3338F8F33333338F8F333330C0FFFFFFFF0C03333338F8F33333338F8F333330
      C0FFFFFFFF0C03333338F8F33333338F8F33333000FFFFFFFF0003333338F8F3
      3333338F8F333330C0FFFFFFFF0C03333338F8FFFFFFFF8F8333333800000000
      0000833333338888888888883333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      33333333333333333333}
    NumGlyphs = 2
  end
  object btnServerTest: TBitBtn
    Left = 8
    Top = 205
    Width = 137
    Height = 25
    Caption = 'Einstellungen &testen'
    TabOrder = 6
    OnClick = btnServerTestClick
    Glyph.Data = {
      E6000000424DE60000000000000076000000280000000F0000000E0000000100
      0400000000007000000000000000000000001000000000000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF0087FFFFFFFFFFFF0B3087FFFFFFFFFFF0BB0087FF
      FFFFFFFF0BB3008FFFFFFFFFF0BBB008FFFFFFFFF00BBB007FFFFFFF00BBB007
      FFF0FFFFF00BBB007FF0FFFFFFF00BB007F0FFFFFFFFF00B0070FFFFFFFFFFF0
      00F0FFFFFFFFFFFFFFF0}
  end
  object NewPWEdi: TEdit
    Left = 73
    Top = 122
    Width = 397
    Height = 21
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 5
    OnChange = NewServerEdiChange
  end
  object NewUserEdi: TEdit
    Left = 73
    Top = 95
    Width = 397
    Height = 21
    Hint = 'z.B. root'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnChange = NewServerEdiChange
  end
  object NewDBEdi: TEdit
    Left = 73
    Top = 68
    Width = 397
    Height = 21
    Hint = 'z.B. M001'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnChange = NewServerEdiChange
    OnExit = NewDBEdiExit
  end
  object NewServerEdi: TEdit
    Left = 73
    Top = 42
    Width = 272
    Height = 21
    Hint = 'z.B. localhost oder 127.0.0.1'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnChange = NewServerEdiChange
  end
  object NewPortEdi: TJvCalcEdit
    Left = 393
    Top = 42
    Width = 75
    Height = 21
    Hint = 'der Standardport ist 3306'
    DecimalPlaces = 0
    DisplayFormat = '0'
    MaxValue = 65535.000000000000000000
    ParentShowHint = False
    ShowButton = False
    ShowHint = True
    TabOrder = 2
    DecimalPlacesAlwaysShown = False
    OnChange = NewServerEdiChange
  end
  object edNewMandantName: TEdit
    Left = 73
    Top = 10
    Width = 397
    Height = 21
    TabOrder = 0
    OnChange = NewServerEdiChange
    OnExit = edNewMandantNameExit
  end
  object TestTab: TZQuery
    Connection = TestDB
    SQL.Strings = (
      'select VAL_CHAR as DB_VERSION from REGISTERY '
      'where MAINKEY='#39'MAIN'#39' and NAME='#39'DB_VERSION'#39)
    Params = <>
    Left = 228
    Top = 152
  end
  object TestDB: TZConnection
    Protocol = 'mysql'
    Left = 364
    Top = 152
  end
end
