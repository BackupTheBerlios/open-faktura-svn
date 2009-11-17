object HerstellerForm: THerstellerForm
  Left = 370
  Top = 249
  BorderStyle = bsDialog
  Caption = 'Hersteller'
  ClientHeight = 254
  ClientWidth = 547
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = '110100'
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 547
    Height = 254
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object ListeGB: TOFGroupBox
      Left = 0
      Top = 0
      Width = 254
      Height = 254
      Align = alLeft
      Caption = 'Liste'
      Color = 14680063
      Ctl3D = False
      FrameColor = clBtnFace
      TitleColor = 14680063
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 0
      object HerstellerGrid: TOFDBGrid
        Left = 8
        Top = 21
        Width = 238
        Height = 225
        Align = alClient
        BorderStyle = bsNone
        DataSource = HerstellerDS
        DefaultDrawing = False
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
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
            FieldName = 'HERSTELLER_ID'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HERSTELLER_NAME'
            Title.Caption = 'Name'
            Width = 177
            Visible = True
          end>
      end
    end
    object CaoGroupBox7: TOFGroupBox
      Left = 254
      Top = 0
      Width = 293
      Height = 254
      Align = alClient
      Caption = 'Details'
      Color = 14680063
      Ctl3D = False
      FrameColor = clBtnFace
      TitleColor = 14680063
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 1
      object Label76: TLabel
        Left = 8
        Top = 115
        Width = 77
        Height = 13
        AutoSize = False
        Caption = 'Sprache:'
      end
      object Label77: TLabel
        Left = 8
        Top = 149
        Width = 77
        Height = 13
        AutoSize = False
        Caption = 'Hersteller-URL:'
      end
      object Label1: TLabel
        Left = 8
        Top = 172
        Width = 77
        Height = 13
        AutoSize = False
        Caption = 'Clicks:'
      end
      object Label2: TLabel
        Left = 8
        Top = 29
        Width = 77
        Height = 13
        AutoSize = False
        Caption = 'Name:'
      end
      object Label3: TLabel
        Left = 8
        Top = 53
        Width = 77
        Height = 13
        AutoSize = False
        Caption = 'Bild-URL:'
      end
      object ProdImageUploadBtn: TSpeedButton
        Left = 261
        Top = 49
        Width = 23
        Height = 19
        Hint = 'Hersteller-Bild hochladen'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        OnClick = ProdImageUploadBtnClick
      end
      object AddBtn: TSpeedButton
        Left = 168
        Top = 214
        Width = 34
        Height = 29
        Hint = 'Hersteller hinzuf'#252'gen'
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          700077777777777770007777700077777000777770C077777000777770C07777
          7000770000C000077000770CCCCCCC077000770000C000077000777770C07777
          7000777770C07777700077777000777770007777777777777000777777777777
          7000}
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        OnClick = AddBtnClick
      end
      object SaveBtn: TSpeedButton
        Left = 210
        Top = 214
        Width = 34
        Height = 29
        Hint = #196'nderungen speichern'
        Enabled = False
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
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        OnClick = SaveBtnClick
      end
      object AbortBtn: TSpeedButton
        Left = 244
        Top = 214
        Width = 34
        Height = 29
        Hint = #196'nderungen verwerfen'
        Enabled = False
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333199833333183333333388F333333F3333000033319998333199833333
          38F38F333F88F33300003331999983199998333338F338F3F8338F3300003333
          199998999998333338F3338F833338F3000033333199999999833333338F3338
          3333F8330000333333199999983333333338F333333F83330000333333399999
          8333333333338F3333383333000033333331999983333333333338F333833333
          00003333331999998333333333333833338F3333000033333199989998333333
          33338333338F333300003333199983199983333333383338F338F33300003333
          1998333199983333338F33838F338F33000033333193333319993333338FF833
          38F338F300003333333333333191333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        OnClick = AbortBtnClick
      end
      object DBText1: TDBText
        Left = 88
        Top = 172
        Width = 49
        Height = 17
        DataField = 'URL_CLICKED'
        DataSource = HerstInfoDS
      end
      object DBText2: TDBText
        Left = 164
        Top = 172
        Width = 118
        Height = 17
        Alignment = taRightJustify
        DataField = 'DATE_LAST_CLICK'
        DataSource = HerstInfoDS
      end
      object Bevel1: TBevel
        Tag = 1
        Left = 8
        Top = 99
        Width = 277
        Height = 2
      end
      object Bevel2: TBevel
        Tag = 1
        Left = 8
        Top = 199
        Width = 277
        Height = 2
      end
      object HerstNameEdi: TDBEdit
        Tag = 1
        Left = 88
        Top = 25
        Width = 197
        Height = 19
        DataField = 'HERSTELLER_NAME'
        DataSource = HerstellerDS
        TabOrder = 0
      end
      object HerstInfoUrlEdi: TDBEdit
        Tag = 1
        Left = 88
        Top = 145
        Width = 197
        Height = 19
        DataField = 'HERSTELLER_URL'
        DataSource = HerstInfoDS
        TabOrder = 1
      end
      object DBNavigator1: TDBNavigator
        Left = 12
        Top = 214
        Width = 148
        Height = 29
        DataSource = HerstellerDS
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 88
        Top = 49
        Width = 169
        Height = 19
        DataField = 'HERSTELLER_IMAGE'
        DataSource = HerstellerDS
        TabOrder = 3
      end
      object ShopDelCB: TDBCheckBox
        Left = 88
        Top = 72
        Width = 197
        Height = 17
        Caption = 'beim n'#228'chsten Update l'#246'schen'
        DataField = 'DEL_FLAG'
        DataSource = HerstellerDS
        TabOrder = 4
        ValueChecked = 'Wahr'
        ValueUnchecked = 'Falsch'
      end
      object SprachLB: TVolgaDBEdit
        Tag = 1
        Left = 88
        Top = 112
        Width = 197
        Height = 19
        AutoDropDown = True
        ButtonWidth = 18
        ComboProps.ComboItems.Strings = (
          'Deutsch'
          'Englisch'
          'Spanisch')
        ComboProps.ComboValues.Strings = (
          '1'
          '2'
          '3')
        Ctl3D = False
        DialogStyle = vdsCombo
        ParentCtl3D = False
        ReadOnly = True
        Style = vcsDropDownList
        TabOrder = 5
        OnChange = SprachLBChange
      end
    end
  end
  object HerstInfoTab: TZQuery
    Connection = DM1.DB1
    BeforePost = HerstInfoTabBeforePost
    AfterPost = HerstInfoTabAfterPost
    SQL.Strings = (
      'select * from HERSTELLER_INFO'
      'where SHOP_ID=:SID and HERSTELLER_ID=:HID and SPRACHE_ID=:SPID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'SID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SPID'
        ParamType = ptUnknown
      end>
    Left = 64
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SPID'
        ParamType = ptUnknown
      end>
    object HerstInfoTabSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
    end
    object HerstInfoTabHERSTELLER_ID: TIntegerField
      FieldName = 'HERSTELLER_ID'
    end
    object HerstInfoTabSPRACHE_ID: TIntegerField
      FieldName = 'SPRACHE_ID'
    end
    object HerstInfoTabHERSTELLER_URL: TStringField
      FieldName = 'HERSTELLER_URL'
      Required = True
      Size = 255
    end
    object HerstInfoTabURL_CLICKED: TIntegerField
      FieldName = 'URL_CLICKED'
      Required = True
      DisplayFormat = ',#0'
    end
    object HerstInfoTabDATE_LAST_CLICK: TDateTimeField
      FieldName = 'DATE_LAST_CLICK'
      DisplayFormat = 'dd.mm.yyyy'
    end
  end
  object HerstInfoDS: TDataSource
    DataSet = HerstInfoTab
    OnDataChange = HerstellerDSDataChange
    Left = 136
    Top = 128
  end
  object HerstellerTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = HerstellerTabAfterScroll
    AfterScroll = HerstellerTabAfterScroll
    BeforePost = HerstellerTabBeforePost
    AfterPost = HerstellerTabAfterScroll
    BeforeDelete = HerstellerTabBeforeDelete
    AfterDelete = HerstellerTabAfterScroll
    SQL.Strings = (
      'select * from HERSTELLER'
      'where SHOP_ID=:SID'
      'order by HERSTELLER_NAME')
    Params = <
      item
        DataType = ftUnknown
        Name = 'SID'
        ParamType = ptUnknown
      end>
    Left = 65
    Top = 81
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SID'
        ParamType = ptUnknown
      end>
    object HerstellerTabSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Visible = False
    end
    object HerstellerTabHERSTELLER_ID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'HERSTELLER_ID'
      Visible = False
      DisplayFormat = '0000'
    end
    object HerstellerTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Visible = False
    end
    object HerstellerTabHERSTELLER_NAME: TStringField
      DisplayLabel = 'Hersteller-Name'
      FieldName = 'HERSTELLER_NAME'
      Size = 32
    end
    object HerstellerTabHERSTELLER_IMAGE: TStringField
      FieldName = 'HERSTELLER_IMAGE'
      Size = 64
    end
    object HerstellerTabLAST_CHANGE: TDateTimeField
      FieldName = 'LAST_CHANGE'
      Visible = False
    end
    object HerstellerTabSHOP_DATE_ADDED: TDateTimeField
      FieldName = 'SHOP_DATE_ADDED'
      Visible = False
    end
    object HerstellerTabSHOP_DATE_CHANGE: TDateTimeField
      FieldName = 'SHOP_DATE_CHANGE'
      Visible = False
    end
    object HerstellerTabCHANGE_FLAG: TBooleanField
      FieldName = 'CHANGE_FLAG'
      Required = True
    end
    object HerstellerTabDEL_FLAG: TBooleanField
      FieldName = 'DEL_FLAG'
      Required = True
    end
  end
  object HerstellerDS: TDataSource
    DataSet = HerstellerTab
    OnStateChange = HerstellerDSStateChange
    OnDataChange = HerstellerDSDataChange
    Left = 136
    Top = 81
  end
end
