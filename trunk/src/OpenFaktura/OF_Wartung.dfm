object WartungsForm: TWartungsForm
  Left = 56
  Top = 107
  Width = 999
  Height = 625
  BorderWidth = 1
  Caption = 'Wartungsdaten'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 989
    Height = 558
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 989
      Height = 26
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Caption = '  Wartungsdaten...'
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object SpeedButton2: TJvSpeedButton
        Tag = 2
        Left = 377
        Top = 0
        Width = 92
        Height = 22
        Caption = 'A&nlagendaten'
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
        OnMouseEnter = SpeedButtonMouseEnter
        OnMouseLeave = SpeedButtonMouseLeave
        OnClick = SpeedButtonClick
      end
      object SpeedButton4: TJvSpeedButton
        Tag = 1
        Left = 294
        Top = 0
        Width = 84
        Height = 22
        AllowAllUp = True
        Caption = '&Anlagenliste'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        ParentFont = False
        OnMouseEnter = SpeedButtonMouseEnter
        OnMouseLeave = SpeedButtonMouseLeave
        OnClick = SpeedButtonClick
      end
      object JvSpeedButton1: TJvSpeedButton
        Left = 781
        Top = 0
        Width = 75
        Height = 22
        Caption = 'Modul - &Info...'
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
        OnMouseEnter = SpeedButtonMouseEnter
        OnMouseLeave = SpeedButtonMouseLeave
        OnClick = JvSpeedButton1Click
      end
      object JvSpeedButton2: TJvSpeedButton
        Tag = 3
        Left = 470
        Top = 0
        Width = 99
        Height = 22
        Caption = '&Kundendetails'
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
        OnMouseEnter = SpeedButtonMouseEnter
        OnMouseLeave = SpeedButtonMouseLeave
        OnClick = SpeedButtonClick
      end
      object JvSpeedButton3: TJvSpeedButton
        Tag = 4
        Left = 570
        Top = 0
        Width = 108
        Height = 22
        Caption = '&Wartungstermine'
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
        OnMouseEnter = SpeedButtonMouseEnter
        OnMouseLeave = SpeedButtonMouseLeave
        OnClick = SpeedButtonClick
      end
      object JvSpeedButton4: TJvSpeedButton
        Tag = 5
        Left = 683
        Top = 0
        Width = 92
        Height = 22
        Caption = 'Adressen&liste'
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
        OnMouseEnter = SpeedButtonMouseEnter
        OnMouseLeave = SpeedButtonMouseLeave
        OnClick = SpeedButtonClick
      end
    end
    object WaDa_PC: TPageControl
      Left = 0
      Top = 26
      Width = 989
      Height = 532
      ActivePage = TabSheet2
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 1
      object TabSheet2: TTabSheet
        Caption = 'Anlagenliste'
        ImageIndex = 1
        OnExit = TabSheetExit
        OnShow = TabSheet2Show
        object CaoGroupBox4: TOFGroupBox
          Left = 0
          Top = 0
          Width = 981
          Height = 416
          Align = alClient
          Caption = ' Anlagenliste '
          Color = 14680063
          Ctl3D = True
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 0
          object ExRxDBGrid1: TExRxDBGrid
            Left = 8
            Top = 21
            Width = 965
            Height = 387
            Align = alClient
            BorderStyle = bsNone
            DataSource = DS_Uebersicht
            Options = [dgTitles, dgColumnResize, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = ExRxDBGrid1DblClick
            OnKeyPress = ExRxDBGrid1KeyPress
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 24
            TitleRowHeight = 24
            Controls = <>
            ScrollBars = ssHorizontal
            EditColor = clWindow
            DefaultRowHeight = 17
            OnApplyCellAttribute = ExRxDBGrid1ApplyCellAttribute
            GridAutoWidth = awProportional
            RowColor1 = 12255087
            RowColor2 = clWindow
            HighlightColor = clNavy
            ImageHighlightColor = clWindow
            HighlightFontColor = clWhite
            HotTrackColor = clNavy
            LockedCols = 0
            LockedFont.Charset = DEFAULT_CHARSET
            LockedFont.Color = clWindowText
            LockedFont.Height = -11
            LockedFont.Name = 'MS Sans Serif'
            LockedFont.Style = []
            LockedColor = clGray
            ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
            MaskedColumnDrag = True
            ValueChecked = 1
            ValueUnChecked = 0
            Columns = <
              item
                Expanded = False
                FieldName = 'NAME1'
                Title.Caption = 'Kundenname'
                Width = 130
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BESCHREIBUNG'
                Title.Caption = 'Kurzbeschreibung'
                Width = 819
                Visible = True
              end>
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 416
          Width = 981
          Height = 85
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            981
            85)
          object Label10: TLabel
            Left = 16
            Top = 48
            Width = 116
            Height = 13
            Caption = 'Filter Kurzbezeichnung...'
          end
          object Label11: TLabel
            Left = 16
            Top = 8
            Width = 97
            Height = 13
            Caption = 'Filter Kundenname...'
          end
          object SuchBeg: TJvEdit
            Left = 16
            Top = 64
            Width = 953
            Height = 21
            Modified = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnChange = SuchFeldChange
            OnEnter = EditEnter
            OnExit = EditExit
          end
          object SuchName: TJvEdit
            Left = 16
            Top = 24
            Width = 953
            Height = 21
            Modified = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = SuchFeldChange
            OnEnter = EditEnter
            OnExit = EditExit
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Anlagendaten'
        OnExit = TabSheetExit
        OnShow = TabSheet1Show
        object Splitter1: TSplitter
          Left = 799
          Top = 44
          Width = 1
          Height = 457
          Align = alRight
        end
        object CaoGroupBox3: TOFGroupBox
          Left = 0
          Top = 44
          Width = 799
          Height = 457
          Align = alClient
          Caption = 'Anlage'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            799
            457)
          object Label_Bemerkung: TLabel
            Left = 663
            Top = 1
            Width = 131
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Bemerkung beachten!'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
          object Panel1: TPanel
            Left = 8
            Top = 21
            Width = 783
            Height = 28
            Align = alTop
            BevelOuter = bvNone
            Color = 14680063
            TabOrder = 0
            DesignSize = (
              783
              28)
            object Label28: TLabel
              Tag = 1000
              Left = 2
              Top = 3
              Width = 85
              Height = 13
              Caption = 'Kurzbezeichnung:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object VolgaDBEdit2: TVolgaDBEdit
              Left = 96
              Top = 0
              Width = 686
              Height = 19
              Anchors = [akLeft, akTop, akRight]
              Ctl3D = False
              DataField = 'BESCHREIBUNG'
              DataSource = DS_Anlagen
              MaxLength = 254
              ParentCtl3D = False
              TabOrder = 0
              OnEnter = EditEnter
              OnExit = EditExit
            end
          end
          object PageControl1: TPageControl
            Left = 8
            Top = 49
            Width = 783
            Height = 375
            ActivePage = TabSheet7
            Align = alClient
            TabOrder = 1
            object TabSheet6: TTabSheet
              Caption = 'Lebenslauf'
              object DBMemo_Lebenslauf: TDBMemo
                Left = 0
                Top = 0
                Width = 775
                Height = 347
                Align = alClient
                Ctl3D = False
                DataField = 'LEBENSLAUF'
                DataSource = DS_Anlagen
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = []
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                WantTabs = True
                OnEnter = EditEnter
                OnExit = EditExit
              end
            end
            object TabSheet7: TTabSheet
              Caption = 'Beschreibung'
              ImageIndex = 1
              object DBMemo1: TDBMemo
                Left = 0
                Top = 0
                Width = 775
                Height = 347
                Align = alClient
                Ctl3D = False
                DataField = 'LISTE'
                DataSource = DS_Anlagen
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = []
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                WantTabs = True
                OnEnter = EditEnter
                OnExit = EditExit
              end
            end
            object TabSheet8: TTabSheet
              Caption = 'Bemerkung'
              ImageIndex = 2
              object Panel9: TPanel
                Left = 0
                Top = 0
                Width = 137
                Height = 347
                Align = alLeft
                BevelOuter = bvNone
                Color = 14680063
                TabOrder = 0
                object DBCheckBox1: TDBCheckBox
                  Left = 8
                  Top = 8
                  Width = 121
                  Height = 17
                  Caption = 'Aktivkohle wechseln'
                  DataField = 'BEM_OPT1'
                  DataSource = DS_Anlagen
                  TabOrder = 0
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCheckBox2: TDBCheckBox
                  Left = 8
                  Top = 24
                  Width = 121
                  Height = 17
                  Caption = #214'l mitbringen'
                  DataField = 'BEM_OPT2'
                  DataSource = DS_Anlagen
                  TabOrder = 1
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCheckBox3: TDBCheckBox
                  Left = 8
                  Top = 40
                  Width = 121
                  Height = 17
                  Caption = 'K'#252'hler K'#228'rchern'
                  DataField = 'BEM_OPT3'
                  DataSource = DS_Anlagen
                  TabOrder = 2
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCheckBox4: TDBCheckBox
                  Left = 8
                  Top = 56
                  Width = 129
                  Height = 17
                  Caption = 'Ersatzkompressor'
                  DataField = 'BEM_OPT4'
                  DataSource = DS_Anlagen
                  TabOrder = 3
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCheckBox5: TDBCheckBox
                  Left = 8
                  Top = 72
                  Width = 129
                  Height = 17
                  Caption = 'Filterelemente'
                  DataField = 'BEM_OPT5'
                  DataSource = DS_Anlagen
                  TabOrder = 4
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCheckBox6: TDBCheckBox
                  Left = 8
                  Top = 88
                  Width = 97
                  Height = 17
                  Caption = 'Trockenmittel'
                  DataField = 'BEM_OPT6'
                  DataSource = DS_Anlagen
                  TabOrder = 5
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCheckBox7: TDBCheckBox
                  Left = 8
                  Top = 104
                  Width = 121
                  Height = 17
                  Caption = 'Taupunktmessung'
                  DataField = 'BEM_OPT7'
                  DataSource = DS_Anlagen
                  TabOrder = 6
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCheckBox8: TDBCheckBox
                  Left = 8
                  Top = 120
                  Width = 97
                  Height = 17
                  Caption = 'Druckmessung'
                  DataField = 'BEM_OPT8'
                  DataSource = DS_Anlagen
                  TabOrder = 7
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCheckBox9: TDBCheckBox
                  Left = 8
                  Top = 136
                  Width = 105
                  Height = 17
                  Caption = 'Mengenmessung'
                  DataField = 'BEM_OPT9'
                  DataSource = DS_Anlagen
                  TabOrder = 8
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
              end
              object DBMemo_Bemerkung: TDBMemo
                Left = 137
                Top = 0
                Width = 638
                Height = 347
                Align = alClient
                Ctl3D = False
                DataField = 'BEMERKUNG'
                DataSource = DS_Anlagen
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = []
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 1
                WantTabs = True
                OnEnter = EditEnter
                OnExit = EditExit
              end
            end
            object TabSheet9: TTabSheet
              Caption = 'Ansprechpartner'
              ImageIndex = 3
              object ExRxDBGrid6: TExRxDBGrid
                Left = 0
                Top = 0
                Width = 775
                Height = 347
                Align = alClient
                BorderStyle = bsNone
                Ctl3D = True
                DataSource = DS_Ansprechpartner
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ParentCtl3D = False
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
                Controls = <>
                ScrollBars = ssHorizontal
                EditColor = clWindow
                DefaultRowHeight = 17
                GridAutoWidth = awWidestValueTitle
                RowColor1 = 12255087
                RowColor2 = clWindow
                AllowAutoAppend = False
                HighlightColor = clNavy
                ImageHighlightColor = clWindow
                HighlightFontColor = clWhite
                HotTrackColor = clNavy
                LockedCols = 0
                LockedFont.Charset = DEFAULT_CHARSET
                LockedFont.Color = clWindowText
                LockedFont.Height = -11
                LockedFont.Name = 'MS Sans Serif'
                LockedFont.Style = []
                LockedColor = clGray
                ShowTextEllipsis = True
                ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
                MaskedColumnDrag = False
                ValueChecked = 1
                ValueUnChecked = 0
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ANREDE'
                    Title.Caption = 'Anrede'
                    Width = 41
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NAME'
                    Title.Caption = 'Name'
                    Width = 35
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VORNAME'
                    Title.Caption = 'Vorname'
                    Width = 49
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TELEFON'
                    Title.Caption = 'Telefon'
                    Width = 43
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MOBILFUNK'
                    Title.Caption = 'Mobilfunk'
                    Width = 53
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TELEFAX'
                    Title.Caption = 'Telefax'
                    Width = 42
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TELEPRIVAT'
                    Title.Caption = 'Privat'
                    Width = 34
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'EMAIL'
                    Title.Caption = 'E-Mail'
                    Width = 36
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FUNKTION'
                    Title.Caption = 'Funktion'
                    Width = 48
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'STRASSE'
                    Title.Caption = 'Stra'#223'e'
                    Width = 38
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LAND'
                    Title.Caption = 'Land'
                    Width = 31
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PLZ'
                    Width = 27
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ORT'
                    Title.Caption = 'Ort'
                    Width = 21
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'GEBDATUM'
                    Title.Caption = 'Geburtsdatum'
                    Width = 73
                    Visible = True
                  end>
              end
            end
            object TabSheet10: TTabSheet
              Caption = 'Terminverwaltung'
              ImageIndex = 4
              object Label29: TLabel
                Left = 16
                Top = 24
                Width = 84
                Height = 13
                Caption = 'letzte Wartung'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label30: TLabel
                Left = 152
                Top = 24
                Width = 101
                Height = 13
                Caption = 'Intervall [Monate]'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label31: TLabel
                Left = 288
                Top = 24
                Width = 94
                Height = 13
                Caption = 'N'#228'chster Termin'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label32: TLabel
                Left = 424
                Top = 24
                Width = 115
                Height = 13
                Caption = 'W - Vertragsnummer'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Termin: TEdit
                Left = 288
                Top = 40
                Width = 121
                Height = 19
                TabStop = False
                Color = clBtnFace
                Ctl3D = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentCtl3D = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object L_Wartung: TVolgaDBEdit
                Left = 16
                Top = 40
                Width = 121
                Height = 19
                Ctl3D = False
                DataField = 'WARTUNG'
                DataSource = DS_Anlagen
                DialogStyle = vdsCalendar
                ParentCtl3D = False
                TabOrder = 1
                OnEnter = EditEnter
                OnExit = VolgaDBEdit10Exit
              end
              object Intervall: TVolgaDBEdit
                Left = 152
                Top = 40
                Width = 121
                Height = 19
                Alignment = taRightJustify
                Ctl3D = False
                DataField = 'INTERVALL'
                DataSource = DS_Anlagen
                MaxLength = 4
                ParentCtl3D = False
                TabOrder = 2
                OnChange = VolgaDBEdit11Change
                OnEnter = EditEnter
                OnExit = EditExit
              end
              object BitBtn3: TBitBtn
                Left = 16
                Top = 72
                Width = 121
                Height = 25
                Caption = 'Wartung erledigt'
                TabOrder = 3
                OnClick = BitBtn1Click
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                  555555555555555555555555555555555555555555FF55555555555559055555
                  55555555577FF5555555555599905555555555557777F5555555555599905555
                  555555557777FF5555555559999905555555555777777F555555559999990555
                  5555557777777FF5555557990599905555555777757777F55555790555599055
                  55557775555777FF5555555555599905555555555557777F5555555555559905
                  555555555555777FF5555555555559905555555555555777FF55555555555579
                  05555555555555777FF5555555555557905555555555555777FF555555555555
                  5990555555555555577755555555555555555555555555555555}
                NumGlyphs = 2
              end
              object WVNummer: TVolgaDBEdit
                Left = 424
                Top = 40
                Width = 121
                Height = 19
                Alignment = taRightJustify
                Ctl3D = False
                DataField = 'WVERTRAG_NR'
                DataSource = DS_Anlagen
                MaxLength = 4
                ParentCtl3D = False
                TabOrder = 4
                OnChange = VolgaDBEdit11Change
                OnEnter = EditEnter
                OnExit = EditExit
              end
              object DBRadioGroup3: TDBRadioGroup
                Left = 16
                Top = 120
                Width = 185
                Height = 105
                Caption = ' Art der n'#228'chsten Wartung '
                DataField = 'WARTUNG_TYP'
                DataSource = DS_Anlagen
                Items.Strings = (
                  'kleine Wartung'
                  'gro'#223'e Wartung'
                  'immer gro'#223'e Wartung')
                TabOrder = 5
              end
              object DBRadioGroup4: TDBRadioGroup
                Left = 216
                Top = 120
                Width = 185
                Height = 105
                Caption = ' Wartungsvertrag '
                DataField = 'WVERTRAG'
                DataSource = DS_Anlagen
                Items.Strings = (
                  'nicht vorhanden'
                  'vorhanden'
                  'nicht gew'#252'nscht')
                TabOrder = 6
              end
            end
          end
          object DBNavigator1: TDBNavigator
            Left = 8
            Top = 424
            Width = 783
            Height = 25
            DataSource = DS_Anlagen
            VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel]
            Align = alBottom
            Flat = True
            Ctl3D = True
            ParentCtl3D = False
            ConfirmDelete = False
            TabOrder = 2
            BeforeAction = DBNavigator1BeforeAction
          end
        end
        object CaoGroupBox5: TOFGroupBox
          Left = 0
          Top = 0
          Width = 981
          Height = 44
          Align = alTop
          Caption = 'Kunde'
          Color = 14680063
          Enabled = False
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 0
          DesignSize = (
            981
            44)
          object Label4: TLabel
            Left = 5
            Top = 23
            Width = 81
            Height = 13
            AutoSize = False
            Caption = 'Kundenname:'
          end
          object VolgaDBEdit1: TVolgaDBEdit
            Left = 104
            Top = 20
            Width = 865
            Height = 19
            Anchors = [akLeft, akTop, akRight]
            Ctl3D = False
            DataField = 'NAME1'
            DataSource = DS_KundenListe
            ParentCtl3D = False
            TabOrder = 0
          end
        end
        object CaoGroupBox2: TOFGroupBox
          Left = 800
          Top = 44
          Width = 181
          Height = 457
          Align = alRight
          Caption = 'Anlagenliste'
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 1
          object ExRxDBGrid2: TExRxDBGrid
            Left = 8
            Top = 21
            Width = 165
            Height = 428
            Align = alClient
            BorderStyle = bsNone
            Ctl3D = True
            DataSource = DS_Anlagen
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgColumnResize, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = ExRxDBGrid4CellClick
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 24
            TitleRowHeight = 24
            Controls = <>
            ScrollBars = ssHorizontal
            EditColor = clWindow
            DefaultRowHeight = 17
            OnApplyCellAttribute = ExRxDBGrid4ApplyCellAttribute
            RowColor1 = 12255087
            RowColor2 = clWindow
            HighlightColor = clNavy
            ImageHighlightColor = clWindow
            HighlightFontColor = clWhite
            HotTrackColor = clNavy
            LockedCols = 0
            LockedFont.Charset = DEFAULT_CHARSET
            LockedFont.Color = clWindowText
            LockedFont.Height = -11
            LockedFont.Name = 'MS Sans Serif'
            LockedFont.Style = []
            LockedColor = clGray
            ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
            MaskedColumnDrag = True
            ValueChecked = 1
            ValueUnChecked = 0
            Columns = <
              item
                Expanded = False
                FieldName = 'BESCHREIBUNG'
                ReadOnly = True
                Title.Caption = 'Anlagenliste'
                Visible = True
              end>
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Kundendetails'
        ImageIndex = 2
        OnExit = TabSheetExit
        object KunAlgRightPan: TPanel
          Left = 739
          Top = 0
          Width = 242
          Height = 501
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object KommunikationGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 242
            Height = 501
            Align = alClient
            Caption = 'Kommunikation'
            Color = 14680063
            Ctl3D = False
            Enabled = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 0
            object Label20: TLabel
              Left = 5
              Top = 22
              Width = 52
              Height = 13
              AutoSize = False
              Caption = 'Telefon:'
              FocusControl = tele1
            end
            object Label21: TLabel
              Left = 5
              Top = 43
              Width = 52
              Height = 13
              AutoSize = False
              Caption = 'Telefon 2:'
              FocusControl = tele2
            end
            object Label22: TLabel
              Left = 5
              Top = 64
              Width = 52
              Height = 13
              AutoSize = False
              Caption = 'Telefax:'
              FocusControl = fax
            end
            object Label23: TLabel
              Left = 5
              Top = 85
              Width = 52
              Height = 13
              AutoSize = False
              Caption = 'Mobilfunk:'
              FocusControl = funk
            end
            object JvLabel1: TJvLabel
              Left = 5
              Top = 110
              Width = 52
              Height = 13
              Cursor = crHandPoint
              Hint = 'neue email mit dieser Adresse erstellen'
              AutoSize = False
              Caption = 'eMail:'
              HotTrack = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlue
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = [fsUnderline]
            end
            object Label42: TJvLabel
              Left = 5
              Top = 131
              Width = 52
              Height = 13
              Cursor = crHandPoint
              Hint = 'Internetseite aufrufen'
              AutoSize = False
              Caption = 'Internet:'
              HotTrack = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlue
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = [fsUnderline]
            end
            object Label44: TLabel
              Left = 5
              Top = 154
              Width = 52
              Height = 13
              AutoSize = False
              Caption = 'Diverses:'
            end
            object Label1: TLabel
              Left = 16
              Top = 480
              Width = 206
              Height = 10
              Caption = '< Bearbeiten mit Stammdaten -> Adressen >'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -8
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object tele1: TDBEdit
              Tag = 1
              Left = 55
              Top = 18
              Width = 179
              Height = 21
              AutoSelect = False
              AutoSize = False
              DataField = 'TELE1'
              DataSource = DS_KundenListe
              TabOrder = 0
            end
            object tele2: TDBEdit
              Tag = 1
              Left = 55
              Top = 40
              Width = 179
              Height = 21
              AutoSelect = False
              AutoSize = False
              DataField = 'TELE2'
              DataSource = DS_KundenListe
              TabOrder = 1
            end
            object fax: TDBEdit
              Tag = 1
              Left = 55
              Top = 62
              Width = 179
              Height = 21
              AutoSelect = False
              AutoSize = False
              DataField = 'FAX'
              DataSource = DS_KundenListe
              TabOrder = 2
            end
            object funk: TDBEdit
              Tag = 1
              Left = 55
              Top = 84
              Width = 179
              Height = 21
              AutoSelect = False
              AutoSize = False
              DataField = 'funk'
              DataSource = DS_KundenListe
              TabOrder = 3
            end
            object email: TDBEdit
              Tag = 1
              Left = 55
              Top = 106
              Width = 179
              Height = 21
              AutoSelect = False
              AutoSize = False
              DataField = 'EMAIL'
              DataSource = DS_KundenListe
              TabOrder = 4
            end
            object internet: TDBEdit
              Tag = 1
              Left = 55
              Top = 128
              Width = 179
              Height = 21
              AutoSelect = False
              AutoSize = False
              DataField = 'INTERNET'
              DataSource = DS_KundenListe
              TabOrder = 5
            end
            object divers1: TDBEdit
              Tag = 1
              Left = 55
              Top = 150
              Width = 179
              Height = 21
              AutoSelect = False
              AutoSize = False
              DataField = 'DIVERSES'
              DataSource = DS_KundenListe
              TabOrder = 6
            end
          end
        end
        object KunAlgLeftPan: TPanel
          Left = 0
          Top = 0
          Width = 739
          Height = 501
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object AnschriftGB: TOFGroupBox
            Left = 0
            Top = 134
            Width = 739
            Height = 188
            Align = alTop
            Caption = 'Anschrift'
            Color = 14680063
            Ctl3D = False
            Enabled = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 2
            object Label43: TLabel
              Left = 5
              Top = 165
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Land/Plz/Postf.:'
            end
            object Label12: TLabel
              Left = 5
              Top = 145
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Land/Plz/Ort:'
            end
            object Label13: TLabel
              Left = 5
              Top = 125
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Strasse:'
              FocusControl = strasse
            end
            object Label14: TLabel
              Left = 5
              Top = 105
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'z.Hd. von:'
              FocusControl = abteilung
            end
            object Label15: TLabel
              Left = 5
              Top = 85
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Name 3:'
              FocusControl = name3
            end
            object Label16: TLabel
              Left = 5
              Top = 66
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Name 2:'
              FocusControl = name2
            end
            object AddAdressToOutlookLabel: TJvLabel
              Left = 5
              Top = 46
              Width = 79
              Height = 13
              Cursor = crHandPoint
              Hint = 'Adresse nach Outlook '#252'bernehmen'
              AutoSize = False
              Caption = 'Name 1:'
              FocusControl = name1
              HotTrack = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlue
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = [fsUnderline]
            end
            object Label17: TLabel
              Left = 5
              Top = 25
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Anrede:'
            end
            object name1: TDBEdit
              Tag = 1
              Left = 86
              Top = 42
              Width = 645
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'NAME1'
              DataSource = DS_KundenListe
              TabOrder = 1
            end
            object name2: TDBEdit
              Tag = 1
              Left = 86
              Top = 62
              Width = 645
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'NAME2'
              DataSource = DS_KundenListe
              TabOrder = 2
            end
            object name3: TDBEdit
              Tag = 1
              Left = 86
              Top = 82
              Width = 645
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'NAME3'
              DataSource = DS_KundenListe
              TabOrder = 3
            end
            object abteilung: TDBEdit
              Tag = 1
              Left = 86
              Top = 102
              Width = 645
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'ABTEILUNG'
              DataSource = DS_KundenListe
              TabOrder = 4
            end
            object strasse: TDBEdit
              Tag = 1
              Left = 86
              Top = 122
              Width = 645
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'STRASSE'
              DataSource = DS_KundenListe
              TabOrder = 5
            end
            object Ort: TJvDBComboEdit
              Tag = 2
              Left = 166
              Top = 142
              Width = 565
              Height = 19
              AutoSelect = False
              ButtonHint = 'Ortsverzeichnis aufrufen'
              DataField = 'ORT'
              DataSource = DS_KundenListe
              ImageKind = ikEllipsis
              ButtonWidth = 16
              TabOrder = 8
            end
            object Postfach: TJvDBComboEdit
              Tag = 2
              Left = 166
              Top = 162
              Width = 565
              Height = 19
              AutoSelect = False
              ButtonHint = 'Ortsverzeichnis aufrufen'
              DataField = 'POSTFACH'
              DataSource = DS_KundenListe
              ImageKind = ikEllipsis
              ButtonWidth = 16
              TabOrder = 11
            end
            object PF_PLZ: TJvDBComboEdit
              Left = 108
              Top = 162
              Width = 57
              Height = 19
              AutoSelect = False
              ButtonHint = 'Postleitzahlenverzeichis aufrufen'
              DataField = 'PF_PLZ'
              DataSource = DS_KundenListe
              ImageKind = ikEllipsis
              ButtonWidth = 16
              TabOrder = 10
            end
            object PLZ: TJvDBComboEdit
              Left = 108
              Top = 142
              Width = 57
              Height = 19
              AutoSelect = False
              ButtonHint = 'Postleitzahlenverzeichis aufrufen'
              DataField = 'PLZ'
              DataSource = DS_KundenListe
              ImageKind = ikEllipsis
              ButtonWidth = 16
              TabOrder = 7
            end
            object Land: TDBEdit
              Left = 86
              Top = 142
              Width = 20
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'LAND'
              DataSource = DS_KundenListe
              TabOrder = 6
            end
            object PF_Land: TDBEdit
              Left = 86
              Top = 162
              Width = 20
              Height = 19
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'LAND'
              DataSource = DS_KundenListe
              ReadOnly = True
              TabOrder = 9
            end
            object Anrede: TVolgaDBEdit
              Tag = 1
              Left = 86
              Top = 22
              Width = 645
              Height = 19
              ButtonWidth = 17
              ComboProps.ComboItems.Strings = (
                'B'#252'rgermeister'
                'Doktor'
                'Familie'
                'Firma'
                'Frau'
                'Herr'
                'Pfarrer'
                'Professor')
              DataField = 'ANREDE'
              DataSource = DS_KundenListe
              DialogStyle = vdsCombo
              TabOrder = 0
            end
          end
          object SuchbegrGB: TOFGroupBox
            Left = 0
            Top = 0
            Width = 739
            Height = 68
            Align = alTop
            Caption = 'Suchbegriffe'
            Color = 14680063
            Ctl3D = False
            Enabled = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 0
            object Label24: TLabel
              Left = 5
              Top = 23
              Width = 77
              Height = 13
              AutoSize = False
              Caption = 'Suchbegriff:'
            end
            object Label25: TLabel
              Left = 5
              Top = 46
              Width = 79
              Height = 13
              AutoSize = False
              Caption = 'Kunden-Nr.:'
            end
            object Label36: TLabel
              Left = 132
              Top = 46
              Width = 65
              Height = 13
              AutoSize = False
              Caption = 'Lieferant-Nr.:'
            end
            object DBEdit2: TDBEdit
              Left = 86
              Top = 43
              Width = 42
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'KUNNUM1'
              DataSource = DS_KundenListe
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Tag = 1
              Left = 196
              Top = 43
              Width = 535
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'KUNNUM2'
              DataSource = DS_KundenListe
              TabOrder = 2
            end
            object match: TDBEdit
              Tag = 1
              Left = 86
              Top = 20
              Width = 645
              Height = 19
              AutoSelect = False
              AutoSize = False
              DataField = 'MATCHCODE'
              DataSource = DS_KundenListe
              TabOrder = 0
            end
          end
          object ZuweisungenGB: TOFGroupBox
            Left = 0
            Top = 68
            Width = 739
            Height = 66
            Align = alTop
            Caption = 'Zuweisungen'
            Color = 14680063
            Ctl3D = False
            Enabled = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 1
            object Label18: TLabel
              Left = 5
              Top = 44
              Width = 53
              Height = 13
              AutoSize = False
              Caption = 'Selektion:'
              FocusControl = gruppe
            end
            object Label71: TLabel
              Left = 5
              Top = 25
              Width = 53
              Height = 13
              AutoSize = False
              Caption = 'Kundengr:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object gruppe: TDBEdit
              Tag = 1
              Left = 86
              Top = 41
              Width = 645
              Height = 19
              AutoSelect = False
              DataField = 'GRUPPE'
              DataSource = DS_KundenListe
              TabOrder = 1
            end
            object KunGR1: TDBLookupComboBox
              Tag = 1
              Left = 86
              Top = 21
              Width = 645
              Height = 19
              DataField = 'KUNDENGRUPPE'
              DataSource = DS_KundenListe
              KeyField = 'GR'
              ListField = 'LANGBEZ'
              TabOrder = 0
            end
          end
          object InfoGB: TOFGroupBox
            Left = 0
            Top = 322
            Width = 739
            Height = 179
            Align = alClient
            Caption = 'Info'
            Color = 14680063
            Ctl3D = False
            Enabled = False
            FrameColor = clBtnFace
            TitleColor = 14680063
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 3
            object InfoMemo: TDBMemo
              Left = 8
              Top = 21
              Width = 723
              Height = 150
              Hint = 'Zeilenumbruch mit Strg+Enter'
              Align = alClient
              DataField = 'INFO'
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Wartungstermine'
        ImageIndex = 3
        OnExit = TabSheetExit
        OnShow = TabSheet4Show
        object CaoGroupBox1: TOFGroupBox
          Left = 0
          Top = 0
          Width = 981
          Height = 448
          Align = alClient
          Caption = ' Wartungstermine '
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 0
          object ExRxDBGrid3: TExRxDBGrid
            Left = 8
            Top = 21
            Width = 965
            Height = 419
            Align = alClient
            BorderStyle = bsNone
            Ctl3D = True
            DataSource = DS_Wartungsliste
            Options = [dgTitles, dgColumnResize, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = ExRxDBGrid3DblClick
            OnKeyPress = ExRxDBGrid3KeyPress
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 24
            TitleRowHeight = 24
            Controls = <>
            ScrollBars = ssHorizontal
            EditColor = clWindow
            DefaultRowHeight = 17
            OnApplyCellAttribute = ExRxDBGrid3ApplyCellAttribute
            GridAutoWidth = awProportional
            RowColor1 = 12255087
            RowColor2 = clWindow
            HighlightColor = clNavy
            ImageHighlightColor = clWindow
            HighlightFontColor = clWhite
            HotTrackColor = clNavy
            LockedCols = 0
            LockedFont.Charset = DEFAULT_CHARSET
            LockedFont.Color = clWindowText
            LockedFont.Height = -11
            LockedFont.Name = 'MS Sans Serif'
            LockedFont.Style = []
            LockedColor = clGray
            ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
            MaskedColumnDrag = True
            ValueChecked = 1
            ValueUnChecked = 0
            Columns = <
              item
                Expanded = False
                FieldName = 'TERMIN'
                Title.Caption = 'Termin'
                Width = 140
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NAME1'
                Title.Caption = 'Kundenname'
                Width = 534
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WVERTRAG'
                Title.Caption = 'Wartungsvertrag'
                Width = 272
                Visible = True
              end>
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 448
          Width = 981
          Height = 53
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Label3: TLabel
            Left = 16
            Top = 8
            Width = 59
            Height = 13
            Caption = 'Termine von'
          end
          object Label9: TLabel
            Left = 120
            Top = 8
            Width = 13
            Height = 13
            Caption = 'bis'
          end
          object DateTimePicker1: TDateTimePicker
            Left = 16
            Top = 24
            Width = 89
            Height = 21
            Date = 37789.408138148100000000
            Time = 37789.408138148100000000
            TabOrder = 0
          end
          object DateTimePicker2: TDateTimePicker
            Left = 120
            Top = 24
            Width = 89
            Height = 21
            Date = 37789.408208854200000000
            Time = 37789.408208854200000000
            TabOrder = 1
          end
          object BitBtn2: TBitBtn
            Left = 216
            Top = 24
            Width = 105
            Height = 25
            Caption = 'Aktualisieren'
            TabOrder = 2
            OnClick = BitBtn2Click
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333FF3FF3333333333CC30003333333333773777333333333C33
              3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
              33003377333337F33377333333333C333300333F333337F33377339333333C33
              3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
              330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
              330077F377F337F33377993399333C33330077FF773337F33377399993333C33
              33333777733337F333FF333333333C33300033333333373FF7773333333333CC
              3000333333333377377733333333333333333333333333333333}
            NumGlyphs = 2
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Adressenliste'
        ImageIndex = 4
        OnExit = TabSheetExit
        OnShow = TabSheet5Show
        object CaoGroupBox6: TOFGroupBox
          Left = 0
          Top = 0
          Width = 981
          Height = 448
          Align = alClient
          Caption = ' Adressenliste '
          Color = 14680063
          FrameColor = clBtnFace
          TitleColor = 14680063
          ParentColor = False
          TabOrder = 0
          object ExRxDBGrid5: TExRxDBGrid
            Left = 8
            Top = 21
            Width = 965
            Height = 419
            Align = alClient
            BorderStyle = bsNone
            DataSource = DataSource1
            Options = [dgTitles, dgColumnResize, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = ExRxDBGrid5DblClick
            OnKeyPress = ExRxDBGrid5KeyPress
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 24
            TitleRowHeight = 24
            Controls = <>
            ScrollBars = ssHorizontal
            EditColor = clWindow
            DefaultRowHeight = 17
            GridAutoWidth = awProportional
            RowColor1 = 12255087
            RowColor2 = clWindow
            HighlightColor = clNavy
            ImageHighlightColor = clWindow
            HighlightFontColor = clWhite
            HotTrackColor = clNavy
            LockedCols = 0
            LockedFont.Charset = DEFAULT_CHARSET
            LockedFont.Color = clWindowText
            LockedFont.Height = -11
            LockedFont.Name = 'MS Sans Serif'
            LockedFont.Style = []
            LockedColor = clGray
            ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
            MaskedColumnDrag = True
            ValueChecked = 1
            ValueUnChecked = 0
            Columns = <
              item
                Expanded = False
                FieldName = 'NAME1'
                Title.Caption = 'Kundenname'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STRASSE'
                Title.Caption = 'Stra'#223'e'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PLZ'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ORT'
                Title.Caption = 'Ort'
                Visible = True
              end>
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 448
          Width = 981
          Height = 53
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            981
            53)
          object Label2: TLabel
            Left = 16
            Top = 8
            Width = 97
            Height = 13
            Caption = 'Filter Kundenname...'
          end
          object JvEdit2: TJvEdit
            Left = 16
            Top = 24
            Width = 953
            Height = 21
            Modified = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = SuchFeldChange
            OnEnter = EditEnter
            OnExit = EditExit
          end
        end
      end
    end
  end
  object SB1: TAdvStatusBar
    Left = 0
    Top = 558
    Width = 989
    Height = 19
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Panels = <
      item
        Alignment = taCenter
        Text = 'Suchzeit'
        Width = 80
      end
      item
        Alignment = taCenter
        Text = 'Satz 1 von 1'
        Width = 120
      end
      item
        Text = 'Sortierung'
        Width = 140
      end
      item
        Text = 'erstellt'
        Width = 120
      end
      item
        Text = 'geaend'
        Width = 120
      end
      item
        Width = 50
      end>
    UseSystemFont = False
    Visible = False
  end
  object MainMenu1: TJvMainMenu
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 832
    Top = 192
    object Modul1: TMenuItem
      Caption = 'Bearbeiten'
      GroupIndex = 2
      object Drucken1: TMenuItem
        Caption = 'Dr&ucken'
        ShortCut = 16464
        OnClick = Drucken1Click
      end
    end
    object Ansicht1: TMenuItem
      Caption = 'Ansicht'
      GroupIndex = 3
      object Kundenliste1: TMenuItem
        Tag = 1
        Caption = 'A&nlagenliste'
        Checked = True
        RadioItem = True
        OnClick = SpeedButtonClick
      end
      object Anlagendaten1: TMenuItem
        Tag = 2
        Caption = '&Anlagendaten'
        RadioItem = True
        OnClick = SpeedButtonClick
      end
      object Kundendetails: TMenuItem
        Tag = 3
        Caption = '&Kundendetails'
        RadioItem = True
        OnClick = SpeedButtonClick
      end
      object Wartungstermine1: TMenuItem
        Tag = 4
        Caption = '&Wartungstermine'
        RadioItem = True
        OnClick = SpeedButtonClick
      end
      object Kundenliste2: TMenuItem
        Tag = 5
        Caption = 'Adressen&liste'
        RadioItem = True
        OnClick = SpeedButtonClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Schnellbemerkung1: TMenuItem
        Caption = 'Schnellbemerkung'
        Checked = True
        OnClick = Schnellbemerkung1Click
      end
      object Anlagenliste1: TMenuItem
        Caption = 'Anlagenliste'
        Checked = True
        OnClick = Anlagenliste1Click
      end
    end
  end
  object DS_Uebersicht: TDataSource
    DataSet = Uebersicht
    Left = 864
    Top = 384
  end
  object Uebersicht: TZQuery
    Connection = DM1.DB1
    AfterScroll = UebersichtAfterScroll
    SQL.Strings = (
      
        'SELECT ADRESSEN.REC_ID as KID,WARTUNG.REC_ID as MID,NAME1,BESCHR' +
        'EIBUNG, BEMERKUNG, BEM_OPT1, BEM_OPT2, BEM_OPT3, BEM_OPT4, BEM_O' +
        'PT5, BEM_OPT6, BEM_OPT7, BEM_OPT8  FROM WARTUNG, ADRESSEN '
      'WHERE WARTUNG.ADDR_ID = ADRESSEN.REC_ID'
      'AND WARTUNG.BESCHREIBUNG LIKE :SuchBegr'
      'AND ADRESSEN.NAME1 LIKE :SuchName'
      'ORDER BY ADRESSEN.NAME1')
    Params = <
      item
        DataType = ftString
        Name = 'SuchBegr'
        ParamType = ptUnknown
        Value = '%'
      end
      item
        DataType = ftString
        Name = 'SuchName'
        ParamType = ptUnknown
        Value = '%%'
      end>
    Left = 832
    Top = 384
    ParamData = <
      item
        DataType = ftString
        Name = 'SuchBegr'
        ParamType = ptUnknown
        Value = '%'
      end
      item
        DataType = ftString
        Name = 'SuchName'
        ParamType = ptUnknown
        Value = '%%'
      end>
  end
  object ZMySqlQuery1: TZQuery
    Connection = DM1.DB1
    AfterScroll = ZMySqlQuery1AfterScroll
    SQL.Strings = (
      
        'SELECT *, REC_ID as KID FROM ADRESSEN WHERE NAME1 LIKE :KUNA ORD' +
        'ER BY NAME1')
    Params = <
      item
        DataType = ftString
        Name = 'KUNA'
        ParamType = ptUnknown
        Value = '%'
      end>
    Left = 832
    Top = 416
    ParamData = <
      item
        DataType = ftString
        Name = 'KUNA'
        ParamType = ptUnknown
        Value = '%'
      end>
  end
  object DataSource1: TDataSource
    DataSet = ZMySqlQuery1
    Left = 864
    Top = 416
  end
  object JvTimerList1: TJvTimerList
    Active = True
    Events = <>
    Left = 832
    Top = 224
  end
  object DS_KundenListe: TDataSource
    AutoEdit = False
    DataSet = KundenListe
    Left = 864
    Top = 320
  end
  object DS_Ansprechpartner: TDataSource
    AutoEdit = False
    DataSet = Ansprechpartner
    Left = 864
    Top = 288
  end
  object DS_Anlagen: TDataSource
    DataSet = Anlagen
    Left = 864
    Top = 256
  end
  object DS_Wartungsliste: TDataSource
    AutoEdit = False
    DataSet = Wartungsliste
    Left = 864
    Top = 352
  end
  object Anlagen: TZQuery
    Connection = DM1.DB1
    AfterScroll = AnlagenAfterScroll
    AfterInsert = AnlagenAfterInsert
    BeforePost = AnlagenBeforePost
    BeforeDelete = AnlagenBeforeDelete
    SQL.Strings = (
      'SELECT * FROM WARTUNG WHERE ADDR_ID = :ID ORDER BY REC_ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 832
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object AnlagenERSTELLT: TDateField
      FieldName = 'ERSTELLT'
    end
    object AnlagenERST_NAME: TStringField
      FieldName = 'ERST_NAME'
    end
    object AnlagenGEAENDERT: TDateField
      FieldName = 'GEAENDERT'
    end
    object AnlagenGEAEND_NAME: TStringField
      FieldName = 'GEAEND_NAME'
    end
    object AnlagenREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object AnlagenADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
    end
    object AnlagenBESCHREIBUNG: TStringField
      FieldName = 'BESCHREIBUNG'
      Size = 255
    end
    object AnlagenWARTUNG: TDateField
      FieldName = 'WARTUNG'
    end
    object AnlagenINTERVALL: TIntegerField
      FieldName = 'INTERVALL'
    end
    object AnlagenWVERTRAG: TStringField
      FieldName = 'WVERTRAG'
    end
    object AnlagenBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      BlobType = ftMemo
    end
    object AnlagenLEBENSLAUF: TMemoField
      FieldName = 'LEBENSLAUF'
      BlobType = ftMemo
    end
    object AnlagenLISTE: TMemoField
      FieldName = 'LISTE'
      BlobType = ftMemo
    end
    object AnlagenWARTUNG_TYP: TStringField
      FieldName = 'WARTUNG_TYP'
    end
    object AnlagenWVERTRAG_NR: TIntegerField
      FieldName = 'WVERTRAG_NR'
    end
    object AnlagenBEM_OPT1: TIntegerField
      FieldName = 'BEM_OPT1'
    end
    object AnlagenBEM_OPT2: TIntegerField
      FieldName = 'BEM_OPT2'
    end
    object AnlagenBEM_OPT3: TIntegerField
      FieldName = 'BEM_OPT3'
    end
    object AnlagenBEM_OPT4: TIntegerField
      FieldName = 'BEM_OPT4'
    end
    object AnlagenBEM_OPT5: TIntegerField
      FieldName = 'BEM_OPT5'
    end
    object AnlagenBEM_OPT6: TIntegerField
      FieldName = 'BEM_OPT6'
    end
    object AnlagenBEM_OPT7: TIntegerField
      FieldName = 'BEM_OPT7'
    end
    object AnlagenBEM_OPT8: TIntegerField
      FieldName = 'BEM_OPT8'
    end
    object AnlagenBEM_OPT9: TIntegerField
      FieldName = 'BEM_OPT9'
    end
  end
  object Ansprechpartner: TZQuery
    Connection = DM1.DB1
    AfterScroll = AnsprechpartnerAfterScroll
    SQL.Strings = (
      'SELECT * FROM APARTNER WHERE ADDR_ID=:ADDR_ID')
    Params = <
      item
        DataType = ftString
        Name = 'ADDR_ID'
        ParamType = ptUnknown
        Value = '46'
      end>
    Left = 832
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'ADDR_ID'
        ParamType = ptUnknown
        Value = '46'
      end>
  end
  object Wartungsliste: TZQuery
    Connection = DM1.DB1
    AfterScroll = WartungslisteAfterScroll
    SQL.Strings = (
      
        'SELECT WARTUNG.ADDR_ID as KID, WARTUNG.REC_ID as MID, ADRESSEN.N' +
        'AME1, BESCHREIBUNG, BEMERKUNG, BEM_OPT1, BEM_OPT2,BEM_OPT3,BEM_O' +
        'PT4,BEM_OPT5,BEM_OPT6,BEM_OPT7,BEM_OPT8,WVERTRAG, '
      
        'DATE_FORMAT(DATE_ADD(WARTUNG, interval INTERVALL month),'#39'%d.%m.%' +
        'Y'#39') as TERMIN  '
      'FROM WARTUNG, ADRESSEN'
      'WHERE '
      '(DATE_ADD(WARTUNG, interval INTERVALL month) >= :VON'
      'and '
      'DATE_ADD(WARTUNG, interval INTERVALL month) <= :BIS'
      'and'
      'INTERVALL <> 0 and ADRESSEN.REC_ID = ADDR_ID)'
      'ORDER BY DATE_ADD(WARTUNG, interval INTERVALL month)')
    Params = <
      item
        DataType = ftDate
        Name = 'VON'
        ParamType = ptUnknown
        Value = '2003-01-01'
      end
      item
        DataType = ftDate
        Name = 'BIS'
        ParamType = ptUnknown
        Value = '2003-12-01'
      end>
    Left = 832
    Top = 352
    ParamData = <
      item
        DataType = ftDate
        Name = 'VON'
        ParamType = ptUnknown
        Value = '2003-01-01'
      end
      item
        DataType = ftDate
        Name = 'BIS'
        ParamType = ptUnknown
        Value = '2003-12-01'
      end>
  end
  object KundenListe: TZQuery
    Connection = DM1.DB1
    AfterScroll = KundenListeAfterScroll
    SQL.Strings = (
      'SELECT * FROM ADRESSEN WHERE REC_ID=46')
    Params = <>
    Left = 832
    Top = 320
  end
end
