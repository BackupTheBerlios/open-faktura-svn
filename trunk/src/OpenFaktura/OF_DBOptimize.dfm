object DBForm: TDBForm
  Left = 247
  Top = 134
  Width = 561
  Height = 411
  HelpContext = 100400
  Caption = 'Datenbank pr'#252'fen, optimieren, reparieren'
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 365
    Width = 553
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 324
    Width = 553
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object PruefBtn: TBitBtn
      Left = 16
      Top = 8
      Width = 145
      Height = 25
      Caption = 'Pr'#252'fen'
      TabOrder = 0
      OnClick = PruefBtnClick
    end
    object OptBtn: TBitBtn
      Left = 208
      Top = 8
      Width = 145
      Height = 25
      Caption = 'Optimieren'
      TabOrder = 1
      OnClick = OptBtnClick
    end
    object RepBtn: TBitBtn
      Left = 392
      Top = 8
      Width = 145
      Height = 25
      Caption = 'Reparieren'
      TabOrder = 2
      OnClick = RepBtnClick
    end
  end
  object SrvStatusGrid: TJvDBGrid
    Left = 0
    Top = 0
    Width = 553
    Height = 324
    Align = alClient
    DataSource = StatusDS
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'Table'
        Title.Caption = 'Tabelle'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Op'
        Title.Caption = 'Operation'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Msg_type'
        Title.Caption = 'Meldungstyp'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Msg_text'
        Title.Caption = 'Status'
        Width = 238
        Visible = True
      end>
  end
  object StatusDS: TDataSource
    DataSet = Status
    Left = 188
    Top = 112
  end
  object Status: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'OPTIMIZE TABLE'
      
        'ADRESSEN, ADRESSEN_ASP, ARTIKEL, ARTIKEL_LTEXT, ARTIKEL_SERNUM, ' +
        'ARTIKEL_STUECKLIST,'
      
        'BLZ, FIBU_BUCHUNGEN, FIBU_JOURNAL, FIBU_KASSE, FIBU_KONTEN, FIBU' +
        '_OPOS, INFO,'
      'JOURNAL, JOURNALPOS, KFZ, LAND, PLZ, REGISTERY, VERTRETER')
    Params = <>
    Left = 132
    Top = 112
    object StatusTable: TStringField
      FieldName = 'Table'
      Size = 128
    end
    object StatusOp: TStringField
      FieldName = 'Op'
      Size = 10
    end
    object StatusMsg_type: TStringField
      FieldName = 'Msg_type'
      Size = 10
    end
    object StatusMsg_text: TStringField
      FieldName = 'Msg_text'
      Size = 255
    end
  end
end
