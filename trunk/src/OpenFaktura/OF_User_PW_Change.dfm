object UserPWChangeForm: TUserPWChangeForm
  Left = 521
  Top = 313
  BorderStyle = bsDialog
  Caption = 'Kennwort '#228'ndern'
  ClientHeight = 157
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 74
    Height = 13
    Caption = 'Benutzername :'
  end
  object Label2: TLabel
    Left = 8
    Top = 41
    Width = 77
    Height = 13
    Caption = 'Altes Kennwort :'
  end
  object Label3: TLabel
    Left = 8
    Top = 66
    Width = 85
    Height = 13
    Caption = 'Neues Kennwort :'
  end
  object Label4: TLabel
    Left = 8
    Top = 91
    Width = 106
    Height = 13
    Caption = 'Kennwortbest'#228'tigung :'
  end
  object UserNameLabel: TLabel
    Left = 128
    Top = 8
    Width = 217
    Height = 17
    AutoSize = False
    Caption = 'Hein Bl'#246'd'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OldPWEdi: TEdit
    Left = 129
    Top = 37
    Width = 220
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = UserEdiKeyPress
  end
  object ChangeBtn: TBitBtn
    Left = 154
    Top = 126
    Width = 88
    Height = 25
    Caption = #196'n&dern'
    Default = True
    TabOrder = 3
    OnClick = ChangeBtnClick
    NumGlyphs = 2
    Spacing = -1
  end
  object CloseBtn: TBitBtn
    Left = 253
    Top = 126
    Width = 97
    Height = 25
    Cancel = True
    Caption = 'Abbrechen'
    ModalResult = 3
    TabOrder = 4
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
  object NewPWEdi: TEdit
    Left = 129
    Top = 61
    Width = 220
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = UserEdiKeyPress
  end
  object NewPWEdi2: TEdit
    Left = 129
    Top = 85
    Width = 220
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    OnKeyPress = UserEdiKeyPress
  end
end
