object LogForm: TLogForm
  Left = 655
  Top = 110
  Width = 560
  Height = 427
  Caption = 'Log'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 381
    Width = 552
    Height = 19
    Panels = <>
  end
  object PC1: TPageControl
    Left = 0
    Top = 0
    Width = 552
    Height = 381
    ActivePage = LogTS
    Align = alClient
    TabOrder = 1
    OnChange = PC1Change
    object LogTS: TTabSheet
      Caption = 'SQL-Log'
      object Panel1: TPanel
        Left = 0
        Top = 320
        Width = 544
        Height = 33
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 154
          Top = 10
          Width = 22
          Height = 13
          Caption = 'max.'
        end
        object Label2: TLabel
          Left = 258
          Top = 10
          Width = 105
          Height = 13
          Caption = 'Eintr'#228'ge im Log halten'
        end
        object Button1: TButton
          Left = 8
          Top = 4
          Width = 75
          Height = 25
          Caption = '&Leeren'
          TabOrder = 0
          OnClick = Button1Click
        end
        object LogAktivCB: TCheckBox
          Left = 96
          Top = 8
          Width = 49
          Height = 17
          Caption = '&aktiv'
          TabOrder = 1
          OnClick = LogAktivCBClick
        end
        object LogMaxEntryEdit: TJvSpinEdit
          Left = 179
          Top = 6
          Width = 73
          Height = 21
          MaxValue = 10000.000000000000000000
          OnBottomClick = LogMaxEntryEditChange
          OnTopClick = LogMaxEntryEditChange
          TabOrder = 2
          OnChange = LogMaxEntryEditChange
        end
      end
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 544
        Height = 320
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object SrvVarTS: TTabSheet
      Caption = 'Server-Variablen'
      ImageIndex = 3
    end
    object SrvStatusTS: TTabSheet
      Caption = 'Server-Status'
      ImageIndex = 1
      object SrvStatusGrid: TOFDBGrid
        Left = 0
        Top = 0
        Width = 544
        Height = 353
        Align = alClient
        DataSource = SrvStatusDS
        DefaultDrawing = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        AutoAppend = False
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
        DefaultRowHeight = 16
        EditColor = clWindow
        Columns = <
          item
            Expanded = False
            FieldName = 'Variable_name'
            Title.Caption = 'Variable'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Value'
            Title.Caption = 'Wert'
            Visible = True
          end>
      end
    end
    object SrvProzListTS: TTabSheet
      Caption = 'Server-Prozessliste'
      ImageIndex = 2
      object SrvProzessGrid: TOFDBGrid
        Left = 0
        Top = 0
        Width = 544
        Height = 353
        Align = alClient
        DataSource = SrvProzDS
        DefaultDrawing = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        AutoAppend = False
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
        DefaultRowHeight = 16
        EditColor = clWindow
        Columns = <
          item
            Expanded = False
            FieldName = 'Id'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'User'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Host'
            Width = 137
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'db'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Command'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Time'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'State'
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Info'
            Width = 165
            Visible = True
          end>
      end
    end
  end
  object SrvStatus: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'show status')
    Params = <>
    Left = 140
    Top = 88
  end
  object SrvStatusDS: TDataSource
    DataSet = SrvStatus
    Left = 228
    Top = 88
  end
  object SrvProzList: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'SHOW PROCESSLIST')
    Params = <>
    Left = 140
    Top = 160
  end
  object SrvProzDS: TDataSource
    DataSet = SrvProzList
    Left = 228
    Top = 160
  end
end
