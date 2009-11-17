object ManKasBuchForm: TManKasBuchForm
  Left = 253
  Top = 143
  HelpContext = 100100
  BorderStyle = bsDialog
  Caption = 'manuelle Kassenbuchung'
  ClientHeight = 200
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 83
    Height = 13
    Caption = 'Art der Buchung :'
  end
  object Label2: TLabel
    Left = 25
    Top = 44
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = 'Gegenkonto :'
  end
  object Label3: TLabel
    Left = 277
    Top = 44
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'Betrag :'
  end
  object Label4: TLabel
    Left = 231
    Top = 76
    Width = 83
    Height = 13
    Alignment = taRightJustify
    Caption = 'Buchungsdatum :'
  end
  object Label5: TLabel
    Left = 8
    Top = 100
    Width = 71
    Height = 13
    Caption = 'Buchungstext :'
  end
  object Label6: TLabel
    Left = 244
    Top = 12
    Width = 70
    Height = 13
    Alignment = taRightJustify
    Caption = 'Belegnummer :'
  end
  object ArtBuchCB: TComboBox
    Left = 96
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = ArtBuchCBChange
    Items.Strings = (
      'Privatentnahme'
      'Privateinlage'
      'Transfer Kasse -> Bank'
      'Transfer Bank -> Kasse'
      '')
  end
  object Betrag: TDBEdit
    Left = 320
    Top = 40
    Width = 113
    Height = 21
    DataField = 'ZU_ABGANG'
    DataSource = DataSource1
    TabOrder = 1
    OnChange = GKontoChange
  end
  object GKonto: TDBEdit
    Left = 96
    Top = 40
    Width = 145
    Height = 21
    DataField = 'GKONTO'
    DataSource = DataSource1
    TabOrder = 2
    OnChange = GKontoChange
  end
  object BuDatum: TJvDBDateEdit
    Left = 320
    Top = 72
    Width = 113
    Height = 21
    DataField = 'BDATUM'
    DataSource = DataSource1
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 3
    OnChange = GKontoChange
  end
  object BuchenBtn: TBitBtn
    Left = 168
    Top = 168
    Width = 121
    Height = 25
    Caption = 'Buchen'
    TabOrder = 4
    OnClick = BuchenBtnClick
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
  object AbortBtn: TBitBtn
    Left = 296
    Top = 168
    Width = 137
    Height = 25
    TabOrder = 5
    Kind = bkAbort
  end
  object DBMemo1: TDBMemo
    Left = 96
    Top = 100
    Width = 337
    Height = 57
    DataField = 'BTXT'
    DataSource = DataSource1
    TabOrder = 6
    OnChange = GKontoChange
  end
  object BelNumEdi: TDBEdit
    Left = 320
    Top = 8
    Width = 113
    Height = 21
    DataField = 'BELEGNUM'
    DataSource = DataSource1
    TabOrder = 7
    OnChange = GKontoChange
  end
  object DataSource1: TDataSource
    Left = 32
    Top = 136
  end
end
