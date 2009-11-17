object RabGrpForm: TRabGrpForm
  Left = 413
  Top = 191
  HelpContext = 110050
  BorderStyle = bsDialog
  Caption = 'Rabattgruppen'
  ClientHeight = 348
  ClientWidth = 613
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
    Top = 329
    Width = 613
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 304
    Width = 613
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object DBNavigator2: TDBNavigator
      Left = 6
      Top = 2
      Width = 240
      Height = 21
      DataSource = KunRGDS
      Flat = True
      TabOrder = 0
    end
  end
  object LiefRGGrid: TOFDBGrid
    Left = 0
    Top = 19
    Width = 613
    Height = 145
    Align = alTop
    DataSource = LiefRGDS
    DefaultDrawing = False
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
        FieldName = 'RABGRP_ID'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MIN_MENGE'
        Title.Caption = 'Mind.Menge'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LIEF_RABGRP'
        Title.Caption = 'Lief.-RG'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RABATT1'
        Title.Caption = 'Rab.1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RABATT2'
        Title.Caption = 'Rab.2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RABATT3'
        Title.Caption = 'Rab.3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BESCHREIBUNG'
        Title.Caption = 'Beschreibung'
        Width = 366
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 19
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = 5
      Top = 2
      Width = 127
      Height = 13
      Caption = 'Lieferanten-Rabattgruppen'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 164
    Width = 613
    Height = 53
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object Label2: TLabel
      Left = 5
      Top = 36
      Width = 232
      Height = 13
      Caption = 'zugeordnete (abh'#228'ngige) Kunden-Rabattgruppen'
    end
    object DBNavigator1: TDBNavigator
      Left = 6
      Top = 2
      Width = 240
      Height = 21
      DataSource = LiefRGDS
      Flat = True
      TabOrder = 0
    end
  end
  object KunRGGrid: TOFDBGrid
    Left = 0
    Top = 217
    Width = 613
    Height = 87
    Align = alClient
    DataSource = KunRGDS
    DefaultDrawing = False
    TabOrder = 5
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
        FieldName = 'RABGRP_ID'
        ReadOnly = True
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MIN_MENGE'
        Title.Caption = 'Mind.Menge'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LIEF_RABGRP'
        Title.Caption = 'PL / VK'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RABATT1'
        Title.Caption = 'Rab.1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RABATT2'
        Title.Caption = 'Rab.2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RABATT3'
        Title.Caption = 'Rab.3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BESCHREIBUNG'
        Title.Caption = 'Beschreibung'
        Width = 366
        Visible = True
      end>
  end
  object LiefRGDS: TDataSource
    DataSet = LiefRabGrp
    Left = 440
    Top = 72
  end
  object KunRGDS: TDataSource
    DataSet = KunRabGrp
    Left = 440
    Top = 232
  end
  object LiefRabGrp: TZQuery
    Connection = DM1.DB1
    AfterOpen = LiefRabGrpAfterScroll
    AfterScroll = LiefRabGrpAfterScroll
    BeforePost = LiefRabGrpBeforePost
    AfterPost = LiefRabGrpAfterScroll
    SQL.Strings = (
      'select * from RABATTGRUPPEN'
      'where RABGRP_ID!='#39'-'#39' and RABGRP_TYP=5'
      'order by RABGRP_ID')
    Params = <>
    Left = 340
    Top = 75
    object LiefRabGrpRABGRP_ID: TStringField
      DisplayWidth = 10
      FieldName = 'RABGRP_ID'
      Required = True
      Size = 10
    end
    object LiefRabGrpRABGRP_TYP: TIntegerField
      FieldName = 'RABGRP_TYP'
      Required = True
    end
    object LiefRabGrpMIN_MENGE: TIntegerField
      FieldName = 'MIN_MENGE'
      Required = True
      DisplayFormat = ',#0.0'
      EditFormat = '0'
    end
    object LiefRabGrpLIEF_RABGRP: TIntegerField
      FieldName = 'LIEF_RABGRP'
      Required = True
      DisplayFormat = '00'
    end
    object LiefRabGrpRABATT1: TFloatField
      DisplayWidth = 5
      FieldName = 'RABATT1'
      Required = True
      DisplayFormat = '0.0"%"'
      EditFormat = '0'
    end
    object LiefRabGrpRABATT2: TFloatField
      DisplayWidth = 5
      FieldName = 'RABATT2'
      Required = True
      DisplayFormat = '0.0"%"'
      EditFormat = '0'
    end
    object LiefRabGrpRABATT3: TFloatField
      DisplayWidth = 5
      FieldName = 'RABATT3'
      Required = True
      DisplayFormat = '0.0"%"'
      EditFormat = '0'
    end
    object LiefRabGrpADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
    end
    object LiefRabGrpBESCHREIBUNG: TStringField
      DisplayWidth = 52
      FieldName = 'BESCHREIBUNG'
      Size = 100
    end
  end
  object KunRabGrp: TZQuery
    Connection = DM1.DB1
    OnNewRecord = KunRabGrpNewRecord
    SQL.Strings = (
      'select * from RABATTGRUPPEN'
      'where RABGRP_ID!='#39'-'#39' and RABGRP_TYP=3 and RABGRP_ID=:RABGRP_ID'
      'order by RABGRP_ID')
    Params = <
      item
        DataType = ftString
        Name = 'RABGRP_ID'
        ParamType = ptInput
      end>
    Left = 340
    Top = 235
    ParamData = <
      item
        DataType = ftString
        Name = 'RABGRP_ID'
        ParamType = ptInput
      end>
    object KunRabGrpRABGRP_ID: TStringField
      FieldName = 'RABGRP_ID'
      Required = True
      Size = 10
    end
    object KunRabGrpRABGRP_TYP: TIntegerField
      FieldName = 'RABGRP_TYP'
      Required = True
    end
    object KunRabGrpMIN_MENGE: TIntegerField
      FieldName = 'MIN_MENGE'
      Required = True
      DisplayFormat = ',#0.0'
      EditFormat = '0'
    end
    object KunRabGrpLIEF_RABGRP: TIntegerField
      FieldName = 'LIEF_RABGRP'
      Required = True
      DisplayFormat = '"VK"-0'
      EditFormat = '0'
      MaxValue = 5
      MinValue = 1
    end
    object KunRabGrpRABATT1: TFloatField
      DisplayWidth = 5
      FieldName = 'RABATT1'
      Required = True
      DisplayFormat = '0.0"%"'
      EditFormat = '0'
    end
    object KunRabGrpRABATT2: TFloatField
      DisplayWidth = 5
      FieldName = 'RABATT2'
      Required = True
      DisplayFormat = '0.0"%"'
      EditFormat = '0'
    end
    object KunRabGrpRABATT3: TFloatField
      DisplayWidth = 5
      FieldName = 'RABATT3'
      Required = True
      DisplayFormat = '0.0"%"'
      EditFormat = '0'
    end
    object KunRabGrpADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
    end
    object KunRabGrpBESCHREIBUNG: TStringField
      FieldName = 'BESCHREIBUNG'
      Size = 250
    end
  end
end
