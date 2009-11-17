object LastschriftForm: TLastschriftForm
  Left = 439
  Top = 191
  Width = 692
  Height = 565
  Caption = 'LastschriftForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 519
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TopPan: TPanel
      Left = 0
      Top = 0
      Width = 684
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      TabOrder = 0
      OnResize = TopPanResize
      object Label35: TLabel
        Left = 0
        Top = 0
        Width = 153
        Height = 23
        Align = alLeft
        Caption = '  Lastschriften (DTA)   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object UbwErfassenBtn: TJvSpeedButton
        Tag = 1
        Left = 228
        Top = 0
        Width = 63
        Height = 22
        Caption = 'Erfassen'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        ParentFont = False
        OnMouseEnter = UbwErfassenBtnMouseEnter
        OnMouseLeave = UbwErfassenBtnMouseLeave
        OnClick = UbwErfassenBtnClick
      end
      object UbwVerbuchenBtn: TJvSpeedButton
        Tag = 2
        Left = 296
        Top = 0
        Width = 73
        Height = 22
        Caption = 'Verbuchen'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        ParentFont = False
        OnMouseEnter = UbwErfassenBtnMouseEnter
        OnMouseLeave = UbwErfassenBtnMouseLeave
        OnClick = UbwVerbuchenBtnClick
      end
      object DatumAW: TVolgaPeriod
        Left = 520
        Top = 0
        Width = 136
        Height = 24
        Hint = 'mit rechtem Mausklick Zeitraum ausw'#228'hlen ...'
        KindRange = ksYear
        Year = 2000
        Month = 1
        ButtonWidth = 17
        Color = clBtnShadow
        EnablePopup = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
        Visible = False
      end
    end
    object PC1: TPageControl
      Left = 0
      Top = 27
      Width = 684
      Height = 492
      ActivePage = FreigabeTab
      Align = alClient
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      Style = tsFlatButtons
      TabOrder = 1
      OnChange = PC1Change
      object FreigabeTab: TTabSheet
        Caption = 'FreigabeTab'
        object OposGrid: TOFDBGrid
          Left = 0
          Top = 0
          Width = 676
          Height = 413
          Align = alClient
          DataSource = OPosDS
          DefaultDrawing = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = OposGridDblClick
          OnKeyPress = OposGridKeyPress
          TitleButtons = True
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
          DefaultRowHeight = 16
          EditColor = clBlack
          OnApplyCellAttribute = OposGridApplyCellAttribute
          Columns = <
            item
              Expanded = False
              FieldName = 'FREIGABE1_FLAG'
              Title.Caption = 'Freigabe'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RDATUM'
              Title.Caption = 'Datum'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VRENUM'
              Title.Caption = 'Beleg'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_NUM'
              Title.Caption = 'Kundennr.'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_KUNDE'
              Title.Caption = 'Kunde'
              Width = 170
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KUN_PLZ'
              Title.Caption = 'PLZ'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'KUN_ORT'
              Title.Caption = 'Ort'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NSUMME'
              Title.Caption = 'Netto'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'BSUMME'
              Title.Caption = 'Brutto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'WAEHRUNG'
              Title.Caption = 'W'#228'hrung'
              Width = 21
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZAHLART'
              Title.Caption = 'Zahlart'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ZIEL_SKONTO'
              Title.Caption = 'Ziel m. Skonto'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZIEL_NETTO'
              Title.Caption = 'Ziel Netto'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SOLL_SKONTO'
              Title.Caption = 'Skonto'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'IST_ANZAHLUNG'
              Title.Caption = 'Anzahlung'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'GEGENKONTO'
              Title.Caption = 'G-Kto.'
              Width = 38
              Visible = True
            end>
        end
        object Panel1: TPanel
          Left = 0
          Top = 413
          Width = 676
          Height = 22
          Align = alBottom
          BevelOuter = bvNone
          BorderWidth = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label2: TLabel
            Left = 484
            Top = 2
            Width = 57
            Height = 18
            Align = alRight
            Caption = '  Summe: '
            Layout = tlCenter
          end
          object Label4: TLabel
            Left = 272
            Top = 2
            Width = 79
            Height = 18
            Align = alRight
            Caption = 'Freigegeben: '
            Layout = tlCenter
          end
          object SummePan: TPanel
            Left = 541
            Top = 2
            Width = 133
            Height = 18
            Align = alRight
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 0
            object SummeLab: TLabel
              Left = 54
              Top = 1
              Width = 78
              Height = 16
              Align = alRight
              Alignment = taRightJustify
              Caption = '1.000,55 DM '
              Layout = tlCenter
            end
            object SumCntLab: TLabel
              Left = 1
              Top = 1
              Width = 19
              Height = 16
              Align = alLeft
              Caption = ' 10'
              Layout = tlCenter
            end
          end
          object FreiPan: TPanel
            Left = 351
            Top = 2
            Width = 133
            Height = 18
            Align = alRight
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 1
            object FreiLab: TLabel
              Left = 54
              Top = 1
              Width = 78
              Height = 16
              Align = alRight
              Alignment = taRightJustify
              Caption = '1.000,55 DM '
              Layout = tlCenter
            end
            object FreiCntLab: TLabel
              Left = 1
              Top = 1
              Width = 19
              Height = 16
              Align = alLeft
              Caption = ' 10'
              Layout = tlCenter
            end
          end
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 435
          Width = 676
          Height = 26
          Align = alBottom
          AutoSize = True
          BorderWidth = 1
          ButtonWidth = 103
          Caption = 'ToolBar2'
          EdgeBorders = []
          Flat = True
          Images = MainForm.ImageList1
          List = True
          ShowCaptions = True
          TabOrder = 2
          Wrapable = False
          object DBNavigator1: TDBNavigator
            Left = 0
            Top = 0
            Width = 135
            Height = 22
            DataSource = OPosDS
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
            TabOrder = 0
          end
          object ToolButton8: TToolButton
            Left = 135
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 13
            Style = tbsSeparator
          end
          object ToolButton1: TToolButton
            Left = 143
            Top = 0
            AutoSize = True
            Caption = 'alle Freigeben'
            ImageIndex = 18
            MenuItem = Allesmarkieren1
          end
          object ToolButton2: TToolButton
            Left = 240
            Top = 0
            AutoSize = True
            Caption = 'keine Freigeben'
            ImageIndex = 19
            MenuItem = keineMarkieren1
          end
          object ToolButton3: TToolButton
            Left = 347
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 13
            Style = tbsSeparator
          end
          object LastschriftBtn: TToolButton
            Left = 355
            Top = 0
            AutoSize = True
            Caption = 'Lastschrift'
            ImageIndex = 12
            MenuItem = lastschrift1
          end
        end
      end
      object UeberweisungTab: TTabSheet
        Caption = 'UeberweisungTab'
        ImageIndex = 1
        object CaoGroupBox1: TOFGroupBox
          Left = 0
          Top = 48
          Width = 676
          Height = 292
          Align = alClient
          Caption = 'Liste'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 0
          object UeberweisungGrid: TOFDBGrid
            Left = 8
            Top = 21
            Width = 660
            Height = 263
            Align = alClient
            BorderStyle = bsNone
            DataSource = UWDS
            DefaultDrawing = False
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleButtons = True
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
            DefaultRowHeight = 16
            EditColor = clBlack
            OnApplyCellAttribute = UeberweisungGridApplyCellAttribute
            Columns = <
              item
                Expanded = False
                FieldName = 'RDATUM'
                ReadOnly = True
                Title.Caption = 'Datum'
                Width = 59
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VRENUM'
                ReadOnly = True
                Title.Caption = 'Beleg'
                Width = 46
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KUN_NUM'
                ReadOnly = True
                Title.Caption = 'Kundennr.'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CALC_KUNDE'
                ReadOnly = True
                Title.Caption = 'Kunde'
                Width = 170
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KUN_PLZ'
                ReadOnly = True
                Title.Caption = 'PLZ'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'KUN_ORT'
                ReadOnly = True
                Title.Caption = 'Ort'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'NSUMME'
                ReadOnly = True
                Title.Caption = 'Netto'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'BSUMME'
                ReadOnly = True
                Title.Caption = 'Brutto'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ZAHLBETRAG'
                Title.Caption = 'Betrag'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WAEHRUNG'
                ReadOnly = True
                Title.Caption = 'W'#228'hrung'
                Width = 21
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZAHLART'
                ReadOnly = True
                Title.Caption = 'Zahlart'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ZIEL_SKONTO'
                ReadOnly = True
                Title.Caption = 'Ziel m. Skonto'
                Width = 73
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SOLL_SKONTO'
                Width = 47
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZIEL_NETTO'
                Title.Caption = 'Ziel Netto'
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SOLL_STAGE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'SOLL_NTAGE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'IST_ANZAHLUNG'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'IST_SKONTO'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'IST_ZAHLDAT'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'IST_BETRAG'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'GEGENKONTO'
                Title.Caption = 'G-Kto.'
                Width = 38
                Visible = True
              end>
          end
        end
        object ToolBar1: TToolBar
          Left = 0
          Top = 435
          Width = 676
          Height = 26
          Align = alBottom
          AutoSize = True
          BorderWidth = 1
          ButtonWidth = 148
          Caption = 'ToolBar2'
          EdgeBorders = []
          Flat = True
          Images = MainForm.ImageList1
          List = True
          ShowCaptions = True
          TabOrder = 1
          Wrapable = False
          object DBNavigator2: TDBNavigator
            Left = 0
            Top = 0
            Width = 196
            Height = 22
            DataSource = UWDS
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
            Flat = True
            TabOrder = 0
          end
          object ToolButton4: TToolButton
            Left = 196
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 13
            Style = tbsSeparator
          end
          object AbbruchBtn: TToolButton
            Left = 204
            Top = 0
            AutoSize = True
            Caption = 'Abbruch'
            ImageIndex = 19
            OnClick = AbbruchBtnClick
          end
          object ToolButton6: TToolButton
            Left = 275
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 13
            Style = tbsSeparator
          end
          object MakeLSBtn: TToolButton
            Left = 283
            Top = 0
            AutoSize = True
            Caption = 'Ausf'#252'hren (DTA erstellen)'
            ImageIndex = 12
            OnClick = MakeLSBtnClick
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 408
          Width = 676
          Height = 27
          Align = alBottom
          BevelOuter = bvNone
          BorderWidth = 3
          TabOrder = 2
          object Panel3: TPanel
            Left = 3
            Top = 3
            Width = 670
            Height = 21
            Align = alClient
            BevelOuter = bvNone
            Color = 14680063
            TabOrder = 0
            object Label3: TLabel
              Left = 5
              Top = 2
              Width = 68
              Height = 16
              Caption = 'Summen :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object FreiLab2: TLabel
              Left = 582
              Top = 0
              Width = 88
              Height = 16
              Align = alRight
              Alignment = taRightJustify
              Caption = '1.000,55 DM '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object FreiCntLab2: TLabel
              Left = 468
              Top = 0
              Width = 114
              Height = 16
              Align = alRight
              Caption = ' 10 Positionen = '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
          end
        end
        object CaoGroupBox3: TOFGroupBox
          Left = 0
          Top = 0
          Width = 676
          Height = 48
          Align = alTop
          Caption = 'Auftraggeber / Konto'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 3
          object DBText1: TDBText
            Tag = 1
            Left = 504
            Top = 24
            Width = 164
            Height = 13
            DataField = 'inhaber'
            DataSource = FirBankDS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText2: TDBText
            Left = 264
            Top = 24
            Width = 50
            Height = 13
            AutoSize = True
            DataField = 'ktonr'
            DataSource = FirBankDS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText3: TDBText
            Left = 374
            Top = 24
            Width = 50
            Height = 13
            AutoSize = True
            DataField = 'blz'
            DataSource = FirBankDS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 456
            Top = 24
            Width = 42
            Height = 13
            Caption = 'Inhaber :'
          end
          object Label6: TLabel
            Left = 343
            Top = 24
            Width = 26
            Height = 13
            Caption = 'BLZ :'
          end
          object Label7: TLabel
            Left = 189
            Top = 24
            Width = 71
            Height = 13
            Caption = 'Kontonummer :'
          end
          object DBText4: TDBText
            Left = 56
            Top = 24
            Width = 129
            Height = 13
            DataField = 'kurzbez'
            DataSource = FirBankDS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBNavigator3: TDBNavigator
            Left = 8
            Top = 21
            Width = 40
            Height = 21
            DataSource = FirBankDS
            VisibleButtons = [nbPrior, nbNext]
            Flat = True
            TabOrder = 0
          end
        end
        object InfoGB: TOFGroupBox
          Left = 0
          Top = 340
          Width = 676
          Height = 68
          Align = alBottom
          Caption = 'Info'
          Color = 14680063
          Ctl3D = False
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 4
          Visible = False
        end
      end
      object VerbuchenTab: TTabSheet
        Caption = 'VerbuchenTab'
        ImageIndex = 2
        object CaoGroupBox2: TOFGroupBox
          Left = 0
          Top = 367
          Width = 676
          Height = 68
          Align = alBottom
          Caption = 'Info'
          Color = 14680063
          Ctl3D = False
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 0
          Visible = False
        end
        object CaoGroupBox4: TOFGroupBox
          Left = 0
          Top = 0
          Width = 676
          Height = 221
          Align = alTop
          Caption = 'Liste'
          Color = 14680063
          Ctl3D = False
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 1
          object VerbuchGrid: TOFDBGrid
            Left = 8
            Top = 21
            Width = 660
            Height = 192
            Align = alClient
            BorderStyle = bsNone
            Ctl3D = True
            DataSource = VerbuchDS
            DefaultDrawing = False
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit]
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleButtons = True
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
            DefaultRowHeight = 16
            EditColor = clBlack
          end
        end
        object CaoGroupBox5: TOFGroupBox
          Left = 0
          Top = 221
          Width = 676
          Height = 146
          Align = alClient
          Caption = 'Details'
          Color = 14680063
          Ctl3D = False
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 2
          object VerbuchDetailGrid: TOFDBGrid
            Left = 8
            Top = 21
            Width = 660
            Height = 117
            Align = alClient
            BorderStyle = bsNone
            Ctl3D = True
            DataSource = VerbuchDetailDS
            DefaultDrawing = False
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit]
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleButtons = True
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
            DefaultRowHeight = 16
            EditColor = clBlack
          end
        end
        object ToolBar3: TToolBar
          Left = 0
          Top = 435
          Width = 676
          Height = 26
          Align = alBottom
          AutoSize = True
          BorderWidth = 1
          ButtonWidth = 143
          Caption = 'ToolBar2'
          EdgeBorders = []
          Flat = True
          Images = MainForm.ImageList1
          List = True
          ShowCaptions = True
          TabOrder = 3
          Wrapable = False
          object DBNavigator4: TDBNavigator
            Left = 0
            Top = 0
            Width = 165
            Height = 22
            DataSource = VerbuchDS
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
            TabOrder = 0
          end
          object ToolButton7: TToolButton
            Left = 165
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 13
            Style = tbsSeparator
          end
          object LSUndoBtn: TToolButton
            Left = 173
            Top = 0
            AutoSize = True
            Caption = 'Lastschriften r'#252'ckg'#228'ngig'
            ImageIndex = 13
            OnClick = LSUndoBtnClick
          end
          object ToolButton9: TToolButton
            Left = 320
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 13
            Style = tbsSeparator
          end
          object LSVerbuchenBtn: TToolButton
            Left = 328
            Top = 0
            AutoSize = True
            Caption = 'Lastschrift verbuchen'
            ImageIndex = 12
            OnClick = LSVerbuchenBtnClick
          end
        end
      end
    end
  end
  object MainMenu1: TJvMainMenu
    Images = MainForm.ImageList1
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 280
    Top = 160
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        ShortCut = 16454
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Allesmarkieren1: TMenuItem
        Caption = 'alle Freigeben'
        ImageIndex = 18
        ShortCut = 16449
        OnClick = Allesmarkieren1Click
      end
      object keineMarkieren1: TMenuItem
        Caption = 'keine Freigeben'
        ImageIndex = 19
        ShortCut = 16459
        OnClick = keineMarkieren1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object lastschrift1: TMenuItem
        Caption = 'Lastschrift'
        ImageIndex = 12
        ShortCut = 16469
        OnClick = lastschrift1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object SichtbareSpalten1: TMenuItem
        Caption = 'Sichtbare Spalten'
        ImageIndex = 15
        OnClick = SichtbareSpalten1Click
      end
      object Layoutspeichern1: TMenuItem
        Caption = 'Layout speichern'
        ImageIndex = 16
        OnClick = Layoutspeichern1Click
      end
    end
    object Sortierung1: TMenuItem
      Caption = '&Sortierung'
      Enabled = False
      GroupIndex = 3
      object Belegnummer1: TMenuItem
        Tag = 1
        Caption = 'Belegnummer'
        Checked = True
        Default = True
        GroupIndex = 5
        RadioItem = True
      end
      object Datum1: TMenuItem
        Tag = 2
        Caption = 'Datum'
        GroupIndex = 5
        RadioItem = True
      end
      object Name1: TMenuItem
        Tag = 3
        Caption = 'Name'
        GroupIndex = 5
        RadioItem = True
      end
      object Stadium1: TMenuItem
        Tag = 4
        Caption = 'Stadium'
        GroupIndex = 5
        RadioItem = True
      end
      object Preis1: TMenuItem
        Tag = 5
        Caption = 'Preis'
        GroupIndex = 5
        RadioItem = True
      end
    end
    object Drucken1: TMenuItem
      Caption = '&Drucken'
      GroupIndex = 4
      object OPOSdrucken1: TMenuItem
        Caption = 'OPOS'
        ImageIndex = 11
        ShortCut = 16464
      end
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 5
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        ImageIndex = 13
        ShortCut = 116
      end
    end
  end
  object OPosQuery: TOFZQuery
    Connection = DM1.DB1
    AfterOpen = OPosQueryAfterOpen
    OnCalcFields = OPosQueryCalcFields
    OFSecurity = DM1.CaoSecurity
    OFModulID = 4050
    OFSubModulID = 0
    UseRecordLock = False
    ShowLockErrors = False
    AutoReleaseLock = False
    Params = <>
    SQL.Strings = (
      'select *'
      'from JOURNAL'
      
        'where STADIUM=29 and QUELLE=3 and  YEAR(RDATUM)>=2000 and BSUMME' +
        '<>0 and '
      '('
      ' (TO_DAYS(RDATUM)+SOLL_NTAGE <= TO_DAYS(CURDATE())) or'
      ' (TO_DAYS(RDATUM)+SOLL_STAGE <= TO_DAYS(CURDATE()))'
      ')'
      'order by RDATUM, KUN_NAME1, KUN_NAME2')
    Left = 152
    Top = 160
    object OPosQueryQUELLE: TIntegerField
      FieldName = 'QUELLE'
      Required = True
    end
    object OPosQueryREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object OPosQueryADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
    end
    object OPosQueryVRENUM: TStringField
      FieldName = 'VRENUM'
      Required = True
    end
    object OPosQueryRDATUM: TDateField
      FieldName = 'RDATUM'
      Required = True
    end
    object OPosQueryZAHLART: TIntegerField
      FieldName = 'ZAHLART'
    end
    object OPosQueryMWST_0: TFloatField
      FieldName = 'MWST_0'
      DisplayFormat = '0.0%'
    end
    object OPosQueryMWST_1: TFloatField
      FieldName = 'MWST_1'
      DisplayFormat = '0.0%'
    end
    object OPosQueryMWST_2: TFloatField
      FieldName = 'MWST_2'
      DisplayFormat = '0.0%'
    end
    object OPosQueryMWST_3: TFloatField
      FieldName = 'MWST_3'
      DisplayFormat = '0.0%'
    end
    object OPosQueryNSUMME: TFloatField
      FieldName = 'NSUMME'
      DisplayFormat = ',#0.00'
    end
    object OPosQueryMSUMME_0: TFloatField
      FieldName = 'MSUMME_0'
      DisplayFormat = ',#0.00'
    end
    object OPosQueryMSUMME_1: TFloatField
      FieldName = 'MSUMME_1'
      DisplayFormat = ',#0.00'
    end
    object OPosQueryMSUMME_2: TFloatField
      FieldName = 'MSUMME_2'
      DisplayFormat = ',#0.00'
    end
    object OPosQueryMSUMME_3: TFloatField
      FieldName = 'MSUMME_3'
      DisplayFormat = ',#0.00'
    end
    object OPosQueryMSUMME: TFloatField
      FieldName = 'MSUMME'
      DisplayFormat = ',#0.00'
    end
    object OPosQueryBSUMME: TFloatField
      FieldName = 'BSUMME'
      DisplayFormat = ',#0.00'
    end
    object OPosQueryWAEHRUNG: TStringField
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object OPosQueryGEGENKONTO: TIntegerField
      FieldName = 'GEGENKONTO'
    end
    object OPosQuerySOLL_STAGE: TLargeintField
      FieldName = 'SOLL_STAGE'
    end
    object OPosQuerySOLL_SKONTO: TFloatField
      FieldName = 'SOLL_SKONTO'
      DisplayFormat = '0.0%'
    end
    object OPosQuerySOLL_NTAGE: TLargeintField
      FieldName = 'SOLL_NTAGE'
    end
    object OPosQuerySOLL_RATEN: TIntegerField
      FieldName = 'SOLL_RATEN'
    end
    object OPosQuerySOLL_RATBETR: TFloatField
      FieldName = 'SOLL_RATBETR'
      DisplayFormat = ',#0.00'
    end
    object OPosQuerySOLL_RATINTERVALL: TIntegerField
      FieldName = 'SOLL_RATINTERVALL'
    end
    object OPosQueryIST_ANZAHLUNG: TFloatField
      FieldName = 'IST_ANZAHLUNG'
    end
    object OPosQueryIST_SKONTO: TFloatField
      FieldName = 'IST_SKONTO'
    end
    object OPosQueryIST_ZAHLDAT: TDateField
      FieldName = 'IST_ZAHLDAT'
    end
    object OPosQueryIST_BETRAG: TFloatField
      FieldName = 'IST_BETRAG'
      DisplayFormat = ',#0.00'
    end
    object OPosQueryMAHNKOSTEN: TFloatField
      DisplayLabel = 'Mahnkosten'
      FieldName = 'MAHNKOSTEN'
      DisplayFormat = ',#0.00'
    end
    object OPosQueryKONTOAUSZUG: TIntegerField
      FieldName = 'KONTOAUSZUG'
    end
    object OPosQueryBANK_ID: TIntegerField
      FieldName = 'BANK_ID'
    end
    object OPosQuerySTADIUM: TIntegerField
      FieldName = 'STADIUM'
    end
    object OPosQueryFREIGABE1: TBooleanField
      FieldName = 'FREIGABE1_FLAG'
    end
    object OPosQueryKUN_NUM: TStringField
      FieldName = 'KUN_NUM'
    end
    object OPosQueryKUN_ANREDE: TStringField
      FieldName = 'KUN_ANREDE'
      Size = 40
    end
    object OPosQueryKUN_NAME1: TStringField
      FieldName = 'KUN_NAME1'
      Size = 40
    end
    object OPosQueryKUN_NAME2: TStringField
      FieldName = 'KUN_NAME2'
      Size = 40
    end
    object OPosQueryKUN_NAME3: TStringField
      FieldName = 'KUN_NAME3'
      Size = 40
    end
    object OPosQueryKUN_ABTEILUNG: TStringField
      FieldName = 'KUN_ABTEILUNG'
      Size = 40
    end
    object OPosQueryKUN_STRASSE: TStringField
      FieldName = 'KUN_STRASSE'
      Size = 40
    end
    object OPosQueryKUN_LAND: TStringField
      FieldName = 'KUN_LAND'
      Size = 5
    end
    object OPosQueryKUN_PLZ: TStringField
      FieldName = 'KUN_PLZ'
      Size = 10
    end
    object OPosQueryKUN_ORT: TStringField
      FieldName = 'KUN_ORT'
      Size = 40
    end
    object OPosQueryORGNUM: TStringField
      FieldName = 'ORGNUM'
    end
    object OPosQueryUW_NUM: TIntegerField
      FieldName = 'UW_NUM'
    end
    object OPosQueryMAHNSTUFE: TIntegerField
      DisplayLabel = 'MS'
      DisplayWidth = 1
      FieldName = 'MAHNSTUFE'
      DisplayFormat = '0;0; '
    end
    object OPosQueryMAHNDATUM: TDateField
      DisplayLabel = 'le. Mahnung'
      DisplayWidth = 10
      FieldName = 'MAHNDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object OPosQueryZIEL_SKONTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZIEL_SKONTO'
      Calculated = True
    end
    object OPosQueryZIEL_NETTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZIEL_NETTO'
      Calculated = True
    end
    object OPosQueryCALC_KUNDE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_KUNDE'
      Size = 200
      Calculated = True
    end
  end
  object OPosDS: TDataSource
    DataSet = OPosQuery
    Left = 216
    Top = 160
  end
  object SumTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select '
      'count(*) as ANZAHL, '
      'sum(NSUMME)as NSUMME, '
      'sum(MSUMME) as MSUMME, '
      'sum(BSUMME) as BSUMME, '
      'FREIGABE1_FLAG as FREIGABE, '
      'WAEHRUNG'
      'from JOURNAL'
      
        'where STADIUM=29 and QUELLE=3 and YEAR(RDATUM)>=2000 and BSUMME<' +
        '>0'
      'group by FREIGABE, WAEHRUNG')
    Params = <>
    Left = 152
    Top = 216
  end
  object UWTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = UWTabAfterOpen
    OnCalcFields = UWTabCalcFields
    AfterPost = UWTabAfterOpen
    BeforeDelete = UWTabBeforeDelete
    SQL.Strings = (
      'select *'
      'from JOURNAL'
      
        'where STADIUM=29  and QUELLE=3 and YEAR(RDATUM)>=2000 and BSUMME' +
        '<>0 and FREIGABE1_FLAG="Y"'
      'order by RDATUM, KUN_NAME1, KUN_NAME2')
    Params = <>
    Left = 152
    Top = 280
    object IntegerField1: TIntegerField
      FieldName = 'QUELLE'
      Required = True
    end
    object UWTabRec_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object UWTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
    end
    object UWTabVRENUM: TStringField
      FieldName = 'VRENUM'
      Required = True
    end
    object UWTabRDatum: TDateField
      FieldName = 'RDATUM'
      Required = True
    end
    object IntegerField6: TIntegerField
      FieldName = 'ZAHLART'
    end
    object FloatField1: TFloatField
      FieldName = 'MWST_0'
      DisplayFormat = '0.0%'
    end
    object FloatField2: TFloatField
      FieldName = 'MWST_1'
      DisplayFormat = '0.0%'
    end
    object FloatField3: TFloatField
      FieldName = 'MWST_2'
      DisplayFormat = '0.0%'
    end
    object FloatField4: TFloatField
      FieldName = 'MWST_3'
      DisplayFormat = '0.0%'
    end
    object FloatField5: TFloatField
      FieldName = 'NSUMME'
      DisplayFormat = ',#0.00'
    end
    object FloatField6: TFloatField
      FieldName = 'MSUMME_0'
      DisplayFormat = ',#0.00'
    end
    object FloatField7: TFloatField
      FieldName = 'MSUMME_1'
      DisplayFormat = ',#0.00'
    end
    object FloatField8: TFloatField
      FieldName = 'MSUMME_2'
      DisplayFormat = ',#0.00'
    end
    object FloatField9: TFloatField
      FieldName = 'MSUMME_3'
      DisplayFormat = ',#0.00'
    end
    object FloatField10: TFloatField
      FieldName = 'MSUMME'
      DisplayFormat = ',#0.00'
    end
    object UWTABBSUMME: TFloatField
      FieldName = 'BSUMME'
      DisplayFormat = ',#0.00'
    end
    object UWTabWaehrung: TStringField
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object IntegerField7: TIntegerField
      FieldName = 'GEGENKONTO'
    end
    object UWTabSOLL_STAGE: TLargeintField
      FieldName = 'SOLL_STAGE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object UWTabSoll_SKONTO: TFloatField
      DisplayLabel = 'Skonto'
      FieldName = 'SOLL_SKONTO'
      DisplayFormat = '0.0%; ; '
      EditFormat = '0.0'
    end
    object UWTabSOLL_NTAGE: TLargeintField
      FieldName = 'SOLL_NTAGE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object IntegerField10: TIntegerField
      FieldName = 'SOLL_RATEN'
    end
    object FloatField13: TFloatField
      FieldName = 'SOLL_RATBETR'
      DisplayFormat = ',#0.00'
    end
    object IntegerField11: TIntegerField
      FieldName = 'SOLL_RATINTERVALL'
    end
    object FloatField14: TFloatField
      FieldName = 'IST_ANZAHLUNG'
    end
    object UWTABIST_SKONTO: TFloatField
      FieldName = 'IST_SKONTO'
    end
    object UWTABIST_ZAHLDAT: TDateField
      FieldName = 'IST_ZAHLDAT'
    end
    object UWTabIST_BETRAG: TFloatField
      FieldName = 'IST_BETRAG'
      DisplayFormat = ',#0.00'
    end
    object UWTabBank_ID: TIntegerField
      FieldName = 'BANK_ID'
    end
    object UWTabStadium: TIntegerField
      FieldName = 'STADIUM'
    end
    object UWTabFREIGABE1: TBooleanField
      FieldName = 'FREIGABE1_FLAG'
    end
    object UWTabKUN_NUM: TStringField
      FieldName = 'KUN_NUM'
    end
    object UWTabKun_Anrede: TStringField
      FieldName = 'KUN_ANREDE'
      Size = 40
    end
    object UWTabKUN_NAME1: TStringField
      FieldName = 'KUN_NAME1'
      Size = 40
    end
    object UWTabKUN_NAME2: TStringField
      FieldName = 'KUN_NAME2'
      Size = 40
    end
    object UWTabKUN_NAME3: TStringField
      FieldName = 'KUN_NAME3'
      Size = 40
    end
    object UWTabKUN_Abteilung: TStringField
      FieldName = 'KUN_ABTEILUNG'
      Size = 40
    end
    object UWTabKUN_STRASSE: TStringField
      FieldName = 'KUN_STRASSE'
      Size = 40
    end
    object UWTabKUN_LAND: TStringField
      FieldName = 'KUN_LAND'
      Size = 5
    end
    object UWTabKUN_PLZ: TStringField
      FieldName = 'KUN_PLZ'
      Size = 10
    end
    object UWTabKUN_ORT: TStringField
      FieldName = 'KUN_ORT'
      Size = 40
    end
    object UWTABOrgNum: TStringField
      FieldName = 'ORGNUM'
    end
    object UWTabUWNum: TIntegerField
      FieldName = 'UW_NUM'
    end
    object UWTabMahnKosten: TFloatField
      DisplayLabel = 'Mahnkosten'
      FieldName = 'MAHNKOSTEN'
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object UWTabMAHNSTUFE: TIntegerField
      DisplayLabel = 'MS'
      DisplayWidth = 1
      FieldName = 'MAHNSTUFE'
      DisplayFormat = '0;0; '
    end
    object UWTabMAHNDATUM: TDateField
      DisplayLabel = 'le. Mahnung'
      DisplayWidth = 10
      FieldName = 'MAHNDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object UWTabZIEL_SKONTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZIEL_SKONTO'
      Calculated = True
    end
    object UWTabZIEL_NETTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZIEL_NETTO'
      Calculated = True
    end
    object UWTabUSR1: TStringField
      FieldName = 'USR1'
      Size = 80
    end
    object UWTabUSR2: TStringField
      FieldName = 'USR2'
      Size = 80
    end
    object UWTabZAHLBETRAG: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ZAHLBETRAG'
      ReadOnly = True
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object UWTabCALC_KUNDE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_KUNDE'
      Size = 255
      Calculated = True
    end
  end
  object UWDS: TDataSource
    DataSet = UWTab
    Left = 220
    Top = 283
  end
  object DTAUS1: TmpsDTAUS
    Lastschriften = True
    Kundendiskette = True
    Kennzeichen = 'LK'
    BLZ = 0
    Erstellungsdatum = 37541.000000000000000000
    Kontonummer = '0000000000'
    Referenznummer = '00000000'
    Ausfuehrungstermin = 37541.000000000000000000
    Waehrung = Euro
    Dateiname = 'DTAUS0'
    Nachsatzaktualisierung = True
    Left = 284
    Top = 284
  end
  object FirBankDS: TDataSource
    OnStateChange = FirBankDSStateChange
    Left = 212
    Top = 212
  end
  object UeberweisTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from UEBERWEISUNGEN where ART='#39'L'#39)
    Params = <>
    Left = 280
    Top = 216
    object UeberweisTabID: TIntegerField
      FieldName = 'ID'
    end
    object UeberweisTabUWNUM: TIntegerField
      FieldName = 'UWNUM'
      Required = True
    end
    object UeberweisTabFERTIG: TIntegerField
      FieldName = 'FERTIG'
    end
    object UeberweisTabJOURNAL_ID: TIntegerField
      FieldName = 'JOURNAL_ID'
      Required = True
    end
    object UeberweisTabUW_DATUM: TDateField
      FieldName = 'UW_DATUM'
    end
    object UeberweisTabBETRAG: TFloatField
      FieldName = 'BETRAG'
    end
    object UeberweisTabKTO: TStringField
      FieldName = 'KTO'
    end
    object UeberweisTabBLZ: TStringField
      FieldName = 'BLZ'
      Size = 8
    end
    object UeberweisTabBINHABER: TStringField
      FieldName = 'BINHABER'
      Size = 50
    end
    object UeberweisTabUW_TEXT: TStringField
      FieldName = 'UW_TEXT'
      Size = 250
    end
    object UeberweisTabART: TStringField
      FieldName = 'ART'
      Size = 1
    end
  end
  object VerbuchTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = VerbuchTabAfterOpen
    AfterScroll = VerbuchTabAfterOpen
    BeforeDelete = UWTabBeforeDelete
    SQL.Strings = (
      
        'select * from UEBERWEISUNGEN where JOURNAL_ID=-1 and ART='#39'L'#39' ord' +
        'er by UW_DATUM')
    Params = <>
    Left = 444
    Top = 155
    object VerbuchTabID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object VerbuchTabUWNUM: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Lastschrift-Nr.'
      DisplayWidth = 8
      FieldName = 'UWNUM'
      Required = True
      DisplayFormat = '000000'
    end
    object VerbuchTabFERTIG: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Verbucht'
      DisplayWidth = 8
      FieldName = 'FERTIG'
      DisplayFormat = 'Ja;Storno;Nein'
    end
    object VerbuchTabJOURNAL_ID: TIntegerField
      FieldName = 'JOURNAL_ID'
      Required = True
      Visible = False
    end
    object VerbuchTabUW_DATUM: TDateField
      DisplayLabel = 'Datum'
      DisplayWidth = 9
      FieldName = 'UW_DATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object VerbuchTabBETRAG: TFloatField
      DisplayLabel = 'Betrag'
      FieldName = 'BETRAG'
      DisplayFormat = ',#0.00'
    end
    object VerbuchTabKTO: TStringField
      DisplayLabel = 'Kontonummer'
      DisplayWidth = 12
      FieldName = 'KTO'
    end
    object VerbuchTabBLZ: TStringField
      DisplayWidth = 8
      FieldName = 'BLZ'
      Size = 8
    end
    object VerbuchTabBINHABER: TStringField
      DisplayLabel = 'Konto-Inhaber'
      DisplayWidth = 22
      FieldName = 'BINHABER'
      Size = 50
    end
    object VerbuchTabUW_TEXT: TStringField
      DisplayLabel = 'Bank-K'#252'rzel'
      DisplayWidth = 22
      FieldName = 'UW_TEXT'
      Size = 250
    end
  end
  object VerbuchDS: TDataSource
    DataSet = VerbuchTab
    Left = 516
    Top = 155
  end
  object VerbuchDetailDS: TDataSource
    DataSet = VerbuchDetailTab
    Left = 540
    Top = 291
  end
  object VerbuchDetailTab: TZQuery
    Connection = DM1.DB1
    BeforeDelete = UWTabBeforeDelete
    SQL.Strings = (
      'select U.*, J.VRENUM, J.RDATUM, J.ORGNUM '
      'from UEBERWEISUNGEN U, JOURNAL J'
      
        'where U.JOURNAL_ID=J.REC_ID and U.JOURNAL_ID<>-1 and U.UWNUM=:UW' +
        'NUM and U.ART='#39'L'#39
      'order by UW_DATUM')
    Params = <
      item
        DataType = ftInteger
        Name = 'UWNUM'
        ParamType = ptInput
        Value = '1007'
      end>
    Left = 444
    Top = 291
    ParamData = <
      item
        DataType = ftInteger
        Name = 'UWNUM'
        ParamType = ptInput
        Value = '1007'
      end>
    object IntegerField4: TIntegerField
      Alignment = taCenter
      DisplayLabel = #220'berw.-Nr.'
      DisplayWidth = 8
      FieldName = 'UWNUM'
      Required = True
      Visible = False
      DisplayFormat = '000000'
    end
    object IntegerField8: TIntegerField
      FieldName = 'JOURNAL_ID'
      Required = True
      Visible = False
    end
    object DateField1: TDateField
      DisplayLabel = 'Datum'
      DisplayWidth = 9
      FieldName = 'UW_DATUM'
      Visible = False
      DisplayFormat = 'dd.mm.yyyy'
    end
    object VerbuchDetailTabVRENUM: TStringField
      DisplayLabel = 'RE-Nummer'
      DisplayWidth = 7
      FieldName = 'VRENUM'
      Required = True
    end
    object VerbuchDetailTabRDATUM: TDateField
      DisplayLabel = 'RE-Datum'
      DisplayWidth = 9
      FieldName = 'RDATUM'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object FloatField11: TFloatField
      DisplayLabel = 'Betrag'
      FieldName = 'BETRAG'
      DisplayFormat = ',#0.00'
    end
    object StringField1: TStringField
      DisplayLabel = 'Kontonummer'
      DisplayWidth = 12
      FieldName = 'KTO'
    end
    object StringField2: TStringField
      DisplayWidth = 8
      FieldName = 'BLZ'
      Size = 8
    end
    object StringField4: TStringField
      DisplayLabel = 'Konto-Inhaber'
      DisplayWidth = 22
      FieldName = 'BINHABER'
      Size = 50
    end
    object StringField12: TStringField
      DisplayLabel = #220'berweisungstext'
      DisplayWidth = 50
      FieldName = 'UW_TEXT'
      Size = 250
    end
  end
end
