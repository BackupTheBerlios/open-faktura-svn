object ShopSetupForm: TShopSetupForm
  Left = 321
  Top = 169
  BorderStyle = bsDialog
  Caption = 'Shop-Setup'
  ClientHeight = 248
  ClientWidth = 421
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
  object NavPan: TPanel
    Left = 0
    Top = 217
    Width = 421
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 0
    object ShopSaveBtn: TSpeedButton
      Left = 280
      Top = 2
      Width = 105
      Height = 26
      Caption = 'Speichern'
      Flat = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888000088877777777777777778000088000000000000000778000080BF
        B0FFFFFFF0BFB078000080FBF0F00FFFF0FBF078000080BFB0F77FFFF0BFB078
        000080FBF0FFFFFFF0FBF078000080BFBF0000000FBFB078000080FBFBFBFBFB
        FBFBF078000080BFBFBFBFBFBFBFB078000080FBFBFBFBFBFBFBF078000080BF
        BFBFBFBFBFBFB078000080FBF000000000FBF078000080BF0FFFFFFFF0BFB078
        000080FB0FCCCCCCF0FBF078000080BF0FFFFFFFF0BFB078000080FB0FCCCCCC
        F0F0F078000080BF0FFFFFFFF0BFB08800008800000000000000088800008888
        88888888888888880000}
      OnClick = ShopSaveBtnClick
    end
    object Nav1: TDBNavigator
      Left = 2
      Top = 2
      Width = 264
      Height = 27
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alLeft
      Flat = True
      TabOrder = 0
    end
  end
  object PC1: TPageControl
    Left = 0
    Top = 0
    Width = 421
    Height = 217
    ActivePage = AllgTS
    Align = alClient
    TabOrder = 1
    OnChange = PC1Change
    object AllgTS: TTabSheet
      Tag = 1
      Caption = 'Allgemein'
      ImageIndex = 8
      object Label1: TLabel
        Left = 5
        Top = 162
        Width = 237
        Height = 13
        Caption = 'Warengruppe f'#252'r importierte Artikel aus dem Shop:'
      end
      object DefDebNumLab: TLabel
        Left = 5
        Top = 126
        Width = 64
        Height = 13
        Caption = 'Debitorennr. :'
      end
      object Label2: TLabel
        Left = 5
        Top = 102
        Width = 57
        Height = 13
        Caption = 'Shop Preis :'
      end
      object Label4: TLabel
        Left = 180
        Top = 126
        Width = 90
        Height = 13
        AutoSize = False
        Caption = 'neuer Orderstatus:'
      end
      object Label5: TLabel
        Left = 7
        Top = 30
        Width = 42
        Height = 13
        Caption = 'Software'
      end
      object UseShopCB: TCheckBox
        Left = 5
        Top = 9
        Width = 159
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Shopfunktionen aktiv'
        TabOrder = 0
      end
      object StatusUpdateSM_CB: TCheckBox
        Left = 180
        Top = 81
        Width = 228
        Height = 17
        Alignment = taLeftJustify
        Caption = 'EMail beim Statusupdate versenden'
        TabOrder = 4
      end
      object ShopWgr: TComboBox
        Left = 272
        Top = 158
        Width = 138
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 7
      end
      object BruttoCB: TCheckBox
        Left = 4
        Top = 50
        Width = 160
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Brutto-Shop'
        TabOrder = 2
      end
      object UpdateMengeCB: TCheckBox
        Left = 180
        Top = 46
        Width = 228
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Menge aktualisieren (CAO->SHOP)'
        TabOrder = 5
      end
      object UseOrderIDCB: TCheckBox
        Left = 180
        Top = 9
        Width = 228
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Bestellnummer (OrderID) weiterverwenden'
        TabOrder = 3
      end
      object DefDebNum: TJvSpinEdit
        Left = 76
        Top = 122
        Width = 90
        Height = 21
        MaxValue = 60000.000000000000000000
        MaxLength = 5
        TabOrder = 9
      end
      object ImportMengeCB: TCheckBox
        Left = 180
        Top = 64
        Width = 228
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Menge importieren (SHOP->CAO)'
        TabOrder = 6
      end
      object ShopPreis: TComboBox
        Left = 76
        Top = 98
        Width = 90
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 8
        Items.Strings = (
          'sep. Shoppreis'
          'VK1'
          'VK2'
          'VK3'
          'VK4'
          'VK5')
      end
      object ChangeOrderstatusCB: TCheckBox
        Left = 180
        Top = 100
        Width = 228
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Orderstatus nach Import '#228'ndern'
        TabOrder = 10
        OnClick = ChangeOrderstatusCBClick
      end
      object NewOrderStatusLB: TComboBox
        Left = 272
        Top = 122
        Width = 138
        Height = 21
        Ctl3D = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 11
      end
      object SWCB: TComboBox
        Left = 76
        Top = 26
        Width = 90
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'osCommerce'
          'XT-Commerce')
      end
      object UseCusomerIDCB: TCheckBox
        Left = 180
        Top = 26
        Width = 228
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Kundennummer (CustomersID) weiterverw.'
        TabOrder = 12
      end
    end
    object UrlTS: TTabSheet
      Tag = 2
      Caption = 'URL/Proxy'
      ImageIndex = 10
      object Label50: TLabel
        Left = 5
        Top = 131
        Width = 63
        Height = 13
        Caption = 'Proxy-Server:'
      end
      object Label48: TLabel
        Left = 277
        Top = 131
        Width = 51
        Height = 13
        Caption = 'Proxy-Port:'
      end
      object Label49: TLabel
        Left = 5
        Top = 163
        Width = 54
        Height = 13
        Caption = 'Proxy-User:'
      end
      object Label51: TLabel
        Left = 213
        Top = 163
        Width = 71
        Height = 13
        Caption = 'Proxy-Pa'#223'wort:'
      end
      object Bevel1: TBevel
        Left = 4
        Top = 98
        Width = 400
        Height = 10
        Shape = bsBottomLine
      end
      object Label39: TLabel
        Left = 5
        Top = 12
        Width = 104
        Height = 13
        Caption = 'URL zum Importscript:'
      end
      object Label40: TLabel
        Left = 5
        Top = 36
        Width = 110
        Height = 13
        Caption = 'URL zum Updatescript:'
      end
      object Label37: TLabel
        Left = 4
        Top = 70
        Width = 71
        Height = 13
        Caption = 'Benutzername:'
      end
      object Label38: TLabel
        Left = 244
        Top = 70
        Width = 42
        Height = 13
        Caption = 'Pa'#223'wort:'
      end
      object Label3: TLabel
        Left = 16
        Top = 100
        Width = 32
        Height = 13
        Caption = ' Proxy '
      end
      object ProxyServer: TEdit
        Left = 80
        Top = 128
        Width = 193
        Height = 21
        TabOrder = 4
      end
      object ProxyUser: TEdit
        Left = 80
        Top = 160
        Width = 121
        Height = 21
        TabOrder = 6
      end
      object ProxyPass: TEdit
        Left = 304
        Top = 160
        Width = 101
        Height = 21
        PasswordChar = '*'
        TabOrder = 7
      end
      object ProxyPort: TJvSpinEdit
        Left = 338
        Top = 128
        Width = 67
        Height = 21
        MaxValue = 65535.000000000000000000
        TabOrder = 5
      end
      object ShopImportURLEdit: TEdit
        Left = 121
        Top = 8
        Width = 284
        Height = 21
        Hint = 'z.B. http://www.IhrName.de/shop/admin/xml_export.php'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object ShopUpdateURLEdi: TEdit
        Left = 121
        Top = 32
        Width = 284
        Height = 21
        Hint = 'z.B. http://www.IhrName.de/shop/admin/cao_update.php'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object ShopUserEdit: TEdit
        Left = 122
        Top = 64
        Width = 103
        Height = 21
        TabOrder = 2
      end
      object ShopPWEdit: TEdit
        Left = 312
        Top = 64
        Width = 92
        Height = 21
        PasswordChar = '*'
        TabOrder = 3
      end
    end
    object TabSheet1: TTabSheet
      Tag = 3
      Caption = 'Order-Status'
      ImageIndex = 2
      object Label46: TLabel
        Left = 5
        Top = 6
        Width = 91
        Height = 13
        Caption = 'Shop-Orderstadien:'
      end
      object Label47: TLabel
        Left = 5
        Top = 50
        Width = 109
        Height = 97
        AutoSize = False
        Caption = 
          'Hier bitte die Stadien erfassen, genau wie Sie im Shop deklarier' +
          't sind ...'
        WordWrap = True
      end
      object ShopOrderstatusGrid: TOFDBGrid
        Left = 123
        Top = 5
        Width = 283
        Height = 178
        DefaultDrawing = False
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
        TabOrder = 0
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
        RowColor1 = 12255087
        RowColor2 = clWindow
        ShowTitleEllipsis = True
        DefaultRowHeight = 17
        EditColor = clBlack
        Columns = <
          item
            Expanded = False
            FieldName = 'ORDERSTATUS_ID'
            Title.Caption = 'ID'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LANGBEZ'
            Title.Caption = 'Beschreibung'
            Width = 210
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Tag = 4
      Caption = 'Lieferart'
      ImageIndex = 3
      object LiefartGrid: TOFDBGrid
        Left = 3
        Top = 5
        Width = 403
        Height = 151
        Ctl3D = True
        DataSource = ShopLiefArtDS
        DefaultDrawing = False
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
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
        RowColor1 = 12255087
        RowColor2 = clWindow
        ShowTitleEllipsis = True
        DefaultRowHeight = 17
        EditColor = clBlack
        Columns = <
          item
            Expanded = False
            FieldName = 'ZahlartStr'
            Title.Caption = 'CAO-Lieferart'
            Width = 143
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHOP_CLASS'
            Title.Caption = 'Shop-Class (shipping_class)'
            Width = 226
            Visible = True
          end>
      end
      object DBEdit2: TDBEdit
        Left = 168
        Top = 165
        Width = 239
        Height = 21
        DataField = 'SHOP_CLASS'
        DataSource = ShopLiefArtDS
        TabOrder = 1
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 4
        Top = 165
        Width = 145
        Height = 21
        DataField = 'ID'
        DataSource = ShopLiefArtDS
        KeyField = 'LIEF_ID'
        ListField = 'LANGBEZ'
        ListSource = DM1.LiefArtDS
        TabOrder = 2
      end
    end
    object TabSheet3: TTabSheet
      Tag = 5
      Caption = 'Zahlart'
      ImageIndex = 4
      object ZahlartGrid: TOFDBGrid
        Left = 3
        Top = 5
        Width = 403
        Height = 151
        DataSource = ShopZahlArtDS
        DefaultDrawing = False
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete]
        ReadOnly = True
        TabOrder = 0
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
        RowColor1 = 12255087
        RowColor2 = clWindow
        ShowTitleEllipsis = True
        DefaultRowHeight = 17
        EditColor = clBlack
        Columns = <
          item
            Expanded = False
            FieldName = 'ZahlartStr'
            Title.Caption = 'CAO-Zahlart'
            Width = 143
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHOP_CLASS'
            Title.Caption = 'Shop-Class (payment_class)'
            Width = 226
            Visible = True
          end>
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 4
        Top = 165
        Width = 145
        Height = 21
        DataField = 'ID'
        DataSource = ShopZahlArtDS
        KeyField = 'ZAHL_ID'
        ListField = 'LANGBEZ'
        ListSource = DM1.ZahlArtDS
        TabOrder = 1
      end
      object DBEdit1: TDBEdit
        Left = 168
        Top = 165
        Width = 238
        Height = 21
        DataField = 'SHOP_CLASS'
        DataSource = ShopZahlArtDS
        TabOrder = 2
      end
    end
  end
  object ShopZahlArt: TZQuery
    Connection = DM1.DB1
    BeforePost = ShopZahlArtBeforePost
    SQL.Strings = (
      'select MAINKEY, NAME as SHOP_CLASS, VAL_INT as ID'
      'from REGISTRY '
      'where MAINKEY='#39'SHOP\\ZAHLART_MAP'#39' and Upper(NAME) !='#39'DEFAULT'#39
      'order by NAME')
    Params = <>
    Left = 79
    Top = 191
    object ShopZahlArtMAINKEY: TStringField
      FieldName = 'MAINKEY'
      Size = 255
    end
    object ShopZahlArtSHOP_CLASS: TStringField
      FieldName = 'SHOP_CLASS'
      Required = True
      Size = 255
    end
    object ShopZahlArtID: TIntegerField
      FieldName = 'ID'
      LookupDataSet = DM1.ZahlartTab
      LookupKeyFields = 'ZAHL_ID'
      LookupResultField = 'TEXT'
      Required = True
    end
    object ShopZahlArtZahlartStr: TStringField
      FieldKind = fkLookup
      FieldName = 'ZahlartStr'
      LookupDataSet = DM1.ZahlartTab
      LookupKeyFields = 'ZAHL_ID'
      LookupResultField = 'LANGBEZ'
      KeyFields = 'ID'
      Size = 30
      Lookup = True
    end
  end
  object ShopZahlArtDS: TDataSource
    DataSet = ShopZahlArt
    Left = 135
    Top = 191
  end
  object ShopLiefArt: TZQuery
    Connection = DM1.DB1
    BeforePost = ShopLiefArtBeforePost
    SQL.Strings = (
      'select MAINKEY, NAME as SHOP_CLASS, VAL_INT as ID'
      'from REGISTRY '
      'where MAINKEY='#39'SHOP\\LIEFART_MAP'#39' and Upper(NAME) !='#39'DEFAULT'#39
      'order by NAME')
    Params = <>
    Left = 175
    Top = 191
    object ShopLiefArtMainKey: TStringField
      FieldName = 'MAINKEY'
      Size = 255
    end
    object StringField2: TStringField
      FieldName = 'SHOP_CLASS'
      Required = True
      Size = 255
    end
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      LookupDataSet = DM1.ZahlartTab
      LookupKeyFields = 'ZAHL_ID'
      LookupResultField = 'TEXT'
      Required = True
    end
    object StringField3: TStringField
      FieldKind = fkLookup
      FieldName = 'ZahlartStr'
      LookupDataSet = DM1.LiefArtTab
      LookupKeyFields = 'LIEF_ID'
      LookupResultField = 'LANGBEZ'
      KeyFields = 'ID'
      Size = 30
      Lookup = True
    end
  end
  object ShopLiefArtDS: TDataSource
    DataSet = ShopLiefArt
    Left = 215
    Top = 191
  end
end
