object SNAuswahlForm: TSNAuswahlForm
  Left = 348
  Top = 187
  Width = 413
  Height = 290
  HelpContext = 100200
  Caption = 'Seriennummern ausw'#228'hlen'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SB1: TStatusBar
    Left = 0
    Top = 244
    Width = 405
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 405
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 3
      Top = 2
      Width = 47
      Height = 13
      Caption = 'Artikelnr. :'
    end
    object ArtNr: TLabel
      Left = 55
      Top = 2
      Width = 119
      Height = 13
      AutoSize = False
      Caption = 'ArtNr'
    end
    object Label3: TLabel
      Left = 3
      Top = 18
      Width = 39
      Height = 13
      Caption = 'Match : '
    end
    object ArtMatch: TLabel
      Left = 55
      Top = 18
      Width = 119
      Height = 13
      AutoSize = False
      Caption = 'ArtMatch'
    end
    object ArtBez: TLabel
      Left = 172
      Top = 2
      Width = 233
      Height = 39
      AutoSize = False
      Caption = 'ArtBez'
      WordWrap = True
    end
  end
  object GridPanel: TPanel
    Left = 0
    Top = 41
    Width = 405
    Height = 174
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 1
    object MidPanel: TPanel
      Left = 185
      Top = 5
      Width = 35
      Height = 164
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object RBtn: TSpeedButton
        Left = 6
        Top = 16
        Width = 24
        Height = 22
        Flat = True
        Glyph.Data = {
          F6000000424DF60000000000000076000000280000000B000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFF0
          0000FFFFFFFFFFF00000FFF4FFFFFFF00000FFF44FFFFFF00000FFF424FFFFF0
          0000FFF4224FFFF00000FFF42224FFF00000FFF422224FF00000FFF42224FFF0
          0000FFF4224FFFF00000FFF424FFFFF00000FFF44FFFFFF00000FFF4FFFFFFF0
          0000FFFFFFFFFFF00000FFFFFFFFFFF00000FFFFFFFFFFF00000}
        OnClick = SNLagerGridDblClick
      end
      object RABtn: TSpeedButton
        Left = 6
        Top = 40
        Width = 24
        Height = 22
        Flat = True
        Glyph.Data = {
          36010000424D3601000000000000760000002800000013000000100000000100
          040000000000C0000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFF00000FFFFFFFFFFFFFFFFFFF00000FFFFFFFFFFFFFFFFFFF00000FFFF
          4FFFFFF4FFFFFFF00000FFFF44FFFFF44FFFFFF00000FFFF424FFFF424FFFFF0
          0000FFFF4224FFF4224FFFF00000FFFF42224FF42224FFF00000FFFF422224F4
          22224FF00000FFFF42224FF42224FFF00000FFFF4224FFF4224FFFF00000FFFF
          424FFFF424FFFFF00000FFFF44FFFFF44FFFFFF00000FFFF4FFFFFF4FFFFFFF0
          0000FFFFFFFFFFFFFFFFFFF00000FFFFFFFFFFFFFFFFFFF00000}
      end
      object LBtn: TSpeedButton
        Left = 6
        Top = 72
        Width = 24
        Height = 22
        Flat = True
        Glyph.Data = {
          F6000000424DF60000000000000076000000280000000B000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFF0
          0000FFFFFFFFFFF00000FFFFFFF4FFF00000FFFFFF44FFF00000FFFFF424FFF0
          0000FFFF4224FFF00000FFF42224FFF00000FF422224FFF00000FFF42224FFF0
          0000FFFF4224FFF00000FFFFF424FFF00000FFFFFF44FFF00000FFFFFFF4FFF0
          0000FFFFFFFFFFF00000FFFFFFFFFFF00000FFFFFFFFFFF00000}
        OnClick = SNPosGridDblClick
      end
      object LABtn: TSpeedButton
        Left = 6
        Top = 96
        Width = 24
        Height = 22
        Flat = True
        Glyph.Data = {
          36010000424D3601000000000000760000002800000013000000100000000100
          040000000000C0000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFF00000FFFFFFFFFFFFFFFFFFF00000FFFFFFFFFFFFFFFFFFF00000FFFF
          FFF4FFFFFF4FFFF00000FFFFFF44FFFFF44FFFF00000FFFFF424FFFF424FFFF0
          0000FFFF4224FFF4224FFFF00000FFF42224FF42224FFFF00000FF422224F422
          224FFFF00000FFF42224FF42224FFFF00000FFFF4224FFF4224FFFF00000FFFF
          F424FFFF424FFFF00000FFFFFF44FFFFF44FFFF00000FFFFFFF4FFFFFF4FFFF0
          0000FFFFFFFFFFFFFFFFFFF00000FFFFFFFFFFFFFFFFFFF00000}
        OnClick = LABtnClick
      end
    end
    object SNPosGrid: TOFDBGrid
      Left = 220
      Top = 5
      Width = 180
      Height = 164
      Align = alClient
      Ctl3D = True
      DefaultDrawing = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = SNPosGridDblClick
      OnKeyPress = SNLagerGridKeyPress
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
          FieldName = 'SERNUMMER'
          Title.Caption = 'ausgew'#228'hlte Seriennummer(n)'
          Width = 147
          Visible = True
        end>
    end
    object SNLagerGrid: TOFDBGrid
      Left = 5
      Top = 5
      Width = 180
      Height = 164
      Align = alLeft
      Ctl3D = True
      DataSource = SNLagerDS
      DefaultDrawing = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = SNLagerGridDblClick
      OnKeyPress = SNLagerGridKeyPress
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
          FieldName = 'SERNUMMER'
          Title.Caption = 'verf'#252'gbare Seriennummer(n)'
          Width = 147
          Visible = True
        end>
    end
  end
  object SchnellErfassPanel: TPanel
    Left = 0
    Top = 215
    Width = 405
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 5
      Top = 8
      Width = 81
      Height = 13
      Caption = 'Schnellerfassung'
    end
    object CloseBtn: TBitBtn
      Left = 285
      Top = 1
      Width = 116
      Height = 25
      Cancel = True
      Caption = 'S&chlie'#223'en'
      TabOrder = 0
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
    object Edit1: TEdit
      Left = 93
      Top = 5
      Width = 176
      Height = 19
      Color = 11579647
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnChange = Edit1Change
      OnKeyPress = Edit1KeyPress
    end
  end
  object SNLagerTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = SNLagerTabAfterOpen
    AfterPost = SNLagerTabAfterOpen
    SQL.Strings = (
      
        'select SN.ARTIKEL_ID, SN.SNUM_ID, SN.SERNUMMER, SN.STATUS, JPS.J' +
        'OURNAL_ID, JPS.JOURNALPOS_ID'
      'from ARTIKEL_SERNUM SN'
      'left outer JOIN JOURNALPOS_SERNUM JPS on '
      'SN.ARTIKEL_ID=JPS.ARTIKEL_ID and '
      'SN.SNUM_ID=JPS.SNUM_ID and'
      'JPS. QUELLE IN (12,13,15)'
      'where SN.ARTIKEL_ID=:AID and SN.STATUS IN ("LAGER") '
      'and JPS.SNUM_ID is NULL ')
    Params = <
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
        Value = '1'
      end>
    Left = 40
    Top = 153
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
        Value = '1'
      end>
    object SNLagerTabSERNUMMER: TStringField
      FieldName = 'SERNUMMER'
      Required = True
      Size = 255
    end
    object SNLagerTabSNUM_ID: TIntegerField
      FieldName = 'SNUM_ID'
    end
    object SNLagerTabARTIKEL_ID: TIntegerField
      FieldName = 'ARTIKEL_ID'
    end
  end
  object SNLagerDS: TDataSource
    DataSet = SNLagerTab
    Left = 104
    Top = 153
  end
end
