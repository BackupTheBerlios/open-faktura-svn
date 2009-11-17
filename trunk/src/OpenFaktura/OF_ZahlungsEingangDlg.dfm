object ZEForm: TZEForm
  Left = 362
  Top = 266
  HelpContext = 100250
  BorderStyle = bsDialog
  Caption = 'Zahlungseingang'
  ClientHeight = 326
  ClientWidth = 471
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 252
    Height = 326
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object KunDatGB: TOFGroupBox
      Left = 0
      Top = 4
      Width = 252
      Height = 162
      Align = alTop
      Caption = 'Kundendaten'
      Color = 14680063
      TitleColor = 14680063
      ParentColor = False
      TabOrder = 0
      object Label1: TLabel
        Left = 5
        Top = 45
        Width = 37
        Height = 13
        Caption = 'Anrede:'
      end
      object Label2: TLabel
        Left = 5
        Top = 61
        Width = 31
        Height = 13
        Caption = 'Name:'
      end
      object Label3: TLabel
        Left = 5
        Top = 109
        Width = 34
        Height = 13
        Caption = 'Stra'#223'e:'
      end
      object DBText1: TDBText
        Tag = 1
        Left = 65
        Top = 45
        Width = 179
        Height = 17
        DataField = 'KUN_ANREDE'
        DataSource = JoDS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Tag = 1
        Left = 65
        Top = 61
        Width = 179
        Height = 13
        DataField = 'KUN_NAME1'
        DataSource = JoDS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText3: TDBText
        Tag = 1
        Left = 65
        Top = 77
        Width = 179
        Height = 13
        DataField = 'KUN_NAME2'
        DataSource = JoDS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText4: TDBText
        Tag = 1
        Left = 65
        Top = 93
        Width = 179
        Height = 13
        DataField = 'KUN_NAME3'
        DataSource = JoDS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText5: TDBText
        Tag = 1
        Left = 65
        Top = 109
        Width = 179
        Height = 13
        DataField = 'KUN_STRASSE'
        DataSource = JoDS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText6: TDBText
        Left = 65
        Top = 125
        Width = 14
        Height = 13
        DataField = 'KUN_LAND'
        DataSource = JoDS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText7: TDBText
        Left = 81
        Top = 125
        Width = 35
        Height = 13
        DataField = 'KUN_PLZ'
        DataSource = JoDS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText8: TDBText
        Tag = 1
        Left = 119
        Top = 125
        Width = 125
        Height = 13
        DataField = 'KUN_ORT'
        DataSource = JoDS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 5
        Top = 125
        Width = 42
        Height = 13
        Caption = 'PLZ/Ort:'
      end
      object Label5: TLabel
        Left = 5
        Top = 23
        Width = 52
        Height = 13
        Caption = 'Kundennr.:'
      end
      object Label6: TLabel
        Left = 5
        Top = 142
        Width = 42
        Height = 13
        Caption = 'G-Konto:'
      end
      object DBText9: TDBText
        Left = 65
        Top = 23
        Width = 76
        Height = 13
        DataField = 'KUN_NUM'
        DataSource = JoDS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText10: TDBText
        Tag = 1
        Left = 65
        Top = 142
        Width = 179
        Height = 13
        DataField = 'GEGENKONTO'
        DataSource = JoDS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object InfoGB: TOFGroupBox
      Left = 0
      Top = 166
      Width = 252
      Height = 160
      Align = alClient
      Caption = 'Info'
      Color = 14680063
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TitleColor = 14680063
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object Label13: TLabel
        Left = 5
        Top = 22
        Width = 90
        Height = 13
        Caption = 'Rechnungsdatum: '
      end
      object DBText11: TDBText
        Tag = 1
        Left = 174
        Top = 22
        Width = 70
        Height = 13
        Alignment = taRightJustify
        DataField = 'RDATUM'
        DataSource = JoDS
      end
      object Label14: TLabel
        Left = 5
        Top = 41
        Width = 102
        Height = 13
        Caption = 'Zieldatum mit Skonto:'
      end
      object SkontoDatLab: TLabel
        Tag = 1
        Left = 112
        Top = 41
        Width = 132
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '11.12.2001'
      end
      object Label15: TLabel
        Left = 5
        Top = 60
        Width = 84
        Height = 13
        Caption = 'Ziel ohne Skonto:'
      end
      object Label16: TLabel
        Left = 5
        Top = 78
        Width = 44
        Height = 13
        Caption = 'F'#228'lligkeit:'
      end
      object NettoDatLab: TLabel
        Tag = 1
        Left = 169
        Top = 60
        Width = 75
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '11.12.2001'
      end
      object FaelligTage: TLabel
        Tag = 1
        Left = 169
        Top = 78
        Width = 75
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '100 Tage'
      end
      object Label17: TLabel
        Left = 5
        Top = 94
        Width = 71
        Height = 13
        Caption = 'Skonto-Betrag:'
      end
      object SkontoBetLab: TLabel
        Tag = 1
        Left = 169
        Top = 94
        Width = 75
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1.234,56 '#8364
      end
      object Label18: TLabel
        Left = 5
        Top = 118
        Width = 155
        Height = 13
        Caption = 'Anzahlung / Teilzahlung gezahlt:'
      end
      object Label19: TLabel
        Left = 5
        Top = 137
        Width = 148
        Height = 13
        Caption = 'verbleibender Restbetrag:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object AnzahlungLab: TLabel
        Tag = 1
        Left = 169
        Top = 118
        Width = 75
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1.234,56 '#8364
      end
      object RestLab: TLabel
        Tag = 1
        Left = 169
        Top = 137
        Width = 75
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1.234,56 '#8364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 252
      Height = 4
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 252
    Top = 0
    Width = 219
    Height = 326
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object CaoGroupBox1: TOFGroupBox
      Left = 0
      Top = 4
      Width = 219
      Height = 322
      Align = alClient
      Caption = 'Zahlung'
      Color = 14680063
      Ctl3D = True
      TitleColor = 14680063
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 0
      object Label7: TLabel
        Left = 5
        Top = 24
        Width = 105
        Height = 13
        Caption = 'Rechnungsbetrag:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 5
        Top = 65
        Width = 59
        Height = 13
        Caption = 'Skonto in %:'
      end
      object Label9: TLabel
        Left = 5
        Top = 87
        Width = 71
        Height = 13
        Caption = 'Skonto Betrag:'
      end
      object Label10: TLabel
        Left = 5
        Top = 109
        Width = 80
        Height = 13
        Caption = 'gezahlter Betrag:'
      end
      object RBetrag: TLabel
        Tag = 1
        Left = 120
        Top = 24
        Width = 91
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'RBetrag'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SKBetrag: TLabel
        Tag = 1
        Left = 120
        Top = 87
        Width = 91
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SKBetrag'
      end
      object DiffLab: TLabel
        Left = 5
        Top = 133
        Width = 111
        Height = 13
        Caption = 'Differenz (Teilzahlung) :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object DiffBetrag: TLabel
        Tag = 1
        Left = 120
        Top = 133
        Width = 91
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'DiffBetrag'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label11: TLabel
        Left = 5
        Top = 160
        Width = 83
        Height = 13
        Caption = 'Buchungsdatum :'
      end
      object Label12: TLabel
        Left = 5
        Top = 188
        Width = 59
        Height = 13
        Caption = 'Zahlungsart:'
      end
      object KontoLab: TLabel
        Left = 5
        Top = 212
        Width = 31
        Height = 13
        Caption = 'Konto:'
      end
      object SkontoProz: TJvSpinEdit
        Tag = 1
        Left = 101
        Top = 63
        Width = 110
        Height = 21
        CheckOptions = [coCheckOnChange, coCheckOnExit]
        Alignment = taRightJustify
        MaxValue = 100.000000000000000000
        ValueType = vtFloat
        OnBottomClick = SkontoProzChange
        OnTopClick = SkontoProzChange
        Enabled = False
        TabOrder = 1
        OnChange = SkontoProzChange
        OnExit = SkontoProzChange
        OnKeyDown = SkontoProzKeyUp
        OnKeyUp = SkontoProzKeyUp
      end
      object IST_BETRAG: TDBEdit
        Tag = 1
        Left = 101
        Top = 106
        Width = 110
        Height = 21
        DataField = 'IST_BETRAG'
        DataSource = JoDS
        TabOrder = 2
        OnChange = IST_BETRAGChange
      end
      object SkontoCB: TCheckBox
        Tag = 1
        Left = 5
        Top = 42
        Width = 206
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Skonto'
        TabOrder = 0
        OnClick = SkontoCBClick
      end
      object BuchenBtn: TBitBtn
        Left = 8
        Top = 235
        Width = 202
        Height = 41
        Caption = '&Buchen'
        TabOrder = 5
        OnClick = BuchenBtnClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
          00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
          00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
          00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
          0003737FFFFFFFFF7F7330099999999900333777777777777733}
        NumGlyphs = 2
      end
      object BitBtn2: TBitBtn
        Left = 8
        Top = 282
        Width = 202
        Height = 31
        Cancel = True
        Caption = 'Abbrechen'
        ModalResult = 3
        TabOrder = 6
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
      object DBDateEdit1: TJvDBDateEdit
        Tag = 1
        Left = 101
        Top = 159
        Width = 110
        Height = 21
        DataField = 'IST_ZAHLDAT'
        DataSource = JoDS
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 3
      end
      object ZahlartCB: TJvDBLookupCombo
        Tag = 1
        Left = 101
        Top = 186
        Width = 110
        Height = 20
        DropDownCount = 10
        DataField = 'ZAHLART'
        DataSource = JoDS
        LookupField = 'ZAHL_ID'
        LookupDisplay = 'LANGBEZ'
        LookupSource = DM1.ZahlArtDS
        TabOrder = 4
      end
      object FibuKtoLookupCB: TDBLookupComboBox
        Left = 101
        Top = 210
        Width = 110
        Height = 21
        DataField = 'BANK_ID'
        DataSource = JoDS
        DropDownRows = 15
        DropDownWidth = 180
        KeyField = 'FIBU_KTO'
        ListField = 'KURZBEZ;FIBU_KTO'
        ListSource = FirKtoDS
        TabOrder = 7
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 219
      Height = 4
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
    end
  end
  object JoDS: TDataSource
    DataSet = DM1.JourTab
    OnDataChange = JoDSDataChange
    Left = 192
    Top = 40
  end
  object FirKtoDS: TDataSource
    Left = 192
    Top = 100
  end
end
