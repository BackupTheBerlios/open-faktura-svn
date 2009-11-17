object TeilLieferForm: TTeilLieferForm
  Left = 257
  Top = 234
  HelpContext = 110000
  BorderStyle = bsDialog
  Caption = 'Teillieferung bearbeiten'
  ClientHeight = 314
  ClientWidth = 627
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 283
    Width = 627
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 4
      Width = 232
      Height = 25
      DataSource = LiefDS
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
      TabOrder = 0
    end
    object MakeLiefBtn: TBitBtn
      Left = 234
      Top = 4
      Width = 145
      Height = 25
      Caption = 'Lieferschein erstellen'
      TabOrder = 1
      OnClick = MakeLiefBtnClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888800000088888008888888888800000088880FF008888888880000008880
        F00FF008888888000000880F0FF00FF008888800000080F0F78FF00FF0888800
        0000880F70078FF008888800000080F70FB0078FF088880000008800FBFBF007
        088888000000880FBFBFBFB008888800000080FBFBFBFBFBF088880000008800
        BFBFBFBF088888000000888800FBFBF088088800000088888800B80880008800
        0000888888880088000008000000888888888888880888000000888888888888
        880888000000888888888888888888000000}
    end
    object AbbruchBtn: TBitBtn
      Left = 527
      Top = 4
      Width = 97
      Height = 25
      Cancel = True
      Caption = 'Abbrechen'
      TabOrder = 2
      OnClick = AbbruchBtnClick
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
  end
  object ExRxDBGrid1: TOFDBGrid
    Left = 0
    Top = 0
    Width = 627
    Height = 283
    Align = alClient
    DataSource = LiefDS
    DefaultDrawing = False
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines]
    TabOrder = 1
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
    RowsHeight = 24
    TitleRowHeight = 24
    RowColor1 = clWindow
    RowColor2 = clWindow
    ShowTitleEllipsis = True
    DefaultRowHeight = 17
    EditColor = clBlack
  end
  object LiefTab: TZQuery
    Connection = DM1.DB1
    UpdateObject = ZUpdateSql1
    BeforePost = LiefTabBeforePost
    AfterPost = LiefTabAfterPost
    AfterCancel = LiefTabAfterPost
    BeforeDelete = LiefTabBeforeDelete
    SQL.Strings = (
      
        'select JP1.REC_ID, JP1.ARTIKEL_ID,JP1.POSITION, JP1.ARTNUM, JP1.' +
        'MATCHCODE, JP1.BEZEICHNUNG, JP2.MENGE as ME_RE, JP1.MENGE as LIE' +
        'FERMENGE, SUM(JP3.MENGE) as MENGE_GELIEFERT, A.MENGE_AKT as LAGE' +
        'RMENGE'
      'from JOURNALPOS JP1, JOURNALPOS JP2'
      'left outer join ARTIKEL A on A.REC_ID = JP1.ARTIKEL_ID'
      
        'left outer join JOURNALPOS JP3 on JP3.QUELLE_SRC=JP2.REC_ID and ' +
        'JP3.QUELLE=2'
      
        'where JP1.QUELLE=12 and JP2.QUELLE=13 and JP2.REC_ID = JP1.QUELL' +
        'E_SRC'
      'and JP1.JOURNAL_ID=:JID'
      'group by JP2.REC_ID'
      'order by JP1.POSITION')
    Params = <
      item
        DataType = ftInteger
        Name = 'JID'
        ParamType = ptInput
        Value = '11'
      end>
    Left = 88
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'JID'
        ParamType = ptInput
        Value = '11'
      end>
    object LiefTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
      ReadOnly = True
      Visible = False
    end
    object LiefTabARTIKEL_ID: TIntegerField
      FieldName = 'ARTIKEL_ID'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object LiefTabPOSITION: TIntegerField
      DisplayLabel = 'Pos.'
      DisplayWidth = 4
      FieldName = 'POSITION'
      ReadOnly = True
      Required = True
    end
    object LiefTabARTNUM: TStringField
      DisplayLabel = 'Artikelnummer'
      DisplayWidth = 12
      FieldName = 'ARTNUM'
      ReadOnly = True
    end
    object LiefTabMATCHCODE: TStringField
      DisplayLabel = 'Matchcode'
      DisplayWidth = 12
      FieldName = 'MATCHCODE'
      ReadOnly = True
    end
    object LiefTabBEZEICHNUNG: TMemoField
      DisplayLabel = 'Beschreibung'
      DisplayWidth = 28
      FieldName = 'BEZEICHNUNG'
      ReadOnly = True
      BlobType = ftMemo
    end
    object LiefTabME_RE: TFloatField
      DisplayLabel = 'Menge RE'
      DisplayWidth = 9
      FieldName = 'ME_RE'
      ReadOnly = True
      Required = True
      DisplayFormat = ',#0.00'
    end
    object LiefTabLIEFERMENGE: TFloatField
      DisplayLabel = 'zu liefern'
      DisplayWidth = 9
      FieldName = 'LIEFERMENGE'
      DisplayFormat = ',#0.00'
      MaxValue = 999999.000000000000000000
    end
    object LiefTabMENGE_GELIEFERT: TFloatField
      DisplayLabel = 'ber.gelief.'
      DisplayWidth = 9
      FieldName = 'MENGE_GELIEFERT'
      ReadOnly = True
      DisplayFormat = ',#0.00'
    end
    object LiefTabLAGERMENGE: TFloatField
      DisplayLabel = 'Lagermenge'
      DisplayWidth = 9
      FieldName = 'LAGERMENGE'
      ReadOnly = True
      Required = True
      DisplayFormat = ',#0.00'
    end
  end
  object LiefDS: TDataSource
    DataSet = LiefTab
    Left = 152
    Top = 48
  end
  object ZUpdateSql1: TZUpdateSQL
    ModifySQL.Strings = (
      'update JOURNALPOS SET MENGE=:LIEFERMENGE'
      'where JOURNALPOS.REC_ID=:REC_ID and QUELLE=12')
    UseSequenceFieldForRefreshSQL = False
    Left = 88
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'LIEFERMENGE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REC_ID'
        ParamType = ptUnknown
      end>
  end
end
