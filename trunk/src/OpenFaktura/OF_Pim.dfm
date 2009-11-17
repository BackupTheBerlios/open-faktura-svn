object PimForm: TPimForm
  Left = 299
  Top = 137
  Width = 791
  Height = 630
  Caption = 'PIM'
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
    Width = 783
    Height = 584
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TJvxSplitter
      Left = 432
      Top = 0
      Width = 5
      Height = 584
      ControlFirst = PanelCalSplit1
      ControlSecond = PanelCalSplit2
      Align = alRight
      BevelInner = bvRaised
      Ctl3D = True
      TopLeftLimit = 300
      BottomRightLimit = 300
    end
    object PanelCalSplit1: TPanel
      Left = 0
      Top = 0
      Width = 432
      Height = 584
      Align = alClient
      BevelOuter = bvNone
      Caption = 'PanelCalSplit1'
      TabOrder = 0
      object VpDayView1: TVpDayView
        Left = 0
        Top = 0
        Width = 432
        Height = 584
        DataStore = CAO_DS
        ControlLink = VpControlLink1
        Color = clWindow
        Align = alClient
        ReadOnly = False
        TabStop = True
        TabOrder = 0
        AllDayEventAttributes.BackgroundColor = clBtnShadow
        AllDayEventAttributes.EventBorderColor = cl3DDkShadow
        AllDayEventAttributes.EventBackgroundColor = clBtnFace
        AllDayEventAttributes.Font.Charset = DEFAULT_CHARSET
        AllDayEventAttributes.Font.Color = clWindowText
        AllDayEventAttributes.Font.Height = -11
        AllDayEventAttributes.Font.Name = 'MS Sans Serif'
        AllDayEventAttributes.Font.Style = []
        ShowEventTimes = False
        DrawingStyle = dsFlat
        TimeSlotColors.Active = 12189695
        TimeSlotColors.Inactive = 14548957
        TimeSlotColors.Holiday = 13421823
        TimeSlotColors.Weekday = 12189695
        TimeSlotColors.Weekend = 16777164
        TimeSlotColors.ActiveRange.RangeBegin = h_07
        TimeSlotColors.ActiveRange.RangeEnd = h_18
        HeadAttributes.Font.Charset = DEFAULT_CHARSET
        HeadAttributes.Font.Color = clWindowText
        HeadAttributes.Font.Height = -13
        HeadAttributes.Font.Name = 'Tahoma'
        HeadAttributes.Font.Style = []
        HeadAttributes.Color = clBtnFace
        RowHeadAttributes.HourFont.Charset = DEFAULT_CHARSET
        RowHeadAttributes.HourFont.Color = clWindowText
        RowHeadAttributes.HourFont.Height = -24
        RowHeadAttributes.HourFont.Name = 'Tahoma'
        RowHeadAttributes.HourFont.Style = []
        RowHeadAttributes.MinuteFont.Charset = DEFAULT_CHARSET
        RowHeadAttributes.MinuteFont.Color = clWindowText
        RowHeadAttributes.MinuteFont.Height = -12
        RowHeadAttributes.MinuteFont.Name = 'Tahoma'
        RowHeadAttributes.MinuteFont.Style = []
        RowHeadAttributes.Color = clBtnFace
        IconAttributes.AlarmBitmap.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          777777777778087777777777777000777777770000000000000777087FBFBFBF
          7807777087FBFBF780777777087FBF7807777777087BFB7807777777087FBF78
          07777777087BFB7807777777087FBF78077777777087F7807777777777087807
          7777777777700077777777777777777777777777777777777777}
        ShowResourceName = False
        LineColor = clGray
        GutterWidth = 10
        DateLabelFormat = 'ddd, d. mmm. yyyy w".KW"'
        Granularity = gr15Min
        DefaultTopHour = h_07
        TimeFormat = tf24Hour
        OnOwnerEditEvent = VpDayView1OwnerEditEvent
      end
    end
    object PanelCalSplit2: TPanel
      Left = 437
      Top = 0
      Width = 346
      Height = 584
      Align = alRight
      BevelOuter = bvNone
      Caption = 'PanelCalSplit2'
      TabOrder = 1
      object Splitter2: TJvxSplitter
        Left = 0
        Top = 242
        Width = 346
        Height = 5
        ControlFirst = VpMonthView1
        ControlSecond = VpTaskList1
        Align = alTop
        BevelInner = bvRaised
        Ctl3D = True
        TopLeftLimit = 200
        BottomRightLimit = 200
      end
      object VpMonthView1: TVpMonthView
        Left = 0
        Top = 0
        Width = 346
        Height = 242
        DataStore = CAO_DS
        ControlLink = VpControlLink1
        Color = clWindow
        Align = alTop
        TabStop = True
        TabOrder = 0
        KBNavigation = True
        DateLabelFormat = 'mmmm yyyy'
        DayHeadAttributes.Color = clBtnFace
        DayHeadAttributes.Font.Charset = DEFAULT_CHARSET
        DayHeadAttributes.Font.Color = clWindowText
        DayHeadAttributes.Font.Height = -13
        DayHeadAttributes.Font.Name = 'Tahoma'
        DayHeadAttributes.Font.Style = []
        DayNameStyle = dsShort
        DayNumberFont.Charset = DEFAULT_CHARSET
        DayNumberFont.Color = clWindowText
        DayNumberFont.Height = -11
        DayNumberFont.Name = 'MS Sans Serif'
        DayNumberFont.Style = []
        DrawingStyle = dsFlat
        EventDayStyle = [fsBold]
        EventFont.Charset = DEFAULT_CHARSET
        EventFont.Color = clWindowText
        EventFont.Height = -11
        EventFont.Name = 'MS Sans Serif'
        EventFont.Style = []
        LineColor = clGray
        TimeFormat = tf24Hour
        OffDayColor = clSilver
        SelectedDayColor = clBlue
        ShowEvents = True
        ShowEventTime = True
        WeekStartsOn = dtMonday
      end
      object VpTaskList1: TVpTaskList
        Left = 0
        Top = 247
        Width = 346
        Height = 337
        DataStore = CAO_DS
        ControlLink = VpControlLink1
        Color = clWindow
        Align = alClient
        TabStop = True
        TabOrder = 1
        ReadOnly = False
        DisplayOptions.CheckBGColor = clWindow
        DisplayOptions.CheckColor = clBlack
        DisplayOptions.CheckStyle = csCheck
        DisplayOptions.DueDateFormat = 'dd.mm.yy'
        DisplayOptions.ShowCompletedTasks = True
        DisplayOptions.ShowAll = False
        DisplayOptions.ShowDueDate = True
        DisplayOptions.OverdueColor = clRed
        DisplayOptions.NormalColor = clBlack
        DisplayOptions.CompletedColor = clGray
        LineColor = clBlack
        MaxVisibleTasks = 250
        TaskHeadAttributes.Color = clSilver
        TaskHeadAttributes.Font.Charset = DEFAULT_CHARSET
        TaskHeadAttributes.Font.Color = clWindowText
        TaskHeadAttributes.Font.Height = -11
        TaskHeadAttributes.Font.Name = 'MS Sans Serif'
        TaskHeadAttributes.Font.Style = []
        DrawingStyle = dsFlat
        ShowResourceName = False
        OnOwnerEditTask = VpTaskList1OwnerEditTask
      end
    end
  end
  object CAO_DS: TVpOFDataStore
    AutoConnect = False
    AutoCreate = False
    CategoryColorMap.Category0.Color = clWhite
    CategoryColorMap.Category0.Description = 'Keine'
    CategoryColorMap.Category1.Color = clRed
    CategoryColorMap.Category1.Description = 'Wichtig'
    CategoryColorMap.Category2.Color = clBlue
    CategoryColorMap.Category2.Description = 'Gesch'#228'ftlich'
    CategoryColorMap.Category3.Color = clLime
    CategoryColorMap.Category3.Description = 'Privat'
    CategoryColorMap.Category4.Color = clFuchsia
    CategoryColorMap.Category4.Description = 'Urlaub'
    CategoryColorMap.Category5.Color = clOlive
    CategoryColorMap.Category5.Description = 'Teilnahme erforderlich'
    CategoryColorMap.Category6.Color = clAqua
    CategoryColorMap.Category6.Description = 'Anreise einplanen'
    CategoryColorMap.Category7.Color = clYellow
    CategoryColorMap.Category7.Description = 'Vorbereitung notwendig'
    CategoryColorMap.Category8.Color = clPurple
    CategoryColorMap.Category8.Description = 'Geburtstag'
    CategoryColorMap.Category9.Color = clTeal
    CategoryColorMap.Category9.Description = 'Telefonanruf'
    EnableEventTimer = True
    PlayEventSounds = True
    DayBuffer = 31
    ResourceID = 0
    EventsTabName = 'PIM_TERMINE'
    ContactsTabName = 'PIM_KONTAKTE'
    TasksTabName = 'PIM_AUFGABEN'
    OnPostResources = CAO_DSPostResources
    OnLoadResources = CAO_DSLoadResources
    Left = 305
    Top = 259
  end
  object VpControlLink1: TVpControlLink
    DataStore = CAO_DS
    Printer.DayStart = h_07
    Printer.DayEnd = h_06
    Printer.Granularity = gr30Min
    Printer.MarginUnits = imAbsolutePixel
    Printer.PrintFormats = <
      item
        Version = 'v1.03'
        DayInc = 0
        DayIncUnits = duDay
        Elements = <
          item
            Version = 'v1.03'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -11
            Caption.Font.Name = 'MS Sans Serif'
            Caption.Font.Style = []
            DayOffset = 0
            DayOffsetUnits = duDay
            ElementName = 'Element 1'
            Height = 100.000000000000000000
            Shape.Shape = ustRectangle
            Width = 100.000000000000000000
          end>
        FormatName = 'DayView Format Test (portrait)'
      end
      item
        Version = 'v1.03'
        DayInc = 0
        DayIncUnits = duDay
        Elements = <
          item
            Version = 'v1.03'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -11
            Caption.Font.Name = 'MS Sans Serif'
            Caption.Font.Style = []
            DayOffset = 0
            DayOffsetUnits = duDay
            ElementName = 'Element 1'
            Height = 100.000000000000000000
            Rotation = ra270
            Shape.Shape = ustRectangle
            Width = 100.000000000000000000
          end>
        FormatName = 'DayView Format Test (landscape)'
      end
      item
        Version = 'v1.03'
        DayInc = 0
        DayIncUnits = duDay
        Elements = <
          item
            Version = 'v1.03'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -11
            Caption.Font.Name = 'MS Sans Serif'
            Caption.Font.Style = []
            DayOffset = 0
            DayOffsetUnits = duDay
            ElementName = 'Element 1'
            Height = 100.000000000000000000
            ItemType = itWeekView
            Shape.Shape = ustRectangle
            Width = 100.000000000000000000
          end>
        FormatName = 'WeekView Format Test (portrait)'
      end
      item
        Version = 'v1.03'
        DayInc = 0
        DayIncUnits = duDay
        Elements = <
          item
            Version = 'v1.03'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -11
            Caption.Font.Name = 'MS Sans Serif'
            Caption.Font.Style = []
            DayOffset = 0
            DayOffsetUnits = duDay
            ElementName = 'Element 1'
            Height = 100.000000000000000000
            ItemType = itWeekView
            Rotation = ra270
            Shape.Shape = ustRectangle
            Width = 100.000000000000000000
          end>
        FormatName = 'WeekView Format Test (landscape)'
      end
      item
        Version = 'v1.03'
        DayInc = 0
        DayIncUnits = duDay
        Elements = <
          item
            Version = 'v1.03'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -11
            Caption.Font.Name = 'MS Sans Serif'
            Caption.Font.Style = []
            DayOffset = 0
            DayOffsetUnits = duDay
            ElementName = 'Element 1'
            Height = 100.000000000000000000
            ItemType = itMonthView
            Shape.Shape = ustRectangle
            Width = 100.000000000000000000
          end>
        FormatName = 'MonthView Format Test (portrait)'
      end
      item
        Version = 'v1.03'
        DayInc = 0
        DayIncUnits = duDay
        Elements = <
          item
            Version = 'v1.03'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -11
            Caption.Font.Name = 'MS Sans Serif'
            Caption.Font.Style = []
            DayOffset = 0
            DayOffsetUnits = duDay
            ElementName = 'Element 1'
            Height = 100.000000000000000000
            ItemType = itShape
            Rotation = ra270
            Shape.Shape = ustRectangle
            Width = 100.000000000000000000
          end>
        FormatName = 'MonthView Format Test (landscape)'
      end
      item
        Version = 'v1.03'
        DayInc = 0
        DayIncUnits = duDay
        Elements = <
          item
            Version = 'v1.03'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -11
            Caption.Font.Name = 'MS Sans Serif'
            Caption.Font.Style = []
            DayOffset = 0
            DayOffsetUnits = duDay
            ElementName = 'Element 1'
            Height = 100.000000000000000000
            ItemType = itCalendar
            Shape.Shape = ustRectangle
            Width = 100.000000000000000000
          end>
        FormatName = 'Calendar Format Test (portrait)'
      end
      item
        Version = 'v1.03'
        DayInc = 0
        DayIncUnits = duDay
        Elements = <
          item
            Version = 'v1.03'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -11
            Caption.Font.Name = 'MS Sans Serif'
            Caption.Font.Style = []
            DayOffset = 0
            DayOffsetUnits = duDay
            ElementName = 'Element 1'
            Height = 100.000000000000000000
            ItemType = itCalendar
            Rotation = ra270
            Shape.Shape = ustRectangle
            Width = 100.000000000000000000
          end>
        FormatName = 'Calendar Format Test (landscape)'
      end
      item
        Version = 'v1.03'
        DayInc = 0
        DayIncUnits = duDay
        Elements = <
          item
            Version = 'v1.03'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -11
            Caption.Font.Name = 'MS Sans Serif'
            Caption.Font.Style = []
            DayOffset = 0
            DayOffsetUnits = duDay
            ElementName = 'Element 1'
            Height = 50.000000000000000000
            ItemType = itShape
            Left = 10.000000000000000000
            Shape.Pen.Width = 10
            Shape.Shape = ustEllipse
            Top = 50.000000000000000000
            Width = 50.000000000000000000
          end>
        FormatName = 'Shape Format Test (portrait)'
      end
      item
        Version = 'v1.03'
        DayInc = 0
        DayIncUnits = duDay
        Elements = <
          item
            Version = 'v1.03'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -11
            Caption.Font.Name = 'MS Sans Serif'
            Caption.Font.Style = []
            DayOffset = 0
            DayOffsetUnits = duDay
            ElementName = 'Element 1'
            Height = 100.000000000000000000
            ItemType = itShape
            Left = 20.000000000000000000
            Rotation = ra270
            Shape.Pen.Width = 4
            Shape.Shape = ustRectangle
            Top = 50.000000000000000000
            Width = 40.000000000000000000
          end>
        FormatName = 'Shape Format Test (landscape)'
      end
      item
        Version = 'v1.03'
        DayInc = 0
        DayIncUnits = duDay
        Elements = <
          item
            Version = 'v1.03'
            Caption.Caption = 'Hello World!'
            Caption.Font.Charset = ANSI_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -21
            Caption.Font.Name = 'Arial'
            Caption.Font.Style = [fsItalic]
            DayOffset = 0
            DayOffsetUnits = duDay
            ElementName = 'Element 1'
            Height = 100.000000000000000000
            ItemType = itCaption
            Left = 50.000000000000000000
            Shape.Shape = ustRectangle
            Top = 50.000000000000000000
            Width = 100.000000000000000000
          end>
        FormatName = 'Caption Format Test (portrait)'
      end
      item
        Version = 'v1.03'
        DayInc = 0
        DayIncUnits = duDay
        Elements = <
          item
            Version = 'v1.03'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -11
            Caption.Font.Name = 'MS Sans Serif'
            Caption.Font.Style = []
            DayOffset = 0
            DayOffsetUnits = duDay
            ElementName = 'Element 1'
            Height = 100.000000000000000000
            ItemType = itCaption
            Rotation = ra270
            Shape.Shape = ustRectangle
            Width = 100.000000000000000000
          end>
        FormatName = 'Caption Format Test (landscape)'
      end
      item
        Version = 'v1.03'
        DayInc = 0
        DayIncUnits = duDay
        Elements = <
          item
            Version = 'v1.03'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -11
            Caption.Font.Name = 'MS Sans Serif'
            Caption.Font.Style = []
            DayOffset = 0
            DayOffsetUnits = duDay
            ElementName = 'Element 1'
            Height = 100.000000000000000000
            ItemType = itTasks
            Shape.Shape = ustRectangle
            Width = 100.000000000000000000
          end>
        FormatName = 'Tasks Format Test (portrait)'
      end
      item
        Version = 'v1.03'
        DayInc = 0
        DayIncUnits = duDay
        Elements = <
          item
            Version = 'v1.03'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -11
            Caption.Font.Name = 'MS Sans Serif'
            Caption.Font.Style = []
            DayOffset = 0
            DayOffsetUnits = duDay
            ElementName = 'Element 1'
            Height = 100.000000000000000000
            ItemType = itTasks
            Rotation = ra270
            Shape.Shape = ustRectangle
            Width = 100.000000000000000000
          end>
        FormatName = 'Tasks Format Test (landscape)'
      end
      item
        Version = 'v1.03'
        DayInc = 0
        DayIncUnits = duDay
        Elements = <
          item
            Version = 'v1.03'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -11
            Caption.Font.Name = 'MS Sans Serif'
            Caption.Font.Style = []
            DayOffset = 0
            DayOffsetUnits = duDay
            ElementName = 'Element 1'
            Height = 100.000000000000000000
            ItemType = itContacts
            Shape.Shape = ustRectangle
            Width = 100.000000000000000000
          end>
        FormatName = 'Contacts Format Test (portrait)'
      end
      item
        Version = 'v1.03'
        DayInc = 0
        DayIncUnits = duDay
        Elements = <
          item
            Version = 'v1.03'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -11
            Caption.Font.Name = 'MS Sans Serif'
            Caption.Font.Style = []
            DayOffset = 0
            DayOffsetUnits = duDay
            ElementName = 'Element 1'
            Height = 100.000000000000000000
            ItemType = itContacts
            Rotation = ra270
            Shape.Shape = ustRectangle
            Width = 100.000000000000000000
          end>
        FormatName = 'Contacts Format Test (landscape)'
      end>
    Left = 160
    Top = 294
  end
  object VpCaoEventEditDialog1: TVpOFEventEditDialog
    Version = 'v1.03'
    DataStore = CAO_DS
    TimeFormat = tf24Hour
    Options = []
    Placement.Position = mpCenter
    Placement.Top = 10
    Placement.Left = 10
    Placement.Height = 413
    Placement.Width = 702
    HelpContext = 0
    Left = 176
    Top = 388
  end
  object VpNotificationDialog1: TVpNotificationDialog
    Version = 'v1.03'
    DataStore = CAO_DS
    BackgroundColor = clBtnFace
    Placement.Position = mpCustom
    Placement.Top = 10
    Placement.Left = 10
    Placement.Height = 250
    Placement.Width = 412
    Left = 305
    Top = 326
  end
  object MainMenu1: TJvMainMenu
    Images = MainForm.ImageList1
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 204
    Top = 228
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
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
      Visible = False
    end
    object Drucken1: TMenuItem
      Caption = 'Drucken'
      GroupIndex = 3
      object MnuPrintAufgaben: TMenuItem
        Caption = 'Aufgabenliste'
        OnClick = MnuPrintAufgabenClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MnuPrintTerminTag: TMenuItem
        Tag = 1
        Caption = 'Termine (Tag)'
        OnClick = MnuPrintTermin
      end
      object MnuPrintTerminWoche: TMenuItem
        Tag = 7
        Caption = 'Termine (Woche)'
        OnClick = MnuPrintTermin
      end
      object MnuPrintTerminMonat: TMenuItem
        Tag = 31
        Caption = 'Termine (Monat)'
        OnClick = MnuPrintTermin
      end
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 4
      object AuflsungTagesansicht1: TMenuItem
        Caption = 'Aufl'#246'sung Tagesansicht'
        ImageIndex = 25
        object N15min1: TMenuItem
          Tag = 3
          Caption = '15 min'
          Checked = True
          GroupIndex = 6
          RadioItem = True
          OnClick = TagViewAufloesungClick
        end
        object N30min1: TMenuItem
          Tag = 5
          Caption = '30 min'
          GroupIndex = 6
          RadioItem = True
          OnClick = TagViewAufloesungClick
        end
        object N60min1: TMenuItem
          Tag = 6
          Caption = '60 min'
          GroupIndex = 6
          RadioItem = True
          OnClick = TagViewAufloesungClick
        end
      end
      object AnzahlTage1: TMenuItem
        Caption = 'Anzahl Tage'
        ImageIndex = 57
        object N1Tag1: TMenuItem
          Tag = 1
          Caption = '1 Tag'
          Checked = True
          GroupIndex = 7
          RadioItem = True
          OnClick = TagViewAnzahlTageClick
        end
        object N2Tage1: TMenuItem
          Tag = 2
          Caption = '2 Tage'
          GroupIndex = 7
          RadioItem = True
          OnClick = TagViewAnzahlTageClick
        end
        object N3Tage1: TMenuItem
          Tag = 3
          Caption = '3 Tage'
          GroupIndex = 7
          RadioItem = True
          OnClick = TagViewAnzahlTageClick
        end
        object N4Tage1: TMenuItem
          Tag = 4
          Caption = '4 Tage'
          GroupIndex = 7
          RadioItem = True
          OnClick = TagViewAnzahlTageClick
        end
        object N5Tage1: TMenuItem
          Tag = 5
          Caption = '5 Tage'
          GroupIndex = 7
          RadioItem = True
          OnClick = TagViewAnzahlTageClick
        end
        object N6Tage1: TMenuItem
          Tag = 6
          Caption = '6 Tage'
          GroupIndex = 7
          RadioItem = True
          OnClick = TagViewAnzahlTageClick
        end
        object N7Tage1: TMenuItem
          Tag = 7
          Caption = '7 Tage'
          GroupIndex = 7
          RadioItem = True
          OnClick = TagViewAnzahlTageClick
        end
      end
      object Wochenendeanzeigen1: TMenuItem
        Caption = 'Wochenende anzeigen'
        GroupIndex = 1
        OnClick = Wochenendeanzeigen1Click
      end
    end
  end
end
