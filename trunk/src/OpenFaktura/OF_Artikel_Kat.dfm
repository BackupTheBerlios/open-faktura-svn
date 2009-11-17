object KatForm: TKatForm
  Left = 258
  Top = 346
  Width = 498
  Height = 335
  Caption = 'Artikel-Katalog'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = '110150'
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 289
    Width = 490
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 245
    Top = 0
    Width = 245
    Height = 289
    Align = alRight
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Color = 14680063
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    OnResize = Panel1Resize
    object Label1: TLabel
      Left = 54
      Top = 11
      Width = 3
      Height = 13
    end
    object Label2: TLabel
      Left = 134
      Top = 11
      Width = 3
      Height = 13
    end
    object Label3: TLabel
      Left = 8
      Top = 36
      Width = 31
      Height = 13
      Caption = 'Name:'
    end
    object Label4: TLabel
      Left = 8
      Top = 11
      Width = 14
      Height = 13
      Caption = 'ID:'
    end
    object Label5: TLabel
      Left = 88
      Top = 11
      Width = 39
      Height = 13
      Caption = 'TOP-ID:'
    end
    object BildLab: TLabel
      Left = 8
      Top = 60
      Width = 20
      Height = 13
      Caption = 'Bild:'
    end
    object Label7: TLabel
      Left = 8
      Top = 84
      Width = 39
      Height = 13
      Caption = 'Beschr.:'
    end
    object SpeedButton1: TSpeedButton
      Left = 214
      Top = 56
      Width = 21
      Height = 19
      Hint = 'Kategorie-Bild hochladen'
      Caption = '...'
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object KatMoveUpBtn: TSpeedButton
      Left = 10
      Top = 135
      Width = 27
      Height = 26
      Hint = 'Kategorie nach oben'
      Glyph.Data = {
        6E000000424D6E000000000000003E000000280000000C0000000C0000000100
        010000000000300000000000000000000000020000000200000000000000FFFF
        FF00FFF00000FFF00000F8F00000F8F00000F8F00000E0300000F0700000F8F0
        0000FDF00000FFF00000FFF00000FFF00000}
      ParentShowHint = False
      ShowHint = True
      OnClick = KatMoveUpBtnClick
    end
    object KatMoveDownBtn: TSpeedButton
      Left = 10
      Top = 160
      Width = 27
      Height = 26
      Hint = 'Kategorie nach unten'
      Glyph.Data = {
        6E000000424D6E000000000000003E000000280000000C0000000C0000000100
        010000000000300000000000000000000000020000000200000000000000FFFF
        FF00FFF00000FFF00000FFF00000FDF00000F8F00000F0700000E0300000F8F0
        0000F8F00000F8F00000FFF00000FFF00000}
      ParentShowHint = False
      ShowHint = True
      OnClick = KatMoveDownBtnClick
    end
    object Label6: TLabel
      Left = 176
      Top = 11
      Width = 25
      Height = 13
      Caption = 'Sort :'
    end
    object Label8: TLabel
      Left = 206
      Top = 11
      Width = 35
      Height = 13
      AutoSize = False
    end
    object KatNameEdit: TEdit
      Left = 54
      Top = 32
      Width = 181
      Height = 19
      TabOrder = 0
      OnChange = KatBeschrEdiChange
    end
    object AddArtBtn: TButton
      Left = 126
      Top = 226
      Width = 109
      Height = 25
      Caption = 'Artikel hinzuf'#252'gen'
      TabOrder = 1
      OnClick = AddArtBtnClick
    end
    object DelArtBtn: TButton
      Left = 126
      Top = 256
      Width = 109
      Height = 25
      Caption = 'Artikel entfernen'
      TabOrder = 2
      OnClick = DelArtBtnClick
    end
    object KatImageEdit: TEdit
      Left = 54
      Top = 56
      Width = 161
      Height = 19
      TabOrder = 3
      OnChange = KatBeschrEdiChange
    end
    object KatBeschrEdi: TMemo
      Left = 54
      Top = 80
      Width = 181
      Height = 140
      ScrollBars = ssVertical
      TabOrder = 4
      OnChange = KatBeschrEdiChange
    end
    object KatSavebtn: TButton
      Left = 10
      Top = 256
      Width = 109
      Height = 25
      Caption = #196'nd. speichern'
      Enabled = False
      TabOrder = 5
      OnClick = KatSavebtnClick
    end
    object MakeKatBtn: TButton
      Left = 10
      Top = 226
      Width = 109
      Height = 25
      Caption = 'Kategorie hinzuf'#252'gen'
      TabOrder = 6
      OnClick = MakeKatBtnClick
    end
  end
  object KatTV: TTreeView
    Left = 0
    Top = 0
    Width = 245
    Height = 289
    Hint = 'Neue, L'#246'schen '#252'ber rechte Maustaste, Verschieben per Drag&Drop'
    Align = alClient
    Color = 14680063
    DragMode = dmAutomatic
    HideSelection = False
    Indent = 15
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnChange = KatTVChange
    OnChanging = KatTVChanging
    OnCustomDrawItem = KatTVCustomDrawItem
    OnDragDrop = KatTVDragDrop
    OnDragOver = KatTVDragOver
    OnEditing = KatTVEditing
    OnMouseDown = KatTVMouseUp
  end
  object KatQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      
        'select ARTIKEL_KAT.*, COUNT(*)-1 as ANZ, ARTIKEL_TO_KAT.ARTIKEL_' +
        'ID from ARTIKEL_KAT'
      
        'left outer join ARTIKEL_TO_KAT on ARTIKEL_TO_KAT.KAT_ID=ARTIKEL_' +
        'KAT.ID'
      'where ARTIKEL_KAT.SHOP_ID=:SHOP_ID and ARTIKEL_KAT.DEL_FLAG='#39'N'#39' '
      'group by ARTIKEL_KAT.ID '
      'order by ARTIKEL_KAT.NAME')
    Params = <
      item
        DataType = ftInteger
        Name = 'SHOP_ID'
        ParamType = ptInput
        Value = '1'
      end>
    Left = 72
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SHOP_ID'
        ParamType = ptInput
        Value = '1'
      end>
    object KatQuerySHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Required = True
    end
    object KatQueryID: TIntegerField
      FieldName = 'ID'
    end
    object KatQueryTOP_ID: TIntegerField
      FieldName = 'TOP_ID'
      Required = True
    end
    object KatQueryARTIKEL_ID: TIntegerField
      FieldName = 'ARTIKEL_ID'
      Required = True
    end
    object KatQueryNAME: TStringField
      FieldName = 'NAME'
      Size = 250
    end
    object KatQueryANZ: TLargeintField
      FieldName = 'ANZ'
    end
    object KatQueryCHANGE_FLAG: TBooleanField
      FieldName = 'CHANGE_FLAG'
      Required = True
    end
    object KatQueryBESCHREIBUNG: TMemoField
      FieldName = 'BESCHREIBUNG'
      BlobType = ftMemo
    end
    object KatQueryIMAGE: TStringField
      FieldName = 'IMAGE'
      Size = 250
    end
    object KatQuerySORT_NUM: TIntegerField
      FieldName = 'SORT_NUM'
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 168
    Top = 224
    object neuenHaupteintragerstellen1: TMenuItem
      Caption = 'neuen Haupteintrag erstellen'
      OnClick = neuenHaupteintragerstellen1Click
    end
    object neuenUntereintragerstellen1: TMenuItem
      Caption = 'neuen Untereintrag erstellen'
      OnClick = neuenUntereintragerstellen1Click
    end
    object ItemToTop: TMenuItem
      Caption = 'Eintrag auf oberste Ebene verschieben'
      Enabled = False
      OnClick = ItemToTopClick
    end
    object Eintragloeschen1: TMenuItem
      Caption = 'Eintrag l'#246'schen'
      OnClick = Eintragloeschen1Click
    end
  end
  object ArtToKat: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from ARTIKEL_TO_KAT '
      
        'where ARTIKEL_ID=:ARTIKEL_ID and SHOP_ID=:SHOP_ID and DEL_FLAG='#39 +
        'N'#39)
    Params = <
      item
        DataType = ftInteger
        Name = 'ARTIKEL_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SHOP_ID'
        ParamType = ptInput
        Value = '1'
      end>
    Left = 72
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ARTIKEL_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SHOP_ID'
        ParamType = ptInput
        Value = '1'
      end>
    object ArtToKatSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
    end
    object ArtToKatARTIKEL_ID: TIntegerField
      FieldName = 'ARTIKEL_ID'
      Required = True
    end
    object ArtToKatKAT_ID: TIntegerField
      FieldName = 'KAT_ID'
      Required = True
    end
    object ArtToKatDEL_FLAG: TBooleanField
      FieldName = 'DEL_FLAG'
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ZMySqlQuery1
    Left = 160
    Top = 152
  end
  object ZMySqlQuery1: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from ARTIKEL_KAT '
      'order by TOP_ID, SORT_NUM, ID')
    Params = <>
    Left = 160
    Top = 96
  end
end
