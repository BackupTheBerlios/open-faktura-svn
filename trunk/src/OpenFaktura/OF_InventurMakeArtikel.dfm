object InventurMakeArtikelForm: TInventurMakeArtikelForm
  Left = 336
  Top = 301
  BorderStyle = bsToolWindow
  Caption = 'Inventur wird erstellt ...'
  ClientHeight = 107
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 361
    Height = 68
    AutoSize = False
    Caption = 
      'Die Artikel-SOLL-Daten werden jetzt erstellt.'#13#10'Bitte haben Sie e' +
      'twas Geduld, '#13#10'dieser Vorgang kann einige Minuten in Anspruch ne' +
      'hmen ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 256
    Top = 84
    Width = 115
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '-'
  end
  object PB1: TProgressBar
    Left = 7
    Top = 82
    Width = 242
    Height = 16
    Smooth = True
    TabOrder = 0
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 96
    Top = 24
  end
  object Query1: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select ARTIKEL_ID, MENGE_DIFF, STATUS from ARTIKEL_INVENTUR '
      'where INVENTUR_ID=2')
    Params = <>
    Left = 40
    Top = 24
    object Query1ARTIKEL_ID: TIntegerField
      FieldName = 'ARTIKEL_ID'
      Required = True
    end
    object Query1MENGE_DIFF: TFloatField
      FieldName = 'MENGE_DIFF'
      Required = True
    end
    object Query1STATUS: TIntegerField
      FieldName = 'STATUS'
    end
  end
end
