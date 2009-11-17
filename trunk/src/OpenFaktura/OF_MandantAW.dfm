object MandantAWForm: TMandantAWForm
  Left = 352
  Top = 201
  HelpContext = 100300
  BorderStyle = bsDialog
  Caption = 'Mandantenverwaltung'
  ClientHeight = 313
  ClientWidth = 475
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
  object Label4: TLabel
    Left = 250
    Top = 227
    Width = 45
    Height = 13
    Caption = 'Pa'#223'wort :'
  end
  object Label3: TLabel
    Left = 250
    Top = 188
    Width = 74
    Height = 13
    Caption = 'Benutzername :'
  end
  object Label5: TLabel
    Left = 250
    Top = 151
    Width = 59
    Height = 13
    Caption = 'Datenbank :'
  end
  object Label12: TLabel
    Left = 250
    Top = 115
    Width = 25
    Height = 13
    Caption = 'Port :'
  end
  object Label2: TLabel
    Left = 250
    Top = 77
    Width = 37
    Height = 13
    Caption = 'Server :'
  end
  object Label6: TLabel
    Left = 250
    Top = 38
    Width = 58
    Height = 13
    Caption = 'Ausgew'#228'hlt:'
  end
  object NextMandantLab: TLabel
    Left = 250
    Top = 55
    Width = 211
    Height = 16
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 250
    Top = 3
    Width = 69
    Height = 13
    Caption = 'akt. Mandant :'
  end
  object AktMandantLab: TLabel
    Left = 250
    Top = 17
    Width = 211
    Height = 16
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object MandantLB: TListBox
    Left = 8
    Top = 8
    Width = 225
    Height = 257
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
    OnClick = MandantCBChange
  end
  object CloseBtn: TBitBtn
    Left = 336
    Top = 280
    Width = 129
    Height = 25
    Caption = 'S&chlie'#223'en'
    TabOrder = 1
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
  object MandantDelBtn: TBitBtn
    Left = 136
    Top = 280
    Width = 97
    Height = 25
    Caption = '&L'#246'schen'
    TabOrder = 2
    OnClick = MandantDelBtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      300033FFFFFF3333377739999993333333333777777F3333333F399999933333
      3300377777733333337733333333333333003333333333333377333333333333
      3333333333333333333F333333333333330033333F33333333773333C3333333
      330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
      993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
      333333377F33333333FF3333C333333330003333733333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
  end
  object NeuBtn: TBitBtn
    Left = 11
    Top = 280
    Width = 103
    Height = 25
    Caption = '&Neu'
    TabOrder = 3
    OnClick = NeuBtnClick
    Glyph.Data = {
      06020000424D0602000000000000760000002800000028000000140000000100
      0400000000009001000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333FFFFF333333333333330000033333333FFFFFFF88888F
      FFF333888888880AAA08883333888888888F3388883F38BFBFBFBF0AAA0FBF83
      38F33333FF8F338FFF8F38FBFBF0000AAA00008338F3333888833388888F38BF
      BFB0AAAAAAAAA08338F33338F3333333388F38FBFBF0AAAAAAAAA08338F33338
      F3333333388F38BFBFB0AAAAAAAAA08338F33338FFFF3333388F38FBFBF0000A
      AA00008338F33338888F3388888F38BFBFBFBF0AAA0FBF8338F33333338F338F
      338F38FBFBFBFB0AAA0BFB8338F33333338FFF8F338F38BFBFBFBF00000FBF83
      38F3333333888883338F38FBFBFBFBFBFBFBFB8338F3333333333333338F38BF
      BFBFBFBFBFBFBF8338F3333333333333338F38FBFBFBFBFBFBFBFB8338FFFFFF
      F3333333338F38888888BFBFBFBFBF83388888883FFFFFFFFF8338FBFBFB8888
      88888833383FFFFF888888888833338888883333333333333388888833333333
      3333333333333333333333333333333333333333333333333333333333333333
      33333333333333333333}
    NumGlyphs = 2
  end
  object PasEdi: TEdit
    Left = 250
    Top = 241
    Width = 215
    Height = 21
    Enabled = False
    PasswordChar = '*'
    TabOrder = 4
  end
  object UsrEdi: TEdit
    Left = 250
    Top = 202
    Width = 215
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object DBEdi: TEdit
    Left = 250
    Top = 164
    Width = 215
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object PortEdi: TEdit
    Left = 249
    Top = 128
    Width = 215
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object SrvEdi: TEdit
    Left = 250
    Top = 90
    Width = 215
    Height = 21
    Enabled = False
    TabOrder = 8
  end
end