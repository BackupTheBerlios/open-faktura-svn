object OFTaskEditForm: TOFTaskEditForm
  Left = 303
  Top = 288
  AutoScroll = False
  Caption = 'OFTaskEditForm'
  ClientHeight = 313
  ClientWidth = 537
  Color = clBtnFace
  Constraints.MinHeight = 340
  Constraints.MinWidth = 545
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 276
    Width = 537
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      537
      37)
    object ResourceNameLbl: TLabel
      Left = 8
      Top = 12
      Width = 100
      Height = 16
      AutoSize = False
      Caption = 'Resource Name'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object OKBtn: TButton
      Left = 380
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = OKBtnClick
    end
    object CancelBtn: TButton
      Left = 458
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = CancelBtnClick
    end
  end
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 276
    Align = alClient
    Caption = 'Task'
    TabOrder = 1
    DesignSize = (
      537
      276)
    object DueDateLbl: TLabel
      Left = 52
      Top = 44
      Width = 47
      Height = 13
      Caption = 'Due date:'
    end
    object CreatedOnLbl: TLabel
      Left = 52
      Top = 69
      Width = 55
      Height = 13
      Caption = 'Created on:'
    end
    object CompletedOnLbl: TLabel
      Left = 313
      Top = 69
      Width = 68
      Height = 13
      Caption = 'Completed on:'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 32
      Width = 528
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object Bevel2: TBevel
      Left = 4
      Top = 88
      Width = 528
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object imgCalendar: TImage
      Left = 8
      Top = 38
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D6170360C0000424D360C00000000000036000000280000002000
        0000200000000100180000000000000C00000000000000000000000000000000
        0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080000000C8D0D4C8
        D0D4808080808080808080808080808080808080808080808080808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        80808080808080808080808080808080808080808080C0C0C0808080000000C8
        D0D4808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080808080000000C8
        D0D4808080808080808080808080808080808080808080808080808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        80808080808080808080808080808080808080C0C0C0808080808080000000C8
        D0D4C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C0C0C0C0808080000000C8
        D0D4808080FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFF
        FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0
        C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFC0C0C0808080C0C0C0808080000000C8
        D0D4808080FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFF
        FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0
        C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808080C0C0C0808080000000C8
        D0D4808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C0808080000000C8
        D0D4C8D0D4808080FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0
        FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFF
        FFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFC0C0C0808080808080000000C8
        D0D4C8D0D4808080FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0
        FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFF
        FFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808080808080000000C8
        D0D4C8D0D4808080FFFFFFFFFFFFFFFFFFC0C0C0000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000C0C0C0FFFFFFFFFFFF808080808080000000C8
        D0D4C8D0D4808080C0C0C0C0C0C0C0C0C0000000808080808080808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        80808080808080808080808080000000C0C0C0C0C0C0808080808080000000C8
        D0D4C8D0D4808080FFFFFFFFFFFF000000808080FFFFFFFFFFFFFFFFFFC0C0C0
        FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFF
        FFC0C0C0FFFFFFFFFFFFFFFFFF808080000000FFFFFF808080808080000000C8
        D0D4C8D0D4808080FFFFFFFFFFFF000000808080FFFFFFFFFFFFFFFFFFC0C0C0
        FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFF
        FFC0C0C0FFFFFFFFFFFFFFFFFF808080000000FFFFFF808080808080000000C8
        D0D4C8D0D4808080FFFFFFFFFFFF000000808080FFFFFFFFFFFFFFFFFFC0C0C0
        FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFF
        FFC0C0C0FFFFFFFFFFFFFFFFFF808080000000FFFFFF808080808080000000C8
        D0D4C8D0D4808080C0C0C0C0C0C0C0C0C0000000808080808080808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        80808080808080808080808080000000C0C0C0C0C0C0808080808080000000C8
        D0D4C8D0D4808080FFFFFFFFFFFFFFFFFFC0C0C0000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000C0C0C0FFFFFFFFFFFF808080808080000000C8
        D0D4C8D0D4808080FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0
        FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFF
        FFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808080808080000000C8
        D0D4C8D0D4808080FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0
        FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFF
        FFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808080808080000000C8
        D0D4C8D0D4808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080808080000000C8
        D0D4C8D0D4808080FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0
        FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFF
        FFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808080808080000000C8
        D0D4C8D0D4808080FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0
        FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFF
        FFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808080808080000000C8
        D0D4C8D0D4808080FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0
        FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFF
        FFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808080808080000000C8
        D0D4C8D0D4808080808080808080808080808080808080808080808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        80808080808080808080808080808080808080808080808080808080000000C8
        D0D4C8D0D4808080C0C0C0808080C0C0C0808080C0C0C0808080C0C0C0808080
        C0C0C0808080C0C0C0808080C0C0C0808080C0C0C0808080C0C0C0808080C0C0
        C0808080C0C0C0808080C0C0C0808080C0C0C0808080808080808080000000C8
        D0D4C8D0D4808080808080C0C0C0808080C0C0C0808080C0C0C0808080C0C0C0
        808080C0C0C0808080C0C0C0808080C0C0C0808080C0C0C0808080C0C0C08080
        80C0C0C0808080C0C0C0808080C0C0C0808080C0C0C0808080808080000000C8
        D0D4C8D0D4808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080000000C8
        D0D4C8D0D4808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080000000C8
        D0D4C8D0D4C8D0D4808080808080808080808080808080808080808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        80808080808080808080808080808080808080808080808080808080000000C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4}
      Transparent = True
    end
    object imgCompleted: TImage
      Left = 272
      Top = 38
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D617076020000424D760200000000000076000000280000002000
        0000200000000100040000000000000200000000000000000000100000001000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00333333333333333333333333333333333333333333334404333333333333
        3333333333333334088004333333333333333333333333448008800033333333
        33333333333334080FF00880003333333333333333334480FFFFF008F0043333
        333333333334080FFFFFFFF00880003333333333334480FFF77FFFFFF0088033
        3333333334080FFFFFF77FFFFFF00033333333334480FF77FFFFF77FFFFFF033
        33333334080FFFFF76FFFFF67FFF033333333340F0FFFFFFFF67FFFFFFF03333
        333334080FFFFFFFFFFF77FFFF033300003340807FFFFF08FFFF888880333004
        0403080F877FFFFFFFF8800000033000444400FFFF877FFFFFF008888FF00770
        44440FF707FF877FFF888FFFFFFFFFF74444300F0FFFFF87700000088FFFFFFF
        444430F00FFFFFFF80070F0888FFFFFF044433FF000FF707F080700888FFFFFF
        0444330033300F0FF0F807088FFFFFF0000333333330F00FF00F8070FFFFF003
        333333333333FF000330F8070FFF0333333333333333003333330FF070003333
        3333333333333333333330000703333333333333333333333333333330703333
        3333333333333333333333333307033333333333333333333333333333307033
        3333333333333333333333333333070333333333333333333333333333333070
        3333333333333333333333333333330033333333333333333333333333333333
        3333}
      Transparent = True
    end
    object DescriptionEdit: TEdit
      Left = 8
      Top = 5
      Width = 522
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 255
      TabOrder = 0
      Text = 'DescriptionEdit'
      OnChange = OnChange
    end
    object DueDateEdit: TDateTimePicker
      Left = 120
      Top = 40
      Width = 121
      Height = 21
      Date = 38009.870863680600000000
      Time = 38009.870863680600000000
      TabOrder = 1
    end
    object CompleteCB: TCheckBox
      Left = 313
      Top = 41
      Width = 136
      Height = 17
      Caption = 'Complete'
      TabOrder = 2
    end
    object DetailsMemo: TMemo
      Left = 4
      Top = 96
      Width = 529
      Height = 174
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        'DetailsMemo')
      MaxLength = 1024
      ScrollBars = ssVertical
      TabOrder = 3
      OnChange = OnChange
    end
  end
end
