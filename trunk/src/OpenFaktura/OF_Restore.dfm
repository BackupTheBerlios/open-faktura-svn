object RestoreForm: TRestoreForm
  Left = 461
  Top = 331
  HelpContext = 100000
  BorderStyle = bsDialog
  Caption = 'Daten-R'#252'cksicherung'
  ClientHeight = 302
  ClientWidth = 480
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TabNameLab: TLabel
    Left = 96
    Top = 206
    Width = 3
    Height = 13
  end
  object ZipSizeLab: TLabel
    Left = 112
    Top = 280
    Width = 3
    Height = 13
  end
  object Bevel2: TBevel
    Left = 0
    Top = 86
    Width = 480
    Height = 7
    Align = alTop
    Shape = bsTopLine
    Style = bsRaised
  end
  object PC1: TJvPageControl
    Left = 0
    Top = 88
    Width = 480
    Height = 169
    ActivePage = TabSheet1
    Style = tsFlatButtons
    TabOrder = 1
    HideAllTabs = True
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object EntpackLab: TLabel
        Left = 8
        Top = 90
        Width = 52
        Height = 13
        Caption = 'Entpacken'
        Visible = False
      end
      object Label6: TLabel
        Left = 7
        Top = 10
        Width = 82
        Height = 13
        Caption = 'Sicherungsdatei :'
      end
      object JvFilenameEdit1: TJvFilenameEdit
        Left = 7
        Top = 26
        Width = 459
        Height = 21
        OnAfterDialog = JvFilenameEdit1AfterDialog
        DefaultExt = 'CAO_backup_*.zip'
        Filter = 
          'gepackte CAO-Datensicherung|CAO_backup_*.zip|CAO-Datensicherung|' +
          'CAO_backup_*.sql|Alle Dateien|*.*'
        DialogTitle = 'Backup-Datei ausw'#228'hlen'
        DirectInput = False
        TabOrder = 0
        Text = 'JvFilenameEdit1'
      end
      object PB3: TProgressBar
        Left = 7
        Top = 111
        Width = 459
        Height = 16
        Max = 10001
        Smooth = True
        Step = 1
        TabOrder = 1
        Visible = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object AnalyseLab: TLabel
        Left = 7
        Top = 125
        Width = 55
        Height = 13
        Caption = 'AnalyseLab'
        Visible = False
      end
      object Label3: TLabel
        Left = 7
        Top = 10
        Width = 152
        Height = 13
        Caption = 'Kopfzeilen der Sicherungsdatei :'
      end
      object HeaderMemo: TMemo
        Left = 7
        Top = 27
        Width = 458
        Height = 89
        Color = clBtnFace
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      object Label1: TLabel
        Left = 7
        Top = 90
        Width = 127
        Height = 13
        Caption = 'Fortschritt R'#252'cksicherung :'
      end
      object Label2: TLabel
        Left = 7
        Top = 58
        Width = 35
        Height = 13
        Caption = 'Fehler :'
      end
      object Label4: TLabel
        Left = 7
        Top = 34
        Width = 88
        Height = 13
        Caption = 'verbleibende Zeit :'
      end
      object Label5: TLabel
        Left = 7
        Top = 10
        Width = 85
        Height = 13
        Caption = 'verstrichene Zeit :'
      end
      object RestoreTimeLab: TLabel
        Left = 112
        Top = 10
        Width = 3
        Height = 13
        Caption = '-'
      end
      object RestoreRemainLab: TLabel
        Left = 112
        Top = 34
        Width = 3
        Height = 13
        Caption = '-'
      end
      object RestoreFehlerLab: TLabel
        Left = 112
        Top = 58
        Width = 3
        Height = 13
        Caption = '-'
      end
      object pb1: TProgressBar
        Left = 7
        Top = 111
        Width = 459
        Height = 16
        Smooth = True
        Step = 1
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 480
    Height = 86
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    Color = clWhite
    TabOrder = 0
    object SchrittULab: TLabel
      Left = 8
      Top = 6
      Width = 465
      Height = 22
      AutoSize = False
      Caption = 'Schritt 1 von 3 : Datei ausw'#228'hlen'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object SchrittTLab: TLabel
      Left = 8
      Top = 26
      Width = 465
      Height = 54
      AutoSize = False
      Caption = 
        'Bitte w'#228'hlen Sie zun'#228'chst die zu verwendende Sicherungsdatei aus' +
        '.'#13#10'Nach erfolgreicher Auswahl klicken Sie auf den Button "Weiter' +
        '".'#13#10'Wenn es sich um eine koprimierte Sicherung handet, so wird d' +
        'iese im n'#228'chsten Schritt zun'#228'chst entpackt.'
      WordWrap = True
    end
  end
  object BottomPan: TPanel
    Left = 0
    Top = 261
    Width = 480
    Height = 41
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      480
      41)
    object Bevel1: TBevel
      Left = 0
      Top = 0
      Width = 473
      Height = 5
      Shape = bsTopLine
    end
    object ZurueckBtn: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Zur'#252'ck'
      TabOrder = 0
      OnClick = ZurueckBtnClick
    end
    object WeiterBtn: TBitBtn
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Weiter'
      TabOrder = 1
      OnClick = WeiterBtnClick
    end
    object CloseBtn: TBitBtn
      Left = 373
      Top = 8
      Width = 99
      Height = 25
      Cancel = True
      Caption = 'Abbrechen'
      TabOrder = 2
      OnClick = CloseBtnClick
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
    object StartRestoreBtn: TBitBtn
      Left = 104
      Top = 8
      Width = 161
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'R'#252'cksicherung starten'
      TabOrder = 3
      OnClick = StartRestoreBtnClick
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00877777777777
        77777777504000000000000000000007001108777777777777777707CCCC0888
        8888888888888707333308889988888888888807000008800000000000008807
        CCCC0888888888888888880733330880000000000000880700000F8888888888
        88888807CCCC0FFFFFFFFFFFFFFFFF0733330000000000000000000800008888
        8888888888888888CCCC888888888EE7888888883333888888888EE788888888
        0000888888888EE7888888880000888888888EE7888888882222888888EEEEEE
        EE788888AAAA8888888EEEEEE7888888888888888888EEEE7888888800008888
        88888EE7888888880000}
    end
  end
end
