object ProgressForm: TProgressForm
  Left = 404
  Top = 226
  BorderStyle = bsToolWindow
  Caption = 'SQL-Ausf'#252'hren ...'
  ClientHeight = 82
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 32
    Width = 266
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '0'
  end
  object Label2: TLabel
    Left = 7
    Top = 61
    Width = 266
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Befehle werden ausgef'#252'hrt, bitte warten ...'
  end
  object PB1: TProgressBar
    Left = 8
    Top = 8
    Width = 265
    Height = 16
    Max = 1000
    Step = 50
    TabOrder = 0
  end
end
